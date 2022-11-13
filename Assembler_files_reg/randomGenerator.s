    .file	"randomGenerator.c"
    .intel_syntax noprefix
    .text
    .globl	GenerateRandomString
    .type	GenerateRandomString, @function
GenerateRandomString:
    endbr64
    push	rbp						# Начало функции
    mov	rbp, rsp
    sub	rsp, 32
    mov	QWORD PTR -24[rbp], rdi		# Сохранение аргументов
    mov	DWORD PTR -28[rbp], esi
    mov	edi, 0						# edi = 0
    call	time@PLT				# Вызов функции time
    mov	edi, eax					# edi = time(NULL)
    call	srand@PLT				# Вызов функции srand
    mov	DWORD PTR -4[rbp], 0		# i = 0
    jmp	.L2							# Переход к циклу
.L3:
    call	rand@PLT					# Вызов функции rand
    movsx	rdx, eax					# rdx = rand()
    imul	rdx, rdx, 1321528399		# rdx = rdx * rdx * 1321528399
    shr	rdx, 32						 	# rdx = rdx >> 32
    mov	ecx, edx
    sar	ecx, 3
    cdq
    sub	ecx, edx
    mov	edx, ecx
    imul	edx, edx, 26				# rand % 26
    sub	eax, edx					 	# rand % 26 + 'a'
    mov	edx, eax
    mov	eax, edx
    lea	ecx, 97[rax]
    mov	eax, DWORD PTR -4[rbp]			# eax = i
    movsx	rdx, eax					# rdx = i
    mov	rax, QWORD PTR -24[rbp]			# rax = str
    add	rax, rdx						# rax = str[i]
    mov	edx, ecx
    mov	BYTE PTR [rax], dl				# Сохраняем символ в str[i]
    add	DWORD PTR -4[rbp], 1			# i++
.L2:
    mov	eax, DWORD PTR -4[rbp]			# eax = i
    cmp	eax, DWORD PTR -28[rbp]			# Сравнение i и len
    jl	.L3								# Если i < len, то переход к циклу
    mov	eax, DWORD PTR -28[rbp]			# eax = len
    movsx	rdx, eax					# rdx = str[len]
    mov	rax, QWORD PTR -24[rbp]
    add	rax, rdx
    mov	BYTE PTR [rax], 0				# Сохраняем символ конца строки
    nop
    leave								# Конец функции
    ret
