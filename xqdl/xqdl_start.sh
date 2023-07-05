name=container_name
image_name=image_name
hostname=your_hostname

sudo docker run --gpus all -it \
--name ${name} \
--hostname  ${hostname} \
-p 8022:22  \
--ipc=host  \
--cap-add NET_ADMIN --device /dev/net/tun \
-v /mnt/data/xueqi:/studio \
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
