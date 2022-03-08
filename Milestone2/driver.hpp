// This file is based on driver.hpp of example-cpp shared in the tutorials.
// Credits: Ali Jamadi / Shankar Ganesh

#ifndef DRIVER_HPP
#define DRIVER_HPP

#include <istream>
#include <string>

#include "ast.hpp"
#include "parser.hh"
#include "scanner.hpp"

class Driver {

    public:

        Driver() {}
        ~Driver();

        // Parser will identify this.
        ASTNode* tree = nullptr;

        // Starts compilation of the source code.
        bool start(std::istream &in);

        // Calls yylex.
        int getToken(JMM::Parser::semantic_type *yylval, JMM::Parser::location_type *location);
        
    private:
        bool parse(std::istream &in);
        unique_ptr<JMM::Parser> parser{nullptr};
        unique_ptr<JMM::Lexer> lexer{nullptr};
};

#endif