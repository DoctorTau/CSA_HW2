    .file	"fileReader.c"
    .intel_syntax noprefix
    .text
    .section	.rodata
# Объявление констант
.LC0:
    .string	"r"
.LC1:
    .string	"Error opening file"
    .text
    .globl	ReadFromFile
    .type	ReadFromFile, @function
ReadFromFile:
    endbr64
    push	rbp 					# Начало функции
    mov	rbp, rsp
    sub	rsp, 48
    mov	QWORD PTR -40[rbp], rdi  	# Сохранение аргументов на стек
    mov	QWORD PTR -48[rbp], rsi		# Сохраняем аргументы на стек
    mov	rax, QWORD PTR -48[rbp]		# Подготавливаем параметры перед вызовом функции. fileaname
    lea	rsi, .LC0[rip]
    mov	rdi, rax
    call	fopen@PLT				# Вызов функции fopen
    mov	QWORD PTR -16[rbp], rax
    cmp	QWORD PTR -16[rbp], 0		# Проверка на ошибку
    jne	.L2							# Если файл открылся, то переходим к чтению
    lea	rdi, .LC1[rip]				# Сохраняем адрес строки "Error opening file"
    mov	eax, 0
    call	printf@PLT				# Вызов функции printf с сообщением об ошибке
    mov	edi, 1
    call	exit@PLT				# Вызов функции exit
.L2:
    mov	DWORD PTR -4[rbp], 0		# i = 0
    jmp	.L3							# Переход к циклу
.L4:
    mov	eax, DWORD PTR -4[rbp]		# Считываем символ из файла
    movsx	rdx, eax
    mov	rax, QWORD PTR -40[rbp]
    add	rdx, rax
    movzx	eax, BYTE PTR -17[rbp]
    mov	BYTE PTR [rdx], al			# Сохраняем символ в массиве
    add	DWORD PTR -4[rbp], 1		# i++
.L3:
    mov	rax, QWORD PTR -16[rbp]		# Подготавливаем параметры перед вызовом функции. fgetc
    mov	rdi, rax
    call	fgetc@PLT				# Вызов функции fgetc
    mov	BYTE PTR -17[rbp], al		# Сохраняем символ в переменную
    cmp	BYTE PTR -17[rbp], -1		# Проверка на конец файла
    jne	.L4							# Если не конец файла, то переходим к чтению следующего символа
    mov	eax, DWORD PTR -4[rbp]		#
    movsx	rdx, eax
    mov	rax, QWORD PTR -40[rbp]		# str[i] = '\0'
    add	rax, rdx
    mov	BYTE PTR [rax], 0
    mov	rax, QWORD PTR -16[rbp] 	# Подготавливаем параметры перед вызовом функции.
    mov	rdi, rax
    call	fclose@PLT				# Вызов функции fclose
    mov	eax, DWORD PTR -4[rbp]		# Подготавливаем параметры перед выходом из функции.
    leave							# Конец функции
    ret
