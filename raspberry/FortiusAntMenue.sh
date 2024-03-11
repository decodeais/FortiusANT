#!/bin/bash

if [ -f "FortAntEnv/bin/activate" ]; then
    source "FortAntEnv/bin/activate"; else
    echo -e "\033[0;31m No virtual enviroment \033[0m"  
fi
# autostart, bluetooth, gui - which is most general for Raspberry usage
# options:
# -l            adds led/buttons
# -O display    adds TFT screen
# -D-1          disables ANT and changes the "no ANT-dongle found message"
# For more options, see documentation
#
# 2022-03-16; BLE-implementation changed to -bb bless (was -b nodejs)
#
~/FortiusANT/raspberry/FortiusAntMain.sh -a -A -bb -g
# ----------------------------------------------------- Done
bash stop.sh "$@"
#Raspberry='\033[0;35m'
#printf "${Raspberry}  Press Enter to continue: "
#read reply
