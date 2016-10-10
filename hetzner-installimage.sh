#!/bin/bash
wget https://raw.github.com/moviepilot/hetzner-bootstrap/puppet-express/hetzner-postinstall.sh
chmod 755 hetzner-postinstall.sh
echo "${SERVERNAME}" | egrep '^(([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]*[a-zA-Z0-9])\.)*([A-Za-z0-9]|[A-Za-z0-9][A-Za-z0-9\-]*[A-Za-z0-9])$' || VALIDHOSTNAME="false"
if [[ -n "$VALIDHOSTNAME" ]]; then
  echo "the provided SERVERNAME '${SERVERNAME}' is either invalid or empty"
  exit 1
else
  /root/.oldroot/nfs/install/installimage -a -p /boot:ext3:1G,/:ext4:all -r yes -l 1 -b grub -d sda,sdb -i /root/.oldroot/nfs/install/../images/Ubuntu-1604-xenial-64-minimal.tar.gz -x hetzner-postinstall.sh -n ${SERVERNAME}
fi
