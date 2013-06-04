	.file	"gcc-intrin-test.c"
	.text
	.p2align 4,,15
	.globl	v4sf_dot
	.type	v4sf_dot, @function
v4sf_dot:
.LFB565:
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
	movss	(%rsi,%r10,4), %xmm3
	movss	(%rsi,%r11,4), %xmm2
	unpcklps	%xmm3, %xmm2
	movss	(%rsi), %xmm4
	movss	(%rsi,%rdx,4), %xmm5
	movups	(%rdi), %xmm1
	movaps	%xmm2, %xmm3
	movss	(%rsi,%rcx,4), %xmm2
	unpcklps	%xmm2, %xmm4
	movaps	%xmm4, %xmm2
	movss	(%rsi,%rax,4), %xmm4
	unpcklps	%xmm4, %xmm5
	movlhps	%xmm3, %xmm2
	movss	(%rsi,%r8,4), %xmm3
	movaps	%xmm5, %xmm4
	movss	(%rsi,%r9,4), %xmm5
	mulps	%xmm2, %xmm1
	movups	16(%rdi), %xmm2
	addq	$32, %rdi
	unpcklps	%xmm3, %xmm5
	addq	%rbp, %rsi
	cmpq	%rbx, %rdi
	movaps	%xmm5, %xmm3
	movlhps	%xmm4, %xmm3
	mulps	%xmm3, %xmm2
	haddps	%xmm2, %xmm1
	movaps	%xmm1, %xmm3
	movaps	%xmm1, %xmm2
	shufps	$85, %xmm1, %xmm3
	addss	%xmm3, %xmm2
	movaps	%xmm1, %xmm3
	unpckhps	%xmm1, %xmm3
	shufps	$255, %xmm1, %xmm1
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
.LFE565:
	.size	v4sf_dot, .-v4sf_dot
	.p2align 4,,15
	.globl	make_matrix_seq
	.type	make_matrix_seq, @function
make_matrix_seq:
.LFB566:
	.cfi_startproc
	xorl	%edx, %edx
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE566:
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
.LFB567:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movabsq	$12884901891, %rax
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
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	movq	%rcx, 72(%rsp)
	shrq	$32, %rcx
	testq	%rsi, %rax
	movq	%rdi, 80(%rsp)
	movq	%rsi, 88(%rsp)
	movq	%rdx, 64(%rsp)
	movq	%r8, 48(%rsp)
	movq	%r9, 56(%rsp)
	jne	.L11
	testb	$3, %cl
	jne	.L11
	movl	92(%rsp), %eax
	cmpl	%eax, 72(%rsp)
	jne	.L11
	cmpl	56(%rsp), %esi
	movl	%esi, %ebp
	jne	.L13
	movl	60(%rsp), %ebx
	cmpl	%ecx, %ebx
	jne	.L13
	testl	%esi, %esi
	jle	.L10
	movslq	%ebx, %rax
	movq	$0, 24(%rsp)
	movq	$0, 16(%rsp)
	salq	$2, %rax
	movl	$0, 12(%rsp)
	movq	%rax, 40(%rsp)
	movslq	%esi, %rax
	salq	$2, %rax
	movq	%rax, 32(%rsp)
	leal	-1(%rbx), %eax
	leaq	4(,%rax,4), %rax
	movq	%rax, (%rsp)
	.p2align 4,,10
	.p2align 3
.L17:
	testl	%ebx, %ebx
	jle	.L18
	movq	16(%rsp), %r12
	addq	48(%rsp), %r12
	xorl	%r15d, %r15d
	movq	24(%rsp), %r13
	addq	80(%rsp), %r13
	movq	64(%rsp), %r14
	movq	%r12, %rax
	movq	%r15, %r12
	movq	%rax, %r15
	.p2align 4,,10
	.p2align 3
