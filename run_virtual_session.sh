#!/bin/bash

source ./raspberry_details.sh

raspberry_dir=~/local/raspberry_pi
cd $raspberry_dir
if [ ! -d $mount_path ]; then
    echo "mounting $resized_image"
    sudo mkdir $mount_path
    sector_size=512
    start_sector=8192
    offset=$(($sector_size*$start_sector))
    sudo mount -o loop,offset=$offset ./$resized_image $mount_path
fi

echo "$mount_path contains: $(ls $mount_path)"

qemu=qemu-system-aarch64
$qemu -machine raspi3b \
    -cpu cortex-a72 \
    -dtb $mount_path/bcm2710-rpi-3-b-plus.dtb \
    -m 1G -smp 4 -serial stdio \
    -kernel $mount_path/kernel8.img \
    -drive "file=$resized_image,if=sd,format=raw" \
    -append "rw earlyprintk loglevel=8 console=ttyAMA0,115200 dwc_otg.lpm_enable=0 root=/dev/mmcblk0p2 rootdelay=1" \

if [ -d $mount_path ]; then
    echo "unmounting OS image"
    sudo umount $mount_path
    sudo rmdir $mount_path
fi
