#!/bin/bash

# Check for root privileges
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Update and upgrade the system
echo "Updating and upgrading your system..."
sudo apt-get update
sudo apt-get upgrade -y

# Remove existing NVIDIA drivers
echo "Removing any existing NVIDIA drivers..."
sudo apt-get purge nvidia-* -y

# Install recommended NVIDIA drivers
echo "Installing recommended drivers..."
sudo ubuntu-drivers autoinstall

# Rebuild kernel modules with DKMS
echo "Rebuilding kernel modules..."
sudo dkms autoinstall

# Disable nouveau drivers
echo "Disabling nouveau drivers..."
echo -e "blacklist nouveau\noptions nouveau modeset=0" | sudo tee /etc/modprobe.d/blacklist-nouveau.conf
sudo update-initramfs -u

# Reboot
echo "A reboot is required to complete the installation..."
echo "The system will reboot in 30 seconds..."
sleep 30
sudo reboot
