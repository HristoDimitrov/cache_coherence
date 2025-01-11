#!/bin/bash

# Stop and remove all services
docker-compose -f docker-compose.coherence_dev.yml down

echo "Docker environment stopped."
