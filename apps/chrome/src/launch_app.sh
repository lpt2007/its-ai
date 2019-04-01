#!/bin/bash

# Disable DPMS / Screen blanking
xset -dpms
xset s off
xset s noblank

# Change Keyboard Layout from US to German
setxkbmap de

# Debug Tools
#xinput --list
#evtest

# Start Window Manager
sudo matchbox-window-manager -use_cursor yes -use_titlebar no & 
#sudo matchbox-window-manager -use_cursor no -use_titlebar no &

# Start Payload App
xterm
