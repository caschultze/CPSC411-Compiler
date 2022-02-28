%skeleton "lalr1.cc"                    /* generate a C++ LALR(1) parser */
%require "3.5.1"                        /* ON CPSC MACHINE MAKE THIS 3.7 */
%defines                                /* define header files */
%define api.namespace {JMMC}            /* define the namespace */
%define api.parser.class {JMMParser}    /* define the parser class */

%locations                              /* enable location tracking */

/* add dependencies */
%code requires {
    #include <vector>
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

/* 
   Speficies the entire collection of data types for semantic values.
   Names defined here are used in %token and %type declarations.

   This union is called yylval.
   The lexer will fill yylval.

   The default return type (YYSTYPE/semantic_type) for any rule is int.
   We want some rules to return ASTNodes.
*/
%union {
    std::string*        sval;

    RootNode*           program;

    LeafNode*           leaf;
    DeclarationNode*    decl;

    std::vector<ASTNode>*    vect;       

    ExpressionNode*     expn;
    StatementNode*      stmt;
}

/* The start symbol for this grammar is "start" */
%start start

/* keyword tokens */
%token TRUE 
%token FALSE 
%token BOOLEAN 
%token INT 
%token VOID 
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
%token LE 
%token GE 
%token EQUIV "=" 
%token EQ
%token NE
%token NOT "!"
%token AND 
%token OR
%token LBRACKET "("
%token RBRACKET ")"
%token LBRACE "{"
%token RBRACE "}"
%token SEMICOLON ";"
%token COMMA ","
%token <sval> ID
%token <sval> NUMBER
%token <sval> STRING

%type <leaf> identifier
%type <decl> mainfunctiondeclaration
%type <stmt> block
%type <vect> globaldeclarations globaldeclaration mainfunctiondeclarator


%%
start                       : %empty                {   driver.tree = new RootNode(); }
                            | globaldeclarations    {  /* If this was matched when the program begins,
                                                        then assign the driver"s tree as the root node.  (ADD A CHILD?)*/
                                                        driver.tree = new RootNode();
                                                        //driver.tree->children->insert(driver.tree->children->end(), $1->begin(), $1->end());
                                                        // debug:
                                                        // for (auto element : driver.tree->children) {
                                                        //     cout << element.type << endl;
                                                        // }
                                                    }
                            ;

literal                     : NUMBER            
                            | STRING            
                            | TRUE              
                            | FALSE             
                            ;

type                        : BOOLEAN
                            | INT
                            ;

globaldeclarations          : globaldeclaration                             {
                                                                                $$ = new vector<ASTNode>;
                                                                                cout << "globaldeclarations: hello" << endl;
                                                                                //$$->insert($$->end(), $1->begin(), $1->end());
                                                                            }
                            | globaldeclarations globaldeclaration
                            ;

globaldeclaration           : variabledeclaration
                            | functiondeclaration
                            | mainfunctiondeclaration                       {
                                                                                $$ = new vector<ASTNode>;
                                                                                cout << "globaldeclaration: hello" << endl;
                                                                                //$$->insert($$.end(), $1.begin(), $1.end()); 
                                                                            }
                            ;

variabledeclaration         : type identifier ";"
                            ;

identifier                  : ID                                            {
                                                                                std::string str = "id";
                                                                                $$ = new LeafNode(str, *$1);
                                                                                $$->print();
                                                                            }
                            ;

functiondeclaration         : functionheader block
                            ;

functionheader              : type functiondeclarator
                            | VOID functiondeclarator
                            ;

functiondeclarator          : identifier "(" formalparameterlist ")"
                            | identifier "(" ")"
                            ;


formalparameterlist         : formalparameter
                            | formalparameterlist "," formalparameter
                            ;

formalparameter             : type identifier
                            ;

mainfunctiondeclaration     : mainfunctiondeclarator block                      {   
                                                                                    cout << "mainfunctiondeclaration: hello" << endl;
                                                                                    $$ = new DeclarationNode("mainDecl"); 
                                                                                    $$->children.insert($$->children.end(), $1->begin(), $1->end());
                                                                                    $$->children.push_back(*$2);
                                                                                    $$->print();
                                                                                }
                            ;

mainfunctiondeclarator      : identifier "(" ")"                                {
                                                                                    cout << "mainfunctiondeclarator: hello" << endl;
                                                                                    $$ = new vector<ASTNode>;
                                                                                    // // push node with void type
                                                                                    $$->push_back(*$1);
                                                                                    // // push node with formals type
                                                                                }
                            ;

block                       : "{" blockstatements "}"                           
                            | "{" "}"                                           {}
                            ;

blockstatements             : blockstatement                                    
                            | blockstatements blockstatement                    
                            ;

blockstatement              : variabledeclaration                               
                            | statement                                         
                            ;

statement                   : block                                             
                            | ";"                                               
                            | statementexpression ";"                           
                            | BREAK ";"                                         
                            | RETURN expression ";"                             
                            | RETURN ";"                                            
                            | IF "(" expression ")" statement                   
                            | IF "(" expression ")" statement ELSE statement    
                            | WHILE "(" expression ")" statement                
                            ;

statementexpression         : assignment
                            | functioninvocation
                            ;

primary                     : literal
                            | "(" expression ")"
                            | functioninvocation
                            ;

argumentlist                : expression
                            | argumentlist "," expression
                            ;

functioninvocation          : identifier "(" argumentlist ")"
                            | identifier "(" ")"
                            ;

postfixexpression           : primary
                            | identifier
                            ;

unaryexpression             : "-" unaryexpression
                            | "!" unaryexpression
                            | postfixexpression
                            ;

multiplicativeexpression    : unaryexpression
                            | multiplicativeexpression "*" unaryexpression
                            | multiplicativeexpression "/" unaryexpression
                            | multiplicativeexpression "%" unaryexpression
                            ;

additiveexpression          : multiplicativeexpression
                            | additiveexpression "+" multiplicativeexpression
                            | additiveexpression "-" multiplicativeexpression
                            ;

relationalexpression        : additiveexpression
                            | relationalexpression "<" additiveexpression
                            | relationalexpression ">" additiveexpression
                            | relationalexpression LE additiveexpression
                            | relationalexpression GE additiveexpression
                            ;

equalityexpression          : relationalexpression
                            | equalityexpression EQ relationalexpression
                            | equalityexpression NE relationalexpression
                            ;

conditionalandexpression    : equalityexpression
                            | conditionalandexpression AND equalityexpression
                            ;

conditionalorexpression     : conditionalandexpression
                            | conditionalorexpression OR conditionalorexpression
                            ;

assignmentexpression        : conditionalorexpression
                            | assignment
                            ;

assignment                  : identifier "=" assignmentexpression
                            ;

expression                  : assignmentexpression
                            ;
%%

// JMMParser calls this function when there is an error.
// It is currently the same as the TA"s in simple-cpp.
void JMMC::JMMParser::error(const location_type &location, const std::string &errmsg) 
{
    std::cerr << "Error: " << errmsg << " at " << location << "\n";
}