        .data
#SfalseLength:
        #.word 5
        #.align 2
Sfalse: 
        .byte   102 , 97 , 108 , 115 , 101
        .align 2

        .text
        .globl main
main:


Lprintb:
        beq     $a0, 1, LprintbTrue     # Check if we want to print 'true' instead of 'false'

        add     $t0, $zero, $zero       # init counter
        la      $t1, Sfalse             # load address of 'false'
        #la      $t2, SfalseLength       # load address of 'false' length
        #lw      $t2, 
LprintbFalseLoop:
        slti	$t2, $t0, 5			        # i<5
        beq		$t2, $zero, LprintbExit	    # if $t2 == $zero then LprintbExit
        
        lb      $a0, ($t2)          # $a0 = Sfalse[i]
        li      $v0, 11             # print char $a0 to output
        syscall                     # print byte of 'false'

        addi    $t2, $t2, 1         # increase the address that is referencing Sfalse by 1
        j LprintbFalseLoop

LprintbTrue:

LprintbTrueLoop:


LprintbExit:
    li $v0, 10
    syscall