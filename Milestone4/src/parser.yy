%skeleton "lalr1.cc"
%require "3.5.1"    
%defines
%define api.namespace {JMM}
%define api.parser.class {Parser}
%locations                              

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

    #undef yylex
    #define yylex driver.getToken
}

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
start                       : %empty                { driver.tree = new ASTNode("program"); }
                            | globaldeclarations    {   
                                                        driver.tree = new ASTNode("program");
                                                        for (ASTNode* node : $1->nodes)
                                                            driver.tree->children.push_back(node);
                                                    }
                            ;

literal                     : NUMBER                { $$ = new ASTNode("number", @1.begin.line, *$1); }
                            | STRING                { $$ = new ASTNode("string", @1.begin.line, *$1); }
                            | TRUE                  { $$ = new ASTNode("true", @1.begin.line); }
                            | FALSE                 { $$ = new ASTNode("false", @1.begin.line); }
                            ;

type                        : BOOLEAN               { $$ = new ASTNode("boolean", @1.begin.line); }
                            | INT                   { $$ = new ASTNode("int", @1.begin.line); }
                            ;

globaldeclarations          : globaldeclaration                         { 
                                                                            $$ = new ASTNodeCollection();
                                                                            $$->AddNode($1); 
                                                                        }
                            | globaldeclarations globaldeclaration      { 
                                                                            $1->AddNode($2);
                                                                            $$ = $1;
                                                                        }
                            ;

globaldeclaration           : variabledeclaration           {
                                                                $1->SetType("globVarDecl");
                                                                $$ = $1;
                                                            }                    
                            | functiondeclaration           { $$ = $1; }
                            | mainfunctiondeclaration       { $$ = $1; }
                            ;

variabledeclaration         : type identifier ";"       {
                                                            $$ = new ASTNode("varDecl", @1.begin.line);
                                                            $$->children.push_back($1);
                                                            $$->children.push_back($2);
                                                        }
                            ;

identifier                  : ID                        { $$ = new ASTNode("id", @1.begin.line, *$1); }
                            ;

functiondeclaration         : functionheader block                      { 
                                                                            $$ = new ASTNode("funcDecl", @1.begin.line);
                                                                    
                                                                            for (ASTNode* node : $1->nodes)
                                                                                $$->children.push_back(node);

                                                                            $$->children.push_back($2);
                                                                        }
                            ;
functionheader              : type functiondeclarator                   {
                                                                            $$ = new ASTNodeCollection();
                                                                            $$->AddNode($1);
                                                                            for (ASTNode* node : $2->nodes)
                                                                                $$->AddNode(node);
                                                                        }
                            | VOID functiondeclarator                   {   
                                                                            $$ = new ASTNodeCollection();
                                                                            $$->AddNode(new ASTNode("void", @1.begin.line));
                                                                            for (auto node : $2->nodes)
                                                                                $$->AddNode(node);
                                                                        }
                            ;

functiondeclarator          : identifier "(" formalparameterlist ")"    {
                                                                            $$ = new ASTNodeCollection();
                                                                            $$->AddNode($1);

                                                                            ASTNode* formals = new ASTNode("formals");
                                                                            for (ASTNode* node : $3->nodes)
                                                                                formals->children.push_back(node);
                                                                            $$->AddNode(formals);
                                                                        }
                            | identifier "(" ")"                        { 
                                                                            $$ = new ASTNodeCollection();
                                                                            $$->AddNode($1);
                                                                            $$->AddNode(new ASTNode("formals"));                                     
                                                                        }
                            ;


formalparameterlist         : formalparameter                           {
                                                                            $$ = new ASTNodeCollection();
                                                                            $$->AddNode($1);
                                                                        }
                            | formalparameterlist "," formalparameter   { 
                                                                            $$ = $1;
                                                                            $$->AddNode($3);
                                                                        }
                            ;

formalparameter             : type identifier                           {
                                                                            $$ = new ASTNode("formal", @1.begin.line);
                                                                            $$->children.push_back($1);
                                                                            $$->children.push_back($2);
                                                                        }
                            ;

mainfunctiondeclaration     : mainfunctiondeclarator block      {   
                                                                    $$ = new ASTNode("mainDecl", @1.begin.line);

                                                                    $$->children.push_back(new ASTNode("void"));

                                                                    for (ASTNode* node : $1->nodes)
                                                                        $$->children.push_back(node);

                                                                    $$->children.push_back(new ASTNode("formals"));

                                                                    $$->children.push_back($2);
                                                                }
                            ;

