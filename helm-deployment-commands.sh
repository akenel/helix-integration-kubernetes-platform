
### Deployment Instructions for vault-k8s (Image: bitnami/vault-k8s:1.6.2-debian-12-r10) ###
# --- Helm Install Command ---
helm install vault-k8s bitnami/vault \
  --set server.image.repository=localhost:5000/bitnami/vault-k8s \
  --set server.image.tag=1.6.2-debian-12-r10

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/vault-k8s
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=vault-k8s
# Get logs:            kubectl logs -l app.kubernetes.io/instance=vault-k8s --all-containers


### Deployment Instructions for vault (Image: bitnami/vault:1.19.5-debian-12-r1) ###
# --- Helm Install Command ---
helm install vault bitnami/vault \
  --set server.image.repository=localhost:5000/bitnami/vault \
  --set server.image.tag=1.19.5-debian-12-r1

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/vault
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=vault
# Get logs:            kubectl logs -l app.kubernetes.io/instance=vault --all-containers

Note: 'rancher/mirrored-pause:3.6' is an infrastructure image (pause container).
# No direct Helm deployment command generated for rancher/mirrored-pause:3.6.

### Deployment Instructions for  (Image: rancher/mirrored-pause:3.6) ###
# --- Helm Install Command ---
helm install   \
  --set =localhost:5000/rancher/mirrored-pause \
  --set =3.6

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=
# Get logs:            kubectl logs -l app.kubernetes.io/instance= --all-containers


### Deployment Instructions for local-path-provisioner (Image: rancher/local-path-provisioner:v0.0.30) ###
# --- Helm Install Command ---
helm install local-path-provisioner rancher/local-path-provisioner \
  --set image.repository=localhost:5000/rancher/local-path-provisioner \
  --set image.tag=v0.0.30

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/local-path-provisioner
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=local-path-provisioner
# Get logs:            kubectl logs -l app.kubernetes.io/instance=local-path-provisioner --all-containers

kubectl run busybox-test --rm -it --image=localhost:5000/busybox:1.36.1 -- /bin/sh
# Helm deployment command for rancher/mirrored-library-busybox:1.36.1 (if applicable):

### Deployment Instructions for busybox (Image: rancher/mirrored-library-busybox:1.36.1) ###
# --- Helm Install Command ---
helm install busybox library/busybox \
  --set image.repository=localhost:5000/rancher/mirrored-library-busybox \
  --set image.tag=1.36.1

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/busybox
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=busybox
# Get logs:            kubectl logs -l app.kubernetes.io/instance=busybox --all-containers


### Deployment Instructions for n8n (Image: n8nio/n8n:latest) ###
# --- Helm Install Command ---
helm install n8n n8nio/n8n \
  --set image.repository=localhost:5000/n8nio/n8n \
  --set image.tag=latest

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/n8n
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=n8n
# Get logs:            kubectl logs -l app.kubernetes.io/instance=n8n --all-containers


### Note for Image: rancher/mirrored-coredns-coredns:1.12.0 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/rancher/mirrored-coredns-coredns \
#            --set <image_path_override_tag>=1.12.0


### Note for Image: rancher/mirrored-metrics-server:v0.7.2 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/rancher/mirrored-metrics-server \
#            --set <image_path_override_tag>=v0.7.2


### Note for Image: bitnami/minio:2025.5.24-debian-12-r5 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/minio \
#            --set <image_path_override_tag>=2025.5.24-debian-12-r5


### Note for Image: bitnami/minio-object-browser:2.0.1-debian-12-r1 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/minio-object-browser \
#            --set <image_path_override_tag>=2.0.1-debian-12-r1


### Deployment Instructions for kube-prom-stack (Image: quay.io/prometheus/prometheus:v2.52.0) ###
# --- Helm Install Command ---
helm install kube-prom-stack prometheus-community/kube-prometheus-stack \
  --set prometheus.prometheusSpec.image.repository=localhost:5000/quay.io/prometheus/prometheus \
  --set prometheus.prometheusSpec.image.tag=v2.52.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kube-prom-stack
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kube-prom-stack
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kube-prom-stack --all-containers


### Deployment Instructions for kube-prom-stack (Image: quay.io/prometheus/alertmanager:v0.27.0) ###
# --- Helm Install Command ---
helm install kube-prom-stack prometheus-community/kube-prometheus-stack \
  --set alertmanager.alertmanagerSpec.image.repository=localhost:5000/quay.io/prometheus/alertmanager \
  --set alertmanager.alertmanagerSpec.image.tag=v0.27.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kube-prom-stack
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kube-prom-stack
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kube-prom-stack --all-containers


### Note for Image: quay.io/thanos/thanos:v0.32.2 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/quay.io/thanos/thanos \
#            --set <image_path_override_tag>=v0.32.2


### Note for Image: quay.io/prometheus-operator/prometheus-operator:v0.74.0 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/quay.io/prometheus-operator/prometheus-operator \
#            --set <image_path_override_tag>=v0.74.0


### Note for Image: quay.io/prometheus-operator/prometheus-config-reloader:v0.74.0 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/quay.io/prometheus-operator/prometheus-config-reloader \
#            --set <image_path_override_tag>=v0.74.0


### Deployment Instructions for kube-prom-stack (Image: quay.io/prometheus/node-exporter:v1.7.0) ###
# --- Helm Install Command ---
helm install kube-prom-stack prometheus-community/kube-prometheus-stack \
  --set nodeExporter.image.repository=localhost:5000/quay.io/prometheus/node-exporter \
  --set nodeExporter.image.tag=v1.7.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kube-prom-stack
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kube-prom-stack
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kube-prom-stack --all-containers


### Deployment Instructions for kube-prom-stack (Image: registry.k8s.io/kube-state-metrics/kube-state-metrics:v2.11.0) ###
# --- Helm Install Command ---
helm install kube-prom-stack prometheus-community/kube-prometheus-stack \
  --set kube-state-metrics.image.repository=localhost:5000/registry.k8s.io/kube-state-metrics/kube-state-metrics \
  --set kube-state-metrics.image.tag=v2.11.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kube-prom-stack
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kube-prom-stack
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kube-prom-stack --all-containers


### Note for Image: bitnami/jmx-exporter:1.3.0-debian-12-r3 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/jmx-exporter \
#            --set <image_path_override_tag>=1.3.0-debian-12-r3


### Note for Image: kiwigrid/k8s-sidecar:1.30.3 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/kiwigrid/k8s-sidecar \
#            --set <image_path_override_tag>=1.30.3


### Deployment Instructions for loki (Image: grafana/loki:3.5.0) ###
# --- Helm Install Command ---
helm install loki grafana/loki \
  --set image.repository=localhost:5000/grafana/loki \
  --set image.tag=3.5.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/loki
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=loki
# Get logs:            kubectl logs -l app.kubernetes.io/instance=loki --all-containers


### Deployment Instructions for kong (Image: kong:3.9) ###
# --- Helm Install Command ---
helm install kong kong/kong \
  --set image.repository=localhost:5000/kong \
  --set image.tag=3.9

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kong
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kong
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kong --all-containers


### Deployment Instructions for redis (Image: ecr-public.aws.com/docker/library/redis:7.2.8-alpine) ###
# --- Helm Install Command ---
helm install redis bitnami/redis \
  --set image.repository=localhost:5000/ecr-public.aws.com/docker/library/redis \
  --set image.tag=7.2.8-alpine

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/redis
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=redis
# Get logs:            kubectl logs -l app.kubernetes.io/instance=redis --all-containers


### Note for Image: quay.io/argoprojlabs/argocd-extension-installer:v0.0.8 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/quay.io/argoprojlabs/argocd-extension-installer \
#            --set <image_path_override_tag>=v0.0.8


### Note for Image: ghcr.io/oliver006/redis_exporter:v1.74.0 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/ghcr.io/oliver006/redis_exporter \
#            --set <image_path_override_tag>=v1.74.0


### Note for Image: bitnami/kubectl:1.33.1-debian-12-r5 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/kubectl \
#            --set <image_path_override_tag>=1.33.1-debian-12-r5


### Note for Image: prom/memcached-exporter:v0.15.2 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/prom/memcached-exporter \
#            --set <image_path_override_tag>=v0.15.2


### Deployment Instructions for kafka (Image: bitnami/kafka:4.0.0-debian-12-r7) ###
# --- Helm Install Command ---
helm install kafka bitnami/kafka \
  --set image.repository=localhost:5000/bitnami/kafka \
  --set image.tag=4.0.0-debian-12-r7

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kafka
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kafka
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kafka --all-containers


### Deployment Instructions for kong-ingress (Image: kong/kubernetes-ingress-controller:3.4) ###
# --- Helm Install Command ---
helm install kong-ingress kong/kubernetes-ingress-controller \
  --set image.repository=localhost:5000/kong/kubernetes-ingress-controller \
  --set image.tag=3.4

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kong-ingress
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kong-ingress
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kong-ingress --all-containers


### Note for Image: bitnami/os-shell:12-debian-12-r46 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/os-shell \
#            --set <image_path_override_tag>=12-debian-12-r46


### Note for Image: bitnami/os-shell:12-debian-12-r45 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/os-shell \
#            --set <image_path_override_tag>=12-debian-12-r45


### Deployment Instructions for zookeeper (Image: bitnami/zookeeper:3.9.3-debian-12-r16) ###
# --- Helm Install Command ---
helm install zookeeper bitnami/zookeeper \
  --set image.repository=localhost:5000/bitnami/zookeeper \
  --set image.tag=3.9.3-debian-12-r16

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/zookeeper
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=zookeeper
# Get logs:            kubectl logs -l app.kubernetes.io/instance=zookeeper --all-containers


### Note for Image: busybox:latest ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/busybox \
#            --set <image_path_override_tag>=latest


### Note for Image: grafana/enterprise-logs:3.5.1 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/grafana/enterprise-logs \
#            --set <image_path_override_tag>=3.5.1


### Note for Image: nginxinc/nginx-unprivileged:1.28-alpine ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/nginxinc/nginx-unprivileged \
#            --set <image_path_override_tag>=1.28-alpine


### Note for Image: grafana/loki-helm-test:ewelch-distributed-helm-chart-17db5ee ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/grafana/loki-helm-test \
#            --set <image_path_override_tag>=ewelch-distributed-helm-chart-17db5ee


