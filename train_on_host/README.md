# Train on host 
Once [dlib](http://dlib.net) has been installed and the [MNIST dataset](http://yann.lecun.com/exdb/mnist/) has been downloaded (see [setup](setup)), a model can be trained on the host.
## Classification task 
The MNIST dataset comprises images of handwritten digits. A model based on the [examplconvolutional neural network in dlib](http://dlib.net/dnn_introduction_ex.cpp.html) shall be trained.
## Usage
First build with the name of the directory where dlib is installed 
```BASH 
make DLIB_DIR=path/to/dlib 
```
Then run with the name of the directory where MNIST data was downloaded and decompressed.
```BASH 
make run MNIST_DIR=path/to/mnist
```
