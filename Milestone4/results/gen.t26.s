                    .text
                    .globl main
            main:
                     jal P0
                     li $v0, 10
                     syscall
P1:
        subu $sp, $sp, 12
        sw $ra, 0($sp)
        sw $a0, 4($sp)
        sw $a1, 8($sp)
# begin if statement
        lw $t0, 4($sp)
        li $t1, 0
        seq $t2, $t0, $t1
        bnez $t2, L1
        j L0
L1:
# begin stmtExpr
        li $t0, 0
        move $a0, $t0
        jal LPrinti

# end stmtExpr
# begin return statement
        j E1
# end return statement
L0:
# end if statement
# begin stmtExpr
        lw $t0, 4($sp)
        lw $t1, 8($sp)
        bnez $t1, L2
        .data
LS0Len: 
        .word 33
        .align 2
LS0: 
        .byte 114 , 117 , 110 , 116 , 105 , 109 , 101 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 100 , 105 , 118 , 105 , 115 , 105 , 111 , 110 , 32 , 98 , 121 , 32 , 122 , 101 , 114 , 111 , 10 , 0 # runtime error: division by zero
        .align 2
        .text
        la $a0, LS0
        lw $s8, LS0Len
        j error
L2:
        div $t2, $t0, $t1
        lw $t0, 8($sp)
        move $a0, $t2
        move $a1, $t0
        jal P1

# end stmtExpr
# begin stmtExpr
        lw $t0, 4($sp)
        lw $t1, 8($sp)
        bnez $t1, L3
        .data
LS1Len: 
        .word 31
        .align 2
LS1: 
        .byte 114 , 117 , 110 , 116 , 105 , 109 , 101 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 109 , 111 , 100 , 117 , 108 , 111 , 32 , 98 , 121 , 32 , 122 , 101 , 114 , 111 , 10 , 0 # runtime error: modulo by zero
        .align 2
        .text
        la $a0, LS1
        lw $s8, LS1Len
        j error
L3:
        rem $t2, $t0, $t1
        move $a0, $t2
        jal LPrinti

# end stmtExpr
E1:
        lw $ra, 0($sp)
        addu $sp, $sp, 12
        jr $ra
P2:
        subu $sp, $sp, 8
        sw $ra, 0($sp)
        sw $a0, 4($sp)
# begin stmtExpr
        lw $t0, 4($sp)
        move $a0, $t0
        jal LPrinti

# end stmtExpr
# begin stmtExpr
        .data
LS2Len: 
        .word 4
        .align 2
LS2: 
        .byte 32 , 61 , 32 , 10 , 0
        .align 2
        .text
        la $a0, LS2
        lw $s8, LS2Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        .data
LS3Len: 
        .word 1
        .align 2
LS3: 
        .byte 9 , 0
        .align 2
        .text
        la $a0, LS3
        lw $s8, LS3Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        lw $t0, 4($sp)
        li $t1, 2
        move $a0, $t0
        move $a1, $t1
        jal P1

# end stmtExpr
# begin stmtExpr
        .data
LS4Len: 
        .word 10
        .align 2
LS4: 
        .byte 32 , 40 , 98 , 97 , 115 , 101 , 32 , 50 , 41 , 10 , 0
        .align 2
        .text
        la $a0, LS4
        lw $s8, LS4Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        .data
LS5Len: 
        .word 1
        .align 2
LS5: 
        .byte 9 , 0
        .align 2
        .text
        la $a0, LS5
        lw $s8, LS5Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        lw $t0, 4($sp)
        li $t1, 8
        move $a0, $t0
        move $a1, $t1
        jal P1

# end stmtExpr
# begin stmtExpr
        .data
LS6Len: 
        .word 10
        .align 2
LS6: 
        .byte 32 , 40 , 98 , 97 , 115 , 101 , 32 , 56 , 41 , 10 , 0
        .align 2
        .text
        la $a0, LS6
        lw $s8, LS6Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        .data
LS7Len: 
        .word 1
        .align 2
LS7: 
        .byte 9 , 0
        .align 2
        .text
        la $a0, LS7
        lw $s8, LS7Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        lw $t0, 4($sp)
        li $t1, 10
        move $a0, $t0
        move $a1, $t1
        jal P1

# end stmtExpr
# begin stmtExpr
        .data
LS8Len: 
        .word 11
        .align 2
LS8: 
        .byte 32 , 40 , 98 , 97 , 115 , 101 , 32 , 49 , 48 , 41 , 10 , 0
        .align 2
        .text
        la $a0, LS8
        lw $s8, LS8Len
        jal LPrints

# end stmtExpr
E2:
        lw $ra, 0($sp)
        addu $sp, $sp, 8
        jr $ra
P0:
        subu $sp, $sp, 4
        sw $ra, 0($sp)
# begin stmtExpr
        li $t0, 0
        move $a0, $t0
        jal P2

# end stmtExpr
# begin stmtExpr
        li $t0, 17
        move $a0, $t0
        jal P2

# end stmtExpr
# begin stmtExpr
        li $t0, 42
        move $a0, $t0
        jal P2

# end stmtExpr
E0:
        lw $ra, 0($sp)
        addu $sp, $sp, 4
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

