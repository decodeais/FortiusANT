<<<<<<< HEAD
# The "Wayland" Branch
The "Wayland" branch tries to solve issues  caused by the transition from Raspian to "Bookworm".

### Differences
The desktop no longer relies on X11 but on Wayland.
Many functions  have been changed. 
Autostart functionality is now configured differently.
Configuring the screensaver will be different too.
Scaling and positioning of WxPython GUI elements

## Changes from Python <3.10 to Python3.11
Due to "Bookworm's" transition to Python version 3.11, the old Python installation scripts could no longer be executed as usual. Python now prefers to be installed and run in a virtual Python environment. Additionally, a more recent wxPython wheel is required for the GUI.


## The New Installation Script
It is a one key hit installation script if you start it with the option "n" (not -n)) 

Therefore, a new installation script was created `FortiusAntInstall.sh`, which performs all necessary.
You can start the installation by downloading this script from the Wayland branch to your computer and start it in a Terminal `FortiusAntInstall.sh n`.

 installation tasks:
- updating the Raspi/Linux PC
- cloning the repository.
- Linux installations.
- Creating the virtual environment.
- Install Python in this envirement.
- Adding to the Raspberry Start menu.
- Setting permissions for ANT and USB. All devices should be preinstalled. If problems occure try old script nr.9 .
- Reboot to apply permissions.

This script can also install FortiusAnt on a Linux PC.
PC with Linux Mint. Pay attention to whether the desktop is based on X11 or "Wayland". May be that you have to try parts from the old installation.

## The Pre-installed FortiusAnt Image
Furthermore, a pre-installed image is available for this version, which only needs to be unpacked using `gzip -d image.img.gz` and then transferred to an SD card or USB stick using "Raspberry Pi Imager". However, adjustments can still be made afterward for the specific trainer model or personal preferences in FortiusAnt.sh for autostart and in FortiusAntMenu.sh for the Start menu.

## Compatible Hardware
The image should lead to a functional system on the following Raspi versions:

Raspberry Pi: 3B, 3B+, 3A+, 4B, 400, 5, CM3, CM3+, CM4, CM4S, Zero2W

Currently tested on Zero2W and Raspi4B.

## New scripts

`autostart_ON.sh   ` &emsp; enable autostart 
`autostart_OFF.sh  `  &emsp; disable autostart
`FortiusAntMenue.sh` &emsp;     script to modify the parameters for start FortiusAnt from the Raspi startmenue
`venvEnter.sh      `  &emsp;          creates a terminal with the virtual Python environment

# Preparations for creating the Image
## Script to run on Raspi
`cleanSD.sh `          Erase/uninstall everything we don't  need anymore
## Scripts to run on the PC
`backup.sh   `           Creates the image from the SD-card
`pishrink.sh `        Compresses the image to self inflating Raspi-image

# Special files

## Rules
These files will be copied to the operating sytem at the end of the installation process
`42-ant-usb-sticks.rules  `    Rules for all known Ant+ sticks and TacX controller ->/etc/udev/rules.d/
`FortiusAntUsb2.conf      `    Configs for all known Ant+ sticks ->/etc/modprobe.d

## Creation of wxPython 

`build_wxPython_whl.sh  ` This script has to run with the target Python and CPU

## the link for the Image
Link: [Link]






=======
Test
>>>>>>> 37f5c54 (Create README.md)