### Deployment Instructions for dex (Image: ghcr.io/dexidp/dex:v2.43.1) ###
# --- Helm Install Command ---
helm install dex dexidp/dex \
  --set image.repository=localhost:5000/ghcr.io/dexidp/dex \
  --set image.tag=v2.43.1

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/dex
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=dex
# Get logs:            kubectl logs -l app.kubernetes.io/instance=dex --all-containers


### Deployment Instructions for memcached (Image: memcached:1.6.38-alpine) ###
# --- Helm Install Command ---
helm install memcached bitnami/memcached \
  --set image.repository=localhost:5000/memcached \
  --set image.tag=1.6.38-alpine

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/memcached
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=memcached
# Get logs:            kubectl logs -l app.kubernetes.io/instance=memcached --all-containers


### Note for Image: bitnami/jmx-exporter:1.3.0-debian-12-r3 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/jmx-exporter \
#            --set <image_path_override_tag>=1.3.0-debian-12-r3


### Note for Image: kiwigrid/k8s-sidecar:1.30.3 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/kiwigrid/k8s-sidecar \
#            --set <image_path_override_tag>=1.30.3


### Deployment Instructions for loki (Image: grafana/loki:3.5.0) ###
# --- Helm Install Command ---
helm install loki grafana/loki \
  --set image.repository=localhost:5000/grafana/loki \
  --set image.tag=3.5.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/loki
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=loki
# Get logs:            kubectl logs -l app.kubernetes.io/instance=loki --all-containers


### Deployment Instructions for kong (Image: kong:3.9) ###
# --- Helm Install Command ---
helm install kong kong/kong \
  --set image.repository=localhost:5000/kong \
  --set image.tag=3.9

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kong
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kong
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kong --all-containers


### Deployment Instructions for redis (Image: ecr-public.aws.com/docker/library/redis:7.2.8-alpine) ###
# --- Helm Install Command ---
helm install redis bitnami/redis \
  --set image.repository=localhost:5000/ecr-public.aws.com/docker/library/redis \
  --set image.tag=7.2.8-alpine

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/redis
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=redis
# Get logs:            kubectl logs -l app.kubernetes.io/instance=redis --all-containers


### Note for Image: quay.io/argoprojlabs/argocd-extension-installer:v0.0.8 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/quay.io/argoprojlabs/argocd-extension-installer \
#            --set <image_path_override_tag>=v0.0.8


### Note for Image: ghcr.io/oliver006/redis_exporter:v1.74.0 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/ghcr.io/oliver006/redis_exporter \
#            --set <image_path_override_tag>=v1.74.0


### Note for Image: bitnami/kubectl:1.33.1-debian-12-r5 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/kubectl \
#            --set <image_path_override_tag>=1.33.1-debian-12-r5


### Note for Image: prom/memcached-exporter:v0.15.2 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/prom/memcached-exporter \
#            --set <image_path_override_tag>=v0.15.2


### Deployment Instructions for kafka (Image: bitnami/kafka:4.0.0-debian-12-r7) ###
# --- Helm Install Command ---
helm install kafka bitnami/kafka \
  --set image.repository=localhost:5000/bitnami/kafka \
  --set image.tag=4.0.0-debian-12-r7

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kafka
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kafka
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kafka --all-containers


### Deployment Instructions for kong-ingress (Image: kong/kubernetes-ingress-controller:3.4) ###
# --- Helm Install Command ---
helm install kong-ingress kong/kubernetes-ingress-controller \
  --set image.repository=localhost:5000/kong/kubernetes-ingress-controller \
  --set image.tag=3.4

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kong-ingress
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kong-ingress
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kong-ingress --all-containers


### Note for Image: bitnami/os-shell:12-debian-12-r46 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/os-shell \
#            --set <image_path_override_tag>=12-debian-12-r46


### Note for Image: bitnami/os-shell:12-debian-12-r45 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/os-shell \
#            --set <image_path_override_tag>=12-debian-12-r45


### Deployment Instructions for zookeeper (Image: bitnami/zookeeper:3.9.3-debian-12-r16) ###
# --- Helm Install Command ---
helm install zookeeper bitnami/zookeeper \
  --set image.repository=localhost:5000/bitnami/zookeeper \
  --set image.tag=3.9.3-debian-12-r16

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/zookeeper
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=zookeeper
# Get logs:            kubectl logs -l app.kubernetes.io/instance=zookeeper --all-containers


### Note for Image: busybox:latest ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/busybox \
#            --set <image_path_override_tag>=latest


### Note for Image: grafana/enterprise-logs:3.5.1 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/grafana/enterprise-logs \
#            --set <image_path_override_tag>=3.5.1


### Note for Image: nginxinc/nginx-unprivileged:1.28-alpine ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/nginxinc/nginx-unprivileged \
#            --set <image_path_override_tag>=1.28-alpine


### Note for Image: grafana/loki-helm-test:ewelch-distributed-helm-chart-17db5ee ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/grafana/loki-helm-test \
#            --set <image_path_override_tag>=ewelch-distributed-helm-chart-17db5ee


### Deployment Instructions for dex (Image: ghcr.io/dexidp/dex:v2.43.1) ###
# --- Helm Install Command ---
helm install dex dexidp/dex \
  --set image.repository=localhost:5000/ghcr.io/dexidp/dex \
  --set image.tag=v2.43.1

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/dex
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=dex
# Get logs:            kubectl logs -l app.kubernetes.io/instance=dex --all-containers


### Deployment Instructions for memcached (Image: memcached:1.6.38-alpine) ###
# --- Helm Install Command ---
helm install memcached bitnami/memcached \
  --set image.repository=localhost:5000/memcached \
  --set image.tag=1.6.38-alpine

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/memcached
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=memcached
# Get logs:            kubectl logs -l app.kubernetes.io/instance=memcached --all-containers


echo '--- Deployment commands generation complete. Review /home/angel/HELIX/helm-deployment-commands.sh ---'

### Deployment Instructions for vault-k8s (Image: bitnami/vault-k8s:1.6.2-debian-12-r10) ###
# --- Helm Install Command ---
helm install vault-k8s bitnami/vault \
  --set server.image.repository=localhost:5000/bitnami/vault-k8s \
  --set server.image.tag=1.6.2-debian-12-r10

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/vault-k8s
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=vault-k8s
# Get logs:            kubectl logs -l app.kubernetes.io/instance=vault-k8s --all-containers


### Deployment Instructions for vault (Image: bitnami/vault:1.19.5-debian-12-r1) ###
# --- Helm Install Command ---
helm install vault bitnami/vault \
  --set server.image.repository=localhost:5000/bitnami/vault \
  --set server.image.tag=1.19.5-debian-12-r1

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/vault
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=vault
# Get logs:            kubectl logs -l app.kubernetes.io/instance=vault --all-containers

Note: 'rancher/mirrored-pause:3.6' is an infrastructure image (pause container).
# No direct Helm deployment command generated for rancher/mirrored-pause:3.6.

### Deployment Instructions for local-path-provisioner (Image: rancher/local-path-provisioner:v0.0.30) ###
# --- Helm Install Command ---
helm install local-path-provisioner rancher/local-path-provisioner \
  --set image.repository=localhost:5000/rancher/local-path-provisioner \
  --set image.tag=v0.0.30

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/local-path-provisioner
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=local-path-provisioner
# Get logs:            kubectl logs -l app.kubernetes.io/instance=local-path-provisioner --all-containers

kubectl run busybox-test --rm -it --image=localhost:5000/busybox:1.36.1 -- /bin/sh
# Helm deployment command for rancher/mirrored-library-busybox:1.36.1 (if applicable):

### Deployment Instructions for busybox (Image: rancher/mirrored-library-busybox:1.36.1) ###
# --- Helm Install Command ---
helm install busybox library/busybox \
  --set image.repository=localhost:5000/rancher/mirrored-library-busybox \
  --set image.tag=1.36.1

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/busybox
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=busybox
# Get logs:            kubectl logs -l app.kubernetes.io/instance=busybox --all-containers


### Deployment Instructions for n8n (Image: n8nio/n8n:latest) ###
# --- Helm Install Command ---
helm install n8n n8nio/n8n \
  --set image.repository=localhost:5000/n8nio/n8n \
  --set image.tag=latest

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/n8n
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=n8n
# Get logs:            kubectl logs -l app.kubernetes.io/instance=n8n --all-containers


### Note for Image: rancher/mirrored-coredns-coredns:1.12.0 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/rancher/mirrored-coredns-coredns \
#            --set <image_path_override_tag>=1.12.0

### Note for Image: rancher/mirrored-metrics-server:v0.7.2 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/rancher/mirrored-metrics-server \
#            --set <image_path_override_tag>=v0.7.2

### Note for Image: bitnami/minio:2025.5.24-debian-12-r5 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/minio \
#            --set <image_path_override_tag>=2025.5.24-debian-12-r5

### Note for Image: bitnami/minio-object-browser:2.0.1-debian-12-r1 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/minio-object-browser \
#            --set <image_path_override_tag>=2.0.1-debian-12-r1

### Deployment Instructions for kube-prom-stack (Image: quay.io/prometheus/prometheus:v2.52.0) ###
# --- Helm Install Command ---
helm install kube-prom-stack prometheus-community/kube-prometheus-stack \
  --set prometheus.prometheusSpec.image.repository=localhost:5000/quay.io/prometheus/prometheus \
  --set prometheus.prometheusSpec.image.tag=v2.52.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kube-prom-stack
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kube-prom-stack
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kube-prom-stack --all-containers


### Deployment Instructions for kube-prom-stack (Image: quay.io/prometheus/alertmanager:v0.27.0) ###
# --- Helm Install Command ---
helm install kube-prom-stack prometheus-community/kube-prometheus-stack \
  --set alertmanager.alertmanagerSpec.image.repository=localhost:5000/quay.io/prometheus/alertmanager \
  --set alertmanager.alertmanagerSpec.image.tag=v0.27.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kube-prom-stack
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kube-prom-stack
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kube-prom-stack --all-containers


### Note for Image: quay.io/thanos/thanos:v0.32.2 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/quay.io/thanos/thanos \
#            --set <image_path_override_tag>=v0.32.2

### Note for Image: quay.io/prometheus-operator/prometheus-operator:v0.74.0 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/quay.io/prometheus-operator/prometheus-operator \
#            --set <image_path_override_tag>=v0.74.0

### Note for Image: quay.io/prometheus-operator/prometheus-config-reloader:v0.74.0 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/quay.io/prometheus-operator/prometheus-config-reloader \
#            --set <image_path_override_tag>=v0.74.0

