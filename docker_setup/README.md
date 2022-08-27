## 1.
`install_docker.sh` 是用来在服务器的物理机上安装 docker 以及 nvidia-docker2，
其中安装的过程中，尤其是安装 nvidia-docker2 的时候，需要翻墙，否则安装过程中会出现某些网站无法访问的问题，导致安装失败；
## 2. 
`setup_ubuntu.sh` 是用来安装一些常用的小工具，如 git, proxychains, tmux 等等；

### 2.1 
有时候，如果这台物理机中没有安装 nvidia-driver，尤其是重装系统之后的服务器，那么就需要先装一下显卡驱动
```
sudo apt update
```
```
sudo apt install nvida-driver-460 -y
```

### ========= 以上是直接在物理机上安装 docker 开发环境，以下是在物理机上用 docker 创建新的虚拟服务器
## 3. 
`create_new_server.sh` 是用来通过 docker 的方式来创建新服务器的，里面需要修改的内容包括 <username>, 以及三个端口号 12222, 14000, 15000;
另外，需要注意的是，在使用 docker 创建新的虚拟服务器之前，需要创建以下文件夹，用来存放用户的重要数据 `/mnt/d/<hostname>` ;
## 4.
`container_csl` 容器迁移，或者定期保存时使用
## 5. 
`create_new_account` 在创建好新的虚拟服务器之后，创建新的账户
