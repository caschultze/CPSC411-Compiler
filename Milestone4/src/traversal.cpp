#include <iostream>
#include <memory>
#include <fstream>

#include "traversal.hpp"

Traversal::Traversal (ASTNode* _root) {
    root = _root;
}

// Initialize static variables.
int Traversal::mainDecl_count;
std::string Traversal::mainDecl_name;
int Traversal::while_count;
int Traversal::block_count;
std::string Traversal::funcDecl_return_type;
bool Traversal::nonvoid_funcDecl_returns;
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
    pushPreDefinedNames();
    firstTraversal();
    secondTraversal();
    thirdTraversal();
    fourthTraversal();
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

void Traversal::fourthTraversal() {
    // Handles everything else.
    prePostOrder(root, pass4a_cb, pass4b_cb);
}

void Traversal::pass1_cb(ASTNode* node) {

    if (node->type == "void" || node->type == "boolean" || node->type == "int") {
        node->sig = node->type;
    } else if (node->type == "number") {
        node->sig = "int";
    } else if (node->type == "true" || node->type == "false") {
        node->sig = "boolean";
    } else if (node->type == "string") {
        node->sig = "string";
    }
    else if (node->type == "formal") {
        for (size_t i = 0; i < node->children.size(); i++) {
            if (node->children[i]->type == "int" || node->children[i]->type == "boolean") {
                synthesized_sig.push_back(node->children[i]->type);
            }
        }
    }
    else if (node->type == "mainDecl") {
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

        Traversal::mainDecl_count++;
        Traversal::mainDecl_name = _id_child->attr;
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

        // check if funcCall is main function
        if (_id->attr == mainDecl_name) {
            std::cerr << "Semantic error: cannot call the main function at or near line " << node->lineno << std::endl;
            exit(1);
        }

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

    // if/while
    if (node->type == "if" || node->type == "ifElse" || node->type == "while") {
        if (node->children[0]->sig != "boolean") {
            std::cerr << "Semantic error: if- or while- statement needs a boolean expression at or near line " << node->lineno << std::endl;
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

void Traversal::pass4a_cb(ASTNode* node) {
    if (node->type == "while") {
        Traversal::while_count++;
    }
    if (node->type == "block") {
        Traversal::block_count++;
    }
    if (node->type == "mainDecl" || node->type == "funcDecl") {
        // If these are found, track the return value type
        Traversal::funcDecl_return_type = node->children[1]->symtab_entry->return_type;

        if (Traversal::funcDecl_return_type == "int" || Traversal::funcDecl_return_type == "boolean") {
            Traversal::nonvoid_funcDecl_returns = false;
        }
    }
}

void Traversal::pass4b_cb(ASTNode* node) {
    if (node->type == "break") {
        if (Traversal::while_count == 0) {
            std::cerr << "Semantic error: break must be inside while-statement at or near line " << node->lineno << std::endl;
            exit(1);
        }
    }
    else if (node->type == "while") {
        Traversal::while_count--;
    }
    else if (node->type == "varDecl") {
        if (Traversal::block_count != 1) {
            std::cerr << "Semantic error: local declaration not in outermost block at or near line " << node->lineno << std::endl;
            exit(1);
        }
    }
    else if (node->type == "block") {
        Traversal::block_count--;
    }
    else if (node->type == "return") {
        if (Traversal::funcDecl_return_type == "void") {
            if (node->children.size() > 0) {
                std::cerr << "Semantic error: void function cannot return a value at or near line " << node->lineno << std::endl;
                exit(1);
            }
        }
        else if (Traversal::funcDecl_return_type == "int" || Traversal::funcDecl_return_type == "boolean") {
            Traversal::nonvoid_funcDecl_returns = true;
            if (node->children.size() == 0) {
                std::cerr << "Semantic error: non-void function must return a value at or near line " << node->lineno << std::endl;
                exit(1);
            }
            if (node->children.size() > 0) {
                if (Traversal::funcDecl_return_type != node->children[0]->sig) {
                    std::cerr << "Semantic error: returned value of function has the wrong type at or near line " << node->lineno << std::endl;
                    exit(1);
                }
            }
        }
        else {
            // Should never happen.
            std::cerr << "Unexpected semantic error: function return type is not int, boolean or void at or near line " << node->lineno << std::endl;
            exit(1);
        }
    }
    else if (node->type == "mainDecl" || node->type == "funcDecl") {

        if (Traversal::funcDecl_return_type == "int" || Traversal::funcDecl_return_type == "boolean") {
            if (Traversal::nonvoid_funcDecl_returns == false) {
                std::cerr << "Semantic error: no return statement in non-void function '" << node->children[1]->attr << "'" << std::endl;
                exit(1);
            }
        }

        Traversal::funcDecl_return_type = "";
        Traversal::nonvoid_funcDecl_returns = false;
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


// ----------------- Milsestone 4 code ------------------------ //
reg_allocator Traversal::registers;
int Traversal::global_labelno = 0;
int Traversal::func_labelno = 1;
int Traversal::string_labelno = 0;
int Traversal::control_labelno = 0;
int Traversal::stack_frame_size = 0;
std::stack<std::string> Traversal::while_labels;
std::string Traversal::return_label = "";
std::string Traversal::gen_line;
std::vector<std::string> Traversal::gen_lines;

void Traversal::genPreOrder(ASTNode* node, bool(*callback)(ASTNode*)) {
    
    if (node == nullptr) {
        return;
    }

    bool prune = callback(node);

    if (!prune) {
        for (size_t i = 0; i < node->children.size(); i++) {
            genPreOrder(node->children[i], callback);
        }
    }

}

void Traversal::genRuntimeLibrary() {
    gen_lines.push_back("");
    gen_lines.push_back("");
    gen_lines.push_back("");
    gen_lines.push_back("");
    gen_lines.push_back("## --------------- Run-time library --------------- ##");
    
    // gen_lines.push_back("");
    // gen_lines.push_back("# int getchar() ");
    // gen_lines.push_back("LGetchar:");


    gen_lines.push_back("");
    gen_lines.push_back("# void halt() ");
    gen_lines.push_back("LHalt:");
    gen_lines.push_back("        li $v0, 10");
    gen_lines.push_back("        syscall");
    gen_lines.push_back("");

    gen_lines.push_back("# void printb(boolean)");
    std::string r0 = registers.allocreg();
    std::string r1 = registers.allocreg();
    std::string r2 = registers.allocreg();
    gen_lines.push_back("LPrintb:");
    gen_lines.push_back("                        .data");
    gen_lines.push_back("                SFalseLen:");
    gen_lines.push_back("                        .word 5");
    gen_lines.push_back("                        .align 2");
    gen_lines.push_back("                SFalse:");
    gen_lines.push_back("                        .byte 102 , 97 , 108 , 115 , 101");
    gen_lines.push_back("                        .align 2");
    gen_lines.push_back("                STrueLen:");
    gen_lines.push_back("                        .word 4");
    gen_lines.push_back("                        .align 2");
    gen_lines.push_back("                STrue:");
    gen_lines.push_back("                        .byte 116 , 114 , 117 , 101");
    gen_lines.push_back("                        .align 2");
    gen_lines.push_back("        .text");
    gen_lines.push_back("        move $" + r0 + " $0          # loop condition");
    gen_lines.push_back("        beq $a0, 1, LPrintbTrue");
    gen_lines.push_back("        la $" + r1 + ", SFalse      # address of string");
    gen_lines.push_back("        lw $" + r2 + ", SFalseLen   # string length");
    gen_lines.push_back("        j LPrintbLoop");
    gen_lines.push_back("LPrintbTrue:");
    gen_lines.push_back("        la $" + r1 + ", STrue       # address of string");
    gen_lines.push_back("        lw $" + r2 + ", STrueLen    # string length");
    gen_lines.push_back("LPrintbLoop:");
    gen_lines.push_back("        bge $" + r0 + ", $" + r2 + ", LPrintbBreakpoint");
    gen_lines.push_back("        li $v0, 11");
    gen_lines.push_back("        lb $a0, ($" + r1 + ")");
    gen_lines.push_back("        syscall");
    gen_lines.push_back("        addi $" + r1 + ", $" + r1 + ", 1");
    gen_lines.push_back("        addi $" + r0 + ", $" + r0 + ", 1");
    gen_lines.push_back("        j LPrintbLoop");
    gen_lines.push_back("LPrintbBreakpoint:");
    gen_lines.push_back("        jr $ra");
    gen_lines.push_back("");
    registers.freereg(r0);
    registers.freereg(r1);
    registers.freereg(r2);


    gen_lines.push_back("# void printc(int)");
    gen_lines.push_back("LPrintc:");
    gen_lines.push_back("        li $v0, 11");
    gen_lines.push_back("        syscall");
    gen_lines.push_back("        jr $ra");
    gen_lines.push_back("");

    gen_lines.push_back("# void printi(int)");
    gen_lines.push_back("LPrinti:");
    gen_lines.push_back("        li $v0, 1");
    gen_lines.push_back("        syscall");
    gen_lines.push_back("        jr $ra");
    gen_lines.push_back("");

    gen_lines.push_back("# void prints(string)");
    r0 = registers.allocreg();
    r1 = registers.allocreg();
    r2 = registers.allocreg();
    gen_lines.push_back("LPrints:");
    gen_lines.push_back("        move $" + r0 + " $0          # loop condition");
    gen_lines.push_back("        move $" + r1 + ", $a0        # address of string");
    gen_lines.push_back("LPrintsLoop:");
    gen_lines.push_back("        bge $" + r0 + ", $s8, LPrintsBreakpoint");
    gen_lines.push_back("        li $v0, 11");
    gen_lines.push_back("        lb $a0, ($" + r1 + ")");
    gen_lines.push_back("        syscall");
    gen_lines.push_back("        addi $" + r1 + ", $" + r1 + ", 1");
    gen_lines.push_back("        addi $" + r0 + ", $" + r0 + ", 1");
    gen_lines.push_back("        j LPrintsLoop");
    gen_lines.push_back("LPrintsBreakpoint:");
    gen_lines.push_back("        jr $ra");
    gen_lines.push_back("");
    registers.freereg(r0);
    registers.freereg(r1);
    registers.freereg(r2);

}

void Traversal::gen() {
    gen_lines.push_back("                    .text");
    gen_lines.push_back("                    .globl main");
    gen_lines.push_back("            main:");
    gen_lines.push_back("                     jal P0");
    gen_lines.push_back("                     li $v0, 10");
    gen_lines.push_back("                     syscall");

    // Assign labels to global variables.
    genPreOrder(root, defineGlobVarDeclLabels_cb);

    // Assign prologue/epilogue labels to function declarations.
    genPreOrder(root, defineFuncDeclLabels_cb);

    // Generate code for functions.
    genPreOrder(root, gen_cb);

    // Generate code for runtime library functions.
    genRuntimeLibrary();

    // Generate code into file.
    std::ofstream MyFile("../results/result.asm");
    for (size_t i = 0; i < gen_lines.size(); i++)
        MyFile << gen_lines[i] << "\n";
    MyFile.close();
}

bool Traversal::defineGlobVarDeclLabels_cb(ASTNode* node) {

    // generate global variable labels
    if (node->type == "globVarDecl") {
        gen_lines.push_back("        .data");

        node->children[1]->symtab_entry->global_label = "G" + std::to_string(global_labelno++);
        gen_lines.push_back(node->children[1]->symtab_entry->global_label + ":");

        gen_lines.push_back("        .word 0");
        gen_lines.push_back("        .text");

        return true;
    }
    return false;
}

bool Traversal::defineFuncDeclLabels_cb(ASTNode* node) {
    if (node->type == "mainDecl") {
        node->children[1]->symtab_entry->prologue_label = "P0";
        node->children[1]->symtab_entry->epilogue_label = "E0";
    }
    if (node->type == "funcDecl") {
        node->children[1]->symtab_entry->prologue_label = "P" + std::to_string(func_labelno);
        node->children[1]->symtab_entry->epilogue_label = "E" + std::to_string(func_labelno);
        ++func_labelno;
    }
    return false;        
}

bool Traversal::getStackFrameSize_cb(ASTNode* node) {
    if (node->type == "formal") {
        node->children[1]->symtab_entry->stack_address = stack_frame_size;
        stack_frame_size += 4;
        return true;
    }
    if (node->type == "varDecl") {
        node->children[1]->symtab_entry->stack_address = stack_frame_size;
        stack_frame_size += 4;
        return true;
    }
    return false;
}

bool Traversal::gen_cb(ASTNode* node) {
    std::string r;

    if (node->type == "mainDecl" || node->type == "funcDecl") {

        // Function Header Label
        gen_lines.push_back(node->children[1]->symtab_entry->prologue_label + ":");

        // Get stack frame size
        stack_frame_size = 4;
        genPreOrder(node->children[2], getStackFrameSize_cb);
        genPreOrder(node->children[3], getStackFrameSize_cb);

        // Move sp down
        gen_lines.push_back("        subu $sp, $sp, " + std::to_string(stack_frame_size));
        gen_lines.push_back("        sw $ra, 0($sp)");

        // Store function args onto stack
        for (size_t i = 0; i < node->children[2]->children.size(); i++) {
            if (i > 3) {
                std::cerr << "Error: too many arguments passed to function" << std::endl;
                exit(1);
            }
            gen_lines.push_back("        sw $a" + std::to_string(i) + ", " + std::to_string(node->children[2]->children[i]->children[1]->symtab_entry->stack_address) + "($sp)");
        }

        // Function body
        Traversal::return_label = node->children[1]->symtab_entry->epilogue_label;
        genPreOrder(node->children[3], genStatement_cb);
        Traversal::return_label = "";

        // TODO: free all registers used by this function, after function body finishes

        // Function Footer Label
        gen_lines.push_back(node->children[1]->symtab_entry->epilogue_label + ":");

        // Move sp up
        gen_lines.push_back("        lw $ra, 0($sp)");
        gen_lines.push_back("        addu $sp, $sp, " + std::to_string(stack_frame_size));
        gen_lines.push_back("        jr $ra");

        stack_frame_size = 0;

        return true;
    }

    return false;
}


bool Traversal::genStatement_cb(ASTNode* node) {

    if (node->type == "varDecl") {
        // Do nothing
        return true;
    }
    if (node->type == "block") {
        // Execute callback on each child statement.
        std::cout << "hello block" << std::endl;
        for (size_t i = 0; i < node->children.size(); i++) {
            genPreOrder(node->children[i], genStatement_cb);
        }
        return true;
    }
    if (node->type == "nullStmt") {
        // Do nothing
    }
    if (node->type == "stmtExpr") {
        std::cout << "hello stmtExpr" << std::endl;
        gen_lines.push_back("# begin stmtExpr");
        // Child node is either 'funcCall' or '='
        gen_lines.push_back("# end stmtExpr");

        return true;
    }
    if (node->type == "while") {
        std::cout << "hello while" << std::endl;
        // Children are expression and 'block'
        gen_lines.push_back("# begin while statement");
        std::string label1 = "L" + std::to_string(control_labelno++);
        std::string label2 = "L" + std::to_string(control_labelno++); 

        Traversal::while_labels.push(label2);
        gen_lines.push_back(label1 + ":");          // Loop top
        // todo: gen expression code here. results in 'result register' being populated
        gen_lines.push_back("        beqz $<RESULT_REGISTER>, " + label2);
        genStatement_cb(node->children[1]);         // Loop body
        gen_lines.push_back("        j "+ label1);
        gen_lines.push_back(label2 + ":");          // Loop exit
        Traversal::while_labels.pop();

        gen_lines.push_back("# end while statement");

        return true;
    }
    if (node->type == "break") {
        std::cout << "hello break" << std::endl;
        // Only occurs within a while-block
        gen_lines.push_back("# begin break statement");
        gen_lines.push_back("        j " + while_labels.top());
        gen_lines.push_back("# end break statement");

        return true;
    }
    if (node->type == "return") {
        std::cout << "hello return" << std::endl;
        // If it has a child expression, load its register into $v0. Jump to function epilogue.
        gen_lines.push_back("# begin return statement");
        if (node->children.size() > 0) {
            // todo: gen expression code here. results in 'result register' being populated
            gen_lines.push_back("        move $v0, $<RESULT_REGISTER>");
        }
        gen_lines.push_back("        j " + Traversal::return_label);
        gen_lines.push_back("# end return statement");

        return true;
    }
    if (node->type == "if") {
        std::cout << "hello if" << std::endl;
        // Children are expression and 'block'
        gen_lines.push_back("# begin if statement");

        // todo: gen expression code here. results in 'result register' being populated

        // Gen code for branch.
        std::string label = "L" + std::to_string(control_labelno++);
        if (node->children[0]->type == "||" || node->children[0]->type == "&&") {
            // todo: case for short-circuit logic
        }
        else {
            // expression is 'funcCall', 'true', or 'false'
            gen_lines.push_back("        beqz $<RESULT_REGISTER>, " + label);
        }

        // Gen code for 'block'
        genStatement_cb(node->children[1]);

        // Gen code for label to jump to when test fails.
        gen_lines.push_back(label + ":");
        gen_lines.push_back("# end if statement");

        return true;
    }
    if (node->type == "ifElse") {
        std::cout << "hello ifElse" << std::endl;
        // Children are expression, 'block', and 'block'
        gen_lines.push_back("# begin ifElse statement");
        // todo: gen expression code here. results in 'result register' being populated

        // Gen code for branch.
        std::string label1 = "L" + std::to_string(control_labelno++);
        std::string label2 = "L" + std::to_string(control_labelno++);
        if (node->children[0]->type == "||" || node->children[0]->type == "&&") {
            // todo: case for short-circuit logic
        }
        else {
            // expression is 'funcCall', 'true', or 'false'
            gen_lines.push_back("        beqz $<RESULT_REGISTER>, " + label1);
        }

        // Gen code for if-block
        genStatement_cb(node->children[1]);
        gen_lines.push_back("        j " + label2);

        // Gen code for else-block
        gen_lines.push_back(label1 + ":");
        genStatement_cb(node->children[2]);

        // Gen code for label to jump to from if-block
        gen_lines.push_back(label2 + ":");
        gen_lines.push_back("# end ifElse statement");

        return true;
    }
    return false;
    /*
    std::string r;
    if (node->type == "return") {
        std::string r = registers.allocreg();
        if (node->children.size() > 0) {
            // bool funcreturnval = true;

            if (node->children[0]->type == "false") {
                gen_lines.push_back("        li $" + r + ", 0");
            }
            if (node->children[0]->type == "true") {
                gen_lines.push_back("        li $" + r + ", 1");
            }
            if (node->children[0]->type == "number") {
                gen_lines.push_back("        li $" + r + + ", " + node->children[0]->attr);
            }
            if (node->children[0]->type == "id") {
                if (node->children[0]->symtab_entry->global_label != "") {
                    gen_lines.push_back("        lw $" + r + ", " + node->children[0]->symtab_entry->global_label);
                }
                else if (node->children[0]->symtab_entry->stack_address > 0) {
                    gen_lines.push_back("        lw $" + r + ", " + std::to_string(node->children[0]->symtab_entry->stack_address) + "($sp)");
                }
                else {
                    std::cerr << "Undefined error: trying to load an id that is not global and has no stack address" << std::endl;
                    exit(1);
                }
            }
            gen_lines.push_back("        move $v0, $" + r);
            registers.freereg(r);
        }
        // need to be aware of what function I am currently in... lets draw a tree to handle this situation & look at the notes
        gen_lines.push_back("        j " + Traversal::return_label);
    }
    if (node->type == "funcCall") {

        ASTNode* actuals = node->children[1];
        // Load each argument expression into a register.
        std::vector<std::string> loaded_registers;
        for (size_t i = 0; i < actuals->children.size(); i++) {
            std::string r = registers.allocreg();
            loaded_registers.push_back(r);
            if (actuals->children[i]->type == "string") {
                gen_lines.push_back("        .data");
                gen_lines.push_back("LS" + std::to_string(Traversal::string_labelno) + "Len: ");
                gen_lines.push_back("        .word " + std::to_string(actuals->children[i]->attr.size() + 1));
                gen_lines.push_back("        .align 2");

                gen_lines.push_back("LS" + std::to_string(Traversal::string_labelno) + ": ");
                std::string byte_array = "        .byte ";
                // loop
                int c;
                bool escape = false;
                for (size_t z = 0; z < actuals->children[i]->attr.size(); z++) {
                    c = (int)actuals->children[i]->attr[z];
                    if (escape == true) {
                        switch (c) {
                            case 98:    // '\b'
                                byte_array.append("8 , ");
                                escape = false;
                                break;
                            case 116:    // '\t'
                                byte_array.append("9 , ");
                                escape = false;
                                break;
                            case 110:    // '\n'
                                byte_array.append("10 , ");
                                escape = false;
                                break;
                            case 102:    // '\f'
                                byte_array.append("12 , ");
                                escape = false;
                                break;
                            case 114:    // '\r'
                                byte_array.append("13 , ");
                                escape = false;
                                break;
                            case 39:    // '\''
                                byte_array.append("39 , ");
                                escape = false;
                                break;
                            case 34:    // '\"'
                                byte_array.append("34 , ");
                                escape = false;
                                break;
                            case 92:    // '\\'
                                byte_array.append("92 , ");
                                escape = false;
                                break;
                            default:
                                std::cerr << "error: unsupported escape character" << std::endl;
                                exit(1);
                        }
                        continue;
                    }
                    if (c == 92) { 
                        escape = true;
                        continue;
                    }
                    byte_array.append(std::to_string(c) + " , ");
                }
                byte_array.append("0");
                gen_lines.push_back(byte_array);
                gen_lines.push_back("        .align 2");
                gen_lines.push_back("        .text");
                gen_lines.push_back("        la $" + r + ", LS" + std::to_string(Traversal::string_labelno));
            }
            if (actuals->children[i]->type == "false") {
                //actuals->children[i]->symtab_entry->reg = registers.allocreg();
                //gen_lines.push_back("        li $" + actuals->children[i]->symtab_entry->reg + ", 0");
                gen_lines.push_back("        li $" + r + ", 0");
            }
            if (actuals->children[i]->type == "true") {
                //actuals->children[i]->symtab_entry->reg = registers.allocreg();
                //gen_lines.push_back("        li $" + actuals->children[i]->symtab_entry->reg + ", 1");
                gen_lines.push_back("        li $" + r + ", 1");

            }
            if (actuals->children[i]->type == "number") {
                //actuals->children[i]->symtab_entry->reg = registers.allocreg();
                //gen_lines.push_back("        li $" + actuals->children[i]->symtab_entry->reg + + ", " + actuals->children[i]->attr);
                gen_lines.push_back("        li $" + r + ", " + actuals->children[i]->attr);
            }
            if (actuals->children[i]->type == "id") {
                if (actuals->children[i]->symtab_entry->global_label != "") {
                    // actuals->children[i]->symtab_entry->reg = registers.allocreg();
                    // gen_lines.push_back("        lw $" + actuals->children[i]->symtab_entry->reg + ", " + actuals->children[i]->symtab_entry->global_label);
                    gen_lines.push_back("        lw $" + r + ", " + actuals->children[i]->symtab_entry->global_label);
                }
                else if (actuals->children[i]->symtab_entry->stack_address > 0) {
                    // actuals->children[i]->symtab_entry->reg = registers.allocreg();
                    // gen_lines.push_back("        lw $" + actuals->children[i]->symtab_entry->reg + ", " + std::to_string(actuals->children[i]->symtab_entry->stack_address) + "($sp)");
                    gen_lines.push_back("        lw $" + r + ", " + std::to_string(actuals->children[i]->symtab_entry->stack_address) + "($sp)");
                }
                else {
                    std::cerr << "Undefined error: trying to load an id that is not global and has no stack address" << std::endl;
                    exit(1);
                }
            }
        }
        // Move each allocated register into an argument and free the register.
        for (size_t i = 0; i < actuals->children.size(); i++) {
            if (actuals->children[i]->type == "string") {
                gen_lines.push_back("        move $a" + std::to_string(i) + ", $" + loaded_registers[i]);
                gen_lines.push_back("        lw $s8, LS" + std::to_string(Traversal::string_labelno++) + "Len");
                registers.freereg(loaded_registers[i]);
                continue;
            }
            gen_lines.push_back("        move $a" + std::to_string(i) + ", $" + loaded_registers[i]);
            registers.freereg(loaded_registers[i]);
        }

        // Generate a 'jal' instruction to the function
        if (node->children[0]->symtab_entry->prologue_label == "") {
            if (node->children[0]->attr == "getchar") {
                gen_lines.push_back("        jal LGetchar");
            } else if (node->children[0]->attr == "halt") {
                gen_lines.push_back("        jal LHalt");
            } else if (node->children[0]->attr == "printb") {
                gen_lines.push_back("        jal LPrintb");
            } else if (node->children[0]->attr == "printc") {
                gen_lines.push_back("        jal LPrintc");
            } else if (node->children[0]->attr == "printi") {
                gen_lines.push_back("        jal LPrinti");
            } else if (node->children[0]->attr == "prints") {
                gen_lines.push_back("        jal LPrints");
            }
        } else {
            gen_lines.push_back("        jal " + node->children[0]->symtab_entry->prologue_label);
        }
        gen_lines.push_back("");
        

        // Generate code to load result of function call into a register.
        if (node->children[0]->symtab_entry->return_type == "int" || node->children[0]->symtab_entry->return_type == "boolean") {
            std::string r = registers.allocreg();
            gen_lines.push_back("        move $" + r + ", $v0");
            registers.freereg(r);
            // TODO: free the register... how do we know which register to free?
            // If this is the RHS of an '=', then 'r' shoudl be freed after its store instruction.
        }
        return true;
    }
    if (node->type == "=") {

        // RHS instructions generated first
        // todo: probably refactor this for more complex expressions (duplicate code in funcCall when loading expressions to populate actuals)
        std::string r = registers.allocreg();
        if (node->children[1]->type == "false") {
            gen_lines.push_back("        li $" + r + ", 0");
        }
        if (node->children[1]->type == "true") {
            gen_lines.push_back("        li $" + r + ", 1");
        }
        if (node->children[1]->type == "number") {
            gen_lines.push_back("        li $" + r + ", " + node->children[1]->attr);
        }
        if (node->children[1]->type == "id") {
            if (node->children[1]->symtab_entry->global_label != "") {
                gen_lines.push_back("        lw $" + r + ", " + node->children[1]->symtab_entry->global_label);
            }
            else if (node->children[1]->symtab_entry->stack_address > 0) {
                gen_lines.push_back("        lw $" + r + ", " + std::to_string(node->children[1]->symtab_entry->stack_address) + "($sp)");
            }
            else {
                std::cerr << "Undefined error: trying to load an id that is not global and has no stack address" << std::endl;
                exit(1);
            }
        }
        if (node->children[1]->type == "funcCall") {
            // TODO (later): consider the case where an 'i = foo(j = foo(12))'
        }
        
        // LHS instructions generated second
        // - LHS is always either global variable or a local variable.
        if (node->children[0]->symtab_entry->global_label != "") {
            gen_lines.push_back("        sw $" + r + ", " + node->children[0]->symtab_entry->global_label);
        }
        else if (node->children[0]->symtab_entry->stack_address > 0) {
            gen_lines.push_back("        sw $" + r + ", " + std::to_string(node->children[0]->symtab_entry->stack_address) + "($sp)");
        }
        else {
            std::cerr << "Undefined error: LHS of = is has not global and has no stack address" << std::endl;
            exit(1);
        }
        registers.freereg(r);

        return true;
    } 
    return false;*/
}

