// This file is based on scanner.hpp of example-cpp shared in the tutorials.
// Credits: Ali Jamadi / Shankar Ganesh

#ifndef SCANNER_HPP
#define SCANNER_HPP

#include <iostream>
#include <fstream>
#include <memory>

#if ! defined(yyFlexLexerOnce)
#include <FlexLexer.h>
#endif

#include "parser.hh"
#include "location.hh"

using namespace std;

namespace JMM {
    class Lexer : public yyFlexLexer {
        
        public:
            
            Lexer(istream *in) : yyFlexLexer(in) {}

            virtual ~Lexer() = default;

            virtual int yylex(
                JMM::Parser::semantic_type *yylval,
                JMM::Parser::location_type *location
            );
    };
}

std::unique_ptr<JMM::Lexer> createLexer(std::istream* input);

#endif