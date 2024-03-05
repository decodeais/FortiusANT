#!/bin/bash

if [[ $1 == "n" ]]; then
    YES="-y"
else
    YES=""
fi

sudo apt-get $YES update
sudo apt-get $YES upgrade

#git clone https://github.com/WouterJD/FortiusANT.git
# ----------------------------------------------------------
# Download (clone) FortuisAnt
# ----------------------------------------------------------
if [ -d "$HOME/FortiusANT" ] ; then
	echo "FortiusANT already present"
else
	#git clone https://github.com/WouterJD/FortiusANT.git
  git clone -b Wayland https://github.com/decodeais/FortiusANT.git $HOME/FortiusANT

fi
cd $HOME/FortiusANT/raspberry

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

cat FortiusAnt.desktop.org | sed "s%__HOME__%$HOME%" > FortiusAnt.desktop
sudo cp $HOME/FortiusANT/raspberry/FortiusAnt.desktop /usr/share/applications/FortiusAnt.desktop

./9_GrantAccessToUSB_withReboot.sh "$@"
