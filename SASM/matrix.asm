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
    
_open_file:
    mov     rcx, 0 ; rcx = 0
    mov     rbx, filename ; rbx = filename address
    mov     rax, 5 ; rax = 5
    int     80h

_read_file: 
    mov     rdx, 1000 ; rdx => number of bytes to read
    mov     rcx, text ; rcx = text address
    mov     rbx, rax ; rbx = rax
    mov     rax, 3 ; rax = 3
    int     80h
 
    mov     rax, text ; rax = text address
    
    call    _print_string_2
    
    ;jmp _exit

_loops_variables:      
    mov rax, 0 ; rax => letter pointer (text variable)
    mov rbx, 0 ; rbx => coordinates pointer (coordinates variable)
    mov rcx, 0 ; rcx => line pointer (line variable)
    mov rdx, 0 ; rdx => i (matrix variable)
    mov rsi, 4 ; rsi => j (matrix variable)
    
    push rax ; preserve rax on the stack
    
    mov rax, text ; rax = text address
    
    call _text_length
    
    mov rdi, rax ; rdi => text lenght     
    
    pop rax ; restore rax from the stack    
    
_letter_loop_start:    
    cmp rax, rdi ; letter pointer < len ?
    jge _letter_loop_end ; letter pointer >= len
    
    mov rdi, text ; rdi => text base address
    mov rdi, [rdi] ; rdi => current letter
    
    mov r8, 0 ; r8 => letter flag
    mov r9, 0 ; r9 => coordinates offset
    
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
    
    mov rdi, 0
    mov rsi, 2
    mov rdx, 4
    mov rcx, 3    
    
    call _bresenham
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
    mov rbx, 0 ; rbx = 0
    mov rax, 1; rax = 1
    int 80h  
    
      
        
          
  
            
                      
                                
                                          
                                                    
                                                              
                                                                        
                                                                                  
                                                                                            
                                                                                                      
                                                                                                                
                                                                                                                          
                                                                                                                                    
                                                                                                                                              
                                                                                                                                                        
                                                                                                                                                                  
                                                                                                                                                                            
                                                                                                                                                                                      
; rdi = x1
; rsi = y1
; rdx = x2 
; rcx = y2 
_bresenham:
    mov r8, 0 ; r8 => vertical line flag, 0 no, 1 yes
    
_bresenham_dy:
    mov rax, rcx ; rax = y2
    sub rax, rsi ; rax = y2 - y1 => dy
    
_bresenham_abs_dy:
    cmp rax, 0 ; dy < 0 ?
    jge _bresenham_dx ; dy >= 0 
    neg rax ; rax = abs(dy) => dy
    
_bresenham_dx:        
    mov rbx, rdx ; rbx = x2
    sub rbx, rdi ; rbx = x2 - x1 => dx
    
_bresenham_abs_dx:
    cmp rbx, 0 ; dx < 0 ?
    jge _bresenham_horizontal_line ; dy >= 0 
    
    neg rbx ; rbx = abs(dx) => dx

_bresenham_horizontal_line:
    cmp rax, 0 ; dy == 0 ?
    jne _bresenham_vertical_line ; dy != 0
    
    jmp _bresenham_invert_coordinates

_bresenham_vertical_line:      
    cmp rbx, 0 ; dx == 0 ?
    jne _bresenham_invert_coordinates ; dx != 0

    mov r8, 1 ; r8 => vertical line flag
    
_bresenham_invert_coordinates:
    cmp rbx, rax ; dx < dy ?
    jge _bresenham_loop_variables ; dx >= dy ?
    
    mov r9, rdi ; r9 = x1 => aux
    mov rdi, rsi ; x1 = y1
    mov rsi, r9 ; y1 = aux
    
    mov r10, rdx ; r10 = x2 => aux
    mov rdx, rcx ; x2 = y2
    mov rcx, r10 ; y2 = aux
    
    mov r11, rbx ; r11 = dx => aux
    mov rbx, rax ; dx = dy
    mov rax, r11 ; dy = aux    
    
_bresenham_loop_variables:
    mov r9, 0 ; r9 => i
    mov r10, 0 ; r10 => array offset
    mov r11, line ; r11 = array address    
    
    mov r12, rax ; r12 = dy
    imul r12, 2 ; r12 = 2 * dy
    sub r12, rbx ; r12 = (2 * dy) - dx => pk
    
_bresenham_for_loop_start:
    cmp r9, rbx ; i <= dx ?
    jg _bresenham_end ; i > dx

_bresenham_store_coordinate_1:
    cmp r8, 0 ; r8 == 0 ?
    jne _bresenham_store_coordinate_2 ; r8 != 0
       
    mov [r11 + r10], rdi ; array[i] = x1
    
    add r10, 4 ; ofset++    
    
    mov [r11 + r10], rsi ; array[i] = y1
   
    add r10, 4 ; ofset++
    
    jmp _bresenham_increase_x
        
_bresenham_store_coordinate_2:
    mov [r11 + r10], rsi ; array[i] = y1
    
    add r10, 4 ; ofset++    
    
    mov [r11 + r10], rdi ; array[i] = x1
    
    add r10, 4 ; ofset++    
     
_bresenham_increase_x:    
    cmp rdi, rdx ; x1 < x2 ?
    jge _bresenham_decrease_x ; x1 >= x2
    
    add rdi, 1 ; x1++
    
    jmp _bresenham_if
    
_bresenham_decrease_x:
    sub rdi, 1 ; x1--
    
_bresenham_if:
    cmp r12, 0 ; pk < 0 ?
    jge _bresenham_else ; pk >= 0
    
    mov r13, rax ; r13 = dy
    imul r13, 2 ; r13 = 2 * dy
    add r12, r13 ; r12 = pk + (2 * dy) => pk
    
    jmp _bresenham_for_loop_end

_bresenham_else:
    
_bresenham_increase_y:    
    cmp rsi, rcx ; y1 < y2 ?
    jge _bresenham_decrease_y ; y1 >= y2
    
    add rsi, 1 ; y1++
    
    jmp _bresenham_continue
    
_bresenham_decrease_y:
    sub rsi, 1 ; y1--
    
_bresenham_continue:
    mov r13, rax ; r13 = dy
    imul r13, 2 ; r13 = 2 * dy
    
    mov r14, rbx ; r14 = dx
    imul r14, 2 ; r14 = 2 * dx
    
    sub r13, r14 ; r13 = (2 * dy) - (2 * dx)
    
    add r12, r12 ; r12 = pk + (2 * dy) - (2 * dx) => pk
    
_bresenham_for_loop_end:          
    add r9, 1 ; i++
    
    jmp _bresenham_for_loop_start ; for loop
                                                                                                                                                                                            
_bresenham_end:
    ret

                                                                                                                                                                                                                                                                                                                                                                                                                      
                                                                                                                                                                                                                    
                                                                                                                                                                                                                              
                                                                                                                                                                                                                                        
                                                                                                                                                                                                                                                  
                                                                                                                                                                                                                                                            
                                                                                                                                                                                                                                                                      
                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                    
              
                
                  
                    
                      
                        
                          
                            
                              
                                
                                  
; rax = string address
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

; rax = string address
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

                                                    
                                                      
                                                        
                                                          
                                                            
                                                              
                                                                
                                                                    