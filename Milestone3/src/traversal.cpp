#include <iostream>

#include "traversal.hpp"

Traversal::Traversal (ASTNode* _root) {
    root = _root;

    pushPredefinedIds();
}

void Traversal::pushPredefinedIds() {
    // unordered_map<std::string, unordered_map<std::string, std::string>> sym_table;

    // unordered_map<std::string, std::string> entry;
    // entry["attr"] = "getchar";
    // // entry["sym"] = ???
    // entry["sig"] = "f(int)"
    // //sym_table["getchar"] = 
    // // sym_table["halt"] = 
    // // sym_table["printb"] = 
    // // sym_table["printc"] = 
    // // sym_table["printi"] = 
    // // sym_table["prints"] = 

    // scope_stack.push(sym_table);
}

void Traversal::traverse() {

    // Populate scope_stack with predefined IDs.

    // First traversal
    // Second traversal
    // Third traversal
    // Fourth traversal

    postorder(root, pass1_cb);
}

void Traversal::postorder(ASTNode* node, void(*callback)(ASTNode*)) {
    
    if (node == nullptr) {
        return;
    }
    // Traverse to children.
    for (size_t i = 0; i < node->children.size(); i++) {
        postorder(node->children[i], pass1_cb);
    }
    // Action to take after traversing.
    callback(node);
}

void Traversal::prepostorder(ASTNode* node, void(*callback1)(ASTNode*), void(*callback2)(ASTNode*)) {
    if (node == nullptr) {
        return;
    }

    // Action to take before traversing.
    callback1(node);
    
    // Traverse to children.
    for (size_t i = 0; i < node->children.size(); i++) {
        prepostorder(node->children[i], pass1_cb, pass1_cb);
    }

    // Action to take after traversing.
    callback2(node);
}

void Traversal::pass1_cb(ASTNode* node) {
    std::cout << "Hello cb1!" << std::endl;
    // switch (node->type) {
    //     default: 
    //         ;
    // }
}
void Traversal::pass2_cb(ASTNode* node) {
     std::cout << "Hello cb2!" << std::endl;
     // switch (node->type) {
    //     default: 
    //         ;
    // }
}
void Traversal::pass3_cb(ASTNode* node) {
    std::cout << "Hello cb3!" << std::endl;
    // switch (node->type) {
    //     default: 
    //         ;
    // }
}
void Traversal::pass4_cb(ASTNode* node) {
    std::cout << "Hello cb4!" << std::endl;
    // switch (node->type) {
    //     default: 
    //         ;
    // }
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


