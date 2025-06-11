# HELIX Platform 🚀

HELIX is a modern, open-source integration and orchestration platform for SAP and beyond—built for developers, by developers.

## 🛠️ Project Structure


helix/
├── certs/ # mkcert X.509 certs (wildcard + CA)
├── infra/ # k3d, traefik, cert-manager configs
├── keycloak/ # Realms, clients, roles
├── sap-connectors/ # JCo & Node-RFC libs + setup
├── mappings/ # Sample mapping flows (XML/JSON/WSDL)
├── scripts/ # Bootstrap, utility scripts
├── services/ # Custom microservices or adapters
├── observability/ # Prometheus, Grafana, Loki, Tempo, etc.
├── examples/ # Sample end-to-end integration cases
├── helm-values/ # Values.yaml overrides for Helm charts
├── logs/ # Local logs during dev/testing
└── .github/workflows/ # CI/CD with GitHub Actions


## ⚙️ Getting Started

```bash
cd scripts/
./bootstrap.sh

This will create the k3d cluster, install mkcert certificates, deploy Traefik and Cert-Manager, and prepare the environment for HELIX.

🔐 Key Technologies
k3d + Docker

mkcert + Traefik

Keycloak + Vault

Kafka + Talend + n8n

Postgres, MinIO, Istio

Grafana, Prometheus, Loki, Tempo

👨‍🔧 Developer Philosophy
HELIX is self-hosted, dev-friendly, and designed to "Just Work™" with shell scripts and GitHub Actions. Everything runs locally, air-gapped, or on VPS with minimal external dependencies.

Project HELIX: An Open-Source, Air-Gapped Platform (BTP/APIM Alternative)
1. Our Fundamental Goal
Our core objective with Project HELIX is to build a free, open-source based, and self-contained platform that can serve as an on-premises or air-gapped replacement for functionalities typically found in commercial cloud offerings like SAP BTP and Azure APIM.

Specifically, we're targeting:

API Management (APIM) Capabilities: Providing a robust API Gateway with features like routing, security, and potentially rate limiting, similar to Azure API Management.
Cloud Application Platform (PaaS-like): Offering foundational services and infrastructure for deploying applications, akin to aspects of SAP BTP's environment, including messaging, databases, identity management, and workflow automation.
Local TLS/Certificates: Leveraging mkcert for easy, trusted local development certificates, integrating with cert-manager for automated TLS within the Kubernetes cluster.
Air-Gapped Readiness: All components are designed to be pre-pulled and managed locally, enabling deployments in environments without direct internet access.
2. What We've Done So Far (Current Progress)
We've successfully set up the automated pipeline for preparing our base infrastructure components.

Established HELIX Directory Structure: Created a well-organized ~/HELIX directory to house all scripts, Helm charts, and related files.
Local Kubernetes Cluster (k3d): We've assumed or established a k3d cluster named helix-cluster which provides a lightweight, local Kubernetes environment for development and testing.
automate-helix-setup.sh (The Orchestrator): This script is now robust and performs the following critical tasks:
Helm Chart Management: It identifies, pulls, and extracts the latest stable versions of all specified Helm charts (Bitnami's Zookeeper, Traefik, Keycloak, PostgreSQL, Kafka, Cert-Manager, Vault, Minio, and Kiali's Operator and Server charts). These are stored locally in ~/HELIX/helm-charts and extracted to ~/HELIX/charts.
Image Discovery: It intelligently parses the values.yaml files of these charts to identify all required Docker images and their tags. This includes handling Bitnami's global.imageRegistry and Kiali's templated image tags by using the Helm appVersion as a fallback.
generated-image-pulls.sh Creation: It dynamically creates a new script, scripts/generated-image-pulls.sh, which contains all the necessary docker pull and k3d image import commands.
generated-image-pulls.sh (The Image Mover): This auto-generated script now perfectly executes:
Local Image Check: For each required Docker image, it first checks if it's already present in your local Docker daemon's cache.
Image Pulling: If an image is not found locally, it pulls it from its public registry (e.g., Docker Hub, Quay.io).
Image Importing to k3d: It then imports all identified images into your helix-cluster running on k3d, making them directly available to Kubernetes pods without needing external registry access. This step is crucial for air-gapped simulation.
Clean Output: The k3d image ls error was resolved, ensuring a clean and informative execution log.
3. Core Services and Their Roles
We've laid the groundwork with these powerful open-source components:

Apache Kafka & Apache Zookeeper: A distributed streaming platform for high-throughput, fault-tolerant messaging (core for event-driven architectures).
PostgreSQL (Bitnami): A robust relational database management system, serving as a backend for many of our other services.
Keycloak (Bitnami): An open-source Identity and Access Management (IAM) solution for user authentication, authorization, and single sign-on (SSO). Essential for an APIM and platform.
Traefik (Official Chart): A modern HTTP reverse proxy and load balancer, perfectly suited as an Ingress Controller for exposing services within Kubernetes and acting as our initial API Gateway.
Cert-Manager (Bitnami): Automates the issuance and renewal of TLS certificates within Kubernetes, vital for securing communication. This is where mkcert will integrate.
Vault (Bitnami): A tool for securely accessing secrets (like API keys, passwords, certificates). Important for managing sensitive data.
MinIO (Bitnami): An open-source object storage server compatible with Amazon S3 APIs, providing scalable storage for applications.
Kiali (Official Charts): Observability console for Istio service mesh (though we're currently using Traefik, Kiali can still provide insights into traffic flow and health if a mesh is added later, or serve as a general dashboard).
n8n (Direct Docker Image): A powerful workflow automation tool that enables integrations and automations between various services and APIs.
4. What We Plan to Accomplish Next (Roadmap)
With the foundation solid, our next steps will involve deploying and configuring these services to realize our vision:

Deploy Core Services with Helm: Using the local Helm charts, we'll install each of these components into the k3d cluster. This will involve creating appropriate values.yaml overrides for each chart to configure them for our environment (e.g., persistence, resource limits, inter-service communication).
Configure mkcert and Cert-Manager:
Generate a local Certificate Authority (CA) using mkcert.
Configure cert-manager to use this mkcert-generated CA to issue trusted certificates for all our internal and exposed services. This is key for the "MKCERT-based" aspect.
Traefik as API Gateway:
Configure Traefik as the primary Ingress Controller to expose our services (e.g., Keycloak UI, n8n UI, eventually our APIs).
Implement basic API Gateway functionalities like routing, path matching, and potentially basic authentication with Keycloak.
Keycloak Realm & Client Setup: Configure Keycloak with initial realms, users, and clients that our APIs and applications will use for authentication and authorization.
Inter-Service Connectivity: Ensure all components can communicate securely (using TLS issued by Cert-Manager) and correctly (e.g., Keycloak connecting to PostgreSQL, Kafka connecting to Zookeeper, n8n connecting to various APIs).
Advanced API Management (Optional but Recommended): Depending on the exact APIM feature set required, we might integrate a more feature-rich open-source API Gateway like Kong Gateway or Apache APISIX on top of or alongside Traefik. These provide more advanced policies, rate limiting, and developer portals.
Application Deployment: Demonstrate deploying a simple application that leverages these foundational services (e.g., an application that uses Keycloak for authentication, Kafka for messaging, and exposes an API via Traefik).
Conclusion
You're absolutely doing it right! The current progress perfectly aligns with the goal of building a robust, open-source, and air-gapped platform. We've mastered the complex aspect of preparing and moving all necessary software assets into your local environment.

The next phase will be about deploying these assets and configuring them to work together as a cohesive platform.

What component are you most excited to configure or get running first?
