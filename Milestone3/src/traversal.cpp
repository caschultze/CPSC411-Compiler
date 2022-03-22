#include <iostream>
#include <memory>

#include "traversal.hpp"

bool Traversal::nameExistsInCurrentScope(std::string name) {
    if (scope_stack.top().find(name) != scope_stack.top().end()) {
        return false;
    }
    std::cerr << "Semantic error: name is already defined in scope - \'" << name << "\'" << std::endl;
    exit(1);
}

// Checks scope stack for a symbol table key that matches the given name.
bool Traversal::nameExistsInScopeStack(std::string name) {
    auto clone = scope_stack;
    while (!clone.empty()) {
        if (clone.top().find(name) != clone.top().end()) {
            // TODO: figure out what to do when name has been found.
            return true;
        }
        clone.pop();
    }
    std::cerr << "Semantic error: name is undefined - \'" << name << "\'" << std::endl;
    exit(1);
}

void Traversal::pushPreDefinedNames() {

    std::unordered_map<std::string, std::shared_ptr<std::unordered_map<std::string, std::string>>> scope;
    std::unordered_map<std::string, std::string> scope_entry;

    scope_entry["attr"] = "getchar";
    scope_entry["sig"] = "f()";
    scope_entry["type"] = "id";
    scope["getchar"] = std::make_shared<std::unordered_map<std::string, std::string>>(scope_entry);
    scope_entry.clear();

    scope_entry["attr"] = "halt";
    scope_entry["sig"] = "f()";
    scope_entry["type"] = "id";
    scope["halt"] = std::make_shared<std::unordered_map<std::string, std::string>>(scope_entry);
    scope_entry.clear();

    scope_entry["attr"] = "printb";
    scope_entry["sig"] = "f(boolean)";
    scope_entry["type"] = "id";
    scope["printb"] = std::make_shared<std::unordered_map<std::string, std::string>>(scope_entry);
    scope_entry.clear();

    scope_entry["attr"] = "printc";
    scope_entry["sig"] = "f(int)";
    scope_entry["type"] = "id";
    scope["printc"] = std::make_shared<std::unordered_map<std::string, std::string>>(scope_entry);
    scope_entry.clear();

    scope_entry["attr"] = "printi";
    scope_entry["sig"] = "f(int)";
    scope_entry["type"] = "id";
    scope["printi"] = std::make_shared<std::unordered_map<std::string, std::string>>(scope_entry);
    scope_entry.clear();

    scope_entry["attr"] = "prints";
    scope_entry["sig"] = "f(string)";
    scope_entry["type"] = "id";
    scope["prints"] = std::make_shared<std::unordered_map<std::string, std::string>>(scope_entry);
    scope_entry.clear();

    scope_stack.push(scope);

}


Traversal::Traversal (ASTNode* _root) {
    root = _root;
}


void Traversal::traverse() {

    // Populate scope_stack with predefined IDs.
    pushPreDefinedNames();

    // First traversal
    // Second traversal
    // Third traversal
    // Fourth traversal

    // postorder(root, pass1_cb);

    // Sample code to reference a Node's STab reference.
    // ASTNode* x = new ASTNode("hello");
    // x->sym_table_entry = scope_stack.top()["getchar"];
    // //std:: cout << x->sym_table_entry->at("attr") << std::endl;
    // //std:: cout << scope_stack.top()["getchar"]->at("attr") << std::endl;
    // // std::cout << x->sym_table_entry.get() << std::endl;
    // // std::cout << scope_stack.top()["getchar"].get() << std::endl;
    // while (!scope_stack.empty()) {
    //     scope_stack.pop();
    // }
    // //std:: cout << x->sym_table_entry->at("attr") << std::endl;
    // //std:: cout << scope_stack.top()["getchar"]->at("attr") << std::endl;
    // // std::cout << x->sym_table_entry.get() << std::endl;
    // // std::cout << scope_stack.top()["getchar"].get() << std::endl;

    

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


