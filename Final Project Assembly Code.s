#CS350 Final Project Calculator

#text variables
	.data
intro:	.asciiz "Welcome to the simple calculator \n"
opQ:	.asciiz "Do you want to solve a(n):\n(1)addition problem\n(2)subraction problem\n(3)integer multiplication problem\n(4)integer division problem\n(5)modulo problem\n(6)square problem\n(7)factorial problem\n(8)sum(n,m) problem\n(9)powers problem\n"
varA:	.asciiz "What is the first integer in your "
additionText:	.asciiz "addition problem?\n"
subtractionText:	.asciiz "subtraction problem?\n"
multiplicationText:	.asciiz "multiplication problem?\n"
divisionText:	.asciiz "division problem?\n"
moduloText:	.asciiz "modulo problem?\n"
squareText:	.asciiz "What integer would you like to square?\n"
factorialText:		.asciiz "What integer do you want solved for your factorial problem?\nFactorials are solved using non-negative numbers\n***Please use non-negative numbers***\n"
sumText:	.asciiz "sum problem?\n"
sumWarningText:	.asciiz "***Please make sure your first variable is smaller than your second variable***\n***Please use non-negative numbers***\n"
powersText:	.asciiz "powers problem? [x^n, n>=0]\n"
powersWarningText: 	.asciiz "***This fucntion deals with non-negative numbers***\n"
varB:	.asciiz "What is the second integer in your "
res:	.asciiz "The answer is: "
decimal:	.asciiz "."
spacer:	.asciiz "\n"
contQ:	.asciiz "\nDo you want to solve another problem? Yes(1) or No(2)?\n"
gB:	.asciiz "Goodbye!"
zero:	.asciiz "0"
one:	.asciiz "1"
	.text
	.globl main

main:
	#greeting
	li $v0, 4
	la $a0, intro
	syscall

#keep asking/solving the operation question till the user breaks
loop:
	#operation question
	li $v0, 4
	la $a0, opQ
	syscall

	#read operation type input
	li $v0, 5
	syscall
	move $s0, $v0 

	#operation types
	#checks if the user wanted an addition problem
	bne $s0, 1, onto2
	j aditionFunction

#checks if the user wanted a subtraction problem
onto2:	
	bne $s0, 2, onto3
	j subtractionFunction

#checks if the user wanted a multiplication function
onto3:	
	bne $s0, 3, onto4
	j multiplicationFunction

#checks if the user wanted a division problem
onto4:	
	bne $s0, 4, onto5
	j divisionFunction

#checks if the user wanted a modulus problem
onto5:	
	bne $s0, 5, onto6
	j moduloFunction

#checks if the user wanted an x^2 problem
onto6:	
	bne $s0, 6, onto7
	j squareFunction

#checks if the user wanted a factorial problem
onto7:	
	bne $s0, 7, onto8
	j factorialFunctionStart

#checks if the user wanted a sum(n,m) function
onto8:	
	bne $s0, 8, onto9
	j sumFunction

#checks if the user wanted a x^n, n>=0 problem
#My "special function"
onto9:	
	bne $s0, 9, loop
	j powersFunction

aditionFunction:
	#var1Q
	li $v0, 4
	la $a0, varA
	syscall
	li $v0, 4
	la $a0, additionText
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	#var2Q
	li $v0, 4
	la $a0, varB
	syscall
	li $v0, 4
	la $a0, additionText
	syscall
	li $v0, 5
	syscall
	move $t2, $v0

	#operation
	add $t3, $t1, $t2
	
	#print
	li $v0, 4
	la $a0, res
	syscall
	li $v0, 1
	move $a0, $t3
	syscall
	li $v0, 4
	la $a0, spacer
	syscall
	j again
	

subtractionFunction:
	#var1Q
	li $v0, 4
	la $a0, varA
	syscall
	li $v0, 4
	la $a0, subtractionText
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	#var2Q
	li $v0, 4
	la $a0, varB
	syscall
	li $v0, 4
	la $a0, subtractionText
	syscall
	li $v0, 5
	syscall
	move $t2, $v0

	#operation
	sub $t3, $t1, $t2
	
	#print
	li $v0, 4
	la $a0, res
	syscall
	li $v0, 1
	move $a0, $t3
	syscall
	li $v0, 4
	la $a0, spacer
	syscall
	j again

multiplicationFunction:
	#var1Q
	li $v0, 4
	la $a0, varA
	syscall
	li $v0, 4
	la $a0, multiplicationText
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	#var2Q
	li $v0, 4
	la $a0, varB
	syscall
	li $v0, 4
	la $a0, multiplicationText
	syscall
	li $v0, 5
	syscall
	move $t2, $v0

	#operation
	mul $t3, $t1, $t2
	
	#print
	li $v0, 4
	la $a0, res
	syscall
	li $v0, 1
	move $a0, $t3
	syscall
	li $v0, 4
	la $a0, spacer
	syscall
	j again

divisionFunction:
	#var1Q
	li $v0, 4
	la $a0, varA
	syscall
	li $v0, 4
	la $a0, divisionText
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	#var2Q
	li $v0, 4
	la $a0, varB
	syscall
	li $v0, 4
	la $a0, divisionText
	syscall
	li $v0, 5
	syscall
	move $t2, $v0

	#operation
	div $t1, $t2
	mflo $t3

	#print
	li $v0, 4
	la $a0, res
	syscall
	li $v0, 1
	move $a0, $t3
	syscall
	li $v0, 4
	la $a0, spacer
	syscall
	j again

