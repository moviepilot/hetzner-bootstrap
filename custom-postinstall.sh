# please add you custom postinstall commands here
# you should keep in mind, that this script is run inside a chrooted
# envorinment of the freshly installed server, so every change here
# is a direct change in the new server
parted -s /dev/sda mkpart primary ext4 108GB 3001GB
parted -s /dev/sdb mkpart primary ext4 108GB 3001GB
mkfs.ext4 /dev/sda4
mkfs.ext4 /dev/sdb4
tune2fs -o journal_data_writeback /dev/sda4
tune2fs -o journal_data_writeback /dev/sdb4
echo "/dev/sda4 /data/1 ext4 noatime,data=writeback,barrier=0,nobh,errors=remount-ro 0 0" >> /etc/fstab
echo "/dev/sdb4 /data/2 ext4 noatime,data=writeback,barrier=0,nobh,errors=remount-ro 0 0" >> /etc/fstab
mkdir -p /data/1/ /data/2/
