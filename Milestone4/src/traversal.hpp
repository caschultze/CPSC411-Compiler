#pragma once

#include "ast.hpp"
#include "symtab.hpp"
#include "reg_allocator.hpp"

#include <memory>
#include <stack>
#include <unordered_map>



class Traversal {
    public:
        Traversal(ASTNode*);
        void traverse();
        void gen();

    private:
        ASTNode* root;

        // For semantic checking
        static int mainDecl_count;
        static std::string mainDecl_name;
        static int while_count;
        static int block_count;
        static std::string funcDecl_return_type;
        static bool nonvoid_funcDecl_returns;
        static std::vector<std::string> synthesized_sig;
        static std::stack<SymTab> scope_stack;

        static void pushPreDefinedNames();
        static bool existsOnTOS(std::string, int);
        static std::shared_ptr<SymTabEntry> getSymTabEntryFromStack(std::string, int);

        void firstTraversal();
        void secondTraversal();
        void thirdTraversal();
        void fourthTraversal();

        void postOrder(ASTNode*, void(*)(ASTNode*));
        void prePostOrder(ASTNode*, void(*)(ASTNode*), void(*)(ASTNode*));

        static void pass1_cb(ASTNode*);
        static void pass2a_cb(ASTNode*);
        static void pass2b_cb(ASTNode*);
        static void pass3_cb(ASTNode*);
        static void pass4a_cb(ASTNode*);
        static void pass4b_cb(ASTNode*);

        // For code generation
        static int global_labelno;
        static int func_labelno;
        static int string_labelno;
        static int control_labelno;
        static std::stack<std::string> while_labels;
        static int stack_frame_size;
        static std::string return_label;
        static std::string gen_line;
        static std::vector<std::string> gen_lines;

        static reg_allocator registers;
        static void genPreOrder(ASTNode*, bool(*)(ASTNode*));


        static bool defineGlobVarDeclLabels_cb(ASTNode*);
        static bool defineFuncDeclLabels_cb(ASTNode*);

        static bool getStackFrameSize_cb(ASTNode*);
        static bool gen_cb(ASTNode*);

        static bool genStatement_cb(ASTNode*);

        static void genRuntimeLibrary();

        


};