.L16:
	leaq	(%r14,%r12), %rsi
	movl	%ebx, %ecx
	movl	%ebp, %edx
	movq	%r13, %rdi
	call	v4sf_dot
	movss	%xmm0, (%r15,%r12)
	addq	$4, %r12
	cmpq	(%rsp), %r12
	jne	.L16
.L18:
	addl	$1, 12(%rsp)
	movq	40(%rsp), %rax
	addq	%rax, 16(%rsp)
	movq	32(%rsp), %rax
	addq	%rax, 24(%rsp)
	cmpl	%ebp, 12(%rsp)
	jne	.L17
.L10:
	addq	$104, %rsp
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
	movl	$__PRETTY_FUNCTION__.4976, %ecx
	movl	$40, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L13:
	movl	$__PRETTY_FUNCTION__.4976, %ecx
	movl	$41, %edx
	movl	$.LC1, %esi
	movl	$.LC3, %edi
	call	__assert_fail
	.cfi_endproc
.LFE567:
	.size	v4sf_matrix_multiply, .-v4sf_matrix_multiply
	.p2align 4,,15
	.globl	test
	.type	test, @function
test:
.LFB568:
	.cfi_startproc
	unpcklps	%xmm1, %xmm0
	unpcklps	%xmm3, %xmm2
	movups	(%rdi), %xmm1
	movaps	%xmm0, %xmm3
	movlhps	%xmm2, %xmm3
	movaps	%xmm3, %xmm0
	mulps	%xmm1, %xmm0
	mulps	%xmm1, %xmm0
	mulps	.LC4(%rip), %xmm0
	mulps	.LC5(%rip), %xmm0
	ret
	.cfi_endproc
.LFE568:
	.size	test, .-test
	.section	.rodata.str1.1
.LC11:
	.string	"%f,%f,%f,%f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB569:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$.LC11, %edi
	movl	$4, %eax
	movl	$0x3f800000, (%rsp)
	movl	$0x40000000, 4(%rsp)
	movl	$0x40400000, 8(%rsp)
	movl	$0x40800000, 12(%rsp)
	movaps	.LC10(%rip), %xmm0
	movups	(%rsp), %xmm1
	mulps	%xmm1, %xmm0
	mulps	%xmm1, %xmm0
	mulps	.LC4(%rip), %xmm0
	mulps	.LC5(%rip), %xmm0
	movaps	%xmm0, %xmm3
	movaps	%xmm0, %xmm2
	movaps	%xmm0, %xmm1
	shufps	$255, %xmm0, %xmm3
	unpckhps	%xmm0, %xmm2
	shufps	$85, %xmm0, %xmm1
	unpcklps	%xmm3, %xmm3
	unpcklps	%xmm0, %xmm0
	unpcklps	%xmm2, %xmm2
	unpcklps	%xmm1, %xmm1
	cvtps2pd	%xmm3, %xmm3
	cvtps2pd	%xmm0, %xmm0
	cvtps2pd	%xmm2, %xmm2
	cvtps2pd	%xmm1, %xmm1
	call	printf
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE569:
	.size	main, .-main
	.section	.rodata.str1.8
	.align 8
.LC12:
	.string	"A.N==B.M && C.M==A.M && C.N==B.N"
	.text
	.p2align 4,,15
	.globl	mat_mult
	.type	mat_mult, @function
mat_mult:
.LFB570:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rsi, %rax
	shrq	$32, %rax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movq	%rdx, 32(%rsp)
	movq	%rcx, %rdx
	movq	%r9, 24(%rsp)
	shrq	$32, %rdx
	cmpl	%eax, %ecx
	movq	%rdi, 48(%rsp)
	movq	%rsi, 56(%rsp)
	movq	%rcx, 40(%rsp)
	movl	%ecx, %r9d
	movq	%r8, 16(%rsp)
	jne	.L26
	movl	24(%rsp), %r13d
	cmpl	%esi, %r13d
	jne	.L26
	movl	28(%rsp), %ebp
	cmpl	%edx, %ebp
	jne	.L26
	testl	%r13d, %r13d
	jle	.L25
	movslq	%ecx, %rax
	movslq	%r13d, %r15
	movq	%r8, %rdx
	salq	$2, %rax
	movslq	%ebp, %r8
	salq	$2, %r15
	movq	%rax, 8(%rsp)
	leal	-1(%rbp), %eax
	salq	$2, %r8
	xorl	%ebx, %ebx
	leaq	4(,%rax,4), %r14
