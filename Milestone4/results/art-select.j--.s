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
P0:
        subu $sp, $sp, 20
        sw $ra, 0($sp)
# begin stmtExpr
        li $t0, 1
        move $a0, $t0
        jal P2

# end stmtExpr
# begin stmtExpr
        li $t0, 0
        sw $t0, 4($sp)
# end stmtExpr
# begin while statement
L0:
        lw $t0, 4($sp)
        li $t1, 14
        sle $t2, $t0, $t1
        bnez $t2, L2
        j L1
L2:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 0
        seq $t2, $t0, $t1
        bnez $t2, L5
        j L3
L5:
# begin stmtExpr
        jal P3

        move $t0, $v0
        li $t1, 100
        bnez $t1, L6
        .data
LS0Len: 
        .word 31
        .align 2
LS0: 
        .byte 114 , 117 , 110 , 116 , 105 , 109 , 101 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 109 , 111 , 100 , 117 , 108 , 111 , 32 , 98 , 121 , 32 , 122 , 101 , 114 , 111 , 10 , 0 # runtime error: modulo by zero
        .align 2
        .text
        la $a0, LS0
        lw $s8, LS0Len
        j error
L6:
        rem $t2, $t0, $t1
        sw $t2, G0
# end stmtExpr
        j L4
L3:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 1
        seq $t2, $t0, $t1
        bnez $t2, L9
        j L7
L9:
# begin stmtExpr
        jal P3

        move $t0, $v0
        li $t1, 100
        bnez $t1, L10
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
L10:
        rem $t2, $t0, $t1
        sw $t2, G1
# end stmtExpr
        j L8
L7:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 2
        seq $t2, $t0, $t1
        bnez $t2, L13
        j L11
L13:
# begin stmtExpr
        jal P3

        move $t0, $v0
        li $t1, 100
        bnez $t1, L14
        .data
LS2Len: 
        .word 31
        .align 2
LS2: 
        .byte 114 , 117 , 110 , 116 , 105 , 109 , 101 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 109 , 111 , 100 , 117 , 108 , 111 , 32 , 98 , 121 , 32 , 122 , 101 , 114 , 111 , 10 , 0 # runtime error: modulo by zero
        .align 2
        .text
        la $a0, LS2
        lw $s8, LS2Len
        j error
L14:
        rem $t2, $t0, $t1
        sw $t2, G2
# end stmtExpr
        j L12
L11:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 3
        seq $t2, $t0, $t1
        bnez $t2, L17
        j L15
L17:
# begin stmtExpr
        jal P3

        move $t0, $v0
        li $t1, 100
        bnez $t1, L18
        .data
LS3Len: 
        .word 31
        .align 2
LS3: 
        .byte 114 , 117 , 110 , 116 , 105 , 109 , 101 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 109 , 111 , 100 , 117 , 108 , 111 , 32 , 98 , 121 , 32 , 122 , 101 , 114 , 111 , 10 , 0 # runtime error: modulo by zero
        .align 2
        .text
        la $a0, LS3
        lw $s8, LS3Len
        j error
L18:
        rem $t2, $t0, $t1
        sw $t2, G3
# end stmtExpr
        j L16
L15:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 4
        seq $t2, $t0, $t1
        bnez $t2, L21
        j L19
L21:
# begin stmtExpr
        jal P3

        move $t0, $v0
        li $t1, 100
        bnez $t1, L22
        .data
LS4Len: 
        .word 31
        .align 2
LS4: 
        .byte 114 , 117 , 110 , 116 , 105 , 109 , 101 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 109 , 111 , 100 , 117 , 108 , 111 , 32 , 98 , 121 , 32 , 122 , 101 , 114 , 111 , 10 , 0 # runtime error: modulo by zero
        .align 2
        .text
        la $a0, LS4
        lw $s8, LS4Len
        j error
L22:
        rem $t2, $t0, $t1
        sw $t2, G4
# end stmtExpr
        j L20
L19:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 5
        seq $t2, $t0, $t1
        bnez $t2, L25
        j L23
L25:
# begin stmtExpr
        jal P3

        move $t0, $v0
        li $t1, 100
        bnez $t1, L26
        .data
LS5Len: 
        .word 31
        .align 2
LS5: 
        .byte 114 , 117 , 110 , 116 , 105 , 109 , 101 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 109 , 111 , 100 , 117 , 108 , 111 , 32 , 98 , 121 , 32 , 122 , 101 , 114 , 111 , 10 , 0 # runtime error: modulo by zero
        .align 2
        .text
        la $a0, LS5
        lw $s8, LS5Len
        j error
L26:
        rem $t2, $t0, $t1
        sw $t2, G5
# end stmtExpr
        j L24
L23:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 6
        seq $t2, $t0, $t1
        bnez $t2, L29
        j L27
L29:
# begin stmtExpr
        jal P3

        move $t0, $v0
        li $t1, 100
        bnez $t1, L30
        .data
LS6Len: 
        .word 31
        .align 2
LS6: 
        .byte 114 , 117 , 110 , 116 , 105 , 109 , 101 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 109 , 111 , 100 , 117 , 108 , 111 , 32 , 98 , 121 , 32 , 122 , 101 , 114 , 111 , 10 , 0 # runtime error: modulo by zero
        .align 2
        .text
        la $a0, LS6
        lw $s8, LS6Len
        j error
L30:
        rem $t2, $t0, $t1
        sw $t2, G6
# end stmtExpr
        j L28
L27:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 7
        seq $t2, $t0, $t1
        bnez $t2, L33
        j L31
L33:
# begin stmtExpr
        jal P3

        move $t0, $v0
        li $t1, 100
        bnez $t1, L34
        .data
LS7Len: 
        .word 31
        .align 2
LS7: 
        .byte 114 , 117 , 110 , 116 , 105 , 109 , 101 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 109 , 111 , 100 , 117 , 108 , 111 , 32 , 98 , 121 , 32 , 122 , 101 , 114 , 111 , 10 , 0 # runtime error: modulo by zero
        .align 2
        .text
        la $a0, LS7
        lw $s8, LS7Len
        j error
L34:
        rem $t2, $t0, $t1
        sw $t2, G7
# end stmtExpr
        j L32
L31:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 8
        seq $t2, $t0, $t1
        bnez $t2, L37
        j L35
L37:
# begin stmtExpr
        jal P3

        move $t0, $v0
        li $t1, 100
        bnez $t1, L38
        .data
LS8Len: 
        .word 31
        .align 2
LS8: 
        .byte 114 , 117 , 110 , 116 , 105 , 109 , 101 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 109 , 111 , 100 , 117 , 108 , 111 , 32 , 98 , 121 , 32 , 122 , 101 , 114 , 111 , 10 , 0 # runtime error: modulo by zero
        .align 2
        .text
        la $a0, LS8
        lw $s8, LS8Len
        j error
L38:
        rem $t2, $t0, $t1
        sw $t2, G8
# end stmtExpr
        j L36
L35:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 9
        seq $t2, $t0, $t1
        bnez $t2, L41
        j L39
L41:
# begin stmtExpr
        jal P3

        move $t0, $v0
        li $t1, 100
        bnez $t1, L42
        .data
LS9Len: 
        .word 31
        .align 2
LS9: 
        .byte 114 , 117 , 110 , 116 , 105 , 109 , 101 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 109 , 111 , 100 , 117 , 108 , 111 , 32 , 98 , 121 , 32 , 122 , 101 , 114 , 111 , 10 , 0 # runtime error: modulo by zero
        .align 2
        .text
        la $a0, LS9
        lw $s8, LS9Len
        j error
L42:
        rem $t2, $t0, $t1
        sw $t2, G9
# end stmtExpr
        j L40
L39:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 10
        seq $t2, $t0, $t1
        bnez $t2, L45
        j L43
L45:
# begin stmtExpr
        jal P3

        move $t0, $v0
        li $t1, 100
        bnez $t1, L46
        .data
LS10Len: 
        .word 31
        .align 2
LS10: 
        .byte 114 , 117 , 110 , 116 , 105 , 109 , 101 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 109 , 111 , 100 , 117 , 108 , 111 , 32 , 98 , 121 , 32 , 122 , 101 , 114 , 111 , 10 , 0 # runtime error: modulo by zero
        .align 2
        .text
        la $a0, LS10
        lw $s8, LS10Len
        j error
L46:
        rem $t2, $t0, $t1
        sw $t2, G10
# end stmtExpr
        j L44
L43:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 11
        seq $t2, $t0, $t1
        bnez $t2, L49
        j L47
L49:
# begin stmtExpr
        jal P3

        move $t0, $v0
        li $t1, 100
        bnez $t1, L50
        .data
LS11Len: 
        .word 31
        .align 2
LS11: 
        .byte 114 , 117 , 110 , 116 , 105 , 109 , 101 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 109 , 111 , 100 , 117 , 108 , 111 , 32 , 98 , 121 , 32 , 122 , 101 , 114 , 111 , 10 , 0 # runtime error: modulo by zero
        .align 2
        .text
        la $a0, LS11
        lw $s8, LS11Len
        j error
L50:
        rem $t2, $t0, $t1
        sw $t2, G11
# end stmtExpr
        j L48
L47:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 12
        seq $t2, $t0, $t1
        bnez $t2, L53
        j L51
L53:
# begin stmtExpr
        jal P3

        move $t0, $v0
        li $t1, 100
        bnez $t1, L54
        .data
LS12Len: 
        .word 31
        .align 2
LS12: 
        .byte 114 , 117 , 110 , 116 , 105 , 109 , 101 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 109 , 111 , 100 , 117 , 108 , 111 , 32 , 98 , 121 , 32 , 122 , 101 , 114 , 111 , 10 , 0 # runtime error: modulo by zero
        .align 2
        .text
        la $a0, LS12
        lw $s8, LS12Len
        j error
L54:
        rem $t2, $t0, $t1
        sw $t2, G12
# end stmtExpr
        j L52
L51:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 13
        seq $t2, $t0, $t1
        bnez $t2, L57
        j L55
L57:
# begin stmtExpr
        jal P3

        move $t0, $v0
        li $t1, 100
        bnez $t1, L58
        .data
LS13Len: 
        .word 31
        .align 2
LS13: 
        .byte 114 , 117 , 110 , 116 , 105 , 109 , 101 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 109 , 111 , 100 , 117 , 108 , 111 , 32 , 98 , 121 , 32 , 122 , 101 , 114 , 111 , 10 , 0 # runtime error: modulo by zero
        .align 2
        .text
        la $a0, LS13
        lw $s8, LS13Len
        j error
L58:
        rem $t2, $t0, $t1
        sw $t2, G13
# end stmtExpr
        j L56
L55:
# begin if statement
        lw $t0, 4($sp)
        li $t1, 14
        seq $t2, $t0, $t1
        bnez $t2, L60
        j L59
L60:
# begin stmtExpr
        jal P3

        move $t0, $v0
        li $t1, 100
        bnez $t1, L61
        .data
LS14Len: 
        .word 31
        .align 2
LS14: 
        .byte 114 , 117 , 110 , 116 , 105 , 109 , 101 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 109 , 111 , 100 , 117 , 108 , 111 , 32 , 98 , 121 , 32 , 122 , 101 , 114 , 111 , 10 , 0 # runtime error: modulo by zero
        .align 2
        .text
        la $a0, LS14
        lw $s8, LS14Len
        j error
L61:
        rem $t2, $t0, $t1
        sw $t2, G14
# end stmtExpr
L59:
# end if statement
L56:
# end ifElse statement
L52:
# end ifElse statement
L48:
# end ifElse statement
L44:
# end ifElse statement
L40:
# end ifElse statement
L36:
# end ifElse statement
L32:
# end ifElse statement
L28:
# end ifElse statement
L24:
# end ifElse statement
L20:
# end ifElse statement
L16:
# end ifElse statement
L12:
# end ifElse statement
L8:
# end ifElse statement
L4:
# end ifElse statement
# begin stmtExpr
        lw $t0, 4($sp)
        li $t1, 1
        addu $t2, $t0, $t1
        sw $t2, 4($sp)
# end stmtExpr
        j L0
L1:
# end while statement
# begin stmtExpr
        jal P1

# end stmtExpr
# begin stmtExpr
        li $t0, 0
        sw $t0, 4($sp)
# end stmtExpr
# begin while statement
L62:
        lw $t0, 4($sp)
        li $t1, 13
        sle $t2, $t0, $t1
        bnez $t2, L64
        j L63
