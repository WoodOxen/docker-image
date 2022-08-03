FROM nvidia/cuda:11.0.3-devel-ubuntu16.04
COPY ssh_only_setup.sh /
COPY ./configs/ /
RUN bash /ssh_only_setup.sh
ENTRYPOINT ["sh", "-c", "/usr/sbin/sshd && tail -f /dev/null"]
LABEL maintainer="LYY"
LABEL OS="ubuntu-18.04"
LABEL cuda="11.0.3"