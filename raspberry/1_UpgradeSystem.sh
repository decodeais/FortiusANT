#!/bin/bash

# ----------------------------------------------------------
# Update your system
# ----------------------------------------------------------
if [[ $1 == "n" ]]; then
    YES="-y"
else
    YES=""
fi

sudo apt-get $YES update
sudo apt-get $YES full-upgrade

# ----------------------------------------------------- Done
bash stop.sh "$@"
