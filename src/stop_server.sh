#!/usr/bin/env bash

echo "#######################################"
echo "#####      Stopping Server!       #####"
echo "#######################################"
echo " "

cd ../../../
umount share
rm -rf share
vagrant halt

echo " "
echo "#######################################"
echo "#####       Server Stopped!       #####"
echo "#######################################"