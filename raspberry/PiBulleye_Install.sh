e#!/bin/bash

echo ----------------------------------------------------------
echo     Update your system
echo ----------------------------------------------------------
sudo apt update -y
sudo apt full-upgrade -y

cd ~

echo ----------------------------------------------------------
echo     Install Python
echo ----------------------------------------------------------

sudo apt upgrade python3
sudo apt install python3-pip
pip3 install --upgrade pip

echo ----------------------------------------------------------
echo     Install Git
echo ----------------------------------------------------------

sudo apt install git

echo ----------------------------------------------------------
echo     Clone FortiusANT from Github into ~/FortiusANT directoy
echo ----------------------------------------------------------

git clone https://github.com/Decodeais/FortiusANT.git  $HOME/FortiusANT

echo ----------------------------------------------------------
echo     Install: build-essential bluetooth bluez libbluetooth-dev libudev-dev
echo              ibatlas-base-dev npm
echo ----------------------------------------------------------

sudo apt install -y build-essential bluetooth bluez libbluetooth-dev libudev-dev
sudo apt-get install -y libatlas-base-dev # for numpy, https://github.com/numpy/numpy/issues/11110
sudo apt-get install npm -y

echo ----------------------------------------------------------
echo     Install: node Version 14.15.3 mit nodemanager n
echo ----------------------------------------------------------
cd ~/FortiusANT/node/
sudo npm install -g n 
sudo n 14.15.3 
# im Verzeichnis node
npm install -no-audit
npm install @abandonware/bluetooth-hci-socket@abandonware/bleno
cd ~

echo ----------------------------------------------------------
echo Next step is to grant the node binary cap_net_raw privileges,
echo so it can start/stop BLE advertising without root access.
echo ----------------------------------------------------------
sudo setcap cap_net_raw+eip $(eval readlink -f `which node`)

echo ----------------------------------------------------------
echo     Install: wxPython4 für ubuntu-20.04
echo ---------------------------------no-audit---------------------------

 URL=https://extras.wxpython.org/wxPython4/extras/linux/gtk3/ubuntu-20.04
pip install -U -f $URL wxPython

echo ----------------------------------------------------------
echo     Install: Python Modules from Requierments.txt
echo ----------------------------------------------------------


pip3 install -r ~/FortiusANT/pythoncode/requirements.txt
      
sudo apt install python3-usb
python -m pip install --upgrade lib_detect_testenv


echo ----------------------------------------------------------
echo     Install: Find out  Modell of Headunit and ANT+ -Stick
echo ----------------------------------------------------------

# ----------------------------------------------------------
# Tacx USB-interface info
# Remove everything untill : (including)
# Remove spaces (Note: 's/ *//' does not work
# ----------------------------------------------------------
HEADUNIT=`lsusb | grep 3561 | sed -e 's/^.*://' -e 's/ //g'` 
if [ T$HEADUNIT = T ]; then
    echo No Tacx USB-interface connected
else
    echo Tacx with T$HEADUNIT connected
fi

# ----------------------------------------------------------
# ANT USB-interface info
# ----------------------------------------------------------
ANT=NoAntFound
ANTTYPE=
if [ `lsusb | grep -c ':1004'` == 1 ] ; then
    ANT=1004
    ANTTYPE=Older
fi
if [ `lsusb | grep -c ':1008'` == 1 ] ; then
    ANT=1008
    ANTTYPE=Suunto
fi
if [ `lsusb | grep -c ':1009'` == 1 ] ; then
    ANT=1009
    ANTTYPE=Garmin
fi
if [ ANT == NoAntFound ]; then
    echo No ANTdongle found
else
    VENDOR=`lsusb | grep $ANT | sed -e 's/^.*ID //' -e 's/:.*$//'`
    echo ANT dongle $VENDOR:$ANT $ANTTYPE found

    lsusb | grep ":$ANT"
fi

# ----------------------------------------------------------
# First create files, then cp to target
# ----------------------------------------------------------
# Assign the Linux USB serial driver to the ANT stick by
# noting the driver with the id's:
# ----------------------------------------------------------
USBCONF=FortiusAntUsb2.conf
if [ ANT != NoAntFound ]; then
    cat << EOF > $USBCONF
# Options for ANTdongle $ANTTYPE $VENDOR:$ANT
Options usbserial vendor=0x$VENDOR product=0x$ANT
EOF
    sudo cp $USBCONF /etc/modprobe.d/
    rm $USBCONF
fi

# ----------------------------------------------------------
# Furthermore we assign the device file to our user so that
# he can read and write to it. In my example the user is pi.
# Please also adjust the following example with your usb ids
# (vendor and product).
# It is also possible to assign Groups.
# See udev rules documentation or search the web for more examples.
# More general udev rules can be found here:
# https://github.com/WouterJD/FortiusANT/issues/262#issuecomment-790384254
# https://stackoverflow.com/questions/3738173/why-does-pyusb-libusb-require-root-sudo-permissions-on-linux
# ----------------------------------------------------------
USBRULES=FortiusAntUsbAccess.rules
cat << EOF > $USBRULES
# Allow users in group usbtacx to access Tacx USB headunit
SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", MODE="0664", GROUP="usbtacx"
EOF

if [ ANT != NoAntFound ]; then
    cat << EOF >> $USBRULES
# Allow users in group usbtacx to access ANTdongle
SUBSYSTEM==”tty”, ACTION==”add”, ATTRS{idProduct}==”$ANT”, ATTRS{idVendor}==”$VENDOR”, MODE=”0666”, GROUP=”usbtacx”
EOF
fi

sudo cp $USBRULES /etc/udev/rules.d/
rm $USBRULES

# ----------------------------------------------------------
# Verify
# ----------------------------------------------------------
#nano /etc/modprobe.d/$USBCONF
#nano /etc/udev/rules.d/$USBRULES

# ----------------------------------------------------------
# Create group and add user
# ----------------------------------------------------------
echo Create group usbtacx
sudo addgroup usbtacx
echo add user pi to this group
sudo adduser pi usbtacx



echo -----------------------------------------------------
echo Disable Standard Bluetooth and enable new HCI socket 
echo -----------------------------------------------------

sudo systemctl disable bluetooth
sudo cp ~/FortiusAnt_Install/enable-bluetooth.service /etc/systemd/system
sudo systemctl enable enable-bluetooth
echo -----------------------------------------------------
#
Raspberry='\033[0;35m'
printf "${Raspberry} pi user is granted access to usb after reboot, press Enter to continue: "
read reply

# Reboot to activate rule
sudo reboot now



