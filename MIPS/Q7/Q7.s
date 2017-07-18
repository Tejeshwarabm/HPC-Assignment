# 3x3 Matrix multiplication 
# Rashmi.R & Tejeshwara.B.M 
# Date : 05-08-2016


.data 
matrix_c: .asciiz "\nResultant Matrix:\n"
A: .word 1, 1, 1, 2, 2, 2, 3, 3, 3
B: .word 1, 1, 1, 2, 1, 1, 3, 1, 1
C: .space 36
space: .asciiz " "
newline: .asciiz "\n"

.text 
.globl main
main:
la $a0,A
la $a1,B
la $a2,C

jal matrixmultiplication       # Find resultant matrix
la $a1,C

li $v0,4
la $a0, matrix_c
syscall

jal printmatrix                # Print the resultant matrix

li $v0,10                      # Tell the OS that this is the end of the program
syscall 

#############################
#For 3x3 matrix multiplication the below method has been used in MIPS coding
   # for (i = 0; i <= 2; i++) {
      # for (j = 0; j <= 2; j++) {
         # sum = 0;
         # for (k = 0; k <= 2; k++) {
            # sum = sum + a[i][k] * b[k][j];
         # }
         # c[i][j] = sum;
      # }
   # }
 ###############################################  
 
matrixmultiplication:                             
	li $t0,0		# i=0
	loopo:
		bgt $t0,2,endo
		li $t1,0		# j=0
		loopm:
			bgt $t1,2,endm
			li $t4,0	# k=0
			li $t3,0
			loopi:
				bgt $t3,2,endi
				mul $t5,$t0,3
				add $t5,$t5,$t3
				mul $t5,$t5,4
				add $t5,$t5,$a0
				lw $v0,($t5) 
				mul $t5,$t3,3
				add $t5,$t5,$t1
				mul $t5,$t5,4
				add $t5,$t5,$a1
				lw $v1,($t5)
				mul $v0,$v1,$v0
				add $t4,$v0,$t4
				addi $t3,$t3,1
			j loopi
			endi:
				mul $t5,$t0,3
				add $t5,$t5,$t1
				mul $t5,$t5,4
				add $t5,$t5,$a2
				sw $t4,($t5)
				addi $t1,$t1,1
			j loopm
		endm:
			addi $t0,$t0,1
		j loopo
	endo:
	jr $ra



printmatrix:
li $t0,0
while1:
	bgt $t0,2,exit1
	li $t1,0
	while2:
		bgt $t1,2,exit2
		mul $t2,$t0,3
		add $t2,$t2,$t1
		mul $t2,$t2,4
		add $t2,$t2,$a1
		
		li $v0,4
		la $a0,space
		syscall 
		
		li $v0,1
		lw $a0,($t2)
		syscall 
		
		addi $t1,$t1,1
		j while2

	exit2:
		li $v0,4
		la $a0,newline
		syscall 
		addi $t0,$t0,1
		j while1
exit1:
	jr $ra



