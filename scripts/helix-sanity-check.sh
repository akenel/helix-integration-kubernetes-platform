#!/bin/bash
set -e

NAMESPACE="helix-core"
NAMESPACES=("traefik" "cert-manager" "$NAMESPACE" "helix-auth")

echo "🔍 HELIX Sanity Check Started..."
echo "------------------------------------"

for ns in "${NAMESPACES[@]}"; do
  echo "📦 Checking namespace: $ns"
  kubectl get pods -n "$ns" --no-headers || echo "❌ Namespace $ns missing or inaccessible"
  echo
done

echo "🔐 TLS Secrets Check:"
kubectl get secrets -A | grep helix-wildcard-tls && echo "✅ TLS Secret present!" || echo "❌ TLS Secret MISSING!"
echo

echo "📜 Ingress Resources:"
kubectl get ingress -A || echo "⚠️ No Ingress found"
echo

echo "🔑 Cert-manager Issuers:"
kubectl get clusterissuer || echo "⚠️ No ClusterIssuer found"
echo

echo "📂 Persistent Volume Claims:"
kubectl get pvc -A || echo "⚠️ No PVCs found"
echo

echo "💡 Helpful Pods Summary:"
kubectl get pods -A -o wide | grep -E 'keycloak|n8n|portainer|whoami|schema|traefik'
echo
echo "💡 Show port bindings:"
kubectl get svc -A 
echo "proactive troubleshooting:"
kubectl get events -A | grep Warning



echo "🎉 HELIX Sanity Check Complete!"
echo "------------------------------------"
echo "✅ If everything is green, we are ready for action."
