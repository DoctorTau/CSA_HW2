    .file	"main.c"
    .intel_syntax noprefix
    .text								# Глоабльная переменная MAX_SIZE
    .data
    .align 4
    .type	MAX_SIZE, @object
    .size	MAX_SIZE, 4
MAX_SIZE:
    .long	1000000						# Значение MAX_SIZE
    .section	.rodata
.LC0:									# Строки с ошибками по окончании работы программы
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
    push	rbp 						# Сохранение регистров, начало программы
    mov	rbp, rsp
    push	r15
    push	r14
    push	r13
    push	r12
    push	rbx
    sub	rsp, 104
    mov	DWORD PTR -132[rbp], edi		# Сохранение аргументов в регистры
    mov	QWORD PTR -144[rbp], rsi
    mov	rax, rsp
    mov	rbx, rax
    mov	edi, 0
    call	time@PLT					# Вызов функции time
    mov	edi, eax
    call	srand@PLT					# Вызов функции srand
    mov	eax, DWORD PTR MAX_SIZE[rip]	# Вызов функции rand
    movsx	rdx, eax					# Получение случайного числа
    sub	rdx, 1
    mov	QWORD PTR -88[rbp], rdx			# Сохранение случайного числа в переменную
    movsx	rdx, eax			  		# Получение случайного числа программы
    # что-то сложное и непонятное...
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
    mov	r15, rax
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
    mov	rax, QWORD PTR -144[rbp]	# Проверка наличия аргументов
    add	rax, 8						# rax + 8
    mov	rax, QWORD PTR [rax]
    movzx	eax, BYTE PTR [rax]
    cmp	al, 45						# Проход по аргументам из командной строки
    jne	.L9
    mov	rax, QWORD PTR -144[rbp]
    add	rax, 8
    mov	rax, QWORD PTR [rax]
    add	rax, 1
    movzx	eax, BYTE PTR [rax]
    cmp	al, 114					    # Сравниваем al c 144
    jne	.L9							# Если не равно, то переходим к .L9
    mov	rax, QWORD PTR -144[rbp]
    add	rax, 16
    mov	rax, QWORD PTR [rax]
    mov	rdi, rax
    call	atoi@PLT					# Вызов функции atoi
    mov	DWORD PTR -60[rbp], eax
    nop
    jmp	.L11
.L9:								# case 2:
    mov	rax, QWORD PTR -144[rbp]   # Проверка наличия аргументов
    mov	rax, QWORD PTR 8[rax]
    mov	QWORD PTR -56[rbp], rax
    mov	rax, QWORD PTR -144[rbp]
    mov	rax, QWORD PTR 16[rax]
    mov	QWORD PTR -72[rbp], rax		# Сохраняем имя файля ввода
    jmp	.L11
.L8:
    mov	rax, QWORD PTR -144[rbp]
    mov	rax, QWORD PTR 8[rax]
    mov	QWORD PTR -56[rbp], rax
    jmp	.L11
.L7:								# case 1
    call	rand@PLT				# Вызов функции rand
    mov	ecx, DWORD PTR MAX_SIZE[rip] # Получение случайного числа
    cdq
    idiv	ecx
    mov	eax, edx
    add	eax, 1						# len + 1
    mov	r14d, eax     # Сохраняем len на стеке
    mov	edx, r14d		# / Подготавливаем len
    mov	rax, r15		# | Подготавливаем str
    mov	esi, edx					# | Подготавливаем параметры перед вызовом функции GenerateRandomString
    mov	rdi, rax					# \
    call	GenerateRandomString@PLT  # Вызов функции GenerateRandomString
    jmp	.L11 						# Выход из Switch case
.L20:								# case default
    nop
