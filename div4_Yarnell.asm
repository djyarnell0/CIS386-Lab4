.data
array: .word 1, 2, 4, 8, 9, 11, 12, 16, 21, 24
msg: .asciiz "Counter  "
fourMod: .word 4

.text

lb $s1, fourMod

.globl main

main:

addi $s0, $0, 0 # clear i
addi $t1, $0, 0 # clear sum
ori $t2, $0, 10 # Initializing t2 to its constant value 10
la $t3, array # load address of array into t3

loop:
slt $t4, $s0, $t2 # compare, $t4 = i < sum ? 1 : 0
beq $t4, $0, end # if i is not < 10, exit the loop
lw $t4, 0($t3) # load current array element into t4

andi $t4, $t4, 3
beq $t4, $zero, mod

add $s0, $s0, 1 # increment i
add $t3, $t3, 4 # increment current array element pointer
j loop

mod: 
#add to the divisible by 4 counter
add $s2, $s2, 1
add $s0, $s0, 1 # increment i
add $t3, $t3, 4 # increment current array element pointer
j loop


end:

addi $v0, $0, 4 # Now we print out result: string
la $a0, msg
syscall

addi $v0, $0, 1 # followed by the actual sum (which is in t1)
add $a0, $s2, $0
la $t5, end    
syscall