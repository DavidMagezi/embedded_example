#!/bin/bash
#Copyright (2023) Dr. David A. Magezi
#Usage: run_virtual_machine qemu mount_path resized_image
function run_virtual_machine {
    qemu=$1
    mount_path=$2
    resized_image=$3
    helper_path=/usr/lib/qemu/qemu-bridge-helper
    sudo $qemu -machine raspi3b \
        -cpu cortex-a53 \
        -dtb $mount_path/bcm2710-rpi-3-b-plus.dtb \
        -m 1G -smp 4 -serial stdio \
        -kernel $mount_path/kernel8.img \
        -drive "file=$resized_image,if=sd,format=raw" \
        -append "rw earlyprintk loglevel=8 console=ttyAMA0,115200 dwc_otg.lpm_enable=0 root=/dev/mmcblk0p2 rootdelay=1" \
        -netdev tap,helper=$helper_path,id=hn0 \ # or as an alternative: -netdev bridge,br=br0,id=hn0,helper=$helper_path \
        -device usb-net,netdev=hn0 \
    }
