#ifndef SCANNER_HPP
#define SCANNER_HPP

#include <iostream>
#include <fstream>

using namespace std;

class JMinusMinusFlexLexer : public yyFlexLexer {
    public:
        JMinusMinusFlexLexer(istream *in) : yyFlexLexer(in) { yylineno = 1;}
        int yylex();
};

enum {
    T_ID = 1,
    T_STRING,
    T_NUMBER,
    T_TRUE,
    T_FALSE,
    T_BOOLEAN,
    T_INT,
    T_VOID,
    T_IF,
    T_ELSE,
    T_WHILE,
    T_BREAK,
    T_RETURN,
    T_ADD,
    T_SUB,
    T_MUL,
    T_DIV,
    T_MOD,
    T_LT,
    T_GT,
    T_LE,
    T_GE,
    T_EQ,
    T_EQUIV,
    T_NEQUIV,
    T_NOT,
    T_AND,
    T_OR,
    T_LBRACKET,
    T_RBRACKET,
    T_LBRACE,
    T_RBRACE,
    T_SEMICOLON,
    T_COMMA
};

inline char const* getName (int tok){
    switch (tok)
    {
        case T_ID:
            return "id";

        case T_STRING:
            return "string";

        case T_NUMBER:
            return "number";

        case T_TRUE:
            return "true";

        case T_FALSE:
            return "false";

        case T_BOOLEAN:
            return "boolean";

        case T_INT:
            return "int";

        case T_VOID:
            return "void";

        case T_IF:
            return "if";

        case T_ELSE:
            return "else";

        case T_WHILE:
            return "while";

        case T_BREAK:
            return "break";

        case T_RETURN:
            return "return";

        case T_ADD:
            return "+";

        case T_SUB:
            return "-";

        case T_MUL:
            return "*";

        case T_DIV:
            return "/";

        case T_MOD:
            return "%";

        case T_LT:
            return "<";

        case T_GT:
            return ">";

        case T_LE:
            return "<=";

        case T_GE:
            return ">=";

        case T_EQ:
            return "=";

        case T_EQUIV:
            return "==";

        case T_NEQUIV:
            return "!=";

        case T_NOT:
            return "!";

        case T_AND:
            return "&&";

        case T_OR:
            return "||";

        case T_LBRACKET:
            return "(";

        case T_RBRACKET:
            return ")";

        case T_LBRACE:
            return "{";

        case T_RBRACE:
            return "}";

        case T_SEMICOLON:
            return ";";

        case T_COMMA:
            return ",";

        default:
            return "???";
        }
}

#endif