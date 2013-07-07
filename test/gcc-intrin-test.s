	.file	"gcc-intrin-test.c"
	.text
	.p2align 4,,15
	.globl	v4sf_dot
	.type	v4sf_dot, @function
v4sf_dot:
.LFB846:
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
	vxorps	%xmm0, %xmm0, %xmm0
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
	vmovss	(%rsi,%r11,4), %xmm5
	addq	$32, %rdi
	vmovss	(%rsi), %xmm6
	vinsertps	$0x10, (%rsi,%r10,4), %xmm5, %xmm1
	vmovss	(%rsi,%rdx,4), %xmm7
	vinsertps	$0x10, (%rsi,%rcx,4), %xmm6, %xmm2
	vmovss	(%rsi,%r9,4), %xmm5
	vinsertps	$0x10, (%rsi,%r8,4), %xmm5, %xmm3
	vmovups	-32(%rdi), %xmm4
	vmovlhps	%xmm1, %xmm2, %xmm2
	vinsertps	$0x10, (%rsi,%rax,4), %xmm7, %xmm1
	addq	%rbp, %rsi
	vmulps	%xmm2, %xmm4, %xmm2
	vmovlhps	%xmm1, %xmm3, %xmm3
	vmovups	-16(%rdi), %xmm1
	cmpq	%rbx, %rdi
	vmulps	%xmm3, %xmm1, %xmm1
	vhaddps	%xmm1, %xmm2, %xmm1
	vshufps	$85, %xmm1, %xmm1, %xmm2
	vmovaps	%xmm1, %xmm3
	vaddss	%xmm2, %xmm3, %xmm2
	vunpckhps	%xmm1, %xmm1, %xmm3
	vshufps	$255, %xmm1, %xmm1, %xmm1
	vaddss	%xmm3, %xmm2, %xmm2
	vaddss	%xmm1, %xmm2, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	jne	.L3
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	ret
.L4:
	vxorps	%xmm0, %xmm0, %xmm0
	ret
	.cfi_endproc
.LFE846:
	.size	v4sf_dot, .-v4sf_dot
	.p2align 4,,15
	.globl	make_matrix_seq
	.type	make_matrix_seq, @function
make_matrix_seq:
.LFB847:
	.cfi_startproc
	rep ret
	.cfi_endproc
.LFE847:
	.size	make_matrix_seq, .-make_matrix_seq
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"gcc-intrin-test.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"A.N%4==0 && A.M%4==0 && B.N%4==0 && B.M==A.N"
	.section	.rodata.str1.1
.LC3:
	.string	"C.M==A.M && C.N==B.N"
	.text
	.p2align 4,,15
	.globl	v4sf_matrix_multiply
	.type	v4sf_matrix_multiply, @function
v4sf_matrix_multiply:
.LFB848:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movabsq	$12884901891, %rax
	movq	%rdx, %r15
	movq	%rcx, %rdx
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	sarq	$32, %rdx
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	testq	%rax, %rsi
	movq	%rdi, 48(%rsp)
	movq	%r8, 56(%rsp)
	jne	.L11
	testb	$3, %dl
	jne	.L11
	movq	%rsi, %rax
	sarq	$32, %rax
	cmpl	%eax, %ecx
	jne	.L11
	cmpl	%esi, %r9d
	movl	%r9d, %ebx
	jne	.L13
	movq	%r9, %rax
	sarq	$32, %rax
	cmpl	%edx, %eax
	movl	%eax, %ebp
	jne	.L13
	testl	%r9d, %r9d
	jle	.L19
	leaq	0(,%rax,4), %rcx
	movslq	%r9d, %r9
	subl	$1, %eax
	leaq	4(,%rax,4), %rax
	movq	$0, 24(%rsp)
	movq	$0, 16(%rsp)
	movq	%rcx, 40(%rsp)
	leaq	0(,%r9,4), %rcx
	movl	$0, 12(%rsp)
	movq	%rax, (%rsp)
	movq	%rcx, 32(%rsp)
	.p2align 4,,10
	.p2align 3
