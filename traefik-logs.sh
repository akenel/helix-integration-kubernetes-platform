# Ensure you have the correct Traefik Pod Name
TRAEFIK_POD=$(kubectl get pods -n kube-system -l app.kubernetes.io/name=traefik -o jsonpath='{.items[0].metadata.name}')
echo "Traefik Pod Name: ${TRAEFIK_POD}"

echo "--- Fetching Traefik Logs from the last 10 minutes (LOOK FOR NEW ERRORS!) ---"
kubectl logs -n kube-system "${TRAEFIK_POD}" --since=10m
