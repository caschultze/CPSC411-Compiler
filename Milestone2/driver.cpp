// This class is based on driver.cpp of example-cpp shared in the tutorials.
// Credits: Ali Jamadi / Shankar Ganesh

#include <fstream>
#include <memory>

#include "driver.hpp"
 
Driver::~Driver()
{
    // Reset the unique pointers.
    lexer.reset();
    parser.reset();
}

bool Driver::start(istream &in)
{
    // If the stream is bad or at EOF, return 1
    if (!in.good() && in.eof()) {
        return 1;
    }
    bool res = parse(in);
    if (!res) tree->print();

    return res;
}

int Driver::getToken(JMMC::JMMParser::semantic_type *yylval, JMMC::JMMParser::location_type *location)
{
    int tok = lexer->yylex(yylval, location);
    // int DEBUG = 0;
    // if (DEBUG) {
    //     cout << "Token: " << (JMMC::JMMParser::token::yytokentype)tok << endl;
    // }
    return tok;
}

bool Driver::parse(istream &in)
{
    lexer = createLexer(&in);

    parser = std::make_unique<JMMC::JMMParser>(*this);

    if (parser->parse() != 0)
    {
        cerr << "Parse failed!!" << endl;
        return 1;
    }

    return 0;
}