FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y curl jq

# Download and install Vagrant
RUN curl -LO https://releases.hashicorp.com/vagrant/$(curl -s https://checkpoint-api.hashicorp.com/v1/check/vagrant | jq -r -M '.current_version')/vagrant_$(curl -s https://checkpoint-api.hashicorp.com/v1/check/vagrant | jq -r -M '.current_version')_x86_64.deb
RUN dpkg -i vagrant_$(curl -s https://checkpoint-api.hashicorp.com/v1/check/vagrant | jq -r -M '.current_version')_x86_64.deb

# Install Vagrant plugins
RUN vagrant plugin install vagrant-libvirt

# Add Vagrant box
RUN vagrant box add --provider libvirt peru/windows-10-enterprise-x64-eval

# Initialize Vagrant project
RUN vagrant init peru/windows-10-enterprise-x64-eval

# Copy startup script
COPY startup.sh /
RUN chmod +x /startup.sh

# Set the default command
ENTRYPOINT ["/startup.sh"]

# Set the default command arguments
CMD ["/bin/bash"]
