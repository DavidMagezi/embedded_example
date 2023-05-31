# Set up 
## (with virtual machine online)
Run the [installation script] (install_virtual_raspberry_pi_on_archlinux.sh). On first use enlarge the root partition of the virtual machine. Use fdisk, partx and resize2fs. On the virtual machine use 
```BASH 
ls /sys/class/net
```
to find interfaces and add these to /etc/network/interfaces

##  (with virtual machine offline)
If you cannot or do not wish to connect your (virtual) machine to the internet, one can mannually download and install packages. In this example, we shall install vim, a text editor. First from the virtual machine obtain the URIs of the desired packages (see [offline\_set\_up\_part\_1.sh](offline_set_up_part_1.sh)). Next on the host (or another machine with internet access) obtain the packages, for example with wget. Once obtained, copy these packages onto the virtual machine in the folder /var/cache/apt/archives/partial. If vifm is installed on the host, this can be down using [transfer\_files.sh](transfer_files.sh). Then finally, on the host, install these packages (see [offline\_set\_up\_part\_2.sh](offline_set_up_part_2.sh)).

