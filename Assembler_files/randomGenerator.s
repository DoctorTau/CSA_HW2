	.file	"randomGenerator.c"
	.intel_syntax noprefix
	.text
	.globl	GenerateRandomString
	.type	GenerateRandomString, @function
GenerateRandomString:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -28[rbp], esi
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	mov	DWORD PTR -4[rbp], 0
	jmp	.L2
.L3:
	call	rand@PLT
	movsx	rdx, eax
	imul	rdx, rdx, 1321528399
	shr	rdx, 32
	mov	ecx, edx
	sar	ecx, 3
	cdq
	sub	ecx, edx
	mov	edx, ecx
	imul	edx, edx, 26
	sub	eax, edx
	mov	edx, eax
	mov	eax, edx
	lea	ecx, 97[rax]
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	edx, ecx
	mov	BYTE PTR [rax], dl
	add	DWORD PTR -4[rbp], 1
.L2:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -28[rbp]
	jl	.L3
	mov	eax, DWORD PTR -28[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	nop
	leave
	ret
	.size	GenerateRandomString, .-GenerateRandomString
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
