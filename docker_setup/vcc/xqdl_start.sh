sudo docker run --gpus all -it \
--name=xqdl_cu113 \
--hostname cu113 \
-p 8022:22  \
--ipc=host  \
--cap-add NET_ADMIN --device /dev/net/tun \
-v /mnt/data/xueqi:/studio \
xqdl:cuda11.3 \
bash

#-v qinglong:/studio \

#pytorch/pytorch:1.6.0-cuda10.1-cudnn7-devel
#--privileged \
#--cap-add SYS_ADMIN \
# allow using vpn (openconect)
#--cap-add NET_ADMIN --device /dev/net/tun myimage
#--cap-add DAC_READ_SEARCH \
