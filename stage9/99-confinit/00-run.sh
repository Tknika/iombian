#!/bin/bash -e

VERSION="$(cat config/VERSION)"
ARCH="arm6"

BOOT_CONFIG_FOLDER=/boot/config

# remove trailing slash
BOOT_CONFIG_FOLDER=${BOOT_CONFIG_FOLDER%%+(/)}
# start slash
BOOT_CONFIG_FOLDER=${BOOT_CONFIG_FOLDER##+(/)}

# copy configuration
cp -av config ${ROOTFS_DIR}/boot

# Install and enable confinit
on_chroot <<EOF
curl -sSL  https://github.com/jriguera/confinit/releases/download/v${VERSION}/confinit-${VERSION}-linux-${ARCH} -o /bin/confinit
chmod a+x /bin/confinit
EOF

# systemd units
install -m 644 -g root -o root confinit/systemd/confinit-boot@.service ${ROOTFS_DIR}/lib/systemd/system
install -m 644 -g root -o root confinit/systemd/confinit-intermediate@.service ${ROOTFS_DIR}/lib/systemd/system
install -m 644 -g root -o root confinit/systemd/confinit-final@.service ${ROOTFS_DIR}/lib/systemd/system

on_chroot <<EOF
# Enable service
mv "/lib/systemd/system/confinit-boot@.service" "/lib/systemd/system/confinit-boot@boot-config.service"
mv "/lib/systemd/system/confinit-intermediate@.service" "/lib/systemd/system/confinit-intermediate@boot-config.service"
mv "/lib/systemd/system/confinit-final@.service" "/lib/systemd/system/confinit-final@boot-config.service"
systemctl enable "confinit-boot@boot-config.service"
systemctl enable "confinit-intermediate@boot-config.service"
systemctl enable "confinit-final@boot-config.service"
mkdir -p /${BOOT_CONFIG_FOLDER}
EOF
