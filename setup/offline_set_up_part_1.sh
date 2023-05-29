#!/bin/bash
#extract URIs of desired packages
packages=vim
apt-get --print-uris --yes install $packages | grep ^\' | cut -d\' -f2 > packageuri.htm
apt-get --print-uris update | grep ^\' | cut -d\' -fs > myupdateurilist.htm
sudo apt-get --fix-broken > mybrokenpackagesurilist.htm
sudo apt-get dist-upgrade > mydisturilist.htm
