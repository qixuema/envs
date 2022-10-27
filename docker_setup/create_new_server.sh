# 创建新的虚拟服务器, <username>.c 只是一个容器的名字，表示该容器是 <username> 的 [c]ontainer, 创建； 注意 -v 後面的/mnt/d 是不能修改的，
name=test
ssh_port=12225
remote_control_port=14003
diy_port=15003
ip_address=156

sudo docker run -d -it \
--name ${name}.c \
--gpus all \
--hostname ${name}-${ip_address} \
--shm-size 32g \
-p ${ssh_port}:22 \
-p ${remote_control_port}:3389 \
-p ${diy_port}:15000 \
-v /mnt/data1/${name}:/mnt/d \
danielguerra/ubuntu-xrdp:20.04

# 将该容器设置为意外退出时进行重启操作
docker update --restart unless-stopped ${name}.c
