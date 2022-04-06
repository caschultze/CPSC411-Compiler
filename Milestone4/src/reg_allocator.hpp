#pragma once

#include <string>
#include <vector>
#include <iostream>

class reg_allocator {

    std::vector< std::pair<std::string, bool> > a_registers;

    std::vector< std::pair<std::string, bool> > registers;
    
    // std::vector< std::pair<std::string, bool> > v_registers;
    // std::vector< std::pair<std::string, bool> > v_registers;
    // std::vector< std::pair<std::string, bool> > a_registers;
    // std::vector< std::pair<std::string, bool> > t_registers;
    // std::vector< std::pair<std::string, bool> > s_registers;
    
    
    public:
        reg_allocator();
        ~reg_allocator();

        std::string alloc_a_reg();
        void free_a_reg(std::string);

        std::string allocreg();
        void freereg(std::string);
};