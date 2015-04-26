section .text
    global main
    main:
        ; code
        mov eax, Msg1       ; set the text argument
        call print

        push dword 1
        mov eax, 0x1
        sub esp, 0x4
        int 0x80
    print:
        ; calculate the length of string
        mov     edi, dword eax
        mov     ecx, dword -1
        xor     al,al
        cld
        repnz scasb

        ; place the length of the string in RDX
        mov     edx, dword -2
        sub     edx, ecx
        push dword edx

        push dword eax

        push dword 1        ; the output type
        mov eax, 0x4        ; call system_write
        sub esp, 0x4        ; prepare memore
        int 0x80            ; call kernel
        add esp, 16         ; clean up stack
section .data
    Msg1 db "Welcome to the future ... testing print function", 0xA          ; the welcome msg
