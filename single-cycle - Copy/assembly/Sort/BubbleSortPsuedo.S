Main:	
	addi s1, zero, 0x0
	add s2, s1, zero
	
WhileI:	
	slti t0, s2, 40
	beq t0, zero, EndWhileI
	add s3, s1, zero
WhileJ:
	slti t0, s3, 36
	beq t0, zero, EndWhileJ
	lw s4, 0(s3) //A[j]
	lw s5, 4(s3) //A[j + 1]
if:
	bge s4, s5, Endif
	sw s4, 4(s3)
	sw s5, 0(s3)
Endif:
	addi s3, s3, 4
	j WhileJ
EndWhileJ:
	addi s2, s2, 4
	j Whilei
EndWhileI:
EndMain:
	j EndMain


