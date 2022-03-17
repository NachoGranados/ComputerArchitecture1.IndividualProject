%include "io64.inc"

section .data
msg db 'Hello World Hello World Hello World Hello World Hello World Hello World Hello World Hello World Hello World Hello World Hello World Hello World Hello World Hello World Hello World Hello World Hello World Hello World Hello WorldHello World Hello World Hello World Hello World'

len: equ $-msg

space db 0Ah

array times 15 dq ' ' ; max value => 5

section .text
global CMAIN

CMAIN:
    mov rbp, rsp; for correct debugging
    
    mov r15, len
    
    mov r8, 0 ; cont
    
    mov r10, 0 ; row
    
_loop:

    mov r9, msg ; msg addres
    add r9, r8
 
    ; print one letter
    mov     rdx, 1
    mov     rcx, r9
    mov     rbx, 1
    mov     rax, 4
    int     80h
    
    add r10, 1
    
    cmp r10, 41
    jl _continue 
    
    mov r10, 0  
    
    ; print new line
    mov     rdx, 1
    mov     rcx, space
    mov     rbx, 1
    mov     rax, 4
    int     80h
    
_continue:
    
    add r8, 1
    
    cmp r8, len
    jl _loop
     
_exit:
    mov     ebx, 0      ; return 0 status on exit - 'No Errors'
    mov     eax, 1      ; invoke SYS_EXIT (kernel opcode 1)
    int     80h
    