# Steps to install latest Nvidia Stuff to Ubuntu Server


### Install Nvidia Driver
1. Check driver versions - `cat /proc/driver/nvidia/version`
2. List all available driver version for your system `sudo ubuntu-drivers list --gpgpu`
3. Install using __ubuntu-drivers__ tool - `sudo ubuntu-drivers install nvidia:[545|550]` (select on of the versions)
4. Install additional components `sudo apt install nvidia-utils-550-server`

#### Remove Nvidia Driver and CUDA Toolkit
1. `sudo apt-get --purge remove "*cuda*" "*cublas*" "*cufft*" "*cufile*" "*curand*" "*cusolver*" "*cusparse*" "*gds-tools*" "*npp*" "*nvjpeg*" "nsight*" "*nvvm*"`
2. `sudo apt-get --purge remove "*nvidia*" "libxnvctrl*"`
3. `sudo apt autoremove`


[Link to NVIDIA Driver installation steps](https://ubuntu.com/server/docs/nvidia-drivers-installation)



### Install CUDA Toolkit

#### Pre-install Action
1. `lspci | grep -i nvidia`
2. `uname -m && cat /etc/*release`
3. `gcc --version`
4. `uname -r`

#### Package Manager Installation (Default Version)
1. `sudo apt-get install linux-headers-$(uname -r)`
2. `wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb`
  - `sudo dpkg -i cuda-keyring_1.1-1_all.deb`
3. `sudo apt-get update`
4. `sudo apt-get install cuda-toolkit`
5. `sudo reboot`

#### Install Specific Version of CUDA Toolkit
[Link to CUDNN specific version](https://developer.nvidia.com/cuda-toolkit-archive)

NOTE: In this case install specific version of Tensorflow, see compatibility tables

#### Post-installation Action
1. add to __.bashrc__ `export PATH=/usr/local/cuda-12.4/bin${PATH:+:${PATH}}`
2. `sudo systemctl enable nvidia-persistenced`
3. `cat /proc/driver/nvidia/version`
4. `nvidia-smi`
4. `nvcc --version`


[Link to CUDNN installation steps](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#)

