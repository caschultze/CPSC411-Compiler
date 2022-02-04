#ifndef TOKEN_HPP
#define TOKEN_HPP

#include <iostream>
#include <sstream>

using namespace std;

class Token {
   private:
      string type;
      int line;
      string lexeme;
   public:
      Token(string ty, int li, string le) : type (ty), line (li), lexeme (le) {};
      string toString();
};

string Token::toString() {
   return "Token(" + type + ", " + to_string(line) + ", " + lexeme + ")";
}
#endif