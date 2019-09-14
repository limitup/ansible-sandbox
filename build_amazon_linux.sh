#!/usr/bin/bash
wget -O amzn2-virtualbox-2.0.20190115-x86_64.xfs.gpt.vdi https://cdn.amazonlinux.com/os-images/2.0.20190115/virtualbox/amzn2-virtualbox-2.0.20190115-x86_64.xfs.gpt.vdi

hdiutil makehybrid -o seed.iso -hfs -joliet -iso -default-volume-name cidata seedconfig/

VBoxManage createvm --name amazonlinux --ostype Linux26_64 --register
VBoxManage modifyvm amazonlinux --memory 1028

VBoxManage storagectl amazonlinux --name "SATA Controller" --add sata --controller IntelAhci
VBoxManage storageattach amazonlinux --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium amzn2-virtualbox-2.0.20190115-x86_64.xfs.gpt.vdi

VBoxManage storagectl amazonlinux --name "IDE Controller" --add ide --controller PIIX4
VBoxManage storageattach amazonlinux --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium seed.iso

VBoxManage startvm amazonlinux

# Fix power of timing before removing seed.iso
#VBoxManage controlvm amazonlinux poweroff
#VBoxManage showvminfo amazonlinux

#VBoxManage storageattach amazonlinux --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium none

#VBoxManage startvm amazonlinux

#vagrant package --base amazonlinux

#vagrant box add --name amazonlinux package.box

#See available vms
#VBoxManage list vms

#VBoxManage unregistervm amazonlinux
