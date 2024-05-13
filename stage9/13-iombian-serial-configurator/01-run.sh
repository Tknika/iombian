#!/bin/bash -e

PROJECT_NAME="iombian-serial-configurator"
INSTALLATION_PATH="/opt/iombian-serial-configurator"

# Enable DWC2 dtoverlay
on_chroot << EOF
sed -i 's/\[pi4\]/\[pi4\]\ndtoverlay=dwc2/' /boot/config.txt
sed -i 's/rootwait/rootwait modules-load=dwc2,g_serial/' /boot/cmdline.txt
EOF

# Create the installation folder
on_chroot << EOF
if [ -d "$INSTALLATION_PATH" ]; then
  rm -rf ${INSTALLATION_PATH}
fi
mkdir -p $INSTALLATION_PATH
EOF

install -m 644 -g root -o root ${PROJECT_NAME}/requirements.txt ${ROOTFS_DIR}$INSTALLATION_PATH
install -m 644 -g root -o root ${PROJECT_NAME}/systemd/${PROJECT_NAME}.service ${ROOTFS_DIR}/etc/systemd/system
cp -r ${PROJECT_NAME}/src/* ${ROOTFS_DIR}$INSTALLATION_PATH

# Create the virtual environment
on_chroot << EOF
cd $INSTALLATION_PATH
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip setuptools wheel
pip install -r requirements.txt

chown -R $FIRST_USER_NAME:$FIRST_USER_NAME $INSTALLATION_PATH

systemctl enable ${PROJECT_NAME}
EOF