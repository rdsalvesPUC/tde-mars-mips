.data
ano1: .asciiz "Primeira data de Nascimento: "
ano2: .asciiz "Segunda data de Nascimento: "
ano3: .asciiz "Terceira data de Nascimento: "
resultado: .asciiz "Resultado da soma das datas é de "

.text
main:
li $v0, 4
la $a0, ano1
syscall

li $v0, 5
syscall

move $s0, $v0
#---------------------
li $v0, 4
la $a0, ano2
syscall

li $v0, 5
syscall

move $s1, $v0
#--------------------
li $v0, 4
la $a0, ano3
syscall

li $v0, 5
syscall

move $s2, $v0
#--------------------
add $s3, $s1, $s0   # $s3 = $s1 + $s0
add $s3, $s3, $s2   # $s3 = $s3 + $s2 (somando o terceiro termo)
li $v0, 4
la $a0, resultado
syscall

li $v0, 1
move $a0, $s3
syscall