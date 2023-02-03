	.file	"decode2.c"
	.text
	.globl	decode2
	.type	decode2, @function
decode2:
#	Parameter to register mapping:
# 	x -> %rdi 
#	y -> %rsi
#	z -> %rdx
# 	result -> %rax
.LFB39:
	.cfi_startproc
	endbr64
	subq	%rdx, %rsi	# y -= z
	imulq	%rsi, %rdi	# x *= y
	movq	%rsi, %rax	# answer = y, answer -> %rax 
	salq	$63, %rax	# answer <<= 63
	sarq	$63, %rax	# answer >>= 63
	xorq	%rdi, %rax	# answer ^= x 
	# Line 3-6 had to be combined in c to get the desired .s file
	# answer = ((y << 63) >> 63) ^ x
	ret # return answer
	.cfi_endproc
.LFE39:
	.size	decode2, .-decode2
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"The result of the function decode2 with parameter %ld, %ld, %ld is %ld.\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Wrong argument format."
	.text
	.globl	main
	.type	main, @function
main:
.LFB40:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	cmpl	$4, %edi
	je	.L6
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
.L4:
	movl	$0, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L6:
	.cfi_restore_state
	movq	%rsi, %rbx
	movq	8(%rsi), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	strtol@PLT
	movq	%rax, %rbp
	movq	16(%rbx), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	strtol@PLT
	movq	%rax, %r12
	movq	24(%rbx), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	strtol@PLT
	movq	%rax, %rbx
	movq	%rax, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	decode2
	movq	%rax, %r9
	movq	%rbx, %r8
	movq	%r12, %rcx
	movq	%rbp, %rdx
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	jmp	.L4
	.cfi_endproc
.LFE40:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
