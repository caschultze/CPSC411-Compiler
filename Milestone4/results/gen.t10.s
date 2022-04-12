                    .text
                    .globl main
            main:
                     jal P0
                     li $v0, 10
                     syscall
P0:
        subu $sp, $sp, 8
        sw $ra, 0($sp)
# begin stmtExpr
        li $t0, 0
        sw $t0, 4($sp)
# end stmtExpr
# begin while statement
L0:
        lw $t0, 4($sp)
        li $t1, 46
        sle $t2, $t0, $t1
        bnez $t2, L2
        j L1
L2:
# begin stmtExpr
        .data
LS0Len: 
        .word 4
        .align 2
LS0: 
        .byte 102 , 105 , 98 , 40 , 0
        .align 2
        .text
        la $a0, LS0
        lw $s8, LS0Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        lw $t0, 4($sp)
        move $a0, $t0
        jal LPrinti

# end stmtExpr
# begin stmtExpr
        .data
LS1Len: 
        .word 4
        .align 2
LS1: 
        .byte 41 , 32 , 61 , 32 , 0
        .align 2
        .text
        la $a0, LS1
        lw $s8, LS1Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        lw $t0, 4($sp)
        move $a0, $t0
        jal P1

        move $t0, $v0
        move $a0, $t0
        jal LPrinti

# end stmtExpr
# begin stmtExpr
        .data
LS2Len: 
        .word 1
        .align 2
LS2: 
        .byte 10 , 0
        .align 2
        .text
        la $a0, LS2
        lw $s8, LS2Len
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
        addu $sp, $sp, 8
        jr $ra
P1:
        subu $sp, $sp, 8
        sw $ra, 0($sp)
        sw $a0, 4($sp)
# begin if statement
        lw $t0, 4($sp)
        li $t1, 0
        seq $t2, $t0, $t1
        bnez $t2, L4
        j L3
L4:
# begin return statement
        li $t0, 0
        move $v0, $t0
        j E1
# end return statement
L3:
# end if statement
# begin if statement
        lw $t0, 4($sp)
        li $t1, 1
        seq $t2, $t0, $t1
        bnez $t2, L6
        j L5
L6:
# begin return statement
        li $t0, 1
        move $v0, $t0
        j E1
# end return statement
L5:
# end if statement
# begin return statement
        lw $t0, 4($sp)
        li $t1, 1
        subu $t2, $t0, $t1
        move $a0, $t2
        jal P1

        move $t0, $v0
        lw $t1, 4($sp)
        li $t2, 2
        subu $t3, $t1, $t2
        move $a0, $t3
        subu $sp, $sp, 4
        sw $t0, 0($sp)
        jal P1

        move $t1, $v0
        lw $t0, 0($sp)
        addu $sp, $sp, 4
        addu $t2, $t0, $t1
        move $v0, $t2
        j E1
# end return statement
        .data
LS3Len: 
        .word 51
        .align 2
LS3: 
        .byte 114 , 117 , 110 , 116 , 105 , 109 , 101 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 102 , 117 , 110 , 99 , 116 , 105 , 111 , 110 , 32 , 34 , 102 , 105 , 98 , 34 , 32 , 109 , 117 , 115 , 116 , 32 , 114 , 101 , 116 , 117 , 114 , 110 , 32 , 97 , 32 , 118 , 97 , 108 , 117 , 101 , 10 , 0
        .align 2
        .text
        la $a0, LS3
        lw $s8, LS3Len
        j error
E1:
        lw $ra, 0($sp)
        addu $sp, $sp, 8
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

