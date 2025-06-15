#!/bin/bash

# --- Chuck Norris Jokes for Extra Awesomeness ---
# You can enable these by running the script with NO flag.
# To turn jokes OFF, run: ./scripts/pre-flight-check.sh --chuck-off

# Source the chuck_norris_jokes.sh script to get the joke function
source "./scripts/chuck_norris_jokes.sh" || { echo "Error: Could not source scripts/chuck_norris_jokes.sh. Make sure it exists and is executable."; exit 1; }

# Record start time for execution timer
START_TIME=$(date +%s)

# Default: Jokes are ON.
CHUCK_OFF=false

# Check if the script is run with the --chuck-off flag
if [ "$1" = "--chuck-off" ]; then
    CHUCK_OFF=true # Set flag to true if jokes should be OFF
    shift # Remove the --chuck-off argument for further processing
fi

# Print a welcome message and joke ONLY if jokes are NOT off
if [ "$CHUCK_OFF" = "false" ]; then
    echo ""
    echo "👋 Welcome to the HELIX Pre-Flight Check Script! 🚀"
    echo "Let's ensure your local Kubernetes environment is ready for action!"
    echo "---"
    echo ""
    echo "😂 Why did the developer go broke? Because he used all his cache!"
    echo "Now, let's see if your cluster is rich with resources..."
    echo "---"
    echo ""
fi

ALL_CHECKS_PASSED=true
TOTAL_CHECKS=0
FAILED_CHECKS=0

# Helper function to run and report on checks with style!
run_check() {
    local check_name="$1"
    local command_to_run="$2"
    local success_msg="$3"
    local failure_msg="$4"

    TOTAL_CHECKS=$((TOTAL_CHECKS + 1)) # Increment total checks
    echo "📋 Checking: ${check_name}..."
    if eval "${command_to_run}" &> /dev/null; then
        echo "  ✅ Success: ${success_msg}"
    else
        echo "  ❌ Failed: ${failure_msg}"
        ALL_CHECKS_PASSED=false
        FAILED_CHECKS=$((FAILED_CHECKS + 1)) # Increment failed checks
    fi
    echo "" # Add a newline for readability
}

echo "--- 🚀 Initiating HELIX Pre-Flight Checks! 🚀 ---"
echo ""

# --- System & Tool Checks ---
run_check "K3d Installation" \
    "command -v k3d" \
    "K3d command found, ready to orchestrate." \
    "K3d is not installed. Please install it; it's the key to your cluster kingdom!"

run_check "Kubectl Installation" \
    "command -v kubectl" \
    "Kubectl command found, your direct line to Kubernetes." \
    "Kubectl is not installed. You can't talk to your cluster without it!"

run_check "Docker Daemon Status" \
    "docker info" \
    "Docker daemon is running, powering all your containers." \
    "Docker is not running. Containers need a home! Please start Docker."

run_check "Helm Installation" \
    "command -v helm" \
    "Helm command found, your package manager for Kubernetes." \
    "Helm is not installed. You'll need it to deploy charts."

# --- K3d Cluster & Registry Checks ---
run_check "K3d Cluster Existence" \
    "k3d cluster list | grep -q 'helixstack'" \
    "K3d cluster 'helixstack' exists and is ready for action." \
    "K3d cluster 'helixstack' does not exist. Please create it before proceeding."
run_check "K3d Registry Existence" \
    "k3d registry list | grep -q 'k3d-registry.localhost'" \
    "K3d registry 'k3d-registry.localhost' exists and is ready to serve images." \
    "K3d registry 'k3d-registry.localhost' does not exist. Please create it before proceeding."
run_check "Local Docker Registry Status (localhost:5000)" \
    "docker ps -f name=registry | grep -q 'registry'" \
    "Local Docker registry container is active. Your mirrored images are ready to serve!" \
    "The local Docker registry container is not running. Ensure it's started so Helm can find your images."

# --- Kubernetes Cluster Health Checks ---
run_check "K3d Cluster Nodes Ready" \
    "kubectl get nodes | grep -q ' Ready'" \
    "All K3d cluster nodes are in 'Ready' state. Healthy worker bees!" \
    "Not all K3d cluster nodes are 'Ready'. Check 'kubectl get nodes' for details."

run_check "Core Kubernetes Pods Running Healthily" \
    "kubectl get pods -A | grep 'Running' | grep -v '0/1' | grep -v 'Completed'" \
    "Most essential Kubernetes pods are running healthy. (Note: Vault's 0/1 state is normal if sealed.)" \
    "Some essential Kubernetes pods are not in a healthy 'Running' state. Check 'kubectl get pods -A'."

run_check "Helm Can List Releases" \
    "helm list -A" \
    "Helm is connected to the cluster and can list deployed releases. Configuration is good!" \
    "Helm cannot list releases. Check your KUBECONFIG or cluster connectivity. Is the API server reachable?"

echo "---"

# Record end time for execution timer
END_TIME=$(date +%s)
EXECUTION_TIME=$((END_TIME - START_TIME))

# --- Summary ---
echo "📊 Pre-Flight Check Summary:"
echo "  Total Checks Performed: ${TOTAL_CHECKS}"
echo "  Checks Failed: ${FAILED_CHECKS}"
echo "  Execution Time: ${EXECUTION_TIME} seconds"
echo ""

# --- Final Status Message ---
if [ "$FAILED_CHECKS" -eq 0 ]; then
    echo "🎉 All HELIX Pre-Flight Checks Passed Successfully! 🎉"
    echo "You are cleared for launch, Commander! Your local Kubernetes environment is ready for action."
    if [ "$CHUCK_OFF" = "false" ]; then # Only print if jokes are ON
        echo ""
        echo "$(get_chuck_norris_joke)" # Call the function to get a random joke
    fi
    exit 0
else
    echo "🚨 HELIX Pre-Flight Checks FAILED! 🚨"
    echo "Your environment needs work. Please review the ${FAILED_CHECKS} failed check(s) above and resolve the issues before proceeding with deployment."
    if [ "$CHUCK_OFF" = "false" ]; then # Only print if jokes are ON
        echo ""
        echo "$(get_chuck_norris_joke)" # Call the function to get a random joke
    fi
    exit 1
fi