L64:
# begin stmtExpr
        lw $t0, 4($sp)
        sw $t0, 16($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, 4($sp)
        li $t1, 1
        addu $t2, $t0, $t1
        sw $t2, 8($sp)
# end stmtExpr
# begin while statement
L65:
        lw $t0, 8($sp)
        li $t1, 14
        sle $t2, $t0, $t1
        bnez $t2, L67
        j L66
L67:
# begin ifElse statement
        lw $t0, 8($sp)
        li $t1, 1
        seq $t2, $t0, $t1
        bnez $t2, L70
        j L68
L70:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 0
        seq $t2, $t0, $t1
        bnez $t2, L73
        j L71
L73:
# begin if statement
        lw $t0, G1
        lw $t1, G0
        slt $t2, $t0, $t1
        bnez $t2, L75
        j L74
L75:
# begin stmtExpr
        li $t0, 1
        sw $t0, 16($sp)
# end stmtExpr
L74:
# end if statement
        j L72
L71:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 1
        seq $t2, $t0, $t1
        bnez $t2, L78
        j L76
L78:
# begin if statement
        lw $t0, G1
        lw $t1, G1
        slt $t2, $t0, $t1
        bnez $t2, L80
        j L79
L80:
# begin stmtExpr
        li $t0, 1
        sw $t0, 16($sp)
# end stmtExpr
L79:
# end if statement
        j L77
L76:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 2
        seq $t2, $t0, $t1
        bnez $t2, L83
        j L81
L83:
# begin if statement
        lw $t0, G1
        lw $t1, G2
        slt $t2, $t0, $t1
        bnez $t2, L85
        j L84
L85:
# begin stmtExpr
        li $t0, 1
        sw $t0, 16($sp)
# end stmtExpr
L84:
# end if statement
        j L82
L81:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 3
        seq $t2, $t0, $t1
        bnez $t2, L88
        j L86
L88:
# begin if statement
        lw $t0, G1
        lw $t1, G3
        slt $t2, $t0, $t1
        bnez $t2, L90
        j L89
L90:
# begin stmtExpr
        li $t0, 1
        sw $t0, 16($sp)
# end stmtExpr
L89:
# end if statement
        j L87
L86:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 4
        seq $t2, $t0, $t1
        bnez $t2, L93
        j L91
L93:
# begin if statement
        lw $t0, G1
        lw $t1, G4
        slt $t2, $t0, $t1
        bnez $t2, L95
        j L94
L95:
# begin stmtExpr
        li $t0, 1
        sw $t0, 16($sp)
# end stmtExpr
L94:
# end if statement
        j L92
L91:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 5
        seq $t2, $t0, $t1
        bnez $t2, L98
        j L96
L98:
# begin if statement
        lw $t0, G1
        lw $t1, G5
        slt $t2, $t0, $t1
        bnez $t2, L100
        j L99
L100:
# begin stmtExpr
        li $t0, 1
        sw $t0, 16($sp)
# end stmtExpr
L99:
# end if statement
        j L97
L96:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 6
        seq $t2, $t0, $t1
        bnez $t2, L103
        j L101
L103:
# begin if statement
        lw $t0, G1
        lw $t1, G6
        slt $t2, $t0, $t1
        bnez $t2, L105
        j L104
L105:
# begin stmtExpr
        li $t0, 1
        sw $t0, 16($sp)
# end stmtExpr
L104:
# end if statement
        j L102
L101:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 7
        seq $t2, $t0, $t1
        bnez $t2, L108
        j L106
L108:
# begin if statement
        lw $t0, G1
        lw $t1, G7
        slt $t2, $t0, $t1
        bnez $t2, L110
        j L109
L110:
# begin stmtExpr
        li $t0, 1
        sw $t0, 16($sp)
# end stmtExpr
L109:
# end if statement
        j L107
L106:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 8
        seq $t2, $t0, $t1
        bnez $t2, L113
        j L111
L113:
# begin if statement
        lw $t0, G1
        lw $t1, G8
        slt $t2, $t0, $t1
        bnez $t2, L115
        j L114
L115:
# begin stmtExpr
        li $t0, 1
        sw $t0, 16($sp)
# end stmtExpr
L114:
# end if statement
        j L112
L111:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 9
        seq $t2, $t0, $t1
        bnez $t2, L118
        j L116
L118:
# begin if statement
        lw $t0, G1
        lw $t1, G9
        slt $t2, $t0, $t1
        bnez $t2, L120
        j L119
L120:
# begin stmtExpr
        li $t0, 1
        sw $t0, 16($sp)
# end stmtExpr
L119:
# end if statement
        j L117
L116:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 10
        seq $t2, $t0, $t1
        bnez $t2, L123
        j L121
L123:
# begin if statement
        lw $t0, G1
        lw $t1, G10
        slt $t2, $t0, $t1
        bnez $t2, L125
        j L124
L125:
# begin stmtExpr
        li $t0, 1
        sw $t0, 16($sp)
# end stmtExpr
L124:
# end if statement
        j L122
L121:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 11
        seq $t2, $t0, $t1
        bnez $t2, L128
        j L126
L128:
# begin if statement
        lw $t0, G1
        lw $t1, G11
        slt $t2, $t0, $t1
        bnez $t2, L130
        j L129
L130:
# begin stmtExpr
        li $t0, 1
        sw $t0, 16($sp)
# end stmtExpr
L129:
# end if statement
        j L127
L126:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 12
        seq $t2, $t0, $t1
        bnez $t2, L133
        j L131
L133:
# begin if statement
        lw $t0, G1
        lw $t1, G12
        slt $t2, $t0, $t1
        bnez $t2, L135
        j L134
L135:
# begin stmtExpr
        li $t0, 1
        sw $t0, 16($sp)
# end stmtExpr
L134:
# end if statement
        j L132
L131:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 13
        seq $t2, $t0, $t1
        bnez $t2, L138
        j L136
L138:
# begin if statement
        lw $t0, G1
        lw $t1, G13
        slt $t2, $t0, $t1
        bnez $t2, L140
        j L139
L140:
# begin stmtExpr
        li $t0, 1
        sw $t0, 16($sp)
# end stmtExpr
L139:
# end if statement
        j L137
L136:
# begin if statement
        lw $t0, 16($sp)
        li $t1, 14
        seq $t2, $t0, $t1
        bnez $t2, L142
        j L141
L142:
# begin if statement
        lw $t0, G1
        lw $t1, G14
        slt $t2, $t0, $t1
        bnez $t2, L144
        j L143
L144:
# begin stmtExpr
        li $t0, 1
        sw $t0, 16($sp)
# end stmtExpr
L143:
# end if statement
L141:
# end if statement
L137:
# end ifElse statement
L132:
# end ifElse statement
L127:
# end ifElse statement
L122:
# end ifElse statement
L117:
# end ifElse statement
L112:
# end ifElse statement
L107:
# end ifElse statement
L102:
# end ifElse statement
L97:
# end ifElse statement
L92:
# end ifElse statement
L87:
# end ifElse statement
L82:
# end ifElse statement
L77:
# end ifElse statement
L72:
# end ifElse statement
        j L69
L68:
# begin ifElse statement
        lw $t0, 8($sp)
        li $t1, 2
        seq $t2, $t0, $t1
        bnez $t2, L147
        j L145
L147:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 0
        seq $t2, $t0, $t1
        bnez $t2, L150
        j L148
L150:
# begin if statement
        lw $t0, G2
        lw $t1, G0
        slt $t2, $t0, $t1
        bnez $t2, L152
        j L151
L152:
# begin stmtExpr
        li $t0, 2
        sw $t0, 16($sp)
# end stmtExpr
L151:
# end if statement
        j L149
L148:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 1
        seq $t2, $t0, $t1
        bnez $t2, L155
        j L153
L155:
# begin if statement
        lw $t0, G2
        lw $t1, G1
        slt $t2, $t0, $t1
        bnez $t2, L157
        j L156
L157:
# begin stmtExpr
        li $t0, 2
        sw $t0, 16($sp)
# end stmtExpr
L156:
# end if statement
        j L154
L153:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 2
        seq $t2, $t0, $t1
        bnez $t2, L160
        j L158
L160:
# begin if statement
        lw $t0, G2
        lw $t1, G2
        slt $t2, $t0, $t1
        bnez $t2, L162
        j L161
L162:
# begin stmtExpr
        li $t0, 2
        sw $t0, 16($sp)
# end stmtExpr
L161:
# end if statement
        j L159
L158:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 3
        seq $t2, $t0, $t1
        bnez $t2, L165
        j L163
L165:
# begin if statement
        lw $t0, G2
        lw $t1, G3
        slt $t2, $t0, $t1
        bnez $t2, L167
        j L166
L167:
# begin stmtExpr
        li $t0, 2
        sw $t0, 16($sp)
# end stmtExpr
L166:
# end if statement
        j L164
L163:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 4
        seq $t2, $t0, $t1
        bnez $t2, L170
        j L168
L170:
# begin if statement
        lw $t0, G2
        lw $t1, G4
        slt $t2, $t0, $t1
        bnez $t2, L172
        j L171
L172:
# begin stmtExpr
        li $t0, 2
        sw $t0, 16($sp)
# end stmtExpr
L171:
# end if statement
        j L169
L168:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 5
        seq $t2, $t0, $t1
        bnez $t2, L175
        j L173
L175:
# begin if statement
        lw $t0, G2
        lw $t1, G5
        slt $t2, $t0, $t1
        bnez $t2, L177
        j L176
L177:
# begin stmtExpr
        li $t0, 2
        sw $t0, 16($sp)
# end stmtExpr
L176:
# end if statement
        j L174
L173:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 6
        seq $t2, $t0, $t1
        bnez $t2, L180
        j L178
L180:
# begin if statement
        lw $t0, G2
        lw $t1, G6
        slt $t2, $t0, $t1
        bnez $t2, L182
        j L181
L182:
# begin stmtExpr
        li $t0, 2
        sw $t0, 16($sp)
# end stmtExpr
L181:
# end if statement
        j L179
L178:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 7
        seq $t2, $t0, $t1
        bnez $t2, L185
        j L183
L185:
# begin if statement
        lw $t0, G2
        lw $t1, G7
        slt $t2, $t0, $t1
        bnez $t2, L187
        j L186
L187:
# begin stmtExpr
        li $t0, 2
        sw $t0, 16($sp)
# end stmtExpr
L186:
# end if statement
        j L184
L183:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 8
        seq $t2, $t0, $t1
        bnez $t2, L190
        j L188
L190:
# begin if statement
        lw $t0, G2
        lw $t1, G8
        slt $t2, $t0, $t1
        bnez $t2, L192
        j L191
L192:
# begin stmtExpr
        li $t0, 2
        sw $t0, 16($sp)
# end stmtExpr
L191:
# end if statement
        j L189
L188:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 9
        seq $t2, $t0, $t1
        bnez $t2, L195
        j L193
L195:
# begin if statement
        lw $t0, G2
        lw $t1, G9
        slt $t2, $t0, $t1
        bnez $t2, L197
        j L196
L197:
# begin stmtExpr
        li $t0, 2
        sw $t0, 16($sp)
# end stmtExpr
L196:
# end if statement
        j L194
L193:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 10
        seq $t2, $t0, $t1
        bnez $t2, L200
        j L198
L200:
# begin if statement
        lw $t0, G2
        lw $t1, G10
        slt $t2, $t0, $t1
        bnez $t2, L202
        j L201
L202:
# begin stmtExpr
        li $t0, 2
        sw $t0, 16($sp)
# end stmtExpr
L201:
# end if statement
        j L199
L198:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 11
        seq $t2, $t0, $t1
        bnez $t2, L205
        j L203
L205:
# begin if statement
        lw $t0, G2
        lw $t1, G11
        slt $t2, $t0, $t1
        bnez $t2, L207
        j L206
L207:
# begin stmtExpr
        li $t0, 2
        sw $t0, 16($sp)
# end stmtExpr
L206:
# end if statement
        j L204
L203:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 12
        seq $t2, $t0, $t1
        bnez $t2, L210
        j L208
L210:
# begin if statement
        lw $t0, G2
        lw $t1, G12
        slt $t2, $t0, $t1
        bnez $t2, L212
        j L211
L212:
# begin stmtExpr
        li $t0, 2
        sw $t0, 16($sp)
# end stmtExpr
L211:
# end if statement
        j L209
L208:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 13
        seq $t2, $t0, $t1
        bnez $t2, L215
        j L213
L215:
# begin if statement
        lw $t0, G2
        lw $t1, G13
        slt $t2, $t0, $t1
        bnez $t2, L217
        j L216
L217:
# begin stmtExpr
        li $t0, 2
        sw $t0, 16($sp)
# end stmtExpr
L216:
# end if statement
        j L214
L213:
# begin if statement
        lw $t0, 16($sp)
        li $t1, 14
        seq $t2, $t0, $t1
        bnez $t2, L219
        j L218
L219:
# begin if statement
        lw $t0, G2
        lw $t1, G14
        slt $t2, $t0, $t1
        bnez $t2, L221
        j L220
L221:
# begin stmtExpr
        li $t0, 2
        sw $t0, 16($sp)
# end stmtExpr
L220:
# end if statement
L218:
# end if statement
L214:
# end ifElse statement
L209:
# end ifElse statement
L204:
# end ifElse statement
L199:
# end ifElse statement
L194:
# end ifElse statement
L189:
# end ifElse statement
L184:
# end ifElse statement
L179:
# end ifElse statement
L174:
# end ifElse statement
L169:
# end ifElse statement
L164:
# end ifElse statement
L159:
# end ifElse statement
L154:
# end ifElse statement
L149:
# end ifElse statement
        j L146
L145:
# begin ifElse statement
        lw $t0, 8($sp)
        li $t1, 3
        seq $t2, $t0, $t1
        bnez $t2, L224
        j L222
L224:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 0
        seq $t2, $t0, $t1
        bnez $t2, L227
        j L225
L227:
# begin if statement
        lw $t0, G3
        lw $t1, G0
        slt $t2, $t0, $t1
        bnez $t2, L229
        j L228
L229:
# begin stmtExpr
        li $t0, 3
        sw $t0, 16($sp)
# end stmtExpr
L228:
# end if statement
        j L226
L225:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 1
        seq $t2, $t0, $t1
        bnez $t2, L232
        j L230
L232:
# begin if statement
        lw $t0, G3
        lw $t1, G1
        slt $t2, $t0, $t1
        bnez $t2, L234
        j L233
L234:
# begin stmtExpr
        li $t0, 3
        sw $t0, 16($sp)
# end stmtExpr
L233:
# end if statement
        j L231
L230:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 2
        seq $t2, $t0, $t1
        bnez $t2, L237
        j L235
L237:
# begin if statement
        lw $t0, G3
        lw $t1, G2
        slt $t2, $t0, $t1
        bnez $t2, L239
        j L238
L239:
# begin stmtExpr
        li $t0, 3
        sw $t0, 16($sp)
# end stmtExpr
L238:
# end if statement
        j L236
L235:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 3
        seq $t2, $t0, $t1
        bnez $t2, L242
        j L240
L242:
# begin if statement
        lw $t0, G3
        lw $t1, G3
        slt $t2, $t0, $t1
        bnez $t2, L244
        j L243
L244:
# begin stmtExpr
        li $t0, 3
        sw $t0, 16($sp)
# end stmtExpr
L243:
# end if statement
        j L241
L240:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 4
        seq $t2, $t0, $t1
        bnez $t2, L247
        j L245
L247:
# begin if statement
        lw $t0, G3
        lw $t1, G4
        slt $t2, $t0, $t1
        bnez $t2, L249
        j L248
L249:
# begin stmtExpr
        li $t0, 3
        sw $t0, 16($sp)
# end stmtExpr
L248:
# end if statement
        j L246
L245:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 5
        seq $t2, $t0, $t1
        bnez $t2, L252
        j L250
L252:
# begin if statement
        lw $t0, G3
        lw $t1, G5
        slt $t2, $t0, $t1
        bnez $t2, L254
        j L253
L254:
# begin stmtExpr
        li $t0, 3
        sw $t0, 16($sp)
# end stmtExpr
L253:
# end if statement
        j L251
L250:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 6
        seq $t2, $t0, $t1
        bnez $t2, L257
        j L255
L257:
# begin if statement
        lw $t0, G3
        lw $t1, G6
        slt $t2, $t0, $t1
        bnez $t2, L259
        j L258
L259:
# begin stmtExpr
        li $t0, 3
        sw $t0, 16($sp)
# end stmtExpr
L258:
# end if statement
        j L256
L255:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 7
        seq $t2, $t0, $t1
        bnez $t2, L262
        j L260
L262:
# begin if statement
        lw $t0, G3
        lw $t1, G7
        slt $t2, $t0, $t1
        bnez $t2, L264
        j L263
L264:
# begin stmtExpr
        li $t0, 3
        sw $t0, 16($sp)
# end stmtExpr
L263:
# end if statement
        j L261
L260:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 8
        seq $t2, $t0, $t1
        bnez $t2, L267
        j L265
L267:
# begin if statement
        lw $t0, G3
        lw $t1, G8
        slt $t2, $t0, $t1
        bnez $t2, L269
        j L268
L269:
# begin stmtExpr
        li $t0, 3
        sw $t0, 16($sp)
# end stmtExpr
L268:
# end if statement
        j L266
L265:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 9
        seq $t2, $t0, $t1
        bnez $t2, L272
        j L270
L272:
# begin if statement
        lw $t0, G3
        lw $t1, G9
        slt $t2, $t0, $t1
        bnez $t2, L274
        j L273
L274:
# begin stmtExpr
        li $t0, 3
        sw $t0, 16($sp)
# end stmtExpr
L273:
# end if statement
        j L271
L270:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 10
        seq $t2, $t0, $t1
        bnez $t2, L277
        j L275
L277:
# begin if statement
        lw $t0, G3
        lw $t1, G10
        slt $t2, $t0, $t1
        bnez $t2, L279
        j L278
L279:
# begin stmtExpr
        li $t0, 3
        sw $t0, 16($sp)
# end stmtExpr
L278:
# end if statement
        j L276
L275:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 11
        seq $t2, $t0, $t1
        bnez $t2, L282
        j L280
L282:
# begin if statement
        lw $t0, G3
        lw $t1, G11
        slt $t2, $t0, $t1
        bnez $t2, L284
        j L283
L284:
# begin stmtExpr
        li $t0, 3
        sw $t0, 16($sp)
# end stmtExpr
L283:
# end if statement
        j L281
L280:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 12
        seq $t2, $t0, $t1
        bnez $t2, L287
        j L285
L287:
# begin if statement
        lw $t0, G3
        lw $t1, G12
        slt $t2, $t0, $t1
        bnez $t2, L289
        j L288
L289:
# begin stmtExpr
        li $t0, 3
        sw $t0, 16($sp)
# end stmtExpr
L288:
# end if statement
        j L286
L285:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 13
        seq $t2, $t0, $t1
        bnez $t2, L292
        j L290
L292:
# begin if statement
        lw $t0, G3
        lw $t1, G13
        slt $t2, $t0, $t1
        bnez $t2, L294
        j L293
L294:
# begin stmtExpr
        li $t0, 3
        sw $t0, 16($sp)
# end stmtExpr
L293:
# end if statement
        j L291
L290:
# begin if statement
        lw $t0, 16($sp)
        li $t1, 14
        seq $t2, $t0, $t1
        bnez $t2, L296
        j L295
L296:
# begin if statement
        lw $t0, G3
        lw $t1, G14
        slt $t2, $t0, $t1
        bnez $t2, L298
        j L297
L298:
# begin stmtExpr
        li $t0, 3
        sw $t0, 16($sp)
# end stmtExpr
L297:
# end if statement
L295:
# end if statement
L291:
# end ifElse statement
L286:
# end ifElse statement
L281:
# end ifElse statement
L276:
# end ifElse statement
L271:
# end ifElse statement
L266:
# end ifElse statement
L261:
# end ifElse statement
L256:
# end ifElse statement
L251:
# end ifElse statement
L246:
# end ifElse statement
L241:
# end ifElse statement
L236:
# end ifElse statement
L231:
# end ifElse statement
L226:
# end ifElse statement
        j L223
L222:
# begin ifElse statement
        lw $t0, 8($sp)
        li $t1, 4
        seq $t2, $t0, $t1
        bnez $t2, L301
        j L299
L301:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 0
        seq $t2, $t0, $t1
        bnez $t2, L304
        j L302
L304:
# begin if statement
        lw $t0, G4
        lw $t1, G0
        slt $t2, $t0, $t1
        bnez $t2, L306
        j L305
L306:
# begin stmtExpr
        li $t0, 4
        sw $t0, 16($sp)
# end stmtExpr
L305:
# end if statement
        j L303
L302:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 1
        seq $t2, $t0, $t1
        bnez $t2, L309
        j L307
L309:
# begin if statement
        lw $t0, G4
        lw $t1, G1
        slt $t2, $t0, $t1
        bnez $t2, L311
        j L310
L311:
# begin stmtExpr
        li $t0, 4
        sw $t0, 16($sp)
# end stmtExpr
L310:
# end if statement
        j L308
L307:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 2
        seq $t2, $t0, $t1
        bnez $t2, L314
        j L312
L314:
# begin if statement
        lw $t0, G4
        lw $t1, G2
        slt $t2, $t0, $t1
        bnez $t2, L316
        j L315
L316:
# begin stmtExpr
        li $t0, 4
        sw $t0, 16($sp)
# end stmtExpr
L315:
# end if statement
        j L313
L312:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 3
        seq $t2, $t0, $t1
        bnez $t2, L319
        j L317
L319:
# begin if statement
        lw $t0, G4
        lw $t1, G3
        slt $t2, $t0, $t1
        bnez $t2, L321
        j L320
L321:
# begin stmtExpr
        li $t0, 4
        sw $t0, 16($sp)
# end stmtExpr
L320:
# end if statement
        j L318
L317:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 4
        seq $t2, $t0, $t1
        bnez $t2, L324
        j L322
L324:
# begin if statement
        lw $t0, G4
        lw $t1, G4
        slt $t2, $t0, $t1
        bnez $t2, L326
        j L325
L326:
# begin stmtExpr
        li $t0, 4
        sw $t0, 16($sp)
# end stmtExpr
L325:
# end if statement
        j L323
L322:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 5
        seq $t2, $t0, $t1
        bnez $t2, L329
        j L327
L329:
# begin if statement
        lw $t0, G4
        lw $t1, G5
        slt $t2, $t0, $t1
        bnez $t2, L331
        j L330
L331:
# begin stmtExpr
        li $t0, 4
        sw $t0, 16($sp)
# end stmtExpr
L330:
# end if statement
        j L328
L327:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 6
        seq $t2, $t0, $t1
        bnez $t2, L334
        j L332
L334:
# begin if statement
        lw $t0, G4
        lw $t1, G6
        slt $t2, $t0, $t1
        bnez $t2, L336
        j L335
L336:
# begin stmtExpr
        li $t0, 4
        sw $t0, 16($sp)
# end stmtExpr
L335:
# end if statement
        j L333
L332:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 7
        seq $t2, $t0, $t1
        bnez $t2, L339
        j L337
L339:
# begin if statement
        lw $t0, G4
        lw $t1, G7
        slt $t2, $t0, $t1
        bnez $t2, L341
        j L340
L341:
# begin stmtExpr
        li $t0, 4
        sw $t0, 16($sp)
# end stmtExpr
L340:
# end if statement
        j L338
L337:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 8
        seq $t2, $t0, $t1
        bnez $t2, L344
        j L342
L344:
# begin if statement
        lw $t0, G4
        lw $t1, G8
        slt $t2, $t0, $t1
        bnez $t2, L346
        j L345
L346:
# begin stmtExpr
        li $t0, 4
        sw $t0, 16($sp)
# end stmtExpr
L345:
# end if statement
        j L343
L342:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 9
        seq $t2, $t0, $t1
        bnez $t2, L349
        j L347
L349:
# begin if statement
        lw $t0, G4
        lw $t1, G9
        slt $t2, $t0, $t1
        bnez $t2, L351
        j L350
L351:
# begin stmtExpr
        li $t0, 4
        sw $t0, 16($sp)
# end stmtExpr
L350:
# end if statement
        j L348
L347:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 10
        seq $t2, $t0, $t1
        bnez $t2, L354
        j L352
L354:
# begin if statement
        lw $t0, G4
        lw $t1, G10
        slt $t2, $t0, $t1
        bnez $t2, L356
        j L355
L356:
# begin stmtExpr
        li $t0, 4
        sw $t0, 16($sp)
# end stmtExpr
L355:
# end if statement
        j L353
L352:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 11
        seq $t2, $t0, $t1
        bnez $t2, L359
        j L357
L359:
# begin if statement
        lw $t0, G4
        lw $t1, G11
        slt $t2, $t0, $t1
        bnez $t2, L361
        j L360
L361:
# begin stmtExpr
        li $t0, 4
        sw $t0, 16($sp)
# end stmtExpr
L360:
# end if statement
        j L358
L357:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 12
        seq $t2, $t0, $t1
        bnez $t2, L364
        j L362
L364:
# begin if statement
        lw $t0, G4
        lw $t1, G12
        slt $t2, $t0, $t1
        bnez $t2, L366
        j L365
L366:
# begin stmtExpr
        li $t0, 4
        sw $t0, 16($sp)
# end stmtExpr
L365:
# end if statement
        j L363
L362:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 13
        seq $t2, $t0, $t1
        bnez $t2, L369
        j L367
L369:
# begin if statement
        lw $t0, G4
        lw $t1, G13
        slt $t2, $t0, $t1
        bnez $t2, L371
        j L370
L371:
# begin stmtExpr
        li $t0, 4
        sw $t0, 16($sp)
# end stmtExpr
L370:
# end if statement
        j L368
L367:
# begin if statement
        lw $t0, 16($sp)
        li $t1, 14
        seq $t2, $t0, $t1
        bnez $t2, L373
        j L372
L373:
# begin if statement
        lw $t0, G4
        lw $t1, G14
        slt $t2, $t0, $t1
        bnez $t2, L375
        j L374
L375:
# begin stmtExpr
        li $t0, 4
        sw $t0, 16($sp)
# end stmtExpr
L374:
# end if statement
L372:
# end if statement
L368:
# end ifElse statement
L363:
# end ifElse statement
L358:
# end ifElse statement
L353:
# end ifElse statement
L348:
# end ifElse statement
L343:
# end ifElse statement
L338:
# end ifElse statement
L333:
# end ifElse statement
L328:
# end ifElse statement
L323:
# end ifElse statement
L318:
# end ifElse statement
L313:
# end ifElse statement
L308:
# end ifElse statement
L303:
# end ifElse statement
        j L300
L299:
# begin ifElse statement
        lw $t0, 8($sp)
        li $t1, 5
        seq $t2, $t0, $t1
        bnez $t2, L378
        j L376
L378:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 0
        seq $t2, $t0, $t1
        bnez $t2, L381
        j L379
L381:
# begin if statement
        lw $t0, G5
        lw $t1, G0
        slt $t2, $t0, $t1
        bnez $t2, L383
        j L382
L383:
# begin stmtExpr
        li $t0, 5
        sw $t0, 16($sp)
# end stmtExpr
L382:
# end if statement
        j L380
L379:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 1
        seq $t2, $t0, $t1
        bnez $t2, L386
        j L384
L386:
# begin if statement
        lw $t0, G5
        lw $t1, G1
        slt $t2, $t0, $t1
        bnez $t2, L388
        j L387
L388:
# begin stmtExpr
        li $t0, 5
        sw $t0, 16($sp)
# end stmtExpr
L387:
# end if statement
        j L385
L384:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 2
        seq $t2, $t0, $t1
        bnez $t2, L391
        j L389
L391:
# begin if statement
        lw $t0, G5
        lw $t1, G2
        slt $t2, $t0, $t1
        bnez $t2, L393
        j L392
L393:
# begin stmtExpr
        li $t0, 5
        sw $t0, 16($sp)
# end stmtExpr
L392:
# end if statement
        j L390
L389:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 3
        seq $t2, $t0, $t1
        bnez $t2, L396
        j L394
L396:
# begin if statement
        lw $t0, G5
        lw $t1, G3
        slt $t2, $t0, $t1
        bnez $t2, L398
        j L397
L398:
# begin stmtExpr
        li $t0, 5
        sw $t0, 16($sp)
# end stmtExpr
L397:
# end if statement
        j L395
L394:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 4
        seq $t2, $t0, $t1
        bnez $t2, L401
        j L399
L401:
# begin if statement
        lw $t0, G5
        lw $t1, G4
        slt $t2, $t0, $t1
        bnez $t2, L403
        j L402
L403:
# begin stmtExpr
        li $t0, 5
        sw $t0, 16($sp)
# end stmtExpr
L402:
# end if statement
        j L400
L399:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 5
        seq $t2, $t0, $t1
        bnez $t2, L406
        j L404
L406:
# begin if statement
        lw $t0, G5
        lw $t1, G5
        slt $t2, $t0, $t1
        bnez $t2, L408
        j L407
L408:
# begin stmtExpr
        li $t0, 5
        sw $t0, 16($sp)
# end stmtExpr
L407:
# end if statement
        j L405
L404:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 6
        seq $t2, $t0, $t1
        bnez $t2, L411
        j L409
L411:
# begin if statement
        lw $t0, G5
        lw $t1, G6
        slt $t2, $t0, $t1
        bnez $t2, L413
        j L412
L413:
# begin stmtExpr
        li $t0, 5
        sw $t0, 16($sp)
# end stmtExpr
L412:
# end if statement
        j L410
L409:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 7
        seq $t2, $t0, $t1
        bnez $t2, L416
        j L414
L416:
# begin if statement
        lw $t0, G5
        lw $t1, G7
        slt $t2, $t0, $t1
        bnez $t2, L418
        j L417
L418:
# begin stmtExpr
        li $t0, 5
        sw $t0, 16($sp)
# end stmtExpr
L417:
# end if statement
        j L415
L414:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 8
        seq $t2, $t0, $t1
        bnez $t2, L421
        j L419
L421:
# begin if statement
        lw $t0, G5
        lw $t1, G8
        slt $t2, $t0, $t1
        bnez $t2, L423
        j L422
L423:
# begin stmtExpr
        li $t0, 5
        sw $t0, 16($sp)
# end stmtExpr
L422:
# end if statement
        j L420
L419:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 9
        seq $t2, $t0, $t1
        bnez $t2, L426
        j L424
L426:
# begin if statement
        lw $t0, G5
        lw $t1, G9
        slt $t2, $t0, $t1
        bnez $t2, L428
        j L427
L428:
# begin stmtExpr
        li $t0, 5
        sw $t0, 16($sp)
# end stmtExpr
L427:
# end if statement
        j L425
L424:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 10
        seq $t2, $t0, $t1
        bnez $t2, L431
        j L429
L431:
# begin if statement
        lw $t0, G5
        lw $t1, G10
        slt $t2, $t0, $t1
        bnez $t2, L433
        j L432
L433:
# begin stmtExpr
        li $t0, 5
        sw $t0, 16($sp)
# end stmtExpr
L432:
# end if statement
        j L430
L429:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 11
        seq $t2, $t0, $t1
        bnez $t2, L436
        j L434
L436:
# begin if statement
        lw $t0, G5
        lw $t1, G11
        slt $t2, $t0, $t1
        bnez $t2, L438
        j L437
L438:
# begin stmtExpr
        li $t0, 5
        sw $t0, 16($sp)
# end stmtExpr
L437:
# end if statement
        j L435
L434:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 12
        seq $t2, $t0, $t1
        bnez $t2, L441
        j L439
L441:
# begin if statement
        lw $t0, G5
        lw $t1, G12
        slt $t2, $t0, $t1
        bnez $t2, L443
        j L442
L443:
# begin stmtExpr
        li $t0, 5
        sw $t0, 16($sp)
# end stmtExpr
L442:
# end if statement
        j L440
L439:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 13
        seq $t2, $t0, $t1
        bnez $t2, L446
        j L444
L446:
# begin if statement
        lw $t0, G5
        lw $t1, G13
        slt $t2, $t0, $t1
        bnez $t2, L448
        j L447
L448:
# begin stmtExpr
        li $t0, 5
        sw $t0, 16($sp)
# end stmtExpr
L447:
# end if statement
        j L445
L444:
# begin if statement
        lw $t0, 16($sp)
        li $t1, 14
        seq $t2, $t0, $t1
        bnez $t2, L450
        j L449
L450:
# begin if statement
        lw $t0, G5
        lw $t1, G14
        slt $t2, $t0, $t1
        bnez $t2, L452
        j L451
L452:
# begin stmtExpr
        li $t0, 5
        sw $t0, 16($sp)
# end stmtExpr
L451:
# end if statement
L449:
# end if statement
L445:
# end ifElse statement
L440:
# end ifElse statement
L435:
# end ifElse statement
L430:
# end ifElse statement
L425:
# end ifElse statement
L420:
# end ifElse statement
L415:
# end ifElse statement
L410:
# end ifElse statement
L405:
# end ifElse statement
L400:
# end ifElse statement
L395:
# end ifElse statement
L390:
# end ifElse statement
L385:
# end ifElse statement
L380:
# end ifElse statement
        j L377
L376:
# begin ifElse statement
        lw $t0, 8($sp)
        li $t1, 6
        seq $t2, $t0, $t1
        bnez $t2, L455
        j L453
L455:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 0
        seq $t2, $t0, $t1
        bnez $t2, L458
        j L456
L458:
# begin if statement
        lw $t0, G6
        lw $t1, G0
        slt $t2, $t0, $t1
        bnez $t2, L460
        j L459
L460:
# begin stmtExpr
        li $t0, 6
        sw $t0, 16($sp)
# end stmtExpr
L459:
# end if statement
        j L457
L456:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 1
        seq $t2, $t0, $t1
        bnez $t2, L463
        j L461
L463:
# begin if statement
        lw $t0, G6
        lw $t1, G1
        slt $t2, $t0, $t1
        bnez $t2, L465
        j L464
L465:
# begin stmtExpr
        li $t0, 6
        sw $t0, 16($sp)
# end stmtExpr
L464:
# end if statement
        j L462
L461:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 2
        seq $t2, $t0, $t1
        bnez $t2, L468
        j L466
L468:
# begin if statement
        lw $t0, G6
        lw $t1, G2
        slt $t2, $t0, $t1
        bnez $t2, L470
        j L469
L470:
# begin stmtExpr
        li $t0, 6
        sw $t0, 16($sp)
# end stmtExpr
L469:
# end if statement
        j L467
L466:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 3
        seq $t2, $t0, $t1
        bnez $t2, L473
        j L471
L473:
# begin if statement
        lw $t0, G6
        lw $t1, G3
        slt $t2, $t0, $t1
        bnez $t2, L475
        j L474
L475:
# begin stmtExpr
        li $t0, 6
        sw $t0, 16($sp)
# end stmtExpr
L474:
# end if statement
        j L472
L471:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 4
        seq $t2, $t0, $t1
        bnez $t2, L478
        j L476
L478:
# begin if statement
        lw $t0, G6
        lw $t1, G4
        slt $t2, $t0, $t1
        bnez $t2, L480
        j L479
L480:
# begin stmtExpr
        li $t0, 6
        sw $t0, 16($sp)
# end stmtExpr
L479:
# end if statement
        j L477
L476:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 5
        seq $t2, $t0, $t1
        bnez $t2, L483
        j L481
L483:
# begin if statement
        lw $t0, G6
        lw $t1, G5
        slt $t2, $t0, $t1
        bnez $t2, L485
        j L484
L485:
# begin stmtExpr
        li $t0, 6
        sw $t0, 16($sp)
# end stmtExpr
L484:
# end if statement
        j L482
L481:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 6
        seq $t2, $t0, $t1
        bnez $t2, L488
        j L486
L488:
# begin if statement
        lw $t0, G6
        lw $t1, G6
        slt $t2, $t0, $t1
        bnez $t2, L490
        j L489
L490:
# begin stmtExpr
        li $t0, 6
        sw $t0, 16($sp)
# end stmtExpr
L489:
# end if statement
        j L487
L486:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 7
        seq $t2, $t0, $t1
        bnez $t2, L493
        j L491
L493:
# begin if statement
        lw $t0, G6
        lw $t1, G7
        slt $t2, $t0, $t1
        bnez $t2, L495
        j L494
L495:
# begin stmtExpr
        li $t0, 6
        sw $t0, 16($sp)
# end stmtExpr
L494:
# end if statement
        j L492
L491:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 8
        seq $t2, $t0, $t1
        bnez $t2, L498
        j L496
L498:
# begin if statement
        lw $t0, G6
        lw $t1, G8
        slt $t2, $t0, $t1
        bnez $t2, L500
        j L499
L500:
# begin stmtExpr
        li $t0, 6
        sw $t0, 16($sp)
# end stmtExpr
L499:
# end if statement
        j L497
L496:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 9
        seq $t2, $t0, $t1
        bnez $t2, L503
        j L501
L503:
# begin if statement
        lw $t0, G6
        lw $t1, G9
        slt $t2, $t0, $t1
        bnez $t2, L505
        j L504
L505:
# begin stmtExpr
        li $t0, 6
        sw $t0, 16($sp)
# end stmtExpr
L504:
# end if statement
        j L502
L501:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 10
        seq $t2, $t0, $t1
        bnez $t2, L508
        j L506
L508:
# begin if statement
        lw $t0, G6
        lw $t1, G10
        slt $t2, $t0, $t1
        bnez $t2, L510
        j L509
L510:
# begin stmtExpr
        li $t0, 6
        sw $t0, 16($sp)
# end stmtExpr
L509:
# end if statement
        j L507
L506:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 11
        seq $t2, $t0, $t1
        bnez $t2, L513
        j L511
L513:
# begin if statement
        lw $t0, G6
        lw $t1, G11
        slt $t2, $t0, $t1
        bnez $t2, L515
        j L514
L515:
# begin stmtExpr
        li $t0, 6
        sw $t0, 16($sp)
# end stmtExpr
L514:
# end if statement
        j L512
L511:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 12
        seq $t2, $t0, $t1
        bnez $t2, L518
        j L516
L518:
# begin if statement
        lw $t0, G6
        lw $t1, G12
        slt $t2, $t0, $t1
        bnez $t2, L520
        j L519
L520:
# begin stmtExpr
        li $t0, 6
        sw $t0, 16($sp)
# end stmtExpr
L519:
# end if statement
        j L517
L516:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 13
        seq $t2, $t0, $t1
        bnez $t2, L523
        j L521
L523:
# begin if statement
        lw $t0, G6
        lw $t1, G13
        slt $t2, $t0, $t1
        bnez $t2, L525
        j L524
L525:
# begin stmtExpr
        li $t0, 6
        sw $t0, 16($sp)
# end stmtExpr
L524:
# end if statement
        j L522
L521:
# begin if statement
        lw $t0, 16($sp)
        li $t1, 14
        seq $t2, $t0, $t1
        bnez $t2, L527
        j L526
L527:
# begin if statement
        lw $t0, G6
        lw $t1, G14
        slt $t2, $t0, $t1
        bnez $t2, L529
        j L528
L529:
# begin stmtExpr
        li $t0, 6
        sw $t0, 16($sp)
# end stmtExpr
L528:
# end if statement
L526:
# end if statement
L522:
# end ifElse statement
L517:
# end ifElse statement
L512:
# end ifElse statement
L507:
# end ifElse statement
L502:
# end ifElse statement
L497:
# end ifElse statement
L492:
# end ifElse statement
L487:
# end ifElse statement
L482:
# end ifElse statement
L477:
# end ifElse statement
L472:
# end ifElse statement
L467:
# end ifElse statement
L462:
# end ifElse statement
L457:
# end ifElse statement
        j L454
L453:
# begin ifElse statement
        lw $t0, 8($sp)
        li $t1, 7
        seq $t2, $t0, $t1
        bnez $t2, L532
        j L530
L532:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 0
        seq $t2, $t0, $t1
        bnez $t2, L535
        j L533
L535:
# begin if statement
        lw $t0, G7
        lw $t1, G0
        slt $t2, $t0, $t1
        bnez $t2, L537
        j L536
L537:
# begin stmtExpr
        li $t0, 7
        sw $t0, 16($sp)
# end stmtExpr
L536:
# end if statement
        j L534
L533:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 1
        seq $t2, $t0, $t1
        bnez $t2, L540
        j L538
L540:
# begin if statement
        lw $t0, G7
        lw $t1, G1
        slt $t2, $t0, $t1
        bnez $t2, L542
        j L541
L542:
# begin stmtExpr
        li $t0, 7
        sw $t0, 16($sp)
# end stmtExpr
L541:
# end if statement
        j L539
L538:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 2
        seq $t2, $t0, $t1
        bnez $t2, L545
        j L543
L545:
# begin if statement
        lw $t0, G7
        lw $t1, G2
        slt $t2, $t0, $t1
        bnez $t2, L547
        j L546
L547:
# begin stmtExpr
        li $t0, 7
        sw $t0, 16($sp)
# end stmtExpr
L546:
# end if statement
        j L544
L543:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 3
        seq $t2, $t0, $t1
        bnez $t2, L550
        j L548
L550:
# begin if statement
        lw $t0, G7
        lw $t1, G3
        slt $t2, $t0, $t1
        bnez $t2, L552
        j L551
L552:
# begin stmtExpr
        li $t0, 7
        sw $t0, 16($sp)
# end stmtExpr
L551:
# end if statement
        j L549
L548:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 4
        seq $t2, $t0, $t1
        bnez $t2, L555
        j L553
L555:
# begin if statement
        lw $t0, G7
        lw $t1, G4
        slt $t2, $t0, $t1
        bnez $t2, L557
        j L556
L557:
# begin stmtExpr
        li $t0, 7
        sw $t0, 16($sp)
# end stmtExpr
L556:
# end if statement
        j L554
L553:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 5
        seq $t2, $t0, $t1
        bnez $t2, L560
        j L558
L560:
# begin if statement
        lw $t0, G7
        lw $t1, G5
        slt $t2, $t0, $t1
        bnez $t2, L562
        j L561
L562:
# begin stmtExpr
        li $t0, 7
        sw $t0, 16($sp)
# end stmtExpr
L561:
# end if statement
        j L559
L558:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 6
        seq $t2, $t0, $t1
        bnez $t2, L565
        j L563
L565:
# begin if statement
        lw $t0, G7
        lw $t1, G6
        slt $t2, $t0, $t1
        bnez $t2, L567
        j L566
L567:
# begin stmtExpr
        li $t0, 7
        sw $t0, 16($sp)
# end stmtExpr
L566:
# end if statement
        j L564
L563:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 7
        seq $t2, $t0, $t1
        bnez $t2, L570
        j L568
L570:
# begin if statement
        lw $t0, G7
        lw $t1, G7
        slt $t2, $t0, $t1
        bnez $t2, L572
        j L571
L572:
# begin stmtExpr
        li $t0, 7
        sw $t0, 16($sp)
# end stmtExpr
L571:
# end if statement
        j L569
L568:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 8
        seq $t2, $t0, $t1
        bnez $t2, L575
        j L573
L575:
# begin if statement
        lw $t0, G7
        lw $t1, G8
        slt $t2, $t0, $t1
        bnez $t2, L577
        j L576
L577:
# begin stmtExpr
        li $t0, 7
        sw $t0, 16($sp)
# end stmtExpr
L576:
# end if statement
        j L574
L573:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 9
        seq $t2, $t0, $t1
        bnez $t2, L580
        j L578
L580:
# begin if statement
        lw $t0, G7
        lw $t1, G9
        slt $t2, $t0, $t1
        bnez $t2, L582
        j L581
L582:
# begin stmtExpr
        li $t0, 7
        sw $t0, 16($sp)
# end stmtExpr
L581:
# end if statement
        j L579
L578:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 10
        seq $t2, $t0, $t1
        bnez $t2, L585
        j L583
L585:
# begin if statement
        lw $t0, G7
        lw $t1, G10
        slt $t2, $t0, $t1
        bnez $t2, L587
        j L586
L587:
# begin stmtExpr
        li $t0, 7
        sw $t0, 16($sp)
# end stmtExpr
L586:
# end if statement
        j L584
L583:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 11
        seq $t2, $t0, $t1
        bnez $t2, L590
        j L588
L590:
# begin if statement
        lw $t0, G7
        lw $t1, G11
        slt $t2, $t0, $t1
        bnez $t2, L592
        j L591
L592:
# begin stmtExpr
        li $t0, 7
        sw $t0, 16($sp)
# end stmtExpr
L591:
# end if statement
        j L589
L588:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 12
        seq $t2, $t0, $t1
        bnez $t2, L595
        j L593
L595:
# begin if statement
        lw $t0, G7
        lw $t1, G12
        slt $t2, $t0, $t1
        bnez $t2, L597
        j L596
L597:
# begin stmtExpr
        li $t0, 7
        sw $t0, 16($sp)
# end stmtExpr
L596:
# end if statement
        j L594
L593:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 13
        seq $t2, $t0, $t1
        bnez $t2, L600
        j L598
L600:
# begin if statement
        lw $t0, G7
        lw $t1, G13
        slt $t2, $t0, $t1
        bnez $t2, L602
        j L601
L602:
# begin stmtExpr
        li $t0, 7
        sw $t0, 16($sp)
# end stmtExpr
L601:
# end if statement
        j L599
L598:
# begin if statement
        lw $t0, 16($sp)
        li $t1, 14
        seq $t2, $t0, $t1
        bnez $t2, L604
        j L603
L604:
# begin if statement
        lw $t0, G7
        lw $t1, G14
        slt $t2, $t0, $t1
        bnez $t2, L606
        j L605
L606:
# begin stmtExpr
        li $t0, 7
        sw $t0, 16($sp)
# end stmtExpr
L605:
# end if statement
L603:
# end if statement
L599:
# end ifElse statement
L594:
# end ifElse statement
L589:
# end ifElse statement
L584:
# end ifElse statement
L579:
# end ifElse statement
L574:
# end ifElse statement
L569:
# end ifElse statement
L564:
# end ifElse statement
L559:
# end ifElse statement
L554:
# end ifElse statement
L549:
# end ifElse statement
L544:
# end ifElse statement
L539:
# end ifElse statement
L534:
# end ifElse statement
        j L531
L530:
# begin ifElse statement
        lw $t0, 8($sp)
        li $t1, 8
        seq $t2, $t0, $t1
        bnez $t2, L609
        j L607
L609:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 0
        seq $t2, $t0, $t1
        bnez $t2, L612
        j L610
L612:
# begin if statement
        lw $t0, G8
        lw $t1, G0
        slt $t2, $t0, $t1
        bnez $t2, L614
        j L613
L614:
# begin stmtExpr
        li $t0, 8
        sw $t0, 16($sp)
# end stmtExpr
L613:
# end if statement
        j L611
L610:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 1
        seq $t2, $t0, $t1
        bnez $t2, L617
        j L615
L617:
# begin if statement
        lw $t0, G8
        lw $t1, G1
        slt $t2, $t0, $t1
        bnez $t2, L619
        j L618
L619:
# begin stmtExpr
        li $t0, 8
        sw $t0, 16($sp)
# end stmtExpr
L618:
# end if statement
        j L616
L615:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 2
        seq $t2, $t0, $t1
        bnez $t2, L622
        j L620
L622:
# begin if statement
        lw $t0, G8
        lw $t1, G2
        slt $t2, $t0, $t1
        bnez $t2, L624
        j L623
L624:
# begin stmtExpr
        li $t0, 8
        sw $t0, 16($sp)
# end stmtExpr
L623:
# end if statement
        j L621
L620:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 3
        seq $t2, $t0, $t1
        bnez $t2, L627
        j L625
L627:
# begin if statement
        lw $t0, G8
        lw $t1, G3
        slt $t2, $t0, $t1
        bnez $t2, L629
        j L628
L629:
# begin stmtExpr
        li $t0, 8
        sw $t0, 16($sp)
# end stmtExpr
L628:
# end if statement
        j L626
L625:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 4
        seq $t2, $t0, $t1
        bnez $t2, L632
        j L630
L632:
# begin if statement
        lw $t0, G8
        lw $t1, G4
        slt $t2, $t0, $t1
        bnez $t2, L634
        j L633
L634:
# begin stmtExpr
        li $t0, 8
        sw $t0, 16($sp)
# end stmtExpr
L633:
# end if statement
        j L631
L630:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 5
        seq $t2, $t0, $t1
        bnez $t2, L637
        j L635
L637:
# begin if statement
        lw $t0, G8
        lw $t1, G5
        slt $t2, $t0, $t1
        bnez $t2, L639
        j L638
L639:
# begin stmtExpr
        li $t0, 8
        sw $t0, 16($sp)
# end stmtExpr
L638:
# end if statement
        j L636
L635:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 6
        seq $t2, $t0, $t1
        bnez $t2, L642
        j L640
L642:
# begin if statement
        lw $t0, G8
        lw $t1, G6
        slt $t2, $t0, $t1
        bnez $t2, L644
        j L643
L644:
# begin stmtExpr
        li $t0, 8
        sw $t0, 16($sp)
# end stmtExpr
L643:
# end if statement
        j L641
L640:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 7
        seq $t2, $t0, $t1
        bnez $t2, L647
        j L645
L647:
# begin if statement
        lw $t0, G8
        lw $t1, G7
        slt $t2, $t0, $t1
        bnez $t2, L649
        j L648
L649:
# begin stmtExpr
        li $t0, 8
        sw $t0, 16($sp)
# end stmtExpr
L648:
# end if statement
        j L646
L645:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 8
        seq $t2, $t0, $t1
        bnez $t2, L652
        j L650
L652:
# begin if statement
        lw $t0, G8
        lw $t1, G8
        slt $t2, $t0, $t1
        bnez $t2, L654
        j L653
L654:
# begin stmtExpr
        li $t0, 8
        sw $t0, 16($sp)
# end stmtExpr
L653:
# end if statement
        j L651
L650:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 9
        seq $t2, $t0, $t1
        bnez $t2, L657
        j L655
L657:
# begin if statement
        lw $t0, G8
        lw $t1, G9
        slt $t2, $t0, $t1
        bnez $t2, L659
        j L658
L659:
# begin stmtExpr
        li $t0, 8
        sw $t0, 16($sp)
# end stmtExpr
L658:
# end if statement
        j L656
L655:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 10
        seq $t2, $t0, $t1
        bnez $t2, L662
        j L660
L662:
# begin if statement
        lw $t0, G8
        lw $t1, G10
        slt $t2, $t0, $t1
        bnez $t2, L664
        j L663
L664:
# begin stmtExpr
        li $t0, 8
        sw $t0, 16($sp)
# end stmtExpr
L663:
# end if statement
        j L661
L660:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 11
        seq $t2, $t0, $t1
        bnez $t2, L667
        j L665
L667:
# begin if statement
        lw $t0, G8
        lw $t1, G11
        slt $t2, $t0, $t1
        bnez $t2, L669
        j L668
L669:
# begin stmtExpr
        li $t0, 8
        sw $t0, 16($sp)
# end stmtExpr
L668:
# end if statement
        j L666
L665:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 12
        seq $t2, $t0, $t1
        bnez $t2, L672
        j L670
L672:
# begin if statement
        lw $t0, G8
        lw $t1, G12
        slt $t2, $t0, $t1
        bnez $t2, L674
        j L673
L674:
# begin stmtExpr
        li $t0, 8
        sw $t0, 16($sp)
# end stmtExpr
L673:
# end if statement
        j L671
L670:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 13
        seq $t2, $t0, $t1
        bnez $t2, L677
        j L675
L677:
# begin if statement
        lw $t0, G8
        lw $t1, G13
        slt $t2, $t0, $t1
        bnez $t2, L679
        j L678
L679:
# begin stmtExpr
        li $t0, 8
        sw $t0, 16($sp)
# end stmtExpr
L678:
# end if statement
        j L676
L675:
# begin if statement
        lw $t0, 16($sp)
        li $t1, 14
        seq $t2, $t0, $t1
        bnez $t2, L681
        j L680
L681:
# begin if statement
        lw $t0, G8
        lw $t1, G14
        slt $t2, $t0, $t1
        bnez $t2, L683
        j L682
L683:
# begin stmtExpr
        li $t0, 8
        sw $t0, 16($sp)
# end stmtExpr
L682:
# end if statement
L680:
# end if statement
L676:
# end ifElse statement
L671:
# end ifElse statement
L666:
# end ifElse statement
L661:
# end ifElse statement
L656:
# end ifElse statement
L651:
# end ifElse statement
L646:
# end ifElse statement
L641:
# end ifElse statement
L636:
# end ifElse statement
L631:
# end ifElse statement
L626:
# end ifElse statement
L621:
# end ifElse statement
L616:
# end ifElse statement
L611:
# end ifElse statement
        j L608
L607:
# begin ifElse statement
        lw $t0, 8($sp)
        li $t1, 9
        seq $t2, $t0, $t1
        bnez $t2, L686
        j L684
L686:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 0
        seq $t2, $t0, $t1
        bnez $t2, L689
        j L687
L689:
# begin if statement
        lw $t0, G9
        lw $t1, G0
        slt $t2, $t0, $t1
        bnez $t2, L691
        j L690
L691:
# begin stmtExpr
        li $t0, 9
        sw $t0, 16($sp)
# end stmtExpr
L690:
# end if statement
        j L688
L687:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 1
        seq $t2, $t0, $t1
        bnez $t2, L694
        j L692
L694:
# begin if statement
        lw $t0, G9
        lw $t1, G1
        slt $t2, $t0, $t1
        bnez $t2, L696
        j L695
L696:
# begin stmtExpr
        li $t0, 9
        sw $t0, 16($sp)
# end stmtExpr
L695:
# end if statement
        j L693
L692:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 2
        seq $t2, $t0, $t1
        bnez $t2, L699
        j L697
L699:
# begin if statement
        lw $t0, G9
        lw $t1, G2
        slt $t2, $t0, $t1
        bnez $t2, L701
        j L700
L701:
# begin stmtExpr
        li $t0, 9
        sw $t0, 16($sp)
# end stmtExpr
L700:
# end if statement
        j L698
L697:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 3
        seq $t2, $t0, $t1
        bnez $t2, L704
        j L702
L704:
# begin if statement
        lw $t0, G9
        lw $t1, G3
        slt $t2, $t0, $t1
        bnez $t2, L706
        j L705
L706:
# begin stmtExpr
        li $t0, 9
        sw $t0, 16($sp)
# end stmtExpr
L705:
# end if statement
        j L703
L702:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 4
        seq $t2, $t0, $t1
        bnez $t2, L709
        j L707
L709:
# begin if statement
        lw $t0, G9
        lw $t1, G4
        slt $t2, $t0, $t1
        bnez $t2, L711
        j L710
L711:
# begin stmtExpr
        li $t0, 9
        sw $t0, 16($sp)
# end stmtExpr
L710:
# end if statement
        j L708
L707:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 5
        seq $t2, $t0, $t1
        bnez $t2, L714
        j L712
L714:
# begin if statement
        lw $t0, G9
        lw $t1, G5
        slt $t2, $t0, $t1
        bnez $t2, L716
        j L715
L716:
# begin stmtExpr
        li $t0, 9
        sw $t0, 16($sp)
# end stmtExpr
L715:
# end if statement
        j L713
L712:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 6
        seq $t2, $t0, $t1
        bnez $t2, L719
        j L717
L719:
# begin if statement
        lw $t0, G9
        lw $t1, G6
        slt $t2, $t0, $t1
        bnez $t2, L721
        j L720
L721:
# begin stmtExpr
        li $t0, 9
        sw $t0, 16($sp)
# end stmtExpr
L720:
# end if statement
        j L718
L717:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 7
        seq $t2, $t0, $t1
        bnez $t2, L724
        j L722
L724:
# begin if statement
        lw $t0, G9
        lw $t1, G7
        slt $t2, $t0, $t1
        bnez $t2, L726
        j L725
L726:
# begin stmtExpr
        li $t0, 9
        sw $t0, 16($sp)
# end stmtExpr
L725:
# end if statement
        j L723
L722:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 8
        seq $t2, $t0, $t1
        bnez $t2, L729
        j L727
L729:
# begin if statement
        lw $t0, G9
        lw $t1, G8
        slt $t2, $t0, $t1
        bnez $t2, L731
        j L730
L731:
# begin stmtExpr
        li $t0, 9
        sw $t0, 16($sp)
# end stmtExpr
L730:
# end if statement
        j L728
L727:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 9
        seq $t2, $t0, $t1
        bnez $t2, L734
        j L732
L734:
# begin if statement
        lw $t0, G9
        lw $t1, G9
        slt $t2, $t0, $t1
        bnez $t2, L736
        j L735
L736:
# begin stmtExpr
        li $t0, 9
        sw $t0, 16($sp)
# end stmtExpr
L735:
# end if statement
        j L733
L732:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 10
        seq $t2, $t0, $t1
        bnez $t2, L739
        j L737
L739:
# begin if statement
        lw $t0, G9
        lw $t1, G10
        slt $t2, $t0, $t1
        bnez $t2, L741
        j L740
L741:
# begin stmtExpr
        li $t0, 9
        sw $t0, 16($sp)
# end stmtExpr
L740:
# end if statement
        j L738
L737:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 11
        seq $t2, $t0, $t1
        bnez $t2, L744
        j L742
L744:
# begin if statement
        lw $t0, G9
        lw $t1, G11
        slt $t2, $t0, $t1
        bnez $t2, L746
        j L745
L746:
# begin stmtExpr
        li $t0, 9
        sw $t0, 16($sp)
# end stmtExpr
L745:
# end if statement
        j L743
L742:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 12
        seq $t2, $t0, $t1
        bnez $t2, L749
        j L747
L749:
# begin if statement
        lw $t0, G9
        lw $t1, G12
        slt $t2, $t0, $t1
        bnez $t2, L751
        j L750
L751:
# begin stmtExpr
        li $t0, 9
        sw $t0, 16($sp)
# end stmtExpr
L750:
# end if statement
        j L748
L747:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 13
        seq $t2, $t0, $t1
        bnez $t2, L754
        j L752
L754:
# begin if statement
        lw $t0, G9
        lw $t1, G13
        slt $t2, $t0, $t1
        bnez $t2, L756
        j L755
L756:
# begin stmtExpr
        li $t0, 9
        sw $t0, 16($sp)
# end stmtExpr
L755:
# end if statement
        j L753
L752:
# begin if statement
        lw $t0, 16($sp)
        li $t1, 14
        seq $t2, $t0, $t1
        bnez $t2, L758
        j L757
L758:
# begin if statement
        lw $t0, G9
        lw $t1, G14
        slt $t2, $t0, $t1
        bnez $t2, L760
        j L759
L760:
# begin stmtExpr
        li $t0, 9
        sw $t0, 16($sp)
# end stmtExpr
L759:
# end if statement
L757:
# end if statement
L753:
# end ifElse statement
L748:
# end ifElse statement
L743:
# end ifElse statement
L738:
# end ifElse statement
L733:
# end ifElse statement
L728:
# end ifElse statement
L723:
# end ifElse statement
L718:
# end ifElse statement
L713:
# end ifElse statement
L708:
# end ifElse statement
L703:
# end ifElse statement
L698:
# end ifElse statement
L693:
# end ifElse statement
L688:
# end ifElse statement
        j L685
L684:
# begin ifElse statement
        lw $t0, 8($sp)
        li $t1, 10
        seq $t2, $t0, $t1
        bnez $t2, L763
        j L761
L763:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 0
        seq $t2, $t0, $t1
        bnez $t2, L766
        j L764
L766:
# begin if statement
        lw $t0, G10
        lw $t1, G0
        slt $t2, $t0, $t1
        bnez $t2, L768
        j L767
L768:
# begin stmtExpr
        li $t0, 10
        sw $t0, 16($sp)
# end stmtExpr
L767:
# end if statement
        j L765
L764:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 1
        seq $t2, $t0, $t1
        bnez $t2, L771
        j L769
L771:
# begin if statement
        lw $t0, G10
        lw $t1, G1
        slt $t2, $t0, $t1
        bnez $t2, L773
        j L772
L773:
# begin stmtExpr
        li $t0, 10
        sw $t0, 16($sp)
# end stmtExpr
L772:
# end if statement
        j L770
L769:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 2
        seq $t2, $t0, $t1
        bnez $t2, L776
        j L774
L776:
# begin if statement
        lw $t0, G10
        lw $t1, G2
        slt $t2, $t0, $t1
        bnez $t2, L778
        j L777
L778:
# begin stmtExpr
        li $t0, 10
        sw $t0, 16($sp)
# end stmtExpr
L777:
# end if statement
        j L775
L774:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 3
        seq $t2, $t0, $t1
        bnez $t2, L781
        j L779
L781:
# begin if statement
        lw $t0, G10
        lw $t1, G3
        slt $t2, $t0, $t1
        bnez $t2, L783
        j L782
L783:
# begin stmtExpr
        li $t0, 10
        sw $t0, 16($sp)
# end stmtExpr
L782:
# end if statement
        j L780
L779:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 4
        seq $t2, $t0, $t1
        bnez $t2, L786
        j L784
L786:
# begin if statement
        lw $t0, G10
        lw $t1, G4
        slt $t2, $t0, $t1
        bnez $t2, L788
        j L787
L788:
# begin stmtExpr
        li $t0, 10
        sw $t0, 16($sp)
# end stmtExpr
L787:
# end if statement
        j L785
L784:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 5
        seq $t2, $t0, $t1
        bnez $t2, L791
        j L789
L791:
# begin if statement
        lw $t0, G10
        lw $t1, G5
        slt $t2, $t0, $t1
        bnez $t2, L793
        j L792
L793:
# begin stmtExpr
        li $t0, 10
        sw $t0, 16($sp)
# end stmtExpr
L792:
# end if statement
        j L790
L789:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 6
        seq $t2, $t0, $t1
        bnez $t2, L796
        j L794
L796:
# begin if statement
        lw $t0, G10
        lw $t1, G6
        slt $t2, $t0, $t1
        bnez $t2, L798
        j L797
L798:
# begin stmtExpr
        li $t0, 10
        sw $t0, 16($sp)
# end stmtExpr
L797:
# end if statement
        j L795
L794:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 7
        seq $t2, $t0, $t1
        bnez $t2, L801
        j L799
L801:
# begin if statement
        lw $t0, G10
        lw $t1, G7
        slt $t2, $t0, $t1
        bnez $t2, L803
        j L802
L803:
# begin stmtExpr
        li $t0, 10
        sw $t0, 16($sp)
# end stmtExpr
L802:
# end if statement
        j L800
L799:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 8
        seq $t2, $t0, $t1
        bnez $t2, L806
        j L804
L806:
# begin if statement
        lw $t0, G10
        lw $t1, G8
        slt $t2, $t0, $t1
        bnez $t2, L808
        j L807
L808:
# begin stmtExpr
        li $t0, 10
        sw $t0, 16($sp)
# end stmtExpr
L807:
# end if statement
        j L805
L804:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 9
        seq $t2, $t0, $t1
        bnez $t2, L811
        j L809
L811:
# begin if statement
        lw $t0, G10
        lw $t1, G9
        slt $t2, $t0, $t1
        bnez $t2, L813
        j L812
L813:
# begin stmtExpr
        li $t0, 10
        sw $t0, 16($sp)
# end stmtExpr
L812:
# end if statement
        j L810
L809:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 10
        seq $t2, $t0, $t1
        bnez $t2, L816
        j L814
L816:
# begin if statement
        lw $t0, G10
        lw $t1, G10
        slt $t2, $t0, $t1
        bnez $t2, L818
        j L817
L818:
# begin stmtExpr
        li $t0, 10
        sw $t0, 16($sp)
# end stmtExpr
L817:
# end if statement
        j L815
L814:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 11
        seq $t2, $t0, $t1
        bnez $t2, L821
        j L819
L821:
# begin if statement
        lw $t0, G10
        lw $t1, G11
        slt $t2, $t0, $t1
        bnez $t2, L823
        j L822
L823:
# begin stmtExpr
        li $t0, 10
        sw $t0, 16($sp)
# end stmtExpr
L822:
# end if statement
        j L820
L819:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 12
        seq $t2, $t0, $t1
        bnez $t2, L826
        j L824
L826:
# begin if statement
        lw $t0, G10
        lw $t1, G12
        slt $t2, $t0, $t1
        bnez $t2, L828
        j L827
L828:
# begin stmtExpr
        li $t0, 10
        sw $t0, 16($sp)
# end stmtExpr
L827:
# end if statement
        j L825
L824:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 13
        seq $t2, $t0, $t1
        bnez $t2, L831
        j L829
L831:
# begin if statement
        lw $t0, G10
        lw $t1, G13
        slt $t2, $t0, $t1
        bnez $t2, L833
        j L832
L833:
# begin stmtExpr
        li $t0, 10
        sw $t0, 16($sp)
# end stmtExpr
L832:
# end if statement
        j L830
L829:
# begin if statement
        lw $t0, 16($sp)
        li $t1, 14
        seq $t2, $t0, $t1
        bnez $t2, L835
        j L834
L835:
# begin if statement
        lw $t0, G10
        lw $t1, G14
        slt $t2, $t0, $t1
        bnez $t2, L837
        j L836
L837:
# begin stmtExpr
        li $t0, 10
        sw $t0, 16($sp)
# end stmtExpr
L836:
# end if statement
L834:
# end if statement
L830:
# end ifElse statement
L825:
# end ifElse statement
L820:
# end ifElse statement
L815:
# end ifElse statement
L810:
# end ifElse statement
L805:
# end ifElse statement
L800:
# end ifElse statement
L795:
# end ifElse statement
L790:
# end ifElse statement
L785:
# end ifElse statement
L780:
# end ifElse statement
L775:
# end ifElse statement
L770:
# end ifElse statement
L765:
# end ifElse statement
        j L762
L761:
# begin ifElse statement
        lw $t0, 8($sp)
        li $t1, 11
        seq $t2, $t0, $t1
        bnez $t2, L840
        j L838
L840:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 0
        seq $t2, $t0, $t1
        bnez $t2, L843
        j L841
L843:
# begin if statement
        lw $t0, G11
        lw $t1, G0
        slt $t2, $t0, $t1
        bnez $t2, L845
        j L844
L845:
# begin stmtExpr
        li $t0, 11
        sw $t0, 16($sp)
# end stmtExpr
L844:
# end if statement
        j L842
L841:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 1
        seq $t2, $t0, $t1
        bnez $t2, L848
        j L846
L848:
# begin if statement
        lw $t0, G11
        lw $t1, G1
        slt $t2, $t0, $t1
        bnez $t2, L850
        j L849
L850:
# begin stmtExpr
        li $t0, 11
        sw $t0, 16($sp)
# end stmtExpr
L849:
# end if statement
        j L847
L846:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 2
        seq $t2, $t0, $t1
        bnez $t2, L853
        j L851
L853:
# begin if statement
        lw $t0, G11
        lw $t1, G2
        slt $t2, $t0, $t1
        bnez $t2, L855
        j L854
L855:
# begin stmtExpr
        li $t0, 11
        sw $t0, 16($sp)
# end stmtExpr
L854:
# end if statement
        j L852
L851:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 3
        seq $t2, $t0, $t1
        bnez $t2, L858
        j L856
L858:
# begin if statement
        lw $t0, G11
        lw $t1, G3
        slt $t2, $t0, $t1
        bnez $t2, L860
        j L859
L860:
# begin stmtExpr
        li $t0, 11
        sw $t0, 16($sp)
# end stmtExpr
L859:
# end if statement
        j L857
L856:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 4
        seq $t2, $t0, $t1
        bnez $t2, L863
        j L861
L863:
# begin if statement
        lw $t0, G11
        lw $t1, G4
        slt $t2, $t0, $t1
        bnez $t2, L865
        j L864
L865:
# begin stmtExpr
        li $t0, 11
        sw $t0, 16($sp)
# end stmtExpr
L864:
# end if statement
        j L862
L861:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 5
        seq $t2, $t0, $t1
        bnez $t2, L868
        j L866
L868:
# begin if statement
        lw $t0, G11
        lw $t1, G5
        slt $t2, $t0, $t1
        bnez $t2, L870
        j L869
L870:
# begin stmtExpr
        li $t0, 11
        sw $t0, 16($sp)
# end stmtExpr
L869:
# end if statement
        j L867
L866:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 6
        seq $t2, $t0, $t1
        bnez $t2, L873
        j L871
L873:
# begin if statement
        lw $t0, G11
        lw $t1, G6
        slt $t2, $t0, $t1
        bnez $t2, L875
        j L874
L875:
# begin stmtExpr
        li $t0, 11
        sw $t0, 16($sp)
# end stmtExpr
L874:
# end if statement
        j L872
L871:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 7
        seq $t2, $t0, $t1
        bnez $t2, L878
        j L876
L878:
# begin if statement
        lw $t0, G11
        lw $t1, G7
        slt $t2, $t0, $t1
        bnez $t2, L880
        j L879
L880:
# begin stmtExpr
        li $t0, 11
        sw $t0, 16($sp)
# end stmtExpr
L879:
# end if statement
        j L877
L876:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 8
        seq $t2, $t0, $t1
        bnez $t2, L883
        j L881
L883:
# begin if statement
        lw $t0, G11
        lw $t1, G8
        slt $t2, $t0, $t1
        bnez $t2, L885
        j L884
L885:
# begin stmtExpr
        li $t0, 11
        sw $t0, 16($sp)
# end stmtExpr
L884:
# end if statement
        j L882
L881:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 9
        seq $t2, $t0, $t1
        bnez $t2, L888
        j L886
L888:
# begin if statement
        lw $t0, G11
        lw $t1, G9
        slt $t2, $t0, $t1
        bnez $t2, L890
        j L889
L890:
# begin stmtExpr
        li $t0, 11
        sw $t0, 16($sp)
# end stmtExpr
L889:
# end if statement
        j L887
L886:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 10
        seq $t2, $t0, $t1
        bnez $t2, L893
        j L891
L893:
# begin if statement
        lw $t0, G11
        lw $t1, G10
        slt $t2, $t0, $t1
        bnez $t2, L895
        j L894
L895:
# begin stmtExpr
        li $t0, 11
        sw $t0, 16($sp)
# end stmtExpr
L894:
# end if statement
        j L892
L891:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 11
        seq $t2, $t0, $t1
        bnez $t2, L898
        j L896
L898:
# begin if statement
        lw $t0, G11
        lw $t1, G11
        slt $t2, $t0, $t1
        bnez $t2, L900
        j L899
L900:
# begin stmtExpr
        li $t0, 11
        sw $t0, 16($sp)
# end stmtExpr
L899:
# end if statement
        j L897
L896:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 12
        seq $t2, $t0, $t1
        bnez $t2, L903
        j L901
L903:
# begin if statement
        lw $t0, G11
        lw $t1, G12
        slt $t2, $t0, $t1
        bnez $t2, L905
        j L904
L905:
# begin stmtExpr
        li $t0, 11
        sw $t0, 16($sp)
# end stmtExpr
L904:
# end if statement
        j L902
L901:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 13
        seq $t2, $t0, $t1
        bnez $t2, L908
        j L906
L908:
# begin if statement
        lw $t0, G11
        lw $t1, G13
        slt $t2, $t0, $t1
        bnez $t2, L910
        j L909
L910:
# begin stmtExpr
        li $t0, 11
        sw $t0, 16($sp)
# end stmtExpr
L909:
# end if statement
        j L907
L906:
# begin if statement
        lw $t0, 16($sp)
        li $t1, 14
        seq $t2, $t0, $t1
        bnez $t2, L912
        j L911
L912:
# begin if statement
        lw $t0, G11
        lw $t1, G14
        slt $t2, $t0, $t1
        bnez $t2, L914
        j L913
L914:
# begin stmtExpr
        li $t0, 11
        sw $t0, 16($sp)
# end stmtExpr
L913:
# end if statement
L911:
# end if statement
L907:
# end ifElse statement
L902:
# end ifElse statement
L897:
# end ifElse statement
L892:
# end ifElse statement
L887:
# end ifElse statement
L882:
# end ifElse statement
L877:
# end ifElse statement
L872:
# end ifElse statement
L867:
# end ifElse statement
L862:
# end ifElse statement
L857:
# end ifElse statement
L852:
# end ifElse statement
L847:
# end ifElse statement
L842:
# end ifElse statement
        j L839
L838:
# begin ifElse statement
        lw $t0, 8($sp)
        li $t1, 12
        seq $t2, $t0, $t1
        bnez $t2, L917
        j L915
L917:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 0
        seq $t2, $t0, $t1
        bnez $t2, L920
        j L918
L920:
# begin if statement
        lw $t0, G12
        lw $t1, G0
        slt $t2, $t0, $t1
        bnez $t2, L922
        j L921
L922:
# begin stmtExpr
        li $t0, 12
        sw $t0, 16($sp)
# end stmtExpr
L921:
# end if statement
        j L919
L918:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 1
        seq $t2, $t0, $t1
        bnez $t2, L925
        j L923
L925:
# begin if statement
        lw $t0, G12
        lw $t1, G1
        slt $t2, $t0, $t1
        bnez $t2, L927
        j L926
L927:
# begin stmtExpr
        li $t0, 12
        sw $t0, 16($sp)
# end stmtExpr
L926:
# end if statement
        j L924
L923:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 2
        seq $t2, $t0, $t1
        bnez $t2, L930
        j L928
L930:
# begin if statement
        lw $t0, G12
        lw $t1, G2
        slt $t2, $t0, $t1
        bnez $t2, L932
        j L931
L932:
# begin stmtExpr
        li $t0, 12
        sw $t0, 16($sp)
# end stmtExpr
L931:
# end if statement
        j L929
L928:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 3
        seq $t2, $t0, $t1
        bnez $t2, L935
        j L933
L935:
# begin if statement
        lw $t0, G12
        lw $t1, G3
        slt $t2, $t0, $t1
        bnez $t2, L937
        j L936
L937:
# begin stmtExpr
        li $t0, 12
        sw $t0, 16($sp)
# end stmtExpr
L936:
# end if statement
        j L934
L933:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 4
        seq $t2, $t0, $t1
        bnez $t2, L940
        j L938
L940:
# begin if statement
        lw $t0, G12
        lw $t1, G4
        slt $t2, $t0, $t1
        bnez $t2, L942
        j L941
L942:
# begin stmtExpr
        li $t0, 12
        sw $t0, 16($sp)
# end stmtExpr
L941:
# end if statement
        j L939
L938:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 5
        seq $t2, $t0, $t1
        bnez $t2, L945
        j L943
L945:
# begin if statement
        lw $t0, G12
        lw $t1, G5
        slt $t2, $t0, $t1
        bnez $t2, L947
        j L946
L947:
# begin stmtExpr
        li $t0, 12
        sw $t0, 16($sp)
# end stmtExpr
L946:
# end if statement
        j L944
L943:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 6
        seq $t2, $t0, $t1
        bnez $t2, L950
        j L948
L950:
# begin if statement
        lw $t0, G12
        lw $t1, G6
        slt $t2, $t0, $t1
        bnez $t2, L952
        j L951
L952:
# begin stmtExpr
        li $t0, 12
        sw $t0, 16($sp)
# end stmtExpr
L951:
# end if statement
        j L949
L948:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 7
        seq $t2, $t0, $t1
        bnez $t2, L955
        j L953
L955:
# begin if statement
        lw $t0, G12
        lw $t1, G7
        slt $t2, $t0, $t1
        bnez $t2, L957
        j L956
L957:
# begin stmtExpr
        li $t0, 12
        sw $t0, 16($sp)
# end stmtExpr
L956:
# end if statement
        j L954
L953:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 8
        seq $t2, $t0, $t1
        bnez $t2, L960
        j L958
L960:
# begin if statement
        lw $t0, G12
        lw $t1, G8
        slt $t2, $t0, $t1
        bnez $t2, L962
        j L961
L962:
# begin stmtExpr
        li $t0, 12
        sw $t0, 16($sp)
# end stmtExpr
L961:
# end if statement
        j L959
L958:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 9
        seq $t2, $t0, $t1
        bnez $t2, L965
        j L963
L965:
# begin if statement
        lw $t0, G12
        lw $t1, G9
        slt $t2, $t0, $t1
        bnez $t2, L967
        j L966
L967:
# begin stmtExpr
        li $t0, 12
        sw $t0, 16($sp)
# end stmtExpr
L966:
# end if statement
        j L964
L963:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 10
        seq $t2, $t0, $t1
        bnez $t2, L970
        j L968
L970:
# begin if statement
        lw $t0, G12
        lw $t1, G10
        slt $t2, $t0, $t1
        bnez $t2, L972
        j L971
L972:
# begin stmtExpr
        li $t0, 12
        sw $t0, 16($sp)
# end stmtExpr
L971:
# end if statement
        j L969
L968:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 11
        seq $t2, $t0, $t1
        bnez $t2, L975
        j L973
L975:
# begin if statement
        lw $t0, G12
        lw $t1, G11
        slt $t2, $t0, $t1
        bnez $t2, L977
        j L976
L977:
# begin stmtExpr
        li $t0, 12
        sw $t0, 16($sp)
# end stmtExpr
L976:
# end if statement
        j L974
L973:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 12
        seq $t2, $t0, $t1
        bnez $t2, L980
        j L978
L980:
# begin if statement
        lw $t0, G12
        lw $t1, G12
        slt $t2, $t0, $t1
        bnez $t2, L982
        j L981
L982:
# begin stmtExpr
        li $t0, 12
        sw $t0, 16($sp)
# end stmtExpr
L981:
# end if statement
        j L979
L978:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 13
        seq $t2, $t0, $t1
        bnez $t2, L985
        j L983
L985:
# begin if statement
        lw $t0, G12
        lw $t1, G13
        slt $t2, $t0, $t1
        bnez $t2, L987
        j L986
L987:
# begin stmtExpr
        li $t0, 12
        sw $t0, 16($sp)
# end stmtExpr
L986:
# end if statement
        j L984
L983:
# begin if statement
        lw $t0, 16($sp)
        li $t1, 14
        seq $t2, $t0, $t1
        bnez $t2, L989
        j L988
L989:
# begin if statement
        lw $t0, G12
        lw $t1, G14
        slt $t2, $t0, $t1
        bnez $t2, L991
        j L990
L991:
# begin stmtExpr
        li $t0, 12
        sw $t0, 16($sp)
# end stmtExpr
L990:
# end if statement
L988:
# end if statement
L984:
# end ifElse statement
L979:
# end ifElse statement
L974:
# end ifElse statement
L969:
# end ifElse statement
L964:
# end ifElse statement
L959:
# end ifElse statement
L954:
# end ifElse statement
L949:
# end ifElse statement
L944:
# end ifElse statement
L939:
# end ifElse statement
L934:
# end ifElse statement
L929:
# end ifElse statement
L924:
# end ifElse statement
L919:
# end ifElse statement
        j L916
L915:
# begin ifElse statement
        lw $t0, 8($sp)
        li $t1, 13
        seq $t2, $t0, $t1
        bnez $t2, L994
        j L992
L994:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 0
        seq $t2, $t0, $t1
        bnez $t2, L997
        j L995
L997:
# begin if statement
        lw $t0, G13
        lw $t1, G0
        slt $t2, $t0, $t1
        bnez $t2, L999
        j L998
L999:
# begin stmtExpr
        li $t0, 13
        sw $t0, 16($sp)
# end stmtExpr
L998:
# end if statement
        j L996
L995:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 1
        seq $t2, $t0, $t1
        bnez $t2, L1002
        j L1000
L1002:
# begin if statement
        lw $t0, G13
        lw $t1, G1
        slt $t2, $t0, $t1
        bnez $t2, L1004
        j L1003
L1004:
# begin stmtExpr
        li $t0, 13
        sw $t0, 16($sp)
# end stmtExpr
L1003:
# end if statement
        j L1001
L1000:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 2
        seq $t2, $t0, $t1
        bnez $t2, L1007
        j L1005
L1007:
# begin if statement
        lw $t0, G13
        lw $t1, G2
        slt $t2, $t0, $t1
        bnez $t2, L1009
        j L1008
L1009:
# begin stmtExpr
        li $t0, 13
        sw $t0, 16($sp)
# end stmtExpr
L1008:
# end if statement
        j L1006
L1005:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 3
        seq $t2, $t0, $t1
        bnez $t2, L1012
        j L1010
L1012:
# begin if statement
        lw $t0, G13
        lw $t1, G3
        slt $t2, $t0, $t1
        bnez $t2, L1014
        j L1013
L1014:
# begin stmtExpr
        li $t0, 13
        sw $t0, 16($sp)
# end stmtExpr
L1013:
# end if statement
        j L1011
L1010:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 4
        seq $t2, $t0, $t1
        bnez $t2, L1017
        j L1015
L1017:
# begin if statement
        lw $t0, G13
        lw $t1, G4
        slt $t2, $t0, $t1
        bnez $t2, L1019
        j L1018
L1019:
# begin stmtExpr
        li $t0, 13
        sw $t0, 16($sp)
# end stmtExpr
L1018:
# end if statement
        j L1016
L1015:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 5
        seq $t2, $t0, $t1
        bnez $t2, L1022
        j L1020
L1022:
# begin if statement
        lw $t0, G13
        lw $t1, G5
        slt $t2, $t0, $t1
        bnez $t2, L1024
        j L1023
L1024:
# begin stmtExpr
        li $t0, 13
        sw $t0, 16($sp)
# end stmtExpr
L1023:
# end if statement
        j L1021
L1020:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 6
        seq $t2, $t0, $t1
        bnez $t2, L1027
        j L1025
L1027:
# begin if statement
        lw $t0, G13
        lw $t1, G6
        slt $t2, $t0, $t1
        bnez $t2, L1029
        j L1028
L1029:
# begin stmtExpr
        li $t0, 13
        sw $t0, 16($sp)
# end stmtExpr
L1028:
# end if statement
        j L1026
L1025:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 7
        seq $t2, $t0, $t1
        bnez $t2, L1032
        j L1030
L1032:
# begin if statement
        lw $t0, G13
        lw $t1, G7
        slt $t2, $t0, $t1
        bnez $t2, L1034
        j L1033
L1034:
# begin stmtExpr
        li $t0, 13
        sw $t0, 16($sp)
# end stmtExpr
L1033:
# end if statement
        j L1031
L1030:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 8
        seq $t2, $t0, $t1
        bnez $t2, L1037
        j L1035
L1037:
# begin if statement
        lw $t0, G13
        lw $t1, G8
        slt $t2, $t0, $t1
        bnez $t2, L1039
        j L1038
L1039:
# begin stmtExpr
        li $t0, 13
        sw $t0, 16($sp)
# end stmtExpr
L1038:
# end if statement
        j L1036
L1035:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 9
        seq $t2, $t0, $t1
        bnez $t2, L1042
        j L1040
L1042:
# begin if statement
        lw $t0, G13
        lw $t1, G9
        slt $t2, $t0, $t1
        bnez $t2, L1044
        j L1043
L1044:
# begin stmtExpr
        li $t0, 13
        sw $t0, 16($sp)
# end stmtExpr
L1043:
# end if statement
        j L1041
L1040:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 10
        seq $t2, $t0, $t1
        bnez $t2, L1047
        j L1045
L1047:
# begin if statement
        lw $t0, G13
        lw $t1, G10
        slt $t2, $t0, $t1
        bnez $t2, L1049
        j L1048
L1049:
# begin stmtExpr
        li $t0, 13
        sw $t0, 16($sp)
# end stmtExpr
L1048:
# end if statement
        j L1046
L1045:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 11
        seq $t2, $t0, $t1
        bnez $t2, L1052
        j L1050
L1052:
# begin if statement
        lw $t0, G13
        lw $t1, G11
        slt $t2, $t0, $t1
        bnez $t2, L1054
        j L1053
L1054:
# begin stmtExpr
        li $t0, 13
        sw $t0, 16($sp)
# end stmtExpr
L1053:
# end if statement
        j L1051
L1050:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 12
        seq $t2, $t0, $t1
        bnez $t2, L1057
        j L1055
L1057:
# begin if statement
        lw $t0, G13
        lw $t1, G12
        slt $t2, $t0, $t1
        bnez $t2, L1059
        j L1058
L1059:
# begin stmtExpr
        li $t0, 13
        sw $t0, 16($sp)
# end stmtExpr
L1058:
# end if statement
        j L1056
L1055:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 13
        seq $t2, $t0, $t1
        bnez $t2, L1062
        j L1060
L1062:
# begin if statement
        lw $t0, G13
        lw $t1, G13
        slt $t2, $t0, $t1
        bnez $t2, L1064
        j L1063
L1064:
# begin stmtExpr
        li $t0, 13
        sw $t0, 16($sp)
# end stmtExpr
L1063:
# end if statement
        j L1061
L1060:
# begin if statement
        lw $t0, 16($sp)
        li $t1, 14
        seq $t2, $t0, $t1
        bnez $t2, L1066
        j L1065
L1066:
# begin if statement
        lw $t0, G13
        lw $t1, G14
        slt $t2, $t0, $t1
        bnez $t2, L1068
        j L1067
L1068:
# begin stmtExpr
        li $t0, 13
        sw $t0, 16($sp)
# end stmtExpr
L1067:
# end if statement
L1065:
# end if statement
L1061:
# end ifElse statement
L1056:
# end ifElse statement
L1051:
# end ifElse statement
L1046:
# end ifElse statement
L1041:
# end ifElse statement
L1036:
# end ifElse statement
L1031:
# end ifElse statement
L1026:
# end ifElse statement
L1021:
# end ifElse statement
L1016:
# end ifElse statement
L1011:
# end ifElse statement
L1006:
# end ifElse statement
L1001:
# end ifElse statement
L996:
# end ifElse statement
        j L993
L992:
# begin if statement
        lw $t0, 8($sp)
        li $t1, 14
        seq $t2, $t0, $t1
        bnez $t2, L1070
        j L1069
L1070:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 0
        seq $t2, $t0, $t1
        bnez $t2, L1073
        j L1071
L1073:
# begin if statement
        lw $t0, G14
        lw $t1, G0
        slt $t2, $t0, $t1
        bnez $t2, L1075
        j L1074
L1075:
# begin stmtExpr
        li $t0, 14
        sw $t0, 16($sp)
# end stmtExpr
L1074:
# end if statement
        j L1072
L1071:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 1
        seq $t2, $t0, $t1
        bnez $t2, L1078
        j L1076
L1078:
# begin if statement
        lw $t0, G14
        lw $t1, G1
        slt $t2, $t0, $t1
        bnez $t2, L1080
        j L1079
L1080:
# begin stmtExpr
        li $t0, 14
        sw $t0, 16($sp)
# end stmtExpr
L1079:
# end if statement
        j L1077
L1076:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 2
        seq $t2, $t0, $t1
        bnez $t2, L1083
        j L1081
L1083:
# begin if statement
        lw $t0, G14
        lw $t1, G2
        slt $t2, $t0, $t1
        bnez $t2, L1085
        j L1084
L1085:
# begin stmtExpr
        li $t0, 14
        sw $t0, 16($sp)
# end stmtExpr
L1084:
# end if statement
        j L1082
L1081:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 3
        seq $t2, $t0, $t1
        bnez $t2, L1088
        j L1086
L1088:
# begin if statement
        lw $t0, G14
        lw $t1, G3
        slt $t2, $t0, $t1
        bnez $t2, L1090
        j L1089
L1090:
# begin stmtExpr
        li $t0, 14
        sw $t0, 16($sp)
# end stmtExpr
L1089:
# end if statement
        j L1087
L1086:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 4
        seq $t2, $t0, $t1
        bnez $t2, L1093
        j L1091
L1093:
# begin if statement
        lw $t0, G14
        lw $t1, G4
        slt $t2, $t0, $t1
        bnez $t2, L1095
        j L1094
L1095:
# begin stmtExpr
        li $t0, 14
        sw $t0, 16($sp)
# end stmtExpr
L1094:
# end if statement
        j L1092
L1091:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 5
        seq $t2, $t0, $t1
        bnez $t2, L1098
        j L1096
L1098:
# begin if statement
        lw $t0, G14
        lw $t1, G5
        slt $t2, $t0, $t1
        bnez $t2, L1100
        j L1099
L1100:
# begin stmtExpr
        li $t0, 14
        sw $t0, 16($sp)
# end stmtExpr
L1099:
# end if statement
        j L1097
L1096:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 6
        seq $t2, $t0, $t1
        bnez $t2, L1103
        j L1101
L1103:
# begin if statement
        lw $t0, G14
        lw $t1, G6
        slt $t2, $t0, $t1
        bnez $t2, L1105
        j L1104
L1105:
# begin stmtExpr
        li $t0, 14
        sw $t0, 16($sp)
# end stmtExpr
L1104:
# end if statement
        j L1102
L1101:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 7
        seq $t2, $t0, $t1
        bnez $t2, L1108
        j L1106
L1108:
# begin if statement
        lw $t0, G14
        lw $t1, G7
        slt $t2, $t0, $t1
        bnez $t2, L1110
        j L1109
L1110:
# begin stmtExpr
        li $t0, 14
        sw $t0, 16($sp)
# end stmtExpr
L1109:
# end if statement
        j L1107
L1106:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 8
        seq $t2, $t0, $t1
        bnez $t2, L1113
        j L1111
L1113:
# begin if statement
        lw $t0, G14
        lw $t1, G8
        slt $t2, $t0, $t1
        bnez $t2, L1115
        j L1114
L1115:
# begin stmtExpr
        li $t0, 14
        sw $t0, 16($sp)
# end stmtExpr
L1114:
# end if statement
        j L1112
L1111:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 9
        seq $t2, $t0, $t1
        bnez $t2, L1118
        j L1116
L1118:
# begin if statement
        lw $t0, G14
        lw $t1, G9
        slt $t2, $t0, $t1
        bnez $t2, L1120
        j L1119
L1120:
# begin stmtExpr
        li $t0, 14
        sw $t0, 16($sp)
# end stmtExpr
L1119:
# end if statement
        j L1117
L1116:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 10
        seq $t2, $t0, $t1
        bnez $t2, L1123
        j L1121
L1123:
# begin if statement
        lw $t0, G14
        lw $t1, G10
        slt $t2, $t0, $t1
        bnez $t2, L1125
        j L1124
L1125:
# begin stmtExpr
        li $t0, 14
        sw $t0, 16($sp)
# end stmtExpr
L1124:
# end if statement
        j L1122
L1121:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 11
        seq $t2, $t0, $t1
        bnez $t2, L1128
        j L1126
L1128:
# begin if statement
        lw $t0, G14
        lw $t1, G11
        slt $t2, $t0, $t1
        bnez $t2, L1130
        j L1129
L1130:
# begin stmtExpr
        li $t0, 14
        sw $t0, 16($sp)
# end stmtExpr
L1129:
# end if statement
        j L1127
L1126:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 12
        seq $t2, $t0, $t1
        bnez $t2, L1133
        j L1131
L1133:
# begin if statement
        lw $t0, G14
        lw $t1, G12
        slt $t2, $t0, $t1
        bnez $t2, L1135
        j L1134
L1135:
# begin stmtExpr
        li $t0, 14
        sw $t0, 16($sp)
# end stmtExpr
L1134:
# end if statement
        j L1132
L1131:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 13
        seq $t2, $t0, $t1
        bnez $t2, L1138
        j L1136
L1138:
# begin if statement
        lw $t0, G14
        lw $t1, G13
        slt $t2, $t0, $t1
        bnez $t2, L1140
        j L1139
L1140:
# begin stmtExpr
        li $t0, 14
        sw $t0, 16($sp)
# end stmtExpr
L1139:
# end if statement
        j L1137
L1136:
# begin if statement
        lw $t0, 16($sp)
        li $t1, 14
        seq $t2, $t0, $t1
        bnez $t2, L1142
        j L1141
L1142:
# begin if statement
        lw $t0, G14
        lw $t1, G14
        slt $t2, $t0, $t1
        bnez $t2, L1144
        j L1143
L1144:
# begin stmtExpr
        li $t0, 14
        sw $t0, 16($sp)
# end stmtExpr
L1143:
# end if statement
L1141:
# end if statement
L1137:
# end ifElse statement
L1132:
# end ifElse statement
L1127:
# end ifElse statement
L1122:
# end ifElse statement
L1117:
# end ifElse statement
L1112:
# end ifElse statement
L1107:
# end ifElse statement
L1102:
# end ifElse statement
L1097:
# end ifElse statement
L1092:
# end ifElse statement
L1087:
# end ifElse statement
L1082:
# end ifElse statement
L1077:
# end ifElse statement
L1072:
# end ifElse statement
L1069:
# end if statement
L993:
# end ifElse statement
L916:
# end ifElse statement
L839:
# end ifElse statement
L762:
# end ifElse statement
L685:
# end ifElse statement
L608:
# end ifElse statement
L531:
# end ifElse statement
L454:
# end ifElse statement
L377:
# end ifElse statement
L300:
# end ifElse statement
L223:
# end ifElse statement
L146:
# end ifElse statement
L69:
# end ifElse statement
# begin stmtExpr
        lw $t0, 8($sp)
        li $t1, 1
        addu $t2, $t0, $t1
        sw $t2, 8($sp)
# end stmtExpr
        j L65
L66:
# end while statement
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 0
        seq $t2, $t0, $t1
        bnez $t2, L1147
        j L1145
L1147:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 0
        seq $t2, $t0, $t1
        bnez $t2, L1150
        j L1148
L1150:
# begin stmtExpr
        lw $t0, G0
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G0
        sw $t0, G0
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G0
# end stmtExpr
        j L1149
L1148:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 1
        seq $t2, $t0, $t1
        bnez $t2, L1153
        j L1151
L1153:
# begin stmtExpr
        lw $t0, G1
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G0
        sw $t0, G1
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G0
# end stmtExpr
        j L1152
L1151:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 2
        seq $t2, $t0, $t1
        bnez $t2, L1156
        j L1154
L1156:
# begin stmtExpr
        lw $t0, G2
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G0
        sw $t0, G2
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G0
# end stmtExpr
        j L1155
L1154:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 3
        seq $t2, $t0, $t1
        bnez $t2, L1159
        j L1157
L1159:
# begin stmtExpr
        lw $t0, G3
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G0
        sw $t0, G3
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G0
# end stmtExpr
        j L1158
L1157:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 4
        seq $t2, $t0, $t1
        bnez $t2, L1162
        j L1160
L1162:
# begin stmtExpr
        lw $t0, G4
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G0
        sw $t0, G4
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G0
# end stmtExpr
        j L1161
L1160:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 5
        seq $t2, $t0, $t1
        bnez $t2, L1165
        j L1163
L1165:
# begin stmtExpr
        lw $t0, G5
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G0
        sw $t0, G5
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G0
# end stmtExpr
        j L1164
L1163:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 6
        seq $t2, $t0, $t1
        bnez $t2, L1168
        j L1166
L1168:
# begin stmtExpr
        lw $t0, G6
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G0
        sw $t0, G6
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G0
# end stmtExpr
        j L1167
L1166:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 7
        seq $t2, $t0, $t1
        bnez $t2, L1171
        j L1169
L1171:
# begin stmtExpr
        lw $t0, G7
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G0
        sw $t0, G7
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G0
# end stmtExpr
        j L1170
L1169:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 8
        seq $t2, $t0, $t1
        bnez $t2, L1174
        j L1172
L1174:
# begin stmtExpr
        lw $t0, G8
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G0
        sw $t0, G8
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G0
# end stmtExpr
        j L1173
L1172:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 9
        seq $t2, $t0, $t1
        bnez $t2, L1177
        j L1175
L1177:
# begin stmtExpr
        lw $t0, G9
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G0
        sw $t0, G9
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G0
# end stmtExpr
        j L1176
L1175:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 10
        seq $t2, $t0, $t1
        bnez $t2, L1180
        j L1178
L1180:
# begin stmtExpr
        lw $t0, G10
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G0
        sw $t0, G10
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G0
# end stmtExpr
        j L1179
L1178:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 11
        seq $t2, $t0, $t1
        bnez $t2, L1183
        j L1181
L1183:
# begin stmtExpr
        lw $t0, G11
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G0
        sw $t0, G11
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G0
# end stmtExpr
        j L1182
L1181:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 12
        seq $t2, $t0, $t1
        bnez $t2, L1186
        j L1184
L1186:
# begin stmtExpr
        lw $t0, G12
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G0
        sw $t0, G12
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G0
# end stmtExpr
        j L1185
L1184:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 13
        seq $t2, $t0, $t1
        bnez $t2, L1189
        j L1187
L1189:
# begin stmtExpr
        lw $t0, G13
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G0
        sw $t0, G13
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G0
# end stmtExpr
        j L1188
L1187:
# begin if statement
        lw $t0, 16($sp)
        li $t1, 14
        seq $t2, $t0, $t1
        bnez $t2, L1191
        j L1190
L1191:
# begin stmtExpr
        lw $t0, G14
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G0
        sw $t0, G14
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G0
# end stmtExpr
L1190:
# end if statement
L1188:
# end ifElse statement
L1185:
# end ifElse statement
L1182:
# end ifElse statement
L1179:
# end ifElse statement
L1176:
# end ifElse statement
L1173:
# end ifElse statement
L1170:
# end ifElse statement
L1167:
# end ifElse statement
L1164:
# end ifElse statement
L1161:
# end ifElse statement
L1158:
# end ifElse statement
L1155:
# end ifElse statement
L1152:
# end ifElse statement
L1149:
# end ifElse statement
        j L1146
L1145:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 1
        seq $t2, $t0, $t1
        bnez $t2, L1194
        j L1192
L1194:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 0
        seq $t2, $t0, $t1
        bnez $t2, L1197
        j L1195
L1197:
# begin stmtExpr
        lw $t0, G0
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G1
        sw $t0, G0
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G1
# end stmtExpr
        j L1196
L1195:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 1
        seq $t2, $t0, $t1
        bnez $t2, L1200
        j L1198
L1200:
# begin stmtExpr
        lw $t0, G1
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G1
        sw $t0, G1
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G1
# end stmtExpr
        j L1199
L1198:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 2
        seq $t2, $t0, $t1
        bnez $t2, L1203
        j L1201
L1203:
# begin stmtExpr
        lw $t0, G2
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G1
        sw $t0, G2
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G1
# end stmtExpr
        j L1202
L1201:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 3
        seq $t2, $t0, $t1
        bnez $t2, L1206
        j L1204
L1206:
# begin stmtExpr
        lw $t0, G3
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G1
        sw $t0, G3
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G1
# end stmtExpr
        j L1205
L1204:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 4
        seq $t2, $t0, $t1
        bnez $t2, L1209
        j L1207
L1209:
# begin stmtExpr
        lw $t0, G4
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G1
        sw $t0, G4
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G1
# end stmtExpr
        j L1208
L1207:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 5
        seq $t2, $t0, $t1
        bnez $t2, L1212
        j L1210
L1212:
# begin stmtExpr
        lw $t0, G5
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G1
        sw $t0, G5
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G1
# end stmtExpr
        j L1211
L1210:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 6
        seq $t2, $t0, $t1
        bnez $t2, L1215
        j L1213
L1215:
# begin stmtExpr
        lw $t0, G6
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G1
        sw $t0, G6
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G1
# end stmtExpr
        j L1214
L1213:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 7
        seq $t2, $t0, $t1
        bnez $t2, L1218
        j L1216
L1218:
# begin stmtExpr
        lw $t0, G7
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G1
        sw $t0, G7
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G1
# end stmtExpr
        j L1217
L1216:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 8
        seq $t2, $t0, $t1
        bnez $t2, L1221
        j L1219
L1221:
# begin stmtExpr
        lw $t0, G8
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G1
        sw $t0, G8
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G1
# end stmtExpr
        j L1220
L1219:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 9
        seq $t2, $t0, $t1
        bnez $t2, L1224
        j L1222
L1224:
# begin stmtExpr
        lw $t0, G9
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G1
        sw $t0, G9
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G1
# end stmtExpr
        j L1223
L1222:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 10
        seq $t2, $t0, $t1
        bnez $t2, L1227
        j L1225
L1227:
# begin stmtExpr
        lw $t0, G10
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G1
        sw $t0, G10
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G1
# end stmtExpr
        j L1226
L1225:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 11
        seq $t2, $t0, $t1
        bnez $t2, L1230
        j L1228
L1230:
# begin stmtExpr
        lw $t0, G11
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G1
        sw $t0, G11
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G1
# end stmtExpr
        j L1229
L1228:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 12
        seq $t2, $t0, $t1
        bnez $t2, L1233
        j L1231
L1233:
# begin stmtExpr
        lw $t0, G12
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G1
        sw $t0, G12
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G1
# end stmtExpr
        j L1232
L1231:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 13
        seq $t2, $t0, $t1
        bnez $t2, L1236
        j L1234
L1236:
# begin stmtExpr
        lw $t0, G13
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G1
        sw $t0, G13
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G1
# end stmtExpr
        j L1235
L1234:
# begin if statement
        lw $t0, 16($sp)
        li $t1, 14
        seq $t2, $t0, $t1
        bnez $t2, L1238
        j L1237
L1238:
# begin stmtExpr
        lw $t0, G14
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G1
        sw $t0, G14
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G1
# end stmtExpr
L1237:
# end if statement
L1235:
# end ifElse statement
L1232:
# end ifElse statement
L1229:
# end ifElse statement
L1226:
# end ifElse statement
L1223:
# end ifElse statement
L1220:
# end ifElse statement
L1217:
# end ifElse statement
L1214:
# end ifElse statement
L1211:
# end ifElse statement
L1208:
# end ifElse statement
L1205:
# end ifElse statement
L1202:
# end ifElse statement
L1199:
# end ifElse statement
L1196:
# end ifElse statement
        j L1193
L1192:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 2
        seq $t2, $t0, $t1
        bnez $t2, L1241
        j L1239
L1241:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 0
        seq $t2, $t0, $t1
        bnez $t2, L1244
        j L1242
L1244:
# begin stmtExpr
        lw $t0, G0
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G2
        sw $t0, G0
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G2
# end stmtExpr
        j L1243
L1242:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 1
        seq $t2, $t0, $t1
        bnez $t2, L1247
        j L1245
L1247:
# begin stmtExpr
        lw $t0, G1
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G2
        sw $t0, G1
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G2
# end stmtExpr
        j L1246
L1245:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 2
        seq $t2, $t0, $t1
        bnez $t2, L1250
        j L1248
L1250:
# begin stmtExpr
        lw $t0, G2
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G2
        sw $t0, G2
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G2
# end stmtExpr
        j L1249
L1248:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 3
        seq $t2, $t0, $t1
        bnez $t2, L1253
        j L1251
L1253:
# begin stmtExpr
        lw $t0, G3
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G2
        sw $t0, G3
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G2
# end stmtExpr
        j L1252
L1251:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 4
        seq $t2, $t0, $t1
        bnez $t2, L1256
        j L1254
L1256:
# begin stmtExpr
        lw $t0, G4
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G2
        sw $t0, G4
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G2
# end stmtExpr
        j L1255
L1254:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 5
        seq $t2, $t0, $t1
        bnez $t2, L1259
        j L1257
L1259:
# begin stmtExpr
        lw $t0, G5
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G2
        sw $t0, G5
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G2
# end stmtExpr
        j L1258
L1257:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 6
        seq $t2, $t0, $t1
        bnez $t2, L1262
        j L1260
L1262:
# begin stmtExpr
        lw $t0, G6
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G2
        sw $t0, G6
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G2
# end stmtExpr
        j L1261
L1260:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 7
        seq $t2, $t0, $t1
        bnez $t2, L1265
        j L1263
L1265:
# begin stmtExpr
        lw $t0, G7
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G2
        sw $t0, G7
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G2
# end stmtExpr
        j L1264
L1263:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 8
        seq $t2, $t0, $t1
        bnez $t2, L1268
        j L1266
L1268:
# begin stmtExpr
        lw $t0, G8
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G2
        sw $t0, G8
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G2
# end stmtExpr
        j L1267
L1266:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 9
        seq $t2, $t0, $t1
        bnez $t2, L1271
        j L1269
L1271:
# begin stmtExpr
        lw $t0, G9
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G2
        sw $t0, G9
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G2
# end stmtExpr
        j L1270
L1269:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 10
        seq $t2, $t0, $t1
        bnez $t2, L1274
        j L1272
L1274:
# begin stmtExpr
        lw $t0, G10
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G2
        sw $t0, G10
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G2
# end stmtExpr
        j L1273
L1272:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 11
        seq $t2, $t0, $t1
        bnez $t2, L1277
        j L1275
L1277:
# begin stmtExpr
        lw $t0, G11
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G2
        sw $t0, G11
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G2
# end stmtExpr
        j L1276
L1275:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 12
        seq $t2, $t0, $t1
        bnez $t2, L1280
        j L1278
L1280:
# begin stmtExpr
        lw $t0, G12
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G2
        sw $t0, G12
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G2
# end stmtExpr
        j L1279
L1278:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 13
        seq $t2, $t0, $t1
        bnez $t2, L1283
        j L1281
L1283:
# begin stmtExpr
        lw $t0, G13
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G2
        sw $t0, G13
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G2
# end stmtExpr
        j L1282
L1281:
# begin if statement
        lw $t0, 16($sp)
        li $t1, 14
        seq $t2, $t0, $t1
        bnez $t2, L1285
        j L1284
L1285:
# begin stmtExpr
        lw $t0, G14
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G2
        sw $t0, G14
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G2
# end stmtExpr
L1284:
# end if statement
L1282:
# end ifElse statement
L1279:
# end ifElse statement
L1276:
# end ifElse statement
L1273:
# end ifElse statement
L1270:
# end ifElse statement
L1267:
# end ifElse statement
L1264:
# end ifElse statement
L1261:
# end ifElse statement
L1258:
# end ifElse statement
L1255:
# end ifElse statement
L1252:
# end ifElse statement
L1249:
# end ifElse statement
L1246:
# end ifElse statement
L1243:
# end ifElse statement
        j L1240
L1239:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 3
        seq $t2, $t0, $t1
        bnez $t2, L1288
        j L1286
L1288:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 0
        seq $t2, $t0, $t1
        bnez $t2, L1291
        j L1289
L1291:
# begin stmtExpr
        lw $t0, G0
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G3
        sw $t0, G0
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G3
# end stmtExpr
        j L1290
L1289:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 1
        seq $t2, $t0, $t1
        bnez $t2, L1294
        j L1292
L1294:
# begin stmtExpr
        lw $t0, G1
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G3
        sw $t0, G1
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G3
# end stmtExpr
        j L1293
L1292:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 2
        seq $t2, $t0, $t1
        bnez $t2, L1297
        j L1295
L1297:
# begin stmtExpr
        lw $t0, G2
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G3
        sw $t0, G2
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G3
# end stmtExpr
        j L1296
L1295:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 3
        seq $t2, $t0, $t1
        bnez $t2, L1300
        j L1298
L1300:
# begin stmtExpr
        lw $t0, G3
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G3
        sw $t0, G3
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G3
# end stmtExpr
        j L1299
L1298:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 4
        seq $t2, $t0, $t1
        bnez $t2, L1303
        j L1301
L1303:
# begin stmtExpr
        lw $t0, G4
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G3
        sw $t0, G4
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G3
# end stmtExpr
        j L1302
L1301:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 5
        seq $t2, $t0, $t1
        bnez $t2, L1306
        j L1304
L1306:
# begin stmtExpr
        lw $t0, G5
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G3
        sw $t0, G5
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G3
# end stmtExpr
        j L1305
L1304:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 6
        seq $t2, $t0, $t1
        bnez $t2, L1309
        j L1307
L1309:
# begin stmtExpr
        lw $t0, G6
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G3
        sw $t0, G6
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G3
# end stmtExpr
        j L1308
L1307:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 7
        seq $t2, $t0, $t1
        bnez $t2, L1312
        j L1310
L1312:
# begin stmtExpr
        lw $t0, G7
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G3
        sw $t0, G7
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G3
# end stmtExpr
        j L1311
L1310:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 8
        seq $t2, $t0, $t1
        bnez $t2, L1315
        j L1313
L1315:
# begin stmtExpr
        lw $t0, G8
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G3
        sw $t0, G8
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G3
# end stmtExpr
        j L1314
L1313:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 9
        seq $t2, $t0, $t1
        bnez $t2, L1318
        j L1316
L1318:
# begin stmtExpr
        lw $t0, G9
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G3
        sw $t0, G9
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G3
# end stmtExpr
        j L1317
L1316:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 10
        seq $t2, $t0, $t1
        bnez $t2, L1321
        j L1319
L1321:
# begin stmtExpr
        lw $t0, G10
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G3
        sw $t0, G10
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G3
# end stmtExpr
        j L1320
L1319:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 11
        seq $t2, $t0, $t1
        bnez $t2, L1324
        j L1322
L1324:
# begin stmtExpr
        lw $t0, G11
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G3
        sw $t0, G11
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G3
# end stmtExpr
        j L1323
L1322:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 12
        seq $t2, $t0, $t1
        bnez $t2, L1327
        j L1325
L1327:
# begin stmtExpr
        lw $t0, G12
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G3
        sw $t0, G12
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G3
# end stmtExpr
        j L1326
L1325:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 13
        seq $t2, $t0, $t1
        bnez $t2, L1330
        j L1328
L1330:
# begin stmtExpr
        lw $t0, G13
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G3
        sw $t0, G13
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G3
# end stmtExpr
        j L1329
L1328:
# begin if statement
        lw $t0, 16($sp)
        li $t1, 14
        seq $t2, $t0, $t1
        bnez $t2, L1332
        j L1331
L1332:
# begin stmtExpr
        lw $t0, G14
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G3
        sw $t0, G14
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G3
# end stmtExpr
L1331:
# end if statement
L1329:
# end ifElse statement
L1326:
# end ifElse statement
L1323:
# end ifElse statement
L1320:
# end ifElse statement
L1317:
# end ifElse statement
L1314:
# end ifElse statement
L1311:
# end ifElse statement
L1308:
# end ifElse statement
L1305:
# end ifElse statement
L1302:
# end ifElse statement
L1299:
# end ifElse statement
L1296:
# end ifElse statement
L1293:
# end ifElse statement
L1290:
# end ifElse statement
        j L1287
L1286:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 4
        seq $t2, $t0, $t1
        bnez $t2, L1335
        j L1333
L1335:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 0
        seq $t2, $t0, $t1
        bnez $t2, L1338
        j L1336
L1338:
# begin stmtExpr
        lw $t0, G0
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G4
        sw $t0, G0
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G4
# end stmtExpr
        j L1337
L1336:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 1
        seq $t2, $t0, $t1
        bnez $t2, L1341
        j L1339
L1341:
# begin stmtExpr
        lw $t0, G1
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G4
        sw $t0, G1
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G4
# end stmtExpr
        j L1340
L1339:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 2
        seq $t2, $t0, $t1
        bnez $t2, L1344
        j L1342
L1344:
# begin stmtExpr
        lw $t0, G2
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G4
        sw $t0, G2
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G4
# end stmtExpr
        j L1343
L1342:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 3
        seq $t2, $t0, $t1
        bnez $t2, L1347
        j L1345
L1347:
# begin stmtExpr
        lw $t0, G3
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G4
        sw $t0, G3
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G4
# end stmtExpr
        j L1346
L1345:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 4
        seq $t2, $t0, $t1
        bnez $t2, L1350
        j L1348
L1350:
# begin stmtExpr
        lw $t0, G4
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G4
        sw $t0, G4
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G4
# end stmtExpr
        j L1349
L1348:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 5
        seq $t2, $t0, $t1
        bnez $t2, L1353
        j L1351
L1353:
# begin stmtExpr
        lw $t0, G5
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G4
        sw $t0, G5
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G4
# end stmtExpr
        j L1352
L1351:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 6
        seq $t2, $t0, $t1
        bnez $t2, L1356
        j L1354
L1356:
# begin stmtExpr
        lw $t0, G6
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G4
        sw $t0, G6
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G4
# end stmtExpr
        j L1355
L1354:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 7
        seq $t2, $t0, $t1
        bnez $t2, L1359
        j L1357
L1359:
# begin stmtExpr
        lw $t0, G7
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G4
        sw $t0, G7
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G4
# end stmtExpr
        j L1358
L1357:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 8
        seq $t2, $t0, $t1
        bnez $t2, L1362
        j L1360
L1362:
# begin stmtExpr
        lw $t0, G8
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G4
        sw $t0, G8
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G4
# end stmtExpr
        j L1361
L1360:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 9
        seq $t2, $t0, $t1
        bnez $t2, L1365
        j L1363
L1365:
# begin stmtExpr
        lw $t0, G9
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G4
        sw $t0, G9
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G4
# end stmtExpr
        j L1364
L1363:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 10
        seq $t2, $t0, $t1
        bnez $t2, L1368
        j L1366
L1368:
# begin stmtExpr
        lw $t0, G10
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G4
        sw $t0, G10
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G4
# end stmtExpr
        j L1367
L1366:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 11
        seq $t2, $t0, $t1
        bnez $t2, L1371
        j L1369
L1371:
# begin stmtExpr
        lw $t0, G11
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G4
        sw $t0, G11
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G4
# end stmtExpr
        j L1370
L1369:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 12
        seq $t2, $t0, $t1
        bnez $t2, L1374
        j L1372
L1374:
# begin stmtExpr
        lw $t0, G12
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G4
        sw $t0, G12
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G4
# end stmtExpr
        j L1373
L1372:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 13
        seq $t2, $t0, $t1
        bnez $t2, L1377
        j L1375
L1377:
# begin stmtExpr
        lw $t0, G13
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G4
        sw $t0, G13
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G4
# end stmtExpr
        j L1376
L1375:
# begin if statement
        lw $t0, 16($sp)
        li $t1, 14
        seq $t2, $t0, $t1
        bnez $t2, L1379
        j L1378
L1379:
# begin stmtExpr
        lw $t0, G14
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G4
        sw $t0, G14
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G4
# end stmtExpr
L1378:
# end if statement
L1376:
# end ifElse statement
L1373:
# end ifElse statement
L1370:
# end ifElse statement
L1367:
# end ifElse statement
L1364:
# end ifElse statement
L1361:
# end ifElse statement
L1358:
# end ifElse statement
L1355:
# end ifElse statement
L1352:
# end ifElse statement
L1349:
# end ifElse statement
L1346:
# end ifElse statement
L1343:
# end ifElse statement
L1340:
# end ifElse statement
L1337:
# end ifElse statement
        j L1334
L1333:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 5
        seq $t2, $t0, $t1
        bnez $t2, L1382
        j L1380
L1382:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 0
        seq $t2, $t0, $t1
        bnez $t2, L1385
        j L1383
L1385:
# begin stmtExpr
        lw $t0, G0
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G5
        sw $t0, G0
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G5
# end stmtExpr
        j L1384
L1383:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 1
        seq $t2, $t0, $t1
        bnez $t2, L1388
        j L1386
L1388:
# begin stmtExpr
        lw $t0, G1
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G5
        sw $t0, G1
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G5
# end stmtExpr
        j L1387
L1386:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 2
        seq $t2, $t0, $t1
        bnez $t2, L1391
        j L1389
L1391:
# begin stmtExpr
        lw $t0, G2
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G5
        sw $t0, G2
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G5
# end stmtExpr
        j L1390
L1389:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 3
        seq $t2, $t0, $t1
        bnez $t2, L1394
        j L1392
L1394:
# begin stmtExpr
        lw $t0, G3
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G5
        sw $t0, G3
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G5
# end stmtExpr
        j L1393
L1392:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 4
        seq $t2, $t0, $t1
        bnez $t2, L1397
        j L1395
L1397:
# begin stmtExpr
        lw $t0, G4
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G5
        sw $t0, G4
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G5
# end stmtExpr
        j L1396
L1395:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 5
        seq $t2, $t0, $t1
        bnez $t2, L1400
        j L1398
L1400:
# begin stmtExpr
        lw $t0, G5
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G5
        sw $t0, G5
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G5
# end stmtExpr
        j L1399
L1398:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 6
        seq $t2, $t0, $t1
        bnez $t2, L1403
        j L1401
L1403:
# begin stmtExpr
        lw $t0, G6
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G5
        sw $t0, G6
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G5
# end stmtExpr
        j L1402
L1401:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 7
        seq $t2, $t0, $t1
        bnez $t2, L1406
        j L1404
L1406:
# begin stmtExpr
        lw $t0, G7
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G5
        sw $t0, G7
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G5
# end stmtExpr
        j L1405
L1404:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 8
        seq $t2, $t0, $t1
        bnez $t2, L1409
        j L1407
L1409:
# begin stmtExpr
        lw $t0, G8
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G5
        sw $t0, G8
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G5
# end stmtExpr
        j L1408
L1407:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 9
        seq $t2, $t0, $t1
        bnez $t2, L1412
        j L1410
L1412:
# begin stmtExpr
        lw $t0, G9
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G5
        sw $t0, G9
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G5
# end stmtExpr
        j L1411
L1410:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 10
        seq $t2, $t0, $t1
        bnez $t2, L1415
        j L1413
L1415:
# begin stmtExpr
        lw $t0, G10
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G5
        sw $t0, G10
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G5
# end stmtExpr
        j L1414
L1413:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 11
        seq $t2, $t0, $t1
        bnez $t2, L1418
        j L1416
L1418:
# begin stmtExpr
        lw $t0, G11
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G5
        sw $t0, G11
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G5
# end stmtExpr
        j L1417
L1416:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 12
        seq $t2, $t0, $t1
        bnez $t2, L1421
        j L1419
L1421:
# begin stmtExpr
        lw $t0, G12
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G5
        sw $t0, G12
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G5
# end stmtExpr
        j L1420
L1419:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 13
        seq $t2, $t0, $t1
        bnez $t2, L1424
        j L1422
L1424:
# begin stmtExpr
        lw $t0, G13
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G5
        sw $t0, G13
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G5
# end stmtExpr
        j L1423
L1422:
# begin if statement
        lw $t0, 16($sp)
        li $t1, 14
        seq $t2, $t0, $t1
        bnez $t2, L1426
        j L1425
L1426:
# begin stmtExpr
        lw $t0, G14
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G5
        sw $t0, G14
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G5
# end stmtExpr
L1425:
# end if statement
L1423:
# end ifElse statement
L1420:
# end ifElse statement
L1417:
# end ifElse statement
L1414:
# end ifElse statement
L1411:
# end ifElse statement
L1408:
# end ifElse statement
L1405:
# end ifElse statement
L1402:
# end ifElse statement
L1399:
# end ifElse statement
L1396:
# end ifElse statement
L1393:
# end ifElse statement
L1390:
# end ifElse statement
L1387:
# end ifElse statement
L1384:
# end ifElse statement
        j L1381
L1380:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 6
        seq $t2, $t0, $t1
        bnez $t2, L1429
        j L1427
L1429:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 0
        seq $t2, $t0, $t1
        bnez $t2, L1432
        j L1430
L1432:
# begin stmtExpr
        lw $t0, G0
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G6
        sw $t0, G0
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G6
# end stmtExpr
        j L1431
L1430:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 1
        seq $t2, $t0, $t1
        bnez $t2, L1435
        j L1433
L1435:
# begin stmtExpr
        lw $t0, G1
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G6
        sw $t0, G1
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G6
# end stmtExpr
        j L1434
L1433:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 2
        seq $t2, $t0, $t1
        bnez $t2, L1438
        j L1436
L1438:
# begin stmtExpr
        lw $t0, G2
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G6
        sw $t0, G2
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G6
# end stmtExpr
        j L1437
L1436:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 3
        seq $t2, $t0, $t1
        bnez $t2, L1441
        j L1439
L1441:
# begin stmtExpr
        lw $t0, G3
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G6
        sw $t0, G3
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G6
# end stmtExpr
        j L1440
L1439:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 4
        seq $t2, $t0, $t1
        bnez $t2, L1444
        j L1442
L1444:
# begin stmtExpr
        lw $t0, G4
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G6
        sw $t0, G4
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G6
# end stmtExpr
        j L1443
L1442:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 5
        seq $t2, $t0, $t1
        bnez $t2, L1447
        j L1445
L1447:
# begin stmtExpr
        lw $t0, G5
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G6
        sw $t0, G5
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G6
# end stmtExpr
        j L1446
L1445:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 6
        seq $t2, $t0, $t1
        bnez $t2, L1450
        j L1448
L1450:
# begin stmtExpr
        lw $t0, G6
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G6
        sw $t0, G6
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G6
# end stmtExpr
        j L1449
L1448:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 7
        seq $t2, $t0, $t1
        bnez $t2, L1453
        j L1451
L1453:
# begin stmtExpr
        lw $t0, G7
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G6
        sw $t0, G7
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G6
# end stmtExpr
        j L1452
L1451:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 8
        seq $t2, $t0, $t1
        bnez $t2, L1456
        j L1454
L1456:
# begin stmtExpr
        lw $t0, G8
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G6
        sw $t0, G8
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G6
# end stmtExpr
        j L1455
L1454:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 9
        seq $t2, $t0, $t1
        bnez $t2, L1459
        j L1457
L1459:
# begin stmtExpr
        lw $t0, G9
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G6
        sw $t0, G9
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G6
# end stmtExpr
        j L1458
L1457:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 10
        seq $t2, $t0, $t1
        bnez $t2, L1462
        j L1460
L1462:
# begin stmtExpr
        lw $t0, G10
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G6
        sw $t0, G10
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G6
# end stmtExpr
        j L1461
L1460:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 11
        seq $t2, $t0, $t1
        bnez $t2, L1465
        j L1463
L1465:
# begin stmtExpr
        lw $t0, G11
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G6
        sw $t0, G11
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G6
# end stmtExpr
        j L1464
L1463:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 12
        seq $t2, $t0, $t1
        bnez $t2, L1468
        j L1466
L1468:
# begin stmtExpr
        lw $t0, G12
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G6
        sw $t0, G12
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G6
# end stmtExpr
        j L1467
L1466:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 13
        seq $t2, $t0, $t1
        bnez $t2, L1471
        j L1469
L1471:
# begin stmtExpr
        lw $t0, G13
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G6
        sw $t0, G13
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G6
# end stmtExpr
        j L1470
L1469:
# begin if statement
        lw $t0, 16($sp)
        li $t1, 14
        seq $t2, $t0, $t1
        bnez $t2, L1473
        j L1472
L1473:
# begin stmtExpr
        lw $t0, G14
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G6
        sw $t0, G14
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G6
# end stmtExpr
L1472:
# end if statement
L1470:
# end ifElse statement
L1467:
# end ifElse statement
L1464:
# end ifElse statement
L1461:
# end ifElse statement
L1458:
# end ifElse statement
L1455:
# end ifElse statement
L1452:
# end ifElse statement
L1449:
# end ifElse statement
L1446:
# end ifElse statement
L1443:
# end ifElse statement
L1440:
# end ifElse statement
L1437:
# end ifElse statement
L1434:
# end ifElse statement
L1431:
# end ifElse statement
        j L1428
L1427:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 7
        seq $t2, $t0, $t1
        bnez $t2, L1476
        j L1474
L1476:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 0
        seq $t2, $t0, $t1
        bnez $t2, L1479
        j L1477
L1479:
# begin stmtExpr
        lw $t0, G0
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G7
        sw $t0, G0
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G7
# end stmtExpr
        j L1478
L1477:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 1
        seq $t2, $t0, $t1
        bnez $t2, L1482
        j L1480
L1482:
# begin stmtExpr
        lw $t0, G1
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G7
        sw $t0, G1
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G7
# end stmtExpr
        j L1481
L1480:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 2
        seq $t2, $t0, $t1
        bnez $t2, L1485
        j L1483
L1485:
# begin stmtExpr
        lw $t0, G2
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G7
        sw $t0, G2
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G7
# end stmtExpr
        j L1484
L1483:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 3
        seq $t2, $t0, $t1
        bnez $t2, L1488
        j L1486
L1488:
# begin stmtExpr
        lw $t0, G3
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G7
        sw $t0, G3
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G7
# end stmtExpr
        j L1487
L1486:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 4
        seq $t2, $t0, $t1
        bnez $t2, L1491
        j L1489
L1491:
# begin stmtExpr
        lw $t0, G4
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G7
        sw $t0, G4
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G7
# end stmtExpr
        j L1490
L1489:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 5
        seq $t2, $t0, $t1
        bnez $t2, L1494
        j L1492
L1494:
# begin stmtExpr
        lw $t0, G5
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G7
        sw $t0, G5
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G7
# end stmtExpr
        j L1493
L1492:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 6
        seq $t2, $t0, $t1
        bnez $t2, L1497
        j L1495
L1497:
# begin stmtExpr
        lw $t0, G6
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G7
        sw $t0, G6
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G7
# end stmtExpr
        j L1496
L1495:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 7
        seq $t2, $t0, $t1
        bnez $t2, L1500
        j L1498
L1500:
# begin stmtExpr
        lw $t0, G7
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G7
        sw $t0, G7
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G7
# end stmtExpr
        j L1499
L1498:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 8
        seq $t2, $t0, $t1
        bnez $t2, L1503
        j L1501
L1503:
# begin stmtExpr
        lw $t0, G8
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G7
        sw $t0, G8
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G7
# end stmtExpr
        j L1502
L1501:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 9
        seq $t2, $t0, $t1
        bnez $t2, L1506
        j L1504
L1506:
# begin stmtExpr
        lw $t0, G9
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G7
        sw $t0, G9
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G7
# end stmtExpr
        j L1505
L1504:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 10
        seq $t2, $t0, $t1
        bnez $t2, L1509
        j L1507
L1509:
# begin stmtExpr
        lw $t0, G10
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G7
        sw $t0, G10
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G7
# end stmtExpr
        j L1508
L1507:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 11
        seq $t2, $t0, $t1
        bnez $t2, L1512
        j L1510
L1512:
# begin stmtExpr
        lw $t0, G11
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G7
        sw $t0, G11
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G7
# end stmtExpr
        j L1511
L1510:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 12
        seq $t2, $t0, $t1
        bnez $t2, L1515
        j L1513
L1515:
# begin stmtExpr
        lw $t0, G12
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G7
        sw $t0, G12
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G7
# end stmtExpr
        j L1514
L1513:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 13
        seq $t2, $t0, $t1
        bnez $t2, L1518
        j L1516
L1518:
# begin stmtExpr
        lw $t0, G13
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G7
        sw $t0, G13
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G7
# end stmtExpr
        j L1517
L1516:
# begin if statement
        lw $t0, 16($sp)
        li $t1, 14
        seq $t2, $t0, $t1
        bnez $t2, L1520
        j L1519
L1520:
# begin stmtExpr
        lw $t0, G14
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G7
        sw $t0, G14
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G7
# end stmtExpr
L1519:
# end if statement
L1517:
# end ifElse statement
L1514:
# end ifElse statement
L1511:
# end ifElse statement
L1508:
# end ifElse statement
L1505:
# end ifElse statement
L1502:
# end ifElse statement
L1499:
# end ifElse statement
L1496:
# end ifElse statement
L1493:
# end ifElse statement
L1490:
# end ifElse statement
L1487:
# end ifElse statement
L1484:
# end ifElse statement
L1481:
# end ifElse statement
L1478:
# end ifElse statement
        j L1475
L1474:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 8
        seq $t2, $t0, $t1
        bnez $t2, L1523
        j L1521
L1523:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 0
        seq $t2, $t0, $t1
        bnez $t2, L1526
        j L1524
L1526:
# begin stmtExpr
        lw $t0, G0
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G8
        sw $t0, G0
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G8
# end stmtExpr
        j L1525
L1524:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 1
        seq $t2, $t0, $t1
        bnez $t2, L1529
        j L1527
L1529:
# begin stmtExpr
        lw $t0, G1
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G8
        sw $t0, G1
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G8
# end stmtExpr
        j L1528
L1527:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 2
        seq $t2, $t0, $t1
        bnez $t2, L1532
        j L1530
L1532:
# begin stmtExpr
        lw $t0, G2
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G8
        sw $t0, G2
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G8
# end stmtExpr
        j L1531
L1530:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 3
        seq $t2, $t0, $t1
        bnez $t2, L1535
        j L1533
L1535:
# begin stmtExpr
        lw $t0, G3
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G8
        sw $t0, G3
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G8
# end stmtExpr
        j L1534
L1533:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 4
        seq $t2, $t0, $t1
        bnez $t2, L1538
        j L1536
L1538:
# begin stmtExpr
        lw $t0, G4
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G8
        sw $t0, G4
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G8
# end stmtExpr
        j L1537
L1536:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 5
        seq $t2, $t0, $t1
        bnez $t2, L1541
        j L1539
L1541:
# begin stmtExpr
        lw $t0, G5
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G8
        sw $t0, G5
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G8
# end stmtExpr
        j L1540
L1539:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 6
        seq $t2, $t0, $t1
        bnez $t2, L1544
        j L1542
L1544:
# begin stmtExpr
        lw $t0, G6
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G8
        sw $t0, G6
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G8
# end stmtExpr
        j L1543
L1542:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 7
        seq $t2, $t0, $t1
        bnez $t2, L1547
        j L1545
L1547:
# begin stmtExpr
        lw $t0, G7
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G8
        sw $t0, G7
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G8
# end stmtExpr
        j L1546
L1545:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 8
        seq $t2, $t0, $t1
        bnez $t2, L1550
        j L1548
L1550:
# begin stmtExpr
        lw $t0, G8
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G8
        sw $t0, G8
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G8
# end stmtExpr
        j L1549
L1548:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 9
        seq $t2, $t0, $t1
        bnez $t2, L1553
        j L1551
L1553:
# begin stmtExpr
        lw $t0, G9
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G8
        sw $t0, G9
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G8
# end stmtExpr
        j L1552
L1551:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 10
        seq $t2, $t0, $t1
        bnez $t2, L1556
        j L1554
L1556:
# begin stmtExpr
        lw $t0, G10
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G8
        sw $t0, G10
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G8
# end stmtExpr
        j L1555
L1554:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 11
        seq $t2, $t0, $t1
        bnez $t2, L1559
        j L1557
L1559:
# begin stmtExpr
        lw $t0, G11
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G8
        sw $t0, G11
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G8
# end stmtExpr
        j L1558
L1557:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 12
        seq $t2, $t0, $t1
        bnez $t2, L1562
        j L1560
L1562:
# begin stmtExpr
        lw $t0, G12
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G8
        sw $t0, G12
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G8
# end stmtExpr
        j L1561
L1560:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 13
        seq $t2, $t0, $t1
        bnez $t2, L1565
        j L1563
L1565:
# begin stmtExpr
        lw $t0, G13
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G8
        sw $t0, G13
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G8
# end stmtExpr
        j L1564
L1563:
# begin if statement
        lw $t0, 16($sp)
        li $t1, 14
        seq $t2, $t0, $t1
        bnez $t2, L1567
        j L1566
L1567:
# begin stmtExpr
        lw $t0, G14
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G8
        sw $t0, G14
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G8
# end stmtExpr
L1566:
# end if statement
L1564:
# end ifElse statement
L1561:
# end ifElse statement
L1558:
# end ifElse statement
L1555:
# end ifElse statement
L1552:
# end ifElse statement
L1549:
# end ifElse statement
L1546:
# end ifElse statement
L1543:
# end ifElse statement
L1540:
# end ifElse statement
L1537:
# end ifElse statement
L1534:
# end ifElse statement
L1531:
# end ifElse statement
L1528:
# end ifElse statement
L1525:
# end ifElse statement
        j L1522
L1521:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 9
        seq $t2, $t0, $t1
        bnez $t2, L1570
        j L1568
L1570:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 0
        seq $t2, $t0, $t1
        bnez $t2, L1573
        j L1571
L1573:
# begin stmtExpr
        lw $t0, G0
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G9
        sw $t0, G0
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G9
# end stmtExpr
        j L1572
L1571:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 1
        seq $t2, $t0, $t1
        bnez $t2, L1576
        j L1574
L1576:
# begin stmtExpr
        lw $t0, G1
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G9
        sw $t0, G1
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G9
# end stmtExpr
        j L1575
L1574:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 2
        seq $t2, $t0, $t1
        bnez $t2, L1579
        j L1577
L1579:
# begin stmtExpr
        lw $t0, G2
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G9
        sw $t0, G2
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G9
# end stmtExpr
        j L1578
L1577:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 3
        seq $t2, $t0, $t1
        bnez $t2, L1582
        j L1580
L1582:
# begin stmtExpr
        lw $t0, G3
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G9
        sw $t0, G3
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G9
# end stmtExpr
        j L1581
L1580:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 4
        seq $t2, $t0, $t1
        bnez $t2, L1585
        j L1583
L1585:
# begin stmtExpr
        lw $t0, G4
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G9
        sw $t0, G4
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G9
# end stmtExpr
        j L1584
L1583:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 5
        seq $t2, $t0, $t1
        bnez $t2, L1588
        j L1586
L1588:
# begin stmtExpr
        lw $t0, G5
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G9
        sw $t0, G5
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G9
# end stmtExpr
        j L1587
L1586:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 6
        seq $t2, $t0, $t1
        bnez $t2, L1591
        j L1589
L1591:
# begin stmtExpr
        lw $t0, G6
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G9
        sw $t0, G6
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G9
# end stmtExpr
        j L1590
L1589:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 7
        seq $t2, $t0, $t1
        bnez $t2, L1594
        j L1592
L1594:
# begin stmtExpr
        lw $t0, G7
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G9
        sw $t0, G7
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G9
# end stmtExpr
        j L1593
L1592:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 8
        seq $t2, $t0, $t1
        bnez $t2, L1597
        j L1595
L1597:
# begin stmtExpr
        lw $t0, G8
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G9
        sw $t0, G8
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G9
# end stmtExpr
        j L1596
L1595:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 9
        seq $t2, $t0, $t1
        bnez $t2, L1600
        j L1598
L1600:
# begin stmtExpr
        lw $t0, G9
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G9
        sw $t0, G9
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G9
# end stmtExpr
        j L1599
L1598:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 10
        seq $t2, $t0, $t1
        bnez $t2, L1603
        j L1601
L1603:
# begin stmtExpr
        lw $t0, G10
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G9
        sw $t0, G10
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G9
# end stmtExpr
        j L1602
L1601:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 11
        seq $t2, $t0, $t1
        bnez $t2, L1606
        j L1604
L1606:
# begin stmtExpr
        lw $t0, G11
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G9
        sw $t0, G11
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G9
# end stmtExpr
        j L1605
L1604:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 12
        seq $t2, $t0, $t1
        bnez $t2, L1609
        j L1607
L1609:
# begin stmtExpr
        lw $t0, G12
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G9
        sw $t0, G12
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G9
# end stmtExpr
        j L1608
L1607:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 13
        seq $t2, $t0, $t1
        bnez $t2, L1612
        j L1610
L1612:
# begin stmtExpr
        lw $t0, G13
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G9
        sw $t0, G13
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G9
# end stmtExpr
        j L1611
L1610:
# begin if statement
        lw $t0, 16($sp)
        li $t1, 14
        seq $t2, $t0, $t1
        bnez $t2, L1614
        j L1613
L1614:
# begin stmtExpr
        lw $t0, G14
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G9
        sw $t0, G14
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G9
# end stmtExpr
L1613:
# end if statement
L1611:
# end ifElse statement
L1608:
# end ifElse statement
L1605:
# end ifElse statement
L1602:
# end ifElse statement
L1599:
# end ifElse statement
L1596:
# end ifElse statement
L1593:
# end ifElse statement
L1590:
# end ifElse statement
L1587:
# end ifElse statement
L1584:
# end ifElse statement
L1581:
# end ifElse statement
L1578:
# end ifElse statement
L1575:
# end ifElse statement
L1572:
# end ifElse statement
        j L1569
L1568:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 10
        seq $t2, $t0, $t1
        bnez $t2, L1617
        j L1615
L1617:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 0
        seq $t2, $t0, $t1
        bnez $t2, L1620
        j L1618
L1620:
# begin stmtExpr
        lw $t0, G0
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G10
        sw $t0, G0
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G10
# end stmtExpr
        j L1619
L1618:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 1
        seq $t2, $t0, $t1
        bnez $t2, L1623
        j L1621
L1623:
# begin stmtExpr
        lw $t0, G1
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G10
        sw $t0, G1
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G10
# end stmtExpr
        j L1622
L1621:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 2
        seq $t2, $t0, $t1
        bnez $t2, L1626
        j L1624
L1626:
# begin stmtExpr
        lw $t0, G2
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G10
        sw $t0, G2
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G10
# end stmtExpr
        j L1625
L1624:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 3
        seq $t2, $t0, $t1
        bnez $t2, L1629
        j L1627
L1629:
# begin stmtExpr
        lw $t0, G3
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G10
        sw $t0, G3
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G10
# end stmtExpr
        j L1628
L1627:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 4
        seq $t2, $t0, $t1
        bnez $t2, L1632
        j L1630
L1632:
# begin stmtExpr
        lw $t0, G4
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G10
        sw $t0, G4
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G10
# end stmtExpr
        j L1631
L1630:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 5
        seq $t2, $t0, $t1
        bnez $t2, L1635
        j L1633
L1635:
# begin stmtExpr
        lw $t0, G5
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G10
        sw $t0, G5
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G10
# end stmtExpr
        j L1634
L1633:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 6
        seq $t2, $t0, $t1
        bnez $t2, L1638
        j L1636
L1638:
# begin stmtExpr
        lw $t0, G6
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G10
        sw $t0, G6
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G10
# end stmtExpr
        j L1637
L1636:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 7
        seq $t2, $t0, $t1
        bnez $t2, L1641
        j L1639
L1641:
# begin stmtExpr
        lw $t0, G7
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G10
        sw $t0, G7
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G10
# end stmtExpr
        j L1640
L1639:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 8
        seq $t2, $t0, $t1
        bnez $t2, L1644
        j L1642
L1644:
# begin stmtExpr
        lw $t0, G8
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G10
        sw $t0, G8
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G10
# end stmtExpr
        j L1643
L1642:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 9
        seq $t2, $t0, $t1
        bnez $t2, L1647
        j L1645
L1647:
# begin stmtExpr
        lw $t0, G9
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G10
        sw $t0, G9
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G10
# end stmtExpr
        j L1646
L1645:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 10
        seq $t2, $t0, $t1
        bnez $t2, L1650
        j L1648
L1650:
# begin stmtExpr
        lw $t0, G10
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G10
        sw $t0, G10
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G10
# end stmtExpr
        j L1649
L1648:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 11
        seq $t2, $t0, $t1
        bnez $t2, L1653
        j L1651
L1653:
# begin stmtExpr
        lw $t0, G11
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G10
        sw $t0, G11
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G10
# end stmtExpr
        j L1652
L1651:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 12
        seq $t2, $t0, $t1
        bnez $t2, L1656
        j L1654
L1656:
# begin stmtExpr
        lw $t0, G12
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G10
        sw $t0, G12
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G10
# end stmtExpr
        j L1655
L1654:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 13
        seq $t2, $t0, $t1
        bnez $t2, L1659
        j L1657
L1659:
# begin stmtExpr
        lw $t0, G13
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G10
        sw $t0, G13
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G10
# end stmtExpr
        j L1658
L1657:
# begin if statement
        lw $t0, 16($sp)
        li $t1, 14
        seq $t2, $t0, $t1
        bnez $t2, L1661
        j L1660
L1661:
# begin stmtExpr
        lw $t0, G14
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G10
        sw $t0, G14
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G10
# end stmtExpr
L1660:
# end if statement
L1658:
# end ifElse statement
L1655:
# end ifElse statement
L1652:
# end ifElse statement
L1649:
# end ifElse statement
L1646:
# end ifElse statement
L1643:
# end ifElse statement
L1640:
# end ifElse statement
L1637:
# end ifElse statement
L1634:
# end ifElse statement
L1631:
# end ifElse statement
L1628:
# end ifElse statement
L1625:
# end ifElse statement
L1622:
# end ifElse statement
L1619:
# end ifElse statement
        j L1616
L1615:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 11
        seq $t2, $t0, $t1
        bnez $t2, L1664
        j L1662
L1664:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 0
        seq $t2, $t0, $t1
        bnez $t2, L1667
        j L1665
L1667:
# begin stmtExpr
        lw $t0, G0
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G11
        sw $t0, G0
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G11
# end stmtExpr
        j L1666
L1665:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 1
        seq $t2, $t0, $t1
        bnez $t2, L1670
        j L1668
L1670:
# begin stmtExpr
        lw $t0, G1
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G11
        sw $t0, G1
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G11
# end stmtExpr
        j L1669
L1668:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 2
        seq $t2, $t0, $t1
        bnez $t2, L1673
        j L1671
L1673:
# begin stmtExpr
        lw $t0, G2
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G11
        sw $t0, G2
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G11
# end stmtExpr
        j L1672
L1671:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 3
        seq $t2, $t0, $t1
        bnez $t2, L1676
        j L1674
L1676:
# begin stmtExpr
        lw $t0, G3
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G11
        sw $t0, G3
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G11
# end stmtExpr
        j L1675
L1674:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 4
        seq $t2, $t0, $t1
        bnez $t2, L1679
        j L1677
L1679:
# begin stmtExpr
        lw $t0, G4
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G11
        sw $t0, G4
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G11
# end stmtExpr
        j L1678
L1677:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 5
        seq $t2, $t0, $t1
        bnez $t2, L1682
        j L1680
L1682:
# begin stmtExpr
        lw $t0, G5
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G11
        sw $t0, G5
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G11
# end stmtExpr
        j L1681
L1680:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 6
        seq $t2, $t0, $t1
        bnez $t2, L1685
        j L1683
L1685:
# begin stmtExpr
        lw $t0, G6
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G11
        sw $t0, G6
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G11
# end stmtExpr
        j L1684
L1683:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 7
        seq $t2, $t0, $t1
        bnez $t2, L1688
        j L1686
L1688:
# begin stmtExpr
        lw $t0, G7
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G11
        sw $t0, G7
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G11
# end stmtExpr
        j L1687
L1686:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 8
        seq $t2, $t0, $t1
        bnez $t2, L1691
        j L1689
L1691:
# begin stmtExpr
        lw $t0, G8
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G11
        sw $t0, G8
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G11
# end stmtExpr
        j L1690
L1689:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 9
        seq $t2, $t0, $t1
        bnez $t2, L1694
        j L1692
L1694:
# begin stmtExpr
        lw $t0, G9
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G11
        sw $t0, G9
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G11
# end stmtExpr
        j L1693
L1692:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 10
        seq $t2, $t0, $t1
        bnez $t2, L1697
        j L1695
L1697:
# begin stmtExpr
        lw $t0, G10
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G11
        sw $t0, G10
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G11
# end stmtExpr
        j L1696
L1695:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 11
        seq $t2, $t0, $t1
        bnez $t2, L1700
        j L1698
L1700:
# begin stmtExpr
        lw $t0, G11
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G11
        sw $t0, G11
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G11
# end stmtExpr
        j L1699
L1698:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 12
        seq $t2, $t0, $t1
        bnez $t2, L1703
        j L1701
L1703:
# begin stmtExpr
        lw $t0, G12
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G11
        sw $t0, G12
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G11
# end stmtExpr
        j L1702
L1701:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 13
        seq $t2, $t0, $t1
        bnez $t2, L1706
        j L1704
L1706:
# begin stmtExpr
        lw $t0, G13
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G11
        sw $t0, G13
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G11
# end stmtExpr
        j L1705
L1704:
# begin if statement
        lw $t0, 16($sp)
        li $t1, 14
        seq $t2, $t0, $t1
        bnez $t2, L1708
        j L1707
L1708:
# begin stmtExpr
        lw $t0, G14
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G11
        sw $t0, G14
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G11
# end stmtExpr
L1707:
# end if statement
L1705:
# end ifElse statement
L1702:
# end ifElse statement
L1699:
# end ifElse statement
L1696:
# end ifElse statement
L1693:
# end ifElse statement
L1690:
# end ifElse statement
L1687:
# end ifElse statement
L1684:
# end ifElse statement
L1681:
# end ifElse statement
L1678:
# end ifElse statement
L1675:
# end ifElse statement
L1672:
# end ifElse statement
L1669:
# end ifElse statement
L1666:
# end ifElse statement
        j L1663
L1662:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 12
        seq $t2, $t0, $t1
        bnez $t2, L1711
        j L1709
L1711:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 0
        seq $t2, $t0, $t1
        bnez $t2, L1714
        j L1712
L1714:
# begin stmtExpr
        lw $t0, G0
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G12
        sw $t0, G0
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G12
# end stmtExpr
        j L1713
L1712:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 1
        seq $t2, $t0, $t1
        bnez $t2, L1717
        j L1715
L1717:
# begin stmtExpr
        lw $t0, G1
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G12
        sw $t0, G1
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G12
# end stmtExpr
        j L1716
L1715:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 2
        seq $t2, $t0, $t1
        bnez $t2, L1720
        j L1718
L1720:
# begin stmtExpr
        lw $t0, G2
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G12
        sw $t0, G2
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G12
# end stmtExpr
        j L1719
L1718:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 3
        seq $t2, $t0, $t1
        bnez $t2, L1723
        j L1721
L1723:
# begin stmtExpr
        lw $t0, G3
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G12
        sw $t0, G3
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G12
# end stmtExpr
        j L1722
L1721:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 4
        seq $t2, $t0, $t1
        bnez $t2, L1726
        j L1724
L1726:
# begin stmtExpr
        lw $t0, G4
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G12
        sw $t0, G4
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G12
# end stmtExpr
        j L1725
L1724:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 5
        seq $t2, $t0, $t1
        bnez $t2, L1729
        j L1727
L1729:
# begin stmtExpr
        lw $t0, G5
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G12
        sw $t0, G5
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G12
# end stmtExpr
        j L1728
L1727:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 6
        seq $t2, $t0, $t1
        bnez $t2, L1732
        j L1730
L1732:
# begin stmtExpr
        lw $t0, G6
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G12
        sw $t0, G6
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G12
# end stmtExpr
        j L1731
L1730:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 7
        seq $t2, $t0, $t1
        bnez $t2, L1735
        j L1733
L1735:
# begin stmtExpr
        lw $t0, G7
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G12
        sw $t0, G7
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G12
# end stmtExpr
        j L1734
L1733:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 8
        seq $t2, $t0, $t1
        bnez $t2, L1738
        j L1736
L1738:
# begin stmtExpr
        lw $t0, G8
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G12
        sw $t0, G8
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G12
# end stmtExpr
        j L1737
L1736:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 9
        seq $t2, $t0, $t1
        bnez $t2, L1741
        j L1739
L1741:
# begin stmtExpr
        lw $t0, G9
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G12
        sw $t0, G9
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G12
# end stmtExpr
        j L1740
L1739:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 10
        seq $t2, $t0, $t1
        bnez $t2, L1744
        j L1742
L1744:
# begin stmtExpr
        lw $t0, G10
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G12
        sw $t0, G10
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G12
# end stmtExpr
        j L1743
L1742:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 11
        seq $t2, $t0, $t1
        bnez $t2, L1747
        j L1745
L1747:
# begin stmtExpr
        lw $t0, G11
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G12
        sw $t0, G11
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G12
# end stmtExpr
        j L1746
L1745:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 12
        seq $t2, $t0, $t1
        bnez $t2, L1750
        j L1748
L1750:
# begin stmtExpr
        lw $t0, G12
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G12
        sw $t0, G12
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G12
# end stmtExpr
        j L1749
L1748:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 13
        seq $t2, $t0, $t1
        bnez $t2, L1753
        j L1751
L1753:
# begin stmtExpr
        lw $t0, G13
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G12
        sw $t0, G13
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G12
# end stmtExpr
        j L1752
L1751:
# begin if statement
        lw $t0, 16($sp)
        li $t1, 14
        seq $t2, $t0, $t1
        bnez $t2, L1755
        j L1754
L1755:
# begin stmtExpr
        lw $t0, G14
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G12
        sw $t0, G14
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G12
# end stmtExpr
L1754:
# end if statement
L1752:
# end ifElse statement
L1749:
# end ifElse statement
L1746:
# end ifElse statement
L1743:
# end ifElse statement
L1740:
# end ifElse statement
L1737:
# end ifElse statement
L1734:
# end ifElse statement
L1731:
# end ifElse statement
L1728:
# end ifElse statement
L1725:
# end ifElse statement
L1722:
# end ifElse statement
L1719:
# end ifElse statement
L1716:
# end ifElse statement
L1713:
# end ifElse statement
        j L1710
L1709:
# begin if statement
        lw $t0, 4($sp)
        li $t1, 13
        seq $t2, $t0, $t1
        bnez $t2, L1757
        j L1756
L1757:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 0
        seq $t2, $t0, $t1
        bnez $t2, L1760
        j L1758
L1760:
# begin stmtExpr
        lw $t0, G0
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G13
        sw $t0, G0
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G13
# end stmtExpr
        j L1759
L1758:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 1
        seq $t2, $t0, $t1
        bnez $t2, L1763
        j L1761
L1763:
# begin stmtExpr
        lw $t0, G1
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G13
        sw $t0, G1
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G13
# end stmtExpr
        j L1762
L1761:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 2
        seq $t2, $t0, $t1
        bnez $t2, L1766
        j L1764
L1766:
# begin stmtExpr
        lw $t0, G2
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G13
        sw $t0, G2
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G13
# end stmtExpr
        j L1765
L1764:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 3
        seq $t2, $t0, $t1
        bnez $t2, L1769
        j L1767
L1769:
# begin stmtExpr
        lw $t0, G3
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G13
        sw $t0, G3
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G13
# end stmtExpr
        j L1768
L1767:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 4
        seq $t2, $t0, $t1
        bnez $t2, L1772
        j L1770
L1772:
# begin stmtExpr
        lw $t0, G4
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G13
        sw $t0, G4
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G13
# end stmtExpr
        j L1771
L1770:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 5
        seq $t2, $t0, $t1
        bnez $t2, L1775
        j L1773
L1775:
# begin stmtExpr
        lw $t0, G5
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G13
        sw $t0, G5
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G13
# end stmtExpr
        j L1774
L1773:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 6
        seq $t2, $t0, $t1
        bnez $t2, L1778
        j L1776
L1778:
# begin stmtExpr
        lw $t0, G6
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G13
        sw $t0, G6
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G13
# end stmtExpr
        j L1777
L1776:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 7
        seq $t2, $t0, $t1
        bnez $t2, L1781
        j L1779
L1781:
# begin stmtExpr
        lw $t0, G7
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G13
        sw $t0, G7
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G13
# end stmtExpr
        j L1780
L1779:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 8
        seq $t2, $t0, $t1
        bnez $t2, L1784
        j L1782
L1784:
# begin stmtExpr
        lw $t0, G8
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G13
        sw $t0, G8
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G13
# end stmtExpr
        j L1783
L1782:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 9
        seq $t2, $t0, $t1
        bnez $t2, L1787
        j L1785
L1787:
# begin stmtExpr
        lw $t0, G9
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G13
        sw $t0, G9
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G13
# end stmtExpr
        j L1786
L1785:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 10
        seq $t2, $t0, $t1
        bnez $t2, L1790
        j L1788
L1790:
# begin stmtExpr
        lw $t0, G10
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G13
        sw $t0, G10
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G13
# end stmtExpr
        j L1789
L1788:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 11
        seq $t2, $t0, $t1
        bnez $t2, L1793
        j L1791
L1793:
# begin stmtExpr
        lw $t0, G11
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G13
        sw $t0, G11
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G13
# end stmtExpr
        j L1792
L1791:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 12
        seq $t2, $t0, $t1
        bnez $t2, L1796
        j L1794
L1796:
# begin stmtExpr
        lw $t0, G12
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G13
        sw $t0, G12
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G13
# end stmtExpr
        j L1795
L1794:
# begin ifElse statement
        lw $t0, 16($sp)
        li $t1, 13
        seq $t2, $t0, $t1
        bnez $t2, L1799
        j L1797
L1799:
# begin stmtExpr
        lw $t0, G13
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G13
        sw $t0, G13
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G13
# end stmtExpr
        j L1798
L1797:
# begin if statement
        lw $t0, 16($sp)
        li $t1, 14
        seq $t2, $t0, $t1
        bnez $t2, L1801
        j L1800
L1801:
# begin stmtExpr
        lw $t0, G14
        sw $t0, 12($sp)
# end stmtExpr
# begin stmtExpr
        lw $t0, G13
        sw $t0, G14
# end stmtExpr
# begin stmtExpr
        lw $t0, 12($sp)
        sw $t0, G13
# end stmtExpr
L1800:
# end if statement
L1798:
# end ifElse statement
L1795:
# end ifElse statement
L1792:
# end ifElse statement
L1789:
# end ifElse statement
L1786:
# end ifElse statement
L1783:
# end ifElse statement
L1780:
# end ifElse statement
L1777:
# end ifElse statement
L1774:
# end ifElse statement
L1771:
# end ifElse statement
L1768:
# end ifElse statement
L1765:
# end ifElse statement
L1762:
# end ifElse statement
L1759:
# end ifElse statement
L1756:
# end if statement
L1710:
# end ifElse statement
L1663:
# end ifElse statement
L1616:
# end ifElse statement
L1569:
# end ifElse statement
L1522:
# end ifElse statement
L1475:
# end ifElse statement
L1428:
# end ifElse statement
L1381:
# end ifElse statement
L1334:
# end ifElse statement
L1287:
# end ifElse statement
L1240:
# end ifElse statement
L1193:
# end ifElse statement
L1146:
# end ifElse statement
# begin stmtExpr
        jal P1

# end stmtExpr
# begin stmtExpr
        lw $t0, 4($sp)
        li $t1, 1
        addu $t2, $t0, $t1
        sw $t2, 4($sp)
# end stmtExpr
        j L62
L63:
# end while statement
E0:
        lw $ra, 0($sp)
        addu $sp, $sp, 20
        jr $ra
P1:
        subu $sp, $sp, 8
        sw $ra, 0($sp)
# begin stmtExpr
        li $t0, 0
        sw $t0, 4($sp)
# end stmtExpr
# begin while statement
L1802:
        lw $t0, 4($sp)
        li $t1, 14
        sle $t2, $t0, $t1
        bnez $t2, L1804
        j L1803
L1804:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 0
        seq $t2, $t0, $t1
        bnez $t2, L1807
        j L1805
L1807:
# begin stmtExpr
        lw $t0, G0
        move $a0, $t0
        jal LPrinti

# end stmtExpr
# begin stmtExpr
        .data
LS15Len: 
        .word 1
        .align 2
LS15: 
        .byte 32 , 0
        .align 2
        .text
        la $a0, LS15
        lw $s8, LS15Len
        jal LPrints

# end stmtExpr
        j L1806
L1805:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 1
        seq $t2, $t0, $t1
        bnez $t2, L1810
        j L1808
L1810:
# begin stmtExpr
        lw $t0, G1
        move $a0, $t0
        jal LPrinti

# end stmtExpr
# begin stmtExpr
        .data
LS16Len: 
        .word 1
        .align 2
LS16: 
        .byte 32 , 0
        .align 2
        .text
        la $a0, LS16
        lw $s8, LS16Len
        jal LPrints

# end stmtExpr
        j L1809
L1808:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 2
        seq $t2, $t0, $t1
        bnez $t2, L1813
        j L1811
L1813:
# begin stmtExpr
        lw $t0, G2
        move $a0, $t0
        jal LPrinti

# end stmtExpr
# begin stmtExpr
        .data
LS17Len: 
        .word 1
        .align 2
LS17: 
        .byte 32 , 0
        .align 2
        .text
        la $a0, LS17
        lw $s8, LS17Len
        jal LPrints

# end stmtExpr
        j L1812
L1811:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 3
        seq $t2, $t0, $t1
        bnez $t2, L1816
        j L1814
L1816:
# begin stmtExpr
        lw $t0, G3
        move $a0, $t0
        jal LPrinti

# end stmtExpr
# begin stmtExpr
        .data
LS18Len: 
        .word 1
        .align 2
LS18: 
        .byte 32 , 0
        .align 2
        .text
        la $a0, LS18
        lw $s8, LS18Len
        jal LPrints

# end stmtExpr
        j L1815
L1814:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 4
        seq $t2, $t0, $t1
        bnez $t2, L1819
        j L1817
L1819:
# begin stmtExpr
        lw $t0, G4
        move $a0, $t0
        jal LPrinti

# end stmtExpr
# begin stmtExpr
        .data
LS19Len: 
        .word 1
        .align 2
LS19: 
        .byte 32 , 0
        .align 2
        .text
        la $a0, LS19
        lw $s8, LS19Len
        jal LPrints

# end stmtExpr
        j L1818
L1817:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 5
        seq $t2, $t0, $t1
        bnez $t2, L1822
        j L1820
L1822:
# begin stmtExpr
        lw $t0, G5
        move $a0, $t0
        jal LPrinti

# end stmtExpr
# begin stmtExpr
        .data
LS20Len: 
        .word 1
        .align 2
LS20: 
        .byte 32 , 0
        .align 2
        .text
        la $a0, LS20
        lw $s8, LS20Len
        jal LPrints

# end stmtExpr
        j L1821
L1820:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 6
        seq $t2, $t0, $t1
        bnez $t2, L1825
        j L1823
L1825:
# begin stmtExpr
        lw $t0, G6
        move $a0, $t0
        jal LPrinti

# end stmtExpr
# begin stmtExpr
        .data
LS21Len: 
        .word 1
        .align 2
LS21: 
        .byte 32 , 0
        .align 2
        .text
        la $a0, LS21
        lw $s8, LS21Len
        jal LPrints

# end stmtExpr
        j L1824
L1823:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 7
        seq $t2, $t0, $t1
        bnez $t2, L1828
        j L1826
L1828:
# begin stmtExpr
        lw $t0, G7
        move $a0, $t0
        jal LPrinti

# end stmtExpr
# begin stmtExpr
        .data
LS22Len: 
        .word 1
        .align 2
LS22: 
        .byte 32 , 0
        .align 2
        .text
        la $a0, LS22
        lw $s8, LS22Len
        jal LPrints

# end stmtExpr
        j L1827
L1826:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 8
        seq $t2, $t0, $t1
        bnez $t2, L1831
        j L1829
L1831:
# begin stmtExpr
        lw $t0, G8
        move $a0, $t0
        jal LPrinti

# end stmtExpr
# begin stmtExpr
        .data
LS23Len: 
        .word 1
        .align 2
LS23: 
        .byte 32 , 0
        .align 2
        .text
        la $a0, LS23
        lw $s8, LS23Len
        jal LPrints

# end stmtExpr
        j L1830
L1829:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 9
        seq $t2, $t0, $t1
        bnez $t2, L1834
        j L1832
L1834:
# begin stmtExpr
        lw $t0, G9
        move $a0, $t0
        jal LPrinti

# end stmtExpr
# begin stmtExpr
        .data
LS24Len: 
        .word 1
        .align 2
LS24: 
        .byte 32 , 0
        .align 2
        .text
        la $a0, LS24
        lw $s8, LS24Len
        jal LPrints

# end stmtExpr
        j L1833
L1832:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 10
        seq $t2, $t0, $t1
        bnez $t2, L1837
        j L1835
L1837:
# begin stmtExpr
        lw $t0, G10
        move $a0, $t0
        jal LPrinti

# end stmtExpr
# begin stmtExpr
        .data
LS25Len: 
        .word 1
        .align 2
LS25: 
        .byte 32 , 0
        .align 2
        .text
        la $a0, LS25
        lw $s8, LS25Len
        jal LPrints

# end stmtExpr
        j L1836
L1835:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 11
        seq $t2, $t0, $t1
        bnez $t2, L1840
        j L1838
L1840:
# begin stmtExpr
        lw $t0, G11
        move $a0, $t0
        jal LPrinti

# end stmtExpr
# begin stmtExpr
        .data
LS26Len: 
        .word 1
        .align 2
LS26: 
        .byte 32 , 0
        .align 2
        .text
        la $a0, LS26
        lw $s8, LS26Len
        jal LPrints

# end stmtExpr
        j L1839
L1838:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 12
        seq $t2, $t0, $t1
        bnez $t2, L1843
        j L1841
L1843:
# begin stmtExpr
        lw $t0, G12
        move $a0, $t0
        jal LPrinti

# end stmtExpr
# begin stmtExpr
        .data
LS27Len: 
        .word 1
        .align 2
LS27: 
        .byte 32 , 0
        .align 2
        .text
        la $a0, LS27
        lw $s8, LS27Len
        jal LPrints

# end stmtExpr
        j L1842
L1841:
# begin ifElse statement
        lw $t0, 4($sp)
        li $t1, 13
        seq $t2, $t0, $t1
        bnez $t2, L1846
        j L1844
L1846:
# begin stmtExpr
        lw $t0, G13
        move $a0, $t0
        jal LPrinti

# end stmtExpr
# begin stmtExpr
        .data
LS28Len: 
        .word 1
        .align 2
LS28: 
        .byte 32 , 0
        .align 2
        .text
        la $a0, LS28
        lw $s8, LS28Len
        jal LPrints

# end stmtExpr
        j L1845
L1844:
# begin if statement
        lw $t0, 4($sp)
        li $t1, 14
        seq $t2, $t0, $t1
        bnez $t2, L1848
        j L1847
L1848:
# begin stmtExpr
        lw $t0, G14
        move $a0, $t0
        jal LPrinti

# end stmtExpr
# begin stmtExpr
        .data
LS29Len: 
        .word 1
        .align 2
LS29: 
        .byte 32 , 0
        .align 2
        .text
        la $a0, LS29
        lw $s8, LS29Len
        jal LPrints

# end stmtExpr
L1847:
# end if statement
L1845:
# end ifElse statement
L1842:
# end ifElse statement
L1839:
# end ifElse statement
L1836:
# end ifElse statement
L1833:
# end ifElse statement
L1830:
# end ifElse statement
L1827:
# end ifElse statement
L1824:
# end ifElse statement
L1821:
# end ifElse statement
L1818:
# end ifElse statement
L1815:
# end ifElse statement
L1812:
# end ifElse statement
L1809:
# end ifElse statement
L1806:
# end ifElse statement
# begin stmtExpr
        lw $t0, 4($sp)
        li $t1, 1
        addu $t2, $t0, $t1
        sw $t2, 4($sp)
# end stmtExpr
        j L1802
L1803:
# end while statement
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
E1:
        lw $ra, 0($sp)
        addu $sp, $sp, 8
        jr $ra
P2:
        subu $sp, $sp, 8
        sw $ra, 0($sp)
        sw $a0, 4($sp)
# begin stmtExpr
        lw $t0, 4($sp)
        sw $t0, G16
# end stmtExpr
E2:
        lw $ra, 0($sp)
        addu $sp, $sp, 8
        jr $ra
P3:
        subu $sp, $sp, 4
        sw $ra, 0($sp)
# begin stmtExpr
        li $t0, 17
        lw $t1, G16
        mul $t2, $t0, $t1
        li $t0, 13
        addu $t1, $t2, $t0
        li $t0, 32768
        bnez $t0, L1849
        .data
LS31Len: 
        .word 31
        .align 2
LS31: 
        .byte 114 , 117 , 110 , 116 , 105 , 109 , 101 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 109 , 111 , 100 , 117 , 108 , 111 , 32 , 98 , 121 , 32 , 122 , 101 , 114 , 111 , 10 , 0 # runtime error: modulo by zero
        .align 2
        .text
        la $a0, LS31
        lw $s8, LS31Len
        j error
L1849:
        rem $t2, $t1, $t0
        sw $t2, G16
# end stmtExpr
# begin return statement
        lw $t0, G16
        move $v0, $t0
        j E3
# end return statement
        .data
LS32Len: 
        .word 62
        .align 2
LS32: 
        .byte 114 , 117 , 110 , 116 , 105 , 109 , 101 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 102 , 117 , 110 , 99 , 116 , 105 , 111 , 110 , 32 , 34 , 73 , 78 , 84 , 69 , 82 , 78 , 65 , 76 , 114 , 97 , 110 , 100 , 111 , 109 , 34 , 32 , 109 , 117 , 115 , 116 , 32 , 114 , 101 , 116 , 117 , 114 , 110 , 32 , 97 , 32 , 118 , 97 , 108 , 117 , 101 , 10 , 0
        .align 2
        .text
        la $a0, LS32
        lw $s8, LS32Len
        j error
E3:
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

