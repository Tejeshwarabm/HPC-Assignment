#factorial by looping 
# Rashmi.R & Tejeshwara.B.M
# start : 28-July end: 30-July


	.text
	.globl main
main:
	li $v0,5
	syscall
	move $t1,$v0
	move $t2, $v0
	
	li $t3, 1
	beq $t1,0 res
	beq $t1,1 res
	
loop:
	add $t2,$t2, -1
	mul $t1,$t1,$t2
	bne $t3,$t2 loop
	j res1
	
res: 
	li $v0,1
	move $a0,$t3
	syscall
	j exit
	
res1: 
	li $v0,1
	move $a0,$t1
	syscall
	
exit:
	li $v0,10
	syscall
	jr $ra