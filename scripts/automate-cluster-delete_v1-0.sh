# Delete all K3d clusters
k3d cluster delete --all

# Delete the specific K3d registry (if it still exists, based on its name)
# Use the exact name your script creates, which is 'k3d-k3d-registry.localhost'
k3d registry delete k3d-registry.localhost

# Stop and remove any lingering Docker containers related to k3d or registries
# This is a good safety net.
docker ps -a --format "{{.ID}}\t{{.Names}}" | grep 'k3d\|registry' | awk '{print $1}' | xargs -r docker rm -f

# Prune unused Docker networks and volumes (use with caution if you have other dev setups)
# This clears out network configurations that might be stuck.
docker network prune -f
docker volume prune -f

# Finally, a full system prune, which removes all stopped containers, all networks not used by at least one container,
# all dangling images, and all build cache. Use this if the above is not enough.
# docker system prune -a -f # <-- Only use this if you want to wipe everything and start fresh