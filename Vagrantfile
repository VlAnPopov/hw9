# -*- mode: ruby -*-
# vi: set ft=ruby :

boxes = [
  { :name => "Systemd", :box => "generic/centos8s", :memory => 2048, :cpus => 2, :version => "1804.02",}
 ]

Vagrant.configure("2") do |config|

  boxes.each do |box|
    config.vm.define box[:name] do |target|
      target.vm.provider "virtualbox" do |v|
        v.name = box[:name]
        v.memory = box[:memory]
        v.cpus = box[:cpus]
      end
      target.vm.box = box[:box]
      target.vm.hostname = box[:name]
      target.vm.synced_folder ".", "/vagrant"
      target.vm.provision "shell", path: "monitor.sh"
#      target.vm.provision "reboot1", type: "shell", inline: "", reboot: true
#      target.vm.provision "shell", path: "testmodule.sh"
#      target.vm.provision "reboot2", type: "shell", inline: "", reboot: true
    end
  end
end