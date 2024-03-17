#!/bin/bash
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
cd $HOME
# ----------------------------------------------------------
# Install git
# ----------------------------------------------------------
sudo apt install git

# ----------------------------------------------------------
# Download (clone) FortuisAnt
# ----------------------------------------------------------
if [ -d "$HOME/FortiusANT" ] ; then
	echo "FortiusANT already present"
else
	git clone https://github.com/WouterJD/FortiusANT.git
fi
>>>>>>> 9fd4982 (Update 5_GetFortiusAnt_Dependencies.sh)

=======
if [ -f "FortAntEnv/bin/activate" ]; then
    source "FortAntEnv/bin/activate"; else
    echo -e "\033[0;31m No virtual enviroment \033[0m"  
fi
>>>>>>> 5bbf657 (check venv)
=======
if [ -f "FortAntEnv/bin/activate" ]; then
    source "FortAntEnv/bin/activate"; else
    echo -e "\033[0;31m No virtual enviroment \033[0m"  
fi
>>>>>>> e7dc07d3d2ca2f0627860a12b5e1d7aaf0024054
# ----------------------------------------------------------
# Install dependencies
# ----------------------------------------------------------
if [ `uname -m` == 'armv6l' ]; then
	# Requirements for Raspberry Pi0 will be installed
    pip3 install -r ~/FortiusANT/pythoncode/requirementsNoGUI.txt
else
	# Requirements will be installed (includes wxPython)
    pip3 install -r ~/FortiusANT/pythoncode/requirements.txt
fi

# ----------------------------------------------------- Done

bash stop.sh "$@"

