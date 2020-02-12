	.file	"daxpy.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Faltan n\302\272 columnas de la matriz"
.LC3:
	.string	"Tiempo:%11.9f\t / N:%u\t/ y[0] = %8.6f / y[%d] = %8.6f /\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB15:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$48, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	decl	%edi
	jg	.L2
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	orl	$-1, %edi
	call	exit@PLT
.L2:
	movq	8(%rsi), %rdi
	movl	$99999999, %ebx
	call	atoi@PLT
	movsd	.LC1(%rip), %xmm2
	leaq	y(%rip), %rcx
	leaq	x(%rip), %rdx
	cmpl	$99999999, %eax
	movq	%rcx, %rbp
	movq	%rdx, %r12
	cmovbe	%eax, %ebx
	xorl	%eax, %eax
	cvtsi2sd	%ebx, %xmm1
	mulsd	%xmm2, %xmm1
.L3:
	cvtsi2sd	%eax, %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rcx,%rax,8)
	movsd	%xmm0, (%rdx,%rax,8)
	incq	%rax
	cmpl	%eax, %ebx
	jnb	.L3
	leaq	8(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	leaq	y(%rip), %rax
	xorl	%edx, %edx
.L5:
	incq	%rdx
	addq	$8, %rax
	cmpl	%edx, %ebx
	jb	.L4
	movsd	(%r12,%rdx,8), %xmm0
	addsd	%xmm0, %xmm0
	addsd	(%rax), %xmm0
	movsd	%xmm0, (%rax)
	jmp	.L5
.L4:
	xorl	%edi, %edi
	leaq	24(%rsp), %rsi
	call	clock_gettime@PLT
	movq	24(%rsp), %rax
	movl	%ebx, %ecx
	movl	%ebx, %esi
	subq	8(%rsp), %rax
	movq	32(%rsp), %rdx
	leaq	.LC3(%rip), %rdi
	cvtsi2sdq	%rax, %xmm1
	subq	16(%rsp), %rdx
	movsd	0(%rbp,%rcx,8), %xmm2
	movb	$3, %al
	cvtsi2sdq	%rdx, %xmm0
	divsd	.LC2(%rip), %xmm0
	movl	%ebx, %edx
	addsd	%xmm1, %xmm0
	movsd	y(%rip), %xmm1
	call	printf@PLT
	xorl	%eax, %eax
	movq	40(%rsp), %rcx
	xorq	%fs:40, %rcx
	je	.L6
	call	__stack_chk_fail@PLT
.L6:
	addq	$48, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE15:
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
