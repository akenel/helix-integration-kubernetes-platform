#!/bin/bash

# Define the K3d cluster name
K3D_CLUSTER_NAME="helix-cluster"

echo "🔍 Pulling and importing required Docker images for HELIX..."

# Function to check if an image exists locally on the host
image_exists_locally() {
    docker image inspect "$1" > /dev/null 2>&1
}

# Function to check if an image is present in the k3d cluster's containerd registry
image_exists_in_k3d_cluster() {
    local IMAGE_NAME="$1"
    local NODE_NAME=$(docker ps --filter "label=k3d.cluster=${K3D_CLUSTER_NAME}" --filter "label=k3d.role=server" --format "{{.Names}}" | head -n 1)

    if [ -z "$NODE_NAME" ]; then
        echo "❌ K3d cluster node not found. Cannot check for image presence in cluster."
        return 1 # Indicate failure
    fi

    # containerd images often have 'docker.io/library/' prefix for official images
    # We need to handle both the original name and the containerd-prefixed name
    local CONTAINERD_IMAGE_NAME="$IMAGE_NAME"
    if [[ "$IMAGE_NAME" == docker.io/* ]]; then
        CONTAINERD_IMAGE_NAME="docker.io/library/${IMAGE_NAME#docker.io/}"
    fi

    # Check for the image on the server node
    docker exec "$NODE_NAME" ctr images ls --quiet | grep -q "$IMAGE_NAME" || \
    docker exec "$NODE_NAME" ctr images ls --quiet | grep -q "$CONTAINERD_IMAGE_NAME"
}


# Main function to pull and import an image
process_image() {
    local IMAGE_NAME="$1"
    echo "" # Add a newline for better readability between images
    echo "--- Processing image: ${IMAGE_NAME} ---"

    # Step 1: Check and pull locally
    if image_exists_locally "${IMAGE_NAME}"; then
        echo "✅ Image '${IMAGE_NAME}' already exists locally on host. Skipping docker pull."
    else
        echo "⬇️ Image '${IMAGE_NAME}' not found locally on host. Pulling..."
        if ! docker pull "${IMAGE_NAME}"; then
            echo "❌ Failed to pull image '${IMAGE_NAME}'. Please check connectivity or image name/tag."
            return 1 # Indicate failure
        fi
        echo "✅ Image '${IMAGE_NAME}' pulled successfully to host."
    fi

    # Step 2: Check and import into k3d cluster
    if image_exists_in_k3d_cluster "${IMAGE_NAME}"; then
        echo "✅ Image '${IMAGE_NAME}' already exists in k3d cluster '${K3D_CLUSTER_NAME}'. Skipping import."
    else
        echo "📦 Importing '${IMAGE_NAME}' into k3d cluster '${K3D_CLUSTER_NAME}'..."
        # We need to ensure the image is available on the host to import
        if ! image_exists_locally "${IMAGE_NAME}"; then
            echo "❌ Error: Image '${IMAGE_NAME}' not found locally for import. This should not happen after pull step."
            return 1
        fi

        if ! k3d image import "${IMAGE_NAME}" -c "${K3D_CLUSTER_NAME}"; then
            echo "⚠️ Warning: Failed to import image '${IMAGE_NAME}' into k3d cluster. May indicate a transient issue or a deeper problem."
            # Don't exit here, allow other images to be processed
        else
            echo "✅ Image '${IMAGE_NAME}' imported successfully into cluster."
        fi
    fi
    return 0 # Indicate overall success for this image
}

# --- Call the function for each image ---
# Ensure you've confirmed the exact tags for Bitnami images!

process_image "rancher/local-path-provisioner:v0.0.30"
process_image "rancher/mirrored-pause:3.6"
process_image "docker.io/traefik:v3.4.1"
process_image "quay.io/jetstack/cert-manager-controller:v1.17.2"
process_image "quay.io/jetstack/cert-manager-webhook:v1.17.2"
process_image "quay.io/jetstack/cert-manager-cainjector:v1.17.2"
process_image "quay.io/jetstack/cert-manager-startupapicheck:v1.17.2"
process_image "bitnami/postgresql:17.5.0-debian-12-r10" # Replace with actual tag if different
process_image "bitnami/kafka:4.0.0-debian-12-r7"       # Replace with actual tag
process_image "bitnami/zookeeper:3.9.3-debian-12-r16"   # Replace with actual tag
process_image "bitnami/keycloak:24.0.3"
process_image "hashicorp/vault:1.15.4"
process_image "n8nio/n8n:latest"


echo "" # Final newline
echo "✅ All specified images processed (pulled, imported, or skipped if already present)."
