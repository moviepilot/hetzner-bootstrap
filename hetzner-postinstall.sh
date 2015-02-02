#!/bin/bash
apt-get update
apt-get -y upgrade
apt-get -y install --install-recommends linux-generic-lts-trusty
apt-get -y install byobu wget ruby1.8 libxmlrpc-ruby libopenssl-ruby libshadow-ruby1.8 libaugeas-ruby1.8 virt-what

wget -O /tmp/facter_1.7.3-1puppetlabs1_amd64.deb http://apt.puppetlabs.com/pool/precise/main/f/facter/facter_1.7.3-1puppetlabs1_amd64.deb
wget -O /tmp/puppet-common_2.7.26-1puppetlabs1_all.deb http://apt.puppetlabs.com/pool/precise/main/p/puppet/puppet-common_2.7.26-1puppetlabs1_all.deb
wget -O /tmp/puppet_2.7.26-1puppetlabs1_all.deb http://apt.puppetlabs.com/pool/precise/main/p/puppet/puppet_2.7.26-1puppetlabs1_all.deb
wget -O /tmp/hiera_1.3.4-1puppetlabs1_all.deb http://apt.puppetlabs.com/pool/precise/main/h/hiera/hiera_1.3.4-1puppetlabs1_all.deb
wget -O /tmp/hiera-puppet_1.0.0-1puppetlabs1_all.deb http://apt.puppetlabs.com/pool/precise/main/h/hiera-puppet/hiera-puppet_1.0.0-1puppetlabs1_all.deb

dpkg -i /tmp/facter_1.7.3-1puppetlabs1_amd64.deb
dpkg -i /tmp/puppet-common_2.7.26-1puppetlabs1_all.deb
dpkg -i /tmp/puppet_2.7.26-1puppetlabs1_all.deb
dpkg -i /tmp/hiera_1.3.4-1puppetlabs1_all.deb
dpkg -i /tmp/hiera-puppet_1.0.0-1puppetlabs1_all.deb

rm -rf /tmp/*.deb

sed -i '/templatedir/a pluginsync=true' /etc/puppet/puppet.conf

mkdir /root/.ssh
chmod 700 /root/.ssh
wget -O /root/.ssh/authorized_keys https://raw.github.com/ctavan/hetzner-bootstrap/basenode/root-ssh-authorizedkeys.pub
# please add you custom postinstall commands here
# you should keep in mind, that this script is run inside a chrooted
# envorinment of the freshly installed server, so every change here
# is a direct change in the new server
