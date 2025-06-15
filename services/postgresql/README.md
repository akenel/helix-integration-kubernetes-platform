# 🐘 PostgreSQL Initialization Guide 🚀

This guide details the setup and common pitfalls encountered while initializing the PostgreSQL database within our Helix Kubernetes platform. We've wrestled this beast, and now you don't have to! 😉

---

## 🎯 **Purpose**

The `postgresql-init-db-users` Kubernetes Job is responsible for:
* Waiting for the PostgreSQL server to be fully ready.
* Creating the necessary databases: `n8n-db` and `keycloak-db`.
* Creating dedicated users (`n8nuser` and `keycloakuser`) with encrypted passwords.
* Granting these users full privileges on their respective databases.

---

## 🛠️ **Key Configuration Files**

* `services/postgresql/postgresql-values.yaml`: Defines the core PostgreSQL deployment parameters, including the superuser password.
* `services/postgresql/postgresql-init-job.yaml`: Contains the Kubernetes Job definition with the `bash` script for database initialization.

---

## ⚠️ **Common Gotchas & Solutions (The "Pro-Bro" Gold!)**

This section covers the painful lessons learned, so your journey is smooth!

### 🔑 **Gotcha 1: The Elusive Password Mismatch!**

Even when it seems right, a tiny mismatch can cause `FATAL: password authentication failed for user "postgres"`.

* **The Pain:** Your `postgresql-init-job.yaml` (specifically the `PGPASSWORD` environment variable) **MUST** use the **EXACT** password set for `postgresPassword` in `services/postgresql/postgresql-values.yaml`.
* **The Fix:**
    1.  Ensure `services/postgresql/postgresql-values.yaml` has `postgresPassword: "yourSuperSecretPostgresPassword"` (using your actual password, e.g., `dbpass123`).
    2.  Ensure `services/postgresql/postgresql-init-job.yaml` has the `PGPASSWORD` env variable set to this **exact same value**:
        ```yaml
            env:
              - name: PGPASSWORD
                value: "yourSuperSecretPostgresPassword" # <-- MUST MATCH!
        ```

### 📝 **Gotcha 2: The Heredoc `EOF` Syntax Nightmare!**

`bash` heredocs are picky about their delimiters. A single extra space or comment can break them!

* **The Pain:** Errors like `bash: line X: warning: here-document ... delimited by end-of-file (wanted EOF')` or `ERROR: syntax error at or near "EOF"`. This means `bash` didn't see the end of the `psql` command.
* **The Fix (The Robust `cat <<'SQL_SCRIPT'` Method):** Instead of direct `psql <<EOF`, we write the SQL to a temp file and then execute it. This is far more resilient to whitespace issues.
    ```yaml
            args:
              - |
                # ... (your existing script commands)
                echo "Creating databases and users..."
                cat <<'SQL_SCRIPT' > /tmp/init.sql
                CREATE DATABASE "n8n-db";
                CREATE DATABASE "keycloak-db";
                CREATE USER "n8nuser" WITH ENCRYPTED PASSWORD 'n8npassword';
                GRANT ALL PRIVILEGES ON DATABASE "n8n-db" TO "n8nuser";
                CREATE USER "keycloakuser" WITH ENCRYPTED PASSWORD 'keycloakpassword';
                GRANT ALL PRIVILEGES ON DATABASE "keycloak-db" TO "keycloakuser";
SQL_SCRIPT # <-- THIS MUST BE FLUSH LEFT (NO INDENTATION) AND HAVE NO TRAILING CHARACTERS/COMMENTS
                psql -h postgresql -U postgres -d postgres -f /tmp/init.sql
                echo "Initialization complete."
    ```
    **Remember:** The closing `SQL_SCRIPT` (or whatever you name your delimiter) **MUST** start at column 1 (no leading spaces) and have nothing else on that line.

### 🐛 **Gotcha 3: Debugging `psql` Connections into the Pod!**

