# docker_setup ===
1. `docker_setup` 里面的文件分为两部分：
    1. 一部分是用于在物理机上新建一个开发环境，那么就需要对物理机的 ubuntu 系统安装一些小工具，以及安装必要的 docker 工具，包括 `docker-ce` 以及 `nvidia-docker2` ，详细信息请查看[这里](https://github.com/Sebastian-Ma-67/envs/tree/main/docker_setup)；
    2. （option）另外一部分是在此基础上，新建一个 ubuntu 系统容器，用于给新用户开新账号（如果只是使用 cuda 和 pytorch 进行深度学习训练的话，可以不用看这部分）；

2. 安装完 `docker` 之后，可以将 `当前用户` 存入到 `docker组` 中，这样以后可以直接使用 docker 命令，不用每次都sudo。只需执行下面三行命令：
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
1. 服务器物理机上安装 ubuntu 常用小工具以及 docker 工具之后（上面部分的内容），我们就可以进入到 `xqdl` （这里是我的名字缩写+dl）文件夹里了；

2. 接下来我们安装深度学习开发环境：下面涉及到的文件的详细介绍请参考[这里](https://github.com/Sebastian-Ma-67/envs/tree/main/xqdl#readme)

    1. 首先，修改 `Dockerfile` 文件，主要是修改第一行的 `pytorch` 版本和 `cuda` 版本。`pytorch` 版本与 `cuda` 版本相关，即我们要首先确定 `cuda` 的版本是多少。具体修改成什么请查询 `dockerhub` ，查询方法在[这里](https://github.com/Sebastian-Ma-67/envs/issues/1)。注意，不要把 dockerhub 里面的 docker pull 字样也粘贴进去！

    2. 其次，打开并修改 `build.sh` 文件，主要是修改要生成的 `image` 的名字和标签，修改方式请参考[这里](https://github.com/Sebastian-Ma-67/envs/tree/main/xqdl#readme)；

    3. 然后，执行下面命令来构建镜像：
        ```
        bash build.sh
        ```

    4. 接着，修改 `xqdl_start.sh` 文件，主要是修改要创建的 `container` 的名字、分配的端口号，以及是基于哪一个 `image` 来创建的，修改方式请参考[这里](https://github.com/Sebastian-Ma-67/envs/tree/main/xqdl#readme)。然后执行下面命令：
        ```
        bash xqdl_start.sh
        ```

3. 进入 container 之后，执行以下命令开启 ssh 服务（我后来在 Dockerfile 添加了自启动 ssh 服务，所以下面这行命令可以不执行）：
    ```
    service ssh start 
    ```

4. 最后修改 `root` 账户密码，输入一个自己喜欢的密码（务必要执行一下，因为 ssh 连接的时候是需要输入密码的）：
    ```
    passwd
    ```
5. 注意，新的容器里面已经安装好了 cuda、pytorch、conda，不需要我们再次安装了

完事!
## Acknowledgement
@[QhelDIV](https://github.com/QhelDIV)
