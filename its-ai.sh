#!/bin/bash
# if not root, run as root
if (( $EUID != 0 )); then
    sudo /home/jb/bash/update.sh
    exit
fi
apt update
apt -y dist-upgrade
apt -y autoremove
apt clean
apt purge -y $(dpkg -l | awk '/^rc/ { print $2 }')
