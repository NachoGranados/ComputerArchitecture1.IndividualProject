%include "io64.inc"

%include "functions.asm"

section .text
global CMAIN

CMAIN:
    mov rbp, rsp; for correct debugging

    mov rdi, 3
    mov rsi, 2
    mov rdx, 15
    mov rcx, 5
    
    call quit

;_exit:

 ;   mov     rbx, 0
  ;  mov     rax, 1
   ; int     80h












