#!/bin/bash -e

# Ensure that time synchronization services start on boot
on_chroot << EOF
systemctl enable systemd-timesyncd.service
systemctl enable systemd-time-wait-sync.service
EOF