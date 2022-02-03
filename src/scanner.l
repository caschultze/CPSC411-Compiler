%option c++
%option noyywrap
%option yyclass="JMinusMinusFlexLexer"
%option yylineno

%{
  #include <iostream>
  #include <fstream>
  #include "scanner.hpp"
  using namespace std;
%}

NUMBER      [0-9][0-9]*
ID          [_a-zA-Z][_a-zA-Z0-9]*
WHITESPACE  [ \t\n\r\f\v]+

%x      COMMENT
%x      STRING

%%

\"                  { yymore(); BEGIN(STRING); }
{NUMBER}            { lexeme = string(YYText()); return T_NUMBER; }  

"//"                {yymore(); BEGIN(COMMENT);}

"true"              { lexeme = string(YYText()); return T_TRUE; }
"false"             { lexeme = string(YYText()); return T_FALSE; }
"boolean"           { lexeme = string(YYText()); return T_BOOLEAN; }
"int"               { lexeme = string(YYText()); return T_INT; }
"void"              { lexeme = string(YYText()); return T_VOID; }
"if"                { lexeme = string(YYText()); return T_IF; }
"else"              { lexeme = string(YYText()); return T_ELSE; }
"while"             { lexeme = string(YYText()); return T_WHILE; }
"break"             { lexeme = string(YYText()); return T_BREAK; }
"return"            { lexeme = string(YYText()); return T_RETURN; }

"+"                 { lexeme = string(YYText()); return T_ADD; }
"-"                 { lexeme = string(YYText()); return T_SUB; }
"*"                 { lexeme = string(YYText()); return T_MUL; }
"/"                 { lexeme = string(YYText()); return T_DIV; }
"%"                 { lexeme = string(YYText()); return T_MOD; }
"<"                 { lexeme = string(YYText()); return T_LT; }
">"                 { lexeme = string(YYText()); return T_GT; }
"<="                { lexeme = string(YYText()); return T_LE; }
">="                { lexeme = string(YYText()); return T_GE; }
"="                 { lexeme = string(YYText()); return T_EQ; }
"=="                { lexeme = string(YYText()); return T_EQUIV; }
"!="                { lexeme = string(YYText()); return T_NEQUIV; }
"!"                 { lexeme = string(YYText()); return T_NOT; }
"&&"                { lexeme = string(YYText()); return T_AND; }
"||"                { lexeme = string(YYText()); return T_OR; }

"("                 { lexeme = string(YYText()); return T_LBRACKET;}
")"                 { lexeme = string(YYText()); return T_RBRACKET;}
"{"                 { lexeme = string(YYText()); return T_LBRACE;}
"}"                 { lexeme = string(YYText()); return T_RBRACE;}
";"                 { lexeme = string(YYText()); return T_SEMICOLON;}
","                 { lexeme = string(YYText()); return T_COMMA;}

{WHITESPACE}        { ; }
     
{ID}                { lexeme = string(YYText()); return T_ID; }

<STRING>\"        {
                      BEGIN(INITIAL); 
                      lexeme = string(YYText()); 
                      return T_STRING;
                  }
<STRING>\n        {cerr << "error: newline in string at line " << yylineno << endl;}
<STRING>\\\b      {yymore();}
<STRING>\\\f      {yymore();}
<STRING>\\\t      {yymore();}
<STRING>\\\r      {yymore();}
<STRING>\\\n      {yymore();}
<STRING>\\\"      {yymore();}
<STRING>\\\\      {yymore();}
<STRING>\0        {std::cout << std::string(YYText()) << std::endl; yymore();}
<STRING>.         {yymore();}
<STRING><<EOF>>   {cerr << "error: string missing closing quote at line " << yylineno << endl; return 0;}


<COMMENT>\n       {BEGIN(INITIAL);}
<COMMENT>.        {;}
<COMMENT><<EOF>>  {return 0;}

.                   cerr << "warning: invalid character at line " << yylineno << endl;


%%