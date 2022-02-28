#include <iostream>
#include <fstream>
#include <memory>
#include <FlexLexer.h>
#include "error_handler.hpp"
#include "scanner.hpp"

using namespace std;

int main(int argc, char *argv[]) {
   if (argc != 2) {
      error(ERROR_BADARGS);
   }

   ifstream source;
   source.open(argv[1]);

   if (!source.is_open()) {
      error(ERROR_BADFILE, argv[1]);
   }
   
   auto lexer = make_unique<JMinusMinusFlexLexer>(&source);

   int tok;
   while ((tok = lexer->yylex()) != 0) {
      
      // Handle the warning and error tokens.
      if (tok == T_WARNING_BADCHAR) { 
         warning(LEX_WARNING_INVALIDCHAR, to_string(lexer->lineno()) ); 
         continue; 
      }
      if (tok == T_ERROR_NEWLINESTR) { 
         error( LEX_ERROR_NEWLINESTR, to_string(lexer->lineno()) ); 
      }
      if (tok == T_ERROR_EOFSTR) {
         error(LEX_ERROR_EOFSTR, to_string(lexer->lineno()));
      }
      
      cout << "Token("  + string(getType(tok)) + ", " 
                        + to_string(lexer->lineno()) + ", " 
                        + string(lexer->lexeme) + ")" << endl;
   }

   source.close();

   return EXIT_SUCCESS;
}