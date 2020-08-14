#!/bin/bash

#
# Install Docker prereqs
#
echo -e "\e[33m**********\e[39mBegin installing the latest stable Docker release\e[33m**********\e[39m"
apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common

#
# Add Docker repo
#
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

#
# Update repos
#
apt-get update -y

#
# Install Docker
#
apt-get install -y docker-ce docker-ce-cli containerd.io

#
# Find IP address for Docker daemon config
#
IP=$(hostname -I|cut -d" " -f 1)

#
# Set IP address for Docker daemon config
#
tee /etc/docker/daemon.json > /dev/null << EOF
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "insecure-registries" : ["$IP:443","$IP:80","0.0.0.0/0"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF

mkdir -p /etc/systemd/system/docker.service.d
groupadd docker
MAINUSER=$(logname)
usermod -aG docker $MAINUSER
systemctl daemon-reload
systemctl restart docker
echo -e "\e[33m**********\e[39mEnd installing the latest stable Docker release\e[33m**********\e[39m"

#
# Find the latest stable release version
#
echo -e "\e[33m**********\e[39mBegin installing the latest stable Docker Compose release\e[33m**********\e[39m"
COMPOSEVERSION=$(curl -s https://github.com/docker/compose/releases/latest/download 2>&1 | grep -Po [0-9]+\.[0-9]+\.[0-9]+)

#
# Download and link the latest stable release version
#
curl -L "https://github.com/docker/compose/releases/download/$COMPOSEVERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
echo -e "\e[33m**********\e[39mEnd installing the latest stable Docker Compose release\e[33m**********\e[39m"

#
# configure the motd - NB this was generated at http://patorjk.com/software/taag/#p=display&f=Star%20Wars&t=docker%0Aserver
#
cat > /etc/motd <<'EOF'
 _______   ______     ______  __  ___  _______ .______
|       \ /  __  \   /      ||  |/  / |   ____||   _  \
|  .--.  |  |  |  | |  ,----'|  '  /  |  |__   |  |_)  |
|  |  |  |  |  |  | |  |     |    <   |   __|  |      /
|  '--'  |  `--'  | |  `----.|  .  \  |  |____ |  |\  \----.
|_______/ \______/   \______||__|\__\ |_______|| _| `._____|

     _______. _______ .______     ____    ____  _______ .______
    /       ||   ____||   _  \    \   \  /   / |   ____||   _  \
   |   (----`|  |__   |  |_)  |    \   \/   /  |  |__   |  |_)  |
    \   \    |   __|  |      /      \      /   |   __|  |      /
.----)   |   |  |____ |  |\  \----.  \    /    |  |____ |  |\  \----.
|_______/    |_______|| _| `._____|   \__/     |_______|| _| `._____|

EOF
