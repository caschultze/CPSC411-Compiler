                    .text
                    .globl main
            main:
                     jal P0
                     li $v0, 10
                     syscall
P0:
        subu $sp, $sp, 4
        sw $ra, 0($sp)
# begin while statement
L0:
        beqz $<RESULT_REGISTER>, L1
# begin break statement
        j L1
# end break statement
        j L0
L1:
# end while statement
# begin while statement
L2:
        beqz $<RESULT_REGISTER>, L3
# begin while statement
L4:
        beqz $<RESULT_REGISTER>, L5
# begin break statement
        j L5
# end break statement
        j L4
L5:
# end while statement
# begin break statement
        j L3
# end break statement
        j L2
L3:
# end while statement
# begin while statement
L6:
        beqz $<RESULT_REGISTER>, L7
# begin break statement
        j L7
# end break statement
# begin while statement
L8:
        beqz $<RESULT_REGISTER>, L9
# begin break statement
        j L9
# end break statement
        j L8
L9:
# end while statement
        j L6
L7:
# end while statement
E0:
        lw $ra, 0($sp)
        addu $sp, $sp, 4
        jr $ra




## --------------- Run-time library --------------- ##

# void halt() 
LHalt:
        li $v0, 10
        syscall

# void printb(boolean)
LPrintb:
                        .data
                SFalseLen:
                        .word 5
                        .align 2
                SFalse:
                        .byte 102 , 97 , 108 , 115 , 101
                        .align 2
                STrueLen:
                        .word 4
                        .align 2
                STrue:
                        .byte 116 , 114 , 117 , 101
                        .align 2
        .text
        move $t0 $0          # loop condition
        beq $a0, 1, LPrintbTrue
        la $t1, SFalse      # address of string
        lw $t2, SFalseLen   # string length
        j LPrintbLoop
LPrintbTrue:
        la $t1, STrue       # address of string
        lw $t2, STrueLen    # string length
LPrintbLoop:
        bge $t0, $t2, LPrintbBreakpoint
        li $v0, 11
        lb $a0, ($t1)
        syscall
        addi $t1, $t1, 1
        addi $t0, $t0, 1
        j LPrintbLoop
LPrintbBreakpoint:
        jr $ra

# void printc(int)
LPrintc:
        li $v0, 11
        syscall
        jr $ra

# void printi(int)
LPrinti:
        li $v0, 1
        syscall
        jr $ra

# void prints(string)
LPrints:
        move $t0 $0          # loop condition
        move $t1, $a0        # address of string
LPrintsLoop:
        bge $t0, $s8, LPrintsBreakpoint
        li $v0, 11
        lb $a0, ($t1)
        syscall
        addi $t1, $t1, 1
        addi $t0, $t0, 1
        j LPrintsLoop
LPrintsBreakpoint:
        jr $ra

