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
        .data
G3:
        .word 0
        .align 2
        .text
        .data
G4:
        .word 0
        .align 2
        .text
        .data
G5:
        .word 0
        .align 2
        .text
        .data
G6:
        .word 0
        .align 2
        .text
        .data
G7:
        .word 0
        .align 2
        .text
        .data
G8:
        .word 0
        .align 2
        .text
        .data
G9:
        .word 0
        .align 2
        .text
        .data
G10:
        .word 0
        .align 2
        .text
        .data
G11:
        .word 0
        .align 2
        .text
        .data
G12:
        .word 0
        .align 2
        .text
        .data
G13:
        .word 0
        .align 2
        .text
        .data
G14:
        .word 0
        .align 2
        .text
        .data
G15:
        .word 0
        .align 2
        .text
        .data
G16:
        .word 0
        .align 2
        .text
        .data
G17:
        .word 0
        .align 2
        .text
        .data
G18:
        .word 0
        .align 2
        .text
        .data
G19:
        .word 0
        .align 2
        .text
        .data
G20:
        .word 0
        .align 2
        .text
        .data
G21:
        .word 0
        .align 2
        .text
        .data
G22:
        .word 0
        .align 2
        .text
        .data
G23:
        .word 0
        .align 2
        .text
        .data
G24:
        .word 0
        .align 2
        .text
        .data
G25:
        .word 0
        .align 2
        .text
        .data
G26:
        .word 0
        .align 2
        .text
P0:
        subu $sp, $sp, 4
        sw $ra, 0($sp)
# begin stmtExpr
        jal P12

# end stmtExpr
# begin stmtExpr
        jal P8

# end stmtExpr
E0:
        lw $ra, 0($sp)
        addu $sp, $sp, 4
        jr $ra
P1:
        subu $sp, $sp, 4
        sw $ra, 0($sp)
# begin if statement
        lw $t0, G0
        bnez $t0, L1
        j L0
L1:
# begin stmtExpr
        li $t0, 0
        sw $t0, G0
# end stmtExpr
# begin return statement
        lw $t0, G1
        move $v0, $t0
        j E1
# end return statement
L0:
# end if statement
# begin return statement
        jal LGetchar

        move $t0, $v0
        move $v0, $t0
        j E1
# end return statement
        .data
LS0Len: 
        .word 52
        .align 2
LS0: 
        .byte 114 , 117 , 110 , 116 , 105 , 109 , 101 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 102 , 117 , 110 , 99 , 116 , 105 , 111 , 110 , 32 , 34 , 103 , 101 , 116 , 99 , 34 , 32 , 109 , 117 , 115 , 116 , 32 , 114 , 101 , 116 , 117 , 114 , 110 , 32 , 97 , 32 , 118 , 97 , 108 , 117 , 101 , 10 , 0
        .align 2
        .text
        la $a0, LS0
        lw $s8, LS0Len
        j error
E1:
        lw $ra, 0($sp)
        addu $sp, $sp, 4
        jr $ra
P2:
        subu $sp, $sp, 8
        sw $ra, 0($sp)
        sw $a0, 4($sp)
# begin if statement
        lw $t0, G0
        bnez $t0, L3
        j L2
L3:
# begin stmtExpr
        .data
LS1Len: 
        .word 33
        .align 2
LS1: 
        .byte 73 , 110 , 116 , 101 , 114 , 110 , 97 , 108 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 116 , 111 , 111 , 32 , 109 , 97 , 110 , 121 , 32 , 117 , 110 , 103 , 101 , 116 , 115 , 33 , 10 , 0
        .align 2
        .text
        la $a0, LS1
        lw $s8, LS1Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        jal LHalt

# end stmtExpr
L2:
# end if statement
# begin stmtExpr
        li $t0, 1
        sw $t0, G0
# end stmtExpr
# begin stmtExpr
        lw $t0, 4($sp)
        sw $t0, G1
# end stmtExpr
E2:
        lw $ra, 0($sp)
        addu $sp, $sp, 8
        jr $ra
P3:
        subu $sp, $sp, 4
        sw $ra, 0($sp)
# begin if statement
        lw $t0, G2
        bnez $t0, L5
        j L4
L5:
# begin return statement
        lw $t0, G3
        move $v0, $t0
        j E3
