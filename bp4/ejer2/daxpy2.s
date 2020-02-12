	.file	"daxpy.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Faltan n\302\272 columnas de la matriz"
	.align 8
.LC3:
	.string	"Tiempo:%11.9f\t / N:%u\t/ y[0] = %8.6f / y[%d] = %8.6f /\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB32:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$48, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L11
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	$99999999, %r12d
	leaq	y(%rip), %rbx
	leaq	x(%rip), %rbp
	call	strtol@PLT
	pxor	%xmm1, %xmm1
	movsd	.LC1(%rip), %xmm2
	cmpl	$99999999, %eax
	movq	%rax, %r14
	cmovbe	%eax, %r12d
	xorl	%eax, %eax
	cvtsi2sd	%r12d, %xmm1
	movl	%r12d, %r13d
	mulsd	%xmm2, %xmm1
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L7:
	movq	%rdx, %rax
.L3:
	pxor	%xmm0, %xmm0
	leaq	1(%rax), %rdx
	cvtsi2sd	%eax, %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rbx,%rax,8)
	movsd	%xmm0, 0(%rbp,%rax,8)
	cmpq	%rax, %r13
	jne	.L7
	xorl	%edi, %edi
	movq	%rsp, %rsi
	call	clock_gettime@PLT
	testl	%r14d, %r14d
	je	.L4
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L5:
	movsd	0(%rbp,%rax,8), %xmm0
	addsd	%xmm0, %xmm0
	addsd	(%rbx,%rax,8), %xmm0
	movsd	%xmm0, (%rbx,%rax,8)
	addq	$1, %rax
	cmpl	%eax, %r12d
	jnb	.L5
.L4:
	xorl	%edi, %edi
	leaq	16(%rsp), %rsi
	call	clock_gettime@PLT
	movq	24(%rsp), %rax
	pxor	%xmm0, %xmm0
	subq	8(%rsp), %rax
	cvtsi2sdq	%rax, %xmm0
	pxor	%xmm1, %xmm1
	movl	%r12d, %edx
	movl	%r12d, %esi
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	divsd	.LC2(%rip), %xmm0
	leaq	.LC3(%rip), %rdi
	cvtsi2sdq	%rax, %xmm1
	movsd	(%rbx,%r13,8), %xmm2
	movl	$3, %eax
	addsd	%xmm1, %xmm0
	movsd	y(%rip), %xmm1
	call	printf@PLT
	xorl	%eax, %eax
	movq	40(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L12
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L11:
	.cfi_restore_state
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	orl	$-1, %edi
	call	exit@PLT
.L12:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE32:
	.size	main, .-main
	.globl	y
	.bss
	.align 32
	.type	y, @object
	.size	y, 800000000
y:
	.zero	800000000
	.globl	x
	.align 32
	.type	x, @object
	.size	x, 800000000
x:
	.zero	800000000
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	2576980378
	.long	1069128089
	.align 8
.LC2:
	.long	0
	.long	1104006501
	.ident	"GCC: (GNU) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
