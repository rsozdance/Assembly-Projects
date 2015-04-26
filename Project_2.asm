section .text
	global main			; define the main function to the linker
main: 
	mov eax, "5"		; decler the vars
	mov ebx, "4"		; dclear the vars

	sub eax, "0"		; prepare the number
	sub ebx, "0"		; prepare the number

	add eax, ebx		; add the numbers
	add eax, "0"		; return the number to ASCI
	mov [sum], eax		; move the result

	push dword 1		; give the text len argumnet
	push dword sum		; give the text argument
	push dword 1		; give the output type argument
	mov eax, 0x4 		; call System_write function
	sub esp, 0x4		; prepare the memore to print
	int 0x80			; call the kernel
	add esp, 16			; clean up stock

	push dword 1		; give the normal exit number
	mov eax, 0x1		; call System_exit function
	sub esp, 0x4		; prepare the memore for the function
	int 0x80			; call the kernel

	; Note: clean up stock not needed becouse the program allready exit!
section .bss
	sum resb 4			; decler the var