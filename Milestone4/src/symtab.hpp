#pragma once

#include <string>
#include <memory>
#include <unordered_map>
//#include <vector>

struct SymTabEntry {
    std::string sig;
    std::string return_type;
    std::string global_label;              // label for global variables
    std::string prologue_label;     // label for funcDecl prologue
    std::string epilogue_label;     // label for funcDecl epilogue
    int stack_address;              // stack address for local variables
    std::string reg;
    //std::vector<std::string> func_registers;
};

typedef std::unordered_map<std::string, std::shared_ptr<SymTabEntry>> SymTab;