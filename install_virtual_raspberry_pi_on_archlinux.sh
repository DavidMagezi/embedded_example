#!/bin/bash
#Copyright (2023) Dr. David A. Magezi
#Script to install a virtual raspberry pi os on arch linux
#Consider also installing libvrt

qemu=qemu-system-aarch64
compression_extension=xz
neededPackages="$qemu qemu-img git $compression_extension tigervnc" #virt-viewer virt-install libvirt 
echo "Checking needed packages: "
pacman -Q $neededPackages || sudo pacman -S --needed $neededPackages

last_raspberry_update=2023-05-03
image_extension=img
os_flavor=raspios-bullseye-armhf
raspberry_stem=${last_raspberry_update}-$os_flavor
raspberry_img=$raspberry_stem.$image_extension
raspberry_archive=$raspberry_img.$compression_extension
raspberry_website=raspberrypi.org

raspberry_dir=~/local/raspberry_pi
if [ ! -d $raspberry_dir ]; then
    echo "Creating local folder to download OS image: $raspberry_dir"
    mkdir -p $raspberry_dir
fi
integrity_file=integrity_check.txt
read -p "Copy the check_sum for $raspberry_archive from $raspberry_website into the file $raspberry_dir/$integrity_file"
cd $raspberry_dir
touch $integrity_file
if [ ! -f $raspberry_img ]; then
    echo "Downloading raspberry pi image archive: $raspberry_archive"
    os_folder=raspios_armhf
    wget https://downloads.$raspberry_website/$os_folder/images/$os_folder-$last_raspberry_update/$raspberry_archive
    check_sum=$(sha256sum $raspberry_archive)
    echo "answer   :" $check_sum
    echo "should be:" $(cat $integrity_file) $raspberry_archive
    read -p "If the checksums match, press enter to continue - otherwise abort"
    echo "Extracting raspberry pi image: $raspberry_img"
    unxz $raspberry_archive
    fdisk -l $raspberry_img
fi

sector_size=512
start_sector=8192
offset=$(($sector_size*$start_sector))

echo $offset

resized_image=$raspberry_stem-resize.$image_extension
if [ ! -f $resized_image ]; then
    cp ./$raspberry_img ./$resized_image
    qemu-img resize $resized_image 8G
fi

mount_destination=raspios
mount_path=/mnt/$mount_destination
echo $mount_path 
if [ ! -d $mount_path ]; then
    sudo mkdir $mount_path
    sudo mount -o loop,offset=$offset ./$resized_image $mount_path
fi

user_created_file='user_created.txt'
if [ ! -f $user_created_file ]; then
    user_configure_file='userconf.txt'
    ./prepare_user.sh $user_configure_file $user_created_file
    sudo mv $user_configure_file $mount_path
fi

channel=0 # 5900
$qemu -machine raspi3b \
    -cpu cortex-a72 \
    -dtb $mount_path/bcm2710-rpi-3-b-plus.dtb \
    -m 1G -smp 4 -serial stdio \
    -kernel $mount_path/kernel8.img \
    -sd ./$resized_image \
    -append "rw earlyprintk loglevel=8 console=ttyAMA0,115200 dwc_otg.lpm_enable=0 root=/dev/mmcblk0p2 rootdelay=1" \
    -vnc=$channel

read -p "Press enter to end installation session"

if [ -d $mount_path ]; then
    echo "unmounting OS image"
    sudo umount $mount_path
    sudo rmdir $mount_path
fi