### Deployment Instructions for kube-prom-stack (Image: quay.io/prometheus/node-exporter:v1.7.0) ###
# --- Helm Install Command ---
helm install kube-prom-stack prometheus-community/kube-prometheus-stack \
  --set nodeExporter.image.repository=localhost:5000/quay.io/prometheus/node-exporter \
  --set nodeExporter.image.tag=v1.7.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kube-prom-stack
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kube-prom-stack
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kube-prom-stack --all-containers


### Deployment Instructions for kube-prom-stack (Image: registry.k8s.io/kube-state-metrics/kube-state-metrics:v2.11.0) ###
# --- Helm Install Command ---
helm install kube-prom-stack prometheus-community/kube-prometheus-stack \
  --set kube-state-metrics.image.repository=localhost:5000/registry.k8s.io/kube-state-metrics/kube-state-metrics \
  --set kube-state-metrics.image.tag=v2.11.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kube-prom-stack
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kube-prom-stack
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kube-prom-stack --all-containers


### Note for Image: bitnami/jmx-exporter:1.3.0-debian-12-r3 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/jmx-exporter \
#            --set <image_path_override_tag>=1.3.0-debian-12-r3

### Note for Image: kiwigrid/k8s-sidecar:1.30.3 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/kiwigrid/k8s-sidecar \
#            --set <image_path_override_tag>=1.30.3

### Deployment Instructions for loki (Image: grafana/loki:3.5.0) ###
# --- Helm Install Command ---
helm install loki grafana/loki \
  --set image.repository=localhost:5000/grafana/loki \
  --set image.tag=3.5.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/loki
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=loki
# Get logs:            kubectl logs -l app.kubernetes.io/instance=loki --all-containers


### Deployment Instructions for kong (Image: kong:3.9) ###
# --- Helm Install Command ---
helm install kong kong/kong \
  --set image.repository=localhost:5000/kong \
  --set image.tag=3.9

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kong
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kong
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kong --all-containers


### Deployment Instructions for redis (Image: ecr-public.aws.com/docker/library/redis:7.2.8-alpine) ###
# --- Helm Install Command ---
helm install redis bitnami/redis \
  --set image.repository=localhost:5000/ecr-public.aws.com/docker/library/redis \
  --set image.tag=7.2.8-alpine

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/redis
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=redis
# Get logs:            kubectl logs -l app.kubernetes.io/instance=redis --all-containers


### Note for Image: quay.io/argoprojlabs/argocd-extension-installer:v0.0.8 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/quay.io/argoprojlabs/argocd-extension-installer \
#            --set <image_path_override_tag>=v0.0.8

### Note for Image: ghcr.io/oliver006/redis_exporter:v1.74.0 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/ghcr.io/oliver006/redis_exporter \
#            --set <image_path_override_tag>=v1.74.0

### Note for Image: bitnami/kubectl:1.33.1-debian-12-r5 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/kubectl \
#            --set <image_path_override_tag>=1.33.1-debian-12-r5

### Note for Image: prom/memcached-exporter:v0.15.2 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/prom/memcached-exporter \
#            --set <image_path_override_tag>=v0.15.2

### Deployment Instructions for kafka (Image: bitnami/kafka:4.0.0-debian-12-r7) ###
# --- Helm Install Command ---
helm install kafka bitnami/kafka \
  --set image.repository=localhost:5000/bitnami/kafka \
  --set image.tag=4.0.0-debian-12-r7

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kafka
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kafka
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kafka --all-containers


### Deployment Instructions for kong-ingress (Image: kong/kubernetes-ingress-controller:3.4) ###
# --- Helm Install Command ---
helm install kong-ingress kong/kubernetes-ingress-controller \
  --set image.repository=localhost:5000/kong/kubernetes-ingress-controller \
  --set image.tag=3.4

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kong-ingress
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kong-ingress
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kong-ingress --all-containers


### Note for Image: bitnami/os-shell:12-debian-12-r46 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/os-shell \
#            --set <image_path_override_tag>=12-debian-12-r46

### Note for Image: bitnami/os-shell:12-debian-12-r45 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/os-shell \
#            --set <image_path_override_tag>=12-debian-12-r45

### Deployment Instructions for zookeeper (Image: bitnami/zookeeper:3.9.3-debian-12-r16) ###
# --- Helm Install Command ---
helm install zookeeper bitnami/zookeeper \
  --set image.repository=localhost:5000/bitnami/zookeeper \
  --set image.tag=3.9.3-debian-12-r16

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/zookeeper
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=zookeeper
# Get logs:            kubectl logs -l app.kubernetes.io/instance=zookeeper --all-containers


### Note for Image: busybox:latest ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/busybox \
#            --set <image_path_override_tag>=latest

### Note for Image: grafana/enterprise-logs:3.5.1 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/grafana/enterprise-logs \
#            --set <image_path_override_tag>=3.5.1

### Note for Image: nginxinc/nginx-unprivileged:1.28-alpine ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/nginxinc/nginx-unprivileged \
#            --set <image_path_override_tag>=1.28-alpine

### Note for Image: grafana/loki-helm-test:ewelch-distributed-helm-chart-17db5ee ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/grafana/loki-helm-test \
#            --set <image_path_override_tag>=ewelch-distributed-helm-chart-17db5ee

### Deployment Instructions for dex (Image: ghcr.io/dexidp/dex:v2.43.1) ###
# --- Helm Install Command ---
helm install dex dexidp/dex \
  --set image.repository=localhost:5000/ghcr.io/dexidp/dex \
  --set image.tag=v2.43.1

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/dex
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=dex
# Get logs:            kubectl logs -l app.kubernetes.io/instance=dex --all-containers


### Deployment Instructions for memcached (Image: memcached:1.6.38-alpine) ###
# --- Helm Install Command ---
helm install memcached bitnami/memcached \
  --set image.repository=localhost:5000/memcached \
  --set image.tag=1.6.38-alpine

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/memcached
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=memcached
# Get logs:            kubectl logs -l app.kubernetes.io/instance=memcached --all-containers


### Note for Image: bitnami/jmx-exporter:1.3.0-debian-12-r3 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/jmx-exporter \
#            --set <image_path_override_tag>=1.3.0-debian-12-r3

### Note for Image: kiwigrid/k8s-sidecar:1.30.3 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/kiwigrid/k8s-sidecar \
#            --set <image_path_override_tag>=1.30.3

### Deployment Instructions for loki (Image: grafana/loki:3.5.0) ###
# --- Helm Install Command ---
helm install loki grafana/loki \
  --set image.repository=localhost:5000/grafana/loki \
  --set image.tag=3.5.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/loki
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=loki
# Get logs:            kubectl logs -l app.kubernetes.io/instance=loki --all-containers


### Deployment Instructions for kong (Image: kong:3.9) ###
# --- Helm Install Command ---
helm install kong kong/kong \
  --set image.repository=localhost:5000/kong \
  --set image.tag=3.9

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kong
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kong
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kong --all-containers


### Deployment Instructions for redis (Image: ecr-public.aws.com/docker/library/redis:7.2.8-alpine) ###
# --- Helm Install Command ---
helm install redis bitnami/redis \
  --set image.repository=localhost:5000/ecr-public.aws.com/docker/library/redis \
  --set image.tag=7.2.8-alpine

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/redis
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=redis
# Get logs:            kubectl logs -l app.kubernetes.io/instance=redis --all-containers


### Note for Image: quay.io/argoprojlabs/argocd-extension-installer:v0.0.8 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/quay.io/argoprojlabs/argocd-extension-installer \
#            --set <image_path_override_tag>=v0.0.8

### Note for Image: ghcr.io/oliver006/redis_exporter:v1.74.0 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/ghcr.io/oliver006/redis_exporter \
#            --set <image_path_override_tag>=v1.74.0

### Note for Image: bitnami/kubectl:1.33.1-debian-12-r5 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/kubectl \
#            --set <image_path_override_tag>=1.33.1-debian-12-r5

### Note for Image: prom/memcached-exporter:v0.15.2 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/prom/memcached-exporter \
#            --set <image_path_override_tag>=v0.15.2

### Deployment Instructions for kafka (Image: bitnami/kafka:4.0.0-debian-12-r7) ###
# --- Helm Install Command ---
helm install kafka bitnami/kafka \
  --set image.repository=localhost:5000/bitnami/kafka \
  --set image.tag=4.0.0-debian-12-r7

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kafka
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kafka
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kafka --all-containers


### Deployment Instructions for kong-ingress (Image: kong/kubernetes-ingress-controller:3.4) ###
# --- Helm Install Command ---
helm install kong-ingress kong/kubernetes-ingress-controller \
  --set image.repository=localhost:5000/kong/kubernetes-ingress-controller \
  --set image.tag=3.4

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kong-ingress
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kong-ingress
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kong-ingress --all-containers


### Note for Image: bitnami/os-shell:12-debian-12-r46 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/os-shell \
#            --set <image_path_override_tag>=12-debian-12-r46

### Note for Image: bitnami/os-shell:12-debian-12-r45 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/os-shell \
#            --set <image_path_override_tag>=12-debian-12-r45

### Deployment Instructions for zookeeper (Image: bitnami/zookeeper:3.9.3-debian-12-r16) ###
# --- Helm Install Command ---
helm install zookeeper bitnami/zookeeper \
  --set image.repository=localhost:5000/bitnami/zookeeper \
  --set image.tag=3.9.3-debian-12-r16

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/zookeeper
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=zookeeper
# Get logs:            kubectl logs -l app.kubernetes.io/instance=zookeeper --all-containers


### Note for Image: busybox:latest ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/busybox \
#            --set <image_path_override_tag>=latest

### Note for Image: grafana/enterprise-logs:3.5.1 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/grafana/enterprise-logs \
#            --set <image_path_override_tag>=3.5.1

### Note for Image: nginxinc/nginx-unprivileged:1.28-alpine ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/nginxinc/nginx-unprivileged \
#            --set <image_path_override_tag>=1.28-alpine

### Note for Image: grafana/loki-helm-test:ewelch-distributed-helm-chart-17db5ee ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/grafana/loki-helm-test \
#            --set <image_path_override_tag>=ewelch-distributed-helm-chart-17db5ee

