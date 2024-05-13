#!/bin/bash -e

DOCKER_INTERNAL_NETWORK_NAME=iombian-internal-services
DOCKER_EXTERNAL_NETWORK_NAME=iombian-external-services

# Install internal network
docker network create ${DOCKER_INTERNAL_NETWORK_NAME}

# Install external network
docker network create ${DOCKER_EXTERNAL_NETWORK_NAME}