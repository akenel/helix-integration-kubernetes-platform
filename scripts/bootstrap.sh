source "$(dirname "$0")/helix.env"
set -e

echo "🔍 HELIX Bootstrap Script Starting..."

# === Sanity Checks ===
command -v docker >/dev/null 2>&1 || { echo "❌ Docker is not installed. Please install Docker." >&2; exit 1; }
command -v mkcert >/dev/null 2>&1 || { echo "❌ mkcert is not installed. Please install mkcert." >&2; exit 1; }
command -v k3d >/dev/null 2>&1 || { echo "❌ k3d is not installed. Please install k3d." >&2; exit 1; }

echo "✅ All required binaries found."

# === mkcert CA Installation ===
cd certs
if [ ! -f "rootCA.pem" ]; then
    echo "🔐 Installing local CA with mkcert..."
    mkcert -install
else
    echo "🔐 CA already installed. Skipping..."
fi

# === Wildcard Certificate ===
if [ ! -f "helix.local.pem" ]; then
    echo "🔐 Generating wildcard certificate for *.helix.local..."
    mkcert "*.helix.local"
    mv "_wildcard.helix.local.pem" "helix.local.pem"
    mv "_wildcard.helix.local-key.pem" "helix.local-key.pem"
else
    echo "🔐 Wildcard certificate already exists."
fi
cd ../scripts

# === k3d Cluster Creation ===
if ! k3d cluster list | grep -q "helix-cluster"; then
    echo "🔧 Creating k3d cluster 'helix-cluster'..."
    k3d cluster create helix-cluster \
        --api-port 6550 \
        --servers 1 \
        --agents 2 \
        --port "80:80@loadbalancer" \
        --port "443:443@loadbalancer" \
        --volume "$(pwd)/../certs:/certs" \
        --k3s-arg "--disable=traefik@server:*"
else
    echo "🔧 k3d cluster 'helix-cluster' already exists."
fi

# === Cert-Manager Installation ===
echo "📦 Installing cert-manager via Helm..."
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm upgrade --install cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --set installCRDs=true

# === Traefik Ingress Deployment ===
echo "📦 Deploying Traefik with Helm..."
helm repo add traefik https://helm.traefik.io/traefik
helm repo update
helm upgrade --install traefik traefik/traefik \
  --namespace traefik \
  --create-namespace \
  -f ../infra/traefik-values.yaml

echo "✅ HELIX Bootstrap Complete!"
