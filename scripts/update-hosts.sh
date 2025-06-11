#!/bin/bash

set -e

HOSTS_LINE="127.0.0.1 helix.local keycloak.helix.local n8n.helix.local kafka.helix.local vault.helix.local traefik.helix.local grafana.helix.local kong.helix.local whoami.helix.local ollama.helix.local"

if grep -q "helix.local" /etc/hosts; then
  echo "🛑 Entry already exists in /etc/hosts. Skipping..."
else
  echo "📝 Adding HELIX domains to /etc/hosts..."
  echo "$HOSTS_LINE" | sudo tee -a /etc/hosts > /dev/null
  echo "✅ /etc/hosts updated successfully."
fi
