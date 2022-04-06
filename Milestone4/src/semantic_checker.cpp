#include "semantic_checker.hpp"
#include "traversal.hpp"
#include <iostream>
#include <memory>


JMM::SemanticChecker::SemanticChecker(ASTNode* _root) {
    root = _root;
}
JMM::SemanticChecker::~SemanticChecker() {
    delete root;
}

bool JMM::SemanticChecker::check() {

    std::unique_ptr<Traversal> t = std::make_unique<Traversal>(root);
    t->traverse();

    return true;
}

bool JMM::SemanticChecker::gen() {

    std::unique_ptr<Traversal> t = std::make_unique<Traversal>(root);
    t->gen();

    return true;
}

