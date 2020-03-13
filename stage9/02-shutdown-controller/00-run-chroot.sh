#!/bin/bash -e

# Remove previous files
rm -rf /usr/local/bin/listen-for-shutdown.py*
rm -rf /etc/systemd/system/listen-for-shutdown.service*

# Install the service
wget https://raw.githubusercontent.com/Tknika/iom2040-shutdown-controller/master/install.sh -O - | sh
