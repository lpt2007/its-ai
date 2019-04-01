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
I create folders:
```
mkdir /home/pi/docker
mkdir /home/pi/docker/chrome
mkdir /home/pi/docker/chrome/src
mkdir /home/pi/docker/chrome/tools
```
transfer Dockerfile to /home/pi/docker/chrome:
```
cd /home/pi/docker/chrome
wget https://raw.githubusercontent.com/lpt2007/its-ai/master/apps/chrome/Dockerfile
cd src
wget https://raw.githubusercontent.com/lpt2007/its-ai/master/apps/chrome/src/launch_app.sh
wget https://raw.githubusercontent.com/lpt2007/its-ai/master/apps/chrome/src/start.sh
wget https://raw.githubusercontent.com/lpt2007/its-ai/master/apps/chrome/src/bash-docker.service
cd ..
cd tools
wget https://github.com/lpt2007/its-ai/raw/master/apps/chrome/tools/fbcp
wget https://github.com/lpt2007/its-ai/raw/master/apps/kodi/chrome/raspi2fb
cd ..
```
build docker container:
```
sudo docker build -t chrome .
```

from ssh run this:
```
docker run --rm --name=its-ia_app_chrome --privileged chrome

```

Enjoy. :)
