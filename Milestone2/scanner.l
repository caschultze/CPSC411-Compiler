%option c++
%option noyywrap
%option yyclass="JMM::Lexer"

%{
  #include "scanner.hpp"
  #include "parser.hh"
  #include "string"

  using Token = JMM::Parser::token;

  // Redefine yylex within the JMMC namespace.
  #undef YY_DECL
  #define YY_DECL int JMM::Lexer::yylex(JMM::Parser::semantic_type *yylval, JMM::Parser::location_type *yylloc)

  // Each time yylex is invoked, trigger the following two actions:
  //  1.  yylloc->step()       sets the beginning char for the token.
  //  2.  yylloc->columns(n)   sets the number of characters for the token.
  #define YY_USER_ACTION yylloc->step(); yylloc->columns(yyleng);

  std::string lexeme;
  int warningno = 0;
%}

NUMBER              [0-9][0-9]*
ID                  [_a-zA-Z][_a-zA-Z0-9]*
WHITESPACE          [ \t\r\n\f\v]+

%x                  COMMENT
%x                  STRING

%%

\n                  { 
                      yylloc->lines();    // Increment the number of lines.
                      yylloc->step();     // Set the beginning char for the token.
                    }

"true"              { 
                      std::cout << "Loc of " << yytext << ": " << *yylloc << "\n";
                      yylval->sval = new std::string(yytext); 
                      return JMM::Parser::token::T_TRUE; 
                    }
"false"             { 
                      std::cout << "Loc of " << yytext << ": " << *yylloc << "\n";
                      yylval->sval = new std::string(yytext); 
                      return JMM::Parser::token::T_FALSE; 
                    }
"boolean"           { 
                      std::cout << "Loc of " << yytext << ": " << *yylloc << "\n";
                      yylval->sval = new std::string(yytext); 
                      return JMM::Parser::token::T_BOOLEAN; 
                    }
"int"               { 
                      std::cout << "Loc of " << yytext << ": " << *yylloc << "\n";
                      yylval->sval = new std::string(yytext); 
                      return JMM::Parser::token::T_INT; 
                    }
"void"              { 
                      std::cout << "Loc of " << yytext << ": " << *yylloc << "\n";
                      yylval->sval = new std::string(yytext); 
                      return JMM::Parser::token::T_VOID; 
                    }
"if"                { 
                      std::cout << "Loc of " << yytext << ": " << *yylloc << "\n";
                      yylval->sval = new std::string(yytext); 
                      return JMM::Parser::token::T_IF; 
                    }
"else"              { 
                      std::cout << "Loc of " << yytext << ": " << *yylloc << "\n";
                      yylval->sval = new std::string(yytext); 
                      return JMM::Parser::token::T_ELSE; 
                    }
"while"             { 
                      std::cout << "Loc of " << yytext << ": " << *yylloc << "\n";
                      yylval->sval = new std::string(yytext); 
                      return JMM::Parser::token::T_WHILE; 
                    }
"break"             { 
                      std::cout << "Loc of " << yytext << ": " << *yylloc << "\n";
                      yylval->sval = new std::string(yytext); 
                      return JMM::Parser::token::T_BREAK; 
                    }
"return"            { 
                      std::cout << "Loc of " << yytext << ": " << *yylloc << "\n";
                      yylval->sval = new std::string(yytext); 
                      return JMM::Parser::token::T_RETURN; 
                    }
"+"                 { yylval->sval = new std::string(yytext); return JMM::Parser::token::T_ADD; }
"-"                 { yylval->sval = new std::string(yytext); return JMM::Parser::token::T_SUB; }
"*"                 { yylval->sval = new std::string(yytext); return JMM::Parser::token::T_MUL; }
"/"                 { yylval->sval = new std::string(yytext); return JMM::Parser::token::T_DIV; }
"%"                 { yylval->sval = new std::string(yytext); return JMM::Parser::token::T_MOD; }
"<"                 { yylval->sval = new std::string(yytext); return JMM::Parser::token::T_LT; }
">"                 { yylval->sval = new std::string(yytext); return JMM::Parser::token::T_GT; }
"<="                { yylval->sval = new std::string(yytext); return JMM::Parser::token::T_LE; }
">="                { yylval->sval = new std::string(yytext); return JMM::Parser::token::T_GE; }
"="                 { yylval->sval = new std::string(yytext); return JMM::Parser::token::T_EQUIV; }
"=="                { yylval->sval = new std::string(yytext); return JMM::Parser::token::T_EQ; }
"!="                { yylval->sval = new std::string(yytext); return JMM::Parser::token::T_NE; }
"!"                 { yylval->sval = new std::string(yytext); return JMM::Parser::token::T_NOT; }
"&&"                { yylval->sval = new std::string(yytext); return JMM::Parser::token::T_AND; }
"||"                { yylval->sval = new std::string(yytext); return JMM::Parser::token::T_OR; }
"("                 { 
                      std::cout << "Loc of " << yytext << ": " << *yylloc << "\n";
                      yylval->sval = new std::string(yytext); 
                      return JMM::Parser::token::T_LBRACKET; 
                    }
