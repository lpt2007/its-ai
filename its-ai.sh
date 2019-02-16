#!/bin/bash
apt update
apt -y dist-upgrade
apt -y autoremove
apt clean
apt purge -y $(dpkg -l | awk '/^rc/ { print $2 }')
