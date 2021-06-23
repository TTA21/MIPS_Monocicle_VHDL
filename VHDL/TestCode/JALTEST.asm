# Disciplina: Arquitetura e Organização de Processadores

.text

	j MAIN
	
PROC:
	nop
	jr $ra

MAIN:
	addi $s0 , $zero , 4	# cout<<
	
	
	jal PROC		# retorno esperado em $v0 e restauração de $s0 e $a0
	
	addi $s0 , $zero , 5
	nop
	
	
	
	
	
	