")"                 { 
                      std::cout << "Loc of " << yytext << ": " << *yylloc << "\n";
                      yylval->sval = new std::string(yytext); 
                      return JMM::Parser::token::T_RBRACKET; 
                    }
"{"                 { 
                      std::cout << "Loc of " << yytext << ": " << *yylloc << "\n";
                      yylval->sval = new std::string(yytext); 
                      return JMM::Parser::token::T_LBRACE; 
                    }
"}"                 { 
                      std::cout << "Loc of " << yytext << ": " << *yylloc << "\n";
                      yylval->sval = new std::string(yytext); 
                      return JMM::Parser::token::T_RBRACE; 
                    }
";"                 { 
                      std::cout << "Loc of " << yytext << ": " << *yylloc << "\n";
                      yylval->sval = new std::string(yytext); 
                      return JMM::Parser::token::T_SEMICOLON; 
                    }
","                 { 
                     std::cout << "Loc of " << yytext << ": " << *yylloc << "\n";
                      yylval->sval = new std::string(yytext); 
                      return JMM::Parser::token::T_COMMA; 
                    }
{ID}                { 
                      std::cout << "Loc of " << yytext << ": " << *yylloc << "\n";
                      yylval->sval = new std::string(yytext); 
                      return JMM::Parser::token::T_ID; 
                    }
{NUMBER}            { 
                      std::cout << "Loc of " << yytext << ": " << *yylloc << "\n";
                      yylval->sval = new std::string(yytext); 
                      return JMM::Parser::token::T_NUMBER; 
                    }
{WHITESPACE}        { ; }

"//"                { BEGIN(COMMENT); }
<COMMENT>(\r|\n)+   { BEGIN(INITIAL);}
<COMMENT>.          { ; }
<COMMENT><<EOF>>    { return 0; }

\"                  {   
                      BEGIN(STRING); 
                      lexeme.clear();                      
                      lexeme.push_back(YYText()[YYLeng()-1]); 
                    }
<STRING>\"          {
                      BEGIN(INITIAL); 
                      lexeme.push_back(YYText()[YYLeng()-1]);

                      std::cout << "Loc of " << yytext << ": " << *yylloc << "\n";
                      yylval->sval = new std::string(lexeme);
                      return JMM::Parser::token::T_WHILE; 
                    
                    }
<STRING>\\(\"|\b|\f|\t|\r|\n|\\) {
                      lexeme.push_back(YYText()[YYLeng()-2]);
                      lexeme.push_back(YYText()[YYLeng()-1]);
                      yymore();
                    }
<STRING>\0          {
                      char x = YYText()[yyleng-1];
                      lexeme.push_back(x);
                      yymore(); 
                    }
<STRING>.           { 
                      lexeme.push_back(YYText()[YYLeng()-1]);
                      yymore(); 
                    }
<STRING>(\r|\n)+    { 
                      std::cerr << "Error: newline inside string at line " << *yylloc << std::endl;
                      exit(EXIT_FAILURE);
                    }
<STRING><<EOF>>     { 
                      std::cerr << "Error: string missing closing quote at line " << *yylloc << std::endl;
                      exit(EXIT_FAILURE);
                    }

.                   { 
                      /* todo: track number of warning messages */ 
                      std::cerr << "Warning: invalid character at line " << *yylloc << std::endl;
                      warningno++;
                      if (warningno > 10) {
                        std::cerr << "Error: too many warnings, aborting process." << std::endl;
                        exit(EXIT_FAILURE);
                      }
                    }
<<EOF>>             { return 0; }
%%

std::unique_ptr<JMM::Lexer> createLexer(std::istream* input) {
    return std::make_unique<JMM::Lexer>(input);
}