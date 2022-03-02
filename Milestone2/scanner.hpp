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

namespace JMMC {
    class JMMLexer : public yyFlexLexer {
        
        public:
            
            JMMLexer(istream *in) : yyFlexLexer(in) {}

            virtual ~JMMLexer() = default;

            virtual int yylex(
                JMMC::JMMParser::semantic_type *yylval,
                JMMC::JMMParser::location_type *location
            );
    };
}

std::unique_ptr<JMMC::JMMLexer> createLexer(std::istream* input);

#endif