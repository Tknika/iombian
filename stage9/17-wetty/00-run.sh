#!/bin/bash -e

install -m 644 -g root -o root files/systemd/wetty.service ${ROOTFS_DIR}/etc/systemd/system