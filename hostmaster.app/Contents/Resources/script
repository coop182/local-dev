#!/usr/bin/env bash

echo "############################################"
echo "#####   Updating Hosts, Provisioning!  #####"
echo "############################################"
echo " "

cd ../../../

vagrant provision
mkdir data
mount -t smbfs //guest@192.168.33.10/data data

echo " "
echo "############################################"
echo "#####      Provisioning Finished!      #####"
echo "############################################"

sleep 1