# end return statement
L4:
# end if statement
# begin stmtExpr
        li $t0, 1
        sw $t0, G2
# end stmtExpr
# begin return statement
        jal P5

        move $t0, $v0
        sw $t0, G3
        move $v0, $t0
        j E3
# end return statement
        .data
LS2Len: 
        .word 52
        .align 2
LS2: 
        .byte 114 , 117 , 110 , 116 , 105 , 109 , 101 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 102 , 117 , 110 , 99 , 116 , 105 , 111 , 110 , 32 , 34 , 112 , 101 , 101 , 107 , 34 , 32 , 109 , 117 , 115 , 116 , 32 , 114 , 101 , 116 , 117 , 114 , 110 , 32 , 97 , 32 , 118 , 97 , 108 , 117 , 101 , 10 , 0
        .align 2
        .text
        la $a0, LS2
        lw $s8, LS2Len
        j error
E3:
        lw $ra, 0($sp)
        addu $sp, $sp, 4
        jr $ra
P4:
        subu $sp, $sp, 8
        sw $ra, 0($sp)
        sw $a0, 4($sp)
# begin if statement
        jal P3

        move $t0, $v0
        lw $t1, 4($sp)
        sne $t2, $t0, $t1
        bnez $t2, L7
        j L6
L7:
# begin stmtExpr
        .data
LS3Len: 
        .word 16
        .align 2
LS3: 
        .byte 69 , 114 , 114 , 111 , 114 , 58 , 32 , 101 , 120 , 112 , 101 , 99 , 116 , 101 , 100 , 32 , 0
        .align 2
        .text
        la $a0, LS3
        lw $s8, LS3Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        lw $t0, 4($sp)
        move $a0, $t0
        jal LPrintc

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
        jal LHalt

# end stmtExpr
L6:
# end if statement
# begin stmtExpr
        li $t0, 0
        sw $t0, G2
# end stmtExpr
E4:
        lw $ra, 0($sp)
        addu $sp, $sp, 8
        jr $ra
P5:
        subu $sp, $sp, 8
        sw $ra, 0($sp)
# begin while statement
L8:
        jal P1

        move $t0, $v0
        sw $t0, 4($sp)
        move $a0, $t0
        jal P7

        move $t0, $v0
        bnez $t0, L10
        j L9
L10:
        j L8
L9:
# end while statement
# begin if statement
        lw $t0, 4($sp)
        lw $t1, G5
        seq $t2, $t0, $t1
        bnez $t2, L12
        j L11
L12:
# begin return statement
        lw $t0, G6
        move $v0, $t0
        j E5
# end return statement
L11:
# end if statement
# begin if statement
        lw $t0, 4($sp)
        lw $t1, G26
        seq $t2, $t0, $t1
        bnez $t2, L14
        j L13
L14:
# begin return statement
        lw $t0, G7
        move $v0, $t0
        j E5
# end return statement
L13:
# end if statement
# begin if statement
        lw $t0, 4($sp)
        lw $t1, G17
        seq $t2, $t0, $t1
        bnez $t2, L16
        j L15
L16:
# begin return statement
        lw $t0, G9
        move $v0, $t0
        j E5
# end return statement
L15:
# end if statement
# begin if statement
        lw $t0, 4($sp)
        lw $t1, G18
        seq $t2, $t0, $t1
        bnez $t2, L18
        j L17
L18:
# begin return statement
        lw $t0, G10
        move $v0, $t0
        j E5
# end return statement
L17:
# end if statement
# begin if statement
        lw $t0, 4($sp)
        lw $t1, G19
        seq $t2, $t0, $t1
        bnez $t2, L20
        j L19
L20:
# begin return statement
        lw $t0, G11
        move $v0, $t0
        j E5
# end return statement
L19:
# end if statement
# begin if statement
        lw $t0, 4($sp)
        lw $t1, G20
        seq $t2, $t0, $t1
        bnez $t2, L22
        j L21
L22:
# begin return statement
        lw $t0, G12
        move $v0, $t0
        j E5
# end return statement
L21:
# end if statement
# begin if statement
        lw $t0, 4($sp)
        lw $t1, G21
        seq $t2, $t0, $t1
        bnez $t2, L24
        j L23
L24:
# begin return statement
        lw $t0, G13
        move $v0, $t0
        j E5