.L15:
	testl	%ebp, %ebp
	jle	.L17
	movq	56(%rsp), %rax
	movq	16(%rsp), %rdi
	xorl	%r14d, %r14d
	movq	24(%rsp), %r13
	addq	48(%rsp), %r13
	leaq	(%rax,%rdi), %r12
	movq	%r12, %rax
	movq	%r14, %r12
	movq	%rax, %r14
	.p2align 4,,10
	.p2align 3
.L18:
	leaq	(%r15,%r12), %rsi
	movl	%ebp, %ecx
	movl	%ebx, %edx
	movq	%r13, %rdi
	call	v4sf_dot
	vmovss	%xmm0, (%r14,%r12)
	addq	$4, %r12
	cmpq	(%rsp), %r12
	jne	.L18
.L17:
	addl	$1, 12(%rsp)
	movq	40(%rsp), %rax
	addq	%rax, 16(%rsp)
	movq	32(%rsp), %rax
	addq	%rax, 24(%rsp)
	cmpl	%ebx, 12(%rsp)
	jne	.L15
.L19:
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
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
	ret
.L11:
	.cfi_restore_state
	movl	$__PRETTY_FUNCTION__.6520, %ecx
	movl	$41, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L13:
	movl	$__PRETTY_FUNCTION__.6520, %ecx
	movl	$42, %edx
	movl	$.LC1, %esi
	movl	$.LC3, %edi
	call	__assert_fail
	.cfi_endproc
.LFE848:
	.size	v4sf_matrix_multiply, .-v4sf_matrix_multiply
	.p2align 4,,15
	.globl	test
	.type	test, @function
test:
.LFB849:
	.cfi_startproc
	vunpcklps	%xmm3, %xmm2, %xmm2
	vunpcklps	%xmm1, %xmm0, %xmm1
	vmovups	(%rdi), %xmm4
	vmovlhps	%xmm2, %xmm1, %xmm0
	vmulps	%xmm4, %xmm0, %xmm0
	vmulps	%xmm4, %xmm0, %xmm0
	vmulps	.LC4(%rip), %xmm0, %xmm0
	vmulps	.LC5(%rip), %xmm0, %xmm0
	ret
	.cfi_endproc
.LFE849:
	.size	test, .-test
	.section	.rodata.str1.1
.LC8:
	.string	"%f,%f,%f,%f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB850:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$.LC8, %edi
	movl	$4, %eax
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	andq	$-32, %rsp
	subq	$32, %rsp
	vmovaps	.LC6(%rip), %xmm0
	vmovaps	%xmm0, (%rsp)
	vmovups	(%rsp), %xmm0
	vmulps	.LC7(%rip), %xmm0, %xmm1
	vmulps	%xmm0, %xmm1, %xmm0
	vmulps	.LC4(%rip), %xmm0, %xmm0
	vmulps	.LC5(%rip), %xmm0, %xmm0
	vshufps	$255, %xmm0, %xmm0, %xmm3
	vunpckhps	%xmm0, %xmm0, %xmm2
	vshufps	$85, %xmm0, %xmm0, %xmm1
	vunpcklps	%xmm3, %xmm3, %xmm3
	vunpcklps	%xmm0, %xmm0, %xmm0
	vunpcklps	%xmm2, %xmm2, %xmm2
	vunpcklps	%xmm1, %xmm1, %xmm1
	vcvtps2pd	%xmm3, %xmm3
	vcvtps2pd	%xmm0, %xmm0
	vcvtps2pd	%xmm2, %xmm2
	vcvtps2pd	%xmm1, %xmm1
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE850:
	.size	main, .-main
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"A.N==B.M && C.M==A.M && C.N==B.N"
	.text
	.p2align 4,,15
	.globl	mat_mult
	.type	mat_mult, @function
mat_mult:
.LFB851:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rsi, %rax
	sarq	$32, %rax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdx, %rbp
	movq	%rcx, %rdx
	sarq	$32, %rdx
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	cmpl	%eax, %ecx
	jne	.L25
	cmpl	%esi, %r9d
	movl	%r9d, %r14d
	jne	.L25
	movq	%r9, %rax
	sarq	$32, %rax
	cmpl	%edx, %eax
	movl	%eax, %r15d
	jne	.L25
	testl	%r9d, %r9d
	jle	.L34
	movl	%ecx, %r10d
	movslq	%ecx, %rcx
	movslq	%r9d, %r9
	leaq	0(,%rcx,4), %r13
	leal	-1(%rax), %ecx
	leaq	0(,%r9,4), %rbx
	movq	%r8, %rdx
	leaq	0(,%rax,4), %r8
	leaq	4(,%rcx,4), %r12
	movq	%rbx, 8(%rsp)
	xorl	%ebx, %ebx
