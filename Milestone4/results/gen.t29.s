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
        .data
G2:
        .word 0
        .align 2
        .text
P1:
        subu $sp, $sp, 4
        sw $ra, 0($sp)
# begin stmtExpr
        .data
LS0Len: 
        .word 12
        .align 2
LS0: 
        .byte 101 , 118 , 97 , 108 , 117 , 97 , 116 , 101 , 100 , 32 , 65 , 10 , 0
        .align 2
        .text
        la $a0, LS0
        lw $s8, LS0Len
        jal LPrints

# end stmtExpr
# begin return statement
        lw $t0, G0
        move $v0, $t0
        j E1
# end return statement
        .data
LS1Len: 
        .word 49
        .align 2
LS1: 
        .byte 114 , 117 , 110 , 116 , 105 , 109 , 101 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 102 , 117 , 110 , 99 , 116 , 105 , 111 , 110 , 32 , 34 , 65 , 34 , 32 , 109 , 117 , 115 , 116 , 32 , 114 , 101 , 116 , 117 , 114 , 110 , 32 , 97 , 32 , 118 , 97 , 108 , 117 , 101 , 10 , 0
        .align 2
        .text
        la $a0, LS1
        lw $s8, LS1Len
        j error
E1:
        lw $ra, 0($sp)
        addu $sp, $sp, 4
        jr $ra
P2:
        subu $sp, $sp, 4
        sw $ra, 0($sp)
# begin stmtExpr
        .data
LS2Len: 
        .word 12
        .align 2
LS2: 
        .byte 101 , 118 , 97 , 108 , 117 , 97 , 116 , 101 , 100 , 32 , 66 , 10 , 0
        .align 2
        .text
        la $a0, LS2
        lw $s8, LS2Len
        jal LPrints

# end stmtExpr
# begin return statement
        lw $t0, G1
        move $v0, $t0
        j E2
# end return statement
        .data
LS3Len: 
        .word 49
        .align 2
LS3: 
        .byte 114 , 117 , 110 , 116 , 105 , 109 , 101 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 102 , 117 , 110 , 99 , 116 , 105 , 111 , 110 , 32 , 34 , 66 , 34 , 32 , 109 , 117 , 115 , 116 , 32 , 114 , 101 , 116 , 117 , 114 , 110 , 32 , 97 , 32 , 118 , 97 , 108 , 117 , 101 , 10 , 0
        .align 2
        .text
        la $a0, LS3
        lw $s8, LS3Len
        j error
E2:
        lw $ra, 0($sp)
        addu $sp, $sp, 4
        jr $ra
P3:
        subu $sp, $sp, 4
        sw $ra, 0($sp)
# begin stmtExpr
        .data
LS4Len: 
        .word 12
        .align 2
LS4: 
        .byte 101 , 118 , 97 , 108 , 117 , 97 , 116 , 101 , 100 , 32 , 67 , 10 , 0
        .align 2
        .text
        la $a0, LS4
        lw $s8, LS4Len
        jal LPrints

# end stmtExpr
# begin return statement
        lw $t0, G2
        move $v0, $t0
        j E3
# end return statement
        .data
LS5Len: 
        .word 49
        .align 2
LS5: 
        .byte 114 , 117 , 110 , 116 , 105 , 109 , 101 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 102 , 117 , 110 , 99 , 116 , 105 , 111 , 110 , 32 , 34 , 67 , 34 , 32 , 109 , 117 , 115 , 116 , 32 , 114 , 101 , 116 , 117 , 114 , 110 , 32 , 97 , 32 , 118 , 97 , 108 , 117 , 101 , 10 , 0
        .align 2
        .text
        la $a0, LS5
        lw $s8, LS5Len
        j error
E3:
        lw $ra, 0($sp)
        addu $sp, $sp, 4
        jr $ra
P4:
        subu $sp, $sp, 16
        sw $ra, 0($sp)
        sw $a0, 4($sp)
        sw $a1, 8($sp)
        sw $a2, 12($sp)
# begin stmtExpr
        lw $t0, 4($sp)
        sw $t0, G0
