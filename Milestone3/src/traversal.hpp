#ifndef TRAVERSAL_HPP
#define TRAVERSAL_HPP

#include "ast.hpp"
#include <memory>
#include <stack>
#include <unordered_map>

class Traversal {
    public:
        Traversal(ASTNode* _root);
        void traverse();

    private:
        ASTNode* root;

        // void prepostorder(ASTNode*, void(*)(ASTNode*), void(*)(ASTNode*));

        static int mainDecl_count;
        static std::unordered_map<std::string, std::string> scope_entry;
        static std::unordered_map<std::string, std::shared_ptr<std::unordered_map<std::string, std::string>>> scope;
        static std::stack<std::unordered_map<std::string, std::shared_ptr<std::unordered_map<std::string, std::string>>>> scope_stack;
        static ASTNode* id_node_ptr;
        static std::vector<std::string> synth_attributes;
        static std::vector<std::string> synth_func_sig;

        static void pushPreDefinedNames();
        static bool doesNotExistInCurrentScope(std::string);
        static bool doesNotExistInTopOfScopeStack(std::string);
        static bool existsInScopeStack(std::string);

        void postorder(ASTNode*, void(*)(ASTNode*));



        static void pass1_cb(ASTNode*);
        // static void pass2_cb(ASTNode*);
        // static void pass3_cb(ASTNode*);
        // static void pass4_cb(ASTNode*);


        


        
        



};

#endif