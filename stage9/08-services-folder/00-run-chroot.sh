#!/bin/bash -e

SERVICES_FOLDER_PATH="/opt/iombian-services"

# Create the services folder
mkdir -p $SERVICES_FOLDER_PATH

# Asign correct ownership to the services folder
chown -R $FIRST_USER_NAME:$FIRST_USER_NAME $SERVICES_FOLDER_PATH