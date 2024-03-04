#!/bin/bash

if [ `uname -m` == 'armv6l' ]; then
    Red='\033[0;31m'
    NC='\033[0m'
    printf "${Raspberry} wxPython not available for Raspberry Pi0, press Enter to continue: ${NC}"
    read x
else
    SRC=https://drive.google.com/drive/folders/1pPrAQLd3plFiuZYifh1HSn_Kr5Iy2EVr
    wxPYTHON=wxPython-4.2.2a1-cp311-cp311-linux_aarch64.whl
    GDRIVE=https://drive.google.com/file/d/1pPrAQLd3plFiuZYifh1HSn_Kr5Iy2EVr/view?usp=sharing

    # ----------------------------------------------------------
    # Go to Downloads
    # ----------------------------------------------------------
    cd ~/Downloads

    # ----------------------------------------------------------
    # Download pre-build wxPython package to home folder.
    # ----------------------------------------------------------
    #sudo pip install gdown
    pip install gdown
    gdown --id 1pPrAQLd3plFiuZYifh1HSn_Kr5Iy2EVr --output $wxPYTHON
    # ----------------------------------------------------------
    # This wheel package works for an ARM7l CPU.
    # Install package with
    # ----------------------------------------------------------
     
    pip3 install $wxPYTHON
    pip install pyusb
    pip install lib_programname
    sudo apt-get install libglib2.0-dev $wxPYTHON
    # ----------------------------------------------------------
    # If you can not use the prebuild package, you need follow the install instructions
    # below to build your own wxPython by replacing the version with 4.1.1
    # (This can take up to 18 hours depending on the RaspberryPi you are using):
    #
    # ----------------------------------------------------------
    #
    # Issue #457 with OS Bookworm, this does not work and the mentioned
    # site is no longer available.
    # 
    # Nevertheless, @decodeais managed to generate a suitable one:
    #   sudo apt-get install libgtk-3-dev
    #   sudo apt-get install libpng-dev libjpeg-dev libtiff-dev
    # pip install -U --no-binary :all: wxPython
    # The generated file "wxPython-4.2.1-cp311-cp311-linux_aarch64.whl" works,
    # The but the scales on the performance and speed indicators have disappeared.
    # ----------------------------------------------------------

    # ----------------------------------------------------------
    # Cleanup
    # ----------------------------------------------------------
    cd ~/Downloads
    rm $wxPYTHON

    # ----------------------------------------------------- Done
    bash stop.sh "$@"
    #Raspberry='\033[0;35m'
    #printf "${Raspberry} Pre-built Python is installed, press Enter to continue: "
    #read reply
fi
