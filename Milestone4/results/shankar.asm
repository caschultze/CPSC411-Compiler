    .data
char: .space 2

.text
main:

li $v0, 8
la $a0, char
li $a1, 2
syscall

    move $t0, $0
    la $t1, char
loop:
    bge $t0, 2, breakpoint
    li $v0, 1
    lb $a0, ($t1)
    syscall
    addi $t1, $t1, 1
    addi $t0, $t0, 1
    j loop

breakpoint:
    li $v0, 10
    syscall

# li $v0, 4
# syscall

# li $v0, 10
# syscall