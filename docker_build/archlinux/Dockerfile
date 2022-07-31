FROM archlinux:latest
ARG USER_NAME=arch
ARG USER_ID=1000
RUN \
    pacman -Syu --noconfirm \
    && pacman -S --noconfirm \
        sudo \
        sed \
        vim \
        openssh \
        base-devel \
        git \
    && yes | pacman -Scc
RUN \
    useradd -l -u ${USER_ID} -G wheel -md /home/${USER_NAME} -s /bin/bash -p ${USER_NAME} ${USER_NAME} \
    && echo "%wheel ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers \
    && /usr/bin/sed -i 's|#Color|Color|g' /etc/pacman.conf \
    && /usr/bin/sed -i 's|NoProgressBar|#NoProgressBar|g' /etc/pacman.conf \
    && echo "Server = https://mirror.sjtu.edu.cn/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist \
    && mkdir /var/run/sshd \
    && ssh-keygen -A \
    && sed -i "s/^.*PasswordAuthentication.*$/PasswordAuthentication yes/" /etc/ssh/sshd_config \
    && sed -i "s/^.*X11Forwarding.*$/X11Forwarding yes/" /etc/ssh/sshd_config \
    && sed -i "s/^.*X11UseLocalhost.*$/X11UseLocalhost no/" /etc/ssh/sshd_config \
    && grep "^X11UseLocalhost" /etc/ssh/sshd_config || echo "X11UseLocalhost no" >> /etc/ssh/sshd_config
USER ${USER_NAME}
WORKDIR /home/${USER_NAME}
RUN \
    cd /home/${USER_NAME} \
    && git clone https://aur.archlinux.org/yay-bin.git \
    && cd yay-bin \
    && yes | makepkg -si \
    && yes | sudo pacman -Scc \
    && rm -rf /var/cache/pacman/pkg/*

USER root
ENTRYPOINT ["sh", "-c", "/usr/sbin/sshd && tail -f /dev/null"]
