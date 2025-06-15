echo "--- Deploying Schema Registry ---"
kubectl apply -f services/kafka/schema-registry-deployment.yaml
kubectl apply -f services/kafka/schema-registry-service.yaml
kubectl apply -f services/kafka/schema-registry-ingress.yaml

echo "Waiting for Schema Registry deployment to be ready..."
# Assuming labels like 'app=schema-registry' or similar in your YAMLs
kubectl wait --for=condition=ready pod -l app=schema-registry -n helix-core --timeout=300s || {
  echo "Error: Schema Registry pod did not become ready within 300 seconds."
  exit 1
}
echo "Schema Registry deployed and ready."

echo -e "\nChecking Schema Registry Deployment status:"
kubectl get deployment -l app=schema-registry -n helix-core

echo -e "\nChecking Schema Registry pod status:"
kubectl get pods -l app=schema-registry -n helix-core

echo -e "\nChecking Schema Registry Service status:"
kubectl get svc -l app=schema-registry -n helix-core

echo -e "\nChecking Schema Registry Ingress status:"
kubectl get ingress -l app=schema-registry -n helix-core

echo "Schema Registry deployment check complete."
