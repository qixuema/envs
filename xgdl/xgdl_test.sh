sudo docker run -it --gpus all \
--name=xgdl_test \
pytorch/pytorch:1.8.1-cuda11.1-cudnn8-devel
bash

#pytorch/pytorch:1.6.0-cuda10.1-cudnn7-devel
#--privileged \
#--cap-add SYS_ADMIN \
#--cap-add DAC_READ_SEARCH \
