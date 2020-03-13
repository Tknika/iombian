#!/bin/bash -e

INSTALLATION_PATH="/opt/hivemq-mqtt-web-client"

if [ -d "$INSTALLATION_PATH" ]; then
  rm -rf ${INSTALLATION_PATH}
fi

git clone https://github.com/hivemq/hivemq-mqtt-web-client.git $INSTALLATION_PATH
chown -R $FIRST_USER_NAME:$FIRST_USER_NAME $INSTALLATION_PATH

# enable systemd service
systemctl enable mqtt-web-client.service