### Deployment Instructions for dex (Image: ghcr.io/dexidp/dex:v2.43.1) ###
# --- Helm Install Command ---
helm install dex dexidp/dex \
  --set image.repository=localhost:5000/ghcr.io/dexidp/dex \
  --set image.tag=v2.43.1

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/dex
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=dex
# Get logs:            kubectl logs -l app.kubernetes.io/instance=dex --all-containers


### Deployment Instructions for memcached (Image: memcached:1.6.38-alpine) ###
# --- Helm Install Command ---
helm install memcached bitnami/memcached \
  --set image.repository=localhost:5000/memcached \
  --set image.tag=1.6.38-alpine

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/memcached
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=memcached
# Get logs:            kubectl logs -l app.kubernetes.io/instance=memcached --all-containers


echo '--- Deployment commands generation complete. Review /home/angel/HELIX/helm-deployment-commands.sh ---'

### Deployment Instructions for vault-k8s (Image: bitnami/vault-k8s:1.6.2-debian-12-r10) ###
# --- Helm Install Command ---
helm install vault-k8s bitnami/vault \
  --set server.image.repository=localhost:5000/bitnami/vault-k8s \
  --set server.image.tag=1.6.2-debian-12-r10

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/vault-k8s
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=vault-k8s
# Get logs:            kubectl logs -l app.kubernetes.io/instance=vault-k8s --all-containers


### Deployment Instructions for vault (Image: bitnami/vault:1.19.5-debian-12-r1) ###
# --- Helm Install Command ---
helm install vault bitnami/vault \
  --set server.image.repository=localhost:5000/bitnami/vault \
  --set server.image.tag=1.19.5-debian-12-r1

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/vault
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=vault
# Get logs:            kubectl logs -l app.kubernetes.io/instance=vault --all-containers

Note: 'rancher/mirrored-pause:3.6' is an infrastructure image (pause container).
# No direct Helm deployment command generated for rancher/mirrored-pause:3.6.

### Deployment Instructions for local-path-provisioner (Image: rancher/local-path-provisioner:v0.0.30) ###
# --- Helm Install Command ---
helm install local-path-provisioner rancher/local-path-provisioner \
  --set image.repository=localhost:5000/rancher/local-path-provisioner \
  --set image.tag=v0.0.30

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/local-path-provisioner
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=local-path-provisioner
# Get logs:            kubectl logs -l app.kubernetes.io/instance=local-path-provisioner --all-containers

kubectl run busybox-test --rm -it --image=localhost:5000/busybox:1.36.1 -- /bin/sh
# Helm deployment command for rancher/mirrored-library-busybox:1.36.1 (if applicable):

### Deployment Instructions for busybox (Image: rancher/mirrored-library-busybox:1.36.1) ###
# --- Helm Install Command ---
helm install busybox library/busybox \
  --set image.repository=localhost:5000/rancher/mirrored-library-busybox \
  --set image.tag=1.36.1

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/busybox
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=busybox
# Get logs:            kubectl logs -l app.kubernetes.io/instance=busybox --all-containers


### Deployment Instructions for n8n (Image: n8nio/n8n:latest) ###
# --- Helm Install Command ---
helm install n8n n8nio/n8n \
  --set image.repository=localhost:5000/n8nio/n8n \
  --set image.tag=latest

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/n8n
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=n8n
# Get logs:            kubectl logs -l app.kubernetes.io/instance=n8n --all-containers


### Note for Image: rancher/mirrored-coredns-coredns:1.12.0 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/rancher/mirrored-coredns-coredns \
#            --set <image_path_override_tag>=1.12.0

### Note for Image: rancher/mirrored-metrics-server:v0.7.2 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/rancher/mirrored-metrics-server \
#            --set <image_path_override_tag>=v0.7.2

### Note for Image: bitnami/minio:2025.5.24-debian-12-r5 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/minio \
#            --set <image_path_override_tag>=2025.5.24-debian-12-r5

### Note for Image: bitnami/minio-object-browser:2.0.1-debian-12-r1 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/minio-object-browser \
#            --set <image_path_override_tag>=2.0.1-debian-12-r1

### Deployment Instructions for kube-prom-stack (Image: quay.io/prometheus/prometheus:v2.52.0) ###
# --- Helm Install Command ---
helm install kube-prom-stack prometheus-community/kube-prometheus-stack \
  --set prometheus.prometheusSpec.image.repository=localhost:5000/quay.io/prometheus/prometheus \
  --set prometheus.prometheusSpec.image.tag=v2.52.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kube-prom-stack
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kube-prom-stack
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kube-prom-stack --all-containers


### Deployment Instructions for kube-prom-stack (Image: quay.io/prometheus/alertmanager:v0.27.0) ###
# --- Helm Install Command ---
helm install kube-prom-stack prometheus-community/kube-prometheus-stack \
  --set alertmanager.alertmanagerSpec.image.repository=localhost:5000/quay.io/prometheus/alertmanager \
  --set alertmanager.alertmanagerSpec.image.tag=v0.27.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kube-prom-stack
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kube-prom-stack
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kube-prom-stack --all-containers


### Note for Image: quay.io/thanos/thanos:v0.32.2 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/quay.io/thanos/thanos \
#            --set <image_path_override_tag>=v0.32.2

### Note for Image: quay.io/prometheus-operator/prometheus-operator:v0.74.0 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/quay.io/prometheus-operator/prometheus-operator \
#            --set <image_path_override_tag>=v0.74.0

### Note for Image: quay.io/prometheus-operator/prometheus-config-reloader:v0.74.0 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/quay.io/prometheus-operator/prometheus-config-reloader \
#            --set <image_path_override_tag>=v0.74.0

### Deployment Instructions for kube-prom-stack (Image: quay.io/prometheus/node-exporter:v1.7.0) ###
# --- Helm Install Command ---
helm install kube-prom-stack prometheus-community/kube-prometheus-stack \
  --set nodeExporter.image.repository=localhost:5000/quay.io/prometheus/node-exporter \
  --set nodeExporter.image.tag=v1.7.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kube-prom-stack
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kube-prom-stack
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kube-prom-stack --all-containers


### Deployment Instructions for kube-prom-stack (Image: registry.k8s.io/kube-state-metrics/kube-state-metrics:v2.11.0) ###
# --- Helm Install Command ---
helm install kube-prom-stack prometheus-community/kube-prometheus-stack \
  --set kube-state-metrics.image.repository=localhost:5000/registry.k8s.io/kube-state-metrics/kube-state-metrics \
  --set kube-state-metrics.image.tag=v2.11.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kube-prom-stack
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kube-prom-stack
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kube-prom-stack --all-containers


### Note for Image: bitnami/jmx-exporter:1.3.0-debian-12-r3 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/jmx-exporter \
#            --set <image_path_override_tag>=1.3.0-debian-12-r3

### Note for Image: kiwigrid/k8s-sidecar:1.30.3 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/kiwigrid/k8s-sidecar \
#            --set <image_path_override_tag>=1.30.3

### Deployment Instructions for loki (Image: grafana/loki:3.5.0) ###
# --- Helm Install Command ---
helm install loki grafana/loki \
  --set image.repository=localhost:5000/grafana/loki \
  --set image.tag=3.5.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/loki
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=loki
# Get logs:            kubectl logs -l app.kubernetes.io/instance=loki --all-containers


### Deployment Instructions for kong (Image: kong:3.9) ###
# --- Helm Install Command ---
helm install kong kong/kong \
  --set image.repository=localhost:5000/kong \
  --set image.tag=3.9

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kong
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kong
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kong --all-containers


### Deployment Instructions for redis (Image: ecr-public.aws.com/docker/library/redis:7.2.8-alpine) ###
# --- Helm Install Command ---
helm install redis bitnami/redis \
  --set image.repository=localhost:5000/ecr-public.aws.com/docker/library/redis \
  --set image.tag=7.2.8-alpine

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/redis
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=redis
# Get logs:            kubectl logs -l app.kubernetes.io/instance=redis --all-containers


### Note for Image: quay.io/argoprojlabs/argocd-extension-installer:v0.0.8 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/quay.io/argoprojlabs/argocd-extension-installer \
#            --set <image_path_override_tag>=v0.0.8

### Note for Image: ghcr.io/oliver006/redis_exporter:v1.74.0 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/ghcr.io/oliver006/redis_exporter \
#            --set <image_path_override_tag>=v1.74.0

### Note for Image: bitnami/kubectl:1.33.1-debian-12-r5 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/kubectl \
#            --set <image_path_override_tag>=1.33.1-debian-12-r5

### Note for Image: prom/memcached-exporter:v0.15.2 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/prom/memcached-exporter \
#            --set <image_path_override_tag>=v0.15.2

### Deployment Instructions for kafka (Image: bitnami/kafka:4.0.0-debian-12-r7) ###
# --- Helm Install Command ---
helm install kafka bitnami/kafka \
  --set image.repository=localhost:5000/bitnami/kafka \
  --set image.tag=4.0.0-debian-12-r7

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kafka
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kafka
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kafka --all-containers


### Deployment Instructions for kong-ingress (Image: kong/kubernetes-ingress-controller:3.4) ###
# --- Helm Install Command ---
helm install kong-ingress kong/kubernetes-ingress-controller \
  --set image.repository=localhost:5000/kong/kubernetes-ingress-controller \
  --set image.tag=3.4

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kong-ingress
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kong-ingress
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kong-ingress --all-containers


### Note for Image: bitnami/os-shell:12-debian-12-r46 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/os-shell \
#            --set <image_path_override_tag>=12-debian-12-r46

### Note for Image: bitnami/os-shell:12-debian-12-r45 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/os-shell \
#            --set <image_path_override_tag>=12-debian-12-r45

### Deployment Instructions for zookeeper (Image: bitnami/zookeeper:3.9.3-debian-12-r16) ###
# --- Helm Install Command ---
helm install zookeeper bitnami/zookeeper \
  --set image.repository=localhost:5000/bitnami/zookeeper \
  --set image.tag=3.9.3-debian-12-r16

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/zookeeper
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=zookeeper
# Get logs:            kubectl logs -l app.kubernetes.io/instance=zookeeper --all-containers


### Note for Image: busybox:latest ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/busybox \
#            --set <image_path_override_tag>=latest

### Note for Image: grafana/enterprise-logs:3.5.1 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/grafana/enterprise-logs \
#            --set <image_path_override_tag>=3.5.1

### Note for Image: nginxinc/nginx-unprivileged:1.28-alpine ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/nginxinc/nginx-unprivileged \
#            --set <image_path_override_tag>=1.28-alpine

