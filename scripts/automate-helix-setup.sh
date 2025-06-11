#!/bin/bash

set -euo pipefail

# Define constants
HELIX_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
HELM_CHARTS_DIR="$HELIX_DIR/helm-charts"
CHARTS_DIR="$HELIX_DIR/charts"

# Ensure required directories exist
mkdir -p "$HELM_CHARTS_DIR" "$CHARTS_DIR"

echo "✨ Starting HELIX Automated Setup Script..."

# --- Image Processing Function (Moved and Improved) ---
# This function will now be part of the main script and directly executed.
process_image() {
    image_name="$1"
    local cluster_name="helix-cluster"
    local server_node="k3d-$cluster_name-server-0"

    # Skip empty image names if any managed to slip through (shouldn't happen with improved yq)
    if [ -z "$image_name" ] || [ "$image_name" == ":" ]; then
        echo "⚠️ Skipping empty or malformed image name."
        return 0
    fi

    echo ""
    echo "--- Processing image: $image_name ---"

    # 1. Check if image exists locally on the host Docker daemon
    if docker image inspect "$image_name" &> /dev/null; then
        echo "✅ Image '$image_name' already exists locally on host. Skipping docker pull."
    else
        echo "⬇️ Image '$image_name' not found locally on host. Pulling..."
        if docker pull "$image_name"; then
            echo "✅ Image '$image_name' pulled successfully to host."
        else
            echo "❌ Error: Failed to pull image '$image_name'. Please check your network or image name."
            return 1 # Indicate failure
        fi
    fi

    # 2. Check if the image exists within the k3d cluster's containerd registry
    # This is the most reliable check: exec into a k3d node and query containerd directly.
    # We check for the exact image name including tag.
    if k3d node list | grep -q "$server_node"; then
        if k3d node exec "$server_node" -- ctr images ls -q | grep -Fq "$image_name"; then
            echo "✅ Image '$image_name' already exists in k3d cluster '$cluster_name'. Skipping import."
        else
            echo "📦 Importing '$image_name' into k3d cluster '$cluster_name'..."
            # Use k3d image import with --cluster (full flag) due to version compatibility
            if k3d image import "$image_name" --cluster "$cluster_name"; then
                echo "✅ Image '$image_name' imported successfully into cluster."
            else
                echo "❌ Error: Failed to import image '$image_name' into k3d cluster. Check k3d logs."
                return 1 # Indicate failure
            fi
        fi
    else
        echo "⚠️ Warning: K3d cluster server node '$server_node' not found. Cannot verify if image exists in cluster. Attempting import anyway."
        # Use k3d image import with --cluster (full flag) due to version compatibility
        if k3d image import "$image_name" --cluster "$cluster_name"; then
            echo "✅ Image '$image_name' imported successfully into cluster (node not verified)."
        else
            echo "❌ Error: Failed to import image '$image_name' into k3d cluster (node not found). Check k3d logs."
            return 1 # Indicate failure
        fi
    fi
    return 0 # Indicate success
}

# --- Direct Docker Images (Example. Add more as needed) ---
echo "--- Processing direct Docker images ---"
DIRECT_DOCKER_IMAGES=(
    "bitnami/vault-k8s:1.6.2-debian-12-r10"
    "bitnami/vault:1.19.5-debian-12-r1"
    "rancher/mirrored-pause:3.6"
    "rancher/local-path-provisioner:v0.0.30"
    "rancher/mirrored-library-busybox:1.36.1"
    "n8nio/n8n:latest"
    "rancher/mirrored-coredns-coredns:1.12.0"
    "rancher/mirrored-metrics-server:v0.7.2"
    "bitnami/minio:2025.5.24-debian-12-r5"
    "bitnami/minio-object-browser:2.0.1-debian-12-r1"
    # Add any other direct Docker images here
)

for img in "${DIRECT_DOCKER_IMAGES[@]}"; do
    process_image "$img"
done

# --- Helm Charts and extracting images ---
echo "--- Processing Helm Charts and extracting images ---"

# Declare an associative array to store extracted images to avoid duplicates
declare -A ALL_HELM_IMAGES

# List of Helm charts to process
HELM_CHARTS=(
    "bitnami/zookeeper"
    "traefik/traefik"
    "bitnami/keycloak"
    "bitnami/postgresql"
    "bitnami/kafka"
    "bitnami/cert-manager"
    "bitnami/vault"
    "bitnami/minio"
    "kiali/kiali-operator"
    "kiali/kiali-server"
)

# Add Helm repositories (ensure this is done once)
echo "Adding Helm repositories..."
helm repo add bitnami https://charts.bitnami.com/bitnami &> /dev/null || true
helm repo add traefik https://helm.traefik.io/traefik &> /dev/null || true
helm repo add kiali https://kiali.org/helm-charts &> /dev/null || true # Corrected typo here
helm repo update

