#!/bin/bash

# Install packages for bless - they seem to be missing.
# See https://github.com/WouterJD/FortiusANT/issues/415
#
if [ -f "FortAntEnv/bin/activate" ]; then
    source "FortAntEnv/bin/activate"; else
    echo -e "\033[0;31m No virtual enviroment \033[0m"  
fi

pip install --upgrade pip
pip3 install lib_detect_testenv
pip3 install dbus_next
pip install pyusb
pip install lib_programname
#
# Install packages for bleno - they seem to be missing.
# See https://github.com/WouterJD/FortiusANT/issues/412
#
pip3 install git+https://github.com/gwangyi/pysetupdi
# ----------------------------------------------------- Done
bash stop.sh "$@"

