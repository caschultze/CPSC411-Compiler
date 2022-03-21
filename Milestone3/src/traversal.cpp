#include <iostream>

#include "traversal.hpp"

// Check top of scope stack for a symbol table key that matches the given name.
// Returns true when key is found.
// TODO: error when name is already defined
bool Traversal::isDefinedInTopScope(std::string name) {
    if (scope_stack.top().find(name) != scope_stack.top().end()) {
        return 0;
    }
    return 1;
}

// Check scope stack for a symbol table key that matches the given name.
// Returns true when key is found.
// TODO: error when name is not found
bool Traversal::isUndefinedInAllScopes(std::string name) {

    std::stack<std::unordered_map<std::string, std::unordered_map<std::string, std::string>>> clone = scope_stack;

    while (!clone.empty()) {
        if (clone.top().find(name) != clone.top().end()) {
            return 1;
        }
        clone.pop();
    }
    return 0;
}


// TODO:
// When creating an STab entry for an ASTNode, 
//     Ensure the ASTNode with the given 'id' has the stab pointer stored to property "sym_table_entry".
// Make sure that the record (the STab entry) can be access without issue, even after it has been popped from the scope stack.


void Traversal::pushPredefinedIds() {
    // unordered_map<std::string, std::unique_ptr<unordered_map<std::string, std::string>>> sym_table;
    // std::unique_ptr<unordered_map<std::string, std::string>> entry



    // sym_table["getchar"] = entry;

    unordered_map<std::string, unordered_map<std::string, std::string>> sym_table;
    unordered_map<std::string, std::string> entry;

    entry["attr"] = "getchar";
    entry["sig"] = "f()";
    entry["type"] = "id";
    sym_table["getchar"] = entry;
    entry.clear();
    std::cout << sym_table["getchar"]["attr"] << std::endl;

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


    // When I an obj pop from the stack, the reference for its pointer is deleted.
    // I need to make sure to keep a copy of it.
    ASTNode* x = new ASTNode("hello");
    x->sym_table_entry = &scope_stack.top()["getchar"];

    std:: cout << x->sym_table_entry << std::endl;
    std:: cout << (*x->sym_table_entry)["attr"] << std::endl;

    while (!scope_stack.empty()) {

        scope_stack.pop();
    }

    std:: cout << (*x->sym_table_entry)["attr"] << std::endl;

    // ASTNode* x = new ASTNode("hello");
    // x->sym = &scope_stack.top()["getchar"];

    // std:: cout << x->sym_table_entry << std::endl;
    // std:: cout << (*x->sym_table_entry)["attr"] << std::endl;

    // while (!scope_stack.empty()) {

    //     scope_stack.pop();
    // }

    // std:: cout << (*x->sym_table_entry)["attr"] << std::endl;
    
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


