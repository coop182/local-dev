#!/usr/bin/env bash

echo "#######################################"
echo "#####      Starting Server!       #####"
echo "#######################################"
echo " "
echo " "

cd ../../../
vagrant up --no-provision
mkdir share
mount -t smbfs //guest@192.168.33.10/local-dev share

echo " "
echo " "
echo "#######################################"
echo "#####        Server Ready!        #####"
echo "#######################################"
echo " "
echo " "
echo "#######################################"
echo "#####     Provisioning Server!    #####"
echo "#######################################"
echo " "
echo " "

vagrant provision
mount -t smbfs //guest@192.168.33.10/local-dev share

echo " "
echo " "
echo "#######################################"
echo "#####      Provisioning Done!     #####"
echo "#######################################"
echo " "
echo " "