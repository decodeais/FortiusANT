#!/bin/bash

if [ `uname -m` == 'armv6l' ]; then
    Red='\033[0;31m'
    NC='\033[0m'
    printf "${Raspberry} wxPython not available for Raspberry Pi0, press Enter to continue: ${NC}"
    read x
else
    
    wxPYTHON=wxPython-4.2.0-cp39-cp39-linux_armv7l.whl
    

    # ----------------------------------------------------------
    # Go to Downloads
    # ----------------------------------------------------------
    cd ~/Downloads

    # ----------------------------------------------------------
    # Download pre-build wxPython package to home folder.
    # ----------------------------------------------------------
    sudo pip install gdown
    gdown https://drive.google.com/uc?id=18gJ0R56xM8keGevGnsu3rMXaxqj0-6Zq
   

    # ----------------------------------------------------------
    # This wheel package works for an ARM7l CPU.
    # Install package with
    # ----------------------------------------------------------
    sudo pip3 install $wxPYTHON

    # ----------------------------------------------------------
    # If you can not use the prebuild package, you need follow the install instructions
    # below to build your own wxPython by replacing the version with 4.1.1
    # (This can take up to 18 hours depending on the RaspberryPi you are using):
    #
    # https://www.marcdobler.com/2020/05/17/how-to-compile-and-install-wxpython-on-raspberry-pi/
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # Cleanup
    # ----------------------------------------------------------
    cd ~/Downloads
    rm $wxPYTHON

    # ----------------------------------------------------- Done
    Raspberry='\033[0;35m'
    printf "${Raspberry} Pre-built Python is installed, press Enter to continue: "
    read reply
fi
