	.file	"gcc-intrin-test.c"
	.text
	.p2align 4,,15
	.globl	v4sf_dot
	.type	v4sf_dot, @function
v4sf_dot:
.LFB672:
	.cfi_startproc
	testl	%edx, %edx
	jle	.L4
	subl	$1, %edx
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leal	0(,%rcx,8), %eax
	shrl	$3, %edx
	leal	0(,%rcx,4), %r8d
	salq	$5, %rdx
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movslq	%eax, %rbp
	leaq	32(%rdi,%rdx), %rbx
	leal	(%rcx,%rcx), %edx
	subl	%ecx, %eax
	xorps	%xmm0, %xmm0
	movslq	%r8d, %r9
	movslq	%edx, %r11
	addl	%ecx, %edx
	addl	%ecx, %r8d
	movslq	%edx, %r10
	addl	%edx, %edx
	salq	$2, %rbp
	movslq	%r8d, %r8
	movslq	%edx, %rdx
	cltq
	movslq	%ecx, %rcx
	.p2align 4,,10
	.p2align 3
.L3:
	movss	(%rsi,%r11,4), %xmm3
	addq	$32, %rdi
	movss	(%rsi), %xmm2
	insertps	$0x10, (%rsi,%r10,4), %xmm3
	movss	(%rsi,%rdx,4), %xmm4
	insertps	$0x10, (%rsi,%rcx,4), %xmm2
	movups	-32(%rdi), %xmm1
	insertps	$0x10, (%rsi,%rax,4), %xmm4
	movlhps	%xmm3, %xmm2
	movss	(%rsi,%r9,4), %xmm3
	insertps	$0x10, (%rsi,%r8,4), %xmm3
	addq	%rbp, %rsi
	mulss	%xmm2, %xmm1
	movups	-16(%rdi), %xmm2
	cmpq	%rbx, %rdi
	movlhps	%xmm4, %xmm3
	mulss	%xmm3, %xmm2
	haddps	%xmm2, %xmm1
	movaps	%xmm1, %xmm5
	movaps	%xmm1, %xmm6
	movaps	%xmm1, %xmm2
	shufps	$85, %xmm1, %xmm5
	unpckhps	%xmm1, %xmm6
	shufps	$255, %xmm1, %xmm1
	movaps	%xmm5, %xmm3
	addss	%xmm3, %xmm2
	movaps	%xmm6, %xmm3
	addss	%xmm3, %xmm2
	addss	%xmm1, %xmm2
	addss	%xmm2, %xmm0
	jne	.L3
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	ret
.L4:
	xorps	%xmm0, %xmm0
	ret
	.cfi_endproc
.LFE672:
	.size	v4sf_dot, .-v4sf_dot
	.p2align 4,,15
	.globl	test
	.type	test, @function
test:
.LFB673:
	.cfi_startproc
	unpcklps	%xmm3, %xmm2
	unpcklps	%xmm1, %xmm0
	movups	(%rdi), %xmm1
	movlhps	%xmm2, %xmm0
	mulss	%xmm1, %xmm0
	mulss	%xmm1, %xmm0
	mulss	.LC1(%rip), %xmm0
	mulss	.LC2(%rip), %xmm0
	ret
	.cfi_endproc
.LFE673:
	.size	test, .-test
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC8:
	.string	"%f,%f,%f,%f"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB674:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$.LC8, %edi
	movl	$4, %eax
	movl	$0x3f800000, (%rsp)
	movl	$0x40000000, 4(%rsp)
	movl	$0x40400000, 8(%rsp)
	movl	$0x40800000, 12(%rsp)
	movups	(%rsp), %xmm1
	movaps	.LC7(%rip), %xmm0
	mulss	%xmm1, %xmm0
	mulss	%xmm1, %xmm0
	mulss	.LC1(%rip), %xmm0
	mulss	.LC2(%rip), %xmm0
	movaps	%xmm0, %xmm4
	movaps	%xmm0, %xmm5
	movaps	%xmm0, %xmm6
	shufps	$255, %xmm0, %xmm4
	unpckhps	%xmm0, %xmm5
	shufps	$85, %xmm0, %xmm6
	movaps	%xmm4, %xmm3
	unpcklps	%xmm0, %xmm0
	movaps	%xmm5, %xmm2
	movaps	%xmm6, %xmm1
	unpcklps	%xmm3, %xmm3
	unpcklps	%xmm2, %xmm2
	unpcklps	%xmm1, %xmm1
	cvtps2pd	%xmm0, %xmm0
	cvtps2pd	%xmm3, %xmm3
	cvtps2pd	%xmm2, %xmm2
	cvtps2pd	%xmm1, %xmm1
	call	printf
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE674:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	1091567616
	.long	1092616192
	.long	1093664768
	.long	1094713344
	.align 16
.LC2:
	.long	1095761920
	.long	1096810496
	.long	1097859072
	.long	1098907648
	.align 16
.LC7:
	.long	1084227584
	.long	1086324736
	.long	1088421888
	.long	1090519040
	.ident	"GCC: (GNU) 4.8.0 20130502 (prerelease)"
	.section	.note.GNU-stack,"",@progbits
