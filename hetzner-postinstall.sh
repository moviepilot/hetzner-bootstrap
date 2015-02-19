#!/bin/bash
apt-get update
apt-get -y dist-upgrade
apt-get -y install tmux curl wget puppet

sed -i '/templatedir/a pluginsync=true' /etc/puppet/puppet.conf

mkdir /root/.ssh
chmod 700 /root/.ssh
wget -O /root/.ssh/authorized_keys https://raw.github.com/ctavan/hetzner-bootstrap/basenode/root-ssh-authorizedkeys.pub
# please add you custom postinstall commands here
# you should keep in mind, that this script is run inside a chrooted
# envorinment of the freshly installed server, so every change here
# is a direct change in the new server
