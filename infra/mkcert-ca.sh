#!/bin/bash

echo "--- Ensuring mkcert is installed and CA is set up (Chuck Norris style!) 💪 ---"

# Install mkcert if not present (for Debian/Ubuntu)
# This assumes you have 'sudo' privileges. Chuck Norris needs no permissions, but we do. 🤫
if ! command -v mkcert &> /dev/null
then
    echo "mkcert not found. Installing with the force of a thousand roundhouse kicks... 🥋"
    sudo apt update
    sudo apt install -y libnss3-tools # Required for mkcert, even Chuck needs libraries.
    wget -qO- https://raw.githubusercontent.com/FiloSottile/mkcert/master/install.sh | bash
    # Add mkcert to PATH for current session. Chuck Norris already knows the PATH. 🛤️
    export PATH="$HOME/go/bin:$PATH" # mkcert often installs to ~/go/bin
    echo "mkcert installed. If you close this terminal, you may need to add it to your PATH manually. Or just don't close it, Chuck would be proud. 😉"
else
    echo "mkcert is already installed. Ready for action! 😎"
fi

# Ensure mkcert local CA is installed. This is where the magic begins. ✨
mkcert -install

echo "--- Generating wildcard certificate for *.helix.local and helix.local (With extreme prejudice!) 💥 ---"
# IMPORTANT: This step is for generating a *leaf certificate* for your Ingress,
# NOT for the Cert-Manager CA Issuer itself.
# This certificate will be used by Vault's Ingress.
mkcert "*.helix.local" "helix.local"

echo "--- Identifying the mkcert Root CA files for Cert-Manager. This is the real power! 🔋 ---"

# Identify the mkcert Root CA certificate and key files. This is the real power! 🔋
MKCERT_CAROOT=$(mkcert -CAROOT)
CERT_FILE="${MKCERT_CAROOT}/rootCA.pem" # This is the Root CA certificate! 👑
KEY_FILE="${MKCERT_CAROOT}/rootCA-key.pem" # This is the Root CA private key! 🤫

if [ -z "$CERT_FILE" ] || [ -z "$KEY_FILE" ]; then
    echo "Error: Could not find mkcert Root CA certificate or key files. Check mkcert installation. Chuck Norris is displeased! 😡"
    exit 1
fi

echo "Found Root CA certificate: $CERT_FILE (Certified by Chuck!) ✅"
echo "Found Root CA private key: $KEY_FILE (Kept safer than Chuck's jokes!) 🔒"

# Create or update the Kubernetes Secret in the cert-manager namespace.
# This secret holds the power of your local CA! ⚡
echo "--- Creating/Updating Kubernetes Secret 'cert-manager-ca-secret' in 'cert-manager' namespace (With Kube-Power!) 🚀 ---"

kubectl create namespace cert-manager --dry-run=client -o yaml | kubectl apply -f - # Ensure namespace exists, silently.

# Creating the secret. This is the moment of truth! 💯
# This secret will contain the MKCERT Root CA, allowing cert-manager to sign other certs.
kubectl create secret tls cert-manager-ca-secret \
  --namespace cert-manager \
  --cert="$CERT_FILE" \
  --key="$KEY_FILE" \
  --dry-run=client -o yaml | kubectl apply -f -

echo "--- Kubernetes Secret 'cert-manager-ca-secret' should now be created/updated. Its power level is over 9000! 💪 ---"
echo "--- Verify ClusterIssuer status now. It better be 'True'! Or else... 😠 ---"
