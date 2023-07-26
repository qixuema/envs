### 如果需要将容器打包为新的镜像，则使用 `docker commit` 
```
docker commit -a author -m commit_msg 容器名称 新的镜像名称(仓库名:标签)
```
- author：指的是该镜像的作者，可以写自己的昵称  
- commit_msg：类似于 git commit 的时候填的内容  
- 容器名称：指的是即将要打包的容器名称  
- 新的镜像名称(仓库名:标签)：指的是即将要生成的镜像，建议用 `仓库名:标签` 的形式  

### 如果需要将新的镜像保存为 tar 文件，则使用 `docker save`
```
docker save 新保存的镜像名称 > tar文件名称
```

### 如果需要从 tar 文件中加载镜像，则使用 `docker load`
```
docker load < tar文件名称
```
