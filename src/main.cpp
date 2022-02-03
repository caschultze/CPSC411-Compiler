#include <FlexLexer.h>
#include "scanner.hpp"
#include <iostream>
#include <fstream>
#include <memory>


using namespace std;

int error(int code) {

   return EXIT_FAILURE;
}

int main(int argc, char *argv[]) {

   if (argc != 2) {
      cerr << "\x1B[1;31mError: \x1B[0mExpected one argument" << endl;
      return EXIT_FAILURE;
   }

   ifstream source;
   source.open(argv[1]);

   if (!source.is_open()) {
      cerr << "\x1B[1;31mError: \x1B[0mFile could not be opened" << endl;
      return EXIT_FAILURE;
   }
   
   auto lexer = make_unique<JMinusMinusFlexLexer>(&source);

   int token;
   while ((token = lexer->yylex()) != 0) {
      std::cout << 
      "Token: "    << getName(token) << 
      "\nLine: "   << lexer->lineno()   <<
      "\nLexeme: " << lexer->YYText()   << "\n\n";
   }

   source.close();

   return EXIT_SUCCESS;
}