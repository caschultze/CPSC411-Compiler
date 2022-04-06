#pragma once

#include "ast.hpp"

namespace JMM {

    class SemanticChecker {

        public:
            ASTNode* root;

            SemanticChecker(ASTNode*);
            ~SemanticChecker();

            bool check();
            bool gen();
    };

}