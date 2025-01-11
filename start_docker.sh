#!/bin/bash

# Start the services
docker-compose -f docker-compose.coherence_dev.yml up --build

# Wait for 2 seconds to ensure everything starts
sleep 2

echo "Docker environment is up."
echo "Use './enter_docker.sh' to re-enter the container if needed."
