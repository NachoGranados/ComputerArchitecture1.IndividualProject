%include "io64.inc"

;%include "functions.asm"

section .data

str1 db 'A'
str2 db 'A'



section .ascii
str3 db 'ABC'



section .text
global CMAIN

CMAIN:
    mov rbp, rsp; for correct debugging

    mov rdi, 3
    mov rsi, 2
    mov rdx, 15
    mov rcx, 5
    
    mov rax, 3
    mov rbx, 0
    and rax, rbx
    
    
    
    
    mov rax, [str1]
    mov rbx, [str2]
    lea rcx, [str3]

    cmp rax, rbx
    jne _next
    
    mov rcx, 1
    
    jmp _exit

_next:

    mov rcx, 2



    
    ;call quit

_exit:

    mov     rbx, 0
    mov     rax, 1
    int     80h












