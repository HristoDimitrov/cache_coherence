#!/bin/bash

# Dynamically find the container name
CONTAINER_NAME=$(docker ps --filter "name=coherence_shell" --format '{{.Names}}')

# If the container is running, attach to it
if [ -n "$CONTAINER_NAME" ]; then
    echo "Attaching to $CONTAINER_NAME..."
    docker exec -it "$CONTAINER_NAME" bash
else
    echo "Error: No running container named 'coherence_shell'. Start it first using './start_docker.sh'."
fi
