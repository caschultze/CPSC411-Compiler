                    .text
                    .globl main
            main:
                     jal P0
                     li $v0, 10
                     syscall
        .data
G0:
        .word 0
        .text
        .data
G1:
        .word 0
        .text
        .data
G2:
        .word 0
        .text
        .data
G3:
        .word 0
        .text
        .data
G4:
        .word 0
        .text
        .data
G5:
        .word 0
        .text
        .data
G6:
        .word 0
        .text
        .data
G7:
        .word 0
        .text
        .data
G8:
        .word 0
        .text
        .data
G9:
        .word 0
        .text
        .data
G10:
        .word 0
        .text
        .data
G11:
        .word 0
        .text
        .data
G12:
        .word 0
        .text
        .data
G13:
        .word 0
        .text
        .data
G14:
        .word 0
        .text
        .data
G15:
        .word 0
        .text
        .data
G16:
        .word 0
        .text
        .data
G17:
        .word 0
        .text
        .data
G18:
        .word 0
        .text
        .data
G19:
        .word 0
        .text
        .data
G20:
        .word 0
        .text
        .data
G21:
        .word 0
        .text
P0:
        subu $sp, $sp, 4
        sw $ra, 0($sp)
# begin stmtExpr
        jal P1

# end stmtExpr
E0:
        lw $ra, 0($sp)
        addu $sp, $sp, 4
        jr $ra
P1:
        subu $sp, $sp, 4
        sw $ra, 0($sp)
# begin stmtExpr
        li $t0, -1
        sw $t0, G0
# end stmtExpr
# begin stmtExpr
        li $t0, 48
        sw $t0, G10
# end stmtExpr
# begin stmtExpr
        li $t0, 57
        sw $t0, G11
# end stmtExpr
# begin stmtExpr
        li $t0, 43
        sw $t0, G12
# end stmtExpr
# begin stmtExpr
        li $t0, 45
        sw $t0, G13
# end stmtExpr
# begin stmtExpr
        li $t0, 42
        sw $t0, G14
# end stmtExpr
# begin stmtExpr
        li $t0, 47
        sw $t0, G15
# end stmtExpr
# begin stmtExpr
        li $t0, 40
        sw $t0, G16
# end stmtExpr
# begin stmtExpr
        li $t0, 41
        sw $t0, G17
# end stmtExpr
# begin stmtExpr
        li $t0, 32
        sw $t0, G18
# end stmtExpr
# begin stmtExpr
        li $t0, 9
        sw $t0, G19
# end stmtExpr
# begin stmtExpr
        li $t0, 13
        sw $t0, G20
# end stmtExpr
# begin stmtExpr
        li $t0, 10
        sw $t0, G21
# end stmtExpr
# begin stmtExpr
        li $t0, 256
        sw $t0, G1
# end stmtExpr
# begin stmtExpr
        li $t0, 257
        sw $t0, G3
# end stmtExpr
# begin stmtExpr
        lw $t0, G12
        sw $t0, G4
# end stmtExpr
# begin stmtExpr
        lw $t0, G13
        sw $t0, G5
# end stmtExpr
# begin stmtExpr
        lw $t0, G14
        sw $t0, G6
# end stmtExpr
# begin stmtExpr
        lw $t0, G15
        sw $t0, G7
# end stmtExpr
# begin stmtExpr
        lw $t0, G16
        sw $t0, G8
# end stmtExpr
# begin stmtExpr
        lw $t0, G17
        sw $t0, G9
# end stmtExpr
# begin stmtExpr
        lw $t0, G21
        sw $t0, G2
# end stmtExpr
E1:
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

