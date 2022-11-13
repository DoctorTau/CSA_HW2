	.file	"fileReader.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"Error opening file"
	.text
	.globl	ReadFromFile
	.type	ReadFromFile, @function
ReadFromFile:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	QWORD PTR -40[rbp], rdi
	mov	QWORD PTR -48[rbp], rsi
	mov	rax, QWORD PTR -48[rbp]
	lea	rsi, .LC0[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax
	cmp	QWORD PTR -16[rbp], 0
	jne	.L2
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	printf@PLT
	mov	edi, 1
	call	exit@PLT
.L2:
	mov	DWORD PTR -4[rbp], 0
	jmp	.L3
.L4:
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -40[rbp]
	add	rdx, rax
	movzx	eax, BYTE PTR -17[rbp]
	mov	BYTE PTR [rdx], al
	add	DWORD PTR -4[rbp], 1
.L3:
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	fgetc@PLT
	mov	BYTE PTR -17[rbp], al
	cmp	BYTE PTR -17[rbp], -1
	jne	.L4
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	eax, DWORD PTR -4[rbp]
	leave
	ret
	.size	ReadFromFile, .-ReadFromFile
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
