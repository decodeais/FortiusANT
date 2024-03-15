#!/bin/bash
# export PATH="$HOME/.local/bin:$PATH"

export DOXYGEN=/usr/bin/doxygen # for Raspian we must use the internal dxygen
# Update package lists
sudo apt-get update
sudo apt install doxygen

sudo apt install -y dpkg-dev build-essential python3-dev freeglut3-dev libgl1-mesa-dev \
libglu1-mesa-dev libgstreamer-plugins-base1.0-dev libgtk-3-dev libjpeg-dev libnotify-dev \
libpng-dev libsdl2-dev libsm-dev libtiff-dev libwebkit2gtk-4.0-dev libxtst-dev \
libgstreamer1.0-dev libjpeg-dev libtiff-dev libsm-dev

# Create directory for building
mkdir -p ~/WheelBuild311

# Change directory to the build directory
cd ~/WheelBuild311

# Create and activate virtual environment
python3.11 -m venv WheelBuilder311_py
source ~/WheelBuild311/WheelBuilder311_py/bin/activate

#python3.11 -m venv myenv311

# Upgrade pip and install required Python packages
pip install -U pip six wheel setuptools sip requests

# Clone Phoenix repository
git clone https://github.com/wxWidgets/Phoenix.git --branch master
cd Phoenix
git submodule init
git submodule update
git submodule update --init --recursive

# Build Phoenix
python build.py dox etg --nodoc sip build bdist_wheel
#python build.py build bdist_wheel
