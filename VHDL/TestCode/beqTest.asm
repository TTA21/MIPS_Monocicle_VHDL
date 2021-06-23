####################################################################
# Exercício 06 - 
# Mostra a compilação de um laço For
####################################################################
# Trecho em C:
#
# for (i==0; i<10; i++)
#     j++;
#
      .text   # segmento de código (programa)
main:    
       addi $s0, $zero, 0     # i=0
Loop:  slti $t0, $s0, 10      # se i<10 então $t0=1 senão $t0=0 , // Set *if* less than *else set* immediate
       beq  $t0, $zero, Exit  # se $t0=0 então goto Exit
       addi $s1, $s1, 1       # j++
       addi $s0, $s0, 1       # i++ (do laço for)
       j    Loop              # goto Loop
Exit:  nop