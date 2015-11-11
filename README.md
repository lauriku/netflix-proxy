# Introduction
This is a set of Ansible playbooks to set up the needed servers for routing connections to Netflix (or other services with region restrictions). The playbooks set up two servers, a proxy and a dns server. The proxy server is configured with haproxy, and the dns server used is just simple dnsmasq.

There are a lot of available setups which basically do the same thing, but I wanted to try out Ansible and do a complete solution with separate servers for the proxy and dns, with the dns server preferably in an internal network. I had a previous setup with sniproxy, but that proved out to be fairly unstable, so finding a working haproxy config from [tunlr](https://github.com/trick77/tunlr-style-dns-unblocking) , was key for this mini-project. Also a huge help were the projects [netproxy](https://github.com/skorokithakis/netproxy) and [netflix-proxy](https://github.com/ab77/netflix-proxy) for their excellent setups. The initial plan was to use Docker here as well, but my OpenVZ provider doesn't support them currently.

# Requirements:
* [Vagrant](http://www.vagrantup.com/downloads) installed (for testing)
* [Ansible](http://docs.ansible.com/ansible/intro_installation.html) installed
* A linux server for the proxy (assuming Debian 8/Ubuntu 14 for these playbooks), a low-end VPS is fine (even 128mb memory is sufficient for one client). This server would ideally be located in a region which content you would like to gain access to, for example the US
* A linux server for the DNS, for example a Raspberry Pi at your home, with Raspbian installed.
* Root access to both of these boxes
* Python installed on bot of the boxes

# Test Environment Setup
```
vagrant up
```

This should give you two virtual boxes, one 'dns' and one 'proxy'. Try either 
```vagrant ssh proxy``` or ```vagrant ssh dns``` to see what's installed and configured in either box.

When doing changes to ansible configs, a new provision can be made with ```vagrant provision```

# Installation
Edit the file in deploy/inventory/production to enter the access details for your hosts. Ensure you have either root access or a user with sudo-permissions on the box.

1. Edit the file ```deploy/inventory/production``` with access details of your servers, ip, ssh user and ssh port. Note that this user should be either a user with sudo privileges or simply root (not recommended)
2. Run ```ansible-playbook -i deploy/inventory/production deploy/site.yml``` to deploy
3. Configure your clients to use the DNS server as their primary DNS, either manually or through DHCP.

## Low-end VPS Providers
* [linode](https://www.linode.com/) $5/month
* [DigitalOcean](https://www.digitalocean.com/) $10/month
* [ChicagoVPS](http://chicagovps.net/) $1/month
* [Deepnet Solutions](https://www.deepnetsolutions.com/kvm-vps.html) $2.50/month
* [HudsonValleyHost](http://hudsonvalleyhost.com/vps.php) $15/year
