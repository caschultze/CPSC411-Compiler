#include <iostream>
#include <memory>

#include "traversal.hpp"

Traversal::Traversal (ASTNode* _root) {
    root = _root;
}

// Initialize static variables.
int Traversal::mainDecl_count;
std::unordered_map<std::string, std::string> Traversal::scope_entry;
std::unordered_map<std::string, std::shared_ptr<std::unordered_map<std::string, std::string>>> Traversal::scope;
std::stack<std::unordered_map<std::string, std::shared_ptr<std::unordered_map<std::string, std::string>>>> Traversal::scope_stack;
ASTNode* Traversal::id_node_ptr;
std::vector<std::string> Traversal::synth_attributes;
std::vector<std::string> Traversal::synth_func_sig;


void Traversal::pushPreDefinedNames() {

    Traversal::scope_entry["sig"] = "f()";
    Traversal::scope_entry["return_type"] = "int";
    Traversal::scope["getchar"] = std::make_shared<std::unordered_map<std::string, std::string>>(Traversal::scope_entry);
    Traversal::scope_entry.clear();

    Traversal::scope_entry["sig"] = "f()";
    Traversal::scope_entry["return_type"] = "void";
    Traversal::scope["halt"] = std::make_shared<std::unordered_map<std::string, std::string>>(Traversal::scope_entry);
    Traversal::scope_entry.clear();

    Traversal::scope_entry["sig"] = "f(boolean)";
    Traversal::scope_entry["return_type"] = "void";
    Traversal::scope["printb"] = std::make_shared<std::unordered_map<std::string, std::string>>(Traversal::scope_entry);
    Traversal::scope_entry.clear();

    Traversal::scope_entry["sig"] = "f(int)";
    Traversal::scope_entry["return_type"] = "void";
    Traversal::scope["printc"] = std::make_shared<std::unordered_map<std::string, std::string>>(Traversal::scope_entry);
    Traversal::scope_entry.clear();

    Traversal::scope_entry["sig"] = "f(int)";
    Traversal::scope_entry["return_type"] = "void";
    Traversal::scope["printi"] = std::make_shared<std::unordered_map<std::string, std::string>>(Traversal::scope_entry);
    Traversal::scope_entry.clear();

    Traversal::scope_entry["sig"] = "f(string)";
    Traversal::scope_entry["return_type"] = "void";
    Traversal::scope["prints"] = std::make_shared<std::unordered_map<std::string, std::string>>(Traversal::scope_entry);
    Traversal::scope_entry.clear();

    Traversal::scope_stack.push(Traversal::scope);

}

bool Traversal::doesNotExistInTopOfScopeStack(std::string name) {
    if ( Traversal::scope_stack.top().find(name) ==  Traversal::scope_stack.top().end() ) {
        return false;
        // std::cerr << "Semantic error: name is already defined in scope - \'" << name << "\'" << std::endl;
        // exit(1);
    }
    return true;
}

bool Traversal::doesNotExistInCurrentScope(std::string name) {
    if ( Traversal::scope.find(name) != Traversal::scope.end() ) {
        return false;
    }
    return true;
}

bool Traversal::existsInScopeStack(std::string name) {
    auto clone = Traversal::scope_stack;
    while (!clone.empty()) {
        if (clone.top().find(name) != clone.top().end()) {
            return true;
        }
        clone.pop();
    }
    // std::cerr << "Semantic error: name is undefined - \'" << name << "\'" << std::endl;
    // exit(1);
    return false;
}


