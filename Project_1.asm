section .text
	global main 				; define the main function for the linker
main:
; print the text
	push dword len 				; give the text lentgh argument
	push dword msg				; give the text argument
	push dword 1				; give the output type

	mov eax, 0x4				; calling System_Write
	sub esp, 0x4				; prepare the memore to print
	int 0x80					; call the kernel

	add esp, 16					; clean up the stack
; exit the program
	push dword 1				; give the clean exit argument 
	mov eax, 0x1				; calling System_exit
	sub esp, 0x4				; prepare the memore for the exit
	int 0x80					; call the kernel

	; Note: clean up the stack not need becouse the program allready exit!

section .data
	msg db "Hello, World!", 0xA	; define the byte to print
	len equ $ - msg				; define the msg lentgh to print