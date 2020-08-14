#!/bin/bash

#
# Copy the netplan config file
#
echo -e "\e[33m**********\e[39mBegin network config\e[33m**********\e[39m"
mv -f /vagrant/config/01-netcfg.yaml /etc/netplan/01-netcfg.yaml
chown root:root /etc/netplan/01-netcfg.yaml
chmod 0644 /etc/netplan/01-netcfg.yaml
echo -e "\e[33m**********\e[39mEnd network config\e[33m**********\e[39m"

#
# Modify resolv.conf to use the correct nameservers
#
echo -e "\e[33m**********\e[39mBegin resolv config\e[33m**********\e[39m"
sudo rm -f /etc/resolv.conf
sudo ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf
sudo sed -i_bak '/nameserver 4.2.2.1/d' /etc/resolv.conf
sudo sed -i_bak '/nameserver 4.2.2.2/d' /etc/resolv.conf
sudo sed -i_bak '/nameserver 208.67.220.220/d' /etc/resolv.conf
sudo sed -i_bak '/^# Too/d' /etc/resolv.conf
echo -e "\e[33m**********\e[39mEnd resolv config\e[33m**********\e[39m"