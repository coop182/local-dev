#!/usr/bin/env bash

echo "############################################"
echo "#####         Starting Server!         #####"
echo "############################################"
echo " "

cd ../../../
vagrant up --no-provision
mkdir data
mount -t smbfs //guest@192.168.33.10/data data

echo " "
echo "############################################"
echo "#####   Server Booted, Provisioning!   #####"
echo "############################################"
echo " "

vagrant provision
mount -t smbfs //guest@192.168.33.10/data data

echo " "
echo "############################################"
echo "#####         Provisioning Done!       #####"
echo "############################################"