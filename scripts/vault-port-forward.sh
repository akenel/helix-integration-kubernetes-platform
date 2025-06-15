echo "--- Re-attempting Port-Forward for Vault UI ---"
VAULT_POD=$(kubectl get pods -n vault -l app.kubernetes.io/name=vault,component=server -o jsonpath='{.items[0].metadata.name}')

if [ -z "$VAULT_POD" ]; then
    echo "Error: Vault server pod not found after restart. Please provide output of 'kubectl get pods -n vault'."
else
    echo "Found Vault pod: ${VAULT_POD}. Access at http://localhost:8200/"
    echo "Leaving port-forward running in this terminal. Press Ctrl+C to stop."
    kubectl port-forward "${VAULT_POD}" -n vault 8200:8200
fi
