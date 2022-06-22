sudo docker run -e PASSWORD=1 -e SUDO=yes -itd --privileged --name=unovnc -p 6080:6080 -v ~/studio:/studio unovnc:latest

