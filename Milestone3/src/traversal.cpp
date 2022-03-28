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
    scope_stack.top()["getchar"]->sig = "f()";
    scope_stack.top()["getchar"]->return_type = "int";

    scope_stack.top()["halt"] = std::make_shared<SymTabEntry>();
    scope_stack.top()["halt"]->sig = "f()";
    scope_stack.top()["halt"]->return_type = "void";

    scope_stack.top()["printb"] = std::make_shared<SymTabEntry>();
    scope_stack.top()["printb"]->sig = "f(boolean)";
    scope_stack.top()["printb"]->return_type = "void";

    scope_stack.top()["printc"] = std::make_shared<SymTabEntry>();
    scope_stack.top()["printc"]->sig = "f(int)";
    scope_stack.top()["printc"]->return_type = "void";

    scope_stack.top()["printi"] = std::make_shared<SymTabEntry>();
    scope_stack.top()["printi"]->sig = "f(int)";
    scope_stack.top()["printi"]->return_type = "void";

    scope_stack.top()["prints"] = std::make_shared<SymTabEntry>();
    scope_stack.top()["prints"]->sig = "f(string)";
    scope_stack.top()["prints"]->return_type = "void";
}

bool Traversal::existsOnTOS(std::string name, int err_lineno) {
    if ( Traversal::scope_stack.top().find(name) !=  Traversal::scope_stack.top().end() ) {
        std::cerr << "Semantic error: '" << name << "' redefined at line " << err_lineno << std::endl;
        exit(1);
    }
    return false;
}

std::shared_ptr<SymTabEntry> Traversal::getSymTabEntryFromStack(std::string name, int lineno) {
    auto clone = Traversal::scope_stack;

    while (!clone.empty()) {
        if (clone.top().find(name) != clone.top().end()) {
            return clone.top().find(name)->second;
        }
        clone.pop();
    }

    std::cerr << "Semantic error: undefined name '" << name << "' at or near line " << lineno << std::endl;
    exit(1);
}


void Traversal::traverse() {
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

    pushPreDefinedNames();
    firstTraversal();
    secondTraversal();
    thirdTraversal();
}

void Traversal::firstTraversal() {
    // Global declarations.
    scope_stack.push(SymTab());
    postOrder(root, pass1_cb);
    if (mainDecl_count == 0) {std::cerr << "Semantic error: no main declaration" << std::endl; exit(1); }
    if (mainDecl_count > 1) {std::cerr << "Semantic error: multiple main declarations" << std::endl; exit(1); }

}

void Traversal::secondTraversal() {
    // Id idenfitication.
    prePostOrder(root, pass2a_cb, pass2b_cb);
}

void Traversal::thirdTraversal() {
    // Full type checking.
    postOrder(root, pass3_cb);
}

