# 进入新创建的虚拟服务器，账户名和密码都是 ubuntu
```
ssh -p <端口号> ubuntu@172.31.224.x
```

# 创建新的账户, username 是即将要创建的新账户的名字
```
sudo adduser username
```

# 添加 sudo 权限
```
sudo vim /etc/sudoers
```
```
username ALL=(ALL:ALL) ALL
```
