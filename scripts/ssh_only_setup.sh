export DEBIAN_FRONTEND=noninteractive

# configure user
export USER_NAME=ubuntu
export USER_ID=1000
apt-get update
apt-get install -y sudo
useradd -l -u ${USER_ID} -G sudo -md /home/${USER_NAME} -s /bin/bash -p ${USER_NAME} ${USER_NAME}

# configure ssh
apt-get install -y openssh-server xauth

mkdir /var/run/sshd
ssh-keygen -t rsa
mv /sshd_config /etc/ssh/sshd_config

# configure network related stuffs
mv /resolv.conf /etc/resolv.conf
sudo sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
apt-get update

# clean
apt-get clean