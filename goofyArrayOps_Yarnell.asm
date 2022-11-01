.data
i: .word 5
j: .word 2
A: .word 1,2,3,4,5,6,7,8,9,10
B: .word 1,2,3,4,5,6,7,8,9,10

.text
lw $s0, i
lw $s1, j
la $s2, A
la $s3, B

sub $t0, $s0, $s1 # t0 = i - j
sll $t0, $t0, 2  #t0 = t0*4
add $t0, $s2, $t0 #t0 = &A[i-j]
lw $t0, 0($t0) #t0 = A[i-j]

	
add $t1, $s0, $s1 # t1 = i + j
sll $t1, $t1, 2 #t1 = t1*4
add $t1, $s2, $t1 # t1 = &A[i+j]
lw $t1, 0($t1) #t1 = A[i+j]

add $t3, $t0, $t1

sw $t3, 12($s3)  # B[3] = t3


