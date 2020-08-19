# vagrant-ubuntu-docker

A simple Vagrantfile to setup Ubuntu 18.04 server with Docker on ESXi.

## Installs

* Docker
* Docker-compose
* NUT client (UPS monitoring)
* My public dotfiles
* VMware Tools
* Netplan config
* Sets up environments file
* Creates Docker traefik proxy network
* fstab mounts

## Usage

* Requires - <https://github.com/josenk/vagrant-vmware-esxi>

```bash
vagrant up
vagrant destroy -f
```
