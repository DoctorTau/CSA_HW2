    .file	"fileWriter.c"
    .intel_syntax noprefix
    .text
    .section	.rodata
#	 Объявление строк
.LC0:
    .string	"w"
.LC1:
    .string	"Error opening file"
    .text
    .globl	WriteToFile
    .type	WriteToFile, @function
WriteToFile:
    endbr64
    push	rbp						# Начало функции
    mov	rbp, rsp
    sub	rsp, 32
    mov	QWORD PTR -24[rbp], rdi		# Сохранение аргументов
    mov	QWORD PTR -32[rbp], rsi
    mov	rax, QWORD PTR -32[rbp]
    lea	rsi, .LC0[rip]				# Сохраняем адрес строки "w" в rsi
    mov	rdi, rax
    call	fopen@PLT				# Вызов функции fopen
    mov	QWORD PTR -8[rbp], rax		# Сохраняем возвращаемое значение на стек
    cmp	QWORD PTR -8[rbp], 0		# FILE == NULL
    jne	.L2							# Если не равно, то переходим к .L2
    lea	rdi, .LC1[rip]				# Сохраняем адрес строки "Error opening file" в rdi
    mov	eax, 0
    call	printf@PLT				# Вызов функции printf
    mov	edi, 1						# exit(1)
    call	exit@PLT
.L2:
    mov	rdx, QWORD PTR -8[rbp]		# Подготавливаем параметры перед вызовом функции fputs
    mov	rax, QWORD PTR -24[rbp]
    mov	rsi, rdx
    mov	rdi, rax
    call	fputs@PLT				# Вызов функции fputs
    mov	rax, QWORD PTR -8[rbp]		# Подготавливаем параметры перед вызовом функции fclose
    mov	rdi, rax
    call	fclose@PLT				# Вызов функции fclose
    nop
    leave							# Конец функции
    ret
