#!/bin/bash -e

./update-submodules.sh

echo "Modifying stage2"
mv stage2/EXPORT_IMAGE stage2/.EXPORT_IMAGE
mv stage2/EXPORT_NOOBS stage2/.EXPORT_NOOBS

echo "Building iombian image ..."
./build-docker.sh

echo "Restoring stage2"
mv stage2/.EXPORT_IMAGE stage2/EXPORT_IMAGE
mv stage2/.EXPORT_NOOBS stage2/EXPORT_NOOBS