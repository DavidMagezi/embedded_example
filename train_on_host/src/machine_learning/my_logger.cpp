//Copyright (2023) Dr. David A. Magezi

#include <dlib/misc_api.h>

#include "my_logger.h"


void MyLogger::display_error_message(std::string error){
    error_log_ << dlib::LINFO << error;
}

void MyLogger::display_results_message(std::string results){
    results_log_ << dlib::LINFO << results;
}

void MyLogger::display_test_message(){
    example_log_ << dlib::LINFO << "1 of 4: Testing Logger: This is an informational message";
    example_log_ << dlib::LINFO << "2 of 4: The program will pause for half a second";
    dlib::sleep(500);
    example_log_ << dlib::LINFO << "3 of 4: The program has restarted";
    example_log_ << dlib::LINFO << "4 of 4: The test is complete";
}

void MyLogger::set_levels(){
    error_log_.set_level(dlib::LALL);
    example_log_.set_level(dlib::LALL);
    results_log_.set_level(dlib::LALL);
}


dlib::logger MyLogger::example_log_("example");
dlib::logger MyLogger::error_log_("ERROR");
dlib::logger MyLogger::results_log_("results");
