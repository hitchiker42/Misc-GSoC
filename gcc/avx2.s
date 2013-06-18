	.file	"temp.c"
	.text
	.globl	add
	.type	add, @function
add:
.LFB1022:
	.cfi_startproc
	vmovd	24(%rdi), %xmm5
	vpinsrd	$1, 28(%rdi), %xmm5, %xmm2
	vmovd	16(%rdi), %xmm6
	vpinsrd	$1, 20(%rdi), %xmm6, %xmm0
	vmovd	8(%rdi), %xmm7
	vpinsrd	$1, 12(%rdi), %xmm7, %xmm1
	vmovd	(%rdi), %xmm4
	vpinsrd	$1, 4(%rdi), %xmm4, %xmm3
	vpunpcklqdq	%xmm1, %xmm3, %xmm1
	vpunpcklqdq	%xmm2, %xmm0, %xmm0
	vinserti128	$0x1, %xmm0, %ymm1, %ymm1
	vmovd	24(%rsi), %xmm5
	vpinsrd	$1, 28(%rsi), %xmm5, %xmm3
	vmovd	16(%rsi), %xmm6
	vpinsrd	$1, 20(%rsi), %xmm6, %xmm0
	vmovd	8(%rsi), %xmm7
	vpinsrd	$1, 12(%rsi), %xmm7, %xmm2
	vmovd	(%rsi), %xmm4
	vpinsrd	$1, 4(%rsi), %xmm4, %xmm4
	vpunpcklqdq	%xmm2, %xmm4, %xmm2
	vpunpcklqdq	%xmm3, %xmm0, %xmm0
	vinserti128	$0x1, %xmm0, %ymm2, %ymm0
	vpaddd	%ymm0, %ymm1, %ymm0
	ret
	.cfi_endproc
.LFE1022:
	.size	add, .-add
	.ident	"GCC: (GNU) 4.8.1"
	.section	.note.GNU-stack,"",@progbits
