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
    void load_data();
    void train();
    using net_type = dlib::loss_multiclass_log<
        dlib::fc<10, 
        dlib::relu<dlib::fc<120, 
        dlib::max_pool<2,2,2,2,dlib::relu<dlib::con<16,5,5,1,1,
        dlib::max_pool<2,2,2,2,dlib::relu<dlib::con<6,5,5,1,1,
        dlib::input<dlib::matrix<unsigned char>>
            >>>>>>>>>>;
private:
    std::string mnist_folder_;
    std::vector<dlib::matrix<unsigned char>> training_images_;
    std::vector<unsigned long> training_labels_;
    std::vector<dlib::matrix<unsigned char>> testing_images_;
    std::vector<unsigned long> testing_labels_;
};

#endif //DEF_MY_MNIST
