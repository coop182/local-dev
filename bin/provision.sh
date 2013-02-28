#!/usr/bin/env bash

# {{{ Ubuntu utilities
<%= import 'bin/ubuntu.sh' %>
# }}}

# Use Google Public DNS for resolving domain names.
# The default is host-only DNS which may not be installed.
#nameservers-local-purge
nameservers-append '8.8.8.8'
nameservers-append '8.8.4.4'

# Using the GB mirror for faster downloads.
apt-mirror-pick 'gb'

# Update packages cache.
apt-packages-update

# Install VM packages.
apt-packages-install                 \
  git-core                           \
  git-flow                           \
  default-jdk                        \
  imagemagick                        \
  curl                               \
  ack-grep                           \
  chrpath                            \
  inotify-tools                      \
  build-essential                    \
  openssl                            \
  automake                           \
  autoconf                           \
  libtool                            \
  pkg-config                         \
  bison                              \
  libreadline6                       \
  libreadline6-dev                   \
  zlib1g                             \
  zlib1g-dev                         \
  libssl-dev                         \
  libyaml-dev                        \
  libsqlite3-dev                     \
  sqlite3                            \
  libxml2-dev                        \
  libxslt-dev                        \
  libc6-dev                          \
  ncurses-dev

dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep

<%= import 'bin/mongo.sh' %>
<%= import 'bin/node.sh' %>
<%= import 'bin/lamp.sh' %>
<%= import 'bin/ruby.sh' %>
<%= import 'bin/phantom.sh' %>
<%= import 'bin/samba.sh' %>

echo 'if [ -d "/vagrant/bin" ]; then PATH=$PATH":/vagrant/bin"; fi' >> ~/.profile
