section .text
	global main
	main:
	; printing the msg
		push dword 2
		push dword [num2]
		push dword 1
		mov eax, 0x4
		sub esp, 0x4
		int 0x80
		add esp, 16
	;start finding the biggest number algorithma
		mov ecx, [num1]
		cmp ecx, [num2]			; biggest = (num1>num2) ? num1, num2 ;
		jg PrintBiggest
		mov ecx, [num2]
	PrintBiggest:
	;printing the result
		mov [biggest], ecx
		push dword 2
		push dword biggest
		push dword 1
		mov eax, 0x4
		sub esp, 0x8
		int 0x80
		add esp, 16
	exit:
		push dword 1
		mov eax, 0x1
		sub esp, 0x4
		int 0x80
section .data
	msg db "The biggest number is: "
	msglen equ $ - msg 
	num1 equ "45"
	num2 equ "90"
section .bss
	biggest resb 2