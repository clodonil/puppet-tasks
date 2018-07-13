# -*- mode: ruby -*-
 
Vagrant.configure("2") do |config|

  #  Configure base  
  config.vm.box = 'centos/7'
  config.ssh.forward_agent = true
  config.ssh.insert_key = false
  



  # nodes
  $node_count = 2
  (1..$node_count).each do |id|
     config.vm.define "node#{id}" do |nodes|
         nodes.vm.hostname = "node#{id}"
         nodes.vm.network :private_network, :ip => "10.20.1.#{10+id}"
         nodes.vm.provision :hosts, :sync_hosts => true
    
    end
 end

  # Node of Windows
  config.vm.define :windows do |windows|
    windows.vm.box = "mwrock/WindowsNano"
    windows.vm.guest = :windows
    windows.vm.communicator = "winrm"
    windows.vm.network "private_network", ip: "10.20.1.20"    
    windows.vm.provision :hosts, :sync_hosts => true
  end


 # Puppet Tasks - Bolt
 config.vm.define :bolt do |bolt|
    bolt.vm.hostname = "bolt"
    bolt.vm.network :private_network, :ip => "10.20.1.100"
    bolt.vm.provision :hosts, :sync_hosts => true
    
    
 end
end
