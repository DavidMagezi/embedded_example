# Test on guest 
Once the model has been trained on the host, relevant files can be transferred to the guest (see [setting up machine learning on hos](/setup/machine_learning/guest)). 

## Usage
If the virtual machine is offline, manually update the date and time
```BASH 
date --set 20YY-MM-DD 
date --set HH:MM:SS
```
As on the host, build with the name of the directory where dlib is installed 
```BASH 
make DLIB_DIR=path/to/dlib 
```
Then run with the name of the directory where MNIST data was downloaded and decompressed.
```BASH 
make run MNIST_DIR=path/to/mnist
```
