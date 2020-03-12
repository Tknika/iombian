#!/bin/bash -e

install -m 644 files/mosquitto-buster.list ${ROOTFS_DIR}/etc/apt/sources.list.d/

on_chroot apt-key add - < files/mosquitto-repo.gpg.key

on_chroot << EOF
apt-get update
apt-get install -y mosquitto mosquitto-clients
systemctl enable mosquitto
EOF
