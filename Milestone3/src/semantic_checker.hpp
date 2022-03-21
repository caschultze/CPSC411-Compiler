#ifndef SEMANTIC_CHECKER_HPP
#define SEMANTIC_CHECKER_HPP

#include "ast.hpp"

namespace JMM {

    class SemanticChecker {

        public:
            SemanticChecker() {}
            virtual ~SemanticChecker() = default;

            bool check();
            void setRoot(ASTNode* _root);

        private:
            ASTNode* root;

            void cb_1(int);
    };

}

#endif