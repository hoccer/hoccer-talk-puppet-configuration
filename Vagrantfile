# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider "virtualbox" do |v|
    v.name = "hoccer_talk"
    v.memory = 4096
    v.cpus = 2
  end

  config.vm.box = "ubuntu/trusty64"
  config.vm.network "forwarded_port", guest: 443, host: 8443
  config.vm.network "forwarded_port", guest: 8444, host: 8444
  config.vm.network "private_network", ip: "192.168.60.10"

  # ssh agent support
  config.ssh.private_key_path = [ '~/.vagrant.d/insecure_private_key', '~/.ssh/id_rsa' ]
  config.ssh.forward_agent = true

  # Enable shell provisioning
  config.vm.provision :shell do |shell|
    shell.inline = <<-SCRIPT
      sudo apt-get update
      sudo apt-get -y install git-core puppet ruby-dev make
      sudo gem install librarian-puppet --version 1.3.0
    SCRIPT
  end
end
