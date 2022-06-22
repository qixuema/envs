sudo docker run --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7,8,9 -it \
--name=xgdl \
-p 1949:22   \
-p 1950:5901 \
-p 1951:3389 \
-p 1952:443  \
-p 1953:80   \
-p 1954:8888 \
-p 1955:6006 \
--ipc=host   \
-v qinglong:/studio \
xgdl:latest \
bash

#pytorch/pytorch:1.6.0-cuda10.1-cudnn7-devel
#--privileged \
#--cap-add SYS_ADMIN \
#--cap-add DAC_READ_SEARCH \
