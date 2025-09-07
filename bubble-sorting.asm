.globl main
      .data 
array: .word 4,3,9,5,2,1
size:  .word 6            # tamanho do array
space:   .asciiz " "             # espaço entre prints
newline: .asciiz "\n"            # nova linha
      .text
main:  
       la   $t0, array       # endereço base do array
    lw   $t5, size        # tamanho do array
    li   $t8, 0 
    
loop_externo:
    bge $t8, $t5, exit
    li $t9, 0

loop_interno:
    sub  $t7, $t5, $t8
    addi $t7, $t7, -1
    bge $t9, $t7, terminar_loop
    
    li $t1, 4 
    mult $t9, $t1
    mflo $t2
    add $t2, $t0, $t2
    addi $t3, $t2, 4

    jal ajustar_array
    
    addi $t9, $t9, 1
    j loop_interno
    
     
terminar_loop:
    addi $t8, $t8, 1
    j loop_externo

ajustar_array:
    lw $t4, 0($t2)
    lw $t6, 0($t3)
    
    ble $t4, $t6, voltar
    
    sw $t6, 0($t2)
    sw $t4, 0($t3)
    

voltar:
    jr $ra

exit:
    la $t0, array
        li $t1, 0

printar_array:
    bge $t1, $t5, sair
    sll $t2, $t1, 2
    add $t2, $t0, $t2
    lw  $a0, 0($t2)
    li  $v0, 1
    syscall

    la $a0, space
    li $v0, 4
    syscall

    addi $t1, $t1, 1
    j printar_array

sair:
    la $a0, newline
    li $v0, 4
    syscall

    li $v0, 10
    syscall