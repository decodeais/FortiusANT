#!/bin/bash
#
if [ -f "FortAntEnv/bin/activate" ]; then
    source "FortAntEnv/bin/activate"; else
    echo -e "\033[0;31m No virtual enviroment \033[0m"  
fi
#sudo service bluetooth stop
#sudo hciconfig hci0 up

echo FortiusAnt module bleBleak
python3 ../pythoncode/bleBleak.py

#sudo service bluetooth start

# ----------------------------------------------------- Done
Raspberry='\033[0;35m'
printf "${Raspberry} Done, press Enter to continue: "
read x
