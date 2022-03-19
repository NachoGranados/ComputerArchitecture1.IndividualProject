%include "io64.inc"

section .data

array times 10 db 10

section .text

global CMAIN

CMAIN:
    mov rbp, rsp; for correct debugging
    
    mov rdi, 2
    mov rsi, 1
    mov rdx, 2
    mov rcx, 2

; rdi = x1
; rsi = y1
; rdx = x2 
; rcx = y2 
_bresenham:

_equal_x:
    cmp rdi, rdx ; x1 == x2 ?
    jne _next ; x1 != x2
    
_equal_y:    
    cmp rsi, rcx ; y1 == y2 ?
    jne _next ; y1 != y2

    mov rax, 0 ; rax => array offset
    mov rbx, array ; rbx = array address    
       
    mov [rbx + rax], rdi ; array[0] = x1
           
    add rax, 4 ; ofset++    
            
    mov [rbx + rax], rsi ; array[1] = y1
           
    add rax, 4 ; ofset++    
           
    mov [rbx + rax], rdx ; array[2] = x2
            
    add rax, 4 ; ofset++    
           
    mov [rbx + rax], rcx ; array[3] = y2
           
    jmp _exit

_next:
    mov r8, 0 ; r8 => vertical line flag, 0 no, 1 yes
    
_dy:
    mov rax, rcx ; rax = y2
    sub rax, rsi ; rax = y2 - y1 => dy
    
_abs_dy:
    cmp rax, 0 ; dy < 0 ?
    jge _dx ; dy >= 0 
    neg rax ; rax = abs(dy) => dy
    
_dx:        
    mov rbx, rdx ; rbx = x2
    sub rbx, rdi ; rbx = x2 - x1 => dx
    
_abs_dx:
    cmp rbx, 0 ; dx < 0 ?
    jge _horizontal_line ; dy >= 0 
    
    neg rbx ; rbx = abs(dx) => dx

_horizontal_line:
    cmp rax, 0 ; dy == 0 ?
    jne _vertical_line ; dy != 0
    
    jmp _invert_coordinates

_vertical_line:      
    cmp rbx, 0 ; dx == 0 ?
    jne _invert_coordinates ; dx != 0

    mov r8, 1 ; r8 => vertical line flag
    
_invert_coordinates:
    cmp rbx, rax ; dx < dy ?
    jge _loop_variables ; dx >= dy ?
    
    mov r9, rdi ; r9 = x1 => aux
    mov rdi, rsi ; x1 = y1
    mov rsi, r9 ; y1 = aux
    
    mov r10, rdx ; r10 = x2 => aux
    mov rdx, rcx ; x2 = y2
    mov rcx, r10 ; y2 = aux
    
    mov r11, rbx ; r11 = dx => aux
    mov rbx, rax ; dx = dy
    mov rax, r11 ; dy = aux    
    
_loop_variables:
    mov r9, 0 ; r9 => i
    mov r10, 0 ; r10 => array offset
    mov r11, array ; r11 = array address    
    
    mov r12, rax ; r12 = dy
    imul r12, 2 ; r12 = 2 * dy
    sub r12, rbx ; r12 = (2 * dy) - dx => pk
    
_for_loop_start:
    cmp r9, rbx ; i <= dx ?
    jg _exit ; i > dx

_store_coordinate_1:
    cmp r8, 0 ; r8 == 0 ?
    jne _store_coordinate_2 ; r8 != 0
       
    mov [r11 + r10], rdi ; array[i] = x1
    
    add r10, 4 ; ofset++    
    
    mov [r11 + r10], rsi ; array[i] = y1
   
    add r10, 4 ; ofset++
    
    jmp _increase_x
        
_store_coordinate_2:
    mov [r11 + r10], rsi ; array[i] = y1
    
    add r10, 4 ; ofset++    
    
    mov [r11 + r10], rdi ; array[i] = x1
    
    add r10, 4 ; ofset++    
     
_increase_x:    
    cmp rdi, rdx ; x1 < x2 ?
    jge _decrease_x ; x1 >= x2
    
    add rdi, 1 ; x1++
    
    jmp _if
    
_decrease_x:
    sub rdi, 1 ; x1--
    
_if:
    cmp r12, 0 ; pk < 0 ?
    jge _else ; pk >= 0
    
    mov r13, rax ; r13 = dy
    imul r13, 2 ; r13 = 2 * dy
    add r12, r13 ; r12 = pk + (2 * dy) => pk
    
    jmp _for_loop_end

_else:
    
_increase_y:    
    cmp rsi, rcx ; y1 < y2 ?
    jge _decrease_y ; y1 >= y2
    
    add rsi, 1 ; y1++
    
    jmp _continue
    
_decrease_y:
    sub rsi, 1 ; y1--
    
_continue:

    mov r13, rax ; r13 = dy
    imul r13, 2 ; r13 = 2 * dy
    
    mov r14, rbx ; r14 = dx
    imul r14, 2 ; r14 = 2 * dx
    
    sub r13, r14 ; r13 = (2 * dy) - (2 * dx)
    
    add r12, r12 ; r12 = pk + (2 * dy) - (2 * dx) => pk
    
_for_loop_end:    
        
    add r9, 1 ; i++
    
    jmp _for_loop_start ; for loop
      
_exit:
    mov     rbx, 0
    mov     rax, 1
    int     80h
