%include "io64.inc"

section .data

array times 50 db 0

section .text
global CMAIN

CMAIN:
    mov rbp, rsp; for correct debugging
    mov rdi, 4
    mov rsi, 3
    mov rdx, 4
    mov rcx, 4

; rdi = x1
; rsi = y1
; rdx = x2 
; rcx = y2 
_bresenham:
    
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
    jge _two_coordinates_dy ; dy >= 0 
    neg rbx ; rbx = abs(dx) => dx
       
_two_coordinates_dy:
    cmp rax, 1 ; dy <= 1 ?
    jg _two_coordinates_dx; dy > 1
    
    jmp _store_two_coordinates
    
_two_coordinates_dx:    
    cmp rbx , 1 ; dx <= 1 ?
    jg _invert_coordinates; dx > 1    
   
    jmp _store_two_coordinates
    
_invert_coordinates:
    cmp rbx, rax ; dx < dy ?
    jge _loop_variables ; dx >= dy ?
    
    mov r8, rdi ; r8 = x1 => aux
    mov rdi, rsi ; x1 = y1
    mov rsi, r8 ; y1 = aux
    
    mov r9, rdx ; r9 = x2 => aux
    mov rdx, rcx ; x2 = y2
    mov rcx, r9 ; y2 = aux
    
    mov r10, rbx ; r10 = dx => aux
    mov rbx, rax ; dx = dy
    mov rax, r10 ; dy = aux    
    
_loop_variables:
    mov r8, 0 ; r8 => i
    mov r9, 0 ; r9 => array offset
    mov r10, array ; r10 = array address    
    
    mov r11, rax ; r11 = dy
    imul r11, 2 ; r11 = 2 * dy
    sub r11, rbx ; r11 = (2 * dy) - dx => pk
    
_for_loop_start:
    cmp r8, rbx ; i <= dx ?
    jg _exit ; i > dx
    
    mov [r10 + r9], rdi ; array[i] = x1
    
    add r9, 4 ; ofset++    
    
    mov [r10 + r9], rsi ; array[i] = y1
    
    add r9, 4 ; ofset++

_increase_x:    
    cmp rdi, rdx ; x1 < x2 ?
    jge _decrease_x ; x1 >= x2
    
    add rdi, 1 ; x1++
    
    jmp _if
    
_decrease_x:
    sub rdi, 1 ; x1--
    
_if:
    cmp r11, 0 ; pk < 0 ?
    jge _else ; pk >= 0
    
    mov r12, rax ; r12 = dy
    imul r12, 2 ; r12 = 2 * dy
    add r11, r12 ; r11 = pk + (2 * dy) => pk
    
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

    mov r12, rax ; r12 = dy
    imul r12, 2 ; r12 = 2 * dy
    
    mov r13, rbx ; r13 = dx
    imul r13, 2 ; r13 = 2 * dx
    
    sub r12, r13 ; r13 = (2 * dy) - (2 * dx)
    
    add r11, r12 ; r11 = pk + (2 * dy) - (2 * dx) => pk
    
_for_loop_end:    
        
    add r8, 1 ; i++
    
    jmp _for_loop_start ; for loop
        
_store_two_coordinates:
    mov r8, 0 ; r8 => array offset
    mov r9, array ; r9 = array address   

    mov [r9 + r8], rdi ; array[0] = x1
    
    add r8, 4 ; ofset++    
    
    mov [r9 + r8], rsi ; array[1] = y1
    
    add r8, 4 ; ofset++
    
    mov [r9 + r8], rdx ; array[2] = x2
    
    add r8, 4 ; ofset++    
    
    mov [r9 + r8], rcx ; array[3] = y2
      
_exit:
    mov     rbx, 0
    mov     rax, 1
    int     80h
