// Copyright (2023) David A. Magezi
#include <dlib/logger.h>
#include <dlib/misc_api.h>

dlib::logger dlog("example");

int main() {
    dlog.set_level(dlib::LALL);
    dlog << dlib::LINFO << "Hello World: This is an informational message";
    dlog << dlib::LINFO << "The program will pause for half a second";
    dlib::sleep(500);
    dlog << dlib::LINFO << "The program has restarted";
    return 0;
}
