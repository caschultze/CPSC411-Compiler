// This file is based on driver.hpp of example-cpp shared in the tutorials.
// Credits: Ali Jamadi / Shankar Ganesh

#ifndef DRIVER_HPP
#define DRIVER_HPP

#include <istream>
#include <string>

#include "ast.hpp"
#include "parser.hh"
#include "scanner.hpp"

#include "semantic_checker.hpp"

class Driver {

    public:

        ASTNode* tree = nullptr;

        Driver() {}
        ~Driver();

        bool start(std::istream &in);
        int getToken(JMM::Parser::semantic_type *yylval, JMM::Parser::location_type *location);
        
    private:
        bool parse(std::istream &in);
        bool semanticCheck();

        unique_ptr<JMM::Parser> parser{nullptr};
        unique_ptr<JMM::Lexer> lexer{nullptr};
        unique_ptr<JMM::SemanticChecker> semantic_checker{nullptr};
};

#endif