# Loop through each chart to download, extract, and get image tags
for chart_repo_name in "${HELM_CHARTS[@]}"; do
    echo "Processing chart: $chart_repo_name"
    chart_name=$(basename "$chart_repo_name")

    # Get the latest chart version
    latest_chart_version=$(helm search repo "$chart_repo_name" --versions | awk 'NR==2 {print $2}')
    if [ -z "$latest_chart_version" ]; then
        echo "❌ Error: Could not find latest version for chart $chart_repo_name. Skipping."
        continue
    fi
    # Use awk to get the App Version, handling cases where it might be multi-word
    latest_app_version=$(helm search repo "$chart_repo_name" --versions | awk 'NR==2 {$1=$2=$3=""; print $0}' | xargs)
    if [ -z "$latest_app_version" ]; then
        echo "  Warning: Could not determine App Version for $chart_repo_name. Using chart version as fallback."
        latest_app_version="$latest_chart_version"
    fi
    echo "  Found latest chart version: $latest_chart_version (App Version: $latest_app_version)"

    chart_tgz="$HELM_CHARTS_DIR/$chart_name-$latest_chart_version.tgz"
    chart_extract_dir="$CHARTS_DIR/$chart_name"

    # Download the chart TGZ if it doesn't exist or if forced
    if [ -f "$chart_tgz" ]; then
        echo "  Chart TGZ already exists: $chart_tgz"
    else
        echo "  Downloading chart TGZ: $chart_tgz"
        helm pull "$chart_repo_name" --version "$latest_chart_version" -d "$HELM_CHARTS_DIR"
    fi

    # Extract the chart if it hasn't been extracted or if forced
    if [ -d "$chart_extract_dir" ]; then
        echo "  Chart already extracted to: $chart_extract_dir"
    else
        echo "  Extracting chart to: $chart_extract_dir"
        mkdir -p "$chart_extract_dir"
        tar -xzf "$chart_tgz" -C "$CHARTS_DIR" --strip-components 1
    fi

    # Extract image tags from values.yaml using yq
    echo "  Extracting image tags from $chart_extract_dir/values.yaml..."
    # Ensure both repository and tag are present and not null before combining
    images=$(yq 'select(has("image") and .image.repository and .image.tag) | .image.repository + ":" + .image.tag' "$chart_extract_dir/values.yaml" || true)
    
    # Handle Bitnami's global.imageRegistry
    global_registry=$(yq '.global.imageRegistry? | select(. != "null")' "$chart_extract_dir/values.yaml" || true)

    # Handle Kiali specific images (if image.tag is templated, use appVersion)
    if [[ "$chart_name" == "kiali-operator" || "$chart_name" == "kiali-server" ]]; then
        # For Kiali, we must use the correct yq path for image.repository, and handle templated tags
        kiali_images_raw=$(yq '.image.repository? + ":" + .image.tag? | select(. != "null:null")' "$chart_extract_dir/values.yaml" || true)
        for img_raw in $kiali_images_raw; do
            img="$img_raw"
            if [[ "$img" == *\{\{*.image.tag* ]]; then # If tag is templated
                # Replace with appVersion if available
                img_repo=$(echo "$img" | cut -d':' -f1)
                img="${img_repo}:${latest_app_version}"
            fi
            # Add global registry if present
            if [ -n "$global_registry" ] && [[ ! "$img" == "$global_registry"* ]]; then
                 img="$global_registry/$img"
            fi
            ALL_HELM_IMAGES["$img"]=1 # Use associative array for unique images
        done
    else
        # Process regular images
        for img in $images; do
            # Prepend global registry if present and not already part of the image name
            if [ -n "$global_registry" ] && [[ ! "$img" == "$global_registry"* ]]; then
                 img="$global_registry/$img"
            fi
            ALL_HELM_IMAGES["$img"]=1 # Use associative array for unique images
        done
    fi

    # Special handling for cert-manager images that are sometimes in sub-charts or different structures
    if [[ "$chart_name" == "cert-manager" ]]; then
        # Check crdManager image if it exists
        crd_image=$(yq 'select(has("crdManager") and .crdManager.image.repository and .crdManager.image.tag) | .crdManager.image.repository + ":" + .crdManager.image.tag' "$chart_extract_dir/values.yaml" || true)
        if [ -n "$crd_image" ]; then
            if [ -n "$global_registry" ] && [[ ! "$crd_image" == "$global_registry"* ]]; then
                crd_image="$global_registry/$crd_image"
            fi
            ALL_HELM_IMAGES["$crd_image"]=1
        fi
        # Check startupapicheck image if it exists
        startup_image=$(yq 'select(has("startupapicheck") and .startupapicheck.image.repository and .startupapicheck.image.tag) | .startupapicheck.image.repository + ":" + .startupapicheck.image.tag' "$chart_extract_dir/values.yaml" || true)
        if [ -n "$startup_image" ]; then
            if [ -n "$global_registry" ] && [[ ! "$startup_image" == "$global_registry"* ]]; then
                startup_image="$global_registry/$startup_image"
            fi
            ALL_HELM_IMAGES["$startup_image"]=1
        fi
    fi
done

echo "--- Pulling and importing all extracted Helm chart images ---"
for img in "${!ALL_HELM_IMAGES[@]}"; do
    process_image "$img"
done

echo "✨ All HELIX setup steps completed!"
echo "You can now run: k3d kubectl get nodes -o wide"
echo "Next, you can start deploying Helm charts using 'helm install'."