.L27:
	testl	%r15d, %r15d
	jle	.L29
	leaq	(%r12,%rdx), %r11
	movq	%rbp, %r9
	movq	%rdx, %rsi
	.p2align 4,,10
	.p2align 3
.L32:
	testl	%r10d, %r10d
	jle	.L30
	vmovss	(%rsi), %xmm0
	movq	%r9, %rcx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L31:
	vmovss	(%rdi,%rax,4), %xmm1
	addq	$1, %rax
	vmulss	(%rcx), %xmm1, %xmm1
	addq	%r8, %rcx
	cmpl	%eax, %r10d
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm0, (%rsi)
	jg	.L31
.L30:
	addq	$4, %rsi
	addq	$4, %r9
	cmpq	%r11, %rsi
	jne	.L32
.L29:
	addl	$1, %ebx
	addq	%r13, %rdi
	addq	8(%rsp), %rdx
	cmpl	%r14d, %ebx
	jne	.L27
.L34:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
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
	ret
.L25:
	.cfi_restore_state
	movl	$__PRETTY_FUNCTION__.6553, %ecx
	movl	$69, %edx
	movl	$.LC1, %esi
	movl	$.LC9, %edi
	call	__assert_fail
	.cfi_endproc
.LFE851:
	.size	mat_mult, .-mat_mult
	.section	.rodata.str1.8
	.align 8
.LC10:
	.string	"A.N%4==0 && B.N%4==0 && A.M%4==0"
	.text
	.p2align 4,,15
	.globl	mat_mult_v4sf
	.type	mat_mult_v4sf, @function
mat_mult_v4sf:
.LFB852:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rsi, %rax
	sarq	$32, %rax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movq	%rdx, 64(%rsp)
	movq	%rcx, %rdx
	movq	%rdi, 24(%rsp)
	sarq	$32, %rdx
	cmpl	%eax, %ecx
	jne	.L37
	cmpl	%esi, %r9d
	movl	%r9d, 36(%rsp)
	jne	.L37
	movq	%r9, %rax
	sarq	$32, %rax
	cmpl	%edx, %eax
	movl	%eax, %r12d
	jne	.L37
	testb	$3, %cl
	jne	.L39
	movl	%eax, %edx
	orl	%r9d, %edx
	andl	$3, %edx
	jne	.L39
	testl	%r9d, %r9d
	jle	.L48
	movslq	%r9d, %r9
	leal	(%rax,%rax), %edx
	leal	0(,%rax,4), %r11d
	leaq	0(,%r9,4), %rbx
	movl	%ecx, %r13d
	movq	%r8, %r14
	addl	%edx, %eax
	movslq	%r11d, %r11
	movslq	%edx, %r10
	movq	%rbx, 56(%rsp)
	movslq	%eax, %r9
	movslq	%ecx, %rbx
	movq	24(%rsp), %rax
	subl	$1, %ecx
	movq	%rbx, 40(%rsp)
	shrl	$2, %ecx
	salq	$2, %r11
	movq	$0, 16(%rsp)
	leaq	0(,%rcx,4), %rbx
	movq	$0, 8(%rsp)
	movl	$0, 32(%rsp)
	addq	$16, %rax
	movslq	%r12d, %rdi
	movq	%rbx, 48(%rsp)
	movq	%rax, 72(%rsp)
.L41:
	testl	%r12d, %r12d
	jle	.L43
	movq	16(%rsp), %rcx
	movq	24(%rsp), %rsi
	xorl	%r8d, %r8d
	movq	64(%rsp), %rbp
	movq	8(%rsp), %rbx
	movq	%rcx, %rax
	addq	48(%rsp), %rax
	leaq	(%rsi,%rcx,4), %r15
	movq	72(%rsp), %rsi
	leaq	(%rsi,%rax,4), %rsi
	.p2align 4,,10
	.p2align 3
