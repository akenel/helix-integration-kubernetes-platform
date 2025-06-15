#!/bin/bash
# scripts/automate-helix-cluster_v1-0-0.sh

# Ensure script runs from the project root
cd "$(dirname "$0")/.."

echo "--- Ensuring old K3d cluster is deleted ---"
# This will delete the cluster AND its associated k3d-managed registry if created by k3d
k3d cluster delete helixstack >/dev/null 2>&1

# The k3d-cluster-config.yaml now handles creation of the registry as part of the cluster.
# No separate `k3d registry create` command or checks are needed here.

echo "--- Creating cluster from config ---"
# The 'k3d-cluster-config.yaml' contains all definitions:
# - Cluster nodes and ports
# - How to create the integrated registry (`registries.create`)
# - How the cluster nodes should use that registry (`registries.config`)
k3d cluster create helixstack --config configs/k3d-cluster-config.yaml

echo "--- Verifying Kubernetes Cluster Info and Pods ---"
sleep 10 # Give the cluster a moment to fully initialize
kubectl cluster-info
kubectl get nodes
kubectl get pods --all-namespaces