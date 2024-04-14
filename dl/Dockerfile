FROM nvidia/cuda:12.2.0-devel-ubuntu20.04
LABEL maintainer="qixuemaa@gmail.com"

WORKDIR /studio

# change repo for China
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
    curl \
    apt-utils \
    python3-pip

# config pip
COPY pip.conf /root/.config/pip/pip.conf

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

# create links
RUN ln -s /studio /root/studio

# config jupyter
# COPY .jupyter /root/.jupyter
# install jupyterlab
# RUN conda install -c conda-forge jupyterlab nb_conda_kernels --yes

# NOTE: I prefer to use mamaba, so I install it like blow. If you don't like it, you can comment it.
RUN curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh"
# ENTER 'yes' twice
RUN printf '\n%s\n\n%s\n' 'yes' 'yes' | bash Mambaforge-$(uname)-$(uname -m).sh 

# 这个命令将输出：
# - 第一个 `\n`：模拟按下 `Enter` 继续许可协议。
# - 第一个 `%s\n`：输入 "yes" 并按 `Enter` 接受许可协议。
# - 第二个 `\n`：再次模拟按下 `Enter`，通常是确认安装路径。
# - 第二个 `%s\n`：输入 "yes" 并按 `Enter`，如果需要确认任何其他选项。

# COPY .condarc /root/.condarc
# RUN conda clean -i
# RUN conda init bash

# Some software I don't know how to install automatically at the moment, I need to install it manually after generating the container
# COPY install_tools.sh /root/install_tools.sh

# config bash
COPY .bash_aliases /root/.bash_aliases

# restart ssh service
ENTRYPOINT service ssh restart && bash
