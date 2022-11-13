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
	.string	"YES"
.LC3:
	.string	"NO"
	.align 8
.LC4:
	.string	"\nProgram took %ld miliseconds to execute \n"
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
	sub	rsp, 104
	mov	DWORD PTR -132[rbp], edi
	mov	QWORD PTR -144[rbp], rsi
	mov	rax, rsp
	mov	rbx, rax
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	mov	eax, DWORD PTR MAX_SIZE[rip]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -88[rbp], rdx
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
	mov	ecx, 16
	mov	edx, 0
	div	rcx
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
	mov	QWORD PTR -96[rbp], rax
	mov	DWORD PTR -60[rbp], 1
	mov	QWORD PTR -56[rbp], 0
	mov	QWORD PTR -72[rbp], 0
	cmp	DWORD PTR -132[rbp], 3
	je	.L5
	cmp	DWORD PTR -132[rbp], 3
	jg	.L20
	cmp	DWORD PTR -132[rbp], 1
	je	.L7
	cmp	DWORD PTR -132[rbp], 2
	je	.L8
	jmp	.L20
.L5:
	mov	rax, QWORD PTR -144[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 45
	jne	.L9
	mov	rax, QWORD PTR -144[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	add	rax, 1
	movzx	eax, BYTE PTR [rax]
	cmp	al, 114
	jne	.L9
	mov	rax, QWORD PTR -144[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -60[rbp], eax
	nop
	jmp	.L11
.L9:
	mov	rax, QWORD PTR -144[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -144[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	QWORD PTR -72[rbp], rax
	jmp	.L11
.L8:
	mov	rax, QWORD PTR -144[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -56[rbp], rax
	jmp	.L11
.L7:
	call	rand@PLT
	mov	ecx, DWORD PTR MAX_SIZE[rip]
	cdq
	idiv	ecx
	mov	eax, edx
	add	eax, 1
	mov	DWORD PTR -64[rbp], eax
	mov	edx, DWORD PTR -64[rbp]
	mov	rax, QWORD PTR -96[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	GenerateRandomString@PLT
	jmp	.L11
.L20:
	nop
.L11:
	cmp	QWORD PTR -56[rbp], 0
	je	.L12
	mov	rax, QWORD PTR -144[rbp]
	add	rax, 8
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR -96[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	ReadFromFile@PLT
	mov	DWORD PTR -64[rbp], eax
.L12:
	call	clock@PLT
	mov	QWORD PTR -104[rbp], rax
	mov	DWORD PTR -76[rbp], 0
	jmp	.L13
.L14:
	mov	edx, DWORD PTR -64[rbp]
	mov	rax, QWORD PTR -96[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	IsPolidrom@PLT
	add	DWORD PTR -76[rbp], 1
.L13:
	mov	eax, DWORD PTR -76[rbp]
	cmp	eax, DWORD PTR -60[rbp]
	jl	.L14
	mov	edx, DWORD PTR -64[rbp]
	mov	rax, QWORD PTR -96[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	IsPolidrom@PLT
	mov	BYTE PTR -105[rbp], al
	call	clock@PLT
	sub	rax, QWORD PTR -104[rbp]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR -104[rbp]
	mov	QWORD PTR -120[rbp], rax
	cmp	QWORD PTR -72[rbp], 0
	je	.L15
	cmp	BYTE PTR -105[rbp], 0
	je	.L16
	mov	rax, QWORD PTR -72[rbp]
	mov	rsi, rax
	lea	rdi, .LC0[rip]
	call	WriteToFile@PLT
	jmp	.L17
.L16:
	mov	rax, QWORD PTR -72[rbp]
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	call	WriteToFile@PLT
	jmp	.L17
.L15:
	cmp	BYTE PTR -105[rbp], 0
	je	.L18
	lea	rdi, .LC2[rip]
	call	puts@PLT
	jmp	.L17
.L18:
	lea	rdi, .LC3[rip]
	call	puts@PLT
.L17:
	mov	rax, QWORD PTR -120[rbp]
	mov	rsi, rax
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
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
