#!/bin/bash
#
if [ -f "FortAntEnv/bin/activate" ]; then
    source "FortAntEnv/bin/activate"; else
    echo -e "\033[0;31m No virtual enviroment \033[0m"  
fi

while [ 1==1 ]
do
	echo FortiusAnt module bleBless
	python3 ../pythoncode/bleBless.py
	# ----------------------------------------------------- Done
	printf "Done, press Enter to continue: "
	read x
done