Connecting to verify state can be tricky due to `kubectl exec` and `psql`'s default behaviors.

* **The Pain:** `psql: error: connection to server on socket "/tmp/.s.PGSQL.5432" failed: fe_sendauth: no password supplied` or `local user with ID 1001 does not exist`. Also, `export PGPASSWORD="..."` in your local shell **does NOT** automatically pass into `kubectl exec` for one-off commands!
* **The Fix (The "Old-Fashioned" Interactive Way):**
    1.  **Get an interactive shell inside the pod:**
        ```bash
        kubectl exec -it -n helix postgresql-0 -- bash
        ```
    2.  **Once inside the pod (`I have no name!@postgresql-0:/$`), connect to `psql` and type the password (e.g., `dbpass123`) when prompted:**
        ```bash
        psql -h 127.0.0.1 -p 5432 -U postgres -d postgres
        ```
        (Using `127.0.0.1` and `5432` explicitly forces a TCP/IP connection that will correctly ask for a password.)
    3.  **Verify databases (`\l`) and users (`\du`) at the `postgres=#` prompt.**
    4.  Type `\q` to exit `psql`, then `exit` to leave the pod's shell.

### ✅ **Gotcha 4: Understanding Job Status (`0/1 Completed`)**

It looks wrong, but it's usually right!

* **The Pain:** Seeing `postgresql-init-db-users-xxxxx 0/1 Completed` in `kubectl get pods`. It looks like it failed, but it actually succeeded.
* **The Fix:** A Kubernetes `Job` runs its task to completion and then its pod exits. `0/1` means 0 pods are *currently running and ready*, which is true for a *completed* job. The true indicator of success is `STATUS Complete` and `COMPLETIONS 1/1` from `kubectl get job`. Always check the Job's logs for the final `Initialization complete.` message.

---

## 🔄 **The "Full PostgreSQL Rebirth" (When All Else Fails)**

Sometimes, a clean slate is the fastest path to sanity. This will delete all PostgreSQL data and deployments and start fresh.

1.  **Ensure `services/postgresql/postgresql-values.yaml` and `services/postgresql/postgresql-init-job.yaml` are correctly configured with your desired `postgresPassword` (e.g., `dbpass123`).**
2.  **Run these commands in sequence:**
    ```bash
    echo "--- Initiating full PostgreSQL cleanup ---"
    helm uninstall postgresql -n helix
    kubectl delete pvc data-postgresql-0 -n helix
    kubectl delete job postgresql-init-db-users -n helix
    kubectl delete secret postgresql -n helix # To ensure new password takes effect
    sleep 5 # Give Kubernetes a moment to clean up (optional, but good for stability)

    echo "--- Installing fresh PostgreSQL deployment ---"
    helm install postgresql bitnami/postgresql -f services/postgresql/postgresql-values.yaml -n helix --create-namespace

    echo "--- Waiting for PostgreSQL pod to be ready ---"
    kubectl get pods -n helix -w # Wait for postgresql-0 to be 1/1 Running, then Ctrl+C

    echo "--- Applying PostgreSQL Initialization Job ---"
    kubectl apply -f services/postgresql/postgresql-init-job.yaml

    echo "--- Monitoring Initialization Job progress ---"
    kubectl get job postgresql-init-db-users -n helix -w # Wait for Completions 1/1, then Ctrl+C

    echo "--- Checking Initialization Job logs for final confirmation ---"
    kubectl logs -f $(kubectl get pod -l job-name=postgresql-init-db-users -n helix -o jsonpath='{.items[0].metadata.name}') -n helix
    ```
    You should see `Initialization complete.` in the logs!

---

## ✅ **PostgreSQL Status: ENTERPRISE READY!**

With this setup, the following databases and users are created and configured:
* **Databases:** `n8n-db`, `keycloak-db`
* **Users:** `n8nuser`, `keycloakuser` (with `n8npassword` and `keycloakpassword` respectively)

Your base for the platform is rock solid! 💪