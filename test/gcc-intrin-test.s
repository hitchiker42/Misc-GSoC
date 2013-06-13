	.file	"gcc-intrin-test.c"
	.text
	.globl	v4sf_dot
	.type	v4sf_dot, @function
v4sf_dot:
.LFB672:
	.cfi_startproc
	testl	%edx, %edx
	jle	.L4
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
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
	leal	0(,%rcx,8), %r11d
	leal	0(,%rcx,4), %r8d
	movl	%ecx, %r9d
	leal	(%rcx,%rcx), %ebx
	movl	%r11d, %r15d
	subl	%ecx, %r15d
	movl	$0, %eax
	xorps	%xmm0, %xmm0
	movl	$0, %ecx
.L3:
	movslq	%ecx, %r10
	movups	(%rdi,%r10,4), %xmm3
	movslq	%eax, %r12
	leal	(%rax,%r9), %ebp
	movslq	%ebp, %rbp
	leal	(%rax,%rbx), %r14d
	movslq	%r14d, %r14
	movl	%r8d, %r13d
	subl	%r9d, %r13d
	movslq	%r13d, %r13
	movss	(%rsi,%r14,4), %xmm2
	insertps	$0x10, (%rsi,%r13,4), %xmm2
	movss	(%rsi,%r12,4), %xmm1
	insertps	$0x10, (%rsi,%rbp,4), %xmm1
	movlhps	%xmm2, %xmm1
	movslq	%r8d, %r12
	leal	(%r8,%r9), %ebp
	movslq	%ebp, %rbp
	leal	(%r8,%rbx), %r14d
	movslq	%r14d, %r14
	leal	(%rax,%r15), %r13d
	movslq	%r13d, %r13
	movss	(%rsi,%r14,4), %xmm4
	insertps	$0x10, (%rsi,%r13,4), %xmm4
	movss	(%rsi,%r12,4), %xmm2
	insertps	$0x10, (%rsi,%rbp,4), %xmm2
	movlhps	%xmm4, %xmm2
	mulps	%xmm3, %xmm1
	movups	16(%rdi,%r10,4), %xmm3
	mulps	%xmm3, %xmm2
	haddps	%xmm2, %xmm1
	movaps	%xmm1, %xmm3
	movaps	%xmm1, %xmm4
	shufps	$85, %xmm1, %xmm4
	movaps	%xmm4, %xmm2
	addss	%xmm2, %xmm3
	movaps	%xmm1, %xmm4
	unpckhps	%xmm1, %xmm4
	movaps	%xmm4, %xmm2
	addss	%xmm2, %xmm3
	shufps	$255, %xmm1, %xmm1
	movaps	%xmm1, %xmm2
	movaps	%xmm3, %xmm1
	addss	%xmm2, %xmm1
	addss	%xmm1, %xmm0
	addl	$8, %ecx
	addl	%r11d, %eax
	addl	%r11d, %r8d
	cmpl	%ecx, %edx
	jg	.L3
	jmp	.L2
.L4:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	xorps	%xmm0, %xmm0
	ret
.L2:
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_restore 13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_restore 14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_restore 15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE672:
	.size	v4sf_dot, .-v4sf_dot
	.globl	make_matrix_seq
	.type	make_matrix_seq, @function
make_matrix_seq:
.LFB673:
	.cfi_startproc
	movl	$0, %esi
	testl	%edx, %edx
	jg	.L15
	jmp	.L19
.L16:
	addl	$1, %eax
	cmpl	%ecx, %eax
	jne	.L16
.L14:
	addl	$1, %esi
	cmpl	%edx, %esi
	je	.L19
.L15:
	movl	$0, %eax
	testl	%ecx, %ecx
	jg	.L16
	jmp	.L14
.L19:
	movl	$0, %eax
	movl	$0, %edx
	ret
	.cfi_endproc
.LFE673:
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
	.globl	v4sf_matrix_multiply
	.type	v4sf_matrix_multiply, @function
v4sf_matrix_multiply:
.LFB674:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
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
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movq	%rdi, 48(%rsp)
	movq	%rsi, 56(%rsp)
	movq	%rdx, 32(%rsp)
	movq	%rcx, 40(%rsp)
	movq	%r8, 16(%rsp)
	movq	%r9, 24(%rsp)
	shrq	$32, %rcx
	movabsq	$12884901891, %rax
	testq	%rsi, %rax
	jne	.L21
	testb	$3, %cl
	jne	.L21
	movl	60(%rsp), %eax
	cmpl	%eax, 40(%rsp)
	je	.L22
