#!/bin/bash -e

SERVICES_FOLDER_PATH="/opt/iombian-services"
SERVICE_NAME="iombian-config-file-handler"

# Copy .env file to service folder
install -m 644 -g ${FIRST_USER_NAME} -o ${FIRST_USER_NAME} env-vars/.env ${ROOTFS_DIR}${SERVICES_FOLDER_PATH}/${SERVICE_NAME}/.env