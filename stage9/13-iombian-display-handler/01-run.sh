#!/bin/bash -e

PROJECT_NAME="iombian-display-handler"
INSTALLATION_PATH="/opt/iombian-display-handler"

# Enable I2C and SPI
on_chroot << EOF
sed -i '/#dtparam=spi=on/c\dtparam=spi=on' /boot/config.txt
sed -i '/#dtparam=spi=off/c\dtparam=spi=on' /boot/config.txt
sed -i '/dtparam=spi=off/c\dtparam=spi=on' /boot/config.txt
sed -i '/#dtparam=i2c_arm=on/c\dtparam=i2c_arm=on' /boot/config.txt
sed -i '/#dtparam=i2c_arm=off/c\dtparam=i2c_arm=on' /boot/config.txt
sed -i '/dtparam=i2c_arm=off/c\dtparam=i2c_arm=on' /boot/config.txt
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