// This file is based on driver.cpp of example-cpp shared in the tutorials.
// Credits: Ali Jamadi / Shankar Ganesh

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
    if (!in.good() && in.eof()) {
        return 1;
    }
    bool res = parse(in);

    //tree->print();

    if (!res) res = semanticCheck();
    if (!res) tree->print();
    
    //if (!res) annotated_tree->print();

    return res;
}

int Driver::getToken(JMM::Parser::semantic_type *yylval, JMM::Parser::location_type *yylloc)
{
    int tok = lexer->yylex(yylval, yylloc);
    return tok;
}

bool Driver::parse(istream &in)
{
    lexer = createLexer(&in);

    parser = std::make_unique<JMM::Parser>(*this);

    if (parser->parse() != 0)
    {
        return 1;
    }

    return 0;
}

bool Driver::semanticCheck() 
{
    semantic_checker = std::make_unique<JMM::SemanticChecker>(tree);

    if (!semantic_checker->check()) {
        cerr << "Semantic check failed!!" << endl;
        return 1;
    }

    return 0;
}