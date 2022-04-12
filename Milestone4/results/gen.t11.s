                    .text
                    .globl main
            main:
                     jal P0
                     li $v0, 10
                     syscall
        .data
G0:
        .word 0
        .align 2
        .text
        .data
G1:
        .word 0
        .align 2
        .text
P1:
        subu $sp, $sp, 12
        sw $ra, 0($sp)
# begin stmtExpr
        .data
LS0Len: 
        .word 43
        .align 2
LS0: 
        .byte 10 , 40 , 105 , 116 , 39 , 115 , 32 , 111 , 107 , 32 , 105 , 102 , 32 , 116 , 104 , 101 , 32 , 102 , 111 , 108 , 108 , 111 , 119 , 105 , 110 , 103 , 32 , 97 , 114 , 101 , 110 , 39 , 116 , 32 , 48 , 47 , 102 , 97 , 108 , 115 , 101 , 41 , 10 , 0
        .align 2
        .text
        la $a0, LS0
        lw $s8, LS0Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        .data
LS1Len: 
        .word 26
        .align 2
LS1: 
        .byte 9 , 108 , 111 , 99 , 97 , 108 , 32 , 105 , 110 , 116 , 32 , 100 , 101 , 102 , 97 , 117 , 108 , 116 , 32 , 118 , 97 , 108 , 117 , 101 , 58 , 32 , 0
        .align 2
        .text
        la $a0, LS1
        lw $s8, LS1Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        lw $t0, 4($sp)
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
        .data
LS3Len: 
        .word 30
        .align 2
LS3: 
        .byte 9 , 108 , 111 , 99 , 97 , 108 , 32 , 98 , 111 , 111 , 108 , 101 , 97 , 110 , 32 , 100 , 101 , 102 , 97 , 117 , 108 , 116 , 32 , 118 , 97 , 108 , 117 , 101 , 58 , 32 , 0
        .align 2
        .text
        la $a0, LS3
        lw $s8, LS3Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        lw $t0, 8($sp)
        move $a0, $t0
        jal LPrintb

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
        li $t0, 123
        sw $t0, 4($sp)
# end stmtExpr
# begin stmtExpr
        li $t0, 1
        sw $t0, 8($sp)
# end stmtExpr
E1:
        lw $ra, 0($sp)
        addu $sp, $sp, 12
        jr $ra
P0:
        subu $sp, $sp, 4
        sw $ra, 0($sp)
# begin stmtExpr
        .data
LS5Len: 
        .word 26
        .align 2
LS5: 
        .byte 103 , 108 , 111 , 98 , 97 , 108 , 32 , 105 , 110 , 116 , 32 , 100 , 101 , 102 , 97 , 117 , 108 , 116 , 32 , 118 , 97 , 108 , 117 , 101 , 58 , 32 , 0
        .align 2
        .text
        la $a0, LS5
        lw $s8, LS5Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        lw $t0, G0
        move $a0, $t0
        jal LPrinti

# end stmtExpr
# begin stmtExpr
        .data
LS6Len: 
        .word 1
        .align 2
LS6: 
        .byte 10 , 0
        .align 2
        .text
        la $a0, LS6
        lw $s8, LS6Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        .data
LS7Len: 
        .word 30
        .align 2
LS7: 
        .byte 103 , 108 , 111 , 98 , 97 , 108 , 32 , 98 , 111 , 111 , 108 , 101 , 97 , 110 , 32 , 100 , 101 , 102 , 97 , 117 , 108 , 116 , 32 , 118 , 97 , 108 , 117 , 101 , 58 , 32 , 0
        .align 2
        .text
        la $a0, LS7
        lw $s8, LS7Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        lw $t0, G1
        move $a0, $t0
        jal LPrintb

# end stmtExpr
# begin stmtExpr
        .data
LS8Len: 
        .word 1
        .align 2
LS8: 
        .byte 10 , 0
        .align 2
        .text
        la $a0, LS8
        lw $s8, LS8Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        jal P1

# end stmtExpr
# begin stmtExpr
        jal P1

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

