/* 
    This file is based on parser.yy of example-cpp shared in the tutorials.
    Credits: Ali Jamadi / Shankar Ganesh

    The grammar, types, and token values are different.
*/ 


/* Generate a C++ LALR(1) parser, using at least bison 3.5.1 */
%skeleton "lalr1.cc"
%require "3.5.1"    

/* Generate header files, and define the namespace and parser class */
%defines
%define api.namespace {JMMC}
%define api.parser.class {JMMParser}

/* enable location tracking */
%locations                              

/* add dependencies */
%code requires {
    #include <iostream>
    #include <string>
    #include "ast.hpp"

    class Driver;
}

%parse-param {Driver &driver}

%code {
    #include <iostream>
    #include <fstream>
    #include "driver.hpp"

    /* Switch yylex from default version to the JMMC version, that is defined in JMMC::Lexer */
    #undef yylex
    #define yylex driver.getToken
}

/* Prefix tokens with T_ */
%define api.token.prefix {T_}

%union {
    std::string*        sval;
    ASTNode*            node;
    ASTNodeCollection*  nodes;
}

%start start

%token <sval> TRUE FALSE BOOLEAN INT VOID ID NUMBER STRING
%token IF 
%token ELSE 
%token WHILE 
%token BREAK 
%token RETURN
%token ADD "+"
%token SUB "-"
%token MUL "*"
%token DIV "/"
%token MOD "%"
%token LT  "<"
%token GT  ">"
%token LE "<="
%token GE ">="
%token EQUIV "=" 
%token EQ "=="
%token NE "!="
%token NOT "!"
%token AND "&&"
%token OR "||"
%token LBRACKET "("
%token RBRACKET ")"
%token LBRACE "{"
%token RBRACE "}"
%token SEMICOLON ";"
%token COMMA ","

%type <node> literal identifier type block statement assignment expression primary
%type <node> globaldeclaration variabledeclaration mainfunctiondeclaration functiondeclaration
%type <node> statementexpression additiveexpression relationalexpression equalityexpression 
%type <node> conditionalandexpression conditionalorexpression assignmentexpression multiplicativeexpression unaryexpression
%type <node> postfixexpression functioninvocation formalparameter
%type <nodes> globaldeclarations mainfunctiondeclarator blockstatement blockstatements 
%type <nodes> formalparameterlist functionheader functiondeclarator argumentlist


%%
start                       : %empty                {   
                                                        string str = "program"; 
                                                        driver.tree = new ASTNode(str); 
                                                    }
                            | globaldeclarations    {   
                                                        string str = "program"; 
                                                        driver.tree = new ASTNode(str);
                                                        for (auto node : $1->nodes)
                                                            driver.tree->children.push_back(node);
                                                    }
                            ;

literal                     : NUMBER                { string type = "number"; $$ = new ASTNode(type, *$1); }
                            | STRING                { string type = "string"; $$ = new ASTNode(type, *$1); }
                            | TRUE                  { string type = "true"; $$ = new ASTNode(type, *$1); }
                            | FALSE                 { string type = "false"; $$ = new ASTNode(type, *$1); }
                            ;

type                        : BOOLEAN               { string type = "boolean"; $$ = new ASTNode(type, *$1); }
                            | INT                   { string type = "int"; $$ = new ASTNode(type, *$1); }
                            ;

globaldeclarations          : globaldeclaration                         { 
                                                                            $$ = new ASTNodeCollection();
                                                                            $$->AddNode(*$1); 
                                                                        }
                            | globaldeclarations globaldeclaration      { 
                                                                            $1->AddNode(*$2);
                                                                            $$ = $1;
                                                                        }
                            ;

globaldeclaration           : variabledeclaration           {
                                                                if ($1->GetType() == "varDecl")
                                                                {
                                                                    $1->SetType("globVarDecl");
                                                                    $$ = $1;
                                                                }                    
                                                            }
                            | functiondeclaration           { 
                                                                if ($1->GetType() == "funcDecl")
                                                                {
                                                                    $$ = $1;
                                                                }
                                                            }
                            | mainfunctiondeclaration       { 
                                                                if ($1->GetType() == "mainDecl")
                                                                {
                                                                    $$ = $1;
                                                                }
                                                            }
                            ;

