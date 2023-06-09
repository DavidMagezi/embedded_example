//Copyright (2023) Dr. David A. Magezi

#ifndef DEF_MY_LOGGER
#define DEF_MY_LOGGER

#include <string>

#include <dlib/logger.h>

class MyLogger{
public:
    static void display_test_message();
    static void display_error_message(std::string error);
    static void display_results_message(std::string results);
    static void set_levels();

private:
    static dlib::logger error_log_;
    static dlib::logger example_log_;
    static dlib::logger results_log_;
};

#endif //DEF_MY_LOGGER
