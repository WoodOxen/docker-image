FROM nvidia/cuda:11.7.0-devel-ubuntu20.04
COPY ssh_only_setup.sh /
COPY ./configs/ /
RUN bash /ssh_only_setup.sh
ENTRYPOINT ["sh", "-c", "/usr/sbin/sshd && tail -f /dev/null"]