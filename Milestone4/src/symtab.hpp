#pragma once

#include <string>
#include <memory>
#include <unordered_map>

struct SymTabEntry {
    std::string sig;
    std::string return_type;
    std::string label;      // todo: store generated labels for functions...and maybe for registers?
    int stack_address;
    std::string reg;
};

typedef std::unordered_map<std::string, std::shared_ptr<SymTabEntry>> SymTab;