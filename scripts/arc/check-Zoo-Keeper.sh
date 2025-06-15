echo "--- Creating helix-core namespace ---"
kubectl create namespace helix-core || echo "Namespace helix-core already exists, skipping creation." # Added || for idempotency

echo "--- Deploying Zookeeper ---"
kubectl apply -f services/kafka/zookeeper-deployment.yaml

echo "Waiting for Zookeeper StatefulSet to be ready..."
# The label selector is typically 'app=zookeeper' based on common Zookeeper manifests.
# Adjust the label selector (-l app=zookeeper) and namespace (-n default) if your Zookeeper manifest uses different ones.
kubectl wait --for=condition=ready pod -l app=zookeeper -n default --timeout=300s || {
  echo "Error: Zookeeper pod did not become ready within 300 seconds."
  exit 1
}
echo "Zookeeper deployed and ready."

echo -e "\nChecking Zookeeper StatefulSet status:"
kubectl get statefulset -l app=zookeeper -n default

echo -e "\nChecking Zookeeper pod status:"
kubectl get pods -l app=zookeeper -n default

echo -e "\nChecking Zookeeper Service status:"
kubectl get svc -l app=zookeeper -n default # Look for a service that exposes Zookeeper clients (e.g., port 2181)

echo "Zookeeper deployment check complete."
