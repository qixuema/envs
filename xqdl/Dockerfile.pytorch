FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-devel
LABEL maintainer="qixuemaa@gmail.com"

WORKDIR /studio

# change repo for China
COPY pip.conf /root/.config/pip/pip.conf
COPY apt/sources.list /etc/apt/sources.list

# change timezone to shanghai
ENV TZ=Asia/Shanghai
RUN mkdir -p /usr/share/zoneinfo/Asia \
  && ln -snf /usr/share/zoneinfo/PRC /usr/share/zoneinfo/$TZ \
  && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
  && echo $TZ > /etc/timezone

# download packages 
RUN mv /etc/apt/sources.list.d /etc/apt/temp.sources.d 
RUN apt-get update

RUN apt-get install -y \
    openssh-server \
    tmux \
    vim \
    proxychains \
    git \
    apt-utils

# config ssh
COPY ssh/ssh_config /etc/ssh/ssh_config
COPY ssh/sshd_config /etc/ssh/sshd_config
COPY .ssh /root/.ssh

# config root password
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN echo "root:123" | chpasswd

# config proxychains
COPY proxychains.conf /etc/proxychains.conf

# config vim
# RUN proxychains git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
# COPY vimrc ~/.vim_runtime
#RUN sh ~/.vim_runtime/install_awesome_vimrc.sh

# config conda
COPY .condarc /root/.condarc
RUN conda clean -i
RUN conda init bash

# create links
RUN ln -s /studio /root/studio

# config jupyter
# COPY .jupyter /root/.jupyter
# install jupyterlab
# RUN conda install -c conda-forge jupyterlab nb_conda_kernels mamba --yes

# I prefer to use mamaba, so I install it like blow.
# RUN curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh"
# RUN bash Mambaforge-$(uname)-$(uname -m).sh



# config bash
COPY .bash_aliases /root/.bash_aliases

# restart ssh service
ENTRYPOINT service ssh restart && bash
