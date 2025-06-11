echo "--- Deploying Cert-Manager ---"
# Ensure cert-manager CRDs are installed first if not already
# kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.17.2/cert-manager.crds.yaml
# helm upgrade --install cert-manager jetstack/cert-manager \
#   --namespace cert-manager --create-namespace \
#   --version v1.17.2 \
#   --set installCRDs=true # Only for first install, set to false for upgrades
#
# Based on your structure, you might have specific YAMLs for it, or it's implicitly handled.
# Assuming you have direct YAMLs or are using a simplified cert-manager setup in infra/mkcert-ca.sh or similar.
# If using helm, replace with helm install/upgrade commands.
# Assuming you've already run infra/mkcert-ca.sh and copied certs as suggested in a previous context.
# If cert-manager itself is deployed via manifest, apply it here.
# For now, let's assume cert-manager is part of a larger Helm chart or you have specific manifests.
# If cert-manager is deployed via static manifests:
# kubectl apply -f some-cert-manager-manifests.yaml
echo "Waiting for cert-manager pods to be ready..."
kubectl wait --for=condition=ready pod -l app.kubernetes.io/instance=cert-manager -n cert-manager --timeout=300s # Adjust label and namespace
echo "Cert-Manager deployed and ready."
#!/bin/bash

echo "Checking Cert-Manager pod status..."
kubectl get pods -n cert-manager

echo -e "\nChecking ClusterIssuers status..."
kubectl get clusterissuers

# Optional: Add a check for a specific clusterissuer if you've created one
# echo -e "\nChecking specific ClusterIssuer (e.g., helix-local-ca-issuer) status..."
# kubectl get clusterissuer helix-local-ca-issuer 2>/dev/null || echo "ClusterIssuer 'helix-local-ca-issuer' not found."
# kubectl describe clusterissuer helix-local-ca-issuer 2>/dev/null

echo -e "\nCert-Manager check complete."
