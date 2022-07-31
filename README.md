# images
docker images for the VMs


## Run gpu

- container will start sshd
- use `docker exec` to reset password for user `ubuntu`
- By default it use 10022 as ssh port, change if needed

```bash
docker run -d --gpus all --net=host ghcr.io/woodoxen/ubuntu18_cuda:0.0.1
```
