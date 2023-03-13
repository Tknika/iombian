#!/bin/bash -e

on_chroot << EOF
bash <(curl -sL https://deb.nodesource.com/setup_16.x)
apt-get install -y nodejs
EOF