.L46:
	testl	%r13d, %r13d
	jle	.L44
	leaq	(%rbx,%r14), %rcx
	movq	%r15, %rdx
	movq	%rbp, %rax
	vmovss	(%rcx), %xmm1
	.p2align 4,,10
	.p2align 3
.L45:
	vmovss	(%rax,%r10,4), %xmm4
	addq	$16, %rdx
	vmovss	(%rax), %xmm5
	vinsertps	$0x10, (%rax,%rdi,4), %xmm5, %xmm3
	vmovups	-16(%rdx), %xmm2
	vinsertps	$0x10, (%rax,%r9,4), %xmm4, %xmm0
	addq	%r11, %rax
	cmpq	%rsi, %rdx
	vmovlhps	%xmm0, %xmm3, %xmm0
	vmulps	%xmm0, %xmm2, %xmm0
	vshufps	$85, %xmm0, %xmm0, %xmm2
	vmovaps	%xmm0, %xmm3
	vaddss	%xmm2, %xmm3, %xmm2
	vunpckhps	%xmm0, %xmm0, %xmm3
	vshufps	$255, %xmm0, %xmm0, %xmm0
	vaddss	%xmm3, %xmm2, %xmm2
	vaddss	%xmm0, %xmm2, %xmm0
	vaddss	%xmm0, %xmm1, %xmm1
	vmovss	%xmm1, (%rcx)
	jne	.L45
.L44:
	addl	$1, %r8d
	addq	$4, %rbp
	addq	$4, %rbx
	cmpl	%r12d, %r8d
	jne	.L46
.L43:
	addl	$1, 32(%rsp)
	movq	56(%rsp), %rax
	addq	%rax, 8(%rsp)
	movq	40(%rsp), %rax
	addq	%rax, 16(%rsp)
	movl	36(%rsp), %eax
	cmpl	%eax, 32(%rsp)
	jne	.L41
.L48:
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
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
	ret
.L37:
	.cfi_restore_state
	movl	$__PRETTY_FUNCTION__.6574, %ecx
	movl	$81, %edx
	movl	$.LC1, %esi
	movl	$.LC9, %edi
	call	__assert_fail
.L39:
	movl	$__PRETTY_FUNCTION__.6574, %ecx
	movl	$82, %edx
	movl	$.LC1, %esi
	movl	$.LC10, %edi
	call	__assert_fail
	.cfi_endproc
.LFE852:
	.size	mat_mult_v4sf, .-mat_mult_v4sf
	.p2align 4,,15
	.globl	compare
	.type	compare, @function
compare:
.LFB853:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$2, %eax
	vmovaps	.LC11(%rip), %xmm1
	vmovaps	.LC6(%rip), %xmm0
	call	__builtin_ia32_cmpnlts
	movl	$5, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE853:
	.size	compare, .-compare
	.section	.rodata
	.type	__PRETTY_FUNCTION__.6574, @object
	.size	__PRETTY_FUNCTION__.6574, 14
__PRETTY_FUNCTION__.6574:
	.string	"mat_mult_v4sf"
	.type	__PRETTY_FUNCTION__.6553, @object
	.size	__PRETTY_FUNCTION__.6553, 9
__PRETTY_FUNCTION__.6553:
	.string	"mat_mult"
	.align 16
	.type	__PRETTY_FUNCTION__.6520, @object
	.size	__PRETTY_FUNCTION__.6520, 21
__PRETTY_FUNCTION__.6520:
	.string	"v4sf_matrix_multiply"
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC4:
	.long	1091567616
	.long	1092616192
	.long	1093664768
	.long	1094713344
	.align 16
.LC5:
	.long	1095761920
	.long	1096810496
	.long	1097859072
	.long	1098907648
	.align 16
.LC6:
	.long	1065353216
	.long	1073741824
	.long	1077936128
	.long	1082130432
	.align 16
.LC7:
	.long	1084227584
	.long	1086324736
	.long	1088421888
	.long	1090519040
	.align 16
.LC11:
	.long	1073741824
	.long	1065353216
	.long	1077936128
	.long	1082130432
	.ident	"GCC: (GNU) 4.8.1"
	.section	.note.GNU-stack,"",@progbits
