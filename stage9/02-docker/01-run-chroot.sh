#!/bin/bash -e

# Create the docker group
groupadd -f docker

# Add the user to the docker group
usermod -aG docker $FIRST_USER_NAME