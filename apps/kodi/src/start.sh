#!/bin/bash

# Make sudo actually work
HOSTNAME=$(cat /etc/hostname)
echo "127.0.1.1 $HOSTNAME" >> /etc/hosts
hostname $HOSTNAME

# Enable SSH Server
if [ "$INITSYSTEM" != "on" ]; then
  /usr/sbin/sshd -p 22 &
fi

# Copy Touchscreen Calibration File
if [ -f /data/99-calibration.conf ]; then
        cp /data/99-calibration.conf /usr/share/X11/xorg.conf.d/99-calibration.conf
fi

# Create root config folder
mkdir /root/.config

# Remove tmp.lock from old session
rm /tmp/.X0-lock &>/dev/null || true

# Set Volume to 100 Percent
amixer -c 1 set Speaker 100%
amixer -c 1 set Headphone 100%

# Initalize xinit Session
xinit /usr/src/app/launch_app.sh
