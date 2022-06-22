sudo docker run --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=0,1,2,3 -it \
--name=xingguang-latent_3d_points \
-p 1959:22   \
-p 1960:5901 \
-p 1961:3389 \
-p 1962:443  \
-p 1963:80   \
-p 1964:8888 \
-p 1965:6006 \
-v /media/data/xingguang/studio:/studio \
optas/latent_3d_points \
bash

