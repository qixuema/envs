sudo docker run --gpus all -it \
--name=xgdl_cu113 \
-p 1949:22   \
-p 1950:5901 \
-p 1951:3389 \
-p 1952:443  \
-p 1953:80   \
-p 1954:8888 \
-p 1955:6006 \
--ipc=host   \
--cap-add NET_ADMIN --device /dev/net/tun \
-v /media/data/xingguang:/studio \
xgdl:cuda11.3 \
bash

#-v qinglong:/studio \

#pytorch/pytorch:1.6.0-cuda10.1-cudnn7-devel
#--privileged \
#--cap-add SYS_ADMIN \
# allow using vpn (openconect)
#--cap-add NET_ADMIN --device /dev/net/tun myimage
#--cap-add DAC_READ_SEARCH \