# end return statement
L23:
# end if statement
# begin if statement
        lw $t0, 4($sp)
        lw $t1, G22
        seq $t2, $t0, $t1
        bnez $t2, L26
        j L25
L26:
# begin return statement
        lw $t0, G14
        move $v0, $t0
        j E5
# end return statement
L25:
# end if statement
# begin if statement
        lw $t0, 4($sp)
        move $a0, $t0
        jal P6

        move $t0, $v0
        bnez $t0, L28
        j L27
L28:
# begin stmtExpr
        li $t0, 0
        sw $t0, G4
# end stmtExpr
# begin while statement
L29:
        lw $t0, 4($sp)
        move $a0, $t0
        jal P6

        move $t0, $v0
        bnez $t0, L31
        j L30
L31:
# begin stmtExpr
        lw $t0, G4
        li $t1, 10
        mul $t2, $t0, $t1
        lw $t0, 4($sp)
        lw $t1, G15
        subu $t3, $t0, $t1
        addu $t0, $t2, $t3
        sw $t0, G4
# end stmtExpr
# begin stmtExpr
        jal P1

        move $t0, $v0
        sw $t0, 4($sp)
# end stmtExpr
        j L29
L30:
# end while statement
# begin stmtExpr
        lw $t0, 4($sp)
        move $a0, $t0
        jal P2

# end stmtExpr
# begin return statement
        lw $t0, G8
        move $v0, $t0
        j E5
# end return statement
L27:
# end if statement
# begin stmtExpr
        .data
LS5Len: 
        .word 26
        .align 2
LS5: 
        .byte 69 , 114 , 114 , 111 , 114 , 58 , 32 , 105 , 110 , 118 , 97 , 108 , 105 , 100 , 32 , 99 , 104 , 97 , 114 , 97 , 99 , 116 , 101 , 114 , 46 , 10 , 0
        .align 2
        .text
        la $a0, LS5
        lw $s8, LS5Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        jal LHalt

# end stmtExpr
        .data
LS6Len: 
        .word 55
        .align 2
LS6: 
        .byte 114 , 117 , 110 , 116 , 105 , 109 , 101 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 102 , 117 , 110 , 99 , 116 , 105 , 111 , 110 , 32 , 34 , 115 , 99 , 97 , 110 , 110 , 101 , 114 , 34 , 32 , 109 , 117 , 115 , 116 , 32 , 114 , 101 , 116 , 117 , 114 , 110 , 32 , 97 , 32 , 118 , 97 , 108 , 117 , 101 , 10 , 0
        .align 2
        .text
        la $a0, LS6
        lw $s8, LS6Len
        j error
E5:
        lw $ra, 0($sp)
        addu $sp, $sp, 8
        jr $ra
P6:
        subu $sp, $sp, 8
        sw $ra, 0($sp)
        sw $a0, 4($sp)
# begin return statement
        lw $t0, 4($sp)
        lw $t1, G15
        sge $t2, $t0, $t1
        move $t0, $t2
        bnez $t0, L33
        j L32
L33:
        lw $t1, 4($sp)
        lw $t2, G16
        sle $t3, $t1, $t2
        move $t0, $t3
L32:
        move $v0, $t0
        j E6
# end return statement
        .data
LS7Len: 
        .word 55
        .align 2
LS7: 
        .byte 114 , 117 , 110 , 116 , 105 , 109 , 101 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 102 , 117 , 110 , 99 , 116 , 105 , 111 , 110 , 32 , 34 , 105 , 115 , 100 , 105 , 103 , 105 , 116 , 34 , 32 , 109 , 117 , 115 , 116 , 32 , 114 , 101 , 116 , 117 , 114 , 110 , 32 , 97 , 32 , 118 , 97 , 108 , 117 , 101 , 10 , 0
        .align 2
        .text
        la $a0, LS7
        lw $s8, LS7Len
        j error
E6:
        lw $ra, 0($sp)
        addu $sp, $sp, 8
        jr $ra
P7:
        subu $sp, $sp, 8
        sw $ra, 0($sp)
        sw $a0, 4($sp)
# begin return statement
        lw $t0, 4($sp)
        lw $t1, G23
        seq $t2, $t0, $t1
        move $t0, $t2
        beqz $t0, L35
        j L34
