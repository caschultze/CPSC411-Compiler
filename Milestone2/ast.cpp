#include "ast.hpp"
#include <iostream>

using namespace std;

ASTNode::ASTNode()
{
    // cout << "ASTNode constructor: hello" << endl;
}

ASTNode::~ASTNode() 
{
    // cout << "hi ASTNode destructor: hello" << endl;
}

void ASTNode::print()
{
    cout << "ASTNode print: hello" << endl;
}

void DeclarationNode::print()
{
    cout << type << " {'type': '" << type << "'}" << endl;
    for (auto x : children) {
        x.print();
    }
};

void LeafNode::print()
{
    cout << type << " {'type': '" << type << "', 'attr': '" << attr << "'}" << endl;
};
