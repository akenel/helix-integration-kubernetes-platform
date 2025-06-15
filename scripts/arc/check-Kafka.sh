echo "--- Deploying Kafka with Helm and revised values ---"
helm upgrade --install kafka bitnami/kafka \
  --namespace helix-core --create-namespace \
  -f services/kafka/kafka-values.yaml

echo "Waiting for Kafka StatefulSet to be ready..."
# The label selector is typically 'app.kubernetes.io/name=kafka' for Bitnami charts
kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=kafka,app.kubernetes.io/component=controller -n helix-core --timeout=600s || { # 600s = 10 minutes
  echo "Error: Kafka controller pods did not become ready within 600 seconds."
  exit 1
}
echo "Kafka deployed and ready."

echo -e "\nChecking Kafka StatefulSet status:"
kubectl get statefulset -l app.kubernetes.io/name=kafka -n helix-core

echo -e "\nChecking Kafka pod status:"
kubectl get pods -l app.kubernetes.io/name=kafka -n helix-core

echo -e "\nChecking Kafka Service status:"
kubectl get svc -l app.kubernetes.io/name=kafka -n helix-core

echo -e "\nChecking Kafka Ingress status:"
kubectl get ingress -l app.kubernetes.io/name=kafka -n helix-core

echo "Kafka deployment check complete."