# end stmtExpr
# begin stmtExpr
        lw $t0, 8($sp)
        sw $t0, G1
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G2
# end stmtExpr
# begin stmtExpr
        .data
LS6Len: 
        .word 44
        .align 2
LS6: 
        .byte 105 , 102 , 32 , 40 , 40 , 65 , 32 , 38 , 38 , 32 , 66 , 41 , 32 , 124 , 124 , 32 , 67 , 41 , 32 , 123 , 46 , 46 , 46 , 125 , 32 , 101 , 108 , 115 , 101 , 32 , 123 , 46 , 46 , 46 , 125 , 44 , 32 , 119 , 105 , 116 , 104 , 32 , 65 , 61 , 0
        .align 2
        .text
        la $a0, LS6
        lw $s8, LS6Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        lw $t0, G0
        move $a0, $t0
        jal LPrintb

# end stmtExpr
# begin stmtExpr
        .data
LS7Len: 
        .word 3
        .align 2
LS7: 
        .byte 32 , 66 , 61 , 0
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
        .word 3
        .align 2
LS8: 
        .byte 32 , 67 , 61 , 0
        .align 2
        .text
        la $a0, LS8
        lw $s8, LS8Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        lw $t0, G2
        move $a0, $t0
        jal LPrintb

# end stmtExpr
# begin stmtExpr
        .data
LS9Len: 
        .word 1
        .align 2
LS9: 
        .byte 10 , 0
        .align 2
        .text
        la $a0, LS9
        lw $s8, LS9Len
        jal LPrints

# end stmtExpr
# begin ifElse statement
        jal P1

        move $t0, $v0
        move $t1, $t0
        bnez $t1, L6
        j L5
L6:
        subu $sp, $sp, 4
        sw $t1, 0($sp)
        jal P2

        move $t0, $v0
        lw $t1, 0($sp)
        addu $sp, $sp, 4
        move $t1, $t0
L5:
        move $t0, $t1
        beqz $t0, L4
        j L3
L4:
        subu $sp, $sp, 4
        sw $t0, 0($sp)
        jal P3

        move $t1, $v0
        lw $t0, 0($sp)
        addu $sp, $sp, 4
        move $t0, $t1
L3:
        bnez $t0, L2
        j L0
L2:
# begin stmtExpr
        .data
LS10Len: 
        .word 17
        .align 2
LS10: 
        .byte 105 , 102 , 45 , 112 , 97 , 114 , 116 , 32 , 101 , 120 , 101 , 99 , 117 , 116 , 101 , 100 , 10 , 0
        .align 2
        .text
        la $a0, LS10
        lw $s8, LS10Len
        jal LPrints

# end stmtExpr
        j L1
L0:
# begin stmtExpr
        .data
LS11Len: 
        .word 19
        .align 2
LS11: 
        .byte 101 , 108 , 115 , 101 , 45 , 112 , 97 , 114 , 116 , 32 , 101 , 120 , 101 , 99 , 117 , 116 , 101 , 100 , 10 , 0
        .align 2
        .text
        la $a0, LS11
        lw $s8, LS11Len
        jal LPrints

# end stmtExpr
L1:
# end ifElse statement
E4:
        lw $ra, 0($sp)
        addu $sp, $sp, 16
        jr $ra
P5:
        subu $sp, $sp, 20
        sw $ra, 0($sp)
        sw $a0, 4($sp)
        sw $a1, 8($sp)
        sw $a2, 12($sp)
# begin stmtExpr
        lw $t0, 4($sp)
        sw $t0, G0
# end stmtExpr
# begin stmtExpr
        lw $t0, 8($sp)
        sw $t0, G1
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G2
# end stmtExpr
# begin stmtExpr
        .data
LS12Len: 
        .word 27
        .align 2
LS12: 
        .byte 120 , 32 , 61 , 32 , 40 , 65 , 32 , 38 , 38 , 32 , 33 , 66 , 41 , 32 , 124 , 124 , 32 , 67 , 44 , 32 , 119 , 105 , 116 , 104 , 32 , 65 , 61 , 0
        .align 2
        .text
        la $a0, LS12
        lw $s8, LS12Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        lw $t0, G0
        move $a0, $t0
        jal LPrintb

# end stmtExpr
# begin stmtExpr
        .data