### Note for Image: grafana/loki-helm-test:ewelch-distributed-helm-chart-17db5ee ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/grafana/loki-helm-test \
#            --set <image_path_override_tag>=ewelch-distributed-helm-chart-17db5ee

### Deployment Instructions for dex (Image: ghcr.io/dexidp/dex:v2.43.1) ###
# --- Helm Install Command ---
helm install dex dexidp/dex \
  --set image.repository=localhost:5000/ghcr.io/dexidp/dex \
  --set image.tag=v2.43.1

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/dex
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=dex
# Get logs:            kubectl logs -l app.kubernetes.io/instance=dex --all-containers


### Deployment Instructions for memcached (Image: memcached:1.6.38-alpine) ###
# --- Helm Install Command ---
helm install memcached bitnami/memcached \
  --set image.repository=localhost:5000/memcached \
  --set image.tag=1.6.38-alpine

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/memcached
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=memcached
# Get logs:            kubectl logs -l app.kubernetes.io/instance=memcached --all-containers


### Note for Image: kiwigrid/k8s-sidecar:1.30.3 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/kiwigrid/k8s-sidecar \
#            --set <image_path_override_tag>=1.30.3

### Deployment Instructions for loki (Image: grafana/loki:3.5.0) ###
# --- Helm Install Command ---
helm install loki grafana/loki \
  --set image.repository=localhost:5000/grafana/loki \
  --set image.tag=3.5.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/loki
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=loki
# Get logs:            kubectl logs -l app.kubernetes.io/instance=loki --all-containers


### Deployment Instructions for kong (Image: kong:3.9) ###
# --- Helm Install Command ---
helm install kong kong/kong \
  --set image.repository=localhost:5000/kong \
  --set image.tag=3.9

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kong
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kong
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kong --all-containers


### Deployment Instructions for redis (Image: ecr-public.aws.com/docker/library/redis:7.2.8-alpine) ###
# --- Helm Install Command ---
helm install redis bitnami/redis \
  --set image.repository=localhost:5000/ecr-public.aws.com/docker/library/redis \
  --set image.tag=7.2.8-alpine

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/redis
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=redis
# Get logs:            kubectl logs -l app.kubernetes.io/instance=redis --all-containers


### Note for Image: quay.io/argoprojlabs/argocd-extension-installer:v0.0.8 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/quay.io/argoprojlabs/argocd-extension-installer \
#            --set <image_path_override_tag>=v0.0.8

### Note for Image: ghcr.io/oliver006/redis_exporter:v1.74.0 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/ghcr.io/oliver006/redis_exporter \
#            --set <image_path_override_tag>=v1.74.0

### Note for Image: prom/memcached-exporter:v0.15.2 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/prom/memcached-exporter \
#            --set <image_path_override_tag>=v0.15.2

### Deployment Instructions for kong-ingress (Image: kong/kubernetes-ingress-controller:3.4) ###
# --- Helm Install Command ---
helm install kong-ingress kong/kubernetes-ingress-controller \
  --set image.repository=localhost:5000/kong/kubernetes-ingress-controller \
  --set image.tag=3.4

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kong-ingress
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kong-ingress
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kong-ingress --all-containers


### Note for Image: busybox:latest ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/busybox \
#            --set <image_path_override_tag>=latest

### Note for Image: grafana/enterprise-logs:3.5.1 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/grafana/enterprise-logs \
#            --set <image_path_override_tag>=3.5.1

### Note for Image: nginxinc/nginx-unprivileged:1.28-alpine ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/nginxinc/nginx-unprivileged \
#            --set <image_path_override_tag>=1.28-alpine

### Note for Image: grafana/loki-helm-test:ewelch-distributed-helm-chart-17db5ee ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/grafana/loki-helm-test \
#            --set <image_path_override_tag>=ewelch-distributed-helm-chart-17db5ee

### Deployment Instructions for dex (Image: ghcr.io/dexidp/dex:v2.43.1) ###
# --- Helm Install Command ---
helm install dex dexidp/dex \
  --set image.repository=localhost:5000/ghcr.io/dexidp/dex \
  --set image.tag=v2.43.1

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/dex
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=dex
# Get logs:            kubectl logs -l app.kubernetes.io/instance=dex --all-containers


### Deployment Instructions for memcached (Image: memcached:1.6.38-alpine) ###
# --- Helm Install Command ---
helm install memcached bitnami/memcached \
  --set image.repository=localhost:5000/memcached \
  --set image.tag=1.6.38-alpine

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/memcached
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=memcached
# Get logs:            kubectl logs -l app.kubernetes.io/instance=memcached --all-containers


echo '--- Deployment commands generation complete. Review /home/angel/HELIX/helm-deployment-commands.sh ---'

### Deployment Instructions for vault-k8s (Image: bitnami/vault-k8s:1.6.2-debian-12-r10) ###
# --- Helm Install Command ---
helm install vault-k8s bitnami/vault \
  --set server.image.repository=localhost:5000/bitnami/vault-k8s \
  --set server.image.tag=1.6.2-debian-12-r10

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/vault-k8s
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=vault-k8s
# Get logs:            kubectl logs -l app.kubernetes.io/instance=vault-k8s --all-containers


### Deployment Instructions for vault (Image: bitnami/vault:1.19.5-debian-12-r1) ###
# --- Helm Install Command ---
helm install vault bitnami/vault \
  --set server.image.repository=localhost:5000/bitnami/vault \
  --set server.image.tag=1.19.5-debian-12-r1

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/vault
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=vault
# Get logs:            kubectl logs -l app.kubernetes.io/instance=vault --all-containers

Note: 'rancher/mirrored-pause:3.6' is an infrastructure image (pause container).
# No direct Helm deployment command generated for rancher/mirrored-pause:3.6.

### Deployment Instructions for local-path-provisioner (Image: rancher/local-path-provisioner:v0.0.30) ###
# --- Helm Install Command ---
helm install local-path-provisioner rancher/local-path-provisioner \
  --set image.repository=localhost:5000/rancher/local-path-provisioner \
  --set image.tag=v0.0.30

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/local-path-provisioner
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=local-path-provisioner
# Get logs:            kubectl logs -l app.kubernetes.io/instance=local-path-provisioner --all-containers

kubectl run busybox-test --rm -it --image=localhost:5000/busybox:1.36.1 -- /bin/sh
# Helm deployment command for rancher/mirrored-library-busybox:1.36.1 (if applicable):

### Deployment Instructions for busybox (Image: rancher/mirrored-library-busybox:1.36.1) ###
# --- Helm Install Command ---
helm install busybox library/busybox \
  --set image.repository=localhost:5000/rancher/mirrored-library-busybox \
  --set image.tag=1.36.1

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/busybox
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=busybox
# Get logs:            kubectl logs -l app.kubernetes.io/instance=busybox --all-containers


### Deployment Instructions for n8n (Image: n8nio/n8n:latest) ###
# --- Helm Install Command ---
helm install n8n n8nio/n8n \
  --set image.repository=localhost:5000/n8nio/n8n \
  --set image.tag=latest

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/n8n
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=n8n
# Get logs:            kubectl logs -l app.kubernetes.io/instance=n8n --all-containers


### Note for Image: rancher/mirrored-coredns-coredns:1.12.0 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/rancher/mirrored-coredns-coredns \
#            --set <image_path_override_tag>=1.12.0

### Note for Image: rancher/mirrored-metrics-server:v0.7.2 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/rancher/mirrored-metrics-server \
#            --set <image_path_override_tag>=v0.7.2

### Note for Image: bitnami/minio:2025.5.24-debian-12-r5 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/minio \
#            --set <image_path_override_tag>=2025.5.24-debian-12-r5

### Note for Image: bitnami/minio-object-browser:2.0.1-debian-12-r1 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/minio-object-browser \
#            --set <image_path_override_tag>=2.0.1-debian-12-r1

### Deployment Instructions for kube-prom-stack (Image: quay.io/prometheus/prometheus:v2.52.0) ###
# --- Helm Install Command ---
helm install kube-prom-stack prometheus-community/kube-prometheus-stack \
  --set prometheus.prometheusSpec.image.repository=localhost:5000/quay.io/prometheus/prometheus \
  --set prometheus.prometheusSpec.image.tag=v2.52.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kube-prom-stack
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kube-prom-stack
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kube-prom-stack --all-containers


### Deployment Instructions for kube-prom-stack (Image: quay.io/prometheus/alertmanager:v0.27.0) ###
# --- Helm Install Command ---
helm install kube-prom-stack prometheus-community/kube-prometheus-stack \
  --set alertmanager.alertmanagerSpec.image.repository=localhost:5000/quay.io/prometheus/alertmanager \
  --set alertmanager.alertmanagerSpec.image.tag=v0.27.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kube-prom-stack
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kube-prom-stack
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kube-prom-stack --all-containers


### Note for Image: quay.io/thanos/thanos:v0.32.2 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/quay.io/thanos/thanos \
#            --set <image_path_override_tag>=v0.32.2

### Note for Image: quay.io/prometheus-operator/prometheus-operator:v0.74.0 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/quay.io/prometheus-operator/prometheus-operator \
#            --set <image_path_override_tag>=v0.74.0

### Note for Image: quay.io/prometheus-operator/prometheus-config-reloader:v0.74.0 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/quay.io/prometheus-operator/prometheus-config-reloader \
#            --set <image_path_override_tag>=v0.74.0

### Deployment Instructions for kube-prom-stack (Image: quay.io/prometheus/node-exporter:v1.7.0) ###
# --- Helm Install Command ---
helm install kube-prom-stack prometheus-community/kube-prometheus-stack \
  --set nodeExporter.image.repository=localhost:5000/quay.io/prometheus/node-exporter \
  --set nodeExporter.image.tag=v1.7.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kube-prom-stack
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kube-prom-stack
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kube-prom-stack --all-containers


### Deployment Instructions for kube-prom-stack (Image: registry.k8s.io/kube-state-metrics/kube-state-metrics:v2.11.0) ###
# --- Helm Install Command ---
helm install kube-prom-stack prometheus-community/kube-prometheus-stack \
  --set kube-state-metrics.image.repository=localhost:5000/registry.k8s.io/kube-state-metrics/kube-state-metrics \
  --set kube-state-metrics.image.tag=v2.11.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kube-prom-stack
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kube-prom-stack
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kube-prom-stack --all-containers


### Note for Image: bitnami/jmx-exporter:1.3.0-debian-12-r3 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/jmx-exporter \
#            --set <image_path_override_tag>=1.3.0-debian-12-r3

