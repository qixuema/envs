#FROM xgdl_base
#FROM pytorch/pytorch:1.2-cuda10.0-cudnn7-devel
#FROM pytorch/pytorch:1.6.0-cuda10.1-cudnn7-devel
FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-devel
WORKDIR /studio

# change repo for China
COPY pip.conf ~/.config/pip/pip.conf
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
    git 

#RUN mv /etc/apt/temp.sources.d /etc/apt/sources.list.d
# config ssh
COPY ssh/ssh_config /etc/ssh/ssh_config
COPY ssh/sshd_config /etc/ssh/sshd_config
COPY .ssh /root/.ssh
# config proxychains
COPY proxychains.conf /etc/proxychains.conf
# config vim
RUN proxychains git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
# COPY vimrc ~/.vim_runtime
#RUN sh ~/.vim_runtime/install_awesome_vimrc.sh
# config jupyter
COPY .jupyter ~/.jupyter
# config conda
COPY .condarc ~/.condarc
RUN conda clean -i
RUN conda init bash

# create links
RUN ln -s /studio ~/studio
RUN ln -s /studio /smartscan

# install jupyterlab
#RUN conda install -c conda-forge jupyterlab --yes
#RUN conda install nb_conda_kernels --yes


# config bash
COPY .bash_aliases ~/.bash_aliases
