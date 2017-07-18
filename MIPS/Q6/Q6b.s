#Factorial by recursion
#Rashmi.R & Tejeshwara.B.M
#Completed on :July 30

		.data
msgIn: 	.asciiz "enter d no: "
result: .asciiz "Factorial for the no is : "
input: 	.word 0
output: .word 0

	.text
	.globl main
main:
	# read no from user...
	li $v0, 4
	la $a0, msgIn
	syscall
	
	li $v0, 5
	syscall

	sw $v0, input
	
	#call factorial fn
	lw $a0, input
	jal factofn
	sw $v0, output
	
	#display d output
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 1
	lw $a0, output
	syscall
	
	li $v0, 10
	syscall
	
#----------------------------------------------
	.globl factofn
factofn:
	addi $sp, $sp, -8
	sw	 $ra, ($sp)
	sw	 $s0, 4($sp)
	
	#Base case
	li $v0, 1
	beq $a0, 0, Done
	
	
	# fact(n-1)
	move $s0, $a0
	sub $a0, $a0, 1
	jal factofn
	
	#end of recursion 
	mul $v0, $s0, $v0
	
Done:
	lw $ra, ($sp)
	lw $s0, 4($sp)
	addu $sp, $sp, 8
	jr $ra
	