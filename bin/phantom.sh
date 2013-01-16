#!/usr/bin/env bash

# PhantomJS - see: http://phantomjs.org/download.html & http://phantomjs.org/build.html
# 64-bit - http://phantomjs.googlecode.com/files/phantomjs-1.8.1-linux-x86_64.tar.bz2
if [ -d /usr/local/src/phantomjs-1.8.1-linux-x86_64 ]
then
  echo 'We have the src for phantomjs. '
else
  cd /usr/local/src
  curl -L http://phantomjs.googlecode.com/files/phantomjs-1.8.1-linux-x86_64.tar.bz2 | sudo tar jx
  echo 'The phantomjs src is downloaded. '
fi

if [ -L /usr/local/bin/phantomjs ]
then
  echo 'We have a symbolic link for phantomjs. '
else
  echo 'Create a symbolic link for phantomjs. '
  sudo ln -s /usr/local/src/phantomjs-1.8.1-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs
fi

# CasperJS
if [ -d /usr/local/src/casperjs ]
then
  echo 'We have the src for casperjs. '
else
  cd /usr/local/src
  sudo git clone git://github.com/n1k0/casperjs.git
  cd /usr/local/src/casperjs
  sudo git checkout tags/1.0.0
fi

if [ -L /usr/local/bin/casperjs ]
then
  echo 'We have a symbolic link for casperjs. '
else
  echo 'Create a symbolic link for casperjs. '
  sudo ln -sf `pwd`/bin/casperjs /usr/local/bin/casperjs
fi
