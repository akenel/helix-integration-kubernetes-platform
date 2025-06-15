#!/bin/bash 
# automate-helix-setup_v2-0-3.sh
# Enable strict mode: exit on errors, treat unbound variables as errors, pipefail
set -euo pipefail
# --- Global Counters for Progress Display 📊 ---
PROCESSED_IMAGE_COUNT=0
TOTAL_IMAGES_TO_PROCESS=0
# --- Local Docker Registry Configuration 🐳 ---
LOCAL_REGISTRY_HOST="localhost:5000"
# --- Global Settings for Image Pulls ⚙️ ---
# 👇 ADDED THESE GLOBAL SETTINGS 👇
MAX_RETRIES=3
RETRY_DELAY=5 # seconds
# 👆 ADDED THESE GLOBAL SETTINGS 👆
# Define constants
HELIX_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
HELM_CHARTS_DIR="${HELIX_DIR}/helm-charts" # Directory to store unpacked Helm charts
# --- Utility Functions 🚀 ---
# --- Source Helper Modules ---
# Include the deployment commands generator module
# CRITICAL FIX: Define DEPLOYMENT_COMMANDS_FILE BEFORE sourcing the module
DEPLOYMENT_COMMANDS_FILE="${HELIX_DIR}/helm-deployment-commands.sh" 
source "${HELIX_DIR}/scripts/helix-deploy-generator.sh" # Adjust path if different
# ... (other source commands for utility functions if you have them)
# Function to check if a command exists
check_command() {
    local cmd="$1"
    if ! command -v "$cmd" &> /dev/null; then
        echo "❌ Error: '$cmd' is not installed. Please install it to continue."
        return 1
    fi
    echo "✅ '$cmd' found."
    return 0
}
# Function to start or ensure the local Docker registry is running
start_local_registry() {
    echo "🐳 Starting local Docker registry at ${LOCAL_REGISTRY_HOST}..."
    if docker ps -a --format '{{.Names}}' | grep -q "^registry$"; then
        if docker inspect -f '{{.State.Running}}' registry | grep -q "true"; then
            echo "✅ Docker registry 'registry' is already running."
        else
            echo "♻️ Docker registry 'registry' found but not running. Starting it..."
            if docker start registry; then
                echo "✅ Docker registry 'registry' started."
            else
                echo "❌ Error: Failed to start Docker registry 'registry'. 🛑"
                exit 1
            fi
        fi
    else
        echo "🆕 Docker registry 'registry' not found. Creating and starting it..."
        # Ensure the image is pulled before attempting to run
        if ! docker images -q "registry:2" &> /dev/null; then
            echo "🌐 Pulling 'registry:2' Docker image... This might take a moment. ⬇️"
            if ! docker pull registry:2; then
                echo "❌ Error: Failed to pull 'registry:2' image. Please ensure Docker daemon is running and has internet access. 🛑"
                exit 1
            fi
            echo "✅ 'registry:2' image pulled successfully."
        fi

        if docker run -d -p 5000:5000 --restart=always --name registry registry:2; then
            echo "✅ Docker registry 'registry' created and started."
        else
            echo "❌ Error: Failed to create and start Docker registry 'registry'. 🛑"
            exit 1
        fi
    fi
    echo "" # Add a blank line for readability
}

# Function to check and create directories
check_directory() {
    local dir_path="$1"
    if [ ! -d "$dir_path" ]; then
        echo "📁 Creating directory: $dir_path"
        mkdir -p "$dir_path" || { echo "❌ Error: Failed to create directory '$dir_path'."; exit 1; }
    else
        echo "✅ Directory exists: $dir_path"
    fi
}

# --- Chuck Norris Joke Module 🤣 ---
# This script provides a function to fetch and display a random Chuck Norris joke.

