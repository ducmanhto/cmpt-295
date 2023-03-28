	.file	"main.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"It took %ld microseconds to initialize the array.\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	xorl	%edi, %edi
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	4+A(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	leaq	-4(%r12), %r13
	movl	$1, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$312, %rsp
	.cfi_def_cfa_offset 352
	movq	%fs:40, %rax
	movq	%rax, 296(%rsp)
	xorl	%eax, %eax
	call	time@PLT
	movq	%rax, %rdi
	call	srand@PLT
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	getrusage@PLT
	movl	$0, A(%rip)
	.p2align 4,,10
	.p2align 3
.L2:
	movl	%ebp, %eax
	addl	$1, %ebp
	addq	$4, %r12
	imulq	$1374389535, %rax, %rax
	shrq	$37, %rax
	movl	%eax, -4(%r12)
	call	rand@PLT
	movl	%eax, %ebx
	call	rand@PLT
	movslq	%ebx, %rcx
	imulq	$-2147418109, %rcx, %rcx
	movl	%eax, %edx
	movl	%ebx, %eax
	sarl	$31, %eax
	movl	%edx, %esi
	sarl	$31, %esi
	shrq	$32, %rcx
	addl	%ebx, %ecx
	sarl	$14, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	sall	$15, %eax
	subl	%ecx, %eax
	movslq	%edx, %rcx
	imulq	$-2147450879, %rcx, %rcx
	subl	%eax, %ebx
	movl	%ebx, %eax
	sall	$16, %eax
	shrq	$32, %rcx
	addl	%edx, %ecx
	sarl	$15, %ecx
	subl	%esi, %ecx
	movl	%ecx, %esi
	sall	$16, %esi
	subl	%ecx, %esi
	subl	%esi, %edx
	orl	%edx, %eax
	cltd
	idivl	%ebp
	movl	-4(%r12), %eax
	movslq	%edx, %rdx
	movl	0(%r13,%rdx,4), %ecx
	movl	%ecx, -4(%r12)
	movl	%eax, 0(%r13,%rdx,4)
	cmpl	$2000000, %ebp
	jne	.L2
	xorl	%edi, %edi
	leaq	144(%rsp), %rsi
	call	getrusage@PLT
	imulq	$1000000, (%rsp), %rax
	addq	8(%rsp), %rax
	leaq	.LC0(%rip), %rsi
	imulq	$1000000, 144(%rsp), %rdx
	addq	152(%rsp), %rdx
	movl	$1, %edi
	subq	%rax, %rdx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	296(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L7
	addq	$312, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L7:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.comm	A,8000000,32
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
