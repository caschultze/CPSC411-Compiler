#include "reg_allocator.hpp"


reg_allocator::reg_allocator() {

    // Use $v0 for return values, do nothing with $v1
    // Use $s8/$30 as the register to load a string address into

    // Temporary registers
    registers.push_back( std::make_pair("t0", false) );
    registers.push_back( std::make_pair("t1", false) );
    registers.push_back( std::make_pair("t2", false) );
    registers.push_back( std::make_pair("t3", false) );
    registers.push_back( std::make_pair("t4", false) );
    registers.push_back( std::make_pair("t5", false) );
    registers.push_back( std::make_pair("t6", false) );
    registers.push_back( std::make_pair("t7", false) );
    registers.push_back( std::make_pair("s0", false) );
    registers.push_back( std::make_pair("s1", false) );
    registers.push_back( std::make_pair("s2", false) );
    registers.push_back( std::make_pair("s3", false) );
    registers.push_back( std::make_pair("s4", false) );
    registers.push_back( std::make_pair("s5", false) );
    registers.push_back( std::make_pair("s6", false) );
    registers.push_back( std::make_pair("s7", false) );
    registers.push_back( std::make_pair("t8", false) );
    registers.push_back( std::make_pair("t9", false) );
}

reg_allocator::~reg_allocator() {
    ;
}

std::string reg_allocator::allocreg() {
    for (size_t i = 0; i < registers.size(); i++) {
        if (registers[i].second == false) {
            registers[i].second = true;
            std::cout << "allocated register: " << registers[i].first << std::endl;
            return registers[i].first;
        }
    }
    std::cerr << "Error: expression too complicated (out of registers)" << std::endl;
    exit(1);
};

void reg_allocator::freereg(std::string r) {
    if (r == "void" || r == "string") {
        return;
    }
    for (size_t i = 0; i < registers.size(); i++) {
        if (registers[i].first == r && registers[i].second == true) {
            std::cout << "freed register: " << registers[i].first << std::endl;
            registers[i].second = false;
            return;
        }
    }
    std::cerr << "Error: register is already free or does not exist - '" << r << "'" << std::endl;
    exit(1);
}

std::vector<std::string> reg_allocator::used() {
    std::vector<std::string> res;
    for (size_t i = 0; i < registers.size(); i++) {
        if (registers[i].second == true) {
            res.push_back(registers[i].first);
        }
    }
    return res;
}