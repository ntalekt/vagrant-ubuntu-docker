#!/bin/bash

# Install guest tools for VMware provider
echo -e "\e[33m**********\e[39mBegin VMware Tools install\e[33m**********\e[39m"
sudo apt-get install -y --no-install-recommends open-vm-tools open-vm-tools-desktop
echo -e "\e[33m**********\e[39mEnd VMware Tools install\e[33m**********\e[39m"
