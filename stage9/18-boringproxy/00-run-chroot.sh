#!/bin/bash -e

BORINGPROXY_VERSION="v0.9.1"
BORINGPROXY_BINARY_NAME="boringproxy"
INSTALLATION_FOLDER="/usr/local/bin"
BORINGPROXY_BINARY_PATH=${INSTALLATION_FOLDER}/${BORINGPROXY_BINARY_NAME}

# Download file
curl -L https://github.com/boringproxy/boringproxy/releases/download/${BORINGPROXY_VERSION}/boringproxy-linux-arm -o ${BORINGPROXY_BINARY_PATH}

# Set permissions
chmod +x ${BORINGPROXY_BINARY_PATH}