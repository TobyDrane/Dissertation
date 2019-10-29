#!/bin/bash

# Remove old Docker image
docker rmi teastore:base
docker image prune -a

# Lets build the base image
docker build -t teastore:base ./utilities/tools.descartes.teastore.dockerbase/

echo "Created TeaStore base image, printing all Docker images..."

# Just print out all docker images to see
docker image ls -a