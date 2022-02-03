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

NUMBER              [0-9][0-9]*
ID                  [_a-zA-Z][_a-zA-Z0-9]*
CRLF                [\r\n]
WHITESPACE          [ \t\f\v]+

%x                  COMMENT
%x                  STRING

%%

"true"              { lexeme.assign(YYText()); return T_TRUE; }
"false"             { lexeme.assign(YYText()); return T_FALSE; }
"boolean"           { lexeme.assign(YYText()); return T_BOOLEAN; }
"int"               { lexeme.assign(YYText()); return T_INT; }
"void"              { lexeme.assign(YYText()); return T_VOID; }
"if"                { lexeme.assign(YYText()); return T_IF; }
"else"              { lexeme.assign(YYText()); return T_ELSE; }
"while"             { lexeme.assign(YYText()); return T_WHILE; }
"break"             { lexeme.assign(YYText()); return T_BREAK; }
"return"            { lexeme.assign(YYText()); return T_RETURN; }

"+"                 { lexeme.assign(YYText()); return T_ADD; }
"-"                 { lexeme.assign(YYText()); return T_SUB; }
"*"                 { lexeme.assign(YYText()); return T_MUL; }
"/"                 { lexeme.assign(YYText()); return T_DIV; }
"%"                 { lexeme.assign(YYText()); return T_MOD; }
"<"                 { lexeme.assign(YYText()); return T_LT; }
">"                 { lexeme.assign(YYText()); return T_GT; }
"<="                { lexeme.assign(YYText()); return T_LE; }
">="                { lexeme.assign(YYText()); return T_GE; }
"="                 { lexeme.assign(YYText()); return T_EQ; }
"=="                { lexeme.assign(YYText()); return T_EQUIV; }
"!="                { lexeme.assign(YYText()); return T_NEQUIV; }
"!"                 { lexeme.assign(YYText()); return T_NOT; }
"&&"                { lexeme.assign(YYText()); return T_AND; }
"||"                { lexeme.assign(YYText()); return T_OR; }

"("                 { lexeme.assign(YYText()); return T_LBRACKET;}
")"                 { lexeme.assign(YYText()); return T_RBRACKET;}
"{"                 { lexeme.assign(YYText()); return T_LBRACE;}
"}"                 { lexeme.assign(YYText()); return T_RBRACE;}
";"                 { lexeme.assign(YYText()); return T_SEMICOLON;}
","                 { lexeme.assign(YYText()); return T_COMMA;}

{ID}                { lexeme.assign(YYText()); return T_ID; }
{NUMBER}            { lexeme.assign(YYText()); return T_NUMBER; } 
{WHITESPACE}        {;}

\"                  {   
                      BEGIN(STRING); 
                      lexeme.clear();                      
                      lexeme.push_back(YYText()[YYLeng()-1]); 
                    }

"//"                { yymore(); BEGIN(COMMENT); }
     


<STRING>\"                        {
                                    BEGIN(INITIAL); 
                                    lexeme.push_back(YYText()[YYLeng()-1]);
                                    return T_STRING;
                                  }

<STRING>\\(\"|\b|\f|\t|\r|\n|\\)  {
                                    lexeme.push_back(YYText()[YYLeng()-2]);
                                    lexeme.push_back(YYText()[YYLeng()-1]);
                                    yymore();
                                  }

<STRING>\0                        { 
                                    char x = YYText()[yyleng-1];
                                    lexeme.push_back(x);
                                    yymore(); 
                                  }

<STRING>.                         { 
                                    lexeme.push_back(YYText()[YYLeng()-1]);
                                    yymore(); 
                                  }

<STRING>\n                        {
                                    cerr << "error: newline in string at line " << yylineno << endl;
                                  }
<STRING><<EOF>>                   {
                                    cerr << "error: string missing closing quote at line " << yylineno << endl; 
                                    return 0;
                                  }

<COMMENT>\n                       {BEGIN(INITIAL);}
<COMMENT>.                        {;}
<COMMENT><<EOF>>                  {return 0;}

.                 cerr << "Warning: invalid character at line " << yylineno << endl;

%%