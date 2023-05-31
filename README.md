# embedded_example
An example of how to set up a virtual embedded system on a PC host. This can be used to deploy and test machine learning models.

# Architecture
This example uses [qemu](https://qemu.org) to run a virtual raspberry pi (guest) on an  standard [PC architecture(x86\_64)](https://en.wikipedia.org/wiki/X86_64) (host) running [archlinux](https://archlinux.org).  The virtual machine is a [raspberry pi 3b](https://www.raspberrypi.com/products/raspberry-pi-3-model-b/) running a debian-based linux distribution ([Raspbian Pi OS Lite](https://www.raspberrypi.com/software/)). 

# Set up
First install and set up the virtual machine, for example using one of the methods in [setup](setup).

## Install and test a machine-learning library on host
Where possible, it is often recommended to train machine-learning models on a standard PC (with sufficient RAM and a GPU), and then deploy the trained model on the embedded machine. The code in [setup/machine\_learning/host](setup/machine\_learning/host) will install and test [DLIB](http://dlib.net),  a C++ machine-learning library on the host. 

# Next step: Train model on host
Currently work in progress (see [train\_on\_host](train_on_host)).

