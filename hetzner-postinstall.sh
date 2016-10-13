#!/bin/bash

# install bacic tools
apt-get update
apt-get -y dist-upgrade
apt-get -y install byobu curl wget

# install puppet
wget https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
dpkg -i puppetlabs-release-pc1-xenial.deb
apt-get update
sed -i '/templatedir/a pluginsync=true' /etc/puppet/puppet.conf

apt-get -y install puppet-agent=1.4.2-1xenial tmux
# install default ssh keys
mkdir /root/.ssh
chmod 700 /root/.ssh
wget -O /root/.ssh/authorized_keys https://raw.githubusercontent.com/moviepilot/hetzner-bootstrap/puppet-express-16.04/root-ssh-authorizedkeys.pub

echo 'PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/opt/puppetlabs/bin"' > /etc/environment
update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

# setting full hostname to /etc/hostname
hostnamectl set-hostname $(hostname -f)
