#!/bin/bash

cd
export vm_dir=$HOME/galaxy_install
mkdir -p $vm_dir
cd $vm_dir
sudo ssh-keygen -f /root/.ssh/id_rsa -t rsa -N ''
sudo cp -v /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys

sudo apt-get install vim git python2.7 software-properties-common -y
#sudo apt-add-repository ppa:ansible/ansible -y
#sudo apt-get update
sudo apt-get install ansible -y

echo "[ARTiMED_host_servers]" > $vm_dir/ansible_hosts
echo "127.0.0.1" >> $vm_dir/ansible_hosts
#export ANSIBLE_INVENTORY=$vm_dir/ansible_hosts
if git clone https://github.com/fabiorjvieira/general.git 
then
	mv -f $vm_dir/general/Ansible/* $vm_dir/; rm -rf $vm_dir/general/ #to be removed, however git must be corrected
	sed "s/???vm_dir???/$vm_dir/" $vm_dir/ARTiMED.prototype.yml > $vm_dir/ARTiMED.yml
	sudo ansible-playbook -i $vm_dir/ansible_hosts "-e 'VM_DIR=$vm_dir'" $vm_dir/ARTiMED.yml
fi


