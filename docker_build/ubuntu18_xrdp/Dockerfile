FROM nvidia/cuda:11.0.3-devel-ubuntu18.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt upgrade

RUN apt install -y openssh-server xauth
RUN mkdir -p /var/run/sshd
RUN ssh-keygen -A
COPY /sshd_config /etc/ssh/sshd_config

EXPOSE 22

RUN apt install -y ubuntu-desktop
RUN rm /run/reboot-required*

RUN apt install -y xrdp
RUN adduser xrdp ssl-cert

RUN sed -i '3 a echo "\
export GNOME_SHELL_SESSION_MODE=ubuntu\\n\
export XDG_SESSION_TYPE=x11\\n\
export XDG_CURRENT_DESKTOP=ubuntu:GNOME\\n\
export XDG_CONFIG_DIRS=/etc/xdg/xdg-ubuntu:/etc/xdg\\n\
" > ~/.xsessionrc' /etc/xrdp/startwm.sh

EXPOSE 3389

RUN apt clean

CMD service ssh start; service dbus start; /usr/lib/systemd/systemd-logind & service xrdp start; bash

ENTRYPOINT ["sh", "-c", "/usr/sbin/sshd && tail -f /dev/null"]
LABEL maintainer="LYY"
LABEL OS="ubuntu-18.04"
LABEL cuda="11.0.3"