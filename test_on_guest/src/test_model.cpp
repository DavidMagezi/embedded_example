// Copyright (2023) David A. Magezi

#include <filesystem>
#include <string>

#include "machine_learning/my_logger.h"
#include "machine_learning/my_mnist.h"

int main(int argc, char** argv) {
    MyLogger::set_levels(); // comment out to suppress output
    MyLogger::display_test_message();
    if (argc != 3){
        MyLogger::display_error_message(argv[0]);
        if (argc > 3){
            MyLogger::display_error_message("Too many arguments");
        }
        MyLogger::display_error_message("This program needs the MNIST dataset");
        MyLogger::display_error_message("Please obtain from http://yann.lecun.com/exdb/mnist/");
        MyLogger::display_error_message("Download, decompress the four files, and place them in a folder");
        MyLogger::display_error_message("Then give that folder as input to this program");
        MyLogger::display_error_message("Second argument should be the (relative) path to the model paramaters");
        return 1;
    }

    MyMNIST my_mnist(argv[1]);
    my_mnist.load_data();
    std::string model_filename(argv[2]); 

    my_mnist.load_model(model_filename);

    my_mnist.pseudovalidate();
    my_mnist.test();

    return 0;
}