variabledeclaration         : type identifier ";"       {
                                                            string type = "varDecl";
                                                            $$ = new ASTNode(type);
                                                            $$->children.push_back(*$1);
                                                            $$->children.push_back(*$2);
                                                        }
                            ;

identifier                  : ID                        {
                                                            std::string type = "id";
                                                            $$ = new ASTNode(type, *$1);
                                                        }
                            ;

functiondeclaration         : functionheader block                      { 
                                                                            $$ = new ASTNode("funcDecl");
                                                                    
                                                                            for (auto node : $1->nodes)
                                                                                $$->children.push_back(node);

                                                                            $$->children.push_back(*$2);
                                                                        }
                            ;
functionheader              : type functiondeclarator                   {
                                                                            $$ = new ASTNodeCollection();
                                                                            $$->AddNode(*$1);
                                                                            for (auto node : $2->nodes)
                                                                                $$->AddNode(node);
                                                                        }
                            | VOID functiondeclarator                   {   
                                                                            $$ = new ASTNodeCollection();
                                                                            auto x = new ASTNode("void", *$1);
                                                                            $$->AddNode(*x);
                                                                            for (auto node : $2->nodes)
                                                                                $$->AddNode(node);
                                                                        }
                            ;

functiondeclarator          : identifier "(" formalparameterlist ")"    {
                                                                            $$ = new ASTNodeCollection();
                                                                            $$->AddNode(*$1);

                                                                            auto x = new ASTNode("formals");
                                                                            for (auto node : $3->nodes)
                                                                                x->children.push_back(node);

                                                                            $$->AddNode(*x);
                                                                        }
                            | identifier "(" ")"                        { 
                                                                            $$ = new ASTNodeCollection();
                                                                            $$->AddNode(*$1);
                                                                            auto x = new ASTNode("formals");
                                                                            $$->AddNode(*x);

                                                                            
                                                                        }
                            ;


formalparameterlist         : formalparameter                           {
                                                                            $$ = new ASTNodeCollection();
                                                                            $$->AddNode(*$1);
                                                                        }
                            | formalparameterlist "," formalparameter   { 
                                                                            $$ = $1;
                                                                            $$->AddNode(*$3);
                                                                        }
                            ;

formalparameter             : type identifier                           {
                                                                            $$ = new ASTNode("formal");
                                                                            $$->children.push_back(*$1);
                                                                            $$->children.push_back(*$2);
                                                                        }
                            ;

mainfunctiondeclaration     : mainfunctiondeclarator block      {   
                                                                    $$ = new ASTNode("mainDecl");

                                                                    string str1 = "void"; auto x = new ASTNode(str1);
                                                                    $$->children.push_back(*x);

                                                                    for (auto node : $1->nodes)
                                                                        $$->children.push_back(node);

                                                                    string str2 = "formals"; auto y = new ASTNode(str2);
                                                                    $$->children.push_back(*y);

                                                                    $$->children.push_back(*$2);
                                                                }
                            ;

mainfunctiondeclarator      : identifier "(" ")"                                {
                                                                                    $$ = new ASTNodeCollection();
                                                                                    $$->AddNode(*$1);
                                                                                }
                            ;

block                       : "{" blockstatements "}"                           {
                                                                                    string type = "block";
                                                                                    $$ = new ASTNode(type);

                                                                                    for (auto node : $2->nodes)
                                                                                        $$->children.push_back(node);
                                                                                }
                            | "{" "}"                                           { string type = "block"; $$ = new ASTNode(type);}
                            ;

blockstatements             : blockstatement                                    {
                                                                                    $$ = $1;
                                                                                }                                    
                            | blockstatements blockstatement                    {
                                                                                    $$ = $1;
                                                                                    for (auto node : $2->nodes)
                                                                                        $$->AddNode(node);
                                                                                }
                            ;

blockstatement              : variabledeclaration                               {
                                                                                    $$ = new ASTNodeCollection();
                                                                                    $$->AddNode(*$1);
                                                                                }                             
                            | statement                                         {
                                                                                    $$ = new ASTNodeCollection();
                                                                                    $$->AddNode(*$1);
                                                                                }
                            ;