# Ensures 'curl' and 'jq' are available for fetching and parsing jokes.
check_joke_dependencies() {
    if ! command -v curl &> /dev/null; then
        #echo "⚠️ Warning: 'curl' is not installed. Cannot fetch Chuck Norris jokes."
        return 1
    fi
    if ! command -v jq &> /dev/null; then
        #echo "⚠️ Warning: 'jq' is not installed. Cannot parse Chuck Norris jokes."
        #echo "💡 To install 'jq': sudo apt install jq"
        return 1
    fi
    return 0
}

# Fetches and prints a random Chuck Norris joke.
get_chuck_norris_fact() {
    check_internet() {
    curl --silent --head --max-time 3 https://www.google.com > /dev/null
    return $?
}
    if ! check_internet; then
        echo "⚠️ Warning: No internet connection. Cannot fetch Chuck Norris jokes."
        return 1
    fi
    if check_joke_dependencies; then
        echo "😂 Here's a Chuck Norris fact for you: "
        joke_json=$(curl --max-time 5 -s https://api.chucknorris.io/jokes/random)
        if [ $? -eq 0 ]; then
            joke_value=$(echo "$joke_json" | jq -r '.value' 2>/dev/null)
            if [ -n "$joke_value" ] && [ "$joke_value" != "null" ]; then
                echo "    \"${joke_value}\" "
            else
                echo "    (Couldn't retrieve a good joke right now. Even Chuck has off days.)"
            fi
        else
            echo "    (Failed to connect to the joke API. Chuck might be busy fighting crime.)"
        fi
        echo ""
    fi
}


# --- Core Image Processing Function (now pushes to local registry) 🖼️ ---
# Helper function to process and push a single Docker image to the local registry
# Helper function to process and push a single Docker image to the local registry
process_and_push_image_to_local_registry() {
    local original_image_name="$1"
    local local_registry_image_name="$2"
    local max_retries="$3"
    local retry_delay="$4"

    echo "--- Processing image: ${original_image_name} --- 📦"

    # DEBUGGING: Let's peek at Docker's local image status
    docker images -q "${original_image_name}" > /dev/null 2>&1
    local docker_images_check_succeeded=$? # 0 means found, 1 means not found

    local image_needs_pull=true # Assume we need to pull unless proven otherwise

    if [ "${docker_images_check_succeeded}" -eq 0 ]; then
        echo "DEBUG: 🤔 Docker thinks '${original_image_name}' is here (exit code 0). Tentatively skipping pull. 💾"
        # We set image_needs_pull to false, but if tagging fails, we'll force a pull later.
        image_needs_pull=false
    else
        echo "DEBUG: 🕵️‍♀️ Docker says '${original_image_name}' is NOT here (exit code 1). Time to pull! 🌐"
        image_needs_pull=true
    fi

    # 1. Pull the image if it's not present locally, or if we need to re-attempt later
    if [ "$image_needs_pull" = true ]; then
        echo "Attempting to pull image '${original_image_name}' from remote registry... 🌐"
        local pull_success=false
        for (( i=1; i<=$max_retries; i++ )); do
            echo "Pulling attempt $i/$max_retries for '${original_image_name}'... Keep trying! 💪"
            if docker pull "${original_image_name}"; then
                pull_success=true
                echo "🥳 Successfully pulled '${original_image_name}'!"
                break
            else
                echo "Pull failed for '${original_image_name}'. Retrying in $retry_delay seconds... Don't give up! 🔄"
                sleep $retry_delay
            fi
        done

        if [ "$pull_success" = false ]; then
            echo "❌ Oh no! Failed to pull image '${original_image_name}' after $max_retries attempts. We'll skip this one for now. 😥"
            return 1 # Indicate failure
        fi
    fi

    # Explicitly check if the image is now present after the pull command (or if it existed initially)
    # This check is still useful if the initial docker images -q was wrong.
    if ! docker images -q "${original_image_name}" &> /dev/null; then
        echo "❌ Oops! Image '${original_image_name}' isn't truly present locally even after our efforts. This might be a tricky network hiccup or corrupted Docker state. Moving on to the next. 😔"
        return 1 # Indicate failure
    fi

    # 2. Tag the image for the local registry
    local tag_success=false
    for (( i=1; i<=$max_retries; i++ )); do # Add retries for tagging as well
        echo "🏷️ Tagging '${original_image_name}' as '${local_registry_image_name}' (attempt $i/$max_retries)... Almost there! ✨"
        if docker tag "${original_image_name}" "${local_registry_image_name}"; then
            tag_success=true
            echo "✅ Image tagged successfully! 🎉"
            break
        else
            echo "❌ Tagging failed for '${original_image_name}'. Daemon reported 'No such image'. This can happen if Docker's local cache is stale. Retrying pull then tagging in $retry_delay seconds... 🔄"
            # If tagging fails, force a pull regardless of previous checks
            echo "Forcing a re-pull for '${original_image_name}' before retrying tag... 🌐"
            if ! docker pull "${original_image_name}"; then
                 echo "❌ Failed to re-pull '${original_image_name}' after tagging error. Cannot proceed with this image. 🛑"
                 break # Break tag retry loop as pull failed
            fi
            sleep $retry_delay # Wait before retrying tag
        fi
    done

    if [ "$tag_success" = false ]; then
        echo "❌ Aw, snap! Failed to tag image '${original_image_name}' after $max_retries attempts, even with re-pulls. Skipping this image. 💔"
        return 1
    fi

    # 3. Push the tagged image to the local registry
    echo "⬆️ Pushing '${local_registry_image_name}' to local registry... The final stretch! 🚀"
    if ! docker push "${local_registry_image_name}"; then
        echo "❌ Sigh. Failed to push image '${local_registry_image_name}' to local registry. Network might be grumpy or registry busy. We'll move past this one. 🤷‍♀️"
        return 1
    fi

    echo "✅ Image '${local_registry_image_name}' pushed to local registry. Success! 🎉"
    PROCESSED_IMAGE_COUNT=$(( PROCESSED_IMAGE_COUNT + 1 ))
    echo "✨ Image processing for '${original_image_name}' completed. (${PROCESSED_IMAGE_COUNT}/${TOTAL_IMAGES_TO_PROCESS}) You can now use this image in your k3d cluster. Go forth and conquer! 🌟"
    # Call the module function to generate deployment command for this image
    generate_helm_command_for_image "${original_image_name}"
    get_chuck_norris_fact # Chuck Norris fact
    return 0 # Indicate success
}

# Function to check k3d cluster for existing image
check_k3d_image_exists() {
    local image_name="$1"
    local cluster_name="$2"

    # Get the server node name (assuming one server node)
    local server_node=$(k3d node list --cluster "${cluster_name}" -o json | jq -r '.[].name' | grep 'server' | head -n 1)

    if [ -z "$server_node" ]; then
        echo "⚠️ Warning: K3d cluster server node '${server_node}' not found. Cannot reliably verify if image exists in cluster. 🤔"
        return 1 # Cannot verify
    fi

    # Check if the image exists in the server node's container runtime
    if docker exec "${server_node}" ctr images list | grep -q "${image_name}"; then
        return 0 # Image found
    else
        return 1 # Image not found
    fi
}


# Function to extract images from a Helm chart's values.yaml
# Stores unique images in ALL_HELM_IMAGES associative array
extract_helm_images() {
    local full_chart_id="$1" # e.g. "bitnami/zookeeper" or "bitnami/zookeeper:1.2.3"
    local chart_repo_name="" # e.g. "bitnami"
    local chart_name_in_repo="" # e.g. "zookeeper"
    local specific_version="" # e.g. "1.2.3"

    # Separate chart name from an optional version tag
    local full_chart_id_no_version="$full_chart_id"
    if [[ "$full_chart_id" == *":"* ]]; then
        specific_version=$(echo "$full_chart_id" | cut -d':' -f2)
        full_chart_id_no_version=$(echo "$full_chart_id" | cut -d':' -f1)
    fi

    # Determine if it's a repo/chart or a local path
    if [[ "$full_chart_id_no_version" == *"/"* ]]; then
        chart_repo_name=$(echo "$full_chart_id_no_version" | cut -d'/' -f1)
        chart_name_in_repo=$(echo "$full_chart_id_no_version" | cut -d'/' -f2)
    else
        # Assume it's a local path or pre-fetched chart name, no repo prefix
        chart_name_in_repo="$full_chart_id_no_version"
        chart_repo_name="" # Ensure this is empty for local paths
    fi

    echo "🎨 Extracting images from Helm chart: ${full_chart_id} (repo: ${chart_repo_name:-"N/A"}, chart: ${chart_name_in_repo}, version: ${specific_version:-"latest"})"

    local show_values_cmd="helm show values"
    if [ -n "$chart_repo_name" ]; then
        # For remote charts with added repo, use the "repo_name/chart_name_in_repo" form
        show_values_cmd+=" ${chart_repo_name}/${chart_name_in_repo}"
        if [ -n "$specific_version" ]; then
            show_values_cmd+=" --version ${specific_version}"
        fi
    else
        # For local charts, use the direct path in HELM_CHARTS_DIR
        show_values_cmd+=" ${HELM_CHARTS_DIR}/${chart_name_in_repo}"
    fi

    local chart_values
    if ! chart_values=$(eval "$show_values_cmd"); then
        echo "❌ Error: Failed to get values for chart '${full_chart_id}'. This could be due to network issues, chart not found, or invalid version. 🛑"
        return 1
    fi

    # Use yq to find image.repository and image.tag patterns
    # This pattern looks for objects that have both 'repository' and 'tag' keys at any depth.
    # It constructs the full image name "repository:tag"
    local images_from_chart
    images_from_chart=$(echo "$chart_values" | yq '.. | select(has("repository") and has("tag")) | .repository + ":" + .tag' 2>/dev/null || true)

    if [ -z "$images_from_chart" ]; then
        echo "⚠️ No images with 'repository' and 'tag' found in chart '${full_chart_id}' values."
        return 0
    fi

    # Add extracted images to the ALL_HELM_IMAGES associative array
    echo "📦 Found images for ${full_chart_id}:"
    while IFS= read -r img; do
        # Filter out empty strings or those ending in just a colon (invalid references)
        # Regex explanation:
        # ^[^:]+: ensures the string starts with one or more non-colon characters followed by a colon (e.g., "repo:").
        # .+: ensures there is at least one character after the colon (the tag).
        # This will filter out "repo:" but allow "repo:tag" or "repo" (which defaults to "repo:latest" in process_and_push_image_to_local_registry).
        if [[ -n "$img" && "$img" =~ ^[^:]+:.+$ ]]; then
            ALL_HELM_IMAGES["$img"]=1 # Add to associative array (value 1 to indicate presence)
            echo "   - $img"
        # Additionally, handle cases where the image name has no tag (e.g., "busybox") - yq will output "busybox"
        elif [[ -n "$img" && "$img" != *":"* ]]; then
            ALL_HELM_IMAGES["$img"]=1
            echo "   - $img (no tag specified, will use 'latest')"
        else
            echo "   - Skipping invalid image reference: '$img'" >&2 # Log skipped invalid images
        fi
    done <<< "$images_from_chart"
    return 0
}

# --- Main Script Execution ---

echo "Creating necessary directories... 📁"
check_directory "${HELIX_DIR}/configs"
check_directory "${HELM_CHARTS_DIR}"
echo "✅ Directories created/verified."

echo "Checking for required tools... 🔍"
check_required_tools() {
    local all_found=true
    check_command "docker" || all_found=false
    check_command "k3d" || all_found=false
    check_command "helm" || all_found=false
    # yq check: ensuring go-lang version
    if ! command -v yq &> /dev/null || ! yq --version 2>&1 | grep -q "github.com/mikefarah/yq"; then
        echo "❌ Error: 'yq' (go-lang version from Mike Farah) is not installed or not the correct version. Please install it from https://github.com/mikefarah/yq#install"
        echo "   (Ensure you download the 'yq_linux_amd64' or similar binary, not python-yq)"
        all_found=false
    else
        echo "✅ 'yq' found."
    fi

    if [ "$all_found" = false ]; then
        exit 1
    fi
}
check_required_tools
echo "✅ All required tools found."

# Start the local Docker registry
# to delete the old registry, you can run: docker rm -f registry
# k3d registry delete k3d-registry.localhost 2>/dev/null || true
# Ensure the local registry is running before proceeding
echo "Starting local Docker registry... 🐳"
# start_local_registry # (started via scripts\automate-helix-cluster_v1-0-0.sh)

echo "--- Pulling and importing directly specified Docker images --- 🚀"

# Define Docker images to directly pull and push to local registry
DIRECT_DOCKER_IMAGES=(
    "bitnami/redis:8.0.2-debian-12-r0" # Example version - check chart's default
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
    "quay.io/prometheus/prometheus:v2.52.0" # Example version - check chart's default
    "quay.io/prometheus/alertmanager:v0.27.0" # Example version
    "quay.io/thanos/thanos:v0.32.2" # Example version
    "quay.io/prometheus-operator/prometheus-operator:v0.74.0" # Example version
    "quay.io/prometheus-operator/prometheus-config-reloader:v0.74.0" # Example version
    "quay.io/prometheus/node-exporter:v1.7.0" # Example version
    "registry.k8s.io/kube-state-metrics/kube-state-metrics:v2.11.0" # Example version
    "bitnami/jmx-exporter:1.3.0-debian-12-r3"
    "kiwigrid/k8s-sidecar:1.30.3"
    "thanos/thanos:v0.38.0"
    "prometheus/prometheus:v3.4.1"
    "grafana/loki:3.5.0"
    "kong:3.9"
    "ecr-public.aws.com/docker/library/redis:7.2.8-alpine"
    "quay.io/argoprojlabs/argocd-extension-installer:v0.0.8"
    "ghcr.io/oliver006/redis_exporter:v1.74.0"
    "ingress-nginx/kube-webhook-certgen:v1.5.3"
    "bitnami/kubectl:1.33.1-debian-12-r5"
    "prom/memcached-exporter:v0.15.2"
    "bitnami/kafka:4.0.0-debian-12-r7"
    "kong/kubernetes-ingress-controller:3.4"
    "bitnami/os-shell:12-debian-12-r46"
    "bitnami/os-shell:12-debian-12-r45"
    "bitnami/zookeeper:3.9.3-debian-12-r16"
    "busybox:latest"
    "grafana/enterprise-logs:3.5.1"
    "nginxinc/nginx-unprivileged:1.28-alpine"
    "prometheus/alertmanager:v0.28.1"
    "grafana/loki-helm-test:ewelch-distributed-helm-chart-17db5ee"
    "ghcr.io/dexidp/dex:v2.43.1"
    "jimmidyson/configmap-reload:v0.12.0"
    "memcached:1.6.38-alpine"
)

# Calculate initial total images (direct images)
TOTAL_IMAGES_TO_PROCESS=${#DIRECT_DOCKER_IMAGES[@]}

for img in "${DIRECT_DOCKER_IMAGES[@]}"; do
    # 👇 FIX: Ensure img is not empty and pass all arguments to the function 👇
    if [[ -z "${img}" ]]; then
        echo "⚠️ Skipping an empty image name found in DIRECT_DOCKER_IMAGES. That's okay! Moving on. ⏭️"
        continue
    fi
    local_registry_image_name="${LOCAL_REGISTRY_HOST}/${img}"
    process_and_push_image_to_local_registry \
        "${img}" \
        "${local_registry_image_name}" \
        "${MAX_RETRIES}" \
        "${RETRY_DELAY}" || true # Use || true to allow script to continue on individual image failures
done

echo "" # Add a blank line for readability
echo "--- Processing Helm Charts and extracting their embedded images --- 🎨"

# Declare an associative array to store Helm repository URLs
declare -A HELM_REPOS=(
    ["hashicorp"]="https://helm.releases.hashicorp.com"
    ["kiali"]="https://kiali.org/helm-charts"
    ["kong"]="https://charts.konghq.com"
    ["cetic"]="https://cetic.github.io/helm-charts"
    ["jetstack"]="https://charts.jetstack.io"
    ["traefik"]="https://traefik.github.io/charts"
    ["elastic"]="https://helm.elastic.co"
    ["bitnami"]="https://charts.bitnami.com/bitnami"
    ["argo"]="https://argoproj.github.io/argo-helm"
    ["grafana"]="https://grafana.github.io/helm-charts"
    ["prometheus-community"]="https://prometheus-community.github.io/helm-charts"
)

# Add Helm repositories
echo "Adding Helm repositories... ➕"
for repo_name in "${!HELM_REPOS[@]}"; do
    repo_url="${HELM_REPOS[$repo_name]}"
    if ! helm repo list | grep -q "$repo_name"; then
        echo "Adding repository: $repo_name from $repo_url"
        helm repo add "$repo_name" "$repo_url" &> /dev/null || echo "⚠️ Warning: Failed to add Helm repository '$repo_name'. It might be a network issue or already added."
    else
        echo "Repository '$repo_name' already added. Skipping."
    fi
done

# Update Helm repositories
echo "Updating Helm repositories to get the latest charts... 🔄"
helm repo update

# Define Helm charts to extract images from
# Format: "repo_name/chart_name" or "repo_name/chart_name:version"
HELM_CHARTS=(
    "bitnami/zookeeper"
    "bitnami/kafka"
    "jetstack/cert-manager"
    "elastic/eck-operator" # Elasticsearch operator
    "elastic/kibana"
    "elastic/elasticsearch"
    "grafana/loki"
    "grafana/promtail"
    "prometheus-community/kube-prometheus-stack"
    "hashicorp/consul"
    "argo/argo-cd"
    "kong/kong"
    "kiali/kiali-server" # Kiali - Istio's dashboard
    "traefik/traefik" # Traefik Ingress Controller
)

# Declare an associative array to store all unique images extracted from Helm charts
declare -A ALL_HELM_IMAGES

# Loop through Helm charts to extract images
for chart_name in "${HELM_CHARTS[@]}"; do
    echo ""
    echo "--- Chart Processing: ${chart_name} ---"
    extract_helm_images "${chart_name}" || echo "Skipping image extraction for chart due to error: $chart_name"
done

# Finalize total images count (direct + helm extracted)
TOTAL_IMAGES_TO_PROCESS=$(( TOTAL_IMAGES_TO_PROCESS + ${#ALL_HELM_IMAGES[@]} ))

echo ""
echo "--- Pulling and pushing all extracted Helm chart images to local registry --- 🚀"
# Loop through the unique images collected and process each one
for img in "${!ALL_HELM_IMAGES[@]}"; do
    # 👇 FIX FOR "UNBOUND VARIABLE" ERROR & Pass all arguments 👇
    if [[ -z "${img}" ]]; then
        echo "⚠️ Skipping an empty or invalid image name found in Helm chart extraction. No worries! Onward! 🚀"
        continue # Move to the next item in the loop
    fi
    local_registry_image_name="${LOCAL_REGISTRY_HOST}/${img}" # Construct the local registry image name
    process_and_push_image_to_local_registry \
        "${img}" \
        "${local_registry_image_name}" \
        "${MAX_RETRIES}" \
        "${RETRY_DELAY}" || true # Use || true to allow script to continue on individual image failures
done

echo ""
echo "--- Image Processing Complete --- 🎉"

echo "All images are now available in your local Docker registry: ${LOCAL_REGISTRY_HOST}"
echo "Next step: Configure Helm to pull images from this local registry during installation."
echo ""
finalize_deployment_commands_file # Call the function from the new module
echo ""
echo "--- Deployment Commands File Processing Complete --- 🎉"
echo ""