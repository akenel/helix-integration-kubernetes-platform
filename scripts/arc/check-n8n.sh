echo "--- Deploying n8n ---"
kubectl apply -f services/n8n/n8n-deployment.yaml
kubectl apply -f services/n8n/n8n-service.yaml
kubectl apply -f services/n8n/n8n-ingress.yaml

echo "Waiting for n8n deployment to be ready..."
# Assuming labels like 'app=n8n' or similar in your YAMLs
kubectl wait --for=condition=ready pod -l app=n8n -n helix-core --timeout=300s || {
  echo "Error: n8n pod did not become ready within 300 seconds."
  exit 1
}
echo "n8n deployed and ready."

echo -e "\nChecking n8n Deployment status:"
kubectl get deployment -l app=n8n -n helix-core

echo -e "\nChecking n8n pod status:"
kubectl get pods -l app=n8n -n helix-core

echo -e "\nChecking n8n Service status:"
kubectl get svc -l app=n8n -n helix-core

echo -e "\nChecking n8n Ingress status:"
kubectl get ingress -l app=n8n -n helix-core

echo "n8n deployment check complete."
