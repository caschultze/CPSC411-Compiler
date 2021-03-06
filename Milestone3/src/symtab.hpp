#pragma once

#include <string>
#include <memory>
#include <unordered_map>

struct SymTabEntry {
    std::string sig;
    std::string return_type;
};

typedef std::unordered_map<std::string, std::shared_ptr<SymTabEntry>> SymTab;