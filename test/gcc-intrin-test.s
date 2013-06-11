	.file	"gcc-intrin-test.c"
	.text
	.globl	v4sf_dot
	.type	v4sf_dot, @function
v4sf_dot:
.LFB531:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -88(%rbp)
	movq	%rsi, -96(%rbp)
	movl	%edx, -100(%rbp)
	movl	%ecx, -104(%rbp)
	movl	.LC0(%rip), %eax
	movl	%eax, -8(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L3:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movups	(%rax), %xmm0
	movaps	%xmm0, -32(%rbp)
	movl	-4(%rbp), %eax
	imull	-104(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm2
	movl	-4(%rbp), %eax
	addl	$1, %eax
	imull	-104(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	movl	-4(%rbp), %eax
	addl	$2, %eax
	imull	-104(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm3
	movl	-4(%rbp), %eax
	addl	$3, %eax
	imull	-104(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	movaps	%xmm3, %xmm4
	unpcklps	%xmm0, %xmm4
	movaps	%xmm4, %xmm0
	movaps	%xmm2, %xmm3
	unpcklps	%xmm1, %xmm3
	movaps	%xmm3, %xmm1
	movaps	%xmm1, %xmm4
	movlhps	%xmm0, %xmm4
	movaps	%xmm4, %xmm0
	movaps	%xmm0, -48(%rbp)
	movl	-4(%rbp), %eax
	addl	$4, %eax
	imull	-104(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm2
	movl	-4(%rbp), %eax
	addl	$5, %eax
	imull	-104(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	movl	-4(%rbp), %eax
	addl	$6, %eax
	imull	-104(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm3
	movl	-4(%rbp), %eax
	addl	$7, %eax
	imull	-104(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	movaps	%xmm3, %xmm4
	unpcklps	%xmm0, %xmm4
	movaps	%xmm4, %xmm0
	movaps	%xmm2, %xmm3
	unpcklps	%xmm1, %xmm3
	movaps	%xmm3, %xmm1
	movaps	%xmm1, %xmm4
	movlhps	%xmm0, %xmm4
	movaps	%xmm4, %xmm0
	movaps	%xmm0, -64(%rbp)
	movaps	-48(%rbp), %xmm0
	movaps	-32(%rbp), %xmm1
	mulps	%xmm1, %xmm0
	movaps	%xmm0, -48(%rbp)
	movl	-4(%rbp), %eax
	cltq
	addq	$4, %rax
	leaq	0(,%rax,4), %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movups	(%rax), %xmm0
	movaps	%xmm0, -80(%rbp)
	movaps	-80(%rbp), %xmm0
	mulps	-64(%rbp), %xmm0
	movaps	%xmm0, -64(%rbp)
	movaps	-48(%rbp), %xmm0
	haddps	-64(%rbp), %xmm0
	movaps	%xmm0, -80(%rbp)
	movss	-80(%rbp), %xmm1
	movss	-76(%rbp), %xmm0
	addss	%xmm1, %xmm0
	movss	-72(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	-68(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	-8(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -8(%rbp)
	addl	$8, -4(%rbp)
.L2:
	movl	-4(%rbp), %eax
	cmpl	-100(%rbp), %eax
	jl	.L3
	movl	-8(%rbp), %eax
	movl	%eax, -108(%rbp)
	movss	-108(%rbp), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE531:
	.size	v4sf_dot, .-v4sf_dot
	.globl	make_matrix_seq
	.type	make_matrix_seq, @function
make_matrix_seq:
.LFB532:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$48, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movl	%edi, -52(%rbp)
	movl	%esi, -56(%rbp)
	movl	%edx, -60(%rbp)
	movl	%ecx, -64(%rbp)
	movl	-64(%rbp), %eax
	imull	-60(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -40(%rbp)
	movl	$0, -28(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L6
.L9:
	movl	$0, -24(%rbp)
	jmp	.L7
.L8:
	movl	-20(%rbp), %eax
	movl	%eax, %edx
	imull	-64(%rbp), %edx
	movl	-24(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-52(%rbp), %eax
	movl	-28(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, %edx
	sarl	$31, %edx
	idivl	-56(%rbp)
	movl	%edx, %eax
	cvtsi2ss	%eax, %xmm0
	movss	%xmm0, (%rcx)
	addl	$1, -28(%rbp)
	addl	$1, -24(%rbp)
.L7:
	movl	-24(%rbp), %eax
	cmpl	-64(%rbp), %eax
	jl	.L8
	addl	$1, -20(%rbp)
.L6:
	movl	-20(%rbp), %eax
	cmpl	-60(%rbp), %eax
	jl	.L9
	movq	%r12, %rax
	movq	%rbx, %rdx
	addq	$48, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE532:
	.size	make_matrix_seq, .-make_matrix_seq
	.section	.rodata
.LC1:
	.string	"gcc-intrin-test.c"
	.align 8
.LC2:
	.string	"A.N%4==0 && A.M%4==0 && B.N%4==0 && B.M==A.N"
.LC3:
	.string	"C.M==A.M && C.N==B.N"
	.text
	.globl	v4sf_matrix_multiply
	.type	v4sf_matrix_multiply, @function
v4sf_matrix_multiply:
.LFB533:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$88, %rsp
	.cfi_offset 3, -24
	movq	%rcx, %rax
	movq	%r9, %rcx
	movq	%rdi, -48(%rbp)
	movq	%rsi, -40(%rbp)
	movq	%rdx, -64(%rbp)
	movq	%rax, -56(%rbp)
	movq	%r8, -80(%rbp)
	movq	%rcx, -72(%rbp)
	movl	-36(%rbp), %eax
	andl	$3, %eax
	testl	%eax, %eax
	jne	.L11
	movl	-40(%rbp), %eax
	andl	$3, %eax
	testl	%eax, %eax
	jne	.L11
	movl	-52(%rbp), %eax
	andl	$3, %eax
	testl	%eax, %eax
	jne	.L11
	movl	-56(%rbp), %edx
	movl	-36(%rbp), %eax
	cmpl	%eax, %edx
	je	.L12
.L11:
	movl	$__PRETTY_FUNCTION__.4851, %ecx
	movl	$41, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L12:
	movl	-72(%rbp), %edx
	movl	-40(%rbp), %eax
	cmpl	%eax, %edx
	jne	.L13
	movl	-68(%rbp), %edx
	movl	-52(%rbp), %eax
	cmpl	%eax, %edx
	je	.L14
.L13:
	movl	$__PRETTY_FUNCTION__.4851, %ecx
	movl	$42, %edx
	movl	$.LC1, %esi
	movl	$.LC3, %edi
	call	__assert_fail
.L14:
	movl	$0, -20(%rbp)
	jmp	.L15
.L18:
	movl	$0, -24(%rbp)
	jmp	.L16
.L17:
	movq	-80(%rbp), %rdx
	movl	-52(%rbp), %eax
	movl	%eax, %ecx
	imull	-20(%rbp), %ecx
	movl	-24(%rbp), %eax
	addl	%ecx, %eax
	cltq
	salq	$2, %rax
	leaq	(%rdx,%rax), %rbx
	movl	-52(%rbp), %edx
	movl	-40(%rbp), %eax
	movq	-64(%rbp), %rcx
	movl	-24(%rbp), %esi
	movslq	%esi, %rsi
	salq	$2, %rsi
	addq	%rcx, %rsi
	movq	-48(%rbp), %rdi
	movl	-40(%rbp), %ecx
	imull	-20(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rdi
	movl	%edx, %ecx
	movl	%eax, %edx
	call	v4sf_dot
	movss	%xmm0, -84(%rbp)
	movl	-84(%rbp), %eax
	movl	%eax, (%rbx)
	addl	$1, -24(%rbp)
.L16:
	movl	-52(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jg	.L17
	addl	$1, -20(%rbp)
.L15:
	movl	-40(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jg	.L18
	addq	$88, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE533:
	.size	v4sf_matrix_multiply, .-v4sf_matrix_multiply
	.globl	test
	.type	test, @function
test:
.LFB534:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movss	%xmm0, -68(%rbp)
	movss	%xmm1, -72(%rbp)
	movss	%xmm2, -76(%rbp)
	movss	%xmm3, -80(%rbp)
	movq	%rdi, -88(%rbp)
	movss	-80(%rbp), %xmm0
	movss	-76(%rbp), %xmm1
	movaps	%xmm1, %xmm2
	unpcklps	%xmm0, %xmm2
	movaps	%xmm2, %xmm0
	movss	-72(%rbp), %xmm1
	movss	-68(%rbp), %xmm2
	movaps	%xmm2, %xmm3
	unpcklps	%xmm1, %xmm3
	movaps	%xmm3, %xmm1
	movaps	%xmm1, %xmm2
	movlhps	%xmm0, %xmm2
	movaps	%xmm2, %xmm0
	movaps	%xmm0, -16(%rbp)
	movq	-88(%rbp), %rax
	movups	(%rax), %xmm0
	movaps	%xmm0, -32(%rbp)
	movaps	.LC4(%rip), %xmm0
	movaps	%xmm0, -48(%rbp)
	movaps	.LC5(%rip), %xmm0
	movaps	%xmm0, -64(%rbp)
	movaps	-32(%rbp), %xmm0
	movaps	-16(%rbp), %xmm1
	mulps	%xmm1, %xmm0
	movaps	%xmm0, -16(%rbp)
	movaps	-32(%rbp), %xmm0
	movaps	-16(%rbp), %xmm1
	mulps	%xmm1, %xmm0
	movaps	%xmm0, -32(%rbp)
	movaps	-48(%rbp), %xmm0
	movaps	-32(%rbp), %xmm1
	mulps	%xmm1, %xmm0
	movaps	%xmm0, -48(%rbp)
	movaps	-64(%rbp), %xmm0
	movaps	-48(%rbp), %xmm1
	mulps	%xmm1, %xmm0
	movaps	%xmm0, -64(%rbp)
	movaps	-64(%rbp), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE534:
	.size	test, .-test
	.section	.rodata
.LC14:
	.string	"%f,%f,%f,%f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB535:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	.LC6(%rip), %eax
	movl	%eax, -16(%rbp)
	movl	.LC7(%rip), %eax
	movl	%eax, -12(%rbp)
	movl	.LC8(%rip), %eax
	movl	%eax, -8(%rbp)
	movl	.LC9(%rip), %eax
	movl	%eax, -4(%rbp)
	leaq	-16(%rbp), %rax
	movq	%rax, %rdi
	movss	.LC10(%rip), %xmm3
	movss	.LC11(%rip), %xmm2
	movss	.LC12(%rip), %xmm1
	movss	.LC13(%rip), %xmm0
	call	test
	movaps	%xmm0, -32(%rbp)
	movss	-20(%rbp), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm3
	movss	-24(%rbp), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm2
	movss	-28(%rbp), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm1
	movss	-32(%rbp), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movl	$.LC14, %edi
	movl	$4, %eax
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE535:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC15:
	.string	"A.N==B.M && C.M==A.M && C.N==B.N"
	.text
	.globl	mat_mult
	.type	mat_mult, @function
mat_mult:
.LFB536:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rcx, %rax
	movq	%r9, %rcx
	movq	%rdi, -32(%rbp)
	movq	%rsi, -24(%rbp)
	movq	%rdx, -48(%rbp)
	movq	%rax, -40(%rbp)
	movq	%r8, -64(%rbp)
	movq	%rcx, -56(%rbp)
	movl	-20(%rbp), %edx
	movl	-40(%rbp), %eax
	cmpl	%eax, %edx
	jne	.L23
	movl	-56(%rbp), %edx
	movl	-24(%rbp), %eax
	cmpl	%eax, %edx
	jne	.L23
	movl	-52(%rbp), %edx
	movl	-36(%rbp), %eax
	cmpl	%eax, %edx
	je	.L24
.L23:
	movl	$__PRETTY_FUNCTION__.4884, %ecx
	movl	$69, %edx
	movl	$.LC1, %esi
	movl	$.LC15, %edi
	call	__assert_fail
.L24:
	movl	$0, -4(%rbp)
	jmp	.L25
.L30:
	movl	$0, -8(%rbp)
	jmp	.L26
.L29:
	movl	$0, -12(%rbp)
	jmp	.L27
.L28:
	movq	-64(%rbp), %rdx
	movl	-24(%rbp), %eax
	movl	%eax, %ecx
	imull	-4(%rbp), %ecx
	movl	-8(%rbp), %eax
	addl	%ecx, %eax
	cltq
	salq	$2, %rax
	addq	%rax, %rdx
	movq	-64(%rbp), %rcx
	movl	-24(%rbp), %eax
	movl	%eax, %esi
	imull	-4(%rbp), %esi
	movl	-8(%rbp), %eax
	addl	%esi, %eax
	cltq
	salq	$2, %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm1
	movq	-32(%rbp), %rcx
	movl	-20(%rbp), %eax
	movl	%eax, %esi
	imull	-4(%rbp), %esi
	movl	-12(%rbp), %eax
	addl	%esi, %eax
	cltq
	salq	$2, %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm2
	movq	-48(%rbp), %rcx
	movl	-36(%rbp), %eax
	movl	%eax, %esi
	imull	-12(%rbp), %esi
	movl	-8(%rbp), %eax
	addl	%esi, %eax
	cltq
	salq	$2, %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm0
	mulss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, (%rdx)
	addl	$1, -12(%rbp)
.L27:
	movl	-20(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jg	.L28
	addl	$1, -8(%rbp)
.L26:
	movl	-36(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jg	.L29
	addl	$1, -4(%rbp)
.L25:
	movl	-24(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jg	.L30
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE536:
	.size	mat_mult, .-mat_mult
	.section	.rodata
	.align 8
.LC16:
	.string	"A.N%4==0 && B.N%4==0 && A.M%4==0"
	.text
	.globl	mat_mult_v4sf
	.type	mat_mult_v4sf, @function
mat_mult_v4sf:
.LFB537:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movq	%rcx, %rax
	movq	%r9, %rcx
	movq	%rdi, -80(%rbp)
	movq	%rsi, -72(%rbp)
	movq	%rdx, -96(%rbp)
	movq	%rax, -88(%rbp)
	movq	%r8, -112(%rbp)
	movq	%rcx, -104(%rbp)
	movl	-68(%rbp), %edx
	movl	-88(%rbp), %eax
	cmpl	%eax, %edx
	jne	.L32
	movl	-104(%rbp), %edx
	movl	-72(%rbp), %eax
	cmpl	%eax, %edx
	jne	.L32
	movl	-100(%rbp), %edx
	movl	-84(%rbp), %eax
	cmpl	%eax, %edx
	je	.L33
.L32:
	movl	$__PRETTY_FUNCTION__.4905, %ecx
	movl	$81, %edx
	movl	$.LC1, %esi
	movl	$.LC15, %edi
	call	__assert_fail
.L33:
	movl	-68(%rbp), %eax
	andl	$3, %eax
	testl	%eax, %eax
	jne	.L34
	movl	-84(%rbp), %eax
	andl	$3, %eax
	testl	%eax, %eax
	jne	.L34
	movl	-72(%rbp), %eax
	andl	$3, %eax
	testl	%eax, %eax
	je	.L35
.L34:
	movl	$__PRETTY_FUNCTION__.4905, %ecx
	movl	$82, %edx
	movl	$.LC1, %esi
	movl	$.LC16, %edi
	call	__assert_fail
.L35:
	movl	$0, -4(%rbp)
	jmp	.L36
.L41:
	movl	$0, -8(%rbp)
	jmp	.L37
.L40:
	movl	$0, -12(%rbp)
	jmp	.L38
.L39:
	movq	-80(%rbp), %rdx
	movl	-68(%rbp), %eax
	imull	-4(%rbp), %eax
	movslq	%eax, %rcx
	movl	-12(%rbp), %eax
	cltq
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movups	(%rax), %xmm0
	movaps	%xmm0, -32(%rbp)
	movq	-96(%rbp), %rdx
	movl	-84(%rbp), %eax
	imull	-12(%rbp), %eax
	movslq	%eax, %rcx
	movl	-8(%rbp), %eax
	cltq
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm2
	movq	-96(%rbp), %rax
	movl	-12(%rbp), %edx
	leal	1(%rdx), %ecx
	movl	-84(%rbp), %edx
	imull	%ecx, %edx
	movslq	%edx, %rcx
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	movq	-96(%rbp), %rax
	movl	-12(%rbp), %edx
	leal	2(%rdx), %ecx
	movl	-84(%rbp), %edx
	imull	%ecx, %edx
	movslq	%edx, %rcx
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm3
	movq	-96(%rbp), %rax
	movl	-12(%rbp), %edx
	leal	3(%rdx), %ecx
	movl	-84(%rbp), %edx
	imull	%ecx, %edx
	movslq	%edx, %rcx
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	movaps	%xmm3, %xmm4
	unpcklps	%xmm0, %xmm4
	movaps	%xmm4, %xmm0
	movaps	%xmm2, %xmm3
	unpcklps	%xmm1, %xmm3
	movaps	%xmm3, %xmm1
	movaps	%xmm1, %xmm4
	movlhps	%xmm0, %xmm4
	movaps	%xmm4, %xmm0
	movaps	%xmm0, -48(%rbp)
	movaps	-48(%rbp), %xmm0
	movaps	-32(%rbp), %xmm1
	mulps	%xmm1, %xmm0
	movaps	%xmm0, -64(%rbp)
	movq	-112(%rbp), %rdx
	movl	-72(%rbp), %eax
	movl	%eax, %ecx
	imull	-4(%rbp), %ecx
	movl	-8(%rbp), %eax
	addl	%ecx, %eax
	cltq
	salq	$2, %rax
	addq	%rax, %rdx
	movq	-112(%rbp), %rcx
	movl	-72(%rbp), %eax
	movl	%eax, %esi
	imull	-4(%rbp), %esi
	movl	-8(%rbp), %eax
	addl	%esi, %eax
	cltq
	salq	$2, %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm1
	movss	-64(%rbp), %xmm2
	movss	-60(%rbp), %xmm0
	addss	%xmm2, %xmm0
	movss	-56(%rbp), %xmm2
	addss	%xmm2, %xmm0
	movss	-52(%rbp), %xmm2
	addss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, (%rdx)
	addl	$4, -12(%rbp)
.L38:
	movl	-68(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jg	.L39
	addl	$1, -8(%rbp)
.L37:
	movl	-84(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jg	.L40
	addl	$1, -4(%rbp)
.L36:
	movl	-72(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jg	.L41
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE537:
	.size	mat_mult_v4sf, .-mat_mult_v4sf
	.globl	compare
	.type	compare, @function
compare:
.LFB538:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$352, %rsp
	movaps	.LC17(%rip), %xmm0
	movaps	%xmm0, -16(%rbp)
	movaps	.LC18(%rip), %xmm0
	movaps	%xmm0, -32(%rbp)
	movaps	-16(%rbp), %xmm0
	cmpeqps	-32(%rbp), %xmm0
	movaps	%xmm0, -48(%rbp)
	movaps	-16(%rbp), %xmm0
	cmpltps	-32(%rbp), %xmm0
	movaps	%xmm0, -64(%rbp)
	movaps	-16(%rbp), %xmm0
	cmpleps	-32(%rbp), %xmm0
	movaps	%xmm0, -80(%rbp)
	movaps	-32(%rbp), %xmm0
	cmpltps	-16(%rbp), %xmm0
	movaps	%xmm0, -96(%rbp)
	movaps	-32(%rbp), %xmm0
	cmpleps	-16(%rbp), %xmm0
	movaps	%xmm0, -112(%rbp)
	movaps	-16(%rbp), %xmm0
	cmpunordps	-32(%rbp), %xmm0
	movaps	%xmm0, -128(%rbp)
	movaps	-16(%rbp), %xmm0
	cmpneqps	-32(%rbp), %xmm0
	movaps	%xmm0, -144(%rbp)
	movaps	-16(%rbp), %xmm0
	cmpnltps	-32(%rbp), %xmm0
	movaps	%xmm0, -160(%rbp)
	movaps	-16(%rbp), %xmm0
	cmpnleps	-32(%rbp), %xmm0
	movaps	%xmm0, -176(%rbp)
	movaps	-32(%rbp), %xmm0
	cmpnltps	-16(%rbp), %xmm0
	movaps	%xmm0, -192(%rbp)
	movaps	-32(%rbp), %xmm0
	cmpnleps	-16(%rbp), %xmm0
	movaps	%xmm0, -208(%rbp)
	movaps	-16(%rbp), %xmm0
	cmpordps	-32(%rbp), %xmm0
	movaps	%xmm0, -224(%rbp)
	movaps	-16(%rbp), %xmm0
	cmpeqss	-32(%rbp), %xmm0
	movaps	%xmm0, -240(%rbp)
	movaps	-16(%rbp), %xmm0
	cmpltss	-32(%rbp), %xmm0
	movaps	%xmm0, -256(%rbp)
	movaps	-16(%rbp), %xmm0
	cmpless	-32(%rbp), %xmm0
	movaps	%xmm0, -272(%rbp)
	movaps	-16(%rbp), %xmm0
	cmpunordss	-32(%rbp), %xmm0
	movaps	%xmm0, -288(%rbp)
	movaps	-16(%rbp), %xmm0
	cmpneqss	-32(%rbp), %xmm0
	movaps	%xmm0, -304(%rbp)
	movaps	-32(%rbp), %xmm1
	movaps	-16(%rbp), %xmm0
	movl	$2, %eax
	call	__builtin_ia32_cmpnlts
	movl	%eax, -308(%rbp)
	movaps	-16(%rbp), %xmm0
	cmpnless	-32(%rbp), %xmm0
	movaps	%xmm0, -336(%rbp)
	movaps	-16(%rbp), %xmm0
	cmpordss	-32(%rbp), %xmm0
	movaps	%xmm0, -352(%rbp)
	movl	$5, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE538:
	.size	compare, .-compare
	.section	.rodata
	.type	__PRETTY_FUNCTION__.4905, @object
	.size	__PRETTY_FUNCTION__.4905, 14
__PRETTY_FUNCTION__.4905:
	.string	"mat_mult_v4sf"
	.type	__PRETTY_FUNCTION__.4884, @object
	.size	__PRETTY_FUNCTION__.4884, 9
__PRETTY_FUNCTION__.4884:
	.string	"mat_mult"
	.align 16
	.type	__PRETTY_FUNCTION__.4851, @object
	.size	__PRETTY_FUNCTION__.4851, 21
__PRETTY_FUNCTION__.4851:
	.string	"v4sf_matrix_multiply"
	.align 4
.LC0:
	.long	0
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
	.align 4
.LC6:
	.long	1065353216
	.align 4
.LC7:
	.long	1073741824
	.align 4
.LC8:
	.long	1077936128
	.align 4
.LC9:
	.long	1082130432
	.align 4
.LC10:
	.long	1090519040
	.align 4
.LC11:
	.long	1088421888
	.align 4
.LC12:
	.long	1086324736
	.align 4
.LC13:
	.long	1084227584
	.align 16
.LC17:
	.long	1065353216
	.long	1073741824
	.long	1077936128
	.long	1082130432
	.align 16
.LC18:
	.long	1073741824
	.long	1065353216
	.long	1077936128
	.long	1082130432
	.ident	"GCC: (GNU) 4.7.2 20121109 (Red Hat 4.7.2-8)"
	.section	.note.GNU-stack,"",@progbits
