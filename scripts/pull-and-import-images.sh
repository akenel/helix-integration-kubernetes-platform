#!/bin/bash

set -euo pipefail

CLUSTER_NAME="helix-cluster"
LOG_FILE="logs/image-pull-import.log"
mkdir -p logs

# List of required images for HELIX platform
IMAGES=(
  "hashicorp/vault:1.15.4"
  "quay.io/jetstack/cert-manager-controller:v1.17.2"
  "busybox:latest"
  "portainer/portainer-ce:2.27.6"
  "traefik:v3.4.1"
  "containous/whoami"
  "bitnami/postgresql:16"
  "confluentinc/cp-kafka:7.5.0"
  "confluentinc/cp-zookeeper:7.5.0"
  "confluentinc/cp-schema-registry:7.5.0"
  "n8nio/n8n:1.45.0"
  "hashicorp/vault-k8s:1.6.2"
  "docker.io/bitnami/keycloak:26.2.5-debian-12-r1"
  "minio/minio:RELEASE.2024-05-10T01-41-38Z"
  "quay.io/kiali/kiali:latest"
  "openpolicyagent/opa:1.3.0"
  "quay.io/coreos/clair:v2.1.8"
  "apache/nifi:1.25.0"
  "docker.io/ollama/ollama:latest"
)

echo "📦 Starting Docker Image Pull and Import into k3d cluster '$CLUSTER_NAME'..."
echo "🕒 Started at $(date)" > "$LOG_FILE"

# Function to check if an image exists in the k3d cluster
# Function to check if an image exists in the k3d cluster
function image_exists_in_k3d_cluster() {
  local image_to_check="$1"
  # Get all image IDs from all nodes in the k3d cluster and grep for the image name
  # We use `awk` to normalize image names (e.g., add `docker.io/library/` prefix if missing)
  # to better match how they are stored in containerd/docker
  
  # --- FIX IS HERE: Changed 'k3d kubectl' to 'kubectl' ---
  kubectl get nodes -o jsonpath='{.items[*].status.images[*].names[*]}' | \
    tr -s '[[:space:]]' '\n' | \
    awk -v img="$image_to_check" '
      BEGIN { found = 0 }
      {
        # Normalize image name for comparison
        # Add docker.io/library/ for official Docker Hub images if not present
        if (img ~ /^[a-zA-Z0-9.\-_]+\/[a-zA-Z0-9.\-_]+(:.*)?$/ && ! (img ~ /docker.io\// || img ~ /quay.io\// || img ~ /ghcr.io\//)) {
          normalized_img = "docker.io/library/" img
        } else if (img ~ /^[a-zA-Z0-9.\-_]+(:.*)?$/ && ! (img ~ /\//)) { # Single-part image name (e.g., "whoami")
          normalized_img = "docker.io/library/" img
        } else {
          normalized_img = img
        }

        # Handle images that might have a full sha256 digest appended after a tag
        if (index($0, "@sha256") > 0) {
          current_image_base = substr($0, 1, index($0, "@sha256") - 1)
        } else {
          current_image_base = $0
        }

        # Compare with or without the tag
        if (current_image_base == normalized_img || \
            current_image_base == img || \
            $0 == normalized_img || \
            $0 == img || \
            (index(current_image_base, ":") > 0 && substr(current_image_base, 1, index(current_image_base, ":") - 1) == substr(normalized_img, 1, index(normalized_img, ":") - 1) && index(normalized_img, ":") == 0)) {
            found = 1
            exit
        }
      }
      END { exit !found }'
  return $?
}





for IMAGE in "${IMAGES[@]}"; do
  echo "🔍 Processing image: $IMAGE"

  # Check if image exists locally
  if docker image inspect "$IMAGE" > /dev/null 2>&1; then
    echo "✅ Image '$IMAGE' already exists locally. Skipping pull."
  else
    echo "📥 Pulling image '$IMAGE'..."
    if docker pull "$IMAGE" >> "$LOG_FILE" 2>&1; then
      echo "✅ Successfully pulled '$IMAGE'"
    else
      echo "❌ Failed to pull '$IMAGE'. Check logs in $LOG_FILE"
      continue
    fi
  fi

  # Check if image exists in k3d cluster
  echo "Checking if '$IMAGE' is already in k3d cluster '$CLUSTER_NAME'..."
  if image_exists_in_k3d_cluster "$IMAGE"; then
    echo "✅ Image '$IMAGE' already exists in k3d cluster. Skipping import."
  else
    # Import image into k3d
    echo "📦 Importing '$IMAGE' into k3d cluster '$CLUSTER_NAME'..."
    if k3d image import "$IMAGE" -c "$CLUSTER_NAME" >> "$LOG_FILE" 2>&1; then
      echo "✅ Successfully imported '$IMAGE' into cluster"
    else
      echo "❌ Failed to import '$IMAGE'. Check logs in $LOG_FILE"
    fi
  fi

  echo "---------------------------------------------"
done

echo "✅ All done! Images ready for HELIX. 🧰"
