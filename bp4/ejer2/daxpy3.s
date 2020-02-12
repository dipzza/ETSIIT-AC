	.file	"daxpy.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Faltan n\302\272 columnas de la matriz"
	.align 8
.LC6:
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
	jle	.L17
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	$99999999, %ebp
	call	strtol@PLT
	pxor	%xmm6, %xmm6
	movsd	.LC2(%rip), %xmm7
	cmpl	$99999999, %eax
	movq	%rax, %r13
	cmovbe	%eax, %ebp
	cvtsi2sd	%ebp, %xmm6
	leal	1(%rbp), %r14d
	mulsd	%xmm7, %xmm6
	cmpl	$2, %eax
	jbe	.L11
	movl	%r14d, %ecx
	leaq	y(%rip), %rbx
	movapd	%xmm6, %xmm4
	movdqa	.LC0(%rip), %xmm2
	shrl	$2, %ecx
	unpcklpd	%xmm4, %xmm4
	movq	%rbx, %rax
	movdqa	.LC3(%rip), %xmm5
	leaq	x(%rip), %r12
	salq	$5, %rcx
	movapd	.LC4(%rip), %xmm3
	movq	%r12, %rdx
	addq	%rbx, %rcx
	.p2align 4,,10
	.p2align 3
.L4:
	pshufd	$238, %xmm2, %xmm0
	cvtdq2pd	%xmm2, %xmm1
	addq	$32, %rax
	addq	$32, %rdx
	mulpd	%xmm3, %xmm1
	cvtdq2pd	%xmm0, %xmm0
	paddd	%xmm5, %xmm2
	mulpd	%xmm3, %xmm0
	addpd	%xmm4, %xmm1
	addpd	%xmm4, %xmm0
	movaps	%xmm1, -32(%rax)
	movaps	%xmm0, -16(%rax)
	movaps	%xmm1, -32(%rdx)
	movaps	%xmm0, -16(%rdx)
	cmpq	%rcx, %rax
	jne	.L4
	movl	%r14d, %eax
	andl	$-4, %eax
	cmpl	%eax, %r14d
	je	.L5
.L3:
	pxor	%xmm0, %xmm0
	movslq	%eax, %rdx
	cvtsi2sd	%eax, %xmm0
	mulsd	%xmm7, %xmm0
	addsd	%xmm6, %xmm0
	movsd	%xmm0, (%rbx,%rdx,8)
	movsd	%xmm0, (%r12,%rdx,8)
	leal	1(%rax), %edx
	cmpl	%ebp, %edx
	ja	.L5
	pxor	%xmm0, %xmm0
	addl	$2, %eax
	cvtsi2sd	%edx, %xmm0
	movslq	%edx, %rdx
	mulsd	%xmm7, %xmm0
	addsd	%xmm6, %xmm0
	movsd	%xmm0, (%rbx,%rdx,8)
	movsd	%xmm0, (%r12,%rdx,8)
	cmpl	%ebp, %eax
	ja	.L5
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	cltq
	mulsd	%xmm0, %xmm7
	addsd	%xmm7, %xmm6
	movsd	%xmm6, (%rbx,%rax,8)
	movsd	%xmm6, (%r12,%rax,8)
.L5:
	xorl	%edi, %edi
	movq	%rsp, %rsi
	call	clock_gettime@PLT
	testl	%r13d, %r13d
	je	.L6
	cmpl	$1, %r14d
	movl	$1, %esi
	leal	-2(%rbp), %eax
	cmova	%ebp, %esi
	cmpl	$-4, %eax
	ja	.L12
	leaq	8+x(%rip), %rax
	leaq	8+y(%rip), %rdx
	movl	%esi, %ecx
	shrl	%ecx
	salq	$4, %rcx
	addq	%rax, %rcx
	.p2align 4,,10
	.p2align 3
.L8:
	movupd	(%rax), %xmm0
	movupd	(%rdx), %xmm5
	addq	$16, %rax
	addq	$16, %rdx
	addpd	%xmm0, %xmm0
	addpd	%xmm5, %xmm0
	movups	%xmm0, -16(%rdx)
	cmpq	%rcx, %rax
	jne	.L8
	movl	%esi, %edx
	andl	$-2, %edx
	leal	1(%rdx), %eax
	cmpl	%esi, %edx
	je	.L6
.L7:
	cltq
	movsd	(%r12,%rax,8), %xmm0
	addsd	%xmm0, %xmm0
	addsd	(%rbx,%rax,8), %xmm0
	movsd	%xmm0, (%rbx,%rax,8)
.L6:
	xorl	%edi, %edi
	leaq	16(%rsp), %rsi
	call	clock_gettime@PLT
	movq	24(%rsp), %rax
	pxor	%xmm0, %xmm0
	movl	%ebp, %edx
	subq	8(%rsp), %rax
	pxor	%xmm1, %xmm1
	movsd	(%rbx,%rdx,8), %xmm2
	movl	%ebp, %esi
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	movl	%ebp, %edx
	cvtsi2sdq	%rax, %xmm1
	divsd	.LC5(%rip), %xmm0
	leaq	.LC6(%rip), %rdi
	movl	$3, %eax
	addsd	%xmm1, %xmm0
	movsd	y(%rip), %xmm1
	call	printf@PLT
	xorl	%eax, %eax
	movq	40(%rsp), %rdi
	xorq	%fs:40, %rdi
	jne	.L18
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
	xorl	%eax, %eax
	leaq	y(%rip), %rbx
	leaq	x(%rip), %r12
	jmp	.L3
.L12:
	movl	$1, %eax
	jmp	.L7
.L18:
	call	__stack_chk_fail@PLT
.L17:
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	orl	$-1, %edi
	call	exit@PLT
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
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	2576980378
	.long	1069128089
	.section	.rodata.cst16
	.align 16
.LC3:
	.long	4
	.long	4
	.long	4
	.long	4
	.align 16
.LC4:
	.long	2576980378
	.long	1069128089
	.long	2576980378
	.long	1069128089
	.section	.rodata.cst8
	.align 8
.LC5:
	.long	0
	.long	1104006501
	.ident	"GCC: (GNU) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
