### 如果需要将容器打包为新的镜像，则使用 `docker commit` 
```
docker commit -a <author> -m <commit msg> <容器名称> <新的镜像名称(仓库名:标签)>
```

### 如果需要将新的镜像保存为 tar 文件，则使用 `docker save`
```
docker save 新保存的镜像名称 > tar文件名称
```

### 如果需要从 tar 文件中加载镜像，则使用 `docker load`
```
docker load < tar文件名称
```
