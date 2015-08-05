#!/bin/bash

# install bacic tools
apt-get update
apt-get -y dist-upgrade
apt-get -y install byobu curl wget

# install puppet
wget https://apt.puppetlabs.com/puppetlabs-release-pc1-trusty.deb
dpkg -i puppetlabs-release-pc1-trusty.deb
apt-get update
apt-get -y install puppet-agent tmux
sed -i '/templatedir/a pluginsync=true' /etc/puppet/puppet.conf

# install default ssh keys
mkdir /root/.ssh
chmod 700 /root/.ssh
wget -O /root/.ssh/authorized_keys https://raw.github.com/moviepilot/hetzner-bootstrap/puppet-express/root-ssh-authorizedkeys.pub

echo 'PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/opt/puppetlabs/bin"' > /etc/environment
update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

# setting full hostname to /etc/hostname
hostnamectl set-hostname $(hostname -f)
