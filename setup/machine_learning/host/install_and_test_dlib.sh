#!/bin/bash
echo "Installing and tesing dlib, a C++ Library for machine learning"
dlib_version=19.24
dlib_stem=dlib-$dlib_version
compressed_ext=tar.bz2
dlib_dir=/home/${USER}/local/dlib
source_subfolder="source"
if [ ! -d $dlib_dir ]; then
    mkdir -p $dlib_dir
    wget http://dlib.net/files/$dlib_stem.tar.bz2 --output-document=$dlib_dir/$dlib_stem.tar.bz2 
    mkdir $dlib_dir/$source_subfolder
    tar -xvf $dlib_dir/$dlib_stem.tar.bz2 --directory=$dlib_dir/$source_subfolder 
fi
dlib_include="$dlib_dir/$source_subfolder/$dlib_stem"
#make DLIB_DIR="$dlib_include"

example_program=my_example_dlib_program
g++ -O3 -lpthread -lX11 -std=c++11 -I$dlib_include $dlib_include/dlib/all/source.cpp hello_world.cpp -o $example_program
./$example_program