### Note for Image: kiwigrid/k8s-sidecar:1.30.3 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/kiwigrid/k8s-sidecar \
#            --set <image_path_override_tag>=1.30.3

### Deployment Instructions for vault-k8s (Image: bitnami/vault-k8s:1.6.2-debian-12-r10) ###
# --- Helm Install Command ---
helm install vault-k8s bitnami/vault \
  --set server.image.repository=localhost:5000/bitnami/vault-k8s \
  --set server.image.tag=1.6.2-debian-12-r10

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/vault-k8s
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=vault-k8s
# Get logs:            kubectl logs -l app.kubernetes.io/instance=vault-k8s --all-containers


### Deployment Instructions for vault (Image: bitnami/vault:1.19.5-debian-12-r1) ###
# --- Helm Install Command ---
helm install vault bitnami/vault \
  --set server.image.repository=localhost:5000/bitnami/vault \
  --set server.image.tag=1.19.5-debian-12-r1

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/vault
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=vault
# Get logs:            kubectl logs -l app.kubernetes.io/instance=vault --all-containers

Note: 'rancher/mirrored-pause:3.6' is an infrastructure image (pause container).
# No direct Helm deployment command generated for rancher/mirrored-pause:3.6.

### Deployment Instructions for local-path-provisioner (Image: rancher/local-path-provisioner:v0.0.30) ###
# --- Helm Install Command ---
helm install local-path-provisioner rancher/local-path-provisioner \
  --set image.repository=localhost:5000/rancher/local-path-provisioner \
  --set image.tag=v0.0.30

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/local-path-provisioner
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=local-path-provisioner
# Get logs:            kubectl logs -l app.kubernetes.io/instance=local-path-provisioner --all-containers

kubectl run busybox-test --rm -it --image=localhost:5000/busybox:1.36.1 -- /bin/sh
# Helm deployment command for rancher/mirrored-library-busybox:1.36.1 (if applicable):

### Deployment Instructions for busybox (Image: rancher/mirrored-library-busybox:1.36.1) ###
# --- Helm Install Command ---
helm install busybox library/busybox \
  --set image.repository=localhost:5000/rancher/mirrored-library-busybox \
  --set image.tag=1.36.1

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/busybox
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=busybox
# Get logs:            kubectl logs -l app.kubernetes.io/instance=busybox --all-containers


### Deployment Instructions for n8n (Image: n8nio/n8n:latest) ###
# --- Helm Install Command ---
helm install n8n n8nio/n8n \
  --set image.repository=localhost:5000/n8nio/n8n \
  --set image.tag=latest

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/n8n
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=n8n
# Get logs:            kubectl logs -l app.kubernetes.io/instance=n8n --all-containers


### Note for Image: rancher/mirrored-coredns-coredns:1.12.0 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/rancher/mirrored-coredns-coredns \
#            --set <image_path_override_tag>=1.12.0

### Note for Image: rancher/mirrored-metrics-server:v0.7.2 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/rancher/mirrored-metrics-server \
#            --set <image_path_override_tag>=v0.7.2

### Note for Image: bitnami/minio:2025.5.24-debian-12-r5 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/minio \
#            --set <image_path_override_tag>=2025.5.24-debian-12-r5

### Note for Image: bitnami/minio-object-browser:2.0.1-debian-12-r1 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/minio-object-browser \
#            --set <image_path_override_tag>=2.0.1-debian-12-r1

### Deployment Instructions for kube-prom-stack (Image: quay.io/prometheus/prometheus:v2.52.0) ###
# --- Helm Install Command ---
helm install kube-prom-stack prometheus-community/kube-prometheus-stack \
  --set prometheus.prometheusSpec.image.repository=localhost:5000/quay.io/prometheus/prometheus \
  --set prometheus.prometheusSpec.image.tag=v2.52.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kube-prom-stack
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kube-prom-stack
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kube-prom-stack --all-containers


### Deployment Instructions for kube-prom-stack (Image: quay.io/prometheus/alertmanager:v0.27.0) ###
# --- Helm Install Command ---
helm install kube-prom-stack prometheus-community/kube-prometheus-stack \
  --set alertmanager.alertmanagerSpec.image.repository=localhost:5000/quay.io/prometheus/alertmanager \
  --set alertmanager.alertmanagerSpec.image.tag=v0.27.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kube-prom-stack
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kube-prom-stack
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kube-prom-stack --all-containers


### Note for Image: quay.io/thanos/thanos:v0.32.2 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/quay.io/thanos/thanos \
#            --set <image_path_override_tag>=v0.32.2

### Note for Image: quay.io/prometheus-operator/prometheus-operator:v0.74.0 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/quay.io/prometheus-operator/prometheus-operator \
#            --set <image_path_override_tag>=v0.74.0

### Note for Image: quay.io/prometheus-operator/prometheus-config-reloader:v0.74.0 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/quay.io/prometheus-operator/prometheus-config-reloader \
#            --set <image_path_override_tag>=v0.74.0

### Deployment Instructions for kube-prom-stack (Image: quay.io/prometheus/node-exporter:v1.7.0) ###
# --- Helm Install Command ---
helm install kube-prom-stack prometheus-community/kube-prometheus-stack \
  --set nodeExporter.image.repository=localhost:5000/quay.io/prometheus/node-exporter \
  --set nodeExporter.image.tag=v1.7.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kube-prom-stack
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kube-prom-stack
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kube-prom-stack --all-containers


### Deployment Instructions for kube-prom-stack (Image: registry.k8s.io/kube-state-metrics/kube-state-metrics:v2.11.0) ###
# --- Helm Install Command ---
helm install kube-prom-stack prometheus-community/kube-prometheus-stack \
  --set kube-state-metrics.image.repository=localhost:5000/registry.k8s.io/kube-state-metrics/kube-state-metrics \
  --set kube-state-metrics.image.tag=v2.11.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kube-prom-stack
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kube-prom-stack
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kube-prom-stack --all-containers


### Note for Image: bitnami/jmx-exporter:1.3.0-debian-12-r3 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/jmx-exporter \
#            --set <image_path_override_tag>=1.3.0-debian-12-r3

### Note for Image: kiwigrid/k8s-sidecar:1.30.3 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/kiwigrid/k8s-sidecar \
#            --set <image_path_override_tag>=1.30.3

### Deployment Instructions for loki (Image: grafana/loki:3.5.0) ###
# --- Helm Install Command ---
helm install loki grafana/loki \
  --set image.repository=localhost:5000/grafana/loki \
  --set image.tag=3.5.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/loki
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=loki
# Get logs:            kubectl logs -l app.kubernetes.io/instance=loki --all-containers


### Deployment Instructions for kong (Image: kong:3.9) ###
# --- Helm Install Command ---
helm install kong kong/kong \
  --set image.repository=localhost:5000/kong \
  --set image.tag=3.9

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kong
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kong
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kong --all-containers


### Deployment Instructions for redis (Image: ecr-public.aws.com/docker/library/redis:7.2.8-alpine) ###
# --- Helm Install Command ---
helm install redis bitnami/redis \
  --set image.repository=localhost:5000/ecr-public.aws.com/docker/library/redis \
  --set image.tag=7.2.8-alpine

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/redis
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=redis
# Get logs:            kubectl logs -l app.kubernetes.io/instance=redis --all-containers


### Note for Image: quay.io/argoprojlabs/argocd-extension-installer:v0.0.8 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/quay.io/argoprojlabs/argocd-extension-installer \
#            --set <image_path_override_tag>=v0.0.8

### Note for Image: ghcr.io/oliver006/redis_exporter:v1.74.0 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/ghcr.io/oliver006/redis_exporter \
#            --set <image_path_override_tag>=v1.74.0

### Note for Image: bitnami/kubectl:1.33.1-debian-12-r5 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/kubectl \
#            --set <image_path_override_tag>=1.33.1-debian-12-r5

### Note for Image: prom/memcached-exporter:v0.15.2 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/prom/memcached-exporter \
#            --set <image_path_override_tag>=v0.15.2

### Deployment Instructions for kafka (Image: bitnami/kafka:4.0.0-debian-12-r7) ###
# --- Helm Install Command ---
helm install kafka bitnami/kafka \
  --set image.repository=localhost:5000/bitnami/kafka \
  --set image.tag=4.0.0-debian-12-r7

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kafka
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kafka
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kafka --all-containers


### Deployment Instructions for kong-ingress (Image: kong/kubernetes-ingress-controller:3.4) ###
# --- Helm Install Command ---
helm install kong-ingress kong/kubernetes-ingress-controller \
  --set image.repository=localhost:5000/kong/kubernetes-ingress-controller \
  --set image.tag=3.4

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kong-ingress
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kong-ingress
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kong-ingress --all-containers


### Note for Image: bitnami/os-shell:12-debian-12-r46 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/os-shell \
#            --set <image_path_override_tag>=12-debian-12-r46

### Note for Image: bitnami/os-shell:12-debian-12-r45 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/os-shell \
#            --set <image_path_override_tag>=12-debian-12-r45

### Note for Image: bitnami/redis:8.0.2-debian-12-r0 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/redis \
#            --set <image_path_override_tag>=8.0.2-debian-12-r0

### Deployment Instructions for vault-k8s (Image: bitnami/vault-k8s:1.6.2-debian-12-r10) ###
# --- Helm Install Command ---
helm install vault-k8s bitnami/vault \
  --set server.image.repository=localhost:5000/bitnami/vault-k8s \
  --set server.image.tag=1.6.2-debian-12-r10

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/vault-k8s
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=vault-k8s
# Get logs:            kubectl logs -l app.kubernetes.io/instance=vault-k8s --all-containers


### Deployment Instructions for vault (Image: bitnami/vault:1.19.5-debian-12-r1) ###
# --- Helm Install Command ---
helm install vault bitnami/vault \
  --set server.image.repository=localhost:5000/bitnami/vault \
  --set server.image.tag=1.19.5-debian-12-r1

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/vault
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=vault
# Get logs:            kubectl logs -l app.kubernetes.io/instance=vault --all-containers

Note: 'rancher/mirrored-pause:3.6' is an infrastructure image (pause container).
# No direct Helm deployment command generated for rancher/mirrored-pause:3.6.