moduloFunction:
	#var1Q
	li $v0, 4
	la $a0, varA
	syscall
	li $v0, 4
	la $a0, moduloText
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	#var2Q
	li $v0, 4
	la $a0, varB
	syscall
	li $v0, 4
	la $a0, moduloText
	syscall
	li $v0, 5
	syscall
	move $t2, $v0

	#exception handeling
	bltz $t1, moduloFunction
	bltz $t2, moduloFunction

	#operation
	rem $t3, $t1, $t2
	
	#print
	li $v0, 4
	la $a0, res
	syscall
	li $v0, 1
	move $a0, $t3
	syscall
	li $v0, 4
	la $a0, spacer
	syscall
	j again

squareFunction:
	#var1Q
	li $v0, 4
	la $a0, squareText
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	
	#operation
	mul $t2, $t1, $t1
	
	#print
	li $v0, 4
	la $a0, res
	syscall
	li $v0, 1
	move $a0, $t2
	syscall
	li $v0, 4
	la $a0, spacer
	syscall

	j again
	
factorialFunctionStart:
	#var1Q
	li $v0, 4
	la $a0, factorialText
	syscall
	li $v0, 5
	syscall
	move $t1, $v0

	add $t7, $t1, 0
	sub $t7, $t7, 1

	#special cases for factorial
	bltz $t1, factorialFunctionStart
	beq $t1, 0, ans1
	beq $t1, 1, ans1
	j factorialFunctionLoop

factorialFunctionLoop:
	mul $t1, $t1, $t7
	sub $t7, $t7, 1
	bne $t7, 0, factorialFunctionLoop
	j factorialAns

factorialAns:
	#print
	li $v0, 4
	la $a0, res
	syscall
	li $v0, 1
	move $a0, $t1
	syscall
	li $v0, 4
	la $a0, spacer
	syscall
	j again

sumFunction:
	#var1Q
	li $v0, 4
	la $a0, sumWarningText
	syscall
	li $v0, 4
	la $a0, varA
	syscall
	li $v0, 4
	la $a0, sumText
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	#var2Q
	li $v0, 4
	la $a0, varB
	syscall
	li $v0, 4
	la $a0, sumText
	syscall
	li $v0, 5
	syscall
	move $t2, $v0

	#register set asside
	add $t3, $t1, 0

	#Exception handling
	bltz $t1, factorialFunctionStart
	slt $t5, $t1, $t2
	bne $t5, 1, sumFunction
	j sumFunctionLoop

sumFunctionLoop:
	add $t1, $t1, 1
	add $t3, $t1, $t3
	bne $t2, $t1, sumFunctionLoop
	j sumAns

sumAns:
	#print
	li $v0, 4
	la $a0, res
	syscall
	li $v0, 1
	move $a0, $t3
	syscall
	li $v0, 4
	la $a0, spacer
	syscall
	j again

	

powersFunction:
	#var1Q
	li $v0, 4
	la $a0, varA
	syscall
	li $v0, 4
	la $a0, powersText
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	#var2Q
	li $v0, 4
	la $a0, varB
	syscall
	li $v0, 4
	la $a0, powersText
	syscall
	li $v0, 5
	syscall
	move $t2, $v0

	#load my variables
	mul $t3, $t1, $t1
	sub $t4, $t2, 1

	#exception handeling
	beq $t2, 0, ans1
	beq $t1, 0, ans0
	beq $t2, 2, powersExceptionAns
	bltz $t1, powersFunction
	bltz $t2, powersFunction
	j powersFunctionLoop

powersExceptionAns:
	#operation
	mul $t3, $t1, $t1
	
	#print
	li $v0, 4
	la $a0, res
	syscall
	li $v0, 1
	move $a0, $t3
	syscall
	li $v0, 4
	la $a0, spacer
	syscall

	j again

powersFunctionLoop:
	mul $t3, $t3, $t1
	sub $t4, $t4, 1
	beq $t4, 1, powersAns
	j powersFunctionLoop

powersAns:
	#print
	li $v0, 4
	la $a0, res
	syscall
	li $v0, 1
	move $a0, $t3
	syscall
	li $v0, 4
	la $a0, spacer
	syscall
	j again


#special case function
ans1:
	li $v0, 4
	la $a0, res
	syscall
	li $v0, 4
	la $a0, one
	syscall
	li $v0, 4
	la $a0, spacer
	syscall
	j again

#special case function
ans0:
	li $v0, 4
	la $a0, res
	syscall
	li $v0, 4
	la $a0, zero
	syscall
	li $v0, 4
	la $a0, spacer
	syscall
	j again

#asks user if they want to solve another equation
again:
	li $v0, 4
	la $a0, contQ
	syscall

	#read cont ques input
	li $v0, 5
	syscall
	move $s0, $v0

	#reloopQ
	bne $s0, 1, goodbye
	j loop


#terminate and exit program
goodbye:
	li $v0, 4
	la $a0, gB
	syscall

	li $v0, 10
	syscall