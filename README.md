# embedded_example
An example of how to set up and test a virtual embedded system

# Architecture
This example uses [qemu](https://qemu.org) to run a virtual raspberry pi (guest) on an  standard [PC architecture(x86\_64)](https://en.wikipedia.org/wiki/X86_64) (host) running [archlinux](https://archlinux.org).  The virtual machine is a [raspberry pi 3b](https://www.raspberrypi.com/products/raspberry-pi-3-model-b/) running a debian-based linux distribution ([Raspbian Pi OS Lite](https://www.raspberrypi.com/software/)). 

# Set up (with virtual machine online)
Run the [installation script] (setup/install_virtual_raspberry_pi_on_archlinux.sh). On first use enlarge the root partition of the virtual machine. Use fdisk, partx and resize2fs. On the virtual machine use 
```BASH 
ls /sys/class/net
```
to find interfaces and add these to /etc/network/interfaces

# Set up (with virtual machine offline)
If you cannot or do not wish to connect your (virtual) machine to the internet, one can mannually download and install packages. In this example, we shall install vim, a text editor. First from the virtual machine obtain the URIs of the desired packages (see [offline\_set\_up\_part\_1.sh](setup/offline_set_up_part_1.sh)). Next on the host (or another machine with internet access) obtain the packages, for example with wget. Once obtained, copy these packages onto the virtual machine in the folder /var/cache/apt/archives/partial. If vifm is installed on the host, this can be down using [transfer\_files.sh](setup/transfer_files.sh). Then finally, on the host, install these packages (see [offline\_set\_up\_part\_2.sh](setup/offline_set_up_part_2.sh)).

# Install and test a machine-learning library on host
Where possible, it is often recommended to train machine-learning models on a standard PC with sufficient RAM GPU, and then deploy the trained model on the embedded machine. The code in [/machine\_learning/host](/machine\_learning/host) will install and test [DLIB](http://dlib.net),  a C++ machine-learning library on the host. 
