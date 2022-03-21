#include <iostream>

#include "traversal.hpp"

// Checks the scope stack for a symbol table key that matches the given name.
// Returns false when the name is not found.
bool Traversal::lookupName(std::string name) {

    std::stack<std::unordered_map<std::string, std::unordered_map<std::string, std::string>>> clone = scope_stack;

    while (!clone.empty()) {
        if (clone.top().find(name) != clone.top().end()) {
            return 0;
        }
        clone.pop();
    }
    return 1;
}

void Traversal::pushPredefinedIds() {
    unordered_map<std::string, unordered_map<std::string, std::string>> sym_table;
    unordered_map<std::string, std::string> entry;

    //TODO: figure out how 'sym' from reference compiler is integrated.

    entry["attr"] = "getchar";
    entry["sig"] = "f()";
    entry["type"] = "id";
    sym_table["getchar"] = entry;
    entry.clear();

    entry["attr"] = "halt";
    entry["sig"] = "f()";
    entry["type"] = "id";
    sym_table["halt"] = entry;
    entry.clear();

    entry["attr"] = "printb";
    entry["sig"] = "f(boolean)";
    entry["type"] = "id";
    sym_table["printb"] = entry;
    entry.clear();

    entry["attr"] = "printc";
    entry["sig"] = "f(int)";
    entry["type"] = "id";
    sym_table["printc"] = entry;
    entry.clear();

    entry["attr"] = "printi";
    entry["sig"] = "f(int)";
    entry["type"] = "id";
    sym_table["halt"] = entry;
    entry.clear();

    entry["attr"] = "prints";
    entry["sig"] = "f(string)";
    entry["type"] = "id";
    sym_table["prints"] = entry;
    entry.clear();

    scope_stack.push(sym_table);
}


Traversal::Traversal (ASTNode* _root) {
    root = _root;
}


void Traversal::traverse() {

    // Populate scope_stack with predefined IDs.
    pushPredefinedIds();

    // First traversal
    // Second traversal
    // Third traversal
    // Fourth traversal

    // postorder(root, pass1_cb);
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


