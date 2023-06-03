//Copyright(2023) Dr. David A. Magezi 
//This code is inspired by dnn_introduction_ex.cpp of dlib

#include <sstream>

#include "my_logger.h"
#include "my_mnist.h"

MyMNIST::MyMNIST(std::string mnist_folder):
    mnist_folder_(mnist_folder){
}

MyMNIST::~MyMNIST(){
}

void MyMNIST::load_data(){
    dlib::load_mnist_dataset(mnist_folder_,training_images_,training_labels_,testing_images_,testing_labels_);
}

void MyMNIST::load_model(std::string model_filename){
    dlib::deserialize(model_filename) >> net_;
}

void MyMNIST::test(){
    predicted_labels_ = net_(testing_images_);
    int num_right = 0;
    int num_wrong = 0;
    for (size_t i = 0; i < testing_images_.size(); ++i)
    {
        if (predicted_labels_[i] == testing_labels_[i])
            ++num_right;
        else
            ++num_wrong;
        
    }
    std::stringstream ss;
    ss << "testing num_right: " << num_right << std::endl;
    ss << "testing num_wrong: " << num_wrong << std::endl;
    ss << "testing accuracy:  " << num_right / static_cast<double>(num_right + num_wrong) << std::endl;
    MyLogger::display_results_message(ss.str());
}

void MyMNIST::train(std::string model_filename){
    try{
    dlib::dnn_trainer<net_type> trainer(net_);
    trainer.set_learning_rate(0.01);
    trainer.set_min_learning_rate(0.00001);
    trainer.set_mini_batch_size(128);
    trainer.be_verbose();
    trainer.set_synchronization_file("mnist_sync", std::chrono::seconds(20));
    trainer.train(training_images_, training_labels_);
    net_.clean();
    dlib::serialize(model_filename) << net_;
    }
    catch(std::exception& e)
    {
        MyLogger::display_error_message(e.what());
    }
}

void MyMNIST::pseudovalidate(){
    pseudovalidate_labels_ = net_(training_images_);
    int num_right = 0;
    int num_wrong = 0;
    for (size_t i = 0; i < training_images_.size(); ++i)
    {
        if (pseudovalidate_labels_[i] == training_labels_[i])
            ++num_right;
        else
            ++num_wrong;
        
    }
    std::stringstream ss;
    ss << "training num_right: " << num_right << std::endl;
    ss << "training num_wrong: " << num_wrong << std::endl;
    ss << "training accuracy:  " << num_right / static_cast<double>(num_right + num_wrong) << std::endl;
    MyLogger::display_results_message(ss.str());
}
