#!/bin/bash
#Copyright (2023) David A. Magezi
echo "This script assumes that dlib has been successfully installed".
echo "MNIST data set will be installed and then a dlib model will be trained"

mnist_url=http://yann.lecun.com/exdb/mnist/
suffix=ubyte.gz
mnist_compressed_files="train-images-idx3-$suffix train-labels-idx1-$suffix t10k-images-idx3-$suffix t10k-labels-idx1-$suffix"
file_list='file_list.txt'
target_dir=/home/${USER}/local/mnist
if [ ! -d $target_dir ]; then
    mkdir -p $target_dir
    printf %"s\n" $mnist_compressed_files &> $target_dir/$file_list
    cd $target_dir
    wget --base=$mnist_url --input-file=$target_dir/$file_list
    #gunzip $mnist_compressed_files 
fi

