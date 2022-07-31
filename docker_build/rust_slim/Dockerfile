FROM rust:slim
WORKDIR /root
RUN \
    apt update &&\
    apt upgrade -y &&\
    apt install -y \
        sudo \
        vim \
        ssh \
        build-essential \
        ca-certificates apt-transport-https \
        curl iproute2 inetutils-ping \
        git 
RUN mkdir -p /run/sshd
RUN \
    echo \
    'deb https://mirror.sjtu.edu.cn/debian bullseye main contrib \n\
    deb https://mirror.sjtu.edu.cn/debian bullseye-updates main contrib \n\
    # security updates \n\
    deb https://mirror.sjtu.edu.cn/debian-security bullseye-security main contrib\n' \
    > /etc/apt/sources.list
# RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod 
# RUN echo "%sudo ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
# USER gitpod
