#ifndef AST_HPP
#define AST_HPP

#include <iostream>
#include <vector>
#include <string>

using namespace std;

// Base class for other AST nodes.
// type = the type of grammar rule that has been matched.
// lineno = the line of source code that the grammar rule matched to.
// attr = the value of the type (only applies to leaf nodes).

class ASTNode {
    public:
        vector<ASTNode>* children;
        string type;
        string attr;

        ASTNode();
        ~ASTNode();
        virtual void print();                 
};

// RootNode extends ASTNode. It is used excusively when the start rule is matched.
class RootNode : public ASTNode {
    //void print();
    //vector<ASTNode> children;
};
// void RootNode::print() {
//     cout<<type<<" {"<<"'type': '"<<type<<"'}"<<endl; 
// }


class ExpressionNode : public ASTNode {

};

class StatementNode : public ASTNode {
    public:
        string type;
        vector<ASTNode> children;
        void print();
};

class DeclarationNode : public ASTNode {
    public:
        string type;
        vector<ASTNode> children;
        DeclarationNode(string t): type(t) {};
        void print();
};

class LeafNode : public ASTNode {
    public:
        string type;
        string attr;
        LeafNode(string t, string a): type(t), attr(a) {};
        void print();
};

#endif