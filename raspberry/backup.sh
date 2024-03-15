#!/bin/bash
####################################################################################
# This script must be run from a Linux PC
# It cleans the Raspi image from the SD card and creates an image file
# At the end, it runs the pishrink script from https://github.com/Drewsif/PiShrink
####################################################################################

# Check if dcfldd is installed
if ! command -v dcfldd &>/dev/null; then
    echo "dcfldd is not installed. Please install it first."
    exit 1
fi

selected_partition=mmcblk0p2
selected_disk=mmcblk0
# Unmount the partition
echo "Unmounting partition $selected_partition ..."
#umount "/dev/$selected_partition"

# User input for the destination of the image file
read -p "Please specify the file path for the image (e.g. /path/to/image.img): " image_path

# Execute "zerofree" command
echo "Running 'sudo zerofree -v $selected_partition' ..."
#sudo zerofree -v "/dev/$selected_partition"

# Progress display while creating the image
echo "Creating image from $selected_disk ..."
sudo dcfldd if="/dev/$selected_disk" of="$image_path" bs=4M

# Adjust permissions of the image path
#sudo chown "$USER:$USER" "$image_path"

echo "Process completed."

# Apply the "pishrink" script to the image
echo "Applying 'pishrink' to the image ..."
sudo ./pishrink.sh -v -a -z "$image_path" "$image_path.gz"

echo "Process completed."
read x
