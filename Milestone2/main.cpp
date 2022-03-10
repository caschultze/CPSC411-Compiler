#include <iostream>
#include <fstream>

#include "driver.hpp"

using namespace std;

int main(int argc, char *argv[]) {

    if (argc != 2) {
        cerr << "Error: expected one argument -  usage: ./main <file>" << endl;
        return EXIT_FAILURE;
    }

    ifstream source;
    source.open(argv[1]);

    if (!source.is_open())  {
        cerr << "Error: cannot not open file: " << argv[1] << endl;
        return EXIT_FAILURE;
    }

    Driver *driver;
    
    driver = new Driver();
    bool res = driver->start(source);

    if (source.is_open()) source.close();

    return res;

}