statement                   : block                                             {
                                                                                    $$ = $1;
                                                                                }
                            | ";"                                               {
                                                                                    string type =  "nullStmt"; $$ = new ASTNode(type);
                                                                                }
                            | statementexpression ";"                           {
                                                                                    $$ = $1;
                                                                                }
                            | BREAK ";"                                         {
                                                                                    string type =  "break"; $$ = new ASTNode(type);
                                                                                }
                            | RETURN expression ";"                             {
                                                                                    string type =  "return"; $$ = new ASTNode(type);
                                                                                    $$->children.push_back(*$2);
                                                                                }
                            | RETURN ";"                                        {
                                                                                    string type =  "return"; $$ = new ASTNode(type);
                                                                                }
                            | IF "(" expression ")" statement                   { 
                                                                                    string type = "if"; $$ = new ASTNode(type);
                                                                                    $$->children.push_back(*$3);
                                                                                    $$->children.push_back(*$5);
                                                                                }
                            | IF "(" expression ")" statement ELSE statement    { 
                                                                                    string type = "ifElse"; $$ = new ASTNode(type); 
                                                                                    $$->children.push_back(*$3);
                                                                                    $$->children.push_back(*$5);
                                                                                    $$->children.push_back(*$7);
                                                                                }
                            | WHILE "(" expression ")" statement                {
                                                                                    string type="while"; $$ = new ASTNode(type);
                                                                                    $$->children.push_back(*$3);
                                                                                    $$->children.push_back(*$5);
                                                                                }    
                            ;

statementexpression         : assignment                                        {
                                                                                    string type = "stmtExpr"; $$ = new ASTNode(type);
                                                                                    $$->children.push_back(*$1);
                                                                                }
                            | functioninvocation                                {   
                                                                                    string type = "stmtExpr"; $$ = new ASTNode(type);
                                                                                    $$->children.push_back(*$1);
                                                                                }
                            ;

primary                     : literal                                               { $$ = $1; }
                            | "(" expression ")"                                    { $$ = $2; }
                            | functioninvocation                                    { $$ = $1; }
                            ;

argumentlist                : expression                                            { 
                                                                                        $$ = new ASTNodeCollection();
                                                                                        $$->AddNode(*$1); 
                                                                                    }
                            | argumentlist "," expression                           {
                                                                                        $$ = $1;
                                                                                        $$->AddNode(*$3);
                                                                                    }
                            ;

functioninvocation          : identifier "(" argumentlist ")"                       { 
                                                                                        string type = "funcCall"; $$ = new ASTNode(type);
                                                                                        $$->children.push_back(*$1);

                                                                                        string str1 = "actuals"; auto x = new ASTNode(str1);
                                                                                        for (auto node : $3->nodes)
                                                                                            x->children.push_back(node);
                                                                                        $$->children.push_back(*x);

                                                                                    }
                            | identifier "(" ")"                                    {
                                                                                        string type = "funcCall"; $$ = new ASTNode(type);
                                                                                        $$->children.push_back(*$1);

                                                                                        string str1 = "actuals"; auto x = new ASTNode(str1);
                                                                                        $$->children.push_back(*x);

                                                                                    }
                            ;

postfixexpression           : primary                                               { $$ = $1; }
                            | identifier                                            { $$ = $1; }
                            ;

unaryexpression             : "-" unaryexpression                                   { 
                                                                                        string str = "-";
                                                                                        if ($2->type == "number") {
                                                                                            str.append($2->attr);
                                                                                            $$ = new ASTNode($2->type, str);
                                                                                        } else {
                                                                                            $$ = new ASTNode(str);
                                                                                            $$->children.push_back(*$2);
                                                                                        }
                                                                                        
                                                                                    }
                            | "!" unaryexpression                                   { 
                                                                                        string type = "!"; $$ = new ASTNode(type);
                                                                                        $$->children.push_back(*$2);
                                                                                    }
                            | postfixexpression                                     { $$ = $1; }
                            ;

