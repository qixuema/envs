name=container_name
image_name=image_name
hostname=your_hostname

hard_disk_path=/mnt/data/${name}
sudo mkdir -p ${hard_disk_path}
sudo touch ${hard_disk_path}/${name}.txt

sudo docker run --gpus all -d -it \
--name ${name} \
--hostname ${hostname} \
-p 8022:22 \
-p 16000:16000 \
--ipc=host \
--cap-add NET_ADMIN --device /dev/net/tun \
-v ${hard_disk_path}:/studio \
${image_name}

docker update --restart unless-stopped ${name}
docker restart ${name}

#-v qinglong:/studio \

#pytorch/pytorch:1.6.0-cuda10.1-cudnn7-devel
#--privileged \
#--cap-add SYS_ADMIN \
# allow using vpn (openconect)
#--cap-add NET_ADMIN --device /dev/net/tun myimage
#--cap-add DAC_READ_SEARCH \
