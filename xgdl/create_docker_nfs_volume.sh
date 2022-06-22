sudo docker volume create --driver local \
      --opt type=nfs \
      --opt o=nfsvers=4,addr=172.31.224.5,rw \
      --opt device=:/media/data/xingguang/ \
      netstudio
