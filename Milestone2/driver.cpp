#include <fstream>
#include <memory>

#include "driver.hpp"

Driver::~Driver()
{
    lexer.reset();
    parser.reset();
}

bool Driver::start(istream &in)
{
    bool result = parse(in);
    if (!result) tree->print();

    return result;
}

int Driver::getToken(JMMC::JMMParser::semantic_type *yylval, JMMC::JMMParser::location_type *location)
{
    int tok = lexer->yylex(yylval, location);
    int DEBUG =0;
    if (DEBUG) {
        cout << "Token: " << (JMMC::JMMParser::token::yytokentype)tok << endl;
    }
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