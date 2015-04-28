section .text
	global main
	main:
		push dword msg1len
		push dword msg1
		push dword 1
        mov eax, 0x4        ; call system_write
        sub esp, 0x4        ; prepare memore
        int 0x80            ; call kernel
        add esp, 16         ; clean up stack

		push dword msg2len
		push dword msg2
		push dword 1
        mov eax, 0x4        ; call system_write
        sub esp, 0x4        ; prepare memore
        int 0x80            ; call kernel
        add esp, 16         ; clean up stack

		push dword 5 		; input length
		push dword Fnum		; store memore
		push dword 0 		; stander stdin
		mov eax, 0x3		; call system_read
		sub esp, 0x4		; prepare memore
		int 0x80			; call kernel
		add esp, 16			; clean up stack

		push dword msg3len
		push dword msg3
		push dword 1
        mov eax, 0x4        ; call system_write
        sub esp, 0x4        ; prepare memore
        int 0x80            ; call kernel
        add esp, 16         ; clean up stack

		push dword 5 		; input length
		push dword Snum		; store memore
		push dword 0 		; stander stdin
		mov eax, 0x3		; call system_read
		sub esp, 0x4		; prepare memore
		int 0x80			; call kernel
		add esp, 16			; clean up stack

		push dword msg4len
		push dword msg4
		push dword 1
        mov eax, 0x4        ; call system_write
        sub esp, 0x4        ; prepare memore
        int 0x80            ; call kernel
        add esp, 16         ; clean up stack

		mov eax, dword [Fnum]
		;sub eax, "0"		; convert to dicimal

		mov ebx, dword [Snum]
		;sub ebx, "0"		; convert to dicimal

		add eax, ebx		; add the numbers
		;add eax, "0"		; convert to ascii
		mov [Resu], dword eax

		push 5
		push dword [Resu]
		push dword 1
        mov eax, 0x4        ; call system_write
        sub esp, 0x4        ; prepare memore
        int 0x80            ; call kernel
        add esp, 16         ; clean up stack
    exit:
		push dword 0x1		; normal exit return
		mov eax, 0x1		; call system_exit
		sub esp, 0x4		; prepare memore
		int 0x80			; call kernel
		
section .data
	msg1 db "Welcome ...", 0xA
	msg1len equ $ - msg1
	msg2 db "Please, Give me the first number: "
	msg2len equ $ - msg2
	msg3 db "Please, Give me the second number: "
	msg3len equ $ - msg3
	msg4 db "the sum of the two numbers is: "
	msg4len equ $ - msg4

section .bss
	Fnum resb 5
	Snum resb 5
	Resu resb 5