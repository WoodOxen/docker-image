export USER_NAME=ubuntu
export USER_ID=1000

apt update
apt install -y openssh-server xauth sudo
apt clean
mkdir /var/run/sshd
ssh-keygen -A
sed -i "s/#Port 22/Port 10022/" /etc/ssh/sshd_config
sed -i "s/^.*PasswordAuthentication.*$/PasswordAuthentication yes/" /etc/ssh/sshd_config
sed -i "s/^.*X11Forwarding.*$/X11Forwarding yes/" /etc/ssh/sshd_config
sed -i "s/^.*X11UseLocalhost.*$/X11UseLocalhost no/" /etc/ssh/sshd_config
grep "^X11UseLocalhost" /etc/ssh/sshd_config || echo "X11UseLocalhost no" >> /etc/ssh/sshd_config

useradd -l -u ${USER_ID} -G sudo -md /home/${USER_NAME} -s /bin/bash -p ${USER_NAME} ${USER_NAME}
echo "%sudo ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers