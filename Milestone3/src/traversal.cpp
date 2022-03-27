#include <iostream>
#include <memory>

#include "traversal.hpp"

Traversal::Traversal (ASTNode* _root) {
    root = _root;
}

// Initialize static variables.
int Traversal::mainDecl_count;
std::vector<std::string> Traversal::synthesized_sig;

std::stack<SymTab> Traversal::scope_stack;


void Traversal::pushPreDefinedNames() {
    scope_stack.push(SymTab());

    scope_stack.top()["getchar"] = std::make_shared<SymTabEntry>();
    scope_stack.top()["getchar"]->type = "int";
    scope_stack.top()["getchar"]->sig = "f()";

    scope_stack.top()["halt"] = std::make_shared<SymTabEntry>();
    scope_stack.top()["halt"]->type = "void";
    scope_stack.top()["halt"]->sig = "f()";

    scope_stack.top()["printb"] = std::make_shared<SymTabEntry>();
    scope_stack.top()["printb"]->type = "void";
    scope_stack.top()["printb"]->sig = "f(boolean)";

    scope_stack.top()["printc"] = std::make_shared<SymTabEntry>();
    scope_stack.top()["printc"]->type = "void";
    scope_stack.top()["printc"]->sig = "f(int)";

    scope_stack.top()["printi"] = std::make_shared<SymTabEntry>();
    scope_stack.top()["printi"]->type = "void";
    scope_stack.top()["printi"]->sig = "f(int)";

    scope_stack.top()["prints"] = std::make_shared<SymTabEntry>();
    scope_stack.top()["prints"]->type = "void";
    scope_stack.top()["prints"]->sig = "f(string)";
}

bool Traversal::existsOnTOS(std::string name, int err_lineno) {
    if ( Traversal::scope_stack.top().find(name) !=  Traversal::scope_stack.top().end() ) {
        std::cerr << "Semantic error: '" << name << "' redefined at line " << err_lineno << std::endl;
        exit(1);
    }
    return false;
}


// bool Traversal::existsInScopeStack(std::string name) {
//     auto clone = Traversal::scope_stack;
//     while (!clone.empty()) {
//         if (clone.top().find(name) != clone.top().end()) {
//             return true;
//         }
//         clone.pop();
//     }
//     // std::cerr << "Semantic error: name is undefined - \'" << name << "\'" << std::endl;
//     // exit(1);
//     return false;
// }


void Traversal::traverse() {

    // Populate scope_stack with predefined IDs.
    pushPreDefinedNames();

    // // Print predefined signatures on top of scope stack.
    // while (!Traversal::scope_stack.empty()) {
    //     for (auto const &pair: Traversal::scope_stack.top()) {
    //         std::cout << "{" << pair.first << ": " << pair.second->at("sig") << "}\n";
    //     }
    //     Traversal::scope_stack.pop();
    // }

    // // Check if a name exists on top of scope stack.
    // if (Traversal::nameDoesNotExistInTopOfScopeStack("prints")) {
    //     std::cout << "found prints" << std::endl;
    // } else {
    //     std::cout << "failed to find prints" << std:: endl;
    // }
    
    // // Check if a name exists in scope stack.
    // if (Traversal::existsInScopeStack("prints2")) {
    //     std::cout << "found prints" << std::endl;
    // } else {
    //     std::cout << "failed to find prints" << std:: endl;
    // }

    firstTraversal();

    // TODO: Second traversal
    // TODO: Third traversal
    // TODO: Fourth traversal

    // // Sample code to reference a Node's STab reference.
    // ASTNode* x = new ASTNode("hello");
    // x->sym_table_entry = scope_stack.top()["getchar"];
    // //std:: cout << x->sym_table_entry->at("sig") << std::endl;
    // //std:: cout << scope_stack.top()["getchar"]->at("sig") << std::endl;
    // std::cout << x->sym_table_entry.get() << std::endl;
    // std::cout << scope_stack.top()["getchar"].get() << std::endl;
    // while (!scope_stack.empty()) {
    //     scope_stack.pop();
    // }
    // //std:: cout << x->sym_table_entry->at("sig") << std::endl;
    // //std:: cout << scope_stack.top()["getchar"]->at("sig") << std::endl;
    // std::cout << x->sym_table_entry.get() << std::endl;
    // std::cout << scope_stack.top()["getchar"].get() << std::endl;

}

void Traversal::firstTraversal() {
    scope_stack.push(SymTab());
    postorder(root, pass1_cb);
    if (Traversal::mainDecl_count == 0) {std::cerr << "Semantic error: no main declaration" << std::endl; exit(1); }
    if (Traversal::mainDecl_count > 1) {std::cerr << "Semantic error: multiple main declarations" << std::endl; exit(1); }
}

void Traversal::postorder(ASTNode* node, void(*callback)(ASTNode*)) {
    
    if (node == nullptr) {
        return;
    }
    for (size_t i = 0; i < node->children.size(); i++) {
        postorder(node->children[i], pass1_cb);
    }
    callback(node);
}



