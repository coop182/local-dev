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
echo "#####          Server Booted!          #####"
echo "############################################"

open provision.app

sleep 1
