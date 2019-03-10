#!/bin/bash

RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

mylog() {
        STEP=$1
        MSG=$2

        echo -e "step $STEP: ${GREEN}${MSG}${NOCOLOR}"
        logger "step $STEP: $MSG"
}

myfail() {
        STEP=$1
        MSG=$2

        echo -e "step $STEP ERROR: ${RED}${MSG}${NOCOLOR}"
        logger "step $STEP ERROR: $MSG"
}

# handle command line options
if [[ $1 == "-h" ]]; then
        echo "usage: $0"
        echo " -h prints help"

        exit 1
fi

# step 1
mylog 1 "installing docker kodi container"
if [ ! -d "/config/docker" ]; 
then
        mkdir /config/docker
else
        echo "docker directory already exist. nothing to do."
        sleep 5
fi
if [ ! -d "/config/docker/kodi" ]; 
then
        mkdir /config/docker/kodi
else
        echo "kodi container directory already exist. nothing to do."
        sleep 5
fi
if [ ! -d "/config/docker/kodi/.kodi" ]; 
then
        mkdir /config/docker/kodi/.kodi
else
        echo "kodi data directory already exist. nothing to do."
        sleep 5
fi
cd /config/docker/kodi && { curl -O https://raw.githubusercontent.com/lpt2007/its-ai/master/apps-hassos-addons/kodi/Dockerfile ; cd -; }
cd /config/docker/kodi && { curl -O https://raw.githubusercontent.com/lpt2007/its-ai/master/apps-hassos-addons/kodi/config.json ; cd -; }
cd /config/docker/kodi && { curl -O https://raw.githubusercontent.com/lpt2007/its-ai/master/apps-hassos-addons/kodi/run.sh ; cd -; }

if [[ $? == 0 ]]; then
        myfail 3 "nothing really"
fi
