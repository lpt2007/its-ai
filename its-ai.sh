#!/bin/bash
sudo apt update
sudo apt -y dist-upgrade
sudo apt -y autoremove
sudo apt clean
sudo apt purge -y $(dpkg -l | awk '/^rc/ { print $2 }')
