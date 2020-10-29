#!/bin/bash -e

INSTALLATION_PATH="/opt/iombian-status-display"

# Enable I2C and SPI
sed -i '/#dtparam=spi=on/c\dtparam=spi=on' /boot/config.txt
sed -i '/#dtparam=spi=off/c\dtparam=spi=on' /boot/config.txt
sed -i '/dtparam=spi=off/c\dtparam=spi=on' /boot/config.txt
sed -i '/#dtparam=i2c_arm=on/c\dtparam=i2c_arm=on' /boot/config.txt
sed -i '/#dtparam=i2c_arm=off/c\dtparam=i2c_arm=on' /boot/config.txt
sed -i '/dtparam=i2c_arm=off/c\dtparam=i2c_arm=on' /boot/config.txt

# Create the installation folder
if [ -d "$INSTALLATION_PATH" ]; then
  rm -rf ${INSTALLATION_PATH}
fi

mkdir $INSTALLATION_PATH
cp iombian-status-display/requirements.txt $INSTALLATION_PATH
cp -r iombian-status-display/src/* $INSTALLATION_PATH
cp iombian-status-display/systemd/iombian-status-display.service /etc/systemd/system/
chown -R $FIRST_USER_NAME:$FIRST_USER_NAME $INSTALLATION_PATH

# Create the virtual environment
cd $INSTALLATION_PATH
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt