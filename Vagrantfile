Vagrant.configure("2") do | config |
    config.vm.box = "peru/windows-10-enterprise-x64-eval"
    config.vm.network "private_network", ip: "192.168.121.10"
    config.vm.network "forwarded_port", guest: 445, host: 445
    config.vm.provision "shell", inline: "Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False"
end
    