# how to manual install using ssh addon:

run this commands:
```
mkdir /addons/kodi
mkdir /config/docker
mkdir /config/docker/kodi
cd /addons/kodi
wget https://raw.githubusercontent.com/lpt2007/its-ai/master/apps-hassos-addons/kodi/old_v0.2a/Dockerfile
wget https://raw.githubusercontent.com/lpt2007/its-ai/master/apps-hassos-addons/kodi/old_v0.2a/config.json
wget https://raw.githubusercontent.com/lpt2007/its-ai/master/apps-hassos-addons/kodi/old_v0.2a/run.sh
```
now go to hass.io --+ addon-store --+ local add-ons --+ KODI (click refresh if there are no KODI addon)

click install and wait to finish. If there is not KODI inder locall add-ons click refresh symbol in top right corner

start addon

When kodi starts:
go to -> "system" -> "player settings - Expert" -> check "Allow hardware acceleration - OMXPlayer"

enjoy :) don't forget to connect rpi hdmi to tv or monitor
