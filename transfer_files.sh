#!/bin/bash
#Copyright (2023) Dr. David A. Magezi

source ./raspberry_details.sh

if [ ! -d $mount_path ]; then
    sudo mkdir $mount_path
    raspberry_dir=~/local/raspberry_pi
    cd $raspberry_dir
    sector_size=512
    start_sector=532480
    offset=$(($sector_size*$start_sector))
    sudo mount -o loop,offset=$offset ./$resized_image $mount_path
fi

vifm $mount_path

if [ -d $mount_path ]; then
    echo "unmounting OS image"
    sudo umount $mount_path
    sudo rmdir $mount_path
fi
