# Uninstall old versions
sudo apt-get remove docker docker-engine docker.io containerd runc

# ===== Install docker =====
## Update the apt package index and install packages to allow apt to use a repository over HTTPS:
sudo proxychains apt-get update

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

## Add Docker’s official GPG key:
sudo mkdir -p /etc/apt/keyrings
proxychains curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

## Use the following command to set up the repository:
proxychains echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# delete 'ProxyChains-3.1' info in docker.list
sudo sed -i '1d' /etc/apt/sources.list.d/docker.list

# Install Docker Engine
## Update the apt package index, and install the latest version of Docker Engine, containerd
sudo proxychains apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io


# ===== Install docker nvidia-docker2 =====
# https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html
# Setting up Docker
## Docker-CE on Ubuntu can be setup using Docker’s official convenience script:
curl https://get.docker.com | sh \
  && sudo systemctl --now enable docker
  
# Setting up NVIDIA Container Toolkit
echo "=== Setup the package repository and the GPG key"

## 這裡我加上了 proxychains ，因為如果不加的話，這些地址 curl 不到 ，注意，当执行完一下命令之后，如果是 20.04，那么最后写入内容为 18.04，而不是 20.04

distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
      && proxychains curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
      && proxychains curl -s -L https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.list | \
            sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
            sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

# delete the first line info
sudo sed -i '1d' /etc/apt/sources.list.d/nvidia-container-toolkit.list

## Install the nvidia-docker2 package (and dependencies) after updating the package listing:
sudo proxychains apt-get update

# 这里在给 yangyue 电脑安装的时候，需要使用 proxy，否则会失败
sudo proxychains apt-get install -y nvidia-docker2

# Restart the Docker daemon to complete the installation after setting the default runtime:
sudo systemctl restart docker

# At this point, a working setup can be tested by running a base CUDA container:
sudo docker run --rm --gpus all nvidia/cuda:11.0.3-base-ubuntu20.04 nvidia-smi

echo "===== postprocessing ====="
echo "=== 
# If u want to manage Docker as a non-root user, u can:
#   sudo groupadd docker
#   sudo usermod -aG docker xueqi
#   newgrp docker 
#   docker ps 
==="

echo "=== 
# if u want clear all the files about docker, you can do like this:
# Uninstall Docker Engine
#   sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-compose-plugin
# However, in general, I do not recommend executing this command!
==="

echo "=== 
# Delete all images, containers, and volumes
#   sudo rm -rf /var/lib/docker
#   sudo rm -rf /var/lib/containerd
# Unless you don't want to live, it is not recommended that you execute the above command!
==="