mainfunctiondeclarator      : identifier "(" ")"                                {
                                                                                    $$ = new ASTNodeCollection();
                                                                                    $$->AddNode($1);
                                                                                }
                            ;

block                       : "{" blockstatements "}"                           {
                                                                                    $$ = new ASTNode("block");
                                                                                    for (ASTNode* node : $2->nodes)
                                                                                        $$->children.push_back(node);
                                                                                }
                            | "{" "}"                                           { $$ = new ASTNode("block"); }
                            ;

blockstatements             : blockstatement                                    { $$ = $1; }                                    
                            | blockstatements blockstatement                    {
                                                                                    $$ = $1;
                                                                                    for (ASTNode* node : $2->nodes)
                                                                                        $$->AddNode(node);
                                                                                }
                            ;

blockstatement              : variabledeclaration                               {
                                                                                    $$ = new ASTNodeCollection();
                                                                                    $$->AddNode($1);
                                                                                }                             
                            | statement                                         {
                                                                                    $$ = new ASTNodeCollection();
                                                                                    $$->AddNode($1);
                                                                                }
                            ;

statement                   : block                                             { $$ = $1; }
                            | ";"                                               { $$ = new ASTNode("nullStmt", @1.begin.line); }
                            | statementexpression ";"                           { $$ = $1; }
                            | BREAK ";"                                         { $$ = new ASTNode("break", @1.begin.line); }
                            | RETURN expression ";"                             {
                                                                                    $$ = new ASTNode("return", @1.begin.line);
                                                                                    $$->children.push_back($2);
                                                                                }
                            | RETURN ";"                                        { $$ = new ASTNode("return", @1.begin.line); }
                            | IF "(" expression ")" statement                   { 
                                                                                    $$ = new ASTNode("if", @1.begin.line);
                                                                                    $$->children.push_back($3);
                                                                                    $$->children.push_back($5);
                                                                                }
                            | IF "(" expression ")" statement ELSE statement    { 
                                                                                    $$ = new ASTNode("ifElse", @1.begin.line); 
                                                                                    $$->children.push_back($3);
                                                                                    $$->children.push_back($5);
                                                                                    $$->children.push_back($7);
                                                                                }
                            | WHILE "(" expression ")" statement                {
                                                                                    $$ = new ASTNode("while", @1.begin.line);
                                                                                    $$->children.push_back($3);
                                                                                    $$->children.push_back($5);
                                                                                }    
                            ;

statementexpression         : assignment                                        {
                                                                                    $$ = new ASTNode("stmtExpr", @1.begin.line);
                                                                                    $$->children.push_back($1);
                                                                                }
                            | functioninvocation                                {   
                                                                                    $$ = new ASTNode("stmtExpr", @1.begin.line);
                                                                                    $$->children.push_back($1);
                                                                                }
                            ;

primary                     : literal                                               { $$ = $1; }
                            | "(" expression ")"                                    { $$ = $2; }
                            | functioninvocation                                    { $$ = $1; }
                            ;

argumentlist                : expression                                            { 
                                                                                        $$ = new ASTNodeCollection();
                                                                                        $$->AddNode($1); 
                                                                                    }
                            | argumentlist "," expression                           {
                                                                                        $$ = $1;
                                                                                        $$->AddNode($3);
                                                                                    }
                            ;

functioninvocation          : identifier "(" argumentlist ")"                       { 
                                                                                        $$ = new ASTNode("funcCall", @1.begin.line);
                                                                                        $$->children.push_back($1);

                                                                                        ASTNode* actuals = new ASTNode("actuals");
                                                                                        for (ASTNode* node : $3->nodes)
                                                                                            actuals->children.push_back(node);
                                                                                        $$->children.push_back(actuals);

                                                                                    }
                            | identifier "(" ")"                                    {
                                                                                        $$ = new ASTNode("funcCall", @1.begin.line);
                                                                                        $$->children.push_back($1);
                                                                                        $$->children.push_back(new ASTNode("actuals"));
                                                                                    }
                            ;

postfixexpression           : primary                                               { $$ = $1; }
                            | identifier                                            { $$ = $1; }
                            ;

unaryexpression             : "-" unaryexpression                                   { 
                                                                                        if ( $2->GetType() == "number" && !($2->attr.find('-') != std::string::npos)) {
                                                                                            std::string neg = "-";
                                                                                            neg.append($2->attr);
                                                                                            $2->SetAttr(neg);
                                                                                            $$ = $2;
                                                                                        } else {
                                                                                            $$ = new ASTNode("-", @1.begin.line);
                                                                                            $$->children.push_back($2);
                                                                                        }
                                                                                    }
                            | "!" unaryexpression                                   { 
                                                                                        $$ = new ASTNode("!", @1.begin.line);
                                                                                        $$->children.push_back($2);
                                                                                    }
                            | postfixexpression                                     { $$ = $1; }
                            ;

