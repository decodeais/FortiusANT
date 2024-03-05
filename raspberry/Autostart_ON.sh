#!/bin/bash 
echo "[autostart]" >> ~/.config/wayfire.ini
echo "a0 = lxterminal --working-directory=$HOME/FortiusANT/raspberry -e $HOME/FortiusANT/raspberry/FortiusAnt.sh" >> ~/.config/wayfire.ini
