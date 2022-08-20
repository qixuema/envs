## 1.
`install_docker.sh` 是用来在服务器的物理机上安装 docker 以及 nvidia-docker2，
其中安装的过程中，尤其是安装 nvidia-docker2 的时候，需要翻墙，否则安装过程中会出现某些网站无法访问的问题，导致安装失败；
## 2. 
`setup_ubuntu.sh` 是用来安装一些常用的小工具，如 git, proxychains, tmux 等等；
## 3. 
`create_new_account.sh` 是用来通过 docker 的方式来创建新账户的，里面需要修改的内容包括 <username>, 以及三个端口号 12222, 14000, 15000;
另外，在使用 docker 创建新账号之前，需要创建以下文件夹，用来存放用户的重要数据 `/mnt/d/<hostname>` ;
