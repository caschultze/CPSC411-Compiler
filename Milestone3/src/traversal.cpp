#include <iostream>

#include "ast.hpp"
#include "traversal.hpp"



void Traversal::postorder(ASTNode* node) {
    if (node == nullptr) {
        return;
    }

    for (size_t i = 0; i < node->children.size(); i++) {
        postorder(node->children[i]);
    }

    std::cout << node->type << std::endl;
}

void Traversal::preorder(ASTNode* node) {
    if (node == nullptr) {
        return;
    }

    std::cout << node->type << std::endl;

    for (size_t i = 0; i < node->children.size(); i++) {
        preorder(node->children[i]);
    }
}
