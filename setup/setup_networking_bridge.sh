#Copyright (2023) Dr. David A. Magezi
#Function to set up a network bridge for a virtual machine running on a linux with netctl
#There are alot of assumptions in this set up - please modify for own use as appropriate

function setup_networking_bridge {
    bridge_profile=br0.profile
    virtual_bridge_path=/etc/netctl/$bridge_profile

    read -p "This will set up a bridge connection. It appears that netctl is the network manager, no bridge is in place, the ethernet connection eth0 is available, and dhcp is in use"

    if [ ! -f $virtual_bridge_path ]; then
        qemu_conf_folder=/etc/qemu
        user_conf_file=$qemu_conf_folder/${USER}.conf
        echo "allow all" | sudo tee $user_conf_file
        echo "include /etc/qemu/${USER}" | sudo tee --append $qemu_conf_folder/bridge.conf
        sudo chown root:${USER} $user_conf_file
        sudo chmod 640 $user_conf_file
        setfacl -m "u:${USER}:rwx" $user_conf_file
        sudo chmod 755 $qemu_conf_folder

        echo "Description=\"Bridge connection for use by virtual machine\"" | sudo tee $virtual_bridge_path
        echo "Interface=br0" | sudo tee --apend $virtual_bridge_path
        echo "Connection=bridge" | sudo tee --apend $virtual_bridge_path
        echo "BindsToInterfaces=(eth0)" | sudo tee --apend $virtual_bridge_path
        echo "IP=dhcp" | sudo tee --apend $virtual_bridge_path
    fi
    bridge_status=$(netctl is-active $bridge_profile)
    if [[ $bridge_status == "inactive" ]]; then
        sudo netctl start $bridge_profile
    fi
}

#On Virtual machine:
#use ls /sys/class/net to find interfaces
#add (eg. usb0) to /etc/network/interfaces
#sudo ifconfig usb0 up #Note that ifup or #ifdown alone is insufficient