### Deployment Instructions for local-path-provisioner (Image: rancher/local-path-provisioner:v0.0.30) ###
# --- Helm Install Command ---
helm install local-path-provisioner rancher/local-path-provisioner \
  --set image.repository=localhost:5000/rancher/local-path-provisioner \
  --set image.tag=v0.0.30

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/local-path-provisioner
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=local-path-provisioner
# Get logs:            kubectl logs -l app.kubernetes.io/instance=local-path-provisioner --all-containers

kubectl run busybox-test --rm -it --image=localhost:5000/busybox:1.36.1 -- /bin/sh
# Helm deployment command for rancher/mirrored-library-busybox:1.36.1 (if applicable):

### Deployment Instructions for busybox (Image: rancher/mirrored-library-busybox:1.36.1) ###
# --- Helm Install Command ---
helm install busybox library/busybox \
  --set image.repository=localhost:5000/rancher/mirrored-library-busybox \
  --set image.tag=1.36.1

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/busybox
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=busybox
# Get logs:            kubectl logs -l app.kubernetes.io/instance=busybox --all-containers


### Deployment Instructions for n8n (Image: n8nio/n8n:latest) ###
# --- Helm Install Command ---
helm install n8n n8nio/n8n \
  --set image.repository=localhost:5000/n8nio/n8n \
  --set image.tag=latest

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/n8n
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=n8n
# Get logs:            kubectl logs -l app.kubernetes.io/instance=n8n --all-containers


### Note for Image: rancher/mirrored-coredns-coredns:1.12.0 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/rancher/mirrored-coredns-coredns \
#            --set <image_path_override_tag>=1.12.0

### Note for Image: rancher/mirrored-metrics-server:v0.7.2 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/rancher/mirrored-metrics-server \
#            --set <image_path_override_tag>=v0.7.2

### Note for Image: bitnami/minio:2025.5.24-debian-12-r5 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/minio \
#            --set <image_path_override_tag>=2025.5.24-debian-12-r5

### Note for Image: bitnami/minio-object-browser:2.0.1-debian-12-r1 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/minio-object-browser \
#            --set <image_path_override_tag>=2.0.1-debian-12-r1

### Deployment Instructions for kube-prom-stack (Image: quay.io/prometheus/prometheus:v2.52.0) ###
# --- Helm Install Command ---
helm install kube-prom-stack prometheus-community/kube-prometheus-stack \
  --set prometheus.prometheusSpec.image.repository=localhost:5000/quay.io/prometheus/prometheus \
  --set prometheus.prometheusSpec.image.tag=v2.52.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kube-prom-stack
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kube-prom-stack
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kube-prom-stack --all-containers


### Deployment Instructions for kube-prom-stack (Image: quay.io/prometheus/alertmanager:v0.27.0) ###
# --- Helm Install Command ---
helm install kube-prom-stack prometheus-community/kube-prometheus-stack \
  --set alertmanager.alertmanagerSpec.image.repository=localhost:5000/quay.io/prometheus/alertmanager \
  --set alertmanager.alertmanagerSpec.image.tag=v0.27.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kube-prom-stack
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kube-prom-stack
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kube-prom-stack --all-containers


### Note for Image: quay.io/thanos/thanos:v0.32.2 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/quay.io/thanos/thanos \
#            --set <image_path_override_tag>=v0.32.2

### Note for Image: quay.io/prometheus-operator/prometheus-operator:v0.74.0 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/quay.io/prometheus-operator/prometheus-operator \
#            --set <image_path_override_tag>=v0.74.0

### Note for Image: quay.io/prometheus-operator/prometheus-config-reloader:v0.74.0 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/quay.io/prometheus-operator/prometheus-config-reloader \
#            --set <image_path_override_tag>=v0.74.0

### Deployment Instructions for kube-prom-stack (Image: quay.io/prometheus/node-exporter:v1.7.0) ###
# --- Helm Install Command ---
helm install kube-prom-stack prometheus-community/kube-prometheus-stack \
  --set nodeExporter.image.repository=localhost:5000/quay.io/prometheus/node-exporter \
  --set nodeExporter.image.tag=v1.7.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kube-prom-stack
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kube-prom-stack
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kube-prom-stack --all-containers


### Deployment Instructions for kube-prom-stack (Image: registry.k8s.io/kube-state-metrics/kube-state-metrics:v2.11.0) ###
# --- Helm Install Command ---
helm install kube-prom-stack prometheus-community/kube-prometheus-stack \
  --set kube-state-metrics.image.repository=localhost:5000/registry.k8s.io/kube-state-metrics/kube-state-metrics \
  --set kube-state-metrics.image.tag=v2.11.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kube-prom-stack
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kube-prom-stack
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kube-prom-stack --all-containers


### Note for Image: bitnami/jmx-exporter:1.3.0-debian-12-r3 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/jmx-exporter \
#            --set <image_path_override_tag>=1.3.0-debian-12-r3

### Note for Image: kiwigrid/k8s-sidecar:1.30.3 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/kiwigrid/k8s-sidecar \
#            --set <image_path_override_tag>=1.30.3

### Deployment Instructions for loki (Image: grafana/loki:3.5.0) ###
# --- Helm Install Command ---
helm install loki grafana/loki \
  --set image.repository=localhost:5000/grafana/loki \
  --set image.tag=3.5.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/loki
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=loki
# Get logs:            kubectl logs -l app.kubernetes.io/instance=loki --all-containers


### Deployment Instructions for kong (Image: kong:3.9) ###
# --- Helm Install Command ---
helm install kong kong/kong \
  --set image.repository=localhost:5000/kong \
  --set image.tag=3.9

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kong
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kong
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kong --all-containers


### Deployment Instructions for redis (Image: ecr-public.aws.com/docker/library/redis:7.2.8-alpine) ###
# --- Helm Install Command ---
helm install redis bitnami/redis \
  --set image.repository=localhost:5000/ecr-public.aws.com/docker/library/redis \
  --set image.tag=7.2.8-alpine

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/redis
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=redis
# Get logs:            kubectl logs -l app.kubernetes.io/instance=redis --all-containers


### Note for Image: quay.io/argoprojlabs/argocd-extension-installer:v0.0.8 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/quay.io/argoprojlabs/argocd-extension-installer \
#            --set <image_path_override_tag>=v0.0.8

### Note for Image: ghcr.io/oliver006/redis_exporter:v1.74.0 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/ghcr.io/oliver006/redis_exporter \
#            --set <image_path_override_tag>=v1.74.0

### Note for Image: bitnami/kubectl:1.33.1-debian-12-r5 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/kubectl \
#            --set <image_path_override_tag>=1.33.1-debian-12-r5

### Note for Image: prom/memcached-exporter:v0.15.2 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/prom/memcached-exporter \
#            --set <image_path_override_tag>=v0.15.2

### Deployment Instructions for kafka (Image: bitnami/kafka:4.0.0-debian-12-r7) ###
# --- Helm Install Command ---
helm install kafka bitnami/kafka \
  --set image.repository=localhost:5000/bitnami/kafka \
  --set image.tag=4.0.0-debian-12-r7

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kafka
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kafka
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kafka --all-containers


### Deployment Instructions for kong-ingress (Image: kong/kubernetes-ingress-controller:3.4) ###
# --- Helm Install Command ---
helm install kong-ingress kong/kubernetes-ingress-controller \
  --set image.repository=localhost:5000/kong/kubernetes-ingress-controller \
  --set image.tag=3.4

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kong-ingress
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kong-ingress
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kong-ingress --all-containers


### Note for Image: bitnami/os-shell:12-debian-12-r46 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/os-shell \
#            --set <image_path_override_tag>=12-debian-12-r46

### Note for Image: bitnami/os-shell:12-debian-12-r45 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/os-shell \
#            --set <image_path_override_tag>=12-debian-12-r45

### Deployment Instructions for zookeeper (Image: bitnami/zookeeper:3.9.3-debian-12-r16) ###
# --- Helm Install Command ---
helm install zookeeper bitnami/zookeeper \
  --set image.repository=localhost:5000/bitnami/zookeeper \
  --set image.tag=3.9.3-debian-12-r16

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/zookeeper
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=zookeeper
# Get logs:            kubectl logs -l app.kubernetes.io/instance=zookeeper --all-containers


### Note for Image: busybox:latest ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/busybox \
#            --set <image_path_override_tag>=latest

### Note for Image: grafana/enterprise-logs:3.5.1 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/grafana/enterprise-logs \
#            --set <image_path_override_tag>=3.5.1

### Note for Image: nginxinc/nginx-unprivileged:1.28-alpine ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/nginxinc/nginx-unprivileged \
#            --set <image_path_override_tag>=1.28-alpine

### Note for Image: grafana/loki-helm-test:ewelch-distributed-helm-chart-17db5ee ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/grafana/loki-helm-test \
#            --set <image_path_override_tag>=ewelch-distributed-helm-chart-17db5ee

### Deployment Instructions for dex (Image: ghcr.io/dexidp/dex:v2.43.1) ###
# --- Helm Install Command ---
helm install dex dexidp/dex \
  --set image.repository=localhost:5000/ghcr.io/dexidp/dex \
  --set image.tag=v2.43.1

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/dex
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=dex
# Get logs:            kubectl logs -l app.kubernetes.io/instance=dex --all-containers


### Deployment Instructions for memcached (Image: memcached:1.6.38-alpine) ###
# --- Helm Install Command ---
helm install memcached bitnami/memcached \
  --set image.repository=localhost:5000/memcached \
  --set image.tag=1.6.38-alpine

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/memcached
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=memcached
# Get logs:            kubectl logs -l app.kubernetes.io/instance=memcached --all-containers


### Note for Image: bitnami/redis:8.0.2-debian-12-r0 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/redis \
#            --set <image_path_override_tag>=8.0.2-debian-12-r0

### Deployment Instructions for vault-k8s (Image: bitnami/vault-k8s:1.6.2-debian-12-r10) ###
# --- Helm Install Command ---
helm install vault-k8s bitnami/vault \
  --set server.image.repository=localhost:5000/bitnami/vault-k8s \
  --set server.image.tag=1.6.2-debian-12-r10

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/vault-k8s
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=vault-k8s
# Get logs:            kubectl logs -l app.kubernetes.io/instance=vault-k8s --all-containers


### Deployment Instructions for vault (Image: bitnami/vault:1.19.5-debian-12-r1) ###
# --- Helm Install Command ---
helm install vault bitnami/vault \
  --set server.image.repository=localhost:5000/bitnami/vault \
  --set server.image.tag=1.19.5-debian-12-r1

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/vault
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=vault
# Get logs:            kubectl logs -l app.kubernetes.io/instance=vault --all-containers

