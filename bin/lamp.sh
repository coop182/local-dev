#!/usr/bin/env bash

# Setup Apache, MySql, PHP
apt-packages-install     \
  lamp-server^           \
  phpmyadmin             \
  curl                   \
  libcurl3               \
  libcurl3-dev           \
  php5-curl              \
  php5-gd                \
  php-pear

php-pecl-install mongo

# Allow modules for Apache.
apache-modules-enable actions rewrite headers proxy*

# Replace the default Apache site.
apache-sites-disable default default-ssl

# Allow unsecured remote access to MySQL.
mysql-remote-access-allow

# setup new mysql admin user
mysql -u root -e "GRANT ALL PRIVILEGES ON  * . * TO  'admin'@'localhost' IDENTIFIED BY  'admin';"
mysql -u root -e "GRANT GRANT OPTION ON  * . * TO  'admin'@'localhost' IDENTIFIED BY  'admin';"

# Restart MySQL service for changes to take effect.
mysql-restart

# Set PHP timezone
php-settings-update 'date.timezone' 'Europe/London'

# Set ServerName
( echo "Servername localhost" | sudo tee '/etc/apache2/conf.d/servername' >/dev/null )

if [ ! -d '/vagrant/data' ]; then
    sudo mkdir /vagrant/data
    sudo mkdir /vagrant/data/localhost
fi

#symlink phpmyadmin to localhost
if [ ! -d "/vagrant/data/localhost/phpmyadmin" ]; then
    sudo ln -s /usr/share/phpmyadmin /vagrant/data/localhost
fi

#Setup localhost virtualhost
sudo cat >/etc/apache2/sites-available/00-localhost <<EOF
<VirtualHost *:80>

    ServerAdmin         admin@localhost
    DocumentRoot        /vagrant/data/localhost
    ServerName          localhost

    <Directory /vagrant/data/localhost>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Order allow,deny
        allow from all
    </Directory>

</VirtualHost>
EOF
apache-sites-enable 00-localhost

apache-restart