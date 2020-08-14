#!/bin/bash

#
# Install needed packages
#
echo -e "\e[33m**********\e[39mBegin installing nfs-common\e[33m**********\e[39m"
sudo apt-get install nfs-common -y
echo -e "\e[33m**********\e[39mEnd installing nfs-common\e[33m**********\e[39m"

#
# Create mount points
#
echo -e "\e[33m**********\e[39mBegin create mount points\e[33m**********\e[39m"
sudo mkdir $1
sudo mkdir $2
echo -e "\e[33m**********\e[39mEnd create mount points\e[33m**********\e[39m"

#
# Add to fstab
#
echo -e "\e[33m**********\e[39mBegin adding to fstab\e[33m**********\e[39m"
sudo echo $3":"$4" "$1" nfs nfsvers=3 0 0" >> /etc/fstab
sudo echo $3":"$5" "$2" nfs nfsvers=3 0 0" >> /etc/fstab
echo -e "\e[33m**********\e[39mEnd adding to fstab\e[33m**********\e[39m"