.L21:
	movl	$__PRETTY_FUNCTION__.5547, %ecx
	movl	$41, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L22:
	movl	%esi, %r14d
	cmpl	24(%rsp), %esi
	jne	.L23
	movl	28(%rsp), %ebp
	cmpl	%ecx, %ebp
	jne	.L23
	testl	%esi, %esi
	jle	.L20
	movl	%ebp, 8(%rsp)
	movl	%esi, 12(%rsp)
	movl	$0, 4(%rsp)
	movl	$0, %r13d
	movl	$0, (%rsp)
	jmp	.L25
.L23:
	movl	$__PRETTY_FUNCTION__.5547, %ecx
	movl	$42, %edx
	movl	$.LC1, %esi
	movl	$.LC3, %edi
	call	__assert_fail
.L26:
	leal	0(%r13,%rbx), %edx
	movslq	%edx, %rdx
	movq	16(%rsp), %rax
	leaq	(%rax,%rdx,4), %r12
	movq	32(%rsp), %rax
	leaq	(%rax,%rbx,4), %rsi
	movq	48(%rsp), %rdi
	addq	%r15, %rdi
	movl	%ebp, %ecx
	movl	%r14d, %edx
	call	v4sf_dot
	movss	%xmm0, (%r12)
	addq	$1, %rbx
	cmpl	%ebx, %ebp
	jg	.L26
.L27:
	addl	$1, (%rsp)
	addl	8(%rsp), %r13d
	movl	12(%rsp), %eax
	addl	%eax, 4(%rsp)
	cmpl	%r14d, (%rsp)
	je	.L20
.L25:
	testl	%ebp, %ebp
	jle	.L27
	movslq	4(%rsp), %r15
	salq	$2, %r15
	movl	$0, %ebx
	jmp	.L26
.L20:
	addq	$72, %rsp
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
	.cfi_endproc
.LFE674:
	.size	v4sf_matrix_multiply, .-v4sf_matrix_multiply
	.globl	test
	.type	test, @function
test:
.LFB675:
	.cfi_startproc
	unpcklps	%xmm3, %xmm2
	unpcklps	%xmm1, %xmm0
	movlhps	%xmm2, %xmm0
	movups	(%rdi), %xmm1
	mulps	%xmm1, %xmm0
	mulps	%xmm1, %xmm0
	mulps	.LC4(%rip), %xmm0
	mulps	.LC5(%rip), %xmm0
	ret
	.cfi_endproc
.LFE675:
	.size	test, .-test
	.section	.rodata.str1.1
.LC14:
	.string	"%f,%f,%f,%f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB676:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$0x3f800000, (%rsp)
	movl	$0x40000000, 4(%rsp)
	movl	$0x40400000, 8(%rsp)
	movl	$0x40800000, 12(%rsp)
	movq	%rsp, %rdi
	movss	.LC10(%rip), %xmm3
	movss	.LC11(%rip), %xmm2
	movss	.LC12(%rip), %xmm1
	movss	.LC13(%rip), %xmm0
	call	test
	movaps	%xmm0, %xmm1
	shufps	$255, %xmm0, %xmm1
	movaps	%xmm1, %xmm3
	movaps	%xmm0, %xmm4
	unpckhps	%xmm0, %xmm4
	movaps	%xmm4, %xmm2
	movaps	%xmm0, %xmm4
	shufps	$85, %xmm0, %xmm4
	movaps	%xmm4, %xmm1
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	unpcklps	%xmm3, %xmm3
	cvtps2pd	%xmm3, %xmm3
	unpcklps	%xmm2, %xmm2
	cvtps2pd	%xmm2, %xmm2
	unpcklps	%xmm1, %xmm1
	cvtps2pd	%xmm1, %xmm1
	movl	$.LC14, %edi
	movl	$4, %eax
	call	printf
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE676:
	.size	main, .-main
	.section	.rodata.str1.8
	.align 8
.LC15:
	.string	"A.N==B.M && C.M==A.M && C.N==B.N"
	.text
	.globl	mat_mult
	.type	mat_mult, @function
