#!/usr/bin/env bash

echo "#######################################"
echo "#####      Starting Server!       #####"
echo "#######################################"
echo " "

cd ../../../
vagrant up --no-provision
mkdir share
mount -t smbfs //guest@192.168.33.10/data share

echo " "
echo "#######################################"
echo "#####        Server Booted!       #####"
echo "#######################################"
echo " "
echo "#######################################"
echo "#####     Provisioning Server!    #####"
echo "#######################################"
echo " "

vagrant provision
mount -t smbfs //guest@192.168.33.10/data share

echo " "
echo "#######################################"
echo "#####      Provisioning Done!     #####"
echo "#######################################"