%include "io64.inc"

section .bss

text resb 255 ; variable to store file contents

section .data

;text db 'abc' ; variable to store file contents

filename db 'text.txt', 0h 

;len equ $-text
;len equ 10

coordinates times 10 db 10

line times 10 db 10

matrix times 1500 db '1'
n equ 250 ; number of columns

pixel db '0'
;text db "CARRO"

section .text

global CMAIN

CMAIN:
    mov rbp, rsp; for correct debugging    
    ; LEER ARCHIVO DE TEXTO Y GUARDARLO EN LA VARIABLE "text"
    
_open_file:
    mov     rcx, 0
    mov     rbx, filename
    mov     rax, 5
    int     80h

 _read_file: 
    mov     rdx, 1000; number of bytes to read
    mov     rcx, text
    mov     rbx, rax
    mov     rax, 3
    int     80h
 
    mov     rax, text   ; move the memory address of our file contents variable into rax for printing   
    
    call    _print_string_2            ; call our string printing function
 
    ;call    quit                ; call our quit function    
    
    ;jmp _exit
    
    
    
    
   
      
_loops_variables:      
    mov rax, 0 ; rax => letter pointer (text variable)
    mov rbx, 0 ; rbx => coordinates pointer (coordinates variable)
    mov rcx, 0 ; rcx => line pointer (line variable)
    mov rdx, 0 ; rdx => i (matrix variable)
    mov rsi, 4 ; rsi => j (matrix variable)
    
_letter_loop_start:
    push rax ; preserve rax on the stack
    
    mov rax, text
    
    call _text_length
    
    mov rdi, rax ; rdi => text lenght     
    
    pop rax ; restore rax from the stack

;    mov rdi, len ; rdi => len
    cmp rax, rdi ; letter pointer < len ?
    jge _letter_loop_end ; letter pointer >= len
    
    mov rdi, text ; rdi => text base address
    mov rdi, [rdi] ; rdi => current letter
    
    mov r8, 0 ; r8 => letter flag
    mov r9, 0 ; r9 => coordinates offset
    ;mov r10, coordinates ; r10 => coordinates base address
    
    ; call _cases
    ; CASES DE LAS LETRAS
    ; GUARDAR COODERNADAS EN LA VARIABLE "coordinates"
    ; ASIGNAR EL FLAG DE CADA LETRA QUE ES LA CANTIDAD DE CORDENADAS QUE ESA LETRA TIENE
    
_coordinates_loop_start:
    cmp rbx, r8 ; coordinates pointer < letter flag ?
    jge _coordinates_loop_end ; coordinates pointer >= letter flag
              
_store_on_stack:    
    push rax ; preserve rax on the stack
    push rbx ; preserve rbx on the stack
    push rcx ; preserve rcx on the stack
    push rdx ; preserve rdx on the stack
    push rsi ; preserve rsi on the stack
    push rdi ; preserve rdi on the stack
    push r8 ; preserve r8 on the stack
    
    mov rax, coordinates ; rax => coordinates base address
    
    mov rdi, [rax + r9] ; cordinates[ofset] = x1    
    add r9, 8 ; ofset++    
    
    mov rsi, [rax + r9] ; cordinates[ofset] = y1   
    add r9, 8 ; ofset++     
    
    mov rdx, [rax + r9] ; cordinates[ofset] = x2
    add r9, 8 ; ofset++         
    
    mov rcx, [rax + r9] ; cordinates[ofset] = y2
    add r9, 8 ; ofset++
    
    push r9 ; preserve r9 on the stack   
               
    ; LLAMAR AL ALGORITMO DE BRESENHAM
    ; call _bresenham
    ; SE GUARDAN LAS COORDENADAS DE LA LINEA EN LA VARIABLE "line"
        
_restore_from_stack:       
    pop r9 ; restore r9 from the stack
    pop r8 ; restore r8 from the stack
    pop rdi ; restore rdi from the stack
    pop rsi ; restore rsi from the stack
    pop rdx ; restore rdx from the stack
    pop rcx ; restore rcx from the stack
    pop rbx ; restore rbx from the stack
    pop rax ; restore rax from the stack
    
    sar r10, 2 ; r10 => number of coordinates of current line
    mov r11, line ; r9 => line base address    
    
_line_loop_start:
    cmp rcx, r10 ; line pointer < r10 ?
    jge _line_loop_end ; line pointer >= r10
    
    mov r12, rcx ; r12 => line pointer
    imul r12, 8 ; r12 = line pointer * 8
    
    mov r13, [r11 + r12] ; r13 = line[line pointer] => x
    
    add r12, 8 ; line pointer ++
    
    mov r14, [r11 + r12] ; r14 = line[line pointer] => y
    
    push rdx ; preserve rsi on the stack
    push rsi ; preserve rdi on the stack
    
    add rdx, r13 ; rdx = x + i => i_new
    sub rsi, r14 ; rsi = j - y => j_new
    
    mov r15, n ; r15 => n
    imul r15, rdx ; r15 = n * i_new
    add r15, rsi ; r15 = (n * i_new) + j_new
    
    pop rsi ; restore rdi from the stack
    pop rdx ; restore rsi from the stack 
    
    mov r13, matrix ; r13 => matrix base address
    mov r14, pixel ; r14 => pixel
    
    mov [r13 + r15], r14 ; matrix[(n * i_new) + j_new] = pixel
    
    add rcx, 2 ; coordinates pointer + 2

_line_loop_end:    

    add rdx, 6 ; i + 6

    add rbx, 4 ; coordinates pointer + 4

_coordinates_loop_end: 

    cmp rax, 41 ; letter pointer > 41 ?
    jbe _continue ; letter pointer <= 41
    
    mov rdx, 0 ; i = 0
    add rsi, 6 ; j + 6
        
_continue:            

    add rax, 1 ; letter pointer + 1

_letter_loop_end:
        
_exit:
    mov     rbx, 0
    mov     rax, 1
    int     80h  
    
      
        
          
            
              
                
                  
                    
                      
                        
                          
                            
                              
                                
                                  
; rax => string address
_text_length:
    push rbx ; preserve rbx on the stack
      
    mov rbx, rax ; rbx = rax
 
_text_length_next_char:
    cmp byte [rax], 0
    jz _text_length_finished
    
    inc rax ; rax ++
    
    jmp _text_length_next_char
 
_text_length_finished:
    sub rax, rbx ; rax = rax - rbx
    
    pop rbx ; restore rbx from the stack 
    
    ret                                   

_print_string_1:
    push rdx ; preserve rdx on the stack
    push rcx ; preserve rcx on the stack
    push rbx ; preserve rbx on the stack
    push rax ; preserve rax on the stack
    
    call _text_length
 
    mov rdx, rax ; rdx = rax
    
    pop rax ; restore rax from the stack 
 
    mov rcx, rax ; rcx = rax
    mov rbx, 1 ; rbx = 1
    mov rax, 4 ; rax = 4
    int 80h
 
    pop rbx ; restore rbx from the stack 
    pop rcx ; restore rcx from the stack 
    pop rdx ; restore rdx from the stack 
    
    ret

; rax => string address
_print_string_2:
    call _print_string_1
 
    push rax ; preserve rax on the stack
    
    mov rax, 0AH ; rax = 0AH
    
    push rax ; preserve rax on the stack
    
    mov rax, rsp ; rax = rsp
    
    call _print_string_1
    
    pop rax ; restore rax from the stack 
    pop rax ; restore rax from the stack 
    
    ret                                           

                                                    
                                                      
                                                        
                                                          
                                                            
                                                              
                                                                
                                                                    