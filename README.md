# Introduction
This is a set of Ansible playbooks to set up the needed servers for routing connections to Netflix (or other services with region restrictions). The playbooks set up two servers, a proxy and a dns server. The proxy server is configured with haproxy, and the dns server used is just simple dnsmasq.

There are a lot of available setups which basically do the same thing, but I wanted to try out Ansible and do a complete solution with separate servers for the proxy and dns, with the dns server preferably in an internal network. I had a previous setup with sniproxy, but that proved out to be fairly unstable, so finding a working haproxy config from [tunlr](https://github.com/trick77/tunlr-style-dns-unblocking) , was key for this mini-project. Also a huge help were the projects [netproxy](https://github.com/skorokithakis/netproxy) and [netflix-proxy](https://github.com/ab77/netflix-proxy) for their excellent setups. The initial plan was to use Docker here as well, but my OpenVZ provider doesn't support them currently.

# Requirements:
* [Vagrant](http://www.vagrantup.com/downloads) installed (for testing)
* [Ansible](http://docs.ansible.com/ansible/intro_installation.html) installed
* A linux server for the proxy (assuming Debian/Ubuntu for these playbooks), a low-end VPS is fine. This server would ideally be located in a region which content you would like to gain access to, for example the US
* A linux server for the DNS, for example a Raspberry Pi at your home, with Raspbian installed.
* Root access to both of these boxes

# Test Environment Setup
```
vagrant up
```

This should give you two virtual boxes, one 'dns' and one 'proxy'. Try either 
```vagrant ssh proxy``` or ```vagrant ssh dns``` to see what's installed and configured in either box.

When doing changes to ansible configs, a new provision can be made with ```vagrant provision```

# Installation
Edit the file in deploy/inventory/production to enter the access details for your hosts. Ensure you have either root access or a user with sudo-permissions on the box.
