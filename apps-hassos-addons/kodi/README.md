# how to manual install using ssh addon:

run this commands:
```
mkdir /addons/kodi
mkdir /config/docker
mkdir /config/docker/kodi
cd /addons/kodi
wget https://raw.githubusercontent.com/lpt2007/its-ai/master/apps-hassos-addons/kodi/Dockerfile
wget https://raw.githubusercontent.com/lpt2007/its-ai/master/apps-hassos-addons/kodi/config.json
mkdir src
cd src
wget https://raw.githubusercontent.com/lpt2007/its-ai/master/apps-hassos-addons/kodi/src/bash-docker.service
wget https://raw.githubusercontent.com/lpt2007/its-ai/master/apps-hassos-addons/kodi/src/launch_app.sh
wget https://raw.githubusercontent.com/lpt2007/its-ai/master/apps-hassos-addons/kodi/src/start.sh
cd ..
mkdir tools
cd tools
wget https://github.com/lpt2007/its-ai/raw/master/apps-hassos-addons/kodi/tools/fbcp
wget https://github.com/lpt2007/its-ai/raw/master/apps-hassos-addons/kodi/tools/raspi2fb
```
now go to hass.io --+ addon-store --+ local add-ons --+ KODI (click refresh if there are no KODI addon)

click install and wait to finish. If there is not KODI inder locall add-ons click refresh symbol in top right corner

start addon

enjoy :) don't forget to connect rpi hdmi to tv or monitor
