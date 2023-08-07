# INSTALL

Build container from Dockerfile

`chmod +x startup.sh`

`docker build =t ubuntuwin:latest -f Dockerfile .`

Instantiate a Container and Run :

`docker run --privileged -it --name kvmcontainer1 --device=/dev/kvm --device=/dev/net/tun -v /sys/fs/cgroup:/sys/fs/cgroup:rw --cap-add=NET_ADMIN --cap-add=SYS_ADMIN ubuntukvm bash`
