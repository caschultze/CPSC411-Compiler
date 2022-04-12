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
P1:
        subu $sp, $sp, 20
        sw $ra, 0($sp)
        sw $a0, 4($sp)
        sw $a1, 8($sp)
        sw $a2, 12($sp)
        sw $a3, 16($sp)
# begin return statement
        lw $t0, 4($sp)
        lw $t1, 8($sp)
        mul $t2, $t0, $t1
        lw $t0, 12($sp)
        mul $t1, $t2, $t0
        lw $t0, 16($sp)
        mul $t2, $t1, $t0
        move $v0, $t2
        j E1
# end return statement
        .data
LS0Len: 
        .word 51
        .align 2
LS0: 
        .byte 114 , 117 , 110 , 116 , 105 , 109 , 101 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 102 , 117 , 110 , 99 , 116 , 105 , 111 , 110 , 32 , 34 , 102 , 111 , 111 , 34 , 32 , 109 , 117 , 115 , 116 , 32 , 114 , 101 , 116 , 117 , 114 , 110 , 32 , 97 , 32 , 118 , 97 , 108 , 117 , 101 , 10 , 0
        .align 2
        .text
        la $a0, LS0
        lw $s8, LS0Len
        j error
E1:
        lw $ra, 0($sp)
        addu $sp, $sp, 20
        jr $ra
P2:
        subu $sp, $sp, 16
        sw $ra, 0($sp)
        sw $a0, 4($sp)
        sw $a1, 8($sp)
        sw $a2, 12($sp)
# begin return statement
        lw $t0, 4($sp)
        lw $t1, 8($sp)
        lw $t2, 12($sp)
        lw $t3, G0
        li $t4, 3
        subu $t5, $t3, $t4
        move $a0, $t0
        move $a1, $t1
        move $a2, $t2
        move $a3, $t5
        jal P1

        move $t0, $v0
        move $v0, $t0
        j E2
# end return statement
        .data
LS1Len: 
        .word 51
        .align 2
LS1: 
        .byte 114 , 117 , 110 , 116 , 105 , 109 , 101 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 102 , 117 , 110 , 99 , 116 , 105 , 111 , 110 , 32 , 34 , 98 , 97 , 114 , 34 , 32 , 109 , 117 , 115 , 116 , 32 , 114 , 101 , 116 , 117 , 114 , 110 , 32 , 97 , 32 , 118 , 97 , 108 , 117 , 101 , 10 , 0
        .align 2
        .text
        la $a0, LS1
        lw $s8, LS1Len
        j error
E2:
        lw $ra, 0($sp)
        addu $sp, $sp, 16
        jr $ra
P3:
        subu $sp, $sp, 8
        sw $ra, 0($sp)
        sw $a0, 4($sp)
# begin stmtExpr
        lw $t0, G0
        li $t1, 1
        addu $t2, $t0, $t1
        sw $t2, G0
# end stmtExpr
# begin return statement
        lw $t0, 4($sp)
        move $v0, $t0
        j E3
# end return statement
        .data
LS2Len: 
        .word 51
        .align 2
LS2: 
        .byte 114 , 117 , 110 , 116 , 105 , 109 , 101 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 102 , 117 , 110 , 99 , 116 , 105 , 111 , 110 , 32 , 34 , 98 , 97 , 122 , 34 , 32 , 109 , 117 , 115 , 116 , 32 , 114 , 101 , 116 , 117 , 114 , 110 , 32 , 97 , 32 , 118 , 97 , 108 , 117 , 101 , 10 , 0
        .align 2
        .text
        la $a0, LS2
        lw $s8, LS2Len
        j error
E3:
        lw $ra, 0($sp)
        addu $sp, $sp, 8
        jr $ra
P0:
        subu $sp, $sp, 4
        sw $ra, 0($sp)
# begin stmtExpr
        li $t0, 10
        sw $t0, G0
# end stmtExpr
# begin stmtExpr
        li $t0, 1
        li $t1, 2
        li $t2, 3
        move $a0, $t2
        subu $sp, $sp, 4
        sw $t0, 0($sp)
        subu $sp, $sp, 4
        sw $t1, 0($sp)
        jal P3

        move $t2, $v0
        lw $t0, 0($sp)
        addu $sp, $sp, 4
        lw $t1, 0($sp)
        addu $sp, $sp, 4
        li $t3, 4
        move $a0, $t1
        move $a1, $t2
        move $a2, $t3
        subu $sp, $sp, 4
        sw $t0, 0($sp)
        jal P2

        move $t1, $v0
        lw $t0, 0($sp)
        addu $sp, $sp, 4
        li $t2, 5
        li $t3, 6
        move $a0, $t3
        subu $sp, $sp, 4
        sw $t0, 0($sp)
        subu $sp, $sp, 4
        sw $t1, 0($sp)
        subu $sp, $sp, 4
        sw $t2, 0($sp)
        jal P3

        move $t3, $v0
        lw $t0, 0($sp)
        addu $sp, $sp, 4
        lw $t1, 0($sp)
        addu $sp, $sp, 4
        lw $t2, 0($sp)
        addu $sp, $sp, 4
        li $t4, 7
        move $a0, $t2
        move $a1, $t3
        move $a2, $t4
        subu $sp, $sp, 4
        sw $t0, 0($sp)
        subu $sp, $sp, 4
        sw $t1, 0($sp)
        jal P2

        move $t2, $v0
        lw $t0, 0($sp)
        addu $sp, $sp, 4
        lw $t1, 0($sp)
        addu $sp, $sp, 4
        li $t3, 8
        move $a0, $t3
        subu $sp, $sp, 4
        sw $t0, 0($sp)
        subu $sp, $sp, 4
        sw $t1, 0($sp)
        subu $sp, $sp, 4
        sw $t2, 0($sp)
        jal P3

        move $t3, $v0
        lw $t0, 0($sp)
        addu $sp, $sp, 4
        lw $t1, 0($sp)
        addu $sp, $sp, 4
        lw $t2, 0($sp)
        addu $sp, $sp, 4
        move $a0, $t0
        move $a1, $t1
        move $a2, $t2
        move $a3, $t3
        jal P1

        move $t0, $v0
        move $a0, $t0
        jal LPrinti

# end stmtExpr
# begin stmtExpr
        .data
LS3Len: 
        .word 1
        .align 2
LS3: 
        .byte 10 , 0
        .align 2
        .text
        la $a0, LS3
        lw $s8, LS3Len
        jal LPrints

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

