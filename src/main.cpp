#include <FlexLexer.h>
#include "scanner.hpp"
#include <iostream>
#include <fstream>
#include <memory>
#include <cerrno>
#include <cstring>


using namespace std;

int main(int argc, char *argv[]) {
   
   if (argc != 2) {
      cerr << "\x1B[1;31mError: \x1B[0mExpected one argument" << endl;
      exit(EXIT_FAILURE);
      //error(2);
   }

   ifstream source;
   source.open(argv[1]);

   if (!source.is_open()) {
      cerr << "\x1B[1;31mError: \x1B[0mFile could not be opened" << endl;
      exit(EXIT_FAILURE);
      //error(3);
   }
   
   auto lexer = make_unique<JMinusMinusFlexLexer>(&source);
   int token;
   while ((token = lexer->yylex()) != 0) {
      cout << 
      "Token: "    << getName(token) << 
      "\nLine: "   << lexer->lineno() <<
      "\nLexeme: " << lexer->lexeme << "\n\n";
   }

   source.close();

   return EXIT_SUCCESS;
}