mat_mult:
.LFB677:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
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
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movq	%rdi, 48(%rsp)
	movq	%rsi, %rax
	shrq	$32, %rax
	movq	%rsi, 56(%rsp)
	movq	%rdx, 32(%rsp)
	movq	%rcx, 40(%rsp)
	movq	%r8, 16(%rsp)
	movq	%r9, 24(%rsp)
	movq	%rcx, %rdx
	shrq	$32, %rdx
	movl	%ecx, %r14d
	cmpl	%eax, %ecx
	jne	.L34
	movl	24(%rsp), %eax
	movl	%eax, 8(%rsp)
	cmpl	%esi, %eax
	jne	.L34
	movl	28(%rsp), %r12d
	cmpl	%edx, %r12d
	jne	.L34
	testl	%eax, %eax
	jle	.L33
	movq	%r8, %r15
	movq	%rdi, %r11
	movq	32(%rsp), %r10
	movl	%ecx, 4(%rsp)
	movl	%eax, 12(%rsp)
	movl	$0, %r13d
	movl	$0, %ebp
	movl	$0, (%rsp)
	movl	%r12d, %r9d
	jmp	.L36
.L34:
	movl	$__PRETTY_FUNCTION__.5580, %ecx
	movl	$69, %edx
	movl	$.LC1, %esi
	movl	$.LC15, %edi
	call	__assert_fail
.L37:
	movslq	%eax, %rdi
	movslq	%edx, %rsi
	movss	(%r11,%rdi,4), %xmm0
	mulss	(%r10,%rsi,4), %xmm0
	addss	(%rcx), %xmm0
	movss	%xmm0, (%rcx)
	addl	$1, %eax
	addl	%r9d, %edx
	cmpl	%r8d, %eax
	jne	.L37
.L39:
	addl	$1, %ebx
	cmpl	%r12d, %ebx
	je	.L38
.L43:
	testl	%r14d, %r14d
	jle	.L39
	movl	%ebx, %edx
	leal	(%rbx,%r13), %eax
	cltq
	leaq	(%r15,%rax,4), %rcx
	movl	%ebp, %eax
	jmp	.L37
.L38:
	addl	$1, (%rsp)
	addl	4(%rsp), %ebp
	addl	12(%rsp), %r13d
	movl	8(%rsp), %eax
	cmpl	%eax, (%rsp)
	je	.L33
.L36:
	movl	$0, %ebx
	movl	4(%rsp), %r8d
	addl	%ebp, %r8d
	testl	%r12d, %r12d
	jg	.L43
	jmp	.L38
.L33:
	addq	$72, %rsp
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
	.cfi_endproc
.LFE677:
	.size	mat_mult, .-mat_mult
	.section	.rodata.str1.8
	.align 8
.LC16:
	.string	"A.N%4==0 && B.N%4==0 && A.M%4==0"
	.text
	.globl	mat_mult_v4sf
	.type	mat_mult_v4sf, @function
mat_mult_v4sf:
.LFB678:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
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
	movq	%rdi, 64(%rsp)
	movq	%rsi, %rax
	shrq	$32, %rax
	movq	%rsi, 72(%rsp)
	movq	%rdx, 48(%rsp)
	movq	%rcx, 56(%rsp)
	movq	%r8, 32(%rsp)
	movq	%r9, 40(%rsp)
	movq	%rdx, %rdi
	movq	%rcx, %rdx
	shrq	$32, %rdx
	movl	%ecx, %r12d
	cmpl	%eax, %ecx
	jne	.L48
	movl	40(%rsp), %eax
	movl	%eax, 20(%rsp)
	cmpl	%esi, %eax
	jne	.L48
	movl	44(%rsp), %eax
	movl	%eax, 4(%rsp)
	cmpl	%edx, %eax
	je	.L49
.L48:
	movl	$__PRETTY_FUNCTION__.5601, %ecx
	movl	$81, %edx
	movl	$.LC1, %esi
	movl	$.LC15, %edi
	call	__assert_fail
.L49:
	testb	$3, %cl
	jne	.L50
	movl	4(%rsp), %eax
	orl	20(%rsp), %eax
	testb	$3, %al
	jne	.L50
	cmpl	$0, 20(%rsp)
	jle	.L47
	movl	%ecx, 24(%rsp)
	movl	20(%rsp), %eax
	movl	%eax, 28(%rsp)
	movl	4(%rsp), %r9d
	sall	$2, %r9d
	movl	4(%rsp), %eax
	movl	%eax, 8(%rsp)
	movl	%eax, %r8d
	addl	%r8d, %r8d
	movl	$0, %r15d
	movl	$0, 12(%rsp)
	movl	$0, 16(%rsp)
	jmp	.L52
