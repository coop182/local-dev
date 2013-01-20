#!/usr/bin/env bash

echo "############################################"
echo "#####         Starting Server!         #####"
echo "############################################"
echo " "

cd ../../../

if vagrant hosts list >/dev/null; then
	echo "Plugin: vagrant-hostmaster installed"
else
	echo "Plugin: vagrant-hostmaster installing now."
	vagrant gem install vagrant-hostmaster
fi

vagrant up --no-provision
mkdir data
mount -t smbfs //guest@192.168.33.10/data data

echo " "
echo "############################################"
echo "#####   Server Booted, Provisioning!   #####"
echo "############################################"
echo " "

# Get the VM ID
vm_id=$(cat .vagrant | sed "s/.*\":\"\(.*\)\"}}/\1/g")

# Get the hosts
vm_basehost=$(cat Vagrantfile | sed -e ':a' -e 'N' -e '$!ba' -e 's/\n//g' -e "s/.*config\.vm\.host_name[^\"]*=[^\"]*\"\([^\"]*\)\".*/\1/g")
vm_aliases=$(cat Vagrantfile | sed -e ':a' -e 'N' -e '$!ba' -e 's/\n//g' -e "s/.*#config\.hosts\.aliases.*//g" -e "s/.*config.hosts.aliases[^(]*=[^(]*(\([^)]*\)).*/\1/g")

echo "s/192\.168\.33\.10\s*$vm_basehost\s*$vm_aliases\s*\s*VAGRANT\s*$vm_id/HOSTS_EXIST/g"

# Test if hosts have been added
hosts_exist=$(cat /private/etc/hosts | sed "s/192\.168\.33\.10.*$vm_basehost.*$vm_aliases.*#.*VAGRANT.*$vm_id/HOSTS_EXIST/g")

if [[ "$hosts_exist" == *HOSTS_EXIST* ]]
then
	echo "Host file is correct"
	vagrant provision
	mount -t smbfs //guest@192.168.33.10/data data

	echo " "
	echo "############################################"
	echo "#####         Provisioning Done!       #####"
	echo "############################################"
else
	echo "Host file out of date, launching updater"
	#open hostmaster.app
fi

sleep 1
