//Copyright (2023) Dr. David A. Magezi

#ifndef DEF_MY_LOGGER
#define DEF_MY_LOGGER

#include <string>

#include <dlib/logger.h>

class MyLogger{
public:
    static void display_test_message();
    static void display_error_message(std::string error);

private:
    dlib::logger error_log_,example_log_;
};

#endif //DEF_MY_LOGGER
