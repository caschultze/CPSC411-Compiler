#include "ast.hpp"
#include <iostream>

ASTNode::ASTNode(std::string _type) {
    type = _type;
    lineno = 0;
    attr = "";
}

ASTNode::ASTNode(std::string _type, std::string _attr) {
    type = _type;
    lineno = 0;
    attr = _attr;
}

ASTNode::ASTNode(std::string _type, int _lineno) {
    type = _type;
    lineno = _lineno;
    attr = "";
}

ASTNode::ASTNode(std::string _type, int _lineno, std::string _attr) {
    type = _type;
    lineno = _lineno;
    attr = _attr;
}

ASTNode::~ASTNode() {
    ;
}
void ASTNode::print() {
    print(0);
}

void ASTNode::print(int num_tabs) {
    for (int i = 0; i < num_tabs; i++)
        std::cout << '\t';

    std:: cout << "Node: { ";
    if (type != "") std::cout << "type: '" << type << "' "; 
    if (lineno > 0) std::cout << "lineno: '" << lineno << "' ";
    if (attr != "") {
        std::cout << "attr: '";
        for (size_t i = 0; i < attr.length(); i++) {
            switch (attr[i]) {
                case '\b':
                    std::cout << "\\b";
                    break;
                case '\f':
                    std::cout << "\\f";
                    break;
                case '\t':
                    std::cout << "\\t";
                    break;
                case '\r':
                    std::cout << "\\r";
                    break;
                case '\'':
                    std::cout << "\'";
                    break;
                case '\"':
                    std::cout << "\"";
                    break;
                case '\\':
                    std::cout << "\\\\";
                    break;
                case '\0':
                    std::cout << "\\x00";
                    break;
                default:
                    std::cout << attr[i];
            }
        }
        std::cout << "' ";
    }
    if (symtab_entry != nullptr) {
        std::cout << "symtab_entry: <'" << symtab_entry.get() << "': ";
        if (symtab_entry->sig != "") std::cout << "sig: '" << symtab_entry->sig << "' ";
        if (symtab_entry->type != "") std::cout << "type: '" << symtab_entry->type << "'";
        std::cout << "> ";
    }
    std::cout << "}" << std::endl;

    for (auto x : children)
        x->print(num_tabs+1);
}

ASTNodeCollection::ASTNodeCollection() {
    ;
}
void ASTNodeCollection::AddNode(ASTNode* _node) {
    nodes.push_back(_node);
}