sudo docker run --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=3 -it \
--name=3DEPN \
-p 1969:22   \
-p 1970:5901 \
-p 1971:3389 \
-p 1972:443  \
-p 1973:80   \
-p 1974:8888 \
-p 1975:6006 \
-v /media/data/xingguang/3DEPN:/3DEPN \
3depn:first \
bash

