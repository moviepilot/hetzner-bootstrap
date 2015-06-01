#!/bin/bash

# install bacic tools
apt-get update
apt-get -y dist-upgrade
apt-get -y install byobu curl wget

# install puppet
wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
dpkg -i puppetlabs-release-trusty.deb
apt-get update
apt-get -y install puppet tmux
sed -i '/templatedir/a pluginsync=true' /etc/puppet/puppet.conf

# install default ssh keys
mkdir /root/.ssh
chmod 700 /root/.ssh
wget -O /root/.ssh/authorized_keys https://raw.github.com/moviepilot/hetzner-bootstrap/puppet-express/root-ssh-authorizedkeys.pub
