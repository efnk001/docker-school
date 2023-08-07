#!/bin/bash

yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# install latest docker
yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# start docker 
systemctl start docker
systemctl enable docker

# create ubuntu image
docker pull ubuntu:18.04
docker run --privileged -it --name ubuntukvm --device=/dev/kvm --device=/dev/net/tun -v /sys/fs/cgroup:/sys/fs/cgroup:rw --cap-add=NET_ADMIN --cap-add=SYS_ADMIN ubuntu:18.04 /bin/bash