#sum of numbers
# Tejeshwara.B.M & Rashmi.R
# Date : 30-July

	.data
msg: .asciiz "Enter only +ve numbers...\n"
out: .asciiz "Sum of the positive numbers : "

	.text
	.globl main
main:
		move $t1, $zero

		li $v0, 4
		la $a0, msg
		syscall
		
	while:
		li $v0, 5
		syscall
		
		move $t0, $v0

		bltz $t0, exit
		add $t1,$t1,$t0
		j while
		
	exit:
		li $v0, 4
		la $a0, out
		syscall
		
		li $v0, 1
		move $a0, $t1
		syscall
		
		li $v0, 10
		syscall
		jr $ra