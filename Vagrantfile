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
  end

  node_config.vm.define 'centos7' do |centos7|
    centos7.vm.box = 'centos/7'
    centos7.vm.network 'private_network', ip: '10.0.0.11'
    centos7.vm.hostname = 'centos7'
    centos7.vm.provider 'virtualbox' do |vbox|
      vbox.name = Dir.pwd.split('/').last + '_' + centos7.vm.hostname
    end
  end

  node_config.vm.define 'fedora29' do |fedora29|
    fedora29.vm.box = "fedora/29-cloud-base"
    fedora29.vm.network 'private_network', ip: '10.0.0.12'
    fedora29.vm.hostname = 'fedora29'
    fedora29.vm.provider 'virtualbox' do |vbox|
      vbox.name = Dir.pwd.split('/').last + '_' + fedora29.vm.hostname
    end
  end

  node_config.vm.define 'ubuntu' do |ubuntu|
    ubuntu.vm.box = 'ubuntu/trusty64'
    ubuntu.vm.network 'private_network', ip: '10.0.0.13'
    ubuntu.vm.hostname = 'ubuntu'
    ubuntu.vm.provider 'virtualbox' do |vbox|
      vbox.name = Dir.pwd.split('/').last + '_' + ubuntu.vm.hostname
    end
  end

  node_config.vm.define 'amazon' do |amazon|
    amazon.vm.box = 'amazonlinux'
    amazon.vm.network 'private_network', ip: '10.0.0.14'
    amazon.vm.hostname = 'amazon'
    amazon.vm.provider 'virtualbox' do |vbox|
      vbox.name = Dir.pwd.split('/').last + '_' + amazon.vm.hostname
    end
  end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |ansible_config|
   ansible_config.vm.define 'deploy' do |deploy|
     deploy.vm.box = 'centos/7'
     deploy.vm.network 'private_network', ip: '10.0.0.20'
     deploy.vm.hostname = 'deploy'
     deploy.vm.provision 'shell', path: 'provision.sh'
     deploy.vm.provision 'file', source: '.vagrant', destination: '/vagrant/.vagrant'
     deploy.vm.provision 'file', source: '~/.vagrant.d/insecure_private_key', destination: '~/.ssh/key'
     deploy.vm.synced_folder '.', '/vagrant', type: 'rsync'
     deploy.ssh.insert_key = false

     deploy.vm.provision 'ansible_local' do |ansible|
       ansible.playbook       = "/vagrant/example.yml"
       ansible.verbose        = 'vv'
       ansible.install        = true
       ansible.limit          = "all" # or only "nodes" group, etc.
       ansible.inventory_path = "/vagrant/inventory"
       ansible.config_file = '/vagrant/ansible.cfg'
       ansible.install_mode = 'pip'
       ansible.version = '2.7.5'
       ansible.become = true
       ansible.vault_password_file = ''
       ansible.raw_arguments = [
         '--private-key=~/.ssh/key',
     ]
     end
   end

end