L35:
        lw $t1, 4($sp)
        lw $t2, G24
        seq $t3, $t1, $t2
        move $t1, $t3
        beqz $t1, L37
        j L36
L37:
        lw $t2, 4($sp)
        lw $t3, G25
        seq $t4, $t2, $t3
        move $t1, $t4
L36:
        move $t0, $t1
L34:
        move $v0, $t0
        j E7
# end return statement
        .data
LS8Len: 
        .word 55
        .align 2
LS8: 
        .byte 114 , 117 , 110 , 116 , 105 , 109 , 101 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 102 , 117 , 110 , 99 , 116 , 105 , 111 , 110 , 32 , 34 , 105 , 115 , 115 , 112 , 97 , 99 , 101 , 34 , 32 , 109 , 117 , 115 , 116 , 32 , 114 , 101 , 116 , 117 , 114 , 110 , 32 , 97 , 32 , 118 , 97 , 108 , 117 , 101 , 10 , 0
        .align 2
        .text
        la $a0, LS8
        lw $s8, LS8Len
        j error
E7:
        lw $ra, 0($sp)
        addu $sp, $sp, 8
        jr $ra
P8:
        subu $sp, $sp, 8
        sw $ra, 0($sp)
# begin while statement
L38:
        jal P3

        move $t0, $v0
        lw $t1, G6
        sne $t2, $t0, $t1
        bnez $t2, L40
        j L39
