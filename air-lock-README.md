k3d cluster list 

kubectl get nodes -o wide


Understood, since you're in an air-locked environment, you'll need to have the required Docker images pre-pulled and pre-loaded before deploying the Vault Helm chart.

Here's the recommended approach:


WSL
cd \~/HELIX/helm-charts
ls
cp /mnt/c/Users/angel/HELIX/TARS/\*.tgz \~/HELIX/helm-charts/

Pre-pull and Load the Vault Docker Image:

Identify the exact Vault version you need to deploy (e.g., hashicorp/vault:1.15.4)
On a machine with access to the Docker registry, pull the Vault image: docker pull hashicorp/vault:1.15.4
Save the image to a tarball: docker save hashicorp/vault:1.15.4 > vault-1.15.4.tar
Transfer the tarball to your air-locked environment
Load the image from the tarball: docker load < vault-1.15.4.tar
Update the Helm Chart Values:

In the vault-values.yaml file, set the image.repository and image.tag values to match the pre-loaded Vault image.
Ensure that any other required configuration, such as storage, networking, and authentication, is properly set in the Helm chart values.
Deploy the Vault Helm Chart:

Use the following command to install or upgrade the Vault deployment:
angelscript




Copy
helm upgrade --install vault \~/HELIX/helm-charts/vault-0.27.0.tgz --namespace helix-core --create-namespace -f services/vault/vault-values.yaml
This command will use the pre-loaded Vault image and the customized Helm chart values to deploy Vault in your air-locked environment.

Verify the Deployment:

Monitor the Vault pod deployment using kubectl get pods -n helix-core.
Check the pod logs for any issues using kubectl logs -n helix-core vault-0.
Ensure that the Vault pods are in the "Running" state and that the Vault service is accessible as expected.
By pre-loading the Vault Docker image and using the customized Helm chart values, you can ensure that the Vault deployment works seamlessly in your air-locked environment. Let me know if you have any other questions or if you need further assistance.