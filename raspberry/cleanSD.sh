#!/bin/bash
df -h
sudo apt-get remove build-essential libbluetooth-dev libudev-dev
sudo apt-get remove libatlas-base-dev
sudo apt update
sudo apt upgrade
sudo apt-get clean
sudo apt-get autoclean
sudo apt-get autoremove
sudo rm -rf /tmp/*
sudo rm -rf ~/.local/share/Trash/*
df -h
./stop.sh
