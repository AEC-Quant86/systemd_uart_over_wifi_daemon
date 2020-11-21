#!/bin/bash

#run only with root

chmod +x wifiBridge.sh
rm -rf "/etc/wifiBridge/"
mkdir "/etc/wifiBridge/"
cp -f "wifiBridge_db" "/etc/wifiBridge/wifiBridge_db"
cp -f "wifiBridge.sh" "/bin/wifiBridge.sh"
cp -f "wifi-serial.service" "/etc/systemd/system/wifi-serial.service"
systemctl daemon-reload
systemctl start wifi-serial
systemctl enable wifi-serial