FROM ubuntu:20.04
COPY ubuntu_gui_setup.sh /
RUN bash /ubuntu_gui_setup.sh
ENTRYPOINT ["sh", "-c", "/usr/sbin/sshd && tail -f /dev/null"]


