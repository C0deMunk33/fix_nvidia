#!/usr/bin/env bash

 

# blacklist the nouveau driver

touch /etc/modprobe.d/10-blacklist_nouveau.conf

echo "blacklist nouveau" >> /etc/modprobe.d/10-blacklist_nouveau.conf

echo "option nouveau modeset=0" >> /etc/modprobe.d/10-blacklist_nouveau.conf

 

# remove everything nvidia related

apt remove --purge '^nvidia-.*'

 

# install matching kernel headers if needed

apt install linux-headers-$(uname -r)

 

# install the repo

wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin

mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600

apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/3bf863cc.pub

add-apt-repository "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/ /"

 

# initialize the repo

apt update

 

# install the toolkit and all drivers

apt install -y cuda

 

# update the paths for the system to see CUDA

echo "export PATH=/usr/local/cuda-12.2/bin${PATH:+:${PATH}}" >> ~/.bashrc

echo "export LD_LIBRARY_PATH=/usr/local/cuda-12.2/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}" >> ~/.bashrc

 

# source your bashrc file to refresh environment

source ~/.bashrc
