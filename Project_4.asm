section .text
	global main
main:
	push dword Msg1len
	push dword Msg1
	push dword 1
	mov eax, 0x4
	sub esp, 0x4
	int 0x80
	add esp, 16

	push dword 1
	push dword input
	push dword 0
	mov eax, 0x3
	sub esp, 0x4
	int 0x80
	add esp, 16

	push dword Msg2len
	push dword Msg2
	push dword 1
	mov eax, 0x4
	sub esp, 0x4
	int 0x80
	add esp, 16

	mov eax, input
	sub eax, "0"

	mov ebx, input
	sub ebx, "0"

	add eax, ebx
	add eax, "0"

	mov [sum], eax

	push dword 5
	push dword sum
	push dword 1
	mov eax, 0x4
	sub esp, 0x4
	int 0x80
	add esp, 16

section .data
	Msg1 db "Give me number: "
	Msg1len equ $ - Msg1
	Msg2 db "You Given number square is : "
	Msg2len equ $ - Msg2

section .bss
	input resb 2
	sum resb 5