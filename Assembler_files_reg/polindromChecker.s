    .file	"polindromChecker.c"
    .intel_syntax noprefix
    .text
    .globl	IsPolidrom
    .type	IsPolidrom, @function
IsPolidrom:
    endbr64
    push	rbp						# Начало функции
    mov	rbp, rsp
    mov	QWORD PTR -24[rbp], rdi		# Сохранение аргументов
    mov	DWORD PTR -28[rbp], esi
    mov	DWORD PTR -4[rbp], 0		# Счетчик i = 0
    jmp	.L2							# Переход к циклу
.L5:
    mov	eax, DWORD PTR -4[rbp]		# eax = i
    movsx	rdx, eax
    mov	rax, QWORD PTR -24[rbp]		# rax = str
    add	rax, rdx					# получаем адрес i-го символа
    movzx	edx, BYTE PTR [rax]		# dl = i-й символ
    mov	eax, DWORD PTR -28[rbp]
    sub	eax, DWORD PTR -4[rbp]
    cdqe
    lea	rcx, -1[rax]
    mov	rax, QWORD PTR -24[rbp]
    add	rax, rcx
    movzx	eax, BYTE PTR [rax]		# al = (len - i - 1)-й символ
    cmp	dl, al						# str[i] == str[len - i - 1]
    je	.L3
    mov	eax, 0						# Возвращаем 0
    jmp	.L4
.L3:
    add	DWORD PTR -4[rbp], 1		# i++
.L2:
    mov	eax, DWORD PTR -28[rbp]		# eax = len
    mov	edx, eax
    shr	edx, 31						# len >> 31         (len / 2)
    add	eax, edx					# len + (len >> 31)
    sar	eax							#
    cmp	DWORD PTR -4[rbp], eax		# i < len / 2
    jl	.L5							# Если i < len / 2, то переход к .L5
    mov	eax, 1						# Если i >= len / 2, то возвращаем 1
.L4:
    pop	rbp							# Конец функции
    ret