void Traversal::pass1_cb(ASTNode* node) {

    if (node->type == "void" || node->type == "boolean" || node->type == "int") {
        node->sig = node->type;
    } else if (node->type == "number") {
        node->sig = "int";
    } else if (node->type == "true" || node->type == "false") {
        node->sig = "boolean";
    }
    else if (node->type == "formal") {
        for (size_t i = 0; i < node->children.size(); i++) {
            if (node->children[i]->type == "int" || node->children[i]->type == "boolean") {
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
            if (node->children[i]->type == "int" || node->children[i]->type == "boolean" || node->children[i]->type == "void") {
                _return_type = node->children[i]->type;
            }
            if (node->children[i]->type == "id") {
                _id_child = node->children[i];
            }
            if (node->children[i]->type == "formals") {
                _sig = "f(";
                bool first = true;
                for (size_t j = 0; j < synthesized_sig.size(); j++) {
                    if (!first) _sig.append(",");
                    _sig.append(synthesized_sig[j]);
                    first = false;
                }
                _sig.append(")");
                synthesized_sig.clear();
            }
        }

        if (!existsOnTOS(_id_child->attr, _id_child->lineno)) {
            scope_stack.top()[_id_child->attr] = std::make_shared<SymTabEntry>();
            scope_stack.top()[_id_child->attr]->sig = _sig;
            scope_stack.top()[_id_child->attr]->return_type = _return_type;

            _id_child->symtab_entry = scope_stack.top()[_id_child->attr];
            _id_child->sig = _id_child->symtab_entry->sig;
        }
    }
    else if (node->type == "globVarDecl") {
        ASTNode* _id_child;
        std::string _sig;

        for (size_t i = 0; i < node->children.size(); i++) {
            if (node->children[i]->type == "int" || node->children[i]->type == "boolean") {
                _sig = node->children[i]->type;
            }
            if (node->children[i]->type == "id") {
                _id_child = node->children[i];
            }
        }

        if (!existsOnTOS(_id_child->attr, _id_child->lineno)) {
            scope_stack.top()[_id_child->attr] = std::make_shared<SymTabEntry>();
            scope_stack.top()[_id_child->attr]->sig = _sig;

            _id_child->symtab_entry = scope_stack.top()[_id_child->attr];
            _id_child->sig = _id_child->symtab_entry->sig;
        }
        
    }
    else if (node->type == "funcDecl") {
        ASTNode* _id_child;
        std::string _return_type;
        std::string _sig;

        for (size_t i = 0; i < node->children.size(); i++) {
            if (node->children[i]->type == "int" || node->children[i]->type == "boolean" || node->children[i]->type == "void") {
                _return_type = node->children[i]->type;
            }
            if (node->children[i]->type == "id") {
                _id_child = node->children[i];
            }
            if (node->children[i]->type == "formals") {
                _sig = "f(";
                bool first = true;
                for (size_t j = 0; j < synthesized_sig.size(); j++) {
                    if (!first) _sig.append(",");
                    _sig.append(synthesized_sig[j]);
                    first = false;
                }
                _sig.append(")");
                synthesized_sig.clear();
            }
        }

        if (!existsOnTOS(_id_child->attr, _id_child->lineno)) {
            scope_stack.top()[_id_child->attr] = std::make_shared<SymTabEntry>();
            scope_stack.top()[_id_child->attr]->sig = _sig;
            scope_stack.top()[_id_child->attr]->return_type = _return_type;

            _id_child->symtab_entry = scope_stack.top()[_id_child->attr];
            _id_child->sig = _id_child->symtab_entry->sig;
        }
    }
    else if (node->type == "program") {
        scope_stack.top()["$"] = std::make_shared<SymTabEntry>();
        scope_stack.top()["$"]->sig = "$";
        node->symtab_entry = scope_stack.top()["$"];
    }
}

void Traversal::pass2a_cb(ASTNode* node) {
    if (node->type == "mainDecl" || node->type == "funcDecl") {
        scope_stack.push(SymTab());
    } else if (node->type == "formal" || node->type == "varDecl") {

        ASTNode* _id_child;
        std::string _sig;

        for (size_t i = 0; i < node->children.size(); i++) {
            if (node->children[i]->type == "int" || node->children[i]->type == "boolean") {
                _sig = node->children[i]->type;
            }
            if (node->children[i]->type == "id") {
                _id_child = node->children[i];
            }
        }

        if (!existsOnTOS(_id_child->attr, _id_child->lineno)) {
            scope_stack.top()[_id_child->attr] = std::make_shared<SymTabEntry>();
            scope_stack.top()[_id_child->attr]->sig = _sig;

            _id_child->symtab_entry = scope_stack.top()[_id_child->attr];
            _id_child->sig = _id_child->symtab_entry->sig;
            node->sig = _id_child->sig;
        }
    }
}

void Traversal::pass2b_cb(ASTNode* node) {
    if (node->type == "mainDecl" || node->type == "funcDecl") {
        scope_stack.pop();
    } else if (node->type == "id") {
        if (node->symtab_entry == nullptr) {
            node->symtab_entry = getSymTabEntryFromStack(node->attr, node->lineno);
            node->sig = node->symtab_entry->sig;
        }
    }
}

void Traversal::pass3_cb(ASTNode* node) {

    // funcCall arguments
    if (node->type == "funcCall") {
        ASTNode* _id = node->children[0];
        ASTNode* _actuals = node->children[1];

        // assign sig to funcCall node
        node->sig = _id->symtab_entry->return_type;

        // check if num/type of arguments matches the ones associated with the identfier
        std::string _actuals_sig = "f(";
        bool _first = true;
        for (size_t i = 0; i < _actuals->children.size(); i++ ) {
            if (!_first) _actuals_sig.append(",");
            _actuals_sig.append(_actuals->children[i]->sig);
            _first = false;
        }
        _actuals_sig.append(")");

        if (_actuals_sig != _id->symtab_entry->sig) {
            std::cerr << "Semantic error: number/type of arguments of function call does not match function declaration at or near line " << node->lineno << std::endl;
            exit(1);
        }
    }

    // Cases to handle:
    // ||, &&, ==, !=, =, <, >, <=, >=, +, *, /, %, !, -
    // Binary boolean comparison cases
    if (node->type == "||" || node->type == "&&") {

        ASTNode* left = node->children[0];
        ASTNode* right = node->children[1];

        if ( !(left->sig == "boolean" && right->sig == "boolean")) {
            std::cerr << "Semantic error: type mismatch for operator '" << node->type << "' at or near line " << node->lineno << ". Left: '" << left->sig << "' Right: '" << right->sig << "'" << std::endl;
            exit(1);
        }
        node->sig = "boolean";
    }

    // Binary int/boolean comparison cases
    if (node->type == "==" || node->type == "!=") {
        ASTNode* left = node->children[0];
        ASTNode* right = node->children[1];

        if ( !((left->sig == "int" && right->sig == "int") || (left->sig == "boolean" && right->sig == "boolean")) ) {
            std::cerr << "Semantic error: type mismatch for operator '" << node->type << "' at or near line " << node->lineno << ". Left: '" << left->sig << "' Right: '" << right->sig << "'" << std::endl;
            exit(1);
        }
        node->sig = "boolean";
    }
    // Binary assignment op case
    if (node->type == "=") {
        ASTNode* left = node->children[0];
        ASTNode* right = node->children[1];

        if ( !((left->sig == "int" && right->sig == "int") || (left->sig == "boolean" && right->sig == "boolean")) ) {
            std::cerr << "Semantic error: type mismatch for operator '" << node->type << "' at or near line " << node->lineno << ". Left: '" << left->sig << "' Right: '" << right->sig << "'" << std::endl;
            exit(1);
        }
        node->sig = left->sig;
    }

    // // Binary int comparison cases
    if (node->type == "<" || node->type == ">" || node->type == "<=" || node->type == ">=") {
        ASTNode* left = node->children[0];
        ASTNode* right = node->children[1];

        if ( !(left->sig == "int" && right->sig == "int") ) {
            std::cerr << "Semantic error: type mismatch for operator '" << node->type << "' at or near line " << node->lineno << ". Left: '" << left->sig << "' Right: '" << right->sig << "'" << std::endl;
            exit(1);
        }
        node->sig = "boolean";
    }

    // // Binary int cases
    if (node->type == "+" || node->type == "*" || node->type == "/" || node->type == "%") {
        ASTNode* left = node->children[0];
        ASTNode* right = node->children[1];

        if ( !(left->sig == "int" && right->sig == "int") ) {
            std::cerr << "Semantic error: type mismatch for operator '" << node->type << "' at or near line " << node->lineno << ". Left: '" << left->sig << "' Right: '" << right->sig << "'" << std::endl;
            exit(1);
        }
        node->sig = "int";
    }

    // // Unary "!" case
    if (node->type == "!") {
        ASTNode* unary = node->children[0];
        if ( !(unary->sig == "boolean") ) {
            std::cerr << "Semantic error: type mismatch for operator '" << node->type << "' at or near line " << node->lineno << ". Operand: " << unary->sig << std::endl;
            exit(1);
        }
        node->sig = "boolean";
    }

    // // Unary/Binary "-" case
    if (node->type == "-") {
        if (node->children.size() == 1) {

            ASTNode* unary = node->children[0];
            if ( !(unary->sig == "int") ) {
                std::cerr << "Semantic error: type mismatch for operator '" << node->type << "' at or near line " << node->lineno << ". Operand: " << unary->sig << std::endl;
                exit(1);
            }
            node->sig = "int";

        } else if (node->children.size() == 2) {
            ASTNode* left = node->children[0];
            ASTNode* right = node->children[1];

            if ( !(left->sig == "int" && right->sig == "int") ) {
                std::cerr << "Semantic error: type mismatch for operator '" << node->type << "' at or near line " << node->lineno << ". Left: '" << left->sig << "' Right: '" << right->sig << "'" << std::endl;
                exit(1);
            }
            node->sig = "int";
        }
    }
}

void Traversal::postOrder(ASTNode* node, void(*callback)(ASTNode*)) {
    
    if (node == nullptr) {
        return;
    }
    for (size_t i = 0; i < node->children.size(); i++) {
        postOrder(node->children[i], callback);
    }
    callback(node);
}

void Traversal::prePostOrder(ASTNode* node, void(*callback1)(ASTNode*), void(*callback2)(ASTNode*)) {
    if (node == nullptr) {
        return;
    }

    callback1(node);

    for (size_t i = 0; i < node->children.size(); i++) {
        prePostOrder(node->children[i], callback1, callback2);
    }

    callback2(node);
}

