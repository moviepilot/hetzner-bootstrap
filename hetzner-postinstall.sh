#!/bin/bash
apt-get update
apt-get -y upgrade
apt-get -y install byobu wget ruby1.8 libxmlrpc-ruby libopenssl-ruby libshadow-ruby1.8 libaugeas-ruby1.8 virt-what
wget http://apt.puppetlabs.com/pool/precise/main/f/facter/facter_1.7.3-1puppetlabs1_amd64.deb
wget http://apt.puppetlabs.com/pool/precise/main/p/puppet/puppet-common_2.7.23-1puppetlabs1_all.deb
wget http://apt.puppetlabs.com/pool/precise/main/p/puppet/puppet_2.7.23-1puppetlabs1_all.deb
dpkg -i facter_1.7.3-1puppetlabs1_amd64.deb
dpkg -i puppet-common_2.7.23-1puppetlabs1_all.deb
dpkg -i puppet_2.7.23-1puppetlabs1_all.deb
mkdir /root/.ssh
chmod 700 /root/.ssh
wget -O /root/.ssh/authorized_keys https://raw.github.com/ctavan/hetzner-bootstrap/hadoop/root-ssh-authorizedkeys.pub
# please add you custom postinstall commands here
# you should keep in mind, that this script is run inside a chrooted
# envorinment of the freshly installed server, so every change here
# is a direct change in the new server
parted -s /dev/sda mkpart primary ext4 108GB 100%
parted -s /dev/sdb mkpart primary ext4 108GB 100%
mkfs.ext4 /dev/sda4
mkfs.ext4 /dev/sdb4
tune2fs -o journal_data_writeback /dev/sda4
tune2fs -o journal_data_writeback /dev/sdb4
echo "/dev/sda4 /data/1 ext4 noatime,data=writeback,barrier=0,nobh,errors=remount-ro 0 0" >> /etc/fstab
echo "/dev/sdb4 /data/2 ext4 noatime,data=writeback,barrier=0,nobh,errors=remount-ro 0 0" >> /etc/fstab
mkdir -p /data/1/ /data/2/
