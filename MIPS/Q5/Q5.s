		# reverse a string 
		# Rashmi.R & Tejeshwara.B.M
		# Date : 04-08-2016


		.data
		nl:	.asciiz		"\n"
		s:	.asciiz		"nitk beach"
		r:	.space		100

		.text
		.globl main
	main:
		# set arguments to reverse(s,r)
		la		$a0,s
		la		$a1,r
		jal		reverse
		# print string s (not reversed)
		la		$a0,s
		li		$v0,4
		syscall
		# separate by a new line
		la		$a0,nl
		li		$v0,4
		syscall
		# print string r (reversed)
		la		$a0,r
		li		$v0,4
		syscall
		# terminate program
		li		$v0,10
		syscall

		#
		# reverse - reverse string in $a0, writing into $a1
		#    registers used: $t7,$v0,$t0,$t1,$t2
		#	 
reverse:
		move	$t7,$ra		# save return address
		jal		len			# get length of source string
		blt		$v0,$0,rev_exit	# exit if empty string
		add		$t0,$a1,$v0	# null terminate target string
		sb		$0,0($t0)	# put null into end of string
		addi	$v0,$v0,-1	# decrement length (written /0)
		add		$t0,$a0,$v0	# $t0 holds p (source string)
		add		$t1,$a1,$0	# $t1 holds t (target string)
rev_loop:	
		lbu		$t2,0($t0)	# get char from source string
		sb		$t2,0($t1)	# save char to target string
		addi	$t0,$t0,-1	# decrement source string ptr
		addi	$t1,$t1,1	# increment target string ptr
		addi	$v0,$v0,-1	# decrement length
		slt		$t2,$v0,$0	# is l < 0?
		beq		$t2,$0,rev_loop
rev_exit:
		move	$ra,$t7
		jr		$ra

		#
		# len - counts length of string pointed to by $a0
		#	registers used: $t0,$t1,$v0
		#   returns length in $v0
		#
len:
		move	$t0,$a0
len_loop:
		lbu		$t1,0($t0)
		beq		$t1,$0,len_exit
		addi	$t0,$t0,1
		j		len_loop
len_exit:
		sub		$v0,$t0,$a0
		jr		$ra