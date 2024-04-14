# 创建新的虚拟服务器, <username>.c 只是一个容器的名字，表示该容器是 <username> 的 [c]ontainer, 创建； 注意 -v 後面的/mnt/d 是不能修改的，
name=test
ssh_port=12222
remote_control_port=14000
diy_port=15000
ip_address=156

hard_disk_path=/mnt/data/${name}
sudo mkdir -p ${hard_disk_path}
sudo touch ${hard_disk_path}/${name}.txt

sudo docker run -d -it \
--name ${name}.c \
--gpus all \
--hostname ${name}-${ip_address} \
--shm-size 32g \
-p ${ssh_port}:22 \
-p ${remote_control_port}:3389 \
-p ${diy_port}:15000 \
-v ${hard_disk_path}:/mnt/d \
danielguerra/ubuntu-xrdp:20.04

# 将该容器设置为意外退出时进行重启操作
docker update --restart unless-stopped ${name}.c
docker restart ${name}.c
