%include "io64.inc"

section .data
filename db 'prueba.txt', 0h    ; the filename to create

section .text
global CMAIN

CMAIN:
    mov     rcx, 0777o          ; set all permissions to read, write, execute
    mov     rbx, filename       ; filename we will create
    mov     rax, 8              ; invoke SYS_CREAT (kernel opcode 8)
    int     80h                 ; call the kernel
 
    call    quit                ; call our quit function
    
    
    
    
    
    
    
;------------------------------------------
; void exit()
; Exit program and restore resources
quit:
    mov     rbx, 0
    mov     rax, 1
    int     80h
    ret    
    
    
    
    
    
    
    
    
    
    
    