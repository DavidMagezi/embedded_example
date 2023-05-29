#!/bin/bash
#use set_up.sh on virtual machine

raspberry_dir=/home/${USER}/local/raspberry_pi

cd $raspberry_dir/manual_download

wget --input-file packageuri.htm 

