# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Vagrant development environment box. 
  # More boxes available at https://vagrantcloud.com/search.
  # Currently set to the latest LTS release of ubuntu
  config.vm.box = "ubuntu/xenial64"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # Enable public access to the opened port
  config.vm.network "forwarded_port", guest: 80, host: 8080
  # Or enable the following to only allow local access:
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share folders with the guest VM.
  # First arg is host path to actual folder.
  # Second arg is guest path to mount folder. 
  # Optional third arg is set of non-required options.
  config.vm.synced_folder "./", "/home/ubuntu/project"
  config.vm.synced_folder "./webroot", "/var/www/html"

  # Virtualbox-specific configuration
  cpus = "1"
  memory = "512"
  config.vm.provider "virtualbox" do |vb|
    # Adjust VM parameters
    vb.customize ["modifyvm", :id, "--cpus", cpus, "--memory", memory]
    # Speed up boot https://bugs.launchpad.net/cloud-images/+bug/1627844
    vb.customize ["modifyvm", :id, "--uartmode1", "disconnected"] 
    # Enable for troubleshooting purposes if necessary
    # vb.gui = true
  end
  
  # Provision with chef solo
  # All files are relative to vagrantfile
  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = "chef/cookbooks"
    chef.add_recipe "base"
    chef.channel = "stable"
  end

end
