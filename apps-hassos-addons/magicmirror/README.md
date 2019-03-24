# how to manual install using ssh addon:

run this commands:
```
mkdir /addons/magicmirror
mkdir /config/docker
mkdir /config/docker/magicmirror
cd /addons/magicmirror
wget https://raw.githubusercontent.com/lpt2007/its-ai/master/apps-hassos-addons/magicmirror/Dockerfile
wget https://raw.githubusercontent.com/lpt2007/its-ai/master/apps-hassos-addons/magicmirror/config.json
wget https://raw.githubusercontent.com/lpt2007/its-ai/master/apps-hassos-addons/magicmirror/run.sh
wget https://raw.githubusercontent.com/lpt2007/its-ai/master/apps-hassos-addons/magicmirror/docker-entrypoint.sh
```
now go to hass.io --+ addon-store --+ local add-ons --+ MAGIC MIRROR (click refresh if there are no KODI addon)

click install and wait to finish. If there is not MAGIC MIRROR inder locall add-ons click refresh symbol in top right corner

start addon

enjoy :) don't forget to connect rpi hdmi to tv or monitor
