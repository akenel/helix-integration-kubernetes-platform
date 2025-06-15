cd ~/helix-integration-kubernetes-platform && \
echo "--- Ensuring old k3d-cluster-config.yaml is deleted ---" && \
rm -f configs/k3d-cluster-config.yaml && \
echo "--- Creating configs/k3d-cluster-config.yaml with guaranteed clean formatting ---" && \
cat <<'EOF' > configs/k3d-cluster-config.yaml
apiVersion: k3d.io/v1alpha5
kind: Simple
metadata:
  name: helixstack
servers: 1
agents: 1
ports:
  - port: 8081:80
    nodeFilters:
      - loadbalancer
  - port: 8443:443
    nodeFilters:
      - loadbalancer
registries:
  create:
    name: registry.localhost
    host: "0.0.0.0"
    hostPort: "5000"
  config: |
    [plugins."io.containerd.grpc.v1.cri".registry]
      mirrors = {
        "k3d-registry.localhost:5000" = {
          endpoint = ["http://k3d-registry.localhost:5000"]
        }
      }
      configs = {
        "k3d-registry.localhost:5000" = {
          tls = {
            insecure_skip_verify = true
          }
        }
      }
EOF
echo "--- Verifying k3d-cluster-config.yaml content (should NOT show ^M or non-standard spaces) ---" && \
cat -A configs/k3d-cluster-config.yaml && \
echo "--- Running grep check for problematic characters (should show 'No problematic characters found.') ---" && \
if grep -q -P '[\x09\x0A\x0B\x0C\x0D\xA0]' configs/k3d-cluster-config.yaml; then echo "Problematic characters detected!"; else echo "No problematic characters found."; fi
