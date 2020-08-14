BOX_IMAGE = "generic/ubuntu1804"
NAME = "vagrant-ubuntu-docker"

Vagrant.configure("2") do |config|
  config.vm.box = BOX_IMAGE
  config.vm.hostname = NAME

  #
  #  Provider (esxi) settings
  #
  config.vm.provider :vmware_esxi do |esxi|
    # https://github.com/tcnksm/vagrant-secret
    esxi.esxi_hostname = Secret.esxi_hostname
    esxi.esxi_username = Secret.esxi_username
    esxi.esxi_password = Secret.esxi_password
    esxi.esxi_virtual_network = ['VM Management']
    esxi.guest_mac_address = ['00:50:56:00:00:02']
    esxi.esxi_disk_store = 'datastore1'
    esxi.guest_name = NAME
    esxi.guest_memsize = '2048'
    esxi.guest_numvcpus = '2'
    #esxi.guest_boot_disk_size = 30
  end

  #
  # Rsync the current directory and mount to /vagrant on the VM
  #
  config.vm.synced_folder('.', '/vagrant', type: 'rsync')

  args = []
  config.vm.provision "apt-get update/upgrade script", type: "shell",
      path: "scripts/apt_update.sh",
      args: args

  args = []
  config.vm.provision "dotfiles install", type: "shell",
      path: "scripts/dotfiles.sh",
      args: args

  args = []
  config.vm.provision "docker install", type: "shell",
      path: "scripts/docker.sh",
      args: args

  args = []
  config.vm.provision "vmware tools", type: "shell",
      path: "scripts/vmware_tools.sh",
      args: args

  args = []
  config.vm.provision "netplan", type: "shell",
      path: "scripts/netplan.sh",
      args: args

  args = [Secret.mount_one,Secret.mount_two,Secret.server,Secret.remote_one,Secret.remote_two]
  config.vm.provision "fstab", type: "shell",
      path: "scripts/fstab.sh",
      args: args

  args = []
  config.vm.provision "reboot", type: "shell",
      path: "scripts/reboot.sh",
      args: args
end
