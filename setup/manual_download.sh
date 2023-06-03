#!/bin/bash
#first use offline_set_up_part_1.sh on virtual machine to obtain packageuri.htm

raspberry_dir=/home/${USER}/local/raspberry_pi

cd $raspberry_dir/manual_download

wget --input-file packageuri.htm 

#then use offline_set_up_part_2.sh on virtual machine to install packages