.L33:
	testl	%ebp, %ebp
	movq	%r12, %r10
	leaq	(%r14,%rdx), %r11
	movq	%rdx, %rsi
	jle	.L31
	.p2align 4,,10
	.p2align 3
.L30:
	testl	%r9d, %r9d
	jle	.L32
	movss	(%rsi), %xmm1
	movq	%r10, %rcx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L29:
	movss	(%rdi,%rax,4), %xmm0
	addq	$1, %rax
	mulss	(%rcx), %xmm0
	addq	%r8, %rcx
	cmpl	%eax, %r9d
	addss	%xmm0, %xmm1
	movss	%xmm1, (%rsi)
	jg	.L29
.L32:
	addq	$4, %rsi
	addq	$4, %r10
	cmpq	%r11, %rsi
	jne	.L30
.L31:
	addl	$1, %ebx
	addq	%r15, %rdx
	addq	8(%rsp), %rdi
	cmpl	%r13d, %ebx
	jne	.L33
.L25:
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
.L26:
	.cfi_restore_state
	movl	$__PRETTY_FUNCTION__.5009, %ecx
	movl	$68, %edx
	movl	$.LC1, %esi
	movl	$.LC12, %edi
	call	__assert_fail
	.cfi_endproc
.LFE570:
	.size	mat_mult, .-mat_mult
	.section	.rodata.str1.8
	.align 8
.LC13:
	.string	"A.N%4==0 && B.N%4==0 && A.M%4==0"
	.text
	.p2align 4,,15
	.globl	mat_mult_v4sf
	.type	mat_mult_v4sf, @function
mat_mult_v4sf:
.LFB571:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rsi, %rax
	shrq	$32, %rax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movl	%ecx, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	movq	%rdx, 32(%rsp)
	movq	%rdx, 80(%rsp)
	movq	%rcx, %rdx
	shrq	$32, %rdx
	cmpl	%eax, %ecx
	movq	%rdi, 96(%rsp)
	movq	%rsi, 104(%rsp)
	movq	%rcx, 88(%rsp)
	movq	%r8, 64(%rsp)
	movq	%r9, 72(%rsp)
	jne	.L42
	movl	72(%rsp), %eax
	cmpl	%esi, %eax
	movl	%eax, 28(%rsp)
	jne	.L42
	movl	76(%rsp), %r12d
	cmpl	%edx, %r12d
	jne	.L42
	testb	$3, %cl
	jne	.L44
	movl	28(%rsp), %eax
	orl	%r12d, %eax
	testb	$3, %al
	jne	.L44
	movl	28(%rsp), %eax
	testl	%eax, %eax
	jle	.L41
	movslq	28(%rsp), %rax
	leal	0(,%r12,4), %r10d
	movslq	%ecx, %rdx
	movq	%rdx, 40(%rsp)
	movq	$0, 8(%rsp)
	movslq	%r12d, %rdi
	movslq	%r10d, %r10
	movq	$0, 16(%rsp)
	movl	$0, 24(%rsp)
	salq	$2, %r10
	salq	$2, %rax
	movq	%rax, 48(%rsp)
	leal	-1(%rcx), %eax
	shrl	$2, %eax
	salq	$2, %rax
	movq	%rax, 56(%rsp)
	leal	(%r12,%r12), %eax
	movslq	%eax, %r9
	addl	%r12d, %eax
	movslq	%eax, %r8
