#ifndef TRAVERSAL_HPP
#define TRAVERSAL_HPP

#include "ast.hpp"
#include <stack>
#include <unordered_map>

class Traversal {
    public:
        Traversal(ASTNode* _root);
        void traverse();

    private:
        ASTNode* root;

        void postorder(ASTNode*, void(*)(ASTNode*));
        void prepostorder(ASTNode*, void(*)(ASTNode*), void(*)(ASTNode*));

        static void pass1_cb(ASTNode*);
        static void pass2_cb(ASTNode*);
        static void pass3_cb(ASTNode*);
        static void pass4_cb(ASTNode*);


        std::stack<std::unordered_map<std::string, unordered_map<std::string, std::string>>> scope_stack;
        // std::stack<std::unordered_map<  std::string, 
        //                                 std::unique_ptr<
        //                                     unordered_map<std::string, std::string>
        //                                 >
        //                             >
        // > scope_stack;

        bool isDefinedInTopScope(std::string);
        bool isUndefinedInAllScopes(std::string);
        void pushPredefinedIds();

        
};

#endif