//Copyright(2023) Dr. David A. Magezi 
//This code is inspired by dnn_introduction_ex.cpp of dlib
#include "my_mnist.h"

MyMNIST::MyMNIST(std::string mnist_folder):
    mnist_folder_(mnist_folder){
}

MyMNIST::~MyMNIST(){
}

void MyMNIST::load_data(){
    dlib::load_mnist_dataset(mnist_folder_,training_images_,training_labels_,testing_images_,testing_labels_);
}

void MyMNIST::train(){
    net_type net;
    dlib::dnn_trainer<net_type> trainer(net);
    trainer.set_learning_rate(0.01);
    trainer.set_min_learning_rate(0.00001);
    trainer.set_mini_batch_size(128);
    trainer.be_verbose();
    trainer.set_synchronization_file("mnist_sync", std::chrono::seconds(20));
    //trainer.train(training_images, training_labels);
}