.L11:
    cmp	QWORD PTR -56[rbp], 0		# input != NULL
    je	.L12						# Если input == NULL, то пропускаем следующие шаги, иначе читаем из файла
    mov	rax, QWORD PTR -144[rbp]	# Подготавливаем параметры перед вызовом функции ReadFromFile
    add	rax, 8
    mov	rdx, QWORD PTR [rax]
    mov	rax, r15
    mov	rsi, rdx
    mov	rdi, rax
    call	ReadFromFile@PLT		# Вызов функции ReadFromFile
    mov	r14d, eax
.L12:
    call	clock@PLT 				# Вызов функции clock
    mov	QWORD PTR -104[rbp], rax	# Сохраняем время начала работы программы
    mov	DWORD PTR -76[rbp], 0
    jmp	.L13						# Выход из цикла
.L14:
    mov	edx, r14d 	# Подготавливаем параметры перед вызовом функции IsPolidrom. len
    mov	rax, r15		# str
    mov	esi, edx
    mov	rdi, rax
    call	IsPolidrom@PLT			# Вызов функции IsPolidrom
    add	DWORD PTR -76[rbp], 1 		# i++
.L13:
    mov	eax, DWORD PTR -76[rbp]		# Берем значение переменной i в цикле for
    cmp	eax, DWORD PTR -60[rbp]		# Сравниваем i с количеством повторений amount_of_tests
    jl	.L14						# Если i < amount_of_tests, то переходим на метку .L14
    mov	edx, r14d		# Подготавливаем параметры перед вызовом функции IsPolidrom. len
    mov	rax, r15		# str
    mov	esi, edx
    mov	rdi, rax
    call	IsPolidrom@PLT			# Вызов функции IsPolidrom
    mov	BYTE PTR -105[rbp], al		# Сохраняем результат работы функции IsPolidrom в char result
    call	clock@PLT				# Вызов функции clock
    sub	rax, QWORD PTR -104[rbp]	# Вычитаем время начала работы программы из текущего времени
    mov	QWORD PTR -104[rbp], rax	# Сохраняем время работы программы
    mov	rax, QWORD PTR -104[rbp]	# Сохраняем время работы программы в rax
    mov	QWORD PTR -120[rbp], rax	# Сохраняем время работы программы на стеке
    cmp	QWORD PTR -72[rbp], 0		# output != NULL
    je	.L15						# Если output == NULL, то пропускаем следующие шаги, иначе записываем в файл
    cmp	BYTE PTR -105[rbp], 0		# result == 0
    je	.L16						# Если result == 0, то переходим на метку .L16
    mov	rax, QWORD PTR -72[rbp]		# Подготавливаем параметры перед вызовом функции WriteToFile
    mov	rsi, rax
    lea	rdi, .LC0[rip]				# Сохраняем адрес строки "YES" в rdi
    call	WriteToFile@PLT			# Вызов функции WriteToFile
    jmp	.L17						# Переход к метке .L17
.L16:
    mov	rax, QWORD PTR -72[rbp]
    mov	rsi, rax
    lea	rdi, .LC1[rip]
    call	WriteToFile@PLT
    jmp	.L17
.L15:
    cmp	BYTE PTR -105[rbp], 0		# Сравниваем результат работы функции IsPolidrom с 0
    je	.L18						# Если result == 0, то переходим на метку .L18
    lea	rdi, .LC2[rip]				# Сохраняем адрес строки "YES" в rdi
    call	puts@PLT				# Вызов функции puts
    jmp	.L17						# Переход к метке .L17
.L18:
    lea	rdi, .LC3[rip]				# Сохраняем адрес "NO" в rdi
    call	puts@PLT				# Вызов функции puts
.L17:
    mov	rax, QWORD PTR -120[rbp] 		# Сохраняем время работы программы в rax
    mov	rsi, rax						# Сохраняем время работы программы в rsi
    lea	rdi, .LC4[rip]					# Сохраняем адрес строки "\nProgram took %ld miliseconds to execute \n" в rdi
    mov	eax, 0							# eax = 0
    call	printf@PLT					# Вызов функции printf
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

