#!/bin/bash

# --- Script Configuration & Setup ⚙️ ---
# Exit immediately if a command exits with a non-zero status.
# Treat unset variables as an error when substituting.
# The exit status of a pipeline is the status of the last command to exit with a non-zero status, or zero if all commands exit successfully.
set -euo pipefail
# --- Global Counters for Progress Display 📊 ---
PROCESSED_IMAGE_COUNT=0
TOTAL_IMAGES_TO_PROCESS=0
# This script automates the setup of a k3d cluster with essential Docker images and Helm charts.
# It pulls specified Docker images, imports them into the k3d cluster, and processes Helm charts to extract and import their embedded images.
# It also includes a fun Chuck Norris joke after each image processing step to keep things light-hearted! 😂
# Define constants
HELIX_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
HELM_CHARTS_DIR="$HELIX_DIR/helm-charts"
CHARTS_DIR="$HELIX_DIR/charts"

# --- Utility Functions 🚀 ---

# Function to check for required commands
check_command() {
    local cmd_name="$1"
    local install_guide="$2"
    if ! command -v "$cmd_name" &> /dev/null; then
        echo "❌ Error: '$cmd_name' is not installed. Please install it to proceed."
        echo "💡 Installation guide: $install_guide"
        exit 1
    fi
    echo "✅ '$cmd_name' found."
}
# Source the Chuck Norris Joke module
source "$HELIX_DIR/scripts/chuck_norris_jokes.sh"
# --- Core Image Processing Function 🖼️ ---
# This function handles pulling and importing a single Docker image into the k3d cluster.
process_image() {
    local image_name="$1"
    local cluster_name="helix-cluster"
    local server_node="k3d-$cluster_name-server-0"

    # Skip empty or malformed image names that might slip through (improved yq should minimize this)
    if [ -z "$image_name" ] || [ "$image_name" == ":" ] || [[ "$image_name" == "null"* ]]; then
        echo "⚠️ Skipping empty, malformed, or 'null' image reference: '$image_name'."
        return 0 # Treat as handled, not an error
    fi

    echo "" # Add a newline for better readability between image processes
    echo "--- Processing image: ${image_name} --- 📦"

    # 1. Check if image exists locally on the host Docker daemon
    if docker image inspect "${image_name}" &> /dev/null; then
        echo "✅ Image '${image_name}' already exists locally on host. Skipping docker pull. 💾"
    else
        echo "⬇️ Image '${image_name}' not found locally on host. Pulling... 📥"
        if docker pull "${image_name}"; then
            echo "✅ Image '${image_name}' pulled successfully to host. ✨"
        else
            echo "❌ Error: Failed to pull image '${image_name}'. Please check your network connection or the image name. Skipping import. 🛑"
            return 1 # Indicate failure to pull
        fi
    fi

    # 2. Check if the image exists within the k3d cluster's containerd registry on the server node
    # This is the most reliable check for cluster-side presence.
    if k3d node list | grep -q "$server_node"; then
        if k3d node exec "$server_node" -- ctr images ls -q | grep -Fq "${image_name}"; then
            echo "✅ Image '${image_name}' already exists in k3d cluster '${cluster_name}'. Skipping import. ☁️"
        else
            echo "📦 Importing '${image_name}' into k3d cluster '${cluster_name}'... 🚀"
            # Use k3d image import with --cluster for explicit targeting and broader compatibility
            if k3d image import "${image_name}" --cluster "${cluster_name}"; then
                echo "✅ Image '${image_name}' imported successfully into cluster. 🎉"
            else
                # We've seen 'tr: open' errors here before. Report, but try to continue where possible.
                echo "❌ Error: Failed to import image '${image_name}' into k3d cluster. This might be a transient k3d issue. Check k3d logs for details. 🚧"
                # Do not return 1 here unless we want to halt the script for *any* import failure.
                # Given the 'tr: open' history, letting it continue might be necessary.
            fi
        fi
    else
        echo "⚠️ Warning: K3d cluster server node '${server_node}' not found. Cannot reliably verify if image exists in cluster. Attempting import anyway. 🤔"
        if k3d image import "${image_name}" --cluster "${cluster_name}"; then
            echo "✅ Image '${image_name}' imported successfully into cluster (node not verified). 🎉"
        else
            echo "❌ Error: Failed to import image '${image_name}' into k3d cluster (node not found or import failed). Check k3d logs. 🛑"
            # Same as above, decide if this should halt the script.
        fi
    fi
    # After image processing completes, add a fun fact!
    # Original:
    # echo "✨ Image processing for '${image_name}' completed. You can now use this image in your k3d cluster. 🚀"

    # New:
    PROCESSED_IMAGE_COUNT=$((PROCESSED_IMAGE_COUNT + 1)) # Increment counter first
    echo "✨ Image processing for '${image_name}' completed. (${PROCESSED_IMAGE_COUNT}/${TOTAL_IMAGES_TO_PROCESS}) You can now use this image in your k3d cluster. 🚀"
    get_chuck_norris_joke
    # Return 0 to indicate the process was attempted, even if there were soft errors
    # This allows the script to continue processing other images even if one fails.
    echo "🔄 Returning to main script execution. Continuing with next image...  🏁"
    return 0 # Always return 0 after attempting process, even if import had soft errors
}

