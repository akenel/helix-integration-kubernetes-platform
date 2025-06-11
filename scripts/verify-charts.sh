#!/bin/bash

CHART_DIR=~/HELIX/helm-charts
REQUIRED_CHARTS=(
  "postgresql-16.7.9.tgz"
  "keycloak-24.7.3.tgz"
  "vault-0.30.0.tgz"
  "cert-manager-v1.17.2.tgz"
  "traefik-<VERSION>.tgz"  # Adjust based on your repo
  "kafka-<VERSION>.tgz"    # If using Bitnami
  "zookeeper-<VERSION>.tgz"
  "minio-<VERSION>.tgz"
  "nifi-<VERSION>.tgz"
  "kiali-<VERSION>.tgz"
)

echo "📦 Verifying chart presence in $CHART_DIR..."
MISSING=0
for CHART in "${REQUIRED_CHARTS[@]}"; do
  if [ -f "$CHART_DIR/$CHART" ]; then
    echo "✅ Found: $CHART"
  else
    echo "❌ Missing: $CHART"
    ((MISSING++))
  fi
done

if [ "$MISSING" -eq 0 ]; then
  echo "🎉 All required charts are present!"
else
  echo "⚠️ $MISSING chart(s) missing. Retrieve via PowerShell or custom YAML."
fi
