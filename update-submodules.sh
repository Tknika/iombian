#!/bin/bash -e

echo "Checking git submodules ..."
git submodule init
git submodule update

echo "Pulling latest changes ..."
git -C pi-gen pull origin master
git -C stage9/99-confinit/config pull origin master

echo "Done."