                    .text
                    .globl main
            main:
                     jal P0
                     li $v0, 10
                     syscall
P0:
        subu $sp, $sp, 20
        sw $ra, 0($sp)
# begin stmtExpr
        li $t0, 2
        sw $t0, 4($sp)
# end stmtExpr
# begin stmtExpr
        li $t0, 1
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        li $t0, 0
        sw $t0, 16($sp)
# end stmtExpr
# begin stmtExpr
        .data
LS0Len: 
        .word 11
        .align 2
LS0: 
        .byte 102 , 105 , 98 , 40 , 48 , 41 , 32 , 61 , 32 , 48 , 10 , 0
        .align 2
        .text
        la $a0, LS0
        lw $s8, LS0Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        .data
LS1Len: 
        .word 11
        .align 2
LS1: 
        .byte 102 , 105 , 98 , 40 , 49 , 41 , 32 , 61 , 32 , 49 , 10 , 0
        .align 2
        .text
        la $a0, LS1
        lw $s8, LS1Len
        jal LPrints

# end stmtExpr
# begin while statement
L0:
        lw $t0, 4($sp)
        li $t1, 47
        slt $t2, $t0, $t1
        bnez $t2, L2
        j L1
L2:
# begin stmtExpr
        .data
LS2Len: 
        .word 4
        .align 2
LS2: 
        .byte 102 , 105 , 98 , 40 , 0
        .align 2
        .text
        la $a0, LS2
        lw $s8, LS2Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        lw $t0, 4($sp)
        move $a0, $t0
        jal LPrinti

# end stmtExpr
# begin stmtExpr
        .data
LS3Len: 
        .word 4
        .align 2
LS3: 
        .byte 41 , 32 , 61 , 32 , 0
        .align 2
        .text
        la $a0, LS3
        lw $s8, LS3Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        lw $t1, 16($sp)
        addu $t2, $t0, $t1
        sw $t2, 8($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, 8($sp)
        move $a0, $t0
        jal LPrinti

# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, 16($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, 8($sp)
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        .data
LS4Len: 
        .word 1
        .align 2
LS4: 
        .byte 10 , 0
        .align 2
        .text
        la $a0, LS4
        lw $s8, LS4Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        lw $t0, 4($sp)
        li $t1, 1
        addu $t2, $t0, $t1
        sw $t2, 4($sp)
# end stmtExpr
        j L0
L1:
# end while statement
E0:
        lw $ra, 0($sp)
        addu $sp, $sp, 20
        jr $ra




## --------------- Run-time library --------------- ##

# error
error: 
        jal LPrints
        li $v0, 10
        syscall

# int getchar()
LGetchar:
                        .data
                SGetchar:
                        .space 2
                        .align 2
         .text
         li $v0, 8
         la $a0, SGetchar
         li $a1, 2 # maybe this should be 2?
         syscall   # get string
         la $s8, SGetchar
         lb $s8, ($s8)
         beqz $s8, LGetcharEOF
         move $v0, $s8
         jr $ra
LGetcharEOF:
         li $v0, -1
         jr $ra

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

