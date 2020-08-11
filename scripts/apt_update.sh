#!/bin/bash

# Stuff to remove dpkg-preconfigure warnings
sudo ex +"%s@DPkg@//DPkg" -cwq /etc/apt/apt.conf.d/70debconf
sudo dpkg-reconfigure debconf -f noninteractive -p critical

# Upgrade the system
echo -e "\e[33m**********\e[39mBegin installing needed updates\e[33m**********\e[39m"
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install gnupg2 jq curl git -y
echo -e "\e[33m**********\e[39mEnd installing needed updates\e[33m**********\e[39m"

# Set local timezone to Phoenix
echo -e "\e[33m**********\e[39mBegin setting local time zone\e[33m**********\e[39m"
sudo rm /etc/localtime && sudo ln -s /usr/share/zoneinfo/US/Arizona /etc/localtime
echo -e "\e[33m**********\e[39mEnd setting local time zone\e[33m**********\e[39m"

# Add the vagrant user to the sudo group
echo -e "\e[33m**********\e[39mBegin add vagrant to sudo group\e[33m**********\e[39m"
sudo usermod -a -G sudo vagrant
echo -e "\e[33m**********\e[39mEnd add vagrant to sudo group\e[33m**********\e[39m"
