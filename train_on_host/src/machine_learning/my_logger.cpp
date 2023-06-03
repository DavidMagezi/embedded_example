//Copyright (2023) Dr. David A. Magezi

#include <dlib/misc_api.h>

#include "my_logger.h"

dlib::logger example_log("example");
dlib::logger error_log("ERROR");

void MyLogger::display_test_message(){
    example_log.set_level(dlib::LALL);
    example_log << dlib::LINFO << "1 of 4: Testing Logger: This is an informational message";
    example_log << dlib::LINFO << "2 of 4: The program will pause for half a second";
    dlib::sleep(500);
    example_log << dlib::LINFO << "3 of 4: The program has restarted";
    example_log << dlib::LINFO << "4 of 4: The test is complete";
}

void MyLogger::display_error_message(std::string error){
    error_log.set_level(dlib::LALL);
    error_log << dlib::LINFO << error;
}

