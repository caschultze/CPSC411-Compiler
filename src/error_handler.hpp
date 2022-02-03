#ifndef ERROR_HANDLER_HPP
#define ERROR_HANDLER_HPP

#include <iostream>

using namespace std;

int warningno = 0;

int error(int code, string details = "")
{
    switch (code)
    {
        case 1:
            cerr << "\x1B[1;31mError: \x1B[0mToo many warnings, aborting process." << endl;
            exit(EXIT_FAILURE);
        case 2:
            cerr << "\x1B[1;31mError: \x1B[0mExpected one argument" << endl;
            exit(EXIT_FAILURE);
        case 3:
            cerr << "\x1B[1;31mError: \x1B[0mFile could not be opened" << endl;
            exit(EXIT_FAILURE);
        case 4:
            cerr << "\x1B[1;31mError: \x1B[0mnewline inside string at line" << details << endl;
            exit(EXIT_FAILURE);
        case 5:
            cerr << "\x1B[1;31mError: \x1B[0string missing closing quote at line" << details << endl;
            exit(EXIT_FAILURE);
        default:
            cerr << "\x1B[1;31mError: \x1B[0undefined error";
            exit(EXIT_FAILURE);
    }
}

void warning(int code, string details = "")
{
    switch (code)
    {
        case 1:
            cerr << "Warning: invalid character at line " << details << endl;
            break;
        default:
            cerr << "\x1B[31mWarning: \x1B[0mundefined warning " << endl;
    }
    if (++warningno > 10) error(1);
}

#endif