#converter
#Tejeshwara.B.M & Rashmi.R
#Date: 03-08-2016

	.data
msg: 		.asciiz "Enter Number:"
negative: 	.asciiz "You have enter Negative Number."
zeq: 		.asciiz "Zero"
onq: 		.asciiz "One"
twq: 		.asciiz "Two"
thq: 		.asciiz "Three"
foq: 		.asciiz "Four"
fiq: 		.asciiz "Five"
siq: 		.asciiz "Six"
se_q: 		.asciiz "Seven"
eiq: 		.asciiz "Eight"
niq: 		.asciiz "Nine"
input: 		.space 100

	.text
	.globl main
main:
	
	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 5
	syscall
	
	sw $v0, input
	
	lw $t0, input
	
	bltz $t0, exit
	
	addi $sp, $sp, 40
	addi $t5, 10
	
loop:	
	div $t1, $t0, $t5
	mfhi $t2
	mflo $t3
	
	add $t0, $zero, $t3
	
	 	
	addi $sp,$sp,-4 
	sw	$t2,($sp)
	
	
	beqz $t3, print_n
	
	j loop

exit:
	li $v0, 4
	la $a0, negative
	syscall
done:
	li $v0, 10
	syscall
	
#---------------------------------------------
#---------------------------------------------

print_n:
	lw $s0, ($sp)
	addi $sp, $sp, 4
	li $t4, 0
	
	# li $v0,1
	# move $a0, $s0
	# syscall
	
	beq $s0, $t4, Zero
		addi $t4, $t4, 1
	beq $s0, $t4, One
		addi $t4, $t4, 1
	beq $s0, $t4, Two
		addi $t4, $t4, 1
	beq $s0, $t4, Thr
		addi $t4, $t4, 1
	beq $s0, $t4, fore
		addi $t4, $t4, 1
	beq $s0, $t4, fiv
		addi $t4, $t4, 1
	beq $s0, $t4, six
		addi $t4, $t4, 1
	beq $s0, $t4, seve
		addi $t4, $t4, 1
	beq $s0, $t4, eigh
		addi $t4, $t4, 1
	beq $s0, $t4, nin
	j done
	
Zero:
	li $v0, 4
	la $a0, zeq
	syscall
	j print_n

One:
	li $v0, 4
	la $a0, onq
	syscall
	j print_n
	
Two:
	li $v0, 4
	la $a0, twq
	syscall
	j print_n
	
Thr:
	li $v0, 4
	la $a0, thq
	syscall
	j print_n
	
fore:
	li $v0, 4
	la $a0, foq
	syscall
	j print_n
	
fiv:
	li $v0, 4
	la $a0, fiq
	syscall
	j print_n
	
six:
	li $v0, 4
	la $a0, siq
	syscall
	j print_n
	
seve:
	li $v0, 4
	la $a0, se_q
	syscall
	j print_n
	
eigh:
	li $v0, 4
	la $a0, eiq
	syscall
	j print_n
	
nin:
	li $v0, 4
	la $a0, niq
	syscall
	j print_n
	
	