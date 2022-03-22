#include "ast.hpp"
#include <iostream>

using namespace std;

void ASTNode::print() {
    int num_tabs = 0;
    if (type != "")
    {
        cout << type  << " {'type': '" << type << "'";
        
        if (lineno > 0){
            cout << ", 'lineno': " << lineno;
        }

        if (attr != "") {
             cout << ", 'attr': '" << attr << "'";
        }

        if (sym_table_entry != nullptr) {
            if (type == "program") {
                cout << ", 'startSymbol': <stab.Symbol instance at " << sym_table_entry.get() << ">";
            } else {
                cout << ", 'sym': <stab.Symbol instance at " << sym_table_entry.get() << ">";
            }
        }

        if (sig != "") {
            cout << ", 'sig': '" << sig << "'";
        }

        if (return_type != "") {
            cout << ", 'ret': '" << return_type << "'";
        }

        cout << "}" << endl;

        for (auto x : children) {
            x->print(num_tabs+1);
        }
    }
}

void ASTNode::print(int num_tabs)
{
    if (type != "")
    {
        for (int i = 0; i < num_tabs; i++)
            cout << '\t';

        cout << type  << " {'type': '" << type << "'";

        if (lineno > 0){
            cout << ", 'lineno': " << lineno;
        }
        
        if (attr != "") {
            cout << ", 'attr': '";
            for (size_t i = 0; i < attr.length(); i++) {
                switch (attr[i]) {
                    case '\b':
                        cout << "\\b";
                        break;
                    case '\f':
                        cout << "\\f";
                        break;
                    case '\t':
                        cout << "\\t";
                        break;
                    case '\r':
                        cout << "\\r";
                        break;
                    case '\'':
                        cout << "\'";
                        break;
                    case '\"':
                        cout << "\"";
                        break;
                    case '\\':
                        cout << "\\\\";
                        break;
                    case '\0':
                        cout << "\\x00";
                        break;
                    default:
                        cout << attr[i];
                }
            }
            cout << "'";
        }

        if (sym_table_entry != nullptr) {
            if (type == "program") {
                cout << ", 'startSymbol': <stab.Symbol instance at " << sym_table_entry.get() << ">";
            } else {
                cout << ", 'sym': <stab.Symbol instance at " << sym_table_entry.get() << ">";
            }
        }

        if (sig != "") {
            cout << ", 'sig': '" << sig << "'";
        }

        if (return_type != "") {
            cout << ", 'ret': '" << return_type << "'";
        }

        cout << "}" << endl;

        for (auto x : children) {
            x->print(num_tabs+1);
        }
    }
}