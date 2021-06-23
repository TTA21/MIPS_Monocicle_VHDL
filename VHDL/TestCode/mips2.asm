.text   
main: 
	addi $s0, $zero, 0
	addi $s1, $zero, 1
	addi $s2, $zero, 2
	addi $s3, $zero, 3
	addi $s4, $zero, 4
	beq $s3, $s4, L1     # if i==j goto L1
	add $s0, $s1, $s2    # f = g + h = 1 + 2 = 3
L1:	sub $s0, $s0, $s3    # f = f - i = 3 - 3 = 0