# --- Main Script Execution 🏁 ---

# 1. Ensure required directories exist
echo "Creating necessary directories... 📁"
mkdir -p "$HELM_CHARTS_DIR" "$CHARTS_DIR"
echo "✅ Directories created/verified."

# 2. Check for essential command-line tools
echo "Checking for required tools... 🔍"
check_command "docker" "https://docs.docker.com/get-docker/"
check_command "k3d" "https://k3d.io/#installation"
check_command "helm" "https://helm.sh/docs/intro/install/"
# Ensure yq is the go-lang version
# New (more robust yq check):
if ! command -v yq &> /dev/null || ! yq --version 2>&1 | grep -q "github.com/mikefarah/yq"; then
    echo "❌ Error: 'yq' (go-lang version from Mike Farah) is not installed or not the correct version. Please install it from https://github.com/mikefarah/yq#install"
    echo "   (Ensure you download the 'yq_linux_amd64' or similar binary, not python-yq)"
    exit 1
fi
echo "✅ All required tools found."

# --- Process Direct Docker Images 🐳 ---
echo ""
echo "--- Pulling and importing directly specified Docker images --- 🚀"
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
    # Add any other direct Docker images here if needed for specific use cases 💡
)
TOTAL_IMAGES_TO_PROCESS=${#DIRECT_DOCKER_IMAGES[@]}

for img in "${DIRECT_DOCKER_IMAGES[@]}"; do
    process_image "$img" || true # `|| true` ensures the script doesn't exit on a single image pull/import failure
    PROCESSED_IMAGE_COUNT=$((PROCESSED_IMAGE_COUNT + 1))
    echo "Processed $PROCESSED_IMAGE_COUNT of $TOTAL_IMAGES_TO_PROCESS images so far. 🏁"
done
# Display a summary of processed images
echo ""
echo "Summary: Processed $PROCESSED_IMAGE_COUNT out of $TOTAL_IMAGES_TO_PROCESS direct Docker images. 🎯"
for img in "${DIRECT_DOCKER_IMAGES[@]}"; do
    process_image "$img" || true # `|| true` ensures the script doesn't exit on a single image pull/import failure
done

# --- Process Helm Charts and Extract Images 🐙 ---
echo ""
echo "--- Processing Helm Charts and extracting their embedded images --- 🎨"

# Declare an associative array to store extracted images to avoid duplicates and ensure uniqueness
declare -A ALL_HELM_IMAGES

# List of Helm chart repositories and names to process
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

# Add Helm repositories (only if not already added, suppress verbose output)
echo "Adding Helm repositories... ➕"
helm repo add bitnami https://charts.bitnami.com/bitnami &> /dev/null || true
helm repo add traefik https://helm.traefik.io/traefik &> /dev/null || true
helm repo add kiali https://kiali.org/helm-charts &> /dev/null || true
echo "Updating Helm repositories to get the latest charts... 🔄"
helm repo update

# Loop through each chart to download, extract, and get image tags
for chart_repo_name in "${HELM_CHARTS[@]}"; do
    echo "" # Newline for readability
    echo "--- Chart Processing: ${chart_repo_name} ---"
    local chart_name=$(basename "$chart_repo_name")

    # Get the latest chart version and app version reliably
    local latest_chart_version=""
    local latest_app_version=""
    
    # Using 'helm search repo' first to get the latest chart version
    local search_output=$(helm search repo "$chart_repo_name" --versions | awk 'NR==2 {print $2}')
    if [ -n "$search_output" ]; then
        latest_chart_version="$search_output"
    fi

    if [ -z "$latest_chart_version" ]; then
        echo "❌ Error: Could not find any version for chart '$chart_repo_name'. Skipping this chart. 😔"
        continue
    fi

    # Then use 'helm show chart' to get detailed metadata including appVersion
    local chart_metadata_json=$(helm show chart "$chart_repo_name" --version "$latest_chart_version" -o json || true)
    if [ -n "$chart_metadata_json" ]; then
        latest_app_version=$(echo "$chart_metadata_json" | yq '.appVersion // ""' -o=json | tr -d '"')
    fi

    # Fallback for appVersion if not found
    if [ -z "$latest_app_version" ]; then
        echo "  ⚠️ Warning: Could not determine App Version for '$chart_repo_name' using 'helm show chart'. Falling back to chart version for image templating. 🤔"
        latest_app_version="$latest_chart_version"
    fi

    echo "  Found latest chart version: ${latest_chart_version} (App Version: ${latest_app_version}) 🎉"

    local chart_tgz="$HELM_CHARTS_DIR/$chart_name-$latest_chart_version.tgz"
    local chart_extract_dir="$CHARTS_DIR/$chart_name"

    # Download the chart TGZ if it doesn't exist
    if [ -f "$chart_tgz" ]; then
        echo "  Chart TGZ already exists: ${chart_tgz}. Skipping download. 💾"
    else
        echo "  Downloading chart TGZ: ${chart_tgz}... ⬇️"
        if helm pull "$chart_repo_name" --version "$latest_chart_version" -d "$HELM_CHARTS_DIR"; then
            echo "  ✅ Chart downloaded successfully."
        else
            echo "  ❌ Error: Failed to download chart '$chart_repo_name'. Skipping extraction and image processing. 🛑"
            continue
        fi
    fi

    # Extract the chart if it hasn't been extracted
    if [ -d "$chart_extract_dir" ]; then
        echo "  Chart already extracted to: ${chart_extract_dir}. Skipping extraction. 📂"
    else
        echo "  Extracting chart to: ${chart_extract_dir}... 🧩"
        mkdir -p "$chart_extract_dir"
        if tar -xzf "$chart_tgz" -C "$CHARTS_DIR" --strip-components 1; then
            echo "  ✅ Chart extracted successfully."
        else
            echo "  ❌ Error: Failed to extract chart '$chart_tgz'. Skipping image processing. 🛑"
            continue
        fi
    fi

    # Extract image tags from values.yaml using yq - more robustly! 🕵️
    echo "  Extracting image tags from ${chart_extract_dir}/values.yaml... 🧐"
    local extracted_images_raw=""

    # Common pattern: image: { repository: "repo/image", tag: "tag" }
    structured_images=$(yq 'select(has("image") and .image.repository and .image.tag) | .image.repository + ":" + .image.tag' "$chart_extract_dir/values.yaml" || true)
    
    # Common pattern: image: "full/image:tag"
    direct_string_images=$(yq '.image? | select(type == "!!str")' "$chart_extract_dir/values.yaml" || true)

    # Specific common images (e.g., init containers, tools) often listed directly
    other_images=$(yq 'paths(. | select(has("image") and .image.tag) | .image.tag ) | .[last-1] + ":" + .[last] | select(. != "image:tag")' "$chart_extract_dir/values.yaml" || true)
    other_images_repo=$(yq 'paths(. | select(has("repository")) | .repository ) | .[last] + ":" + .[last] | select(. != "repository:")' "$chart_extract_dir/values.yaml" || true)
    
    # Combine all found image strings, filter out empty/null/malformed entries
    extracted_images_raw=$(echo -e "$structured_images\n$direct_string_images\n$other_images\n$other_images_repo" | grep -v '^\s*$' | grep -v 'null' | grep -v ':$' | sort -u) # Filter, sort unique

    local global_registry=$(yq '.global.imageRegistry? | select(. != "null")' "$chart_extract_dir/values.yaml" || true)

    # Process these extracted images
    for img_raw in $extracted_images_raw; do
        local img="$img_raw"
        
        # Handle templated tags, especially for Kiali which uses `appVersion`
        if [[ "$chart_name" == "kiali-operator" || "$chart_name" == "kiali-server" ]]; then
            if [[ "$img" == *\{\{*.image.tag* ]]; then # If tag is templated
                local img_repo=$(echo "$img" | cut -d':' -f1)
                img="${img_repo}:${latest_app_version}" # Replace with the determined appVersion
            fi
        fi

        # Prepend global registry if present and not already part of the image name
        if [ -n "$global_registry" ] && [[ ! "$img" == "$global_registry"* ]]; then
            img="${global_registry}/${img}"
        fi

        # Ensure the image string is a valid format before adding to the collection
        # This regex is a simplified check but catches most valid image:tag formats
        if [[ "$img" =~ ^[a-zA-Z0-9._-]+([/][a-zA-Z0-9._-]+)*:[a-zA-Z0-9._-]+$ ]]; then
            ALL_HELM_IMAGES["$img"]=1 # Use associative array for unique images
        else
            echo "    🧐 Found a non-standard or malformed image reference: '${img}'. Skipping. ⚠️"
        fi
    done

    # Special handling for cert-manager images that are sometimes in sub-charts or different structures
    if [[ "$chart_name" == "cert-manager" ]]; then
        echo "  Special handling for cert-manager images... 🔑"
        # Check crdManager image
        local crd_image=$(yq 'select(has("crdManager") and .crdManager.image.repository and .crdManager.image.tag) | .crdManager.image.repository + ":" + .crdManager.image.tag' "$chart_extract_dir/values.yaml" || true)
        if [ -n "$crd_image" ]; then
            if [ -n "$global_registry" ] && [[ ! "$crd_image" == "$global_registry"* ]]; then
                crd_image="${global_registry}/${crd_image}"
            fi
            if [[ "$crd_image" =~ ^[a-zA-Z0-9._-]+([/][a-zA-Z0-9._-]+)*:[a-zA-Z0-9._-]+$ ]]; then
                ALL_HELM_IMAGES["$crd_image"]=1
            else
                echo "    🧐 Found a non-standard cert-manager crdManager image reference: '${crd_image}'. Skipping. ⚠️"
            fi
        fi
        # Check startupapicheck image
        local startup_image=$(yq 'select(has("startupapicheck") and .startupapicheck.image.repository and .startupapicheck.image.tag) | .startupapicheck.image.repository + ":" + .startupapicheck.image.tag' "$chart_extract_dir/values.yaml" || true)
        if [ -n "$startup_image" ]; then
            if [ -n "$global_registry" ] && [[ ! "$startup_image" == "$global_registry"* ]]; then
                startup_image="${global_registry}/${startup_image}"
            fi
            if [[ "$startup_image" =~ ^[a-zA-Z0-9._-]+([/][a-zA-Z0-9._-]+)*:[a-zA-Z0-9._-]+$ ]]; then
                ALL_HELM_IMAGES["$startup_image"]=1
            else
                echo "    🧐 Found a non-standard cert-manager startupapicheck image reference: '${startup_image}'. Skipping. ⚠️"
            fi
        fi
    fi
done # End of Helm chart processing loop

# Finalize total images count (direct + helm extracted)
TOTAL_IMAGES_TO_PROCESS=$((TOTAL_IMAGES_TO_PROCESS + ${#ALL_HELM_IMAGES[@]}))

echo ""
echo "--- Pulling and importing all extracted Helm chart images from values.yaml --- 🚀"
# Loop through the unique images collected and process each one

echo ""
echo "--- Pulling and importing all extracted Helm chart images from values.yaml --- 🚀"
# Loop through the unique images collected and process each one
for img in "${!ALL_HELM_IMAGES[@]}"; do
    process_image "$img" || true # Allow script to continue even if one image fails to process
done

echo ""
echo "✨ All HELIX setup steps completed! Your cluster should now have all necessary images. 🎉"
echo "You can verify node status and available images with: 🚀"
echo "👉 k3d node list"
echo "👉 kubectl get nodes -o wide"
echo "👉 k3d node exec k3d-helix-cluster-server-0 -- ctr images ls"
echo ""
echo "Now, you can proceed with deploying your Helm charts using 'helm upgrade --install'. Good luck! 🎯"