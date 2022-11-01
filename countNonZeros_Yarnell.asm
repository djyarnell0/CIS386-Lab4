.data 
array:  .word 1,2,4,8,16,32,64,128,256,512,0



.text


#do the work

#load array[i]

#compare array[i] to 0 (branch bne / beq)

loop:

addi $s0, $s0, 1 #i++

exit: 
 li $v0, 1
 move $a0, $s0
 syscall
#print the result