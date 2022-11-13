	.file	"polindromChecker.c"
	.intel_syntax noprefix
	.text
	.globl	IsPolidrom
	.type	IsPolidrom, @function
IsPolidrom:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -28[rbp], esi
	mov	DWORD PTR -4[rbp], 0
	jmp	.L2
.L5:
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	edx, BYTE PTR [rax]
	mov	eax, DWORD PTR -28[rbp]
	sub	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rcx, -1[rax]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rcx
	movzx	eax, BYTE PTR [rax]
	cmp	dl, al
	je	.L3
	mov	eax, 0
	jmp	.L4
.L3:
	add	DWORD PTR -4[rbp], 1
.L2:
	mov	eax, DWORD PTR -28[rbp]
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	cmp	DWORD PTR -4[rbp], eax
	jl	.L5
	mov	eax, 1
.L4:
	pop	rbp
	ret
	.size	IsPolidrom, .-IsPolidrom
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
