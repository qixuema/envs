# Uninstall old versions
sudo apt-get remove docker docker-engine docker.io containerd runc

# Uninstall Docker Engine
sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-compose-plugin
# delete all images, containers, and volumes
# sudo rm -rf /var/lib/docker
# sudo rm -rf /var/lib/containerd

# install docker
sudo apt-get update

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io


# install docker nvidia-docker2
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update

sudo apt-get install -y nvidia-docker2

sudo systemctl restart docker

sudo docker run --rm --gpus all nvidia/cuda:11.0-base nvidia-smi

sudo mv /var/lib/docker /var/lib/docker_replaced
sudo ln -s /media/data/dockerdata /var/lib/docker

# Manage Docker as a non-root user
sudo groupadd docker
sudo usermod -aG docker xueqi
newgrp docker 
docker ps