LS13Len: 
        .word 3
        .align 2
LS13: 
        .byte 32 , 66 , 61 , 0
        .align 2
        .text
        la $a0, LS13
        lw $s8, LS13Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        lw $t0, G1
        move $a0, $t0
        jal LPrintb

# end stmtExpr
# begin stmtExpr
        .data
LS14Len: 
        .word 3
        .align 2
LS14: 
        .byte 32 , 67 , 61 , 0
        .align 2
        .text
        la $a0, LS14
        lw $s8, LS14Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        lw $t0, G2
        move $a0, $t0
        jal LPrintb

# end stmtExpr
# begin stmtExpr
        .data
LS15Len: 
        .word 1
        .align 2
LS15: 
        .byte 10 , 0
        .align 2
        .text
        la $a0, LS15
        lw $s8, LS15Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        jal P1

        move $t0, $v0
        move $t1, $t0
        bnez $t1, L10
        j L9
L10:
        subu $sp, $sp, 4
        sw $t1, 0($sp)
        jal P2

        move $t0, $v0
        lw $t1, 0($sp)
        addu $sp, $sp, 4
        xori $t0, $t0, 1
        move $t1, $t0
L9:
        move $t0, $t1
        beqz $t0, L8
        j L7
L8:
        subu $sp, $sp, 4
        sw $t0, 0($sp)
        jal P3

        move $t1, $v0
        lw $t0, 0($sp)
        addu $sp, $sp, 4
        move $t0, $t1
L7:
        sw $t0, 16($sp)
# end stmtExpr
# begin stmtExpr
        .data
LS16Len: 
        .word 2
        .align 2
LS16: 
        .byte 120 , 61 , 0
        .align 2
        .text
        la $a0, LS16
        lw $s8, LS16Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        lw $t0, 16($sp)
        move $a0, $t0
        jal LPrintb

# end stmtExpr
# begin stmtExpr
        .data
LS17Len: 
        .word 1
        .align 2
LS17: 
        .byte 10 , 0
        .align 2
        .text
        la $a0, LS17
        lw $s8, LS17Len
        jal LPrints

# end stmtExpr
E5:
        lw $ra, 0($sp)
        addu $sp, $sp, 20
        jr $ra
P0:
        subu $sp, $sp, 4
        sw $ra, 0($sp)
# begin stmtExpr
        li $t0, 0
        li $t1, 0
        li $t2, 0
        move $a0, $t0
        move $a1, $t1
        move $a2, $t2
        jal P4

# end stmtExpr
# begin stmtExpr
        .data
LS18Len: 
        .word 1
        .align 2
LS18: 
        .byte 10 , 0
        .align 2
        .text
        la $a0, LS18
        lw $s8, LS18Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        li $t0, 0
        li $t1, 0
        li $t2, 1
        move $a0, $t0
        move $a1, $t1
        move $a2, $t2
        jal P4

# end stmtExpr
# begin stmtExpr
        .data
LS19Len: 
        .word 1
        .align 2
LS19: 
        .byte 10 , 0
        .align 2
        .text
        la $a0, LS19
        lw $s8, LS19Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        li $t0, 0
        li $t1, 1
        li $t2, 0
        move $a0, $t0
        move $a1, $t1
        move $a2, $t2
        jal P4

# end stmtExpr
# begin stmtExpr
        .data
LS20Len: 
        .word 1
        .align 2
LS20: 
        .byte 10 , 0
        .align 2
        .text
        la $a0, LS20
        lw $s8, LS20Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        li $t0, 0
        li $t1, 1
        li $t2, 1
        move $a0, $t0
        move $a1, $t1
        move $a2, $t2
        jal P4

# end stmtExpr
# begin stmtExpr
        .data
LS21Len: 
        .word 1
        .align 2
LS21: 
        .byte 10 , 0
        .align 2
        .text
        la $a0, LS21
        lw $s8, LS21Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        li $t0, 1
        li $t1, 0
        li $t2, 0
        move $a0, $t0
        move $a1, $t1
        move $a2, $t2
        jal P4

# end stmtExpr
# begin stmtExpr
        .data
LS22Len: 
        .word 1
        .align 2
