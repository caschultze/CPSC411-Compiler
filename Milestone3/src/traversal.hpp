#ifndef TRAVERSAL_HPP
#define TRAVERSAL_HPP

#include "ast.hpp"

class Traversal {
    public:
        Traversal() {}
        void traverse(ASTNode*);

    private:
        void postorder(ASTNode*, void(*)());
        void prepostorder(ASTNode*, void(*)(), void(*)());
        static void cb_1();
        static void cb_2();
};

#endif