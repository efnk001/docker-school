# INSTALL

Build container from Dockerfile

```bash
chmod +x startup.sh
```

```bash
docker build -t ubuntuwin:latest -f Dockerfile .
```

Instantiate a Container and Run :

```bash
docker run --privileged -it --p 3389:3389 --name kvmcontainer1 --device=/dev/kvm --device=/dev/net/tun -v /sys/fs/cgroup:/sys/fs/cgroup:rw --cap-add=NET_ADMIN --cap-add=SYS_ADMIN ubuntukvm bash
```
