#!/bin/bash -e

SERVICES_FOLDER_PATH="/opt/iombian-services"
SERVICE_NAME="iombian-config-file-handler"
SERVICE_VERSION="0.1.0"

# Create service folder
mkdir -p ${SERVICES_FOLDER_PATH}/${SERVICE_NAME}

# Download service file locally
wget https://raw.githubusercontent.com/Tknika/iombian-services-marketplace/main/services/${SERVICE_NAME}/${SERVICE_VERSION}/docker-compose.yaml -P ${SERVICES_FOLDER_PATH}/${SERVICE_NAME}

# Asign correct ownership to the folder
chown -R ${FIRST_USER_NAME}:${FIRST_USER_NAME} ${SERVICES_FOLDER_PATH}/${SERVICE_NAME}

# Pull docker image
docker compose pull -f ${SERVICES_FOLDER_PATH}/${SERVICE_NAME}/docker-compose.yaml