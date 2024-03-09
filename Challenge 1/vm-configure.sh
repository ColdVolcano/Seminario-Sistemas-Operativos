#!/usr/bin/bash

OPTSTRING="n:o:c:r:v:d:s:i:h"

while getopts ${OPTSTRING} option;
do
  case "${option}" in
    n) NAME=${OPTARG};;
    o) OSTYPE=${OPTARG};;
    c) CPUCOUNT=${OPTARG};;
    r) MEMSIZE=${OPTARG};;
    v) VRAMSIZE=${OPTARG};;
    d) DISKNAME=${OPTARG};;
    s) SATACONNAME=${OPTARG};;
    i) IDECONNAME=${OPTARG};;
      exit ;;
  esac
done

VBoxManage createvm --name $NAME --ostype $OSTYPE --register
VBoxManage modifyvm $NAME --ioapic on
VBoxManage modifyvm $NAME --cpus $CPUCOUNT
VBoxManage modifyvm $NAME --memory $MEMSIZE --vram $VRAMSIZE
VBoxManage createhd --filename $PWD/$NAME/$DISKNAME.vhd --size $VDDSIZE --format VHD
VBoxManage storagectl $NAME --name $SATACONNAME --add sata --controller IntelAhci
VBoxManage storageattach $NAME --storagectl $SATACONNAME --port 0 --device 0 --type hdd --medium $PWD/$NAME/$DISKNAME.vhd
VBoxManage storagectl $NAME --name "\'$IDECONNAME\'" -add ide --controller PIIX4
VBoxManage storageattach $NAME --storagectl $IDECONNAME --port 1 --device 0 --type dvddrive

VBoxManage showvminfo $NAME
