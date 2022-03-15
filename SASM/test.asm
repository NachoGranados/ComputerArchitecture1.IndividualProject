%include "io.inc"

section .data

arrayX times 15 dq 0
arrayY times 15 dq 0

section .text
global CMAIN

CMAIN:
    mov rbp, rsp; for correct debugging

    mov rdi, 3
    mov rsi, 2
    mov rdx, 15
    mov rcx, 5

; rdi = x1
; rsi = y1
; rdx = x2 
; rcx = y2 
_bresenham:
    mov rax, rcx ; rax = y2
    sub rax, rsi ; rax = y2 - y1
    imul rax, 2 ; rax = 2 * (y2 - y1) => m_new

    mov rbx, rdx ; rbx = x2
    sub rbx, rdi ; rbx = x2 - x1
    mov r8, rax ; r8 = m_new
    sub r8, rbx ; r8 = m_new - (x2 - x1) => slope_error_new
    mov rbx, r8 ; rbx = m_new - (x2 - x1) => slope_error_new

    mov r8, 0 ; r8 = arrayX and arrayY pointer => offset
    mov r9, arrayX ; r9 = arrayX address
    mov r10, arrayY ; r10 = arrayY address
    mov r11, rdi ; r11 = x1 => x
    mov r12, rsi ; r12 = y1 => y

_bresenham_for_loop:
    cmp r11, rdx ; x <= x2 ?
    jg _bresenham_exit ; x > x2

    mov [r9 + r8], r11 ; arrayX[i] = x
    mov [r10 + r8], r12 ; arrayX[i] = y

    add r8, 4 ; ofset++

    add rbx, rax ; slope_error_new += m_new

_bresenham_if:
    cmp rbx, 0 ; slope_error_new >= 0 ?
    jl _bresenham_continue ; slope_error_new < 0

    add r12, 1 ; y++

    mov r13, rdx ; r13 = x2
    sub r13, rdi ; r13 = x2 - x1
    imul r13, 2 ; r13 = 2 * (x2 - x1)
    sub rbx, r13 ; rbx -= 2 * (x2 - x1) => slope_error_new
    
_bresenham_continue:
    add r11, 1 ; x++

    jmp _bresenham_for_loop ; for loop

_bresenham_exit:

    mov     rbx, 0
    mov     rax, 1
    int     80h
    ret












