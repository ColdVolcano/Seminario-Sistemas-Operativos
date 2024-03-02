#!/usr/bin/bash

# Assume config is gotten here

VBoxManage createvm --name "$NAME" --ostype "$OSTYPE" --register
VBoxManage modifyvm "$NAME" --ioapic on
VBoxManage modifyvm "$NAME" --memory $MEMSIZE --vram $VRAMSIZE
VBoxManage createhd --filename "$PWD/$NAME/$NAME.vhd" --size $VDDSIZE --format VHD
VBoxManage storagectl "$NAME" --name "$SATACONNAME" --add sata --controller IntelAhci
VBoxManage storageattach "$NAME" --storagectl "$SATACONNAME" --port 0 --device 0 --type hdd --medium "$PWD/$NAME/$NAME.vhd"
VBoxManage storagectl "$NAME" --name "$IDECONNAME" -add ide --controller PIIX4
VBoxManage storageattach "$NAME" --storagectl "$IDECONNAME" --port 1 --device 0 --type dvddrive

VBoxManage showvminfo "$NAME"