Note: 'rancher/mirrored-pause:3.6' is an infrastructure image (pause container).
# No direct Helm deployment command generated for rancher/mirrored-pause:3.6.

### Deployment Instructions for local-path-provisioner (Image: rancher/local-path-provisioner:v0.0.30) ###
# --- Helm Install Command ---
helm install local-path-provisioner rancher/local-path-provisioner \
  --set image.repository=localhost:5000/rancher/local-path-provisioner \
  --set image.tag=v0.0.30

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/local-path-provisioner
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=local-path-provisioner
# Get logs:            kubectl logs -l app.kubernetes.io/instance=local-path-provisioner --all-containers

kubectl run busybox-test --rm -it --image=localhost:5000/busybox:1.36.1 -- /bin/sh
# Helm deployment command for rancher/mirrored-library-busybox:1.36.1 (if applicable):

### Deployment Instructions for busybox (Image: rancher/mirrored-library-busybox:1.36.1) ###
# --- Helm Install Command ---
helm install busybox library/busybox \
  --set image.repository=localhost:5000/rancher/mirrored-library-busybox \
  --set image.tag=1.36.1

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/busybox
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=busybox
# Get logs:            kubectl logs -l app.kubernetes.io/instance=busybox --all-containers


### Deployment Instructions for n8n (Image: n8nio/n8n:latest) ###
# --- Helm Install Command ---
helm install n8n n8nio/n8n \
  --set image.repository=localhost:5000/n8nio/n8n \
  --set image.tag=latest

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/n8n
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=n8n
# Get logs:            kubectl logs -l app.kubernetes.io/instance=n8n --all-containers


### Note for Image: rancher/mirrored-coredns-coredns:1.12.0 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/rancher/mirrored-coredns-coredns \
#            --set <image_path_override_tag>=1.12.0

### Note for Image: rancher/mirrored-metrics-server:v0.7.2 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/rancher/mirrored-metrics-server \
#            --set <image_path_override_tag>=v0.7.2

### Note for Image: bitnami/minio:2025.5.24-debian-12-r5 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/minio \
#            --set <image_path_override_tag>=2025.5.24-debian-12-r5

### Note for Image: bitnami/minio-object-browser:2.0.1-debian-12-r1 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/minio-object-browser \
#            --set <image_path_override_tag>=2.0.1-debian-12-r1

### Deployment Instructions for kube-prom-stack (Image: quay.io/prometheus/prometheus:v2.52.0) ###
# --- Helm Install Command ---
helm install kube-prom-stack prometheus-community/kube-prometheus-stack \
  --set prometheus.prometheusSpec.image.repository=localhost:5000/quay.io/prometheus/prometheus \
  --set prometheus.prometheusSpec.image.tag=v2.52.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kube-prom-stack
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kube-prom-stack
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kube-prom-stack --all-containers


### Deployment Instructions for kube-prom-stack (Image: quay.io/prometheus/alertmanager:v0.27.0) ###
# --- Helm Install Command ---
helm install kube-prom-stack prometheus-community/kube-prometheus-stack \
  --set alertmanager.alertmanagerSpec.image.repository=localhost:5000/quay.io/prometheus/alertmanager \
  --set alertmanager.alertmanagerSpec.image.tag=v0.27.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kube-prom-stack
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kube-prom-stack
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kube-prom-stack --all-containers


### Note for Image: quay.io/thanos/thanos:v0.32.2 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/quay.io/thanos/thanos \
#            --set <image_path_override_tag>=v0.32.2

### Note for Image: quay.io/prometheus-operator/prometheus-operator:v0.74.0 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/quay.io/prometheus-operator/prometheus-operator \
#            --set <image_path_override_tag>=v0.74.0

### Note for Image: quay.io/prometheus-operator/prometheus-config-reloader:v0.74.0 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/quay.io/prometheus-operator/prometheus-config-reloader \
#            --set <image_path_override_tag>=v0.74.0

### Deployment Instructions for kube-prom-stack (Image: quay.io/prometheus/node-exporter:v1.7.0) ###
# --- Helm Install Command ---
helm install kube-prom-stack prometheus-community/kube-prometheus-stack \
  --set nodeExporter.image.repository=localhost:5000/quay.io/prometheus/node-exporter \
  --set nodeExporter.image.tag=v1.7.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kube-prom-stack
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kube-prom-stack
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kube-prom-stack --all-containers


### Deployment Instructions for kube-prom-stack (Image: registry.k8s.io/kube-state-metrics/kube-state-metrics:v2.11.0) ###
# --- Helm Install Command ---
helm install kube-prom-stack prometheus-community/kube-prometheus-stack \
  --set kube-state-metrics.image.repository=localhost:5000/registry.k8s.io/kube-state-metrics/kube-state-metrics \
  --set kube-state-metrics.image.tag=v2.11.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kube-prom-stack
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kube-prom-stack
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kube-prom-stack --all-containers


### Note for Image: bitnami/jmx-exporter:1.3.0-debian-12-r3 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/jmx-exporter \
#            --set <image_path_override_tag>=1.3.0-debian-12-r3

### Note for Image: kiwigrid/k8s-sidecar:1.30.3 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/kiwigrid/k8s-sidecar \
#            --set <image_path_override_tag>=1.30.3

### Deployment Instructions for loki (Image: grafana/loki:3.5.0) ###
# --- Helm Install Command ---
helm install loki grafana/loki \
  --set image.repository=localhost:5000/grafana/loki \
  --set image.tag=3.5.0

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/loki
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=loki
# Get logs:            kubectl logs -l app.kubernetes.io/instance=loki --all-containers


### Deployment Instructions for kong (Image: kong:3.9) ###
# --- Helm Install Command ---
helm install kong kong/kong \
  --set image.repository=localhost:5000/kong \
  --set image.tag=3.9

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kong
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kong
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kong --all-containers


### Deployment Instructions for redis (Image: ecr-public.aws.com/docker/library/redis:7.2.8-alpine) ###
# --- Helm Install Command ---
helm install redis bitnami/redis \
  --set image.repository=localhost:5000/ecr-public.aws.com/docker/library/redis \
  --set image.tag=7.2.8-alpine

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/redis
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=redis
# Get logs:            kubectl logs -l app.kubernetes.io/instance=redis --all-containers


### Note for Image: quay.io/argoprojlabs/argocd-extension-installer:v0.0.8 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/quay.io/argoprojlabs/argocd-extension-installer \
#            --set <image_path_override_tag>=v0.0.8

### Note for Image: ghcr.io/oliver006/redis_exporter:v1.74.0 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/ghcr.io/oliver006/redis_exporter \
#            --set <image_path_override_tag>=v1.74.0

### Note for Image: bitnami/kubectl:1.33.1-debian-12-r5 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/kubectl \
#            --set <image_path_override_tag>=1.33.1-debian-12-r5

### Note for Image: prom/memcached-exporter:v0.15.2 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/prom/memcached-exporter \
#            --set <image_path_override_tag>=v0.15.2

### Deployment Instructions for kafka (Image: bitnami/kafka:4.0.0-debian-12-r7) ###
# --- Helm Install Command ---
helm install kafka bitnami/kafka \
  --set image.repository=localhost:5000/bitnami/kafka \
  --set image.tag=4.0.0-debian-12-r7

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kafka
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kafka
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kafka --all-containers


### Deployment Instructions for kong-ingress (Image: kong/kubernetes-ingress-controller:3.4) ###
# --- Helm Install Command ---
helm install kong-ingress kong/kubernetes-ingress-controller \
  --set image.repository=localhost:5000/kong/kubernetes-ingress-controller \
  --set image.tag=3.4

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/kong-ingress
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=kong-ingress
# Get logs:            kubectl logs -l app.kubernetes.io/instance=kong-ingress --all-containers


### Note for Image: bitnami/os-shell:12-debian-12-r46 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/os-shell \
#            --set <image_path_override_tag>=12-debian-12-r46

### Note for Image: bitnami/os-shell:12-debian-12-r45 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/bitnami/os-shell \
#            --set <image_path_override_tag>=12-debian-12-r45

### Deployment Instructions for zookeeper (Image: bitnami/zookeeper:3.9.3-debian-12-r16) ###
# --- Helm Install Command ---
helm install zookeeper bitnami/zookeeper \
  --set image.repository=localhost:5000/bitnami/zookeeper \
  --set image.tag=3.9.3-debian-12-r16

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/zookeeper
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=zookeeper
# Get logs:            kubectl logs -l app.kubernetes.io/instance=zookeeper --all-containers


### Note for Image: busybox:latest ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/busybox \
#            --set <image_path_override_tag>=latest

### Note for Image: grafana/enterprise-logs:3.5.1 ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/grafana/enterprise-logs \
#            --set <image_path_override_tag>=3.5.1

### Note for Image: nginxinc/nginx-unprivileged:1.28-alpine ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/nginxinc/nginx-unprivileged \
#            --set <image_path_override_tag>=1.28-alpine

### Note for Image: grafana/loki-helm-test:ewelch-distributed-helm-chart-17db5ee ###
# This image was mirrored, but no specific Helm deployment command template
# is available for it yet. If this is part of a Helm chart, you will need
# to determine the correct '--set' flags for its image.repository and image.tag.
# Example: helm install <release_name> <chart_name> \
#            --set <image_path_override_repo>=localhost:5000/grafana/loki-helm-test \
#            --set <image_path_override_tag>=ewelch-distributed-helm-chart-17db5ee

### Deployment Instructions for dex (Image: ghcr.io/dexidp/dex:v2.43.1) ###
# --- Helm Install Command ---
helm install dex dexidp/dex \
  --set image.repository=localhost:5000/ghcr.io/dexidp/dex \
  --set image.tag=v2.43.1

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/dex
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=dex
# Get logs:            kubectl logs -l app.kubernetes.io/instance=dex --all-containers


### Deployment Instructions for memcached (Image: memcached:1.6.38-alpine) ###
# --- Helm Install Command ---
helm install memcached bitnami/memcached \
  --set image.repository=localhost:5000/memcached \
  --set image.tag=1.6.38-alpine

# --- Post-Deployment Checks (example, adjust as needed) ---
# Wait for deployment: kubectl rollout status deployment/memcached
# Get pods:            kubectl get pods -l app.kubernetes.io/instance=memcached
# Get logs:            kubectl logs -l app.kubernetes.io/instance=memcached --all-containers

