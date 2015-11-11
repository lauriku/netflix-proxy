# Introduction
This is a set of Ansible playbooks to set up the needed servers for routing connections to Netflix (or other services with region restrictions). The playbooks set up two servers, a proxy and a dns server. The proxy server is configured with haproxy, and the dns server used is just simple dnsmasq.

There are a lot of available setups which basically do the same thing, but I wanted to try out Ansible and do a complete solution with separate servers for the proxy and dns, with the dns server preferably in an internal network. I had a previous setup with sniproxy, but that proved out to be fairly unstable, so finding a working haproxy config from https://github.com/trick77/tunlr-style-dns-unblocking , was key for this mini-project.

# Requirements:
* [Vagrant](http://www.vagrantup.com/downloads) installed (for testing)
* [Ansible](http://docs.ansible.com/ansible/intro_installation.html) installed

# Test Environment Setup
```
vagrant up
```

This should give you two virtual boxes, one 'dns' and one 'proxy'. Try either 
```vagrant ssh proxy``` or ```vagrant ssh dns``` to see what's installed in either box.

When doing changes to ansible configs, a new provision can be made with ```vagrant provision```
