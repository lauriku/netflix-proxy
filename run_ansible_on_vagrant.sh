#!/usr/bin/env bash
exec ansible $1 -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory --private-key=.vagrant/machines/default/virtualbox/private_key -u vagrant -m $2
exit 0