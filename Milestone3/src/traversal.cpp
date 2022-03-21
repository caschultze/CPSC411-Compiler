#include <iostream>

#include "traversal.hpp"

void Traversal::traverse(ASTNode* root) {
    postorder(root, cb_1);
}

void Traversal::postorder(ASTNode* node, void(*callback)()) {
    
    if (node == nullptr) {
        return;
    }
    // Traverse to children.
    for (size_t i = 0; i < node->children.size(); i++) {
        postorder(node->children[i], cb_2);
    }
    // Action to take after traversing.
    // std::cout << node->type << std::endl;
    callback();
}

void Traversal::prepostorder(ASTNode* node, void(*preorder_cb)(), void(*postorder_cb)()) {
    if (node == nullptr) {
        return;
    }

    // Action to take before traversing.
    preorder_cb();
    
    // Traverse to children.
    for (size_t i = 0; i < node->children.size(); i++) {
        prepostorder(node->children[i], cb_2, cb_2);
    }

    // Action to take after traversing.
    postorder_cb();
}

void Traversal::cb_1() {
    std::cout << "Hello cb1!" << std::endl;
}
void Traversal::cb_2() {
     std::cout << "Hello cb2!" << std::endl;
}





// void Traversal::postorder(ASTNode* node) {
//     if (node == nullptr) {
//         return;
//     }

//     // Traverse to children.
//     for (size_t i = 0; i < node->children.size(); i++) {
//         postorder(node->children[i]);
//     }

//     // Action to take after traversing.
//     std::cout << node->type << std::endl;
// }

// void Traversal::preorder(ASTNode* node) {
//     if (node == nullptr) {
//         return;
//     }

//     // Action to take before traversing.
//     std::cout << node->type << std::endl;

//     // Traverse to children.
//     for (size_t i = 0; i < node->children.size(); i++) {
//         preorder(node->children[i]);
//     }
// }


