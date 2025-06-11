#!/bin/bash

echo "🔍 Pulling and importing required Docker images for HELIX..."

# Common base image (critical for all pods)
docker pull rancher/mirrored-pause:3.6
k3d image import rancher/mirrored-pause:3.6 -c helix-cluster

# Traefik (from your describe output)
docker pull docker.io/traefik:v3.4.1
k3d image import docker.io/traefik:v3.4.1 -c helix-cluster

# Cert-Manager (replace with exact versions from your cert-manager chart)
# You might need to extract the cert-manager.tgz to find the exact image versions in its values.yaml
docker pull quay.io/jetstack/cert-manager-controller:v1.17.2 # <--- Check your cert-manager chart's values.yaml for the version
k3d image import quay.io/jetstack/cert-manager-controller:v1.17.2 -c helix-cluster

docker pull quay.io/jetstack/cert-manager-webhook:v1.17.2 # <--- Check version
k3d image import quay.io/jetstack/cert-manager-webhook:v1.17.2 -c helix-cluster

docker pull quay.io/jetstack/cert-manager-cainjector:v1.17.2 # <--- Check version
k3d image import quay.io/jetstack/cert-manager-cainjector:v1.17.2 -c helix-cluster

# Example corrected lines
docker pull bitnami/postgresql:16.2.0-debian-11-r25 # <--- USE THE ACTUAL TAG!
k3d image import bitnami/postgresql:16.2.0-debian-11-r25 -c helix-cluster

docker pull bitnami/kafka:3.7.0-debian-11-r0 # <--- FIND THE ACTUAL TAG FOR KAFKA
k3d image import bitnami/kafka:3.7.0-debian-11-r0 -c helix-cluster

docker pull bitnami/zookeeper:3.8.3-debian-11-r0 # <--- FIND THE ACTUAL TAG FOR ZOOKEEPER
k3d image import bitnami/zookeeper:3.8.3-debian-11-r0 -c helix-cluster

# Re-confirm Keycloak if you didn't get this one directly from your values.yaml
docker pull bitnami/keycloak:24.0.3 # This one seems to have worked in your log, so likely correct
k3d image import bitnami/keycloak:24.0.3 -c helix-cluster

# Vault (from your vault-values.yaml or your custom chart)
docker pull hashicorp/vault:1.15.4 # Or whatever version your vault-values.yaml specifies
k3d image import hashicorp/vault:1.15.4 -c helix-cluster

# n8n (from your n8n/values.yaml)
docker pull n8nio/n8n:latest # Or whatever version your n8n/values.yaml specifies
k3d image import n8nio/n8n:latest -c helix-cluster

echo "✅ All specified images pulled and imported."
# Example corrected lines
docker pull bitnami/postgresql:16.2.0-debian-11-r25 # <--- USE THE ACTUAL TAG!
k3d image import bitnami/postgresql:16.2.0-debian-11-r25 -c helix-cluster

docker pull bitnami/kafka:3.7.0-debian-11-r0 # <--- FIND THE ACTUAL TAG FOR KAFKA
k3d image import bitnami/kafka:3.7.0-debian-11-r0 -c helix-cluster

docker pull bitnami/zookeeper:3.8.3-debian-11-r0 # <--- FIND THE ACTUAL TAG FOR ZOOKEEPER
k3d image import bitnami/zookeeper:3.8.3-debian-11-r0 -c helix-cluster

# Re-confirm Keycloak if you didn't get this one directly from your values.yaml
docker pull bitnami/keycloak:24.0.3 # This one seems to have worked in your log, so likely correct
k3d image import bitnami/keycloak:24.0.3 -c helix-cluster
