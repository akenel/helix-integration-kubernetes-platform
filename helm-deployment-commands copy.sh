# helm-deployment-commands.sh

#!/bin/bash

#####################################################################
#                HELIX Local Kubernetes Deployment Commands         #
#-------------------------------------------------------------------#
# This file contains recommended 'helm install' commands for the    #
# services whose images were successfully mirrored to your local    ##
# registry at 'localhost:5000'.                                     #
#                                                                   #
# IMPORTANT:                                                        #
#  1. Ensure your k3d cluster (or other Kubernetes cluster) is     #
#     running and configured to trust/mirror from                   #
#     'localhost:5000'.                                             #
#  2. Review each command. You may need to adjust release names,   #
#     namespaces, or add additional '--set' flags specific to     #
#     your setup.                                                   #
#                                                                   #
# General Troubleshooting Steps:                                    #
#  - Check pod status:        kubectl get pods -n <namespace>       #
#  - Get pod logs:            kubectl logs <pod-name> -n <namespace>#
#  - Describe resource:       kubectl describe <type>/<name> -n <ns>#
#  - Check Helm releases:     helm list                               #
#####################################################################

echo '🚀 HELIX Deployment Commands generated for your review. Run them from this file or copy-paste!'

#####################################################################
#           ✨ RECOMMENDED HELIX SERVICE DEPLOYMENT ORDER ✨        #
#-------------------------------------------------------------------#
# Follow this order for best results, especially considering       #
# common dependencies. Open 2-3 terminals: one for 'helm install',#
# one for 'kubectl get pods -w', and one for 'kubectl logs/describe'.#
#####################################################################

# 1. Core Infrastructure & Data Stores (if not already deployed)
#    - Zookeeper (often for Kafka)
#    - PostgreSQL (for N8n, other apps)
#    - Redis (for caching, message queues)
#    - MinIO (for S3-compatible object storage)
#
#    Note: Your `kubectl get pods -A` output shows Kafka, MinIO,
#    PostgreSQL, and Zookeeper already running in `helix-infra`.
#    If they are healthy (1/1 Running), you can skip these.
#
# -------------------------------------------------------------------

# 2. Monitoring & Logging (Foundational Observability)
#    - Prometheus Community Stack (kube-prometheus-stack):
#      Includes Prometheus, Alertmanager, Node Exporter, Kube State Metrics.
#      Provides comprehensive cluster monitoring.
#    - Loki:
#      For centralized log aggregation (often with Promtail for agents).
#
# -------------------------------------------------------------------

# 3. Identity & Access Management (If needed)
#    - Dex:
#      Provides OpenID Connect (OIDC) identity for other applications.
#
# -------------------------------------------------------------------

# 4. API Gateway / Ingress (Traffic Routing)
#    - Kong / Kong Ingress Controller:
#      For exposing services externally and managing APIs.
#      Note: Traefik is often default in K3d, but Kong offers more advanced API management.
#
# -------------------------------------------------------------------

# 5. Workflow Automation & Other Services
#    - N8n:
#      For workflow automation. Requires database (e.g., PostgreSQL).
#    - Memcached:
#      For caching.
#
# -------------------------------------------------------------------

# 6. Specialized Components (Deploy as dependencies arise)
#    - Other Exporters (e.g., Redis Exporter, Memcached Exporter if separate)
#    - Kubernetes specific tools (e.g., kubectl image if you deploy it)

# -------------------------------------------------------------------
# Important: VAULT Initialization and Unsealing
# The Vault server (vault-server-0) will show 0/1 Running until it is
# initialized and unsealed. This is a separate, manual process
# (e.g., using 'vault operator init' and 'vault operator unseal')
# and is NOT part of a Helm deployment command.
# Refer to Vault's documentation for the unsealing procedure.
# -------------------------------------------------------------------

#####################################################################
#           ⬇️ INDIVIDUAL HELM DEPLOYMENT COMMANDS ⬇️               #
#####################################################################