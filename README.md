# images
docker images for the VMs


## Run gpu

- first, run the container in background

```bash
docker run -d --gpus all \
  --net=host \
  --restart=always \
  ghcr.io/woodoxen/ubuntu18_cuda:0.0.1
```

- container will start sshd 
```bash
## Dockerfile
ENTRYPOINT ["sh", "-c", "/usr/sbin/sshd && tail -f /dev/null"]
```

- By default it use 10022 as ssh port, change if needed 
```bash
## scripts/ubuntu_gui_setup.sh
sed -i "s/#Port 22/Port 10022/" /etc/ssh/sshd_config
```

- use `docker exec` to reset password for user `ubuntu`
```bash
docker exec -it $CONTAINER_ID bash
passwd ubuntu
ssh ubuntu@127.0.0.1 -p 10022
```

