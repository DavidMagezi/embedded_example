#!/bin/bash
#Copyright (2023) David A. Magezi
#Assumes that DLIB (library) and MNIST (datasets) have been downloaded into locations below (dlib_dir and mnist_dir, respectively).
echo "Transferring dlib library and MNIST files to guest"
dlib_version=19.24
dlib_stem=dlib-$dlib_version
compressed_ext=tar.bz2
dlib_dir=/home/${USER}/local/dlib
source_subfolder="source"
dlib_include="$dlib_dir/$source_subfolder/$dlib_stem"

mnist_dir=/home/${USER}/local/mnist

source ../../raspberry_details.sh

if [ ! -d $mount_path ]; then
    sudo mkdir $mount_path
    raspberry_dir=~/local/raspberry_pi
    cd $raspberry_dir
    sector_size=512
    start_sector=532480
    offset=$(($sector_size*$start_sector))
    sudo mount -o loop,offset=$offset ./$resized_image $mount_path
fi

sudo vifm $mount_path /home/${USER}/local/

if [ -d $mount_path ]; then
    echo "unmounting OS image"
    sudo umount $mount_path
    sudo rmdir $mount_path
fi
