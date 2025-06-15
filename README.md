# HELIX Platform 🚀

HELIX is a modern, open-source integration and orchestration platform for SAP and beyond—built for developers, by developers.


Absolutely **foundational** to building a maintainable, scalable, and understandable Kubernetes cluster. A poor namespace strategy and a folder/file mess will absolutely lead to a debugging nightmare - setting us up for success.

Let's break down the best practices for Namespace Strategy, Folder Structure, and the "First-Time Right" deployment method for the HELIX platform.

---

### The Enterprise-Simple HELIX Strategy: A Maintainable Approach

#### 1. Namespace Strategy: Functional Grouping with a Core Application Namespace

The "one namespace per app" approach (e.g., `keycloak` namespace for Keycloak, `postgres` namespace for Postgres) can lead to **namespace sprawl** in larger clusters, making inter-service communication (like Keycloak talking to Postgres) a bit more verbose (e.g., `postgresql.postgres.svc.cluster.local`).

The "all apps in one namespace" (e.g., `default`) works for tiny clusters but quickly becomes a mess for manageability and isolation.

**For HELIX, a "Functional Grouping" approach makes the most sense:**

* **Infrastructure Namespaces:**
    * `vault`: (Already established, excellent!) For your core security infrastructure.
    * `traefik`: (Likely where Traefik lives) For your ingress controller and network edge.
    * `cert-manager`: (If you install it) For certificate automation.
    * `monitoring`: For tools like Prometheus, Grafana, Loki, etc.
    * *Why?* These are foundational services that other applications depend on but are separate concerns.

* **Core Application Namespace (`helix`):**
    * All your main applications that form the "HELIX platform" will live here.
    * **PostgreSQL, Keycloak, n8n, etc., will all go into the `helix` namespace.**
    * *Why?*
        * **Simpler Service Discovery:** Within the `helix` namespace, Keycloak can simply refer to `postgresql` as its host, not `postgresql.data.svc.cluster.local`. This simplifies `values.yaml` significantly.
        * **Clear Boundaries:** It's obvious what's part of "HELIX" and what's infrastructure.
        * **Manageability:** You can easily list all HELIX components (`kubectl get pods -n helix`).
        * **Resource Management (Future):** Easier to apply resource quotas or network policies to the entire HELIX stack if needed.

**Resulting Namespace Layout:**

* `kube-system` (Kubernetes core)
* `vault` (Your Vault instance)
* `traefik` (Your Traefik instance)
* `cert-manager` (Future cert management)
* `monitoring` (Future monitoring stack)
* **`helix` (Your main application namespace: Postgres, Keycloak, n8n, etc.)**

This is an **enterprise-simple and highly maintainable** strategy.

#### 2. Folder Structure: Mirroring the Namespace & App Logic

Your current `services/vault/...` and `services/postgresql/...` structure is **perfect** and aligns directly with this strategy.

**Keep this pattern:**

```
helix-integration-kubernetes-platform/
├── services/
│   ├── vault/
│   │   ├── vault-ingressroute.yaml
│   │   └── vault-values.yaml
│   ├── traefik/
│   │   └── traefik-values.yaml
│   ├── cert-manager/
│   │   └── cert-manager-values.yaml
│   ├── postgresql/           # App lives in 'helix' namespace
│   │   └── postgresql-values.yaml
│   ├── keycloak/             # App lives in 'helix' namespace
│   │   └── keycloak-values.yaml
│   └── n8n/                  # App lives in 'helix' namespace
│       └── n8n-values.yaml
└── # Other top-level project files/folders (e.g., manifests/, scripts/)
```

This makes it immediately obvious which Helm chart values belong to which application, and its intended deployment.

#### 3. The "First-Time Right" Deployment Method & `README.md` Checklist

This is where we formalize the process to avoid debugging headaches. For *every single application* you deploy in HELIX, you will follow this mental checklist, and its core will live in a `README.md` within its `services/<app-name>/` folder.

**The `services/<app-name>/README.md` should contain:**

1.  **Application Purpose:** (e.g., "Keycloak: Identity and Access Management for HELIX apps.")
2.  **Namespace:** `helix` (or `monitoring`, etc.). This is explicit.
3.  **Upstream Helm Chart:**
    * Repo URL: `https://charts.bitnami.com/bitnami`
    * Chart Name: `keycloak`
    * Version Used: `24.7.4` (or whatever you choose)
    * Link to official chart documentation/values.yaml.
4.  **Dependencies (Explicitly Listed):**
    * "Requires `postgresql` service in `helix` namespace for database."
    * "Requires `vault` service in `vault` namespace for secrets."
    * "Requires `traefik` ingress controller for external access."
    * "Requires `cert-manager` for TLS certificates."
