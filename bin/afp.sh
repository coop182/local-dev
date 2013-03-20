#!/usr/bin/env bash

# Install samba
apt-packages-install     \
  netatalk

# Update netatalk default setup to set guest account
if grep -Lq 'AFPD_GUEST=vagrant' /etc/default/netatalk; then
    sudo sed -e 's|#AFPD_GUEST=.*|AFPD_GUEST=vagrant|gi' -i '/etc/default/netatalk'
fi

# Add default AFPD to end of afpd.conf file
if grep -Lq 'transall -uamlist uams_guest.so' /etc/netatalk/afpd.conf; then
    cat /etc/netatalk/afpd.conf | sed '$a\- -transall -uamlist uams_guest.so -nosavepassword -advertise_ssh' > /etc/netatalk/afpd.conf
fi

# Setup the data share in Apple
if grep -Lq 'local-dev' /etc/netatalk/AppleVolumes.default; then
    sudo sed -e 's|# By default .*|# Set up data share to be known as local-dev|gi' -i '/etc/netatalk/AppleVolumes.default'
    sudo sed -e 's|~/ .*|/data "local-dev" cnidscheme:dbd options:usedots,upriv|gi' -i '/etc/netatalk/AppleVolumes.default'
fi

# Configure vagrant as owner and group of data directory
sudo chown -R vagrant /data
sudo chgrp -R vagrant /data
sudo chmod -R 0775 /data

# restart samba services
system-service netatalk restart
