# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.
  
  # set box
  config.vm.box = "centos6.5"

  # select box centos6.5
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box"
 
  # set port forward
  config.vm.network "forwarded_port", guest: 80, host: 8080
   
  # set private network
  config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"
  
  # set synced_folder
  config.vm.synced_folder "./", "/vagrant", owner:"vagrant", group:"vagrant", mount_options: ['dmode=777', 'fmode=777']
  
  # set encode
  Encoding.default_external = 'UTF-8'

  # set provision 
  config.vm.provision :shell, privileged: false, :path => "./setup/provision.sh"
end
