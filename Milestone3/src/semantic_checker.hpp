#ifndef SEMANTIC_CHECKER_HPP
#define SEMANTIC_CHECKER_HPP

#include "ast.hpp"

namespace JMM {

    class SemanticChecker {

        public:
            SemanticChecker() {}
            virtual ~SemanticChecker() = default;

            bool check();
            void setParseTree(ASTNode _parse_tree);

        private:
            ASTNode parse_tree;
    };

}

#endif