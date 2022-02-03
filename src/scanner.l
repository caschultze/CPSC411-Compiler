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

\"                  { /*yymore();*/ BEGIN(STRING); }
{NUMBER}            { return T_NUMBER; }  

"//"                { yymore(); BEGIN(COMMENT);}

"true"              { return T_TRUE; }
"false"             { return T_FALSE; }
"boolean"           { return T_BOOLEAN; }
"int"               { return T_INT; }
"void"              { return T_VOID; }
"if"                { return T_IF; }
"else"              { return T_ELSE; }
"while"             { return T_WHILE; }
"break"             { return T_BREAK; }
"return"            { return T_RETURN; }

"+"                 { return T_ADD; }
"-"                 { return T_SUB; }
"*"                 { return T_MUL; }
"/"                 { return T_DIV; }
"%"                 { return T_MOD; }
"<"                 { return T_LT; }
">"                 { return T_GT; }
"<="                { return T_LE; }
">="                { return T_GE; }
"="                 { return T_EQ; }
"=="                { return T_EQUIV; }
"!="                { return T_NEQUIV; }
"!"                 { return T_NOT; }
"&&"                { return T_AND; }
"||"                { return T_OR; }

"("                 { return T_LBRACKET;}
")"                 { return T_RBRACKET;}
"{"                 { return T_LBRACE;}
"}"                 { return T_RBRACE;}
";"                 { return T_SEMICOLON;}
","                 { return T_COMMA;}

{WHITESPACE}        { ; }
     
{ID}                {  return T_ID; }

<STRING>\"                        {
                                    BEGIN(INITIAL); 

                                    return T_STRING;
                                  }
<STRING>\n                        {cerr << "error: newline in string at line " << yylineno << endl;}
<STRING>\\(\"|\b|\f|\t|\r|\n|\\)  {yymore();}

<STRING>\0        {std::cout << std::string(YYText()) << std::endl; yymore();}
<STRING>.         {yymore();}
<STRING><<EOF>>   {cerr << "error: string missing closing quote at line " << yylineno << endl; return 0;}


<COMMENT>\n       {BEGIN(INITIAL);}
<COMMENT>.        {;}
<COMMENT><<EOF>>  {return 0;}

.                 cerr << "Warning: invalid character at line " << yylineno << endl;

%%