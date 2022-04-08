        .text
        .globl main
main:
        jal P0
        li $v0 10
        syscall
        

P0:
    subu $sp, $sp, 4
    sw $ra, 0($sp)

    li $t0, 0
    move $a0, $t0
    jal lprintb

E0:
    lw $ra, 0($sp)
    addu $sp, $sp, 4
    jr      $ra

lprintb:
        subu $sp, $sp, 4
        sw $ra, 0($sp)

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
        .byte 116 , 114, 117 , 101 , 10 # true\n
        .align 2

        .text
        move $s0, $0        # loop condition

        beq     $a0, 1, lprintbTrue
        
lprintbFalse:
        la $t0, SFalse      # address of string
        lw $t2, SFalseLen   # string length
        j loop

lprintbTrue:
        la $t0, STrue       # address of string
        lw $t2, STrueLen   # string length 
        j loop

loop:
        bge $s0, $t2, breakpoint    # loop counter >= string length ? breakpoint

        li $v0, 11
        lb $a0, ($t0)       # output = SString[i]
        syscall

        addi $t0, $t0, 1    # increment address of string by 1

        addi $s0, $s0, 1    # inclement loop counter
        j loop

breakpoint:
        lw $ra, 0($sp)
        addu $sp, $sp, 4
        jr      $ra