#include "ast.hpp"
#include <iostream>

using namespace std;

ASTNode::ASTNode() {
    lineno = 0;
}

ASTNode::~ASTNode() {
    ;
}

// Print contents of ASTNode.
void ASTNode::print() {
    int num_tabs = 0;
    if (type != "")
    {
        cout << type  << " {'type': '" << type << "'";
        
        if (lineno > 0){
            cout << ", 'lineno': '" << lineno << "'";
        }
        
        if (attr != "") {
             cout << ", 'attr': '" << attr << "'";
        }
        cout << "}" << endl;

        for (auto x : children) {
            x.print(num_tabs+1);
        }
    }
}

// Print contents of ASTNode, preceeded by num_tabs instances of '\t'.
void ASTNode::print(int num_tabs)
{
    if (type != "")
    {
        for (int i = 0; i < num_tabs; i++)
            cout << '\t';

        cout << type  << " {'type': '" << type << "'";

        if (lineno > 0){
            cout << ", 'lineno': '" << lineno << "'";
        }
        
        if (attr != "") {
             cout << ", 'attr': '" << attr << "'";
        }

        cout << "}" << endl;

        for (auto x : children) {
            x.print(num_tabs+1);
        }
    }
}