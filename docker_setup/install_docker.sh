# Uninstall old versions
sudo apt-get remove docker docker-engine docker.io containerd runc

# ===== Install docker =====
## Update the apt package index and install packages to allow apt to use a repository over HTTPS:
sudo apt-get update

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

## Add Docker’s official GPG key:
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

## Use the following command to set up the repository:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
## Update the apt package index, and install the latest version of Docker Engine, containerd
sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io


# ===== Install docker nvidia-docker2 =====
# Setting up Docker
## Docker-CE on Ubuntu can be setup using Docker’s official convenience script:
curl https://get.docker.com | sh \
  && sudo systemctl --now enable docker
  
# Setting up NVIDIA Container Toolkit
## Setup the package repository and the GPG key:
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
      && curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
      && curl -s -L https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.list | \
            sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
            sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

## Install the nvidia-docker2 package (and dependencies) after updating the package listing:
sudo apt-get update

sudo apt-get install -y nvidia-docker2

# Restart the Docker daemon to complete the installation after setting the default runtime:
sudo systemctl restart docker

# At this point, a working setup can be tested by running a base CUDA container:
sudo docker run --rm --gpus all nvidia/cuda:11.0.3-base-ubuntu20.04 nvidia-smi

# ===== postprocessing =====
# If u want to manage Docker as a non-root user, u can:
#   sudo groupadd docker
#   sudo usermod -aG docker xueqi
#   newgrp docker 
#   docker ps

# if u want clear all the files about docker, you can do like this:
# Uninstall Docker Engine
#   sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Delete all images, containers, and volumes
#   sudo rm -rf /var/lib/docker
#   sudo rm -rf /var/lib/containerd
