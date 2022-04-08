#pragma once

#include <string>
#include <vector>
#include <iostream>

class reg_allocator {

    std::vector< std::pair<std::string, bool> > registers;

    
    
    public:
        reg_allocator();
        ~reg_allocator();
        
        std::string allocreg();
        void freereg(std::string);
};