%include "io64.inc"

section .data

array times 30 db 0

section .text
global CMAIN

CMAIN:
    mov rbp, rsp; for correct debugging
    mov rdi, 0
    mov rsi, 4
    mov rdx, 4
    mov rcx, 0

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
    neg rax ; rax = abs(dy) => absdy
    
_dx:        
    mov rbx, rdx ; rbx = x2
    sub rbx, rdi ; rbx = x2 - x1 => dx
    
_abs_dx:
    cmp rbx, 0 ; dx < 0 ?
    jge _first_coordinates ; dy >= 0 
    neg rbx ; rbx = abs(dx) => absdx
    
_first_coordinates:

    mov r8, array ; r8 => array address
    mov r9, 0 ; r9 => offset  
     
    mov [r8 + r9], rdi ; array[0] = x1
    
    add r9, 4 ; ofset++    
    
    mov [r8 + r9], rsi ; array[1] = y1
 
_loop_variables:
    mov r8, 0 ; r8 => i
    mov r9, 8 ; r9 => array offset (third position)
    mov r10, array ; r10 = array address
    mov r11, rdi ; r11 = x1 => x
    mov r12, rsi ; r12 = y1 => y
     
_negative_slope:
    cmp rbx, rax ; absdx > absdy ?
    jle _positive_slope ; absdx <= absdy  
    
    mov r13, rax ; r13 = absdy
    imul r13, 2 ; r13 = 2 * absdy
    sub r13, rbx ; r13 = (2 * absdy) - absdx => pk
        
_negative_loop:
    cmp r8, rbx ; i < absdx ?
    jge _bresenham_exit ; i >= absdx
    
    add r11, 1 ; x++
    
_negative_if:
    cmp r13, 0 ; pk < 0 ?
    jge _negative_else ; pk >= 0
    
    mov r14, rax ; r14 = absdy
    imul r14, 2 ; r14 = 2 * absdy
    add r13, r14 ; r13 = pk + (2 * absdy) => pk
    
    jmp _negative_continue      
    
_negative_else:
    add r12, 1 ; y++
    
    mov r14, rax ; r14 = absdy
    imul r14, 2 ; r14 = 2 * absdy
    
    mov r15, rbx ; r15 = absdx
    imul r15, 2 ; r15 = 2 * absdx
    
    sub r14, r15 ; r14 = (2 * absdy) - (2 * absdx)
    
    add r13, r14 ; r13 = pk + (2 * absdy) - (2 * absdx) => pk
    
_negative_continue:
    mov [r10 + r9], r11 ; array[i] = x

    add r9, 4 ; ofset++
    
    mov [r10 + r9], r12 ; array[i] = y
    
    add r9, 4 ; ofset++

    add r8, 1 ; i++
    
    jmp _negative_loop ; for loop

_positive_slope:  
    mov r13, rbx ; r13 = absdx
    imul r13, 2 ; r13 = 2 * absdx
    sub r13, rax ; r13 = (2 * absdx) - absdy => pk

_positive_loop:
    cmp r8, rax ; i < absdy ?
    jge _bresenham_exit ; i >= absdx
    
    add r12, 1 ; y++

_positive_if:
    cmp r13, 0 ; pk < 0 ?
    jge _positive_else
    
    mov r14, rbx ; r14 = absdx
    imul r14, 2 ; r14 = 2 * absdx
    add r13, r14 ; r13 = pk + (2 * absdx) => pk
    
    jmp _positive_continue      
    
_positive_else:
    add r11, 1 ; x++
    
    mov r14, rbx ; r14 = absdx
    imul r14, 2 ; r14 = 2 * absdx
    
    mov r15, rax ; r15 = absdy
    imul r15, 2 ; r15 = 2 * absdy
    
    sub r14, r15 ; r14 = (2 * absdx) - (2 * absdy)
    
    add r13, r14 ; r13 = pk + (2 * absdx) - (2 * absdy) => pk
    
_positive_continue:
    mov [r10 + r9], r11 ; array[i] = x

    add r9, 4 ; ofset++
    
    mov [r10 + r9], r12 ; array[i] = y
    
    add r9, 4 ; ofset++

    add r8, 1 ; i++
    
    jmp _positive_loop ; for loop

_bresenham_exit:
    mov     rbx, 0
    mov     rax, 1
    int     80h
