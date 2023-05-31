//Copyright (2023) Dr. David A. Magezi

#include <iostream>

#include <dlib/logger.h>
#include <dlib/misc_api.h>

#include "my_logger.h"

dlib::logger dlog("example");

void MyLogger::display_test_message(){
    std::cout << "This is a test message from MyLogger" << std::endl;
    dlog.set_level(dlib::LALL);
    dlog << dlib::LINFO << "Hello World: This is an informational message";
    dlog << dlib::LINFO << "The program will pause for half a second";
    dlib::sleep(500);
    dlog << dlib::LINFO << "The program has restarted";
}

