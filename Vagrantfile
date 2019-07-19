# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

	# Host name of the VM
  config.vm.hostname = "craft.local"
  
  # Box Settings
  config.vm.box = "ubuntu/xenial64"
  
  # Provider Settings
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
	vb.cpus = 2
  end

  # Network Settings
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.network :forwarded_port, guest: 3000, host: 3000, auto_correct: true
  config.vm.network :forwarded_port, guest: 3001, host: 3001, auto_correct: true

  # Folder Settings
  config.vm.synced_folder "www", "/var/www", :nfs => { :mount_options => ["dmode=777", "fmode=666"] }
  
  config.vm.provision "shell", path: "bootstrap.sh"
  config.vm.provision "shell",
	inline: "mysql -uroot -proot -e \"SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));\"",
    run: "always"
  
  if Vagrant.has_plugin?('vagrant-hostmanager')
	config.hostmanager.enabled = true
	config.hostmanager.manage_host = true
	config.hostmanager.manage_guest = true
	config.hostmanager.ignore_private_ip = false
	config.hostmanager.include_offline = true
	config.hostmanager.aliases = %w(craft.local)
  end
end