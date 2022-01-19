#!/bin/bash -e

# GitHub issue: https://github.com/RPi-Distro/pi-gen/issues/561 
echo "Compile using buster instead of bullseye ..."
sed -i 's/:bullseye/:buster/' ./build-docker.sh
sed -i 's/:bullseye/:buster/' ./Dockerfile

echo "Done."