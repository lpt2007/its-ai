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

I create folders:
```
mkdir /home/pi/docker
mkdir /home/pi/docker/kodi
mkdir /home/pi/docker/kodi/src
mkdir /home/pi/docker/kodi/tools
```
transfer Dockerfile to /home/pi/docker/kodi:
```
cd /home/pi/docker/kodi
wget https://raw.githubusercontent.com/lpt2007/its-ai/master/apps/kodi/Dockerfile
cd src
wget https://raw.githubusercontent.com/lpt2007/its-ai/master/apps/kodi/src/launch_app.sh
wget https://raw.githubusercontent.com/lpt2007/its-ai/master/apps/kodi/src/start.sh
wget https://github.com/lpt2007/its-ai/blob/master/apps/kodi/src/xinit-docker.service
cd ..
cd tools
wget https://github.com/lpt2007/its-ai/raw/master/apps/kodi/tools/fbcp
wget https://github.com/lpt2007/its-ai/raw/master/apps/kodi/tools/raspi2fb
cd ..
```
build docker container:
```
sudo docker build -t kodi .
```

from ssh run this:
```
docker run --rm --name=its-ia_app_kodi --privileged kodi

```
When kodi starts:

go to -> "system" -> "player settings - Expert" -> check "Allow hardware acceleration - OMXPlayer"

Enjoy. :)
