%option c++
%option noyywrap
%option yyclass="JMMC::JMMLexer"
%option yylineno

%{
  #include "scanner.hpp"
  #include "parser.hh"
  #include "string"

  using namespace std;

  using Token = JMMC::JMMParser::token;

  #undef YY_DECL
  #define YY_DECL int JMMC::JMMLexer::yylex(JMMC::JMMParser::semantic_type *yylval, JMMC::JMMParser::location_type *loc)

  // Track location as characters are processed
  #define YY_USER_ACTION loc->step();

  string lexeme;
  int warningno = 0;
%}

NUMBER              [0-9][0-9]*
ID                  [_a-zA-Z][_a-zA-Z0-9]*
WHITESPACE          [ \t\r\n\f\v]+

%x                  COMMENT
%x                  STRING

%%

\n                  { loc->lines(); }

"true"              { yylval->sval = new std::string(yytext); return Token::T_TRUE; }
"false"             { yylval->sval = new std::string(yytext); return Token::T_FALSE; }
"boolean"           { yylval->sval = new std::string(yytext); return Token::T_BOOLEAN; }
"int"               { yylval->sval = new std::string(yytext); return Token::T_INT; }
"void"              { yylval->sval = new std::string(yytext); return Token::T_VOID; }
"if"                { yylval->sval = new std::string(yytext); return Token::T_IF; }
"else"              { yylval->sval = new std::string(yytext); return Token::T_ELSE; }
"while"             { yylval->sval = new std::string(yytext); return Token::T_WHILE; }
"break"             { yylval->sval = new std::string(yytext); return Token::T_BREAK; }
"return"            { yylval->sval = new std::string(yytext); return Token::T_RETURN; }
"+"                 { yylval->sval = new std::string(yytext); return Token::T_ADD; }
"-"                 { yylval->sval = new std::string(yytext); return Token::T_SUB; }
"*"                 { yylval->sval = new std::string(yytext); return Token::T_MUL; }
"/"                 { yylval->sval = new std::string(yytext); return Token::T_DIV; }
"%"                 { yylval->sval = new std::string(yytext); return Token::T_MOD; }
"<"                 { yylval->sval = new std::string(yytext); return Token::T_LT; }
">"                 { yylval->sval = new std::string(yytext); return Token::T_GT; }
"<="                { yylval->sval = new std::string(yytext); return Token::T_LE; }
">="                { yylval->sval = new std::string(yytext); return Token::T_GE; }
"="                 { yylval->sval = new std::string(yytext); return Token::T_EQUIV; }
"=="                { yylval->sval = new std::string(yytext); return Token::T_EQ; }
"!="                { yylval->sval = new std::string(yytext); return Token::T_NE; }
"!"                 { yylval->sval = new std::string(yytext); return Token::T_NOT; }
"&&"                { yylval->sval = new std::string(yytext); return Token::T_AND; }
"||"                { yylval->sval = new std::string(yytext); return Token::T_OR; }
"("                 { yylval->sval = new std::string(yytext); return Token::T_LBRACKET;}
")"                 { yylval->sval = new std::string(yytext); return Token::T_RBRACKET;}
"{"                 { yylval->sval = new std::string(yytext); return Token::T_LBRACE;}
"}"                 { yylval->sval = new std::string(yytext); return Token::T_RBRACE;}
";"                 { yylval->sval = new std::string(yytext); return Token::T_SEMICOLON;}
","                 { yylval->sval = new std::string(yytext); return Token::T_COMMA;}
{ID}                { yylval->sval = new std::string(yytext); return Token::T_ID; }
{NUMBER}            { yylval->sval = new std::string(yytext); return Token::T_NUMBER; } 
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
                      yylval->sval = new std::string(lexeme);
                      return Token::T_STRING;
                    }
<STRING>\\(\"|\b|\f|\t|\r|\n|\\) {
                      lexeme.push_back(YYText()[YYLeng()-2]);
                      lexeme.push_back(YYText()[YYLeng()-1]);
                      //cout << "debug: " << yylineno << endl;
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
                      cerr << "Error: newline inside string at line " << to_string(yylineno) << endl;
                      exit(EXIT_FAILURE);
                    }
<STRING><<EOF>>     { 
                      cerr << "Error: string missing closing quote at line " << to_string(yylineno) << endl;
                      exit(EXIT_FAILURE);
                    }

.                   { 
                      /* todo: track number of warning messages */ 
                      cerr << "Warning: invalid character at line " << to_string(yylineno) << endl;
                      warningno++;
                      if (warningno > 10) {
                        cerr << "Error: too many warnings, aborting process." << endl;
                        exit(EXIT_FAILURE);
                      }
                    }
<<EOF>>             { return 0; }
%%

std::unique_ptr<JMMC::JMMLexer> createLexer(std::istream* input) {
    return std::make_unique<JMMC::JMMLexer>(input);
}