FROM nvidia/cuda:11.0.3-devel-ubuntu18.04
COPY setup.sh /
COPY resolv.conf /
COPY sshd_config /
RUN bash /setup.sh
ENTRYPOINT ["sh", "-c", "/usr/sbin/sshd && tail -f /dev/null"]
LABEL maintainer="LYY"
LABEL OS="ubuntu-18.04"
LABEL cuda="11.0.3"