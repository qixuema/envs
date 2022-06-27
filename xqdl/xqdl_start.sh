sudo docker run --gpus all -it \
--name=xqdl_cu113 \
-p 9022:22   \
-p 9080:80   \
--ipc=host   \
--cap-add NET_ADMIN --device /dev/net/tun \
-v /media/data/xueqi:/studio \
xqdl:latest \
bash

#-v qinglong:/studio \

#pytorch/pytorch:1.6.0-cuda10.1-cudnn7-devel
#--privileged \
#--cap-add SYS_ADMIN \
# allow using vpn (openconect)
#--cap-add NET_ADMIN --device /dev/net/tun myimage
#--cap-add DAC_READ_SEARCH \
