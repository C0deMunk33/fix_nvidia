#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Update and Upgrade Ubuntu Packages
sudo apt-get update
sudo apt-get upgrade -y

# Install Python3 and Pip3
sudo apt-get install python3 -y
sudo apt-get install python3-pip -y

# Creating a symbolic link for python3 as python
sudo ln -s /usr/bin/python3 /usr/bin/python

# Install NVIDIA CUDA Toolkit and cuDNN
# The version of CUDA and cuDNN depends on your NVIDIA driver and GPU compatibility
sudo apt-get install nvidia-cuda-toolkit -y
# To install cuDNN, you usually need to download it from NVIDIA's website and follow their installation instructions

# Install PyTorch with CUDA support
# You should choose the version of PyTorch compatible with your CUDA version
# The command below installs the latest PyTorch version compatible with CUDA
pip3 install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu113

echo "PyTorch and necessary tools have been successfully installed."
