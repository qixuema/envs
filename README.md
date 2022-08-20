## 首先在服务器物理机上配置ubuntu 和 安装docker工具

安装完docker之后，可以将当前用户将入到docker组中，这样以后可以直接使用docker命令，不用每次都sudo，只需执行下面三行命令，记得把xueqi修改为当前用户名字
```
sudo groupadd docker
```
```
sudo usermod -aG docker xueqi
```
```
newgrp docker 
```
这样就可以了


## 其次，安装深度学习环境
修改 Dockerfile 文件，主要是修改pytorch版本基于cuda版本
修改build.sh 文件，主要是修改要生成的image 的名字
bash build.sh 构建镜像
修改 xqdl_start.sh 文件，主要是修改要创建的container的名字端口号，以及是基于哪一个image来创建的
bash xqdl_start.sh 进入 container
service ssh start 开启 ssh 服务
passwd 修改 root 账户密码
完事!
