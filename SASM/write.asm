%include "io64.inc"

section .data
filename: db 'prueba.txt', 0h    ; the filename to create
contents: db 'Buenas mocos', 0h  ; the contents to write
;contents: db 'Buenas', 13, 10, 'mocos', 0h  ; the contents to write
;contents: db 'Buenas', 0ah, 'mocos', 0h  ; the contents to write (0ah es equivalente a \n, salto de linea)


; -----------------------------------
;250x250 = 62500

;1 letra => 5x5 => 50 letras X
;1 letra real => 6x6 => 41.6 letras X

;252x252 = 63504

;1 letra real => 6x6 => 42 letras
; -----------------------------------

vector times 62500 db '1' ; vector formado por 15 bytes inicializadas con 1

section .text
global CMAIN

CMAIN:

    ;mov     rdx, 62500         ; number of bytes to write - one for each letter of our contents string    
    ;call    strlen          ; call our function to calculate the length of the string 
    ;mov     edx, eax        ; our function leaves the result in EAX

    mov     rcx, 0777o          ; code continues from lesson 22
    mov     rbx, filename
    mov     rax, 8
    int     80h
        
    ;mov     ecx, contents       ; move the memory address of our contents string into ecx
    ;add     ecx, 5
    mov     rdx, 62500         ; number of bytes to write - one for each letter of our contents string    
    mov     rcx, vector         ; move the memory address of our contents string into ecx
    mov     rbx, rax            ; move the file descriptor of the file we created into ebx
    mov     rax, 4              ; invoke SYS_WRITE (kernel opcode 4)
    int     80h                 ; call the kernel
 
quit:
    mov     rbx, 0
    mov     rax, 1
    int     80h
 




 