L40:
# begin stmtExpr
        jal P9

        move $t0, $v0
        sw $t0, 4($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G7
        move $a0, $t0
        jal P4

# end stmtExpr
# begin stmtExpr
        .data
LS9Len: 
        .word 3
        .align 2
LS9: 
        .byte 32 , 61 , 32 , 0
        .align 2
        .text
        la $a0, LS9
        lw $s8, LS9Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        lw $t0, 4($sp)
        move $a0, $t0
        jal LPrinti

# end stmtExpr
# begin stmtExpr
        .data
LS10Len: 
        .word 1
        .align 2
LS10: 
        .byte 10 , 0
        .align 2
        .text
        la $a0, LS10
        lw $s8, LS10Len
        jal LPrints

# end stmtExpr
        j L38
L39:
# end while statement
E8:
        lw $ra, 0($sp)
        addu $sp, $sp, 8
        jr $ra
P9:
        subu $sp, $sp, 16
        sw $ra, 0($sp)
# begin stmtExpr
        jal P10

        move $t0, $v0
        sw $t0, 4($sp)
# end stmtExpr
# begin while statement
L41:
        jal P3

        move $t0, $v0
        lw $t1, G9
        seq $t2, $t0, $t1
        move $t0, $t2
        beqz $t0, L45
        j L44
L45:
        subu $sp, $sp, 4
        sw $t0, 0($sp)
        jal P3

        move $t1, $v0
        lw $t0, 0($sp)
        addu $sp, $sp, 4
        lw $t2, G10
        seq $t3, $t1, $t2
        move $t0, $t3
L44:
        bnez $t0, L43
        j L42
L43:
# begin stmtExpr
        jal P3

        move $t0, $v0
        sw $t0, 12($sp)
        move $a0, $t0
        jal P4

# end stmtExpr
# begin stmtExpr
        jal P10

        move $t0, $v0
        sw $t0, 8($sp)
# end stmtExpr
# begin ifElse statement
        lw $t0, 12($sp)
        lw $t1, G9
        seq $t2, $t0, $t1
        bnez $t2, L48
        j L46
L48:
# begin stmtExpr
        lw $t0, 4($sp)
        lw $t1, 8($sp)
        addu $t2, $t0, $t1
        sw $t2, 4($sp)
# end stmtExpr
        j L47
L46:
# begin stmtExpr
        lw $t0, 4($sp)
        lw $t1, 8($sp)
        subu $t2, $t0, $t1
        sw $t2, 4($sp)
# end stmtExpr
L47:
# end ifElse statement
        j L41
L42:
# end while statement
# begin return statement
        lw $t0, 4($sp)
        move $v0, $t0
        j E9
# end return statement
        .data
LS11Len: 
        .word 49
        .align 2
LS11: 
        .byte 114 , 117 , 110 , 116 , 105 , 109 , 101 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 102 , 117 , 110 , 99 , 116 , 105 , 111 , 110 , 32 , 34 , 69 , 34 , 32 , 109 , 117 , 115 , 116 , 32 , 114 , 101 , 116 , 117 , 114 , 110 , 32 , 97 , 32 , 118 , 97 , 108 , 117 , 101 , 10 , 0
        .align 2
        .text
        la $a0, LS11
        lw $s8, LS11Len
        j error
E9:
        lw $ra, 0($sp)
        addu $sp, $sp, 16
        jr $ra
P10:
        subu $sp, $sp, 16
        sw $ra, 0($sp)
# begin stmtExpr
        jal P11

        move $t0, $v0
        sw $t0, 4($sp)
# end stmtExpr
# begin while statement
L49:
        jal P3

        move $t0, $v0
        lw $t1, G11
        seq $t2, $t0, $t1
        move $t0, $t2
        beqz $t0, L53
        j L52
L53:
        subu $sp, $sp, 4
        sw $t0, 0($sp)
        jal P3

        move $t1, $v0
        lw $t0, 0($sp)
        addu $sp, $sp, 4
        lw $t2, G12
        seq $t3, $t1, $t2
        move $t0, $t3
L52:
        bnez $t0, L51
        j L50
L51:
# begin stmtExpr
        jal P3

        move $t0, $v0
        sw $t0, 12($sp)
        move $a0, $t0
        jal P4

# end stmtExpr
# begin stmtExpr
        jal P11

        move $t0, $v0
        sw $t0, 8($sp)
# end stmtExpr
# begin ifElse statement
        lw $t0, 12($sp)
        lw $t1, G11
        seq $t2, $t0, $t1
        bnez $t2, L56
        j L54
L56:
# begin stmtExpr
        lw $t0, 4($sp)
        lw $t1, 8($sp)
        mul $t2, $t0, $t1
        sw $t2, 4($sp)
# end stmtExpr
        j L55
L54:
# begin stmtExpr
        lw $t0, 4($sp)
        lw $t1, 8($sp)
        bnez $t1, L57
        .data
LS12Len: 
        .word 33
        .align 2
LS12: 
        .byte 114 , 117 , 110 , 116 , 105 , 109 , 101 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 100 , 105 , 118 , 105 , 115 , 105 , 111 , 110 , 32 , 98 , 121 , 32 , 122 , 101 , 114 , 111 , 10 , 0 # runtime error: division by zero
        .align 2
        .text
        la $a0, LS12
        lw $s8, LS12Len
        j error
L57:
        div $t2, $t0, $t1
        sw $t2, 4($sp)
# end stmtExpr
L55:
# end ifElse statement
        j L49
L50:
# end while statement
# begin return statement
        lw $t0, 4($sp)
        move $v0, $t0
        j E10
# end return statement
        .data
LS13Len: 
        .word 49
        .align 2
LS13: 
        .byte 114 , 117 , 110 , 116 , 105 , 109 , 101 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 102 , 117 , 110 , 99 , 116 , 105 , 111 , 110 , 32 , 34 , 84 , 34 , 32 , 109 , 117 , 115 , 116 , 32 , 114 , 101 , 116 , 117 , 114 , 110 , 32 , 97 , 32 , 118 , 97 , 108 , 117 , 101 , 10 , 0
        .align 2
        .text
        la $a0, LS13
        lw $s8, LS13Len
        j error
E10:
        lw $ra, 0($sp)
        addu $sp, $sp, 16
        jr $ra
P11:
        subu $sp, $sp, 12
        sw $ra, 0($sp)
# begin stmtExpr
        jal P3

        move $t0, $v0
        sw $t0, 8($sp)
# end stmtExpr
# begin ifElse statement
        lw $t0, 8($sp)
        lw $t1, G13
        seq $t2, $t0, $t1
        bnez $t2, L60
        j L58
L60:
# begin stmtExpr
        lw $t0, G13
        move $a0, $t0
        jal P4

# end stmtExpr
# begin stmtExpr
        jal P9

        move $t0, $v0
        sw $t0, 4($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G14
        move $a0, $t0
        jal P4

# end stmtExpr
        j L59
L58:
# begin ifElse statement
        lw $t0, 8($sp)
        lw $t1, G10
        seq $t2, $t0, $t1
        bnez $t2, L63
        j L61
L63:
# begin stmtExpr
        lw $t0, G10
        move $a0, $t0
        jal P4

# end stmtExpr
# begin stmtExpr
        jal P11

        move $t0, $v0
        negu $t0, $t0
        sw $t0, 4($sp)
# end stmtExpr
        j L62
L61:
# begin ifElse statement
        lw $t0, 8($sp)
        lw $t1, G8
        seq $t2, $t0, $t1
        bnez $t2, L66
        j L64
L66:
# begin stmtExpr
        lw $t0, G8
        move $a0, $t0
        jal P4

# end stmtExpr
# begin stmtExpr
        lw $t0, G4
        sw $t0, 4($sp)
# end stmtExpr
        j L65
L64:
# begin stmtExpr
        .data
LS14Len: 
        .word 24
        .align 2
LS14: 
        .byte 69 , 114 , 114 , 111 , 114 , 58 , 32 , 101 , 120 , 112 , 101 , 99 , 116 , 101 , 100 , 32 , 102 , 97 , 99 , 116 , 111 , 114 , 46 , 10 , 0
        .align 2
        .text
        la $a0, LS14
        lw $s8, LS14Len
        jal LPrints

# end stmtExpr
# begin stmtExpr
        jal LHalt

# end stmtExpr
L65:
# end ifElse statement
L62:
# end ifElse statement
L59:
# end ifElse statement
# begin return statement
        lw $t0, 4($sp)
        move $v0, $t0
        j E11
# end return statement
        .data
LS15Len: 
        .word 49
        .align 2
LS15: 
        .byte 114 , 117 , 110 , 116 , 105 , 109 , 101 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 102 , 117 , 110 , 99 , 116 , 105 , 111 , 110 , 32 , 34 , 70 , 34 , 32 , 109 , 117 , 115 , 116 , 32 , 114 , 101 , 116 , 117 , 114 , 110 , 32 , 97 , 32 , 118 , 97 , 108 , 117 , 101 , 10 , 0
        .align 2
        .text
        la $a0, LS15
        lw $s8, LS15Len
        j error
E11:
        lw $ra, 0($sp)
        addu $sp, $sp, 12
        jr $ra
P12:
        subu $sp, $sp, 4
        sw $ra, 0($sp)
# begin stmtExpr
        li $t0, -1
        sw $t0, G5
# end stmtExpr
# begin stmtExpr
        li $t0, 48
        sw $t0, G15
# end stmtExpr
# begin stmtExpr
        li $t0, 57
        sw $t0, G16
# end stmtExpr
# begin stmtExpr
        li $t0, 43
        sw $t0, G17
# end stmtExpr
# begin stmtExpr
        li $t0, 45
        sw $t0, G18
# end stmtExpr
# begin stmtExpr
        li $t0, 42
        sw $t0, G19
# end stmtExpr
# begin stmtExpr
        li $t0, 47
        sw $t0, G20
# end stmtExpr
# begin stmtExpr
        li $t0, 40
        sw $t0, G21
# end stmtExpr
# begin stmtExpr
        li $t0, 41
        sw $t0, G22
# end stmtExpr
# begin stmtExpr
        li $t0, 32
        sw $t0, G23
# end stmtExpr
# begin stmtExpr
        li $t0, 9
        sw $t0, G24
# end stmtExpr
# begin stmtExpr
        li $t0, 13
        sw $t0, G25
# end stmtExpr
# begin stmtExpr
        li $t0, 10
        sw $t0, G26
# end stmtExpr
# begin stmtExpr
        li $t0, 256
        sw $t0, G6
# end stmtExpr
# begin stmtExpr
        li $t0, 257
        sw $t0, G8
# end stmtExpr
# begin stmtExpr
        lw $t0, G17
        sw $t0, G9
# end stmtExpr
# begin stmtExpr
        lw $t0, G18
        sw $t0, G10
# end stmtExpr
# begin stmtExpr
        lw $t0, G19
        sw $t0, G11
# end stmtExpr
# begin stmtExpr
        lw $t0, G20
        sw $t0, G12
# end stmtExpr
# begin stmtExpr
        lw $t0, G21
        sw $t0, G13
# end stmtExpr
# begin stmtExpr
        lw $t0, G22
        sw $t0, G14
# end stmtExpr
# begin stmtExpr
        lw $t0, G26
        sw $t0, G7
# end stmtExpr
E12:
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

