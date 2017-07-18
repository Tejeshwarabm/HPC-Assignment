# sum of two numbers
# Rashmi.R & Tejeshwara.B.M
# Date: 30-July


	.data
msg: .asciiz "enter two digits 10 numbers."
msg1: .asciiz "\n Enter the Number : "
msg2: .asciiz "\n Sum of the numbers : "


	.text
	.globl main
main:
	
	li $v0, 4
	la $a0, msg
	syscall
	
	li $t0, 10				# n=10
	li $t1, 1				# i=1
	move $t2, $zero
	
while:
	bgt $t1,$t0, exit
	
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0,5
	syscall
	
	move $t3, $v0
	
	add $t2, $t2,$t3
	
	addi $t1, $t1, 1		# i++ or i= i+1
	
	j while
	
exit:
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0,1
	move $a0, $t2
	syscall
	
	li $v0, 10
	syscall
	jr $ra