# Introduction
This is a set of Ansible playbooks to set up the needed servers for routing connections to Netflix (or other services with region restrictions). The playbooks set up two servers, a proxy and a dns server. The proxy server is configured with haproxy, and the dns server used is just simple dnsmasq.

# Testing
## Requirements:
* Vagrant installed
* Ansible installed
## Setup
'''vagrant up --provision'''