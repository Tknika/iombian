#!/bin/bash -e

./init-submodules.sh

# Temporal fix until https://github.com/RPi-Distro/pi-gen/issues/561 is fixed
echo "Fix bullseye issue"
./fix-bullseye.sh

echo "Building iombian image ..."
./build-docker.sh