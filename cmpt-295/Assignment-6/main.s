	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%4d"
.LC1:
	.string	"%4d "
	.text
	.p2align 4
	.globl	printMatrixByRow
	.type	printMatrixByRow, @function
printMatrixByRow:
.LFB24:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	xorl	%r15d, %r15d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	leaq	.LC1(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	leal	-1(%rsi), %ebx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	%rdi, (%rsp)
	movl	%esi, 12(%rsp)
	movl	$0, 8(%rsp)
	testl	%esi, %esi
	je	.L3
	.p2align 4,,10
	.p2align 3
.L2:
	movq	(%rsp), %rcx
	movl	%r15d, %eax
	movl	%ebx, %r12d
	xorl	%r14d, %r14d
	leaq	(%rcx,%rax), %rbp
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L4:
	movq	%r13, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	1(%r14), %rax
	cmpq	%r14, %r12
	je	.L13
.L8:
	movq	%rax, %r14
.L6:
	movsbl	0(%rbp,%r14), %edx
	cmpl	%r14d, %ebx
	jne	.L4
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	1(%r14), %rax
	cmpq	%r14, %r12
	jne	.L8
.L13:
	movl	$10, %edi
	call	putchar@PLT
	addl	$1, 8(%rsp)
	movl	12(%rsp), %ecx
	movl	8(%rsp), %eax
	addl	%ecx, %r15d
	cmpl	%ecx, %eax
	jne	.L2
.L3:
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	movl	$10, %edi
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	putchar@PLT
	.cfi_endproc
.LFE24:
	.size	printMatrixByRow, .-printMatrixByRow
	.section	.rodata.str1.1
.LC2:
	.string	"Matrix A: "
.LC3:
	.string	"Copy A to C"
.LC4:
	.string	"\nMatrix C: "
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC5:
	.string	"Rotating the matrix C by 90 degrees clockwise: "
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	movl	$5, %esi
	leaq	A(%rip), %rdi
	call	printMatrixByRow
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
	movl	$5, %edx
	leaq	C(%rip), %rsi
	leaq	A(%rip), %rdi
	call	copy@PLT
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	movl	$5, %esi
	leaq	C(%rip), %rdi
	call	printMatrixByRow
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	movl	$5, %esi
	leaq	C(%rip), %rdi
	call	transpose@PLT
	movl	$5, %esi
	leaq	C(%rip), %rdi
	call	reverseColumns@PLT
	movl	$5, %esi
	leaq	C(%rip), %rdi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	printMatrixByRow
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.comm	C,25,16
	.globl	A
	.data
	.align 16
	.type	A, @object
	.size	A, 25
A:
	.string	""
	.ascii	"\001\002\003\004"
	.ascii	"\n\013\f\r\016"
	.ascii	"\024\025\026\027\030"
	.ascii	"\036\037 !\""
	.ascii	"()*+,"
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