.L50:
	movl	$__PRETTY_FUNCTION__.5601, %ecx
	movl	$82, %edx
	movl	$.LC1, %esi
	movl	$.LC16, %edi
	call	__assert_fail
.L53:
	movslq	%edx, %r11
	addq	%r14, %r11
	movq	64(%rsp), %r10
	movups	(%r10,%r11,4), %xmm1
	movslq	%ecx, %r11
	addq	%rax, %r11
	movslq	%esi, %r10
	addq	%rax, %r10
	leal	(%rcx,%r8), %ebp
	movslq	%ebp, %rbp
	addq	%rax, %rbp
	leal	(%rsi,%r8), %ebx
	movslq	%ebx, %rbx
	addq	%rax, %rbx
	movss	(%rdi,%rbp,4), %xmm2
	insertps	$0x10, (%rdi,%rbx,4), %xmm2
	movss	(%rdi,%r11,4), %xmm0
	insertps	$0x10, (%rdi,%r10,4), %xmm0
	movlhps	%xmm2, %xmm0
	mulps	%xmm1, %xmm0
	movq	32(%rsp), %r10
	addq	%r13, %r10
	movaps	%xmm0, %xmm2
	movaps	%xmm0, %xmm3
	shufps	$85, %xmm0, %xmm3
	movaps	%xmm3, %xmm1
	addss	%xmm1, %xmm2
	movaps	%xmm0, %xmm3
	unpckhps	%xmm0, %xmm3
	movaps	%xmm3, %xmm1
	addss	%xmm1, %xmm2
	shufps	$255, %xmm0, %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	addss	(%r10), %xmm0
	movss	%xmm0, (%r10)
	addl	$4, %edx
	addl	%r9d, %ecx
	addl	%r9d, %esi
	cmpl	%edx, %r12d
	jg	.L53
.L55:
	addq	$1, %rax
	cmpl	%eax, 4(%rsp)
	jle	.L54
.L56:
	testl	%r12d, %r12d
	jle	.L55
	leal	(%r15,%rax), %r13d
	movslq	%r13d, %r13
	salq	$2, %r13
	movl	8(%rsp), %esi
	movl	$0, %ecx
	movl	$0, %edx
	jmp	.L53
.L54:
	addl	$1, 16(%rsp)
	movl	24(%rsp), %eax
	addl	%eax, 12(%rsp)
	addl	28(%rsp), %r15d
	movl	20(%rsp), %eax
	cmpl	%eax, 16(%rsp)
	je	.L47
.L52:
	cmpl	$0, 4(%rsp)
	jle	.L54
	movslq	12(%rsp), %r14
	movl	$0, %eax
	jmp	.L56
.L47:
	addq	$88, %rsp
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
	.cfi_endproc
.LFE678:
	.size	mat_mult_v4sf, .-mat_mult_v4sf
	.globl	compare
	.type	compare, @function
compare:
.LFB679:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movaps	.LC17(%rip), %xmm1
	movaps	.LC18(%rip), %xmm0
	movl	$2, %eax
	call	__builtin_ia32_cmpnlts
	movl	$5, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE679:
	.size	compare, .-compare
	.section	.rodata
	.align 16
	.type	__PRETTY_FUNCTION__.5547, @object
	.size	__PRETTY_FUNCTION__.5547, 21
__PRETTY_FUNCTION__.5547:
	.string	"v4sf_matrix_multiply"
	.type	__PRETTY_FUNCTION__.5580, @object
	.size	__PRETTY_FUNCTION__.5580, 9
__PRETTY_FUNCTION__.5580:
	.string	"mat_mult"
	.type	__PRETTY_FUNCTION__.5601, @object
	.size	__PRETTY_FUNCTION__.5601, 14
__PRETTY_FUNCTION__.5601:
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
	.section	.rodata.cst4,"aM",@progbits,4
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
	.section	.rodata.cst16
	.align 16
.LC17:
	.long	1073741824
	.long	1065353216
	.long	1077936128
	.long	1082130432
	.align 16
.LC18:
	.long	1065353216
	.long	1073741824
	.long	1077936128
	.long	1082130432
	.ident	"GCC: (GNU) 4.7.2 20121109 (Red Hat 4.7.2-8)"
	.section	.note.GNU-stack,"",@progbits
