#!/bin/bash -e

# Create 'data' folder
mkdir -p /data

# Set owership and permissions
chown $FIRST_USER_NAME:$FIRST_USER_NAME /data
chmod 700 /data