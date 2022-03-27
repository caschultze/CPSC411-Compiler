#pragma once

#include "symtab.hpp"

#include <unordered_map>
#include <vector>
#include <string>
#include <memory>

// ASTNodes are nodes of an abstract syntax tree. 
// The parser uses these to generate an AST for tokens caught by the scanner.
class ASTNode {
    private:
        void print(int);

    public:
        std::string type;
        int lineno;
        std::string attr;

        //std::shared_ptr<std::unordered_map<std::string, std::string>> sym_table_entry;
        std::shared_ptr<SymTabEntry> symtab_entry;
        std::string sig;
        // std::string return_type;
        
        std::vector<ASTNode*> children;
        

        ASTNode(std::string);
        ASTNode(std::string, int);
        ASTNode(std::string, std::string);
        ASTNode(std::string , int, std::string);
        ~ASTNode();

        void print();
        // void print(int);

        std::string GetType() { return type; }
        void SetType(std::string _type) { type = _type; }

        std::string GetAttr() { return attr; }
        void SetAttr(std::string _attr) { attr = _attr; }
};

// This class simply has a vector of ASTNodes.
class ASTNodeCollection {
    public:
        std::vector<ASTNode*> nodes;
        ASTNodeCollection();
        void AddNode(ASTNode*);  
};