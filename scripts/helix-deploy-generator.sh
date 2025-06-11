# scripts/helix-deploy-generator.sh
#
# This module contains functions for generating Helm deployment commands
# after images have been successfully mirrored to the local registry.
# It is sourced by the main automate-helix-setup script.

# Ensure these global variables are set in the calling script
# LOCAL_REGISTRY_HOST
# HELIX_DIR
# DEPLOYMENT_COMMANDS_FILE

# Function to initialize the deployment commands file
initialize_deployment_commands_file() {
    echo ""
    echo "--- Preparing Deployment Commands Output File --- 📝"
    echo "#!/bin/bash" > "${DEPLOYMENT_COMMANDS_FILE}"
    echo "" >> "${DEPLOYMENT_COMMANDS_FILE}"
    echo "#####################################################################" >> "${DEPLOYMENT_COMMANDS_FILE}"
    echo "#                HELIX Local Kubernetes Deployment Commands         #" >> "${DEPLOYMENT_COMMANDS_FILE}"
    echo "#-------------------------------------------------------------------#" >> "${DEPLOYMENT_COMMANDS_FILE}"
    echo "# This file contains recommended 'helm install' commands for the    #" >> "${DEPLOYMENT_COMMANDS_FILE}"
    echo "# services whose images were successfully mirrored to your local    #" >> "${DEPLOYMENT_COMMANDS_FILE}"
    echo "# registry at '${LOCAL_REGISTRY_HOST}'.                             #" >> "${DEPLOYMENT_COMMANDS_FILE}"
    echo "#                                                                   #" >> "${DEPLOYMENT_COMMANDS_FILE}"
    echo "# IMPORTANT:                                                        #" >> "${DEPLOYMENT_COMMANDS_FILE}"
    echo "#  1. Ensure your k3d cluster (or other Kubernetes cluster) is     #" >> "${DEPLOYMENT_COMMANDS_FILE}"
    echo "#     running and configured to trust/mirror from                   #" >> "${DEPLOYMENT_COMMANDS_FILE}"
    echo "#     '${LOCAL_REGISTRY_HOST}'.                                     #" >> "${DEPLOYMENT_COMMANDS_FILE}"
    echo "#  2. Review each command. You may need to adjust release names,   #" >> "${DEPLOYMENT_COMMANDS_FILE}"
    echo "#     namespaces, or add additional '--set' flags specific to     #" >> "${DEPLOYMENT_COMMANDS_FILE}"
    echo "#     your setup.                                                   #" >> "${DEPLOYMENT_COMMANDS_FILE}"
    echo "#                                                                   #" >> "${DEPLOYMENT_COMMANDS_FILE}"
    echo "# General Troubleshooting Steps:                                    #" >> "${DEPLOYMENT_COMMANDS_FILE}"
    echo "#  - Check pod status:        kubectl get pods -n <namespace>       #" >> "${DEPLOYMENT_COMMANDS_FILE}"
    echo "#  - Get pod logs:            kubectl logs <pod-name> -n <namespace>#" >> "${DEPLOYMENT_COMMANDS_FILE}"
    echo "#  - Describe resource:       kubectl describe <type>/<name> -n <ns>#" >> "${DEPLOYMENT_COMMANDS_FILE}"
    echo "#  - Check Helm releases:     helm list                               #" >> "${DEPLOYMENT_COMMANDS_FILE}"
    echo "#####################################################################" >> "${DEPLOYMENT_COMMANDS_FILE}"
    echo "" >> "${DEPLOYMENT_COMMANDS_FILE}"
    echo "echo '🚀 HELIX Deployment Commands generated for your review. Run them from this file or copy-paste!' " >> "${DEPLOYMENT_COMMANDS_FILE}"
    echo "" >> "${DEPLOYMENT_COMMANDS_FILE}"

    chmod +x "${DEPLOYMENT_COMMANDS_FILE}"
    echo "✅ Deployment commands will be written to ${DEPLOYMENT_COMMANDS_FILE}"
    echo ""
}

