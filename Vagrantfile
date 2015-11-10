# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
 
  config.vm.define "proxy" do |proxy|
    proxy.vm.box = "debian"
    proxy.vm.box_url = "https://halkyon.net/vagrant/debian-jessie-minimal-amd64.box"
    proxy.vm.hostname = "proxy-host"
    proxy.vm.provision :shell, path: "install_python.sh"
  end

  config.vm.define "dns" do |dns|
    dns.vm.box = "debian"
    dns.vm.box_url = "https://halkyon.net/vagrant/debian-jessie-minimal-amd64.box"
    dns.vm.hostname = "dns-host"
    dns.vm.provision :shell, path: "install_python.sh"
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "deploy/site.yml"
    ansible.limit = "all"
  end
end
