# embedded_example
An example of how to set up a virtual embedded system

# Architecture
This example uses [qemu](https://qemu.org) to run a virtual raspberry pi (guest) on an  standard [PC architecture(x86\_64)](https://en.wikipedia.org/wiki/X86_64) (host) running [archlinux](https://archlinux.org).  The virtual machine is a [raspberry pi 3b](https://www.raspberrypi.com/products/raspberry-pi-3-model-b/) running a debian-based linux distribution (Raspbian Pi OS Lite). 

# Set up
Run the [installation script] (setup/install_virtual_raspberry_pi_on_archlinux.sh). On first use enlarge the root partition of the virtual machine. Use fdisk, partx and resize2fs. On the virtual machine use 
```BASH 
ls /sys/class/net
```
to find interfaces and add these to /etc/network/interfaces