5.  **`values.yaml` Highlights & Crucial Overrides:**
    * **Mandatory Values:**
        * `auth.database: keycloakdb` (the database name specific to this app in Postgres).
        * `service.type: ClusterIP` (if it's an internal service).
        * `persistence.enabled: true`, `persistence.storageClass: local-path`.
    * **External Database Configuration (This is KEY!):**
        * **How to disable chart's default DB:** `postgresql.enabled: false` (or `internalDatabase.enabled: false`, specific to each chart).
        * **How to point to *our* Postgres:**
            ```yaml
            # Example for Keycloak (check Keycloak chart's values.yaml for exact path)
            externalDatabase:
              host: postgresql.helix.svc.cluster.local # <- Use FQDN for clarity, though 'postgresql' works within 'helix' ns
              port: 5432
              database: keycloakdb
              # credentials will come from Vault via sidecar
            ```
    * **Vault Integration Placeholders (Future):**
        * `vault.enabled: true` (if chart supports it).
        * `vault.agentInjector.enabled: true`.
        * `vault.role: keycloak-k8s-role`.
        * `vault.secretMountPath: /vault/secrets`.
        * Instructions on how the app will consume these secrets (e.g., `DB_USERNAME_FILE=/vault/secrets/db_username`).
    * **TLS/Ingress Configuration:**
        * `ingress.enabled: true`, `ingress.className: traefik`.
        * `ingress.host: keycloak.helix.local`.
        * `ingress.annotations: traefik.ingress.kubernetes.io/router.entrypoints: websecure`.
        * `tls.secretName: keycloak-tls-secret` (from Cert-Manager).
6.  **Deployment Command (The Helm Magic):**
    ```bash
    helm install keycloak bitnami/keycloak -f keycloak-values.yaml -n helix --create-namespace
    ```
    (Always include `-n <namespace>` and `--create-namespace`).
7.  **Verification Steps:**
    * `kubectl get pods -n helix -l app.kubernetes.io/name=keycloak` (Check pod status).
    * `kubectl logs <keycloak-pod-name> -n helix` (Check app logs for startup success).
    * **Internal Connectivity Test:** (e.g., `kubectl exec -it <keycloak-pod> -n helix -- curl http://postgresql.helix.svc.cluster.local:5432` - though curl for a DB port won't confirm connection, it confirms network path).
    * **External Access Test:** `curl https://keycloak.helix.local/` (if Ingress is set up).
8.  **Post-Deployment & Vault Wiring Instructions:**
    * "After basic deployment, proceed to Vault UI/CLI for:
        * Enabling `database` secrets engine (`db-keycloak`).
        * Creating `keycloak-app-role` in Vault.
        * Creating `keycloak-access-policy` in Vault.
        * Creating `keycloak-k8s-role` in Vault's K8s auth method."
    * "Then, `helm upgrade` Keycloak with Vault integration enabled in `values.yaml`."

---


Let's do this! Now, we have a plan for PostgreSQL's deployment.



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

## 🆘 WSL/Docker Desktop Catastrophic Recovery Guide

If Docker Desktop fails to start due to WSL issues, or your WSL distributions become corrupted and you run out of disk space, follow these steps to perform a full rebuild. This guide assumes your `helix-integration-kubernetes-platform` project is already backed up on GitHub.

**Symptoms:**
* Docker Desktop fails to start with errors like "Docker Desktop distro installation failed", "network name cannot be found", or `0x8007274c`.
* WSL commands (like `bash` or `wsl -l -v`) fail with connection errors or permissions issues.
* Critically low disk space on your C: drive (where WSL virtual disks reside).

**Recovery Steps:**

1.  **Ensure Project Backup is Current:**
    * Your `helix-integration-kubernetes-platform` repository on GitHub (`https://github.com/akenel/helix-integration-kubernetes-platform`) is your primary backup.
    * If you've made any *uncommitted* changes since your last push, try to copy your local `HELIX` folder from `\\wsl.localhost\Ubuntu\home\angel\HELIX` to a temporary Windows location (e.g., `C:\Users\YOUR_USERNAME\Desktop\HELIX_TEMP_BACKUP`). Push those changes to GitHub from there if possible.

2.  **Perform WSL Cleanup (Reclaim Disk Space):**
    * **Close Docker Desktop Completely.**
    * Open **PowerShell as Administrator**.
    * Shut down WSL:
        ```powershell
        wsl --shutdown
        ```
    * List WSL distributions to confirm names:
        ```powershell
        wsl -l -v
        ```
    * **Carefully unregister (delete) the problematic distributions.** **WARNING: This deletes all data within these WSL instances!**
        ```powershell
        wsl --unregister Ubuntu
        wsl --unregister docker-desktop
        wsl --unregister docker-desktop-data # May return "not found" if already gone, which is fine.
        ```
    * Verify C: drive disk space (it should have significantly increased).

3.  **Reinstall WSL and Ubuntu:**
    * In the **PowerShell as Administrator** window:
        ```powershell
        wsl --install -d Ubuntu
        ```
    * Follow prompts to create your new Linux user and password.
    * **Restart your entire computer** after the WSL installation finishes.

4.  **Reconfigure Docker Desktop:**
    * Launch **Docker Desktop**. It should detect missing WSL distros and perform a clean re-initialization. Wait until it shows "Docker Desktop is running."
    * Go to Docker Desktop **Settings > Resources > WSL Integration** and ensure your new Ubuntu distro is enabled.

5.  **Reinstall Essential Tools in New WSL:**
    * Open a **new WSL Ubuntu terminal**.
    * Add your user to the `docker` group (CRITICAL for permissions):
        ```bash
        sudo usermod -aG docker $USER
        ```
    * **Close your WSL terminal, run `wsl --shutdown` in PowerShell (Admin), restart Docker Desktop, then open a NEW WSL terminal.** This activates the group change.
    * Install your tools:
        ```bash
        # Update package lists
        sudo apt update && sudo apt upgrade -y

        # Basic utilities
        sudo apt install -y curl wget git jq

        # yq (Go-lang version)
        YQ_VERSION="v4.44.2"
        YQ_BINARY="yq_linux_amd64"
        wget "[https://github.com/mikefarah/yq/releases/download/$](https://github.com/mikefarah/yq/releases/download/$){YQ_VERSION}/${YQ_BINARY}" -O /tmp/yq_temp \
            && sudo mv /tmp/yq_temp /usr/local/bin/yq \
            && sudo chmod +x /usr/local/bin/yq

        # Helm
        curl [https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3](https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3) | bash

        # kubectl
        curl -LO "[https://dl.k8s.io/release/$(curl](https://dl.k8s.io/release/$(curl) -L -s [https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl](https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl)" \
            && sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl \
            && rm kubectl

        # k3d
        wget -q -O - [https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh](https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh) | bash

        # Verify Docker connection (should work now)
        docker run hello-world
        ```

6.  **Clone Your Project from GitHub:**
    * In your **new WSL terminal**:
        ```bash
        cd ~
        git clone [https://github.com/akenel/helix-integration-kubernetes-platform.git](https://github.com/akenel/helix-integration-kubernetes-platform.git)
        cd helix-integration-kubernetes-platform
        ```

7.  **Resume Operations:**
    * Now you can proceed with your `automate-helix-setup_v2-0-3.sh` script or other tasks. Remember to keep an eye on disk space periodically!

## RECAP
The Journey So Far: A Triumphant Comeback
We've just navigated a comprehensive recovery and rebuild process. Here's a quick recap of the major milestones:

Initial Problem Identification: We started with pull access denied errors for images from quay.io and docker.io after a reboot.
Login Issues Diagnosed: This quickly led us to docker login issues, pointing to credential helper problems and an unauthenticated Docker environment.
Discovery of Core WSL/Disk Problem: The plot thickened with critical Docker Desktop startup failures, Wsl/Service/RegisterDistro/0x8007274c errors, and the ultimate smoking gun: critically low disk space (24GB remaining) on your C: drive, which was preventing WSL from functioning properly.
Data Preservation (The Heroic Phase!):
Recognizing the risk, you wisely suggested moving HELIX to a new GitHub repository.
We successfully backed up your HELIX folder from \\wsl.localhost to your D: drive.
You then created a brand new GitHub repository akenel/helix-integration-kubernetes-platform and successfully pushed your HELIX project content to it, complete with a proper .gitignore file. This is HUGE for future resilience and collaboration!
WSL and Disk Space Recovery:
With your data safe, we executed the "nuclear option": a full wsl --shutdown followed by wsl --unregister for your Ubuntu, docker-desktop, and docker-desktop-data distributions. This critical step reclaimed your disk space (back to 124 GB free!) and cleared out the corrupted WSL environment.
We then performed a clean wsl --install Ubuntu, setting up a brand new, healthy WSL instance.
Tool Reinstallation: Since the WSL rebuild wiped your previous installations, we systematically reinstalled all your essential tools: git, curl, wget, jq, yq (the correct Go-lang version!), helm, kubectl, and k3d.
Docker Socket Permissions Resolved: The final hurdle was permission denied when Docker tried to access its socket. We fixed this by adding your user to the docker group and restarting WSL/Docker Desktop.
Back in Business: Your docker ps now works, and your automate-helix-setup_v2-0-3.sh script is running, recreating your local registry and pulling/tagging images from scratch.
This has been an intense but incredibly productive debugging journey. You've gained a deep understanding of WSL's inner workings and how to recover from critical failures.

 
```


