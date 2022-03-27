#pragma once

#include "ast.hpp"
#include "symtab.hpp"

#include <memory>
#include <stack>
#include <unordered_map>


class Traversal {
    public:
        Traversal(ASTNode*);
        void traverse();

    private:
        ASTNode* root;

        // void prepostorder(ASTNode*, void(*)(ASTNode*), void(*)(ASTNode*));

        static int mainDecl_count;
        //static std::unordered_map<std::string, std::string> scope_entry;
        //static std::unordered_map<std::string, std::shared_ptr<SymTabEntry>> scope;
        //static std::stack<std::unordered_map<std::string, std::shared_ptr<std::unordered_map<std::string, std::string>>>> scope_stack;
        // static std::vector<ASTNode*> id_node_ptrs;
        // static std::vector<std::string> synth_attributes;
        static std::vector<std::string> synthesized_sig;

        static std::stack<SymTab> scope_stack;


        static void pushPreDefinedNames();
        static bool existsOnTOS(std::string, int);

        void firstTraversal();
        void secondTraversal();

        void postOrder(ASTNode*, void(*)(ASTNode*));
        void prePostOrder(ASTNode*, void(*)(ASTNode*), void(*)(ASTNode*));

        static void pass1_cb(ASTNode*);
        static void pass2a_cb(ASTNode*);
        static void pass2b_cb(ASTNode*);

        // static void pass3_cb(ASTNode*);
        // static void pass4_cb(ASTNode*);
};