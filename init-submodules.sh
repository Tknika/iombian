#!/bin/bash -e

echo "Checking git submodules ..."
git submodule init
git submodule update

echo "Done."