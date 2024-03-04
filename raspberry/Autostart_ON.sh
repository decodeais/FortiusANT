#!/bin/bash 
echo "[autostart]" >> ~/.config/wayfire.ini
echo "a0 = lxterminal --working-directory=/home/pi/FortiusANT/raspberry -e \$HOME/FortiusANT/raspberry/FortiusAnt.sh" >> ~/.config/wayfire.ini

