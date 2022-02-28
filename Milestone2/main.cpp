#include <iostream>
#include <fstream>

#include "driver.hpp"

using namespace std;

int main(int argc, char *argv[]) {

    if (argc != 2) {
        cerr << "Error: expected one argument -  usage: ./main <file>" << endl;
        exit(EXIT_FAILURE);
    }

    ifstream source;
    source.open(argv[1]);

    if (!source.is_open())  {
        cerr << "Error: cannot not open file: " << argv[1] << endl;
        exit(EXIT_FAILURE);
    }

    Driver *driver;
    
    // TODO: make Driver constructor open the file
    //driver = new Driver(source);
    driver = new Driver(argv[1]);

    bool result = driver->start(source);

    if (source.is_open()) source.close();


    if (result != 0)
        return EXIT_FAILURE;
    return EXIT_SUCCESS;
}