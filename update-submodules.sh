#!/bin/bash -e

echo "Pulling latest submodule changes ..."
git -C pi-gen pull origin master
git -C stage9/02-iombian-config-file-handler/iombian-config-file-handler pull origin master
git -C stage9/10-iombian-shutdown-handler/iombian-shutdown-handler pull origin master
git -C stage9/11-iombian-button-handler/iombian-button-handler pull origin master
git -C stage9/12-iombian-system-info-provider/iombian-system-info-provider pull origin master
git -C stage9/13-iombian-display-handler/iombian-display-handler pull origin master
git -C stage9/14-iombian-bluetooth-configurator/iombian-bluetooth-configurator pull origin master
git -C stage9/15-iombian-remote-configurator/iombian-remote-configurator pull origin master
git -c stage9/16-iombian-serial-configurator/iombian-serial-configurator pull origin master
git -c stage9/19-iombian-tunnels-handler/iombian-tunnels-handler pull origin master
git -C stage9/20-iombian-services-uploader/iombian-services-uploader pull origin master
git -C stage9/99-confinit/config pull origin master

echo "Done."