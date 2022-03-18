%include "io64.inc"

section .data
str1 db 'A', 0AH
;broj: db ?,?, '$'   

section .text

global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging

    mov rdi, str1
    
atoi:
    mov rax, 0              ; Set initial total to 0
     
convert:
    movzx rsi, byte [rdi]   ; Get the current character
    test rsi, rsi           ; Check for \0
    je done
    
    cmp rsi, 48             ; Anything less than 0 is invalid
    jl error
    
    cmp rsi, 57             ; Anything greater than 9 is invalid
    jg error
     
    sub rsi, 48             ; Convert from ASCII to decimal 
    imul rax, 10            ; Multiply total by 10
    add rax, rsi            ; Add current digit to total
    
    inc rdi                 ; Get the address of the next character
    jmp convert

error:
    mov rax, -1             ; Return -1 on error
 
done:
    ;ret                     ; Return total or error code    
    
    
    

_exit:
mov     rbx, 0
mov     rax, 1
int     80h



 