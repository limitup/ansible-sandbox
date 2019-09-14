# vagrant-ansible-sandbox

Sandbox environment to test the build out of ansible playbooks.

OS Availability:
 - Amazon Linux
 - Centos
 - Debian
 - Fedora
 - Ubuntu

Build all images:
```
vagrant up
```

Shut down images:
```
vagrant halt
```

Restart built images:
```
vagrant up --provision
```

All of the previous commands can be modified for one specific instance:
```
vagrant up --provision [vm defined name]
```

The amazon linux vm will need to be built since it is not a vagrant built image.
run 
```
./build_amazon_linux.sh
``` 
to pull amazon linux vdi and convert to vagrant box

To test the anisble repo you want run...  Add the directory to ansible.playbook.

When your playbook is ready to test:
```
vagrant up --provision deploy
```


Or you can run ansible-playbooks against the vms after they are up.
```
ansible-playbook example.yml -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory
```
To Do:
 - Fix vagrant box networking
 - AWS linux instance is configured to user internal AWS repos.  Need to add other yum repos.
