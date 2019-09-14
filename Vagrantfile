# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |node_config|

  node_config.ssh.insert_key = false
  node_config.vm.provision "shell",
    inline: "hostname --fqdn > /etc/hostname && hostname -F /etc/hostname"
  node_config.vm.synced_folder ".", "/vagrant", disabled: true

  node_config.vm.define 'centos6' do |centos6|
    centos6.vm.box = "centos/6"
    centos6.vm.network 'private_network', ip: '10.0.0.10'
    centos6.vm.hostname = 'centos6'
    centos6.vm.provider 'virtualbox' do |vbox|
      vbox.name = Dir.pwd.split('/').last + '_' + centos6.vm.hostname
    end
    centos6.vm.provision 'ansible' do |ansible|
      ansible.playbook   = "example.yml"
      ansible.become = true
    end
  end

  node_config.vm.define 'centos7' do |centos7|
    centos7.vm.box = 'centos/7'
    centos7.vm.network 'private_network', ip: '10.0.0.11'
    centos7.vm.hostname = 'centos7'
    centos7.vm.provider 'virtualbox' do |vbox|
      vbox.name = Dir.pwd.split('/').last + '_' + centos7.vm.hostname
    end
    centos7.vm.provision 'ansible' do |ansible|
      ansible.playbook   = "example.yml"
      ansible.become = true
    end
  end

  node_config.vm.define 'fedora29' do |fedora29|
    fedora29.vm.box = "fedora/29-cloud-base"
    fedora29.vm.network 'private_network', ip: '10.0.0.12'
    fedora29.vm.hostname = 'fedora29'
    fedora29.vm.provider 'virtualbox' do |vbox|
      vbox.name = Dir.pwd.split('/').last + '_' + fedora29.vm.hostname
    end
    fedora29.vm.provision 'ansible' do |ansible|
      ansible.playbook   = "example.yml"
      ansible.become = true
    end
  end

  node_config.vm.define 'ubuntu' do |ubuntu|
    ubuntu.vm.box = 'ubuntu/trusty64'
    ubuntu.vm.network 'private_network', ip: '10.0.0.13'
    ubuntu.vm.hostname = 'ubuntu'
    ubuntu.vm.provider 'virtualbox' do |vbox|
      vbox.name = Dir.pwd.split('/').last + '_' + ubuntu.vm.hostname
    end
    ubuntu.vm.provision 'ansible' do |ansible|
      ansible.playbook   = "example.yml"
      ansible.become = true
    end
  end

  node_config.vm.define 'amazon' do |amazon|
    amazon.vm.box = 'amazonlinux'
    amazon.vm.network 'private_network', ip: '10.0.0.14'
    amazon.vm.hostname = 'amazon'
    amazon.vm.provider 'virtualbox' do |vbox|
      vbox.name = Dir.pwd.split('/').last + '_' + amazon.vm.hostname
    end
    amazon.vm.provision 'ansible' do |ansible|
      ansible.playbook   = "example.yml"
      ansible.become = true
    end
  end

end
