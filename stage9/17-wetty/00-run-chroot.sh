#!/bin/bash -e

INSTALLATION_PATH="/opt/wetty"

# Create installation folder
mkdir $INSTALLATION_PATH
chown -R $FIRST_USER_NAME:$FIRST_USER_NAME $INSTALLATION_PATH

# Install WeTTY binary file
npm install --unsafe-perm --no-progress -g wetty@2.3.0 --prefix $INSTALLATION_PATH

# Enable systemd service
systemctl daemon-reload
systemctl enable wetty.service