section .text
	global main

main:
	; give arguments (lenght, text, Output type)
	push dword Msg1len
	push dword Msg1
	push dword 1
	mov eax, 0x4	; call the system_write
	sub esp, 0x4	; prepare the memore
	int 0x80		; call the kernel
	add esp, 16		; clean up the stock

	push dword 2		; input length
	push dword Input	; Where to store the inputed
	push dword 0		; input type
	mov eax, 0x3
	sub esp, 0x4	; prepare the memore
	int 0x80		; call the kernel
	add esp, 16		; clean up the stock

	; give arguments to print
	push dword Msg2len
	push dword Msg2
	push dword 1
	mov eax, 0x4	; call the system_write
	sub esp, 0x4	; prepare the memore
	int 0x80		; call the kernel
	add esp, 16		; clean up the stock

	push dword 2
	push dword Input
	push dword 1
	mov eax, 0x4	; call the system_write
	sub esp, 0x4	; prepare the memore
	int 0x80		; call the kernel
	add esp, 16		; clean up the stock

	push dword 1
	mov eax, 0x1
	sub esp, 0x4	; prepare the memore
	int 0x80		; call the kernel

section .data
	Msg1 db "Give me number: "
	Msg1len equ $ - Msg1
	Msg2 db "Your Number was: "
	Msg2len equ $ - Msg2

section .bss
	Input resb 2