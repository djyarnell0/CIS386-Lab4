.data 
array:  .word 1,2,4,8,16,32,64,128,256,512,0
counter: .wor 0
.text
la $t0, array  		# Load the array
li $s1, 0         # Create the loop counter
la $t4, counter

loop:

    add $s0, $t0, $s1    # Load the address for the element at the current index
    lb $a0, 0($s0)       # Load the value of the array at the current index into $a0
                         # (For printing)

    beqz $a0, loop   
    add $t4, $t4, 1             

    syscall              # Print the character in $a0

    addi $s1, $s1, 1     # Increment the counter

    j loop               # Jump to the beginning of the loop    

