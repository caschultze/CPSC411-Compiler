#ifndef AST_HPP
#define AST_HPP

#include <vector>
#include <string>

using namespace std;

// ASTNodes are nodes of an abract syntax tree. 
// The parser uses these to generate an AST for tokens caught by the scanner.
class ASTNode {
    public:
        vector<ASTNode> children;
        string type;
        int lineno;
        string attr;

        ASTNode() {}
        ~ASTNode() {}

        ASTNode(string _type) : type(_type) { lineno = 0; };
        ASTNode(string _type, string _attr) : type(_type), attr(_attr) { lineno = 0; }
        ASTNode(string _type, int _lineno) : type(_type), lineno(_lineno) {}
        ASTNode(string _type, int _lineno, string _attr) : type(_type), lineno(_lineno), attr(_attr) {}

        virtual void print();
        virtual void print(int);

        string GetType() { return type; }
        void SetType(string _type) { type = _type; }

        string GetAttr() { return attr; }
        void SetAttr(string _attr) { attr = _attr; }
};

// This class simply has a vector of ASTNodes.
class ASTNodeCollection {
    public:
        vector<ASTNode> nodes;
        ASTNodeCollection() {}
        void AddNode(ASTNode _node) { nodes.push_back(_node); } 
};

#endif