FROM danielguerra/ubuntu-xrdp
LABEL maintainer="sebastian.xq.ma@gmail.com"

WORKDIR /mnt/d

# change repo for China
COPY apt/sources.list /etc/apt/sources.list

# download packages 
RUN apt-get install -y \
    tmux \
    vim \
    proxychains \
    git \
    apt-utils

# create links
RUN ln -s /mnt/d /home/ubuntu/studio

# config bash
COPY .bash_aliases /home/ubuntu/.bash_aliases