void Traversal::traverse() {

    // Populate scope_stack with predefined IDs.
    Traversal::pushPreDefinedNames();

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

    // First traversal.
    Traversal::scope.clear();
    postorder(root, pass1_cb);
    if (Traversal::mainDecl_count == 0) {std::cerr << "Semantic error: no main declaration" << std::endl; exit(1); }
    if (Traversal::mainDecl_count > 1) {std::cerr << "Semantic error: multiple main declarations" << std::endl; exit(1); }

    // Second traversal
    // Third traversal
    // Fourth traversal

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
    if (node->type == "int" || node->type == "bool" || node->type == "void") {
        node->sig = node->type;
        Traversal::synth_attributes.push_back(node->type);
    }
    else if (node->type == "id") {
        Traversal::synth_attributes.push_back(node->attr);
        Traversal::id_node_ptr = node;
    }
    else if (node->type == "formal") {
        // todo: lookup if an entry already exists in scope
        std::string formal_id = Traversal::synth_attributes.end()[-1];
        std::string formal_type = Traversal::synth_attributes.end()[-2];

        node->sig = formal_type;

        Traversal::synth_func_sig.push_back(formal_type);

        Traversal::scope_entry["sig"] = formal_type;
        Traversal::scope[formal_id] = std::make_shared<std::unordered_map<std::string, std::string>>(Traversal::scope_entry);
        Traversal::scope_entry.clear();

        Traversal::id_node_ptr->sym_table_entry = Traversal::scope[formal_id];
        Traversal::id_node_ptr->sig = Traversal::scope[formal_id]->at("sig");

        Traversal::id_node_ptr = nullptr;
        Traversal::synth_attributes.clear();
    }
    else if (node->type == "mainDecl") {
        Traversal::mainDecl_count++;

        std::string mainDecl_id = Traversal::synth_attributes.end()[-1];
        std::string mainDecl_return_type = Traversal::synth_attributes.end()[-2];
        std::string mainDecl_sig = "f(";
        bool first = true;
        for (size_t i = 0; i < Traversal::synth_func_sig.size(); i++) {
            if (!first) mainDecl_sig.append(",");
            mainDecl_sig.append(Traversal::synth_func_sig[i]);
        }
        mainDecl_sig.append(")");

        Traversal::scope_entry["return_type"] = mainDecl_return_type;
        Traversal::scope_entry["sig"] = mainDecl_sig;

        if (Traversal::doesNotExistInCurrentScope(id_node_ptr->attr)) {
            Traversal::scope[id_node_ptr->attr] = std::make_shared<std::unordered_map<std::string, std::string>>(Traversal::scope_entry);
            Traversal::scope_entry.clear();
        } else {
            std::cerr << "Semantic error: '" << id_node_ptr->attr << "' redefined at line " << id_node_ptr->lineno << std::endl;
            exit(1);
        }

        Traversal::id_node_ptr->sym_table_entry = Traversal::scope[mainDecl_id];
        Traversal::id_node_ptr->sig = Traversal::scope[mainDecl_id]->at("sig");
        Traversal::id_node_ptr->return_type = Traversal::scope[mainDecl_id]->at("return_type");

        Traversal::id_node_ptr = nullptr;
        Traversal::synth_attributes.clear();
    }
    else if (node->type == "globVarDecl") {
        std::string globVarDecl_id = Traversal::synth_attributes.end()[-1];
        std::string globVarDecl_type = Traversal::synth_attributes.end()[-2];

        Traversal::scope_entry["sig"] = globVarDecl_type;
        if (Traversal::doesNotExistInCurrentScope(id_node_ptr->attr)) {
            Traversal::scope[id_node_ptr->attr] = std::make_shared<std::unordered_map<std::string, std::string>>(Traversal::scope_entry);
            Traversal::scope_entry.clear();
        } else {
            std::cerr << "Semantic error: '" << id_node_ptr->attr << "' redefined at line " << id_node_ptr->lineno << std::endl;
            exit(1);
        }

        Traversal::id_node_ptr->sym_table_entry = Traversal::scope[globVarDecl_id];
        Traversal::id_node_ptr->sig = scope[globVarDecl_id]->at("sig");

        Traversal::id_node_ptr = nullptr;
        Traversal::synth_attributes.clear();
        Traversal::synth_func_sig.clear();
    }
    else if (node->type == "funcDecl") {
        std::string funcDecl_id = Traversal::synth_attributes.end()[-1];
        std::string funcDecl_return_type = Traversal::synth_attributes.end()[-2];
        std::string funcDecl_sig = "f(";
        bool first = true;
        for (size_t i = 0; i < Traversal::synth_func_sig.size(); i++) {
            if (!first) funcDecl_sig.append(",");
            funcDecl_sig.append(Traversal::synth_func_sig[i]);
        }
        funcDecl_sig.append(")");

        Traversal::scope_entry["return_type"] = funcDecl_return_type;
        Traversal::scope_entry["sig"] = funcDecl_sig;

        if (Traversal::doesNotExistInCurrentScope(id_node_ptr->attr)) {
            Traversal::scope[id_node_ptr->attr] = std::make_shared<std::unordered_map<std::string, std::string>>(Traversal::scope_entry);
            Traversal::scope_entry.clear();
        } else {
            std::cerr << "Semantic error: '" << id_node_ptr->attr << "' redefined at line " << id_node_ptr->lineno << std::endl;
            exit(1);
        }

        Traversal::id_node_ptr->sym_table_entry = Traversal::scope[funcDecl_id];
        Traversal::id_node_ptr->sig = Traversal::scope[funcDecl_id]->at("sig");
        Traversal::id_node_ptr->return_type = Traversal::scope[funcDecl_id]->at("return_type");

        Traversal::id_node_ptr = nullptr;
        Traversal::synth_attributes.clear();
        Traversal::synth_func_sig.clear();
    }
    else if (node->type == "program") {
        Traversal::scope_entry["$"] = "$";

        Traversal::scope["$"] = std::make_shared<std::unordered_map<std::string, std::string>>(Traversal::scope_entry);
        Traversal::scope_entry.clear();

        node->sym_table_entry = Traversal::scope["$"];
        Traversal::scope_stack.push(Traversal::scope);
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

