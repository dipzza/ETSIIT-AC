	.file	"daxpy.c"
	.text
	.globl	x
	.bss
	.align 32
	.type	x, @object
	.size	x, 800000000
x:
	.zero	800000000
	.globl	y
	.align 32
	.type	y, @object
	.size	y, 800000000
y:
	.zero	800000000
	.section	.rodata
	.align 8
.LC0:
	.string	"Faltan n\302\272 columnas de la matriz"
	.align 8
.LC3:
	.string	"Tiempo:%11.9f\t / N:%u\t/ y[0] = %8.6f / y[%d] = %8.6f /\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movl	%edi, -84(%rbp)
	movq	%rsi, -96(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpl	$1, -84(%rbp)
	jg	.L2
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	movl	$-1, %edi
	call	exit@PLT
.L2:
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -68(%rbp)
	cmpl	$99999999, -68(%rbp)
	jbe	.L3
	movl	$99999999, -68(%rbp)
.L3:
	movl	$0, -64(%rbp)
.L9:
	movl	-64(%rbp), %eax
	cmpl	%eax, -68(%rbp)
	jb	.L4
	movl	-68(%rbp), %eax
	testq	%rax, %rax
	js	.L5
	cvtsi2sdq	%rax, %xmm0
	jmp	.L6
.L5:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
.L6:
	movsd	.LC1(%rip), %xmm1
	mulsd	%xmm0, %xmm1
	cvtsi2sd	-64(%rbp), %xmm2
	movsd	.LC1(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movl	-64(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	y(%rip), %rax
	movsd	%xmm0, (%rdx,%rax)
	movl	-68(%rbp), %eax
	testq	%rax, %rax
	js	.L7
	cvtsi2sdq	%rax, %xmm0
	jmp	.L8
.L7:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
.L8:
	movsd	.LC1(%rip), %xmm1
	mulsd	%xmm0, %xmm1
	cvtsi2sd	-64(%rbp), %xmm2
	movsd	.LC1(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movl	-64(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	x(%rip), %rax
	movsd	%xmm0, (%rdx,%rax)
	addl	$1, -64(%rbp)
	jmp	.L9
.L4:
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movl	$1, -60(%rbp)
.L11:
	movl	-60(%rbp), %eax
	cmpl	%eax, -68(%rbp)
	jb	.L10
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	x(%rip), %rax
	movsd	(%rdx,%rax), %xmm0
	movapd	%xmm0, %xmm1
	addsd	%xmm0, %xmm1
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	y(%rip), %rax
	movsd	(%rdx,%rax), %xmm0
	addsd	%xmm1, %xmm0
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	y(%rip), %rax
	movsd	%xmm0, (%rdx,%rax)
	addl	$1, -60(%rbp)
	jmp	.L11
.L10:
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movq	-32(%rbp), %rdx
	movq	-48(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm1
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC2(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)
	movl	-68(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	leaq	y(%rip), %rax
	movsd	(%rdx,%rax), %xmm2
	movsd	y(%rip), %xmm1
	movl	-68(%rbp), %edx
	movl	-68(%rbp), %eax
	movsd	-56(%rbp), %xmm0
	movl	%eax, %esi
	leaq	.LC3(%rip), %rdi
	movl	$3, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L13
	call	__stack_chk_fail@PLT
.L13:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	main, .-main
	.section	.rodata
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
