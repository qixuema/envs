详细教程网址，请参考[这里](https://www.digitalocean.com/community/tutorials/how-to-partition-and-format-storage-devices-in-linux)
一般情况下，我们的机械硬盘已经分好区了，我们直接挂载就行

1. 首先，查看文件系统的信息, 找到要自动挂载的分区的 `UUID` 以及在文件系统中的挂载位置
    ```
    sudo lsblk --fs
    ```
2. 打开文件系统的静态信息，当系统启动的时候，系统会自动地从这个文件读取信息，并且会自动地将此文件中指定的文件系统挂载到指定的目录下
    ```
    sudo vim /etc/fstab
    ```
3. 修改改文件。格式: UUID 挂载位置 磁盘格式 默认 默认 默认
    ```
    UUID=<一长串字符> /mnt/d ext4 defaults 0 2
    ```

