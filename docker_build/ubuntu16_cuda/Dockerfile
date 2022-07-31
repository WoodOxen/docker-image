FROM nvidia/cuda:11.0.3-devel-ubuntu16.04
COPY ubuntu_gui_setup.sh /
RUN bash /ubuntu_gui_setup.sh
ENTRYPOINT ["sh", "-c", "/usr/sbin/sshd && tail -f /dev/null"]