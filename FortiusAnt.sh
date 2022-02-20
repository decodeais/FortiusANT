#!/bin/bash
echo Stop standard Bluetooth Service
sudo service bluetooth stop
echo Enable Bluetooth for FortiusAnt
sudo hciconfig hci0 up

# autostart, bluetooth, gui - which is most general for Raspberry usage
# options:
# -l            adds led/buttons
# -O display    adds TFT screen
# -D-1          disables ANT and changes the "no ANT-dongle found message"
# For more options, see documentation
python3 ~/FortiusANT/pythoncode/FortiusAnt.py -a -b -g -n
#python3 ~/Desktop/FortiusANT/pythoncode/FortiusAnt.py -a -b -g -n
# ----------------------------------------------------- Done
echo Start standard Bluetooth Service
sudo service bluetooth start
Raspberry='\033[0;35m'
printf "${Raspberry}  Press Enter to continue: "
read reply