multiplicativeexpression    : unaryexpression                                       { $$ = $1; }
                            | multiplicativeexpression "*" unaryexpression          { 
                                                                                        $$ = new ASTNode("*", @2.begin.line);
                                                                                        $$->children.push_back($1);
                                                                                        $$->children.push_back($3);
                                                                                    }
                            | multiplicativeexpression "/" unaryexpression          { 
                                                                                        $$ = new ASTNode("/", @2.begin.line);
                                                                                        $$->children.push_back($1);
                                                                                        $$->children.push_back($3);
                                                                                    }
                            | multiplicativeexpression "%" unaryexpression          { 
                                                                                        $$ = new ASTNode("%", @2.begin.line);
                                                                                        $$->children.push_back($1);
                                                                                        $$->children.push_back($3);
                                                                                    }
                            ;

additiveexpression          : multiplicativeexpression                              { $$ = $1; }
                            | additiveexpression "+" multiplicativeexpression       { 
                                                                                        $$ = new ASTNode("+", @2.begin.line);
                                                                                        $$->children.push_back($1);
                                                                                        $$->children.push_back($3);
                                                                                    }
                            | additiveexpression "-" multiplicativeexpression       { 
                                                                                        $$ = new ASTNode("-", @2.begin.line);
                                                                                        $$->children.push_back($1);
                                                                                        $$->children.push_back($3);
                                                                                    }
                            ;

relationalexpression        : additiveexpression                                    { $$ = $1; }
                            | relationalexpression "<" additiveexpression           {   
                                                                                        $$ = new ASTNode("<", @2.begin.line);
                                                                                        $$->children.push_back($1);
                                                                                        $$->children.push_back($3);
                                                                                    }
                            | relationalexpression ">" additiveexpression           { 
                                                                                        $$ = new ASTNode(">", @2.begin.line);
                                                                                        $$->children.push_back($1);
                                                                                        $$->children.push_back($3);
                                                                                    }
                            | relationalexpression "<=" additiveexpression          { 
                                                                                        $$ = new ASTNode("<=", @2.begin.line);
                                                                                        $$->children.push_back($1);
                                                                                        $$->children.push_back($3);
                                                                                    }
                            | relationalexpression ">=" additiveexpression          { 
                                                                                        $$ = new ASTNode(">=", @2.begin.line);
                                                                                        $$->children.push_back($1);
                                                                                        $$->children.push_back($3);
                                                                                    }
                            ;

equalityexpression          : relationalexpression                                  { $$ = $1; }
                            | equalityexpression "==" relationalexpression          { 
                                                                                        $$ = new ASTNode("==", @2.begin.line);
                                                                                        $$->children.push_back($1);
                                                                                        $$->children.push_back($3);
                                                                                    }
                            | equalityexpression "!=" relationalexpression          { 
                                                                                        $$ = new ASTNode("!=", @2.begin.line);
                                                                                        $$->children.push_back($1);
                                                                                        $$->children.push_back($3);
                                                                                    }
                            ;

conditionalandexpression    : equalityexpression                                    { $$ = $1; }
                            | conditionalandexpression "&&" equalityexpression      { 
                                                                                        $$ = new ASTNode("&&", @2.begin.line);
                                                                                        $$->children.push_back($1);
                                                                                        $$->children.push_back($3);
                                                                                    }
                            ;

conditionalorexpression     : conditionalandexpression                              { $$ = $1; }
                            | conditionalorexpression "||" conditionalorexpression  { 
                                                                                        $$ = new ASTNode("||", @2.begin.line);
                                                                                        $$->children.push_back($1);
                                                                                        $$->children.push_back($3);
                                                                                    }
                            ;

assignmentexpression        : conditionalorexpression                               { $$ = $1; }
                            | assignment                                            { $$ = $1; }
                            ;

assignment                  : identifier "=" assignmentexpression                   {
                                                                                        $$ = new ASTNode("=", @2.begin.line);
                                                                                        $$->children.push_back($1);
                                                                                        $$->children.push_back($3);
                                                                                    }
                            ;

expression                  : assignmentexpression                                  { $$ = $1; }                          
                            ;
%%

// Parser calls this function when there is an error.
void JMM::Parser::error(const location_type &location, const std::string &errmsg) {
    std::cerr << "Error: " << errmsg << " at or near line " << location.begin.line << std::endl;
}