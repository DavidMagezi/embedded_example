#!/bin/bash
#in this example a version of vim was downloaded from host/machine with internet
##(run this on virtual machine)
desired_package=vim-runtime_8.2.2434-3+deb11u1_all.deb
sudo dpkg -i /var/cache/apt/archives/partial/$desired_package
