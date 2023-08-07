FROM ubuntu:20.04

RUN apt-get update -y && \
    apt-get install -y \
    qemu-kvm \
    libvirt-daemon-system \
    libvirt-dev \
    curl \
    net-tools \
    jq && \
    apt-get autoremove -y && \
    apt-get clean


RUN curl -O https://releases.hashicorp.con/vagrant/$(curl -s https://checkpoint-api.hashicorp.com/v1/check/vagrant | jq -r -M '.current_version')/vagrant_$(curl -s https://checkpoint-api.hashicorp.com/v1/check/vagrant | jq -r -M '.current_version')_x86_64.deb && \
    dpkg -i vagrant_$(curl -s https://checkpoint-api.hashicorp.com/v1/check/vagrant | jq -r -M '.current_version')_X86_64.deb && \
    vagrant plugin install vagrant-libvirt && \
    vagrant box add --provider libvirt peru/windows-10-enterprise-x64-eval && \
    vagrant init peru/windows-10-enterprise-x64-eval


COPY startup.sh /

ENTRYPOINT ["/startup.sh"]

CMD ["/bin/bash"]