#!/usr/bin/env bash

echo "############################################"
echo "#####         Stopping Server!         #####"
echo "############################################"
echo " "

cd ../../../
umount data
rm -rf data
vagrant halt

echo " "
echo "############################################"
echo "#####          Server Stopped!         #####"
echo "############################################"