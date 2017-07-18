# Q2
# Tejeshwara.B.M & Rashmi R
# Print \Hello World" on the output screen.
# Date: 28-July

		
        .text
        .globl main
main:  
		li $v0, 4      
        la $a0, msg     
        syscall         
        
        
        jr $ra  
		
        .data
msg:   .asciiz "Hello World"