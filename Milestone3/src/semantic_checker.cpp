#include "semantic_checker.hpp"

#include "traversal.hpp"

bool JMM::SemanticChecker::check() {

    Traversal* t = new Traversal();

    t->preorder(root);

    return 0;
}

void JMM::SemanticChecker::setRoot(ASTNode* _root) {
    root = _root;
}
