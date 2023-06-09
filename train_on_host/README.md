# Train on host 
Once [dlib](http://dlib.net) has been installed and the [MNIST dataset](http://yann.lecun.com/exdb/mnist/) has been downloaded (see [setup machine-learning on host](/setup/machine_learning/host)), we can build a model to classify handwritted digits (for more information, see the [wikipedia entry](https://en.wikipedia.org/wiki/MNIST_database)).  The code here is based on the [example convolutional neural network](http://dlib.net/dnn_introduction_ex.cpp.html). 

## Usage
First build with the name of the directory where dlib is installed 
```BASH 
make DLIB_DIR=path/to/dlib 
```
Then run with the name of the directory where MNIST data was downloaded and decompressed.
```BASH 
make run MNIST_DIR=path/to/mnist
```
