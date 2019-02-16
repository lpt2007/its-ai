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
mylog 1 "pre-configuring packages"
sudo dpkg --configure -a

# step 2
mylog 2 "fix and attempt to correct a system with broken dependencies"
sudo apt-get install -f

# step 3
mylog 3 "update apt cache"
sudo apt-get update

# step 4
mylog 4 "upgrade packages"
sudo apt-get upgrade

# step 5
mylog 5 "distribution upgrade"
sudo apt-get dist-upgrade

# step 6
mylog 6 "remove unused packages"
sudo apt-get --purge autoremove

# step 7
mylog 7 "clean up"
sudo apt-get autoclean

if [[ $? == 0 ]]; then
        myfail 3 "nothing really"
fi
