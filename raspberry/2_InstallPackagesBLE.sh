#!/bin/bash
if [[ $1 == "n" ]]; then
    YES="-y"
else
    YES=""
fi

sudo apt-get install $YES build-essential bluetooth bluez libbluetooth-dev libudev-dev
sudo apt-get install $YES libglib2.0-dev
sudo apt-get install $YES libatlas-base-dev # for numpy, https://github.com/numpy/numpy/issues/11110

# ----------------------------------------------------- Done
bash stop.sh "$@"

#Raspberry='\033[0;35m'
#printf "${Raspberry} Packages are installed, press Enter to continue: "
#read reply
