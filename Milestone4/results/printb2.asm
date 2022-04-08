
        .data
SFalseLen: 
        .word 6
        .align 2

SFalse: 
        .byte 102 , 97 , 108 , 115 , 101 , 10 # false\n
        .align 2

STrueLen: 
        .word 5
        .align 2

STrue:  
        .byte 116 , 114, 117 , 101 , 10 # truee\n
        .align 2


        .text
main:
        move $s0, $0
        
        la $t0, SFalse      # address of string
        lw $t2, SFalseLen   # string length
loop:
        bge $s0, $t2, breakpoint

        li $v0, 11
        lb $a0, ($t0)       # output = SFalse[i]
        syscall

        addi $t0, $t0, 1    # increment address of string by 1

        addi $s0, $s0, 1    # inclement loop counter
        j loop

breakpoint:
        li $v0, 10
        syscall