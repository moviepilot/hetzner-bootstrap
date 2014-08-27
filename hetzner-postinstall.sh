#!/bin/bash
apt-get update
apt-get -y upgrade
apt-get -y install byobu wget ruby libxmlrpc-ruby libopenssl-ruby libaugeas-ruby virt-what
wget http://apt.puppetlabs.com/pool/trusty/main/f/facter/facter_2.0.2-1puppetlabs1_amd64.deb
wget http://apt.puppetlabs.com/pool/trusty/main/p/puppet/puppet-common_3.6.2-1puppetlabs1_all.deb
wget http://apt.puppetlabs.com/pool/trusty/main/p/puppet/puppet_3.6.2-1puppetlabs1_all.deb
dpkg -i facter_2.0.2-1puppetlabs1_amd64.deb
dpkg -i puppet-common_3.6.2-1puppetlabs1_all.deb
dpkg -i puppet_3.6.2-1puppetlabs1_all.deb
mkdir /root/.ssh
chmod 700 /root/.ssh
wget -O /root/.ssh/authorized_keys https://raw.github.com/ctavan/hetzner-bootstrap/trusty/root-ssh-authorizedkeys.pub
# please add you custom postinstall commands here
# you should keep in mind, that this script is run inside a chrooted
# envorinment of the freshly installed server, so every change here
# is a direct change in the new server
