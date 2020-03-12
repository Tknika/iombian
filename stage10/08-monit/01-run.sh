#!/bin/bash -e

# Configuration
install -m 644 -g root -o root files/default ${ROOTFS_DIR}/etc/default/monit
rm -f ${ROOTFS_DIR}/etc/monit/conf-available/*
install -m 644 -g root -o root files/templates/* ${ROOTFS_DIR}/etc/monit/templates/

# Systemd service
install -m 644 -g root -o root files/systemd/monit.service ${ROOTFS_DIR}/lib/systemd/system
on_chroot << EOF
systemctl enable monit
mkdir -p /etc/monit/conf-enabled
EOF