// void Traversal::prepostorder(ASTNode* node, void(*callback1)(ASTNode*), void(*callback2)(ASTNode*)) {
//     if (node == nullptr) {
//         return;
//     }
//     callback1(node);
//     for (size_t i = 0; i < node->children.size(); i++) {
//         prepostorder(node->children[i], pass1_cb, pass1_cb);
//     }
//     callback2(node);
// }

void Traversal::pass1_cb(ASTNode* node) {

    if (node->type == "formal") {
        for (size_t i = 0; i < node->children.size(); i++) {
            if (node->children[i]->type == "int" || node->children[i]->type == "bool" || node->children[i]->type == "void") {
                synthesized_sig.push_back(node->children[i]->type);
            }
        }
    }
    else if (node->type == "mainDecl") {
        Traversal::mainDecl_count++;

        ASTNode* _id_child;
        std::string _return_type;
        std::string _sig;

        for (size_t i = 0; i < node->children.size(); i++) {
            if (node->children[i]->type == "int" || node->children[i]->type == "bool" || node->children[i]->type == "void") {
                _return_type = node->children[i]->type;
            }
            if (node->children[i]->type == "id") {
                _id_child = node->children[i];
            }
            if (node->children[i]->type == "formals") {
                _sig = "f(";
                bool first = true;
                for (size_t j = 0; j < Traversal::synthesized_sig.size(); j++) {
                    if (!first) _sig.append(",");
                    _sig.append(Traversal::synthesized_sig[j]);
                    first = false;
                }
                _sig.append(")");
                synthesized_sig.clear();
            }
        }

        if (!existsOnTOS(_id_child->attr, _id_child->lineno)) {
            scope_stack.top()[_id_child->attr] = std::make_shared<SymTabEntry>();
            scope_stack.top()[_id_child->attr]->type = _return_type;
            scope_stack.top()[_id_child->attr]->sig = _sig;
        }
        _id_child->symtab_entry = scope_stack.top()[_id_child->attr];
    }
    else if (node->type == "globVarDecl") {
        ASTNode* _id_child;
        std::string _type;

        for (size_t i = 0; i < node->children.size(); i++) {
            if (node->children[i]->type == "int" || node->children[i]->type == "bool" || node->children[i]->type == "void") {
                _type = node->children[i]->type;
            }
            if (node->children[i]->type == "id") {
                _id_child = node->children[i];
            }
        }

        if (!existsOnTOS(_id_child->attr, _id_child->lineno)) {
            scope_stack.top()[_id_child->attr] = std::make_shared<SymTabEntry>();
            scope_stack.top()[_id_child->attr]->type = _type;
        }
        _id_child->symtab_entry = scope_stack.top()[_id_child->attr];
    }
    else if (node->type == "funcDecl") {
        ASTNode* _id_child;
        std::string _return_type;
        std::string _sig;

        for (size_t i = 0; i < node->children.size(); i++) {
            if (node->children[i]->type == "int" || node->children[i]->type == "bool" || node->children[i]->type == "void") {
                _return_type = node->children[i]->type;
            }
            if (node->children[i]->type == "id") {
                _id_child = node->children[i];
            }
            if (node->children[i]->type == "formals") {
                _sig = "f(";
                bool first = true;
                for (size_t j = 0; j < Traversal::synthesized_sig.size(); j++) {
                    if (!first) _sig.append(",");
                    _sig.append(Traversal::synthesized_sig[j]);
                    first = false;
                }
                _sig.append(")");
                synthesized_sig.clear();
            }
        }

        if (!existsOnTOS(_id_child->attr, _id_child->lineno)) {
            scope_stack.top()[_id_child->attr] = std::make_shared<SymTabEntry>();
            scope_stack.top()[_id_child->attr]->type = _return_type;
            scope_stack.top()[_id_child->attr]->sig = _sig;
        }
        _id_child->symtab_entry = scope_stack.top()[_id_child->attr];
    }
    else if (node->type == "program") {
        scope_stack.top()["$"] = std::make_shared<SymTabEntry>();
        scope_stack.top()["$"]->sig = "$";
        node->symtab_entry = scope_stack.top()["$"];
    }
}


// void Traversal::pass2_cb(ASTNode* node) {
//      std::cout << "Hello cb2!" << std::endl;
//      // switch (node->type) {
//     //     default: 
//     //         ;
//     // }
// }
// void Traversal::pass3_cb(ASTNode* node) {
//     std::cout << "Hello cb3!" << std::endl;
//     // switch (node->type) {
//     //     default: 
//     //         ;
//     // }
// }
// void Traversal::pass4_cb(ASTNode* node) {
//     std::cout << "Hello cb4!" << std::endl;
//     // switch (node->type) {
//     //     default: 
//     //         ;
//     // }
// }

