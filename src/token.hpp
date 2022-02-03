#ifndef TOKEN_HPP
#define TOKEN_HPP

#include <iostream>
#include <sstream>

using namespace std;

class Token {
   
   public:
      string type, lexeme;
      int line;
      Token(string ty, int li) : type (ty), line (li), lexeme (ty) {};
      Token(string ty, int li, string le) : type (ty), line (li), lexeme (le) {};
      string asdf();
};

// string Token::asdf() {
//    std::stringstream ss;
//    ss << "\nToken: " << type << "\nLine: " << line << "\nLexeme: " << lexeme;
//    string result = ss.str();
//    return result;
// }


#endif