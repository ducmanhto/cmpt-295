# calculator.s
# Description: Calculator program
# Name: Duc Manh To
# Date modified: Feb 2023

	.globl	compare 
	.globl	plus
	.globl	minus
	.globl	mul


compare: # Description: Return 1 if the first argument is less than the second argument
    # Change the name of this function to something more descriptive and add a description above
	xorl	%eax, %eax
	cmpl	%esi, %edi
	setl	%al         # See Section 3.6.2 of our textbook for a  
	ret                 # description of the set* instruction family

plus: # Description: Performs integer addition
# Requirement:
# - you cannot use add* instruction
# - you cannot use a loop

# Put your code here
	leal (%edi, %esi), %eax	
    ret

minus: # Description: Performs integer subtraction
# Requirement:
# - you cannot use sub* instruction
# - you cannot use a loop

# Put your code here
	negl %esi
	leal (%edi, %esi), %eax
    ret

mul: # Description: Performs integer multiplication - when both operands are non-negative!
# You can assume that both operands are non-negative.
# Requirements:
# - you cannot use imul* instruction 
#   (or any kind of instruction that multiplies such as mul)
# - you must use a loop

# algorithm:
#
#
#
#

# Put your code here
	xorl %eax, %eax
	jmp cond
	
loop:
	addl %edi, %eax
	subl $1, %esi

cond:
	testl %esi, %esi
	jg loop
	ret