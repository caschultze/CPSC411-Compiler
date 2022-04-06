%option c++
%option noyywrap
%option yyclass="JMM::Lexer"

%{
  #include "scanner.hpp"
  #include "parser.hh"
  #include "string"

  #undef YY_DECL
  #define YY_DECL int JMM::Lexer::yylex(JMM::Parser::semantic_type *yylval, JMM::Parser::location_type *yylloc)

  #define YY_USER_ACTION yylloc->step(); yylloc->columns(yyleng);

  std::string literal;
  int warning_count = 0;
%}

NUMBER              [0-9][0-9]*
ID                  [_a-zA-Z][_a-zA-Z0-9]*
WHITESPACE          [ \t\r\f\v]+

%x                  COMMENT
%x                  STRING

%%
"\n"                { 
                      yylloc->lines();    // Increment the number of lines.
                      yylloc->step();     // Set the beginning char for the token.
                    }
{WHITESPACE}        { ; }
"true"              { yylval->sval = new std::string(yytext); return JMM::Parser::token::T_TRUE; }
"false"             { yylval->sval = new std::string(yytext); return JMM::Parser::token::T_FALSE; }
"boolean"           { yylval->sval = new std::string(yytext); return JMM::Parser::token::T_BOOLEAN; }
"int"               { yylval->sval = new std::string(yytext); return JMM::Parser::token::T_INT; }
"void"              { yylval->sval = new std::string(yytext); return JMM::Parser::token::T_VOID; }
"if"                { yylval->sval = new std::string(yytext); return JMM::Parser::token::T_IF; }
"else"              { yylval->sval = new std::string(yytext); return JMM::Parser::token::T_ELSE; }
"while"             { yylval->sval = new std::string(yytext); return JMM::Parser::token::T_WHILE; }
"break"             { yylval->sval = new std::string(yytext); return JMM::Parser::token::T_BREAK; }
"return"            { yylval->sval = new std::string(yytext); return JMM::Parser::token::T_RETURN; }
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
"("                 { yylval->sval = new std::string(yytext); return JMM::Parser::token::T_LBRACKET; }
")"                 { yylval->sval = new std::string(yytext); return JMM::Parser::token::T_RBRACKET; }
"{"                 { yylval->sval = new std::string(yytext); return JMM::Parser::token::T_LBRACE; }
"}"                 { yylval->sval = new std::string(yytext); return JMM::Parser::token::T_RBRACE; }
";"                 { yylval->sval = new std::string(yytext); return JMM::Parser::token::T_SEMICOLON; }
","                 { yylval->sval = new std::string(yytext); return JMM::Parser::token::T_COMMA; }
{ID}                { yylval->sval = new std::string(yytext); return JMM::Parser::token::T_ID; }
{NUMBER}            { yylval->sval = new std::string(yytext); return JMM::Parser::token::T_NUMBER; }
"//"                { BEGIN(COMMENT); }
<COMMENT>(\n)       { yylloc->lines(); yylloc->step(); BEGIN(INITIAL);}
<COMMENT>.          { ; }
<COMMENT><<EOF>>    { return 0; }
"\""                { 
                      BEGIN(STRING);      // Match a string literal until a closing quotation mark is matched or an error occurs.
                      literal.clear();
                    }
<STRING>"\""          {
                      BEGIN(INITIAL);     // End of string literal has been matched.
                      yylval->sval = new std::string(literal); return JMM::Parser::token::T_STRING; 
                    }
<STRING>"\\"("\b"|"\f"|"\t"|"\r"|"\n"|"\'"|"\""|"\\") {
                      // '\' concantenated with 'b', 'f', 't', 'r', 'n', "'", '"', or '\' has been matched within string literal.
                      literal.push_back(yytext[yyleng-2]);  // Append '\' to the string literal.
                      literal.push_back(yytext[yyleng-1]);  // Append the specific character to the string literal.
                      yymore();
                    }
<STRING>"\0"        {
                      // This case is required because yytext is a character pointer, which terminates when null bytes are encountered.
                      literal.push_back(yytext[yyleng-1]);   // Append '\0' to the string literal.
                      yymore(); 
                    }
<STRING>"\n"        { 
                      std::cerr << "Error: newline inside string at or near line " << yylloc->begin.line << std::endl;
                      exit(EXIT_FAILURE);
                    }
<STRING><<EOF>>     { 
                      std::cerr << "Error: string missing closing quote at or near line " << yylloc->begin.line << std::endl;
                      exit(EXIT_FAILURE);
                    }
<STRING>.           { literal.push_back(yytext[yyleng - 1]); yymore(); }

.                   { 
                      warning_count++;
                      std::cerr << "Warning: invalid character at or near line " << yylloc->begin.line << std::endl;

                      if (warning_count > 10) {
                        std::cerr << "Error: too many warnings, aborting process." << std::endl;
                        exit(EXIT_FAILURE);
                      }
                    }
<<EOF>>             { return 0; }
%%

std::unique_ptr<JMM::Lexer> createLexer(std::istream* input) {
    return std::make_unique<JMM::Lexer>(input);
}