.L51:
	testl	%r12d, %r12d
	jle	.L49
	movq	8(%rsp), %r14
	addq	56(%rsp), %r14
	xorl	%r11d, %r11d
	movq	8(%rsp), %r15
	movq	32(%rsp), %rbp
	movq	16(%rsp), %rbx
	salq	$2, %r15
	salq	$2, %r14
	.p2align 4,,10
	.p2align 3
.L48:
	testl	%r13d, %r13d
	jle	.L50
	movq	64(%rsp), %rcx
	movq	96(%rsp), %rax
	addq	%rbx, %rcx
	leaq	(%rax,%r15), %rdx
	leaq	16(%rax,%r14), %rsi
	movss	(%rcx), %xmm2
	movq	%rbp, %rax
	.p2align 4,,10
	.p2align 3
.L47:
	movss	(%rax,%r8,4), %xmm3
	movss	(%rax,%r9,4), %xmm1
	unpcklps	%xmm3, %xmm1
	movss	(%rax), %xmm4
	movups	(%rdx), %xmm0
	addq	$16, %rdx
	movaps	%xmm1, %xmm3
	movss	(%rax,%rdi,4), %xmm1
	addq	%r10, %rax
	cmpq	%rsi, %rdx
	unpcklps	%xmm1, %xmm4
	movaps	%xmm4, %xmm1
	movlhps	%xmm3, %xmm1
	mulps	%xmm1, %xmm0
	movaps	%xmm0, %xmm3
	movaps	%xmm0, %xmm1
	shufps	$85, %xmm0, %xmm3
	addss	%xmm3, %xmm1
	movaps	%xmm0, %xmm3
	unpckhps	%xmm0, %xmm3
	shufps	$255, %xmm0, %xmm0
	addss	%xmm3, %xmm1
	addss	%xmm0, %xmm1
	addss	%xmm1, %xmm2
	movss	%xmm2, (%rcx)
	jne	.L47
.L50:
	addl	$1, %r11d
	addq	$4, %rbp
	addq	$4, %rbx
	cmpl	%r12d, %r11d
	jne	.L48
.L49:
	addl	$1, 24(%rsp)
	movq	48(%rsp), %rax
	movq	40(%rsp), %rdx
	addq	%rax, 16(%rsp)
	addq	%rdx, 8(%rsp)
	movl	28(%rsp), %eax
	cmpl	%eax, 24(%rsp)
	jne	.L51
.L41:
	addq	$120, %rsp
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
.L42:
	.cfi_restore_state
	movl	$__PRETTY_FUNCTION__.5030, %ecx
	movl	$80, %edx
	movl	$.LC1, %esi
	movl	$.LC12, %edi
	call	__assert_fail
.L44:
	movl	$__PRETTY_FUNCTION__.5030, %ecx
	movl	$81, %edx
	movl	$.LC1, %esi
	movl	$.LC13, %edi
	call	__assert_fail
	.cfi_endproc
.LFE571:
	.size	mat_mult_v4sf, .-mat_mult_v4sf
	.section	.rodata
	.align 16
	.type	__PRETTY_FUNCTION__.4976, @object
	.size	__PRETTY_FUNCTION__.4976, 21
__PRETTY_FUNCTION__.4976:
	.string	"v4sf_matrix_multiply"
	.type	__PRETTY_FUNCTION__.5009, @object
	.size	__PRETTY_FUNCTION__.5009, 9
__PRETTY_FUNCTION__.5009:
	.string	"mat_mult"
	.type	__PRETTY_FUNCTION__.5030, @object
	.size	__PRETTY_FUNCTION__.5030, 14
__PRETTY_FUNCTION__.5030:
	.string	"mat_mult_v4sf"
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
.LC10:
	.long	1084227584
	.long	1086324736
	.long	1088421888
	.long	1090519040
	.ident	"GCC: (GNU) 4.7.2 20121109 (Red Hat 4.7.2-8)"
	.section	.note.GNU-stack,"",@progbits
