#!/bin/bash -e

./init-submodules.sh

# Temporal fix until https://github.com/RPi-Distro/pi-gen/issues/561 is fixed
echo "Fix bullseye issue"
./fix-bullseye.sh

echo "Modifying stage2"
mv stage2/EXPORT_IMAGE stage2/.EXPORT_IMAGE
mv stage2/EXPORT_NOOBS stage2/.EXPORT_NOOBS

echo "Building iombian image ..."
./build-docker.sh || true

echo "Restoring stage2"
mv stage2/.EXPORT_IMAGE stage2/EXPORT_IMAGE
mv stage2/.EXPORT_NOOBS stage2/EXPORT_NOOBS