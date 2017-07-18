# test prime(n) - Return 1 if n is prime, else 0.
# main - Iterates over integers, testing if each is prime. # Print the first 100 numbers that are prime.

# Tejeshwara.B.M & Rashmi.R
# Date: 03-08-2016

	.data
msg: .asciiz "Enter a number:"
prime: .asciiz "\nThis number is Prime number\n"
Nprime: .asciiz "\n Not a prime number."
space: .asciiz "\n"
input: 	.word 0
msg1: .asciiz "List of First 100 Prime nos are\n"
msg2: .asciiz "*************************************\n"

	.text
	.globl main
main:
	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 5
	syscall
	
	sw $v0, input
	
	lw $t0, input	# n - to be find 
	
	li $t5,0 		# flag = 0
L1:
	# beq $t0, 100, exit
	li $t3, 2		# i = 2

L2:
	li $t6,2
	div $t0, $t6
	mflo $t7
	
	bgt $t3, $t7, set
	div $t0, $t3
	mfhi $t4		# n1%i == $t2 
	
	addi $t3, $t3, 1
	beqz $t4, flag
	j L2
	# bne $t4, $zero, L2	
	
flag:
	# li $t5, 1
	li $v0, 4
	la $a0, Nprime
	syscall
	j exit
	

set:
	bne $t5, $zero, flag
	li $v0, 4
	la $a0, prime
	syscall
	
exit:	
	jal list_prime


	li $v0, 10
	syscall
		
#----------------------------------------
#----------------------------------------
	.globl list_prime
list_prime:
	li $v0, 4
	la $a0, space
	syscall
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $t0, 2		# n1 = 2
		
Loop1:
	beq $t0, 542, done
	li $t3, 2		# i = 2
	li $t5,0 		# flag = 0
Loop2:
	li $t6,2
	div $t0, $t6
	mflo $t7
	
	bgt $t3, $t7, set1
	div $t0, $t3
	mfhi $t4		# n1%i == $t4 
	
	addi $t3, $t3, 1
	beqz $t4, flag1
	j Loop2
	# bne $t4, $zero, L2	
	
flag1:
	li $t5, 1
	j Loop2

set1:
	bne $t5, $zero, L3
	li $v0, 1
	move $a0, $t0	# print n 
	syscall	
	# addi $t2, $t2, 1
	li $v0, 4
	la $a0, space
	syscall
	
	
L3:
	addi $t0, $t0, 1	#n1++ 
	j Loop1

done:
	jr $ra