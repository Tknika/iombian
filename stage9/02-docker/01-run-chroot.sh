#!/bin/bash -e

# Create the docker group and add the user
groupadd docker

# Add the user to the docker group
usermod -aG docker $FIRST_USER_NAME