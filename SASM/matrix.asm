%include "io64.inc"

section .bss

text resb 255 ; variable to store file contents

section .data

;len equ $-text
len equ 10

coordinates times 10 db 10

line times 10 db 10

matrix times 1500 db '1'
n equ 250 ; number of columns

;text db "CARRO"






section .text

global CMAIN

CMAIN:

    ;mov r10, 0 ; r10 => array offset
    ;mov r11, text ; r11 = array address    
    

    ;mov rax, [r11] ; array[i] = x1
    
    ;add r11, 8 ; ofset++    
    
    ;mov rbx, [r11] ; array[i] = x1
   
    ;add r11, 8 ; ofset++     
    
    ;mov rcx, [r11] ; array[i] = x1
    
    ;add r11, 8 ; ofset++         
    
    ;mov rdx, [r11] ; array[i] = x1
   
    ;add r11, 8 ; ofset++       
    
    ;mov rsi, [r11] ; array[i] = x1
    
    
    
    
    
    
    
    
    
    ; LEER ARCHIVO DE TEXTO Y GUARDARLO EN LA VARIABLE "text"
    
    
    
    
   
      
_loops_variables:      
    mov rax, 0 ; rax => letter pointer (text variable)
    mov rbx, 0 ; rbx => coordinates pointer (coordinates variable)
    mov rcx, 0 ; rcx => line pointer (line variable)
    mov rdx, 0 ; rdx => i (matrix variable)
    mov rsi, 4 ; rsi => j (matrix variable)
    
    ;mov rdi, matrix ; rdi => matrix base address
    ;mov r8, matrix ; rdi => matrix base address
    ;mov r9, matrix ; rdi => matrix base address
    ;mov r10, matrix ; rdi => matrix base address
    
_letter_loop_start:
    mov rdi, len ; rdi => len
    cmp rax, rdi ; letter pointer < len ?
    jge _letter_loop_end ; letter pointer >= len
    
    mov rdi, text ; rdi => text base address
    mov rdi, [rdi] ; rdi => current letter
    
    mov r8, 0 ; r8 => letter flag
    
    ; call _cases
    ; CASES DE LAS LETRAS
    ; GUARDAR COODERNADAS EN LA VARIABLE "coordinates"
    ; ASIGNAR EL FLAG DE CADA LETRA QUE ES LA CANTIDAD DE CORDENADAS QUE ESA LETRA TIENE
    
_coordinates_loop_start:
    cmp rbx, r8 ; coordinates pointer < letter flag ?
    jge _coordinates_loop_end
              
_store_on_stack:    
    push rax ; preserve rax on the stack
    push rbx ; preserve rbx on the stack
    push rcx ; preserve rcx on the stack
    push rdx ; preserve rdx on the stack
    push rsi ; preserve rsi on the stack
    push rdi ; preserve rdi on the stack
    push r8 ; preserve r8 on the stack
    
    mov rax, 0 ; rax => offset
    mov rbx, coordinates ; rbx => coordinates base address
    
    mov rdi, [rbx] ; cordinates[0] = x1    
    add rax, 8 ; ofset++    
    
    mov rsi, [rbx] ; cordinates[1] = y1   
    add rax, 8 ; ofset++     
    
    mov rdx, [rbx] ; cordinates[2] = x2
    add rax, 8 ; ofset++         
    
    mov rcx, [rbx] ; cordinates[3] = y2
               
    ; LLAMAR AL ALGORITMO DE BRESENHAM
    ; call _bresenham
    ; r10 ALMACENA LA CANTIDAD DE ELEMENTOS QUE TIENE LA VARIABLE "line"
        
_restore_from_stack:       
    pop r8 ; restore r8 from the stack
    pop rdi ; restore rdi from the stack
    pop rsi ; restore rsi from the stack
    pop rdx ; restore rdx from the stack
    pop rcx ; restore rcx from the stack
    pop rbx ; restore rbx from the stack
    pop rax ; restore rax from the stack
    
    mov r9, line ; r9 => line base address
    
_line_loop_start:
    cmp rcx, 10 ; line pointer < 10 ?
    jge _line_loop_end ; line pointer >= 10
    
_line_loop_if:
    mov r10, [r9 + rcx] ; r10 = current coordinate
    
    cmp r10, 0 ; current coordinate == 0 ?
    jne _line_loop_else
    
    cmp rcx, 3 ; line pointer > 3
    jbe _line_loop_else ; line pointer <= 3
    
    
    








_line_loop_else:    
    





















_line_loop_end:    

    
    
    
    
    
    
    
    
    





























    add rbx, 4 ; coordinates pointer + 4

_coordinates_loop_end:   

    
    
























    add rax, 1 ; letter pointer + 1

_letter_loop_end:
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
_exit:
    mov     rbx, 0
    mov     rax, 1
    int     80h    