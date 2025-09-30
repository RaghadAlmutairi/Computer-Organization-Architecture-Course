.data
 message1: .asciiz "names \n\n"
 EnterMessage: .asciiz "Enter three digit of octal number\t"
 above7message: .asciiz "One of the digits was above 7\nPlease enter a valid octal number\t"
 invalidMessage: .asciiz "invalid octal number please try again\t"
 result: .asciiz "The result:\t"
 
 
 .text
 main:
 
 la $a0, message1			# print message
 li $v0, 4
 syscall
 					# print message
 la $a0, EnterMessage
 li $v0, 4
 syscall
 
 jal input 				# calling input function to take integer value from user
 
 
 while1:
	li $t1,0			# Load immediately $t1=0
 	li $t2,777      		# Load immediately $t2=777
 	sgt $t3,$t0,$t1 		# is input grater than 0? , %t3 = boolean excprtion (true or false) (1,0)
 	slt $t4,$t0,$t2 		# is input less than 777? , %t4 = boolean excprtion (true or false) (1,0)
 	and $t5,$t4,$t3 		# condition 1 AND condition 2 (to make it OR)
 	beq $t5,1,exit 			# branch to exit if true
 	
 	la $a0, invalidMessage		# print message
 	li $v0, 4
	syscall
 	jal input			# calling input function to take integer value from user
 	move $t0, $v0
 	
 	j while1			# jump to the loop function untel the condition in branch statement is true
 	exit:				# end of loop

 	move $t7, $t0
 while2:
 	li $t6,10 			# Load immediately $t6 = 10
 	li $t3,0			# Load immediately $t3 = 0
	rem $t3,$t7,$t6  		# $t7 = input % $t6 (save the remainder in $t7)
	li $t8,8 			# Load immediately $t8 = 8
	slt $t2,$t3,$t8			# is $t2 less than 8? , $t2 = boolean excprtion (true or false) (1,0)
	beq $t2,1,else			# branch to else if true
	if:				
	la $a0, above7message		# print message
 	li $v0, 4
	syscall
        jal input			# calling input function to take integer value from user
        move $t7, $v0			
        j while2
	else:
	div $t7,$t7,$t6 					
	beq $t7,0,exit2			# branch to exit if true
	
 	j while2			# jump to the loop function untel the condition in branch statement is true
 
 exit2:					# end of loop
 	
 					
 li $a1,0	 			# Load immediately $a1 = 0 (the power)
 li $a0,8 				# Load immediately $a0 = 8 (the base)
 		
 jal power   				# calling pow function
 move $t2, $v0				# return the value from the power function and move it to $t2
 	
 					
 rem $t3,$t0,10				# $t3 = input % $t6 (save the remainder in $t3)
 mul $t4,$t3,$t2			# $t4 = $t3 * $t2 (save the multiplication in $t4)
 add $t1,$t1,$t4			# $t1 = $t1 + $t4 (save the addition in $t1)
 div $t0,$t0,10				# $t0 = $t0 / 10 (save the division in $t0)
 		
 li $a0,8 				# Load immediately $a0 = 8 (the base)
 li $a1,1				# Load immediately $a1 = 1 (the power)
 jal power   				# calling pow function
 move $t5, $v0				# return the value from the power function and move it to $t5
 
 rem $t3,$t0,10				# $t3 = input % $t6 (save the remainder in $t3)
 mul $t4,$t3,$t5			# $t4 = $t3 * $t2 (save the multiplication in $t4)
 add $t1,$t1,$t4			# $t1 = $t1 + $t4 (save the addition in $t1)
 div $t0,$t0,10				# $t0 = $t0 / 10 (save the division in $t0)
 	
 li $a0,8 				# Load immediately $a0 = 8 (the base)
 li $a1,2				# Load immediately $a1 = 2 (the power)
 jal power   				# calling pow function
 move $t7, $v0				# return the value from the power function and move it to $t7
 	
 rem $t3,$t0,10				# $t3 = input % $t6 (save the remainder in $t3)
 mul $t4,$t3,$t7			# $t4 = $t3 * $t2 (save the multiplication in $t4)
 add $t1,$t1,$t4			# $t1 = $t1 + $t4 (save the addition in $t1)
 div $t0,$t0,10				# $t0 = $t0 / 10 (save the division in $t0)
 			 
  

 la $a0, result				# print message
 li $v0, 4
 syscall
 
 move $a0, $t1
 					
 li $v0, 1				# print the value
 syscall
 
 					
 li $v0,10				# end of main
 syscall
 
 input:
					# take input from the user
 	li $v0, 5
 	syscall
 					# move to a temp regester
 	move $t0, $v0
	 jr $ra 			# return value
 	
 power:
 	bne $a1, $zero, recursion      # if the power is greater then 1,then do some recursion
 	li  $v0,1                      # otherwise, return 1.
 	jr  $ra			        # Return to the calling function
 recursion:
	addi $sp, $sp, -4              # Allocate space for one integer on the stack 
	sw   $ra,0($sp)                # Store the return address on the stack
	addi $a1,$a1,-1                # Decrement the power by 1.
	jal  power                     # Call the power function with the new parameters
	mul  $v0, $a0, $v0             # Multiply the result by the base and save it as the new result
	lw   $ra, 0($sp)               # Restore the return address from the stack
	addi $sp,$sp,4                 # Deallocate the memory on the stack
	jr   $ra                       # Return to the calling function
	
