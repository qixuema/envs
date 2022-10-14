## build.sh 文件介绍
```shell
docker build --tag xqdl:cuda11.3 . # xqdl:cuda11.3 指的是生成的镜像的名字:标签，后面的 `.` 表示 build 操作是在当前路径下进行的
```

## xqdl_start.sh 文件介绍
```shell
sudo docker run --gpus all -it \
--name=xqdl_cu113 \             # 这里的 xqdl_cu113 是即将生成的容器的名字，可以根据自己的喜好修改
--hostname cu113 \              # 这里的 cu113 是生成的 ubuntu 系统的主机名，可以根据自己的喜好修改
-p 8022:22   \                  # 这里的 8022 是容器内部的 22 端口在外部的映射，我们在使用 ssh 连接该容器的时候需要指定该端口号
--ipc=host   \ 
--cap-add NET_ADMIN --device /dev/net/tun \
-v /mnt/data/xueqi:/studio \    # 在执行该文件之前，我们需要在服务器的物理机上面提前新建一个文件夹，为 `/mnt/data/xueqi`
xqdl:cuda11.3 \                 # 这里的 xqdl:cuda11.3 是我们之前 build 的镜像名称:镜像标签
bash
# 注意，执行该文件之后，我们就自动进入到了容器内部，并且此时我们的账号是 root 账号，我们以后也是在该账号下工作
```