# Function to generate a specific Helm command for a successfully processed image
# This function is called from process_and_push_image_to_local_registry
generate_helm_command_for_image() {
    local original_image_name="$1" # The image name as originally provided (e.g., bitnami/vault:1.19.5-debian-12-r1)

    local helm_release_name=""
    local helm_chart_id=""
    local image_path_override="" # e.g., image.repository or prometheus.prometheusSpec.image.repository
    local original_repo_part="" # e.g., bitnami/zookeeper, rancher/mirrored-pause
    local original_tag_part=""  # e.g., 3.9.3-debian-12-r16, 3.6

    # Extract original repo and tag from the original_image_name
    original_repo_part=$(echo "${original_image_name}" | cut -d':' -f1) # "bitnami/vault-k8s"
    original_tag_part=$(echo "${original_image_name}" | cut -d':' -f2)  # "1.6.2-debian-12-r10"

    # Handle special cases where the image name is not directly a chart name (e.g., rancher/mirrored-pause)
    # This 'case' statement is where you explicitly define how to deploy each mirrored image.
    case "${original_repo_part}" in
        "bitnami/vault-k8s")
            helm_release_name="vault-k8s"
            helm_chart_id="bitnami/vault" # Common chart, may need to use original tag for K8s images if different
            image_path_override="server.image.repository"
            original_tag_part="${original_tag_part:-latest}"
            ;;
        "bitnami/vault")
            helm_release_name="vault"
            helm_chart_id="bitnami/vault"
            image_path_override="server.image.repository"
            original_tag_part="${original_tag_part:-latest}"
            ;;
        "rancher/mirrored-pause")
            echo "Note: '${original_image_name}' is an infrastructure image (pause container)." >> "${DEPLOYMENT_COMMANDS_FILE}"
            echo "# No direct Helm deployment command generated for ${original_image_name}." >> "${DEPLOYMENT_COMMANDS_FILE}"
            # IMPORTANT: Add 'return' here to stop further processing for this image
            return
            ;;
        "rancher/local-path-provisioner")
            helm_release_name="local-path-provisioner"
            # Note: local-path-provisioner is often part of k3d itself, or a simple manifest.
            # If you have a specific Helm chart for it, provide its ID.
            helm_chart_id="rancher/local-path-provisioner"
            image_path_override="image.repository"
            original_tag_part="${original_tag_part:-latest}"
            ;;
        "rancher/mirrored-library-busybox")
            helm_release_name="busybox"
            helm_chart_id="library/busybox" # Or a custom chart if you use one
            image_path_override="image.repository"
            original_tag_part="${original_tag_part:-latest}"
            # For busybox, you might recommend a simple kubectl run instead of helm
            echo "kubectl run busybox-test --rm -it --image=${LOCAL_REGISTRY_HOST}/busybox:${original_tag_part} -- /bin/sh" >> "${DEPLOYMENT_COMMANDS_FILE}"
            echo "# Helm deployment command for ${original_image_name} (if applicable):" >> "${DEPLOYMENT_COMMANDS_FILE}"
            ;;
        "n8nio/n8n")
            helm_release_name="n8n"
            helm_chart_id="n8nio/n8n" # Or the community chart name
            image_path_override="image.repository"
            original_tag_part="${original_tag_part:-latest}"
            ;;
        "bitnami/zookeeper")
            helm_release_name="zookeeper"
            helm_chart_id="bitnami/zookeeper"
            image_path_override="image.repository"
            original_tag_part="${original_tag_part:-latest}"
            ;;
        "bitnami/kafka")
            helm_release_name="kafka"
            helm_chart_id="bitnami/kafka"
            image_path_override="image.repository"
            original_tag_part="${original_tag_part:-latest}"
            ;;
        "quay.io/prometheus/prometheus")
            helm_release_name="kube-prom-stack" # This image is part of the stack
            helm_chart_id="prometheus-community/kube-prometheus-stack"
            image_path_override="prometheus.prometheusSpec.image.repository"
            original_tag_part="${original_tag_part:-latest}"
            ;;
        "quay.io/prometheus/alertmanager")
            helm_release_name="kube-prom-stack"
            helm_chart_id="prometheus-community/kube-prometheus-stack"
            image_path_override="alertmanager.alertmanagerSpec.image.repository"
            original_tag_part="${original_tag_part:-latest}"
            ;;
        "quay.io/prometheus/node-exporter")
            helm_release_name="kube-prom-stack"
            helm_chart_id="prometheus-community/kube-prometheus-stack"
            image_path_override="nodeExporter.image.repository"
            original_tag_part="${original_tag_part:-latest}"
            ;;
        "registry.k8s.io/kube-state-metrics/kube-state-metrics")
            helm_release_name="kube-prom-stack"
            helm_chart_id="prometheus-community/kube-prometheus-stack"
            image_path_override="kube-state-metrics.image.repository"
            original_tag_part="${original_tag_part:-latest}"
            ;;
        "grafana/loki")
            helm_release_name="loki"
            helm_chart_id="grafana/loki"
            image_path_override="image.repository"
            original_tag_part="${original_tag_part:-latest}"
            ;;
        "kong") # This refers to kong:3.9
            helm_release_name="kong"
            helm_chart_id="kong/kong" # Assuming you're using the official Kong Helm chart
            image_path_override="image.repository"
            original_tag_part="${original_tag_part:-latest}"
            ;;
        "kong/kubernetes-ingress-controller")
            helm_release_name="kong-ingress"
            helm_chart_id="kong/kubernetes-ingress-controller"
            image_path_override="image.repository"
            original_tag_part="${original_tag_part:-latest}"
            ;;
        "ecr-public.aws.com/docker/library/redis") # This is handled correctly by your tag.
            helm_release_name="redis"
            helm_chart_id="bitnami/redis" # Using bitnami's redis chart as a common example
            image_path_override="image.repository"
            original_tag_part="${original_tag_part:-latest}"
            ;;
        "ghcr.io/dexidp/dex")
            helm_release_name="dex"
            helm_chart_id="dexidp/dex" # Assuming a dex helm chart
            image_path_override="image.repository"
            original_tag_part="${original_tag_part:-latest}"
            ;;
        "memcached") # This refers to memcached:1.6.38-alpine
            helm_release_name="memcached"
            helm_chart_id="bitnami/memcached" # Assuming a bitnami memcached chart
            image_path_override="image.repository"
            original_tag_part="${original_tag_part:-latest}"
            ;;
        # Add more cases for all other critical services you want to deploy via Helm
        # You'll need to look up the correct chart name and image path for each.
        *)
            # Fallback for images where we don't have a specific Helm deployment strategy yet
            echo "" >> "${DEPLOYMENT_COMMANDS_FILE}"
            echo "### Note for Image: ${original_image_name} ###" >> "${DEPLOYMENT_COMMANDS_FILE}"
            echo "# This image was mirrored, but no specific Helm deployment command template" >> "${DEPLOYMENT_COMMANDS_FILE}"
            echo "# is available for it yet. If this is part of a Helm chart, you will need" >> "${DEPLOYMENT_COMMANDS_FILE}"
            echo "# to determine the correct '--set' flags for its image.repository and image.tag." >> "${DEPLOYMENT_COMMANDS_FILE}"
            echo "# Example: helm install <release_name> <chart_name> \\" >> "${DEPLOYMENT_COMMANDS_FILE}"
            echo "#            --set <image_path_override_repo>=${LOCAL_REGISTRY_HOST}/${original_repo_part} \\" >> "${DEPLOYMENT_COMMANDS_FILE}"
            echo "#            --set <image_path_override_tag>=${original_tag_part}" >> "${DEPLOYMENT_COMMANDS_FILE}"
            return # IMPORTANT: Also return here to prevent printing the generic command template
            ;;
    esac

    # The following block will ONLY execute if a valid helm_release_name,
    # helm_chart_id, and image_path_override were set in the case statement.
    # This 'if' condition is crucial to prevent the malformed output.
    if [ -n "${helm_release_name}" ] && [ -n "${helm_chart_id}" ] && [ -n "${image_path_override}" ]; then
        echo "" >> "${DEPLOYMENT_COMMANDS_FILE}"
        echo "### Deployment Instructions for ${helm_release_name} (Image: ${original_image_name}) ###" >> "${DEPLOYMENT_COMMANDS_FILE}"
        echo "# --- Helm Install Command ---" >> "${DEPLOYMENT_COMMANDS_FILE}"
        echo "helm install ${helm_release_name} ${helm_chart_id} \\" >> "${DEPLOYMENT_COMMANDS_FILE}"
        # Ensure the tag path is correctly derived from the repo path
        echo "  --set ${image_path_override}=${LOCAL_REGISTRY_HOST}/${original_repo_part} \\" >> "${DEPLOYMENT_COMMANDS_FILE}"
        echo "  --set ${image_path_override/repository/tag}=${original_tag_part}" >> "${DEPLOYMENT_COMMANDS_FILE}"
        echo "" >> "${DEPLOYMENT_COMMANDS_FILE}"
        echo "# --- Post-Deployment Checks (example, adjust as needed) ---" >> "${DEPLOYMENT_COMMANDS_FILE}"
        echo "# Wait for deployment: kubectl rollout status deployment/${helm_release_name}" >> "${DEPLOYMENT_COMMANDS_FILE}"
        echo "# Get pods:            kubectl get pods -l app.kubernetes.io/instance=${helm_release_name}" >> "${DEPLOYMENT_COMMANDS_FILE}"
        echo "# Get logs:            kubectl logs -l app.kubernetes.io/instance=${helm_release_name} --all-containers" >> "${DEPLOYMENT_COMMANDS_FILE}"
        echo "" >> "${DEPLOYMENT_COMMANDS_FILE}"
    fi
}

# Function to be called at the very end of the script
finalize_deployment_commands_file() {
    echo "" >> "${DEPLOYMENT_COMMANDS_FILE}"
    echo "echo '--- Deployment commands generation complete. Review ${DEPLOYMENT_COMMANDS_FILE} ---'" >> "${DEPLOYMENT_COMMANDS_FILE}"
    echo "🎉 All image processing and deployment command generation complete! 🎉"
    echo "Your deployment commands are aggregated in: ${DEPLOYMENT_COMMANDS_FILE}"
    echo "Remember to configure your k3d cluster to use the local registry before deploying."
    echo ""
}