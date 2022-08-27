# docker_setup ===
1. `docker_setup` 里面的文件分为两部分，一部分是用于在物理机上新建一个开发环境，那么就需要对物理机的 ubuntu 系统安装一些小工具，以及安装必要的 docker 工具，包括 `docker-ce` 以及 `nvidia-docker2` ，详细信息请查看[这里](https://github.com/Sebastian-Ma-67/envs/tree/main/docker_setup)；

2. 另外一部分是在此基础上，新建一个 ubuntu 系统容器，用于给新用户开新账号；

3. 安装完 `docker` 之后，可以将 `当前用户` 存入到 `docker组` 中，这样以后可以直接使用docker命令，不用每次都sudo，只需执行下面三行命令：
```
sudo groupadd docker
```
```
sudo usermod -aG docker 用户名
```
```
newgrp docker 
```

# xqdl ===
1. 在服务器物理机上安装 ubuntu 常用小工具以及 docker 工具之后，我们就可以进入到 `xqdl` 文件夹里了；

2. 接下来我们安装深度学习开发环境；

3. 首先，修改 `Dockerfile` 文件，主要是修改第一行的 `pytorch` 版本，这个与 `cuda` 版本相关，即我们要首先确定 `cuda` 的版本是多少，具体修改成什么请查询 `dockerhub` ;

4. 其次，修改 `build.sh` 文件，主要是修改要生成的 `image` 的名字

5. 然后，执行下面命令来构建镜像：
```
bash build.sh
```

6. 接着，修改 `xqdl_start.sh` 文件，主要是修改要创建的 `container` 的名字、分配的端口号，以及是基于哪一个 `image` 来创建的，然后执行下面命令：
```
bash xqdl_start.sh
```

7. 进入 container 之后，执行以下命令开启 ssh 服务：
```
service ssh start 
```

8. 最后修改 `root` 账户密码：
```
passwd
```

完事!
