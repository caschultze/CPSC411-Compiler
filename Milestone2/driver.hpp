#ifndef DRIVER_HPP
#define DRIVER_HPP

#include <istream>
#include <string>

#include "ast.hpp"
#include "parser.hh"
#include "scanner.hpp"

class Driver {

    public:

        Driver(const char* file) : file_name(file) {}

        ~Driver();

        // starts compilation of the source code
        bool start(std::istream &in);

        // never used, i think
        string getFileName() { return file_name; }

        // calls yylex, prints token when debugging mode
        int getToken(JMMC::JMMParser::semantic_type *yylval, JMMC::JMMParser::location_type *location);
        
        // Parser will identify this.
        ASTNode* tree = nullptr;

    private:

        bool parse(std::istream &in);
        
        std::string file_name; // never used, i think
        unique_ptr<JMMC::JMMParser> parser{nullptr};
        unique_ptr<JMMC::JMMLexer> lexer{nullptr};

};

#endif