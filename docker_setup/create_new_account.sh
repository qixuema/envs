sudo docker run -d --name <username> --gpus all --hostname <username>-server --shm-size 32g -p 12222:22 -p 14000:3389 -p 15000:15000 -v /mnt/d/<hostname>:/mnt/d danielguerra/ubuntu-xrdp:20.04
