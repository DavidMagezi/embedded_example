#!/bin/bash
echo "Cross compiling for Raspberry pi from archlinux"
cross_compiler=aarch64-linux-gnu-gcc
neededPackages="$cross_compiler" 
echo "Checking needed packages: "
pacman -Q $neededPackages || sudo pacman -S --needed $neededPackages
$cross_compiler --version

hello_world_dir='hello_world'
cd $hello_world_dir
make 
