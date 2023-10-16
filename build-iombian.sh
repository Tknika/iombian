#!/bin/bash -e

./init-submodules.sh

echo "Modifying stage2"
mv stage2/EXPORT_IMAGE stage2/.EXPORT_IMAGE

echo "Building iombian image ..."
./build-docker.sh

echo "Restoring stage2"
mv stage2/.EXPORT_IMAGE stage2/EXPORT_IMAGE