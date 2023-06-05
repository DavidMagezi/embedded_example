//Copyright(2023) Dr. David A. Magezi 

#ifndef DEF_MY_MNIST
#define DEF_MY_MNIST

#include <string>
#include <vector>

#include <dlib/data_io.h>
#include <dlib/dnn.h>

class MyMNIST{
public:
    MyMNIST(std::string mnist_folder);
    ~MyMNIST();

    using net_type = dlib::loss_multiclass_log<
        dlib::fc<10, 
        dlib::relu<dlib::fc<120, 
        dlib::max_pool<2,2,2,2,dlib::relu<dlib::con<16,5,5,1,1,
        dlib::max_pool<2,2,2,2,dlib::relu<dlib::con<6,5,5,1,1,
        dlib::input<dlib::matrix<unsigned char>>
            >>>>>>>>>>;

    void load_data();
    void load_model(std::string model_filename);
    void test();

private:
    std::string mnist_folder_;
    net_type net_;
    std::vector<dlib::matrix<unsigned char>> training_images_, testing_images_;

    std::vector<unsigned long> training_labels_,testing_labels_;
    std::vector<unsigned long> pseudovalidate_labels_,predicted_labels_;
};

#endif //DEF_MY_MNIST
