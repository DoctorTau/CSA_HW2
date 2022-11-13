	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	MAX_SIZE
	.data
	.align 4
	.type	MAX_SIZE, @object
	.size	MAX_SIZE, 4
MAX_SIZE:
	.long	1000000
	.section	.rodata
.LC0:
	.string	"YES\n"
.LC1:
	.string	"NO\n"
.LC2:
	.string	"YES\n %s"
.LC3:
	.string	"NO\n %s"
.LC4:
	.string	"%s"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 56
	mov	DWORD PTR -84[rbp], edi
	mov	QWORD PTR -96[rbp], rsi
	mov	rax, rsp
	mov	rbx, rax
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	mov	eax, DWORD PTR MAX_SIZE[rip]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -64[rbp], rdx
	movsx	rdx, eax
	mov	r14, rdx
	mov	r15d, 0
	movsx	rdx, eax
	mov	r12, rdx
	mov	r13d, 0
	cdqe
	mov	edx, 16
	sub	rdx, 1
	add	rax, rdx
	mov	esi, 16
	mov	edx, 0
	div	rsi
	imul	rax, rax, 16
	mov	rdx, rax
	and	rdx, -4096
	mov	rcx, rsp
	sub	rcx, rdx
	mov	rdx, rcx
.L2:
	cmp	rsp, rdx
	je	.L3
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L2
.L3:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L4
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L4:
	mov	rax, rsp
	add	rax, 0
	mov	QWORD PTR -72[rbp], rax
	cmp	DWORD PTR -84[rbp], 1
	jne	.L5
	call	rand@PLT
	movsx	rdx, eax
	imul	rdx, rdx, 1374389535
	shr	rdx, 32
	mov	ecx, edx
	sar	ecx, 5
	cdq
	sub	ecx, edx
	mov	edx, ecx
	imul	edx, edx, 100
	sub	eax, edx
	mov	edx, eax
	lea	eax, 1[rdx]
	mov	DWORD PTR -52[rbp], eax
	mov	edx, DWORD PTR -52[rbp]
	mov	rax, QWORD PTR -72[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	GenerateRandomString@PLT
	jmp	.L6
.L5:
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 8
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR -72[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	ReadFromFile@PLT
	mov	DWORD PTR -52[rbp], eax
.L6:
	mov	edx, DWORD PTR -52[rbp]
	mov	rax, QWORD PTR -72[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	IsPolidrom@PLT
	mov	BYTE PTR -73[rbp], al
	cmp	DWORD PTR -84[rbp], 3
	jne	.L7
	cmp	BYTE PTR -73[rbp], 0
	je	.L8
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rdi, .LC0[rip]
	call	WriteToFile@PLT
	jmp	.L9
.L8:
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	call	WriteToFile@PLT
	jmp	.L9
.L7:
	cmp	BYTE PTR -73[rbp], 0
	je	.L10
	mov	rax, QWORD PTR -72[rbp]
	mov	rsi, rax
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L11
.L10:
	mov	rax, QWORD PTR -72[rbp]
	mov	rsi, rax
	lea	rdi, .LC3[rip]
	mov	eax, 0
	call	printf@PLT
.L11:
	mov	rax, QWORD PTR -72[rbp]
	mov	rsi, rax
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
.L9:
	mov	eax, 0
	mov	rsp, rbx
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
	.size	main, .-main
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
