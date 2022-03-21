#include "semantic_checker.hpp"
#include "traversal.hpp"

#include <iostream>

bool JMM::SemanticChecker::check() {

    Traversal* t = new Traversal();
    t->traverse(root);

    return 0;
}

void JMM::SemanticChecker::setRoot(ASTNode* _root) {
    root = _root;
}

