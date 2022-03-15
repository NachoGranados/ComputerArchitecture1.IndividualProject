section .data
msg: db 'Hello World!', 0Ah
len: equ $ - msg
 
SECTION .text
global  _start
 
_start:
 
    mov     edx, len
    mov     ecx, msg
    mov     ebx, 1
    mov     eax, 4
    int     80h
 
    mov     ebx, 0      ; return 0 status on exit - 'No Errors'
    mov     eax, 1      ; invoke SYS_EXIT (kernel opcode 1)
    int     80h
