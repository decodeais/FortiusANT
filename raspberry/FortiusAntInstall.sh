#!/bin/bash

sudo apt update
sudo apt upgrade
sudo apt install git
#git clone https://github.com/WouterJD/FortiusANT.git
cd /home/pi/FortiusANT/raspberry

sudo apt install python3-venv
python3 -m venv FortAntEnv
source FortAntEnv/bin/activate

./1_UpgradeSystem.sh "$@"
./2_InstallPackagesBLE.sh "$@"
#./3_InstallBless_2022Q2_only.sh "$@"
./3_InstallMissingPackages.sh "$@"

./4_InstallWxPython.sh "$@"
./5_GetFortiusAnt_Dependencies.sh "$@"
#./6_SetupNodeJs_FortiusAnt.sh "$@"
#./7_RunFortiusAntAtStartup.sh "$@"
#./8_Share_UserPi.sh
./9_GrantAccessToBluetoothForBless.sh "$@"
sudo cp /home/pi/FortiusANT/raspberry/FortiusAnt.desktop /usr/share/applications/FortiusAnt.desktop
./9_GrantAccessToUSB_withReboot.sh
