sudo docker run --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=3 -it \
--name=occnet \
-v /mnt/data/qheldiv/studio/smartscan/:/smartscan \
pytorch/pytorch:1.2-cuda10.0-cudnn7-devel \
bash