multiplicativeexpression    : unaryexpression                                       { $$ = $1; }
                            | multiplicativeexpression "*" unaryexpression          { 
                                                                                        string type = "*"; $$ = new ASTNode(type);
                                                                                        $$->children.push_back(*$1);
                                                                                        $$->children.push_back(*$3);
                                                                                    }
                            | multiplicativeexpression "/" unaryexpression          { 
                                                                                        string type = "/"; $$ = new ASTNode(type);
                                                                                        $$->children.push_back(*$1);
                                                                                        $$->children.push_back(*$3);
                                                                                    }
                            | multiplicativeexpression "%" unaryexpression          { 
                                                                                        string type = "%"; $$ = new ASTNode(type);
                                                                                        $$->children.push_back(*$1);
                                                                                        $$->children.push_back(*$3);
                                                                                    }
                            ;

additiveexpression          : multiplicativeexpression                              { $$ = $1; }
                            | additiveexpression "+" multiplicativeexpression       { 
                                                                                        string type = "+"; $$ = new ASTNode(type);
                                                                                        $$->children.push_back(*$1);
                                                                                        $$->children.push_back(*$3);
                                                                                    }
                            | additiveexpression "-" multiplicativeexpression       { 
                                                                                        string type = "-"; $$ = new ASTNode(type);
                                                                                        $$->children.push_back(*$1);
                                                                                        $$->children.push_back(*$3);
                                                                                    }
                            ;

relationalexpression        : additiveexpression                                    { $$ = $1; }
                            | relationalexpression "<" additiveexpression           {   
                                                                                        string type = "<"; $$ = new ASTNode(type);
                                                                                        $$->children.push_back(*$1);
                                                                                        $$->children.push_back(*$3);
                                                                                    }
                            | relationalexpression ">" additiveexpression           { 
                                                                                        string type = ">"; $$ = new ASTNode(type);
                                                                                        $$->children.push_back(*$1);
                                                                                        $$->children.push_back(*$3);
                                                                                    }
                            | relationalexpression "<=" additiveexpression          { 
                                                                                        string type = "<="; $$ = new ASTNode(type);
                                                                                        $$->children.push_back(*$1);
                                                                                        $$->children.push_back(*$3);
                                                                                    }
                            | relationalexpression ">=" additiveexpression          { 
                                                                                        string type = ">="; $$ = new ASTNode(type);
                                                                                        $$->children.push_back(*$1);
                                                                                        $$->children.push_back(*$3);
                                                                                    }
                            ;

equalityexpression          : relationalexpression                                  { $$ = $1; }
                            | equalityexpression "==" relationalexpression          { 
                                                                                        string type = "=="; $$ = new ASTNode(type);
                                                                                        $$->children.push_back(*$1);
                                                                                        $$->children.push_back(*$3);
                                                                                    }
                            | equalityexpression "!=" relationalexpression          { 
                                                                                        string type = "!="; $$ = new ASTNode(type);
                                                                                        $$->children.push_back(*$1);
                                                                                        $$->children.push_back(*$3);
                                                                                    }
                            ;

conditionalandexpression    : equalityexpression                                    { $$ = $1; }
                            | conditionalandexpression "&&" equalityexpression      { 
                                                                                        string type = "&&"; $$ = new ASTNode(type);
                                                                                        $$->children.push_back(*$1);
                                                                                        $$->children.push_back(*$3);
                                                                                    }
                            ;

conditionalorexpression     : conditionalandexpression                              { $$ = $1; }
                            | conditionalorexpression "||" conditionalorexpression  { 
                                                                                        string type = "||"; $$ = new ASTNode(type);
                                                                                        $$->children.push_back(*$1);
                                                                                        $$->children.push_back(*$3);
                                                                                    }
                            ;

assignmentexpression        : conditionalorexpression                               { $$ = $1; }
                            | assignment                                            { $$ = $1; }
                            ;

assignment                  : identifier "=" assignmentexpression                   {
                                                                                        string type = "="; $$ = new ASTNode(type);
                                                                                        $$->children.push_back(*$1);
                                                                                        $$->children.push_back(*$3);
                                                                                    }
                            ;

expression                  : assignmentexpression                                  { $$ = $1; }                          
                            ;
%%

// JMMParser calls this function when there is an error.
// It is currently the same as the TA"s in simple-cpp.
void JMMC::JMMParser::error(const location_type &location, const std::string &errmsg) 
{
    std::cerr << "Error: " << errmsg << " at " << location << "\n";
}