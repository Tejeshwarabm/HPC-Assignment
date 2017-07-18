#Load two 32b constants into two registers. Add them and store the sum in a third register.
#Rashmi R & Tejeshwara.B.M
#Date: 30.07.2016


.data
a1:	.word	0x10220020
a2:	.word	0x10330030
.text
.globl main 
main:
la $t1,a1
lw $t3,0($t1)
la $t2,a2
lw $t4,0($t2)
add $t0,$t4,$t3
li $v0,10
syscall
