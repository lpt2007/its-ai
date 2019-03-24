# How to manual install using ssh:
Download Raspbian Stretch with desktop image from:
https://www.raspberrypi.org/downloads/raspbian/
and flash it to sdcard using balenaetcher:
https://www.balena.io/etcher/
Insert sdcard to raspberry pi, when system boots enable ssh with this commands:
```
sudo apt-get update
sudo systemctl enable ssh
sudo reboot
```
install docker if already not installed with command:
```
curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh
sudo usermod -aG docker pi
```
run raspi-config:
```
sudo raspi-config
```
go to -> "Interfacing Options" -> "Camera" -> Enable,
go to -> "Advanced Options" -> "Memory Split" -> 256
go to -> "Finish" -> "Reboot"

