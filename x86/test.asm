section .data
msg: db 'Hello World!', 0Ah
len: equ $ - msg
 
SECTION .text
global  _start
 
_start:
 
    mov     rdx, len
    mov     rcx, msg
    mov     rbx, 1
    mov     rax, 4
    int     80h
 
    mov     rbx, 0      ; return 0 status on exit - 'No Errors'
    mov     rax, 1      ; invoke SYS_EXIT (kernel opcode 1)
    int     80h
