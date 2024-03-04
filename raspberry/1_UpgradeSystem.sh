#!/bin/bash

# ----------------------------------------------------------
# Update your system
# ----------------------------------------------------------
sudo apt update
sudo apt full-upgrade

# ----------------------------------------------------- Done
bash stop.sh "$@"



#Raspberry='\033[0;35m'
#printf "${Raspberry} System is upgraded, press Enter to continue: "
#read reply

