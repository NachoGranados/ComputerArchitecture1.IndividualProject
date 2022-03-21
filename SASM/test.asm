%include "io64.inc"

;%include "functions.asm"

section .data

str1 db 'A'
str2 db 'A'

var1 db 0



section .ascii
str3 db 'ABC'



section .text
global CMAIN

CMAIN:
    mov rbp, rsp; for correct debugging

    mov rax, 80 ; dividendo
    mov rdx, 0 ; residuo
    
    mov rbx, 41 ; divisor
    
    div ebx
    
    mov rax, [var1]
    mov rbx, 100
    mov rax, rbx
    
    mov rcx, var1
    
    
    
    
    
    
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












