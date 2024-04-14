## 1. setup_ubuntu.sh
`setup_ubuntu.sh` 是用来安装一些常用的小工具，如 git, proxychains, tmux 等等；
### 1.1 (opiton)
有时候，如果这台物理机中没有安装 nvidia-driver，尤其是重装系统之后的服务器，那么就需要先装一下显卡驱动。如果 nvidia-smi 能看到显卡情况的话，就可以忽略掉这部分了  

新系统显卡驱动参考[这里](https://github.com/qixuema/envs/issues/3)

## 2. install_docker.sh 
### 2.1 外网访问工具安装
我们需要预先安装 proxychains，并且能够访问外网，proxychains 的安装配置请参考[这里](https://github.com/Sebastian-Ma-67/envs/issues/2)
### 2.2 安装 docker 及 nvidia-docker2
`install_docker.sh` 是用来在服务器的物理机上安装 docker 以及 nvidia-docker2，其中在安装的过程中，尤其是安装 nvidia-docker2 的时候，需要翻墙，否则安装过程中会出现某些网站无法访问的问题，导致安装失败；
```
bash install_docker.sh
```
### 2.2 Postprocessing
安装完 `docker` 之后，可以将 `当前用户` 存入到 `docker 组` 中，这样以后可以直接使用 docker 命令，不用每次都添加 `sudo`。你只需执行下面三行命令：
```
sudo groupadd docker
```
```
sudo usermod -aG docker 用户名
```
```
newgrp docker 
```

### =========分界线========================================
以上是直接在物理机上安装 docker 开发环境，以下是在物理机上用 docker 创建新的容器，主要针对的是给服务器创建新的账号
## 3. container_create.sh
### 3.1 映射文件夹创建
需要注意的是，在使用 docker 创建新的虚拟服务器之前，需要创建以下文件夹，作为容器的挂载目录，主要用于存放用户的重要数据 `/mnt/d/<hostname>`，而且我们还要保证该路径挂载的是物理机的「机械盘」。我们建议容器账号用户把重要的代码和资料放在机械盘上;
### 3.2 创建容器
`container_create.sh` 是用来通过 docker 的方式来创建新服务器的，里面需要修改的内容包括 <username>, 以及三个端口号 12222, 14000, 15000，还有 ip 号，比如 155;  

修改 `container_create.sh` 文件
```
sudo vim container_create.sh
```
执行 `container_create.sh` 文件
```
bash container_create.sh
```

### =========分界线========================================
上面就是给服务器创建容器账号，下面是一些额外的操作，一般情况下不需要执行
## 4. [打包容器、保存&加载镜像](https://github.com/qixuema/envs/blob/main/docker_setup/%E6%89%93%E5%8C%85%E5%AE%B9%E5%99%A8%E3%80%81%E4%BF%9D%E5%AD%98%26%E5%8A%A0%E8%BD%BD%E9%95%9C%E5%83%8F.md)
`container_csl` 容器迁移，或者定期保存时使用；
## 5. [在容器中创建新账号](https://github.com/qixuema/envs/blob/main/docker_setup/create_new_account.md)
`create_new_account` 在创建好新的虚拟服务器之后，创建新的账户；
## 6. [容器自启动方法](https://github.com/qixuema/envs/blob/cd3685eee6bac9f16f32635d63b76cfc7408b954/docker_setup/Container_self-start_method.md)
有的时候，当我们不小心把电脑重启之后，我们之前运行的 `container` 就会在关机的时候关闭掉，在重启的时候并不会自动打开，因此我们需要通过一些设置，使得容器可以在非主动退出的情况下进行重启；
## 7. [设置机械硬盘开机自动挂载](https://github.com/qixuema/envs/blob/cd3685eee6bac9f16f32635d63b76cfc7408b954/docker_setup/Set_mechanical_hard_drives_to_automatically_mount_on_boot.md)
在我们把机械硬盘分好区，并挂载好之后，如果不将挂载信息写入到开机执行文件中，那么我们就需要自己手动地再一次挂载机械硬盘，为了避免麻烦，我们需要对此进行设置；
