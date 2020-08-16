#!/bin/bash

#
# Install nut-client
#
echo -e "\e[33m**********\e[39mBegin UPS client configuration\e[33m**********\e[39m"
sudo apt-get install nut-client -y

#
# Configure NUT client in netclient mode
#
sudo sed -i_bak 's/MODE=none/MODE=netclient/' /etc/nut/nut.conf

#
# Configure NUT client to monitor the UPS master
#
sudo sed -i_bak "s/# MONITOR myups@localhost.*/MONITOR $1 1 $2 $3 slave/" /etc/nut/upsmon.conf
echo -e "\e[33m**********\e[39mEnd UPS client configuration\e[33m**********\e[39m"