LS22: 
        .byte 10 , 0
        .align 2
        .text
        la $a0, LS22
        lw $s8, LS22Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        li $t0, 1
        li $t1, 0
        li $t2, 1
        move $a0, $t0
        move $a1, $t1
        move $a2, $t2
        jal P4

# end stmtExpr
# begin stmtExpr
        .data
LS23Len: 
        .word 1
        .align 2
LS23: 
        .byte 10 , 0
        .align 2
        .text
        la $a0, LS23
        lw $s8, LS23Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        li $t0, 1
        li $t1, 1
        li $t2, 0
        move $a0, $t0
        move $a1, $t1
        move $a2, $t2
        jal P4

# end stmtExpr
# begin stmtExpr
        .data
LS24Len: 
        .word 1
        .align 2
LS24: 
        .byte 10 , 0
        .align 2
        .text
        la $a0, LS24
        lw $s8, LS24Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        li $t0, 1
        li $t1, 1
        li $t2, 1
        move $a0, $t0
        move $a1, $t1
        move $a2, $t2
        jal P4

# end stmtExpr
# begin stmtExpr
        .data
LS25Len: 
        .word 1
        .align 2
LS25: 
        .byte 10 , 0
        .align 2
        .text
        la $a0, LS25
        lw $s8, LS25Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        li $t0, 0
        li $t1, 0
        li $t2, 0
        move $a0, $t0
        move $a1, $t1
        move $a2, $t2
        jal P5

# end stmtExpr
# begin stmtExpr
        .data
LS26Len: 
        .word 1
        .align 2
LS26: 
        .byte 10 , 0
        .align 2
        .text
        la $a0, LS26
        lw $s8, LS26Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        li $t0, 0
        li $t1, 0
        li $t2, 1
        move $a0, $t0
        move $a1, $t1
        move $a2, $t2
        jal P5

# end stmtExpr
# begin stmtExpr
        .data
LS27Len: 
        .word 1
        .align 2
LS27: 
        .byte 10 , 0
        .align 2
        .text
        la $a0, LS27
        lw $s8, LS27Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        li $t0, 0
        li $t1, 1
        li $t2, 0
        move $a0, $t0
        move $a1, $t1
        move $a2, $t2
        jal P5

# end stmtExpr
# begin stmtExpr
        .data
LS28Len: 
        .word 1
        .align 2
LS28: 
        .byte 10 , 0
        .align 2
        .text
        la $a0, LS28
        lw $s8, LS28Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        li $t0, 0
        li $t1, 1
        li $t2, 1
        move $a0, $t0
        move $a1, $t1
        move $a2, $t2
        jal P5

# end stmtExpr
# begin stmtExpr
        .data
LS29Len: 
        .word 1
        .align 2
LS29: 
        .byte 10 , 0
        .align 2
        .text
        la $a0, LS29
        lw $s8, LS29Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        li $t0, 1
        li $t1, 0
        li $t2, 0
        move $a0, $t0
        move $a1, $t1
        move $a2, $t2
        jal P5

# end stmtExpr
# begin stmtExpr
        .data
LS30Len: 
        .word 1
        .align 2
LS30: 
        .byte 10 , 0
        .align 2
        .text
        la $a0, LS30
        lw $s8, LS30Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        li $t0, 1
        li $t1, 0
        li $t2, 1
        move $a0, $t0
        move $a1, $t1
        move $a2, $t2
        jal P5

# end stmtExpr
# begin stmtExpr
        .data
LS31Len: 
        .word 1
        .align 2
LS31: 
        .byte 10 , 0
        .align 2
        .text
        la $a0, LS31
        lw $s8, LS31Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        li $t0, 1
        li $t1, 1
        li $t2, 0
        move $a0, $t0
        move $a1, $t1
        move $a2, $t2
        jal P5

# end stmtExpr
# begin stmtExpr
        .data
LS32Len: 
        .word 1
        .align 2
LS32: 
        .byte 10 , 0
        .align 2
        .text
        la $a0, LS32
        lw $s8, LS32Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        li $t0, 1
        li $t1, 1
        li $t2, 1
        move $a0, $t0
        move $a1, $t1
        move $a2, $t2
        jal P5

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

