## Dockfile 文件介绍
> Dockerfile 文件有两个，一个是基于 Pytorch 官方提供的镜像，另外一个是基于 Nvidia 提供的 cuda 镜像（默认）。
- 如果你只需要一个装好 cuda 的 ubuntu 系统，那么可以选择 Nvidia 提供的镜像，也就是默认的 `Dockerfile`; 
- 如果你需要一个装好 cuda 和 pytorch 的 ubuntu 系统，那么可以选择 Pytorch 官方提供的镜像，同样也需要修改对应的 `Dockerfile` 文件名。

```Dockfile
FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-devel  
# 这个文件我们只需要修改 FROM 后面的内容就可以了，其他的可以不用修改，注意镜像的版本建议选择 devel 版本，而不是 runtime 版本，因为后面我们在安装一些扩展包的时候，需要进行编译；  
```

> Note: 默认的 `sources.list` 是对应 `ubuntu 22.04`; 如果这里选择的镜像是 `ubuntu 20.04`，请将 `/apt` 路径下的 `sources.list` 文件中的内容替换为 `sources.list.20.04` 文件中的内容!!!

## build_image.sh 文件介绍

```shell
docker build --tag qixuema:cu122 . 
# qixuema:cu122 指的是生成的镜像的 <名字:标签>，后面的 `.` 表示 build 操作是在当前路径下进行的
# 在本案例中, qixuema:cu122 中的 qixuema 是镜像（image）的名字，cu122 是镜像（image）的标签（tag）。
# 这里可以根据自己的喜好修改名字和标签
```

## xqdl_start.sh 文件介绍

```shell
name=container_name              # 这里的 container_name 是即将生成的容器的名字，可以根据自己的喜好修改
image_name=image_name            # 这里的 image_name 是我们之前 build 的镜像名称
hostname=your_hostname           # 这里的 your_hostname 是生成的 ubuntu 系统的主机名，可以根据自己的喜好修改

hard_disk_path=/mnt/data/${name}          # 这里是指定容器映射的机械盘挂载的路径
sudo mkdir -p ${hard_disk_path}           # 创建指定的物理机挂载路径
sudo touch ${hard_disk_path}/${name}.txt  # 新建一个 test 文件，用于测试是否创建以及挂载成功

sudo docker run --gpus all -it -d \
--name ${name} \
--hostname ${hostname} \
-p 8022:22  \                                   # 注意这里的 8022 是否要修改，如果 8022 端口号已经被占用，则需要进行修改
-p 16000:16000 \                                # 这个是自定义的端口号，可以根据自己的喜好进行修改
--ipc=host  \
--cap-add NET_ADMIN --device /dev/net/tun \
-v ${hard_disk_path}:/studio \
${image_name}

docker update --restart unless-stopped ${name}     # 设置我们新建的容器为开机自启动
docker restart ${name}                             # 重启容器，使上一步的 update 生效

# 注意，执行该文件之后，容器就创建好了，此时我们的账号默认是 root 账号，密码是 123，我们以后也是在该账号下工作；
```
我们可以通过下面的命令进入到容器中，注意，这里的端口号是我们在 `container_create.sh` 文件中设置的端口号，如果你在 `container_create.sh` 文件中修改了端口号，那么这里的端口号也需要进行修改
```
ssh -p 8022 root@ip_address
```
