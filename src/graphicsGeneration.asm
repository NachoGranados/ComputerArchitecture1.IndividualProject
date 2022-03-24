%include "io64.inc"

section .bss

text resb 1764 ; variable to store file contents

section .data

n equ 252 ; number of columns

pixel db '0'

matrix times 63504 db '1'

inputFileName db 'input.txt', 0h
outputFileName db 'output.txt', 0h 
 
coordinatesComma db 2, 0, 3, 1
coordinatesPoint db 1, 0, 2, 0, 1, 1, 2, 1

coordinatesA db 0, 2, 4, 2, 0, 4, 4, 4, 0, 0, 0, 4, 4, 0, 4, 4
coordinatesB db 0, 0, 3, 0, 0, 2, 4, 2, 0, 4, 3, 4, 0, 0, 0, 4, 4, 1, 4, 3
coordinatesC db 0, 0, 4, 0, 0, 4, 4, 4, 0, 0, 0, 4
coordinatesD db 0, 0, 3, 0, 0, 4, 3, 4, 0, 0, 0, 4, 4, 1, 4, 3
coordinatesE db 0, 0, 4, 0, 0, 2, 3, 2, 0, 4, 4, 4, 0, 0, 0, 4
coordinatesF db 0, 2, 3, 2, 0, 4, 4, 4, 0, 0, 0, 4
coordinatesG db 0, 0, 4, 0, 2, 2, 4, 2, 0, 4, 4, 4, 0, 0, 0, 4, 4, 0, 4, 2
coordinatesH db 0, 2, 4, 2, 0, 0, 0, 4, 4, 0, 4, 4
coordinatesI db 0, 0, 4, 0, 0, 4, 4, 4, 2, 0, 2, 4
coordinatesJ db 0, 0, 2, 0, 0, 4, 4, 4, 0, 0, 0, 1, 2, 0, 2, 4
coordinatesK db 0, 0, 0, 4, 0, 1, 3, 4, 0, 3, 3, 0
coordinatesL db 0, 0, 4, 0, 0, 0, 0, 4
coordinatesM db 0, 0, 0, 4, 4, 0, 4, 4, 0, 4, 2, 2, 2, 2, 4, 4
coordinatesN db 0, 0, 0, 4, 4, 0, 4, 4, 0, 4, 4, 0
coordinatesO db 0, 0, 4, 0, 0, 4, 4, 4, 0, 0, 0, 4, 4, 0, 4, 4
coordinatesP db 0, 2, 4, 2, 0, 4, 4, 4, 0, 0, 0, 4, 4, 2, 4, 4
coordinatesQ db 0, 0, 4, 0, 3, 1, 4, 1, 0, 4, 4, 4, 0, 0, 0, 4, 4, 0, 4, 4
coordinatesR db 0, 2, 4, 2, 0, 4, 4, 4, 0, 0, 0, 4, 4, 2, 4, 4, 2, 2, 4, 0
coordinatesS db 0, 0, 4, 0, 0, 2, 4, 2, 0, 4, 4, 4, 0, 2, 0, 4, 4, 0, 4, 2
coordinatesT db 0, 4, 4, 4, 2, 0, 2, 4
coordinatesU db 0, 0, 4, 0, 0, 0, 0, 4, 4, 0, 4, 4
coordinatesV db 0, 3, 0, 4, 4, 3, 4, 4, 1, 1, 2, 0, 0, 3, 1, 2, 2, 0, 3, 1, 3, 2, 4, 3
coordinatesW db 0, 0, 1, 0, 3, 0, 4, 0, 0, 0, 0, 4, 4, 0, 4, 4, 1, 0, 2, 1
coordinatesX db 0, 0, 4, 4, 0, 4, 4, 0
coordinatesY db 2, 0, 2, 2, 0, 4, 2, 2, 2, 2, 4, 4
coordinatesZ db 0, 0, 4, 0, 0, 4, 4, 4, 0, 0, 4, 4

coordinatesSignature db 0, 1, 4, 1, 0, 3, 4, 3, 1, 0, 1, 4, 3, 0, 3, 4

line times 10 db 10

section .text

global CMAIN

CMAIN:
    mov rbp, rsp; for correct debugging  
    
_create_output_text_file:
    mov     rcx, 0777o ; rcx = 0777o
    mov     rbx, outputFileName ; rbx = filename address
    mov     rax, 8 ; rax = 8
    int     80h ; call the kernel
    
_write_output_text_file:
    mov rdx, 63504 ; rdx = number of bytes to write
    mov rcx, matrix ; rcx = matrix base address
    mov rbx, rax ; rbx = file descriptor
    mov rax, 4 ; rax = SYS_WRITE
    int 80h ; call the kernel
    
    mov     rbx, rbx ; rbx = rbx
    mov     rax, 6 ; rax = SYS_CLOSE
    int     80h ; call the kernel     
    
_read_input_text_file: 
    mov     rcx, 0 ; rcx = 0
    mov     rbx, inputFileName ; rcx = inputFileName address
    mov     rax, 5 ; rax = 5
    int     80h ; call the kernel

    mov     rdx, 1764 ; rdx => number of bytes to read
    mov     rcx, text ; rcx = inputFileName address
    mov     rbx, rax ; rbx = rax
    mov     rax, 3 ; rax = 3
    int     80h ; call the kernel
 
    mov     rax, text ; rax = text address
   
    call    _print_string_2 
   
    mov     rbx, rbx ; rbx = rbx
    mov     rax, 6 ; rax = SYS_CLOSE
    int     80h ; call the kernel                    
          
_loops_variables:      
    mov rax, 0 ; rax => letter pointer (text variable)
    mov rbx, 0 ; rbx => coordinates pointer (coordinates variable)
    mov rcx, 0 ; rcx => line pointer (line variable)
    mov rdx, 0 ; rdx => i (output file variable)  
    mov rsi, 1008 ; rsi => j (output file variable)
    mov rdi, 0 ; rdi => letter counter by line
    
_letter_loop_start:  
    push rax ; preserve rax on the stack
    
    mov rax, text ; rax = text address
    
    call _text_length
    
    mov r8, rax ; r8 => text lenght     
    
    pop rax ; restore rax from the stack      

_letter_loop_break_condition_1:     
    cmp rax, r8 ; letter pointer >= text lenght ?
    jl _letter_loop_break_condition_2 ; letter pointer < text lenght
    
    jmp _letter_loop_end

_letter_loop_break_condition_2:      
    mov r8, text ; r8 => text base address
    add r8, rax ; r8 = text base address + letter pointer
    
    movzx r8, byte [r8] ; rdi => current letter
                            
    cmp r8, 32 ; current letter < 32 (" " in ASCII) ?
    jge _pass_1 ; current letter >= 32 (" " in ASCII)   
    
    jmp _letter_loop_end
    
_pass_1:    
    cmp r8, 32 ; current letter == 32 (" " in ASCII) ?
    jne _pass_2 ; current letter != 32 (" " in ASCII)   
                
    jmp _pass_3
    
_pass_2:            
    call _letter_cases_start
    
    ; r8 => coordinatesLetter base address
    
    ; r9 => letter flag
        
    mov r10, 0 ; r10 => coordinates offset
           
    call _draw_letter      

_pass_3:             
    mov rbx, 0 ; coordinates pointer = 0

    add rdx, 6 ; i + 6
        
    mov r8, text ; r8 => text base address
    add r8, rax ; r8 = text base address + letter pointer
    
    movzx r8, byte [r8] ; rdi => current letter
    
    cmp r8, 32 ; current letter == 32 (" " in ASCII) ?
    jne _continue ; current letter != 32 (" " in ASCII)
    
    call _check_word_overflow_start
                
_continue:              

    add rax, 1 ; letter pointer + 1
    
    add rdi, 1 ; letter counter by line + 1
            
    jmp _letter_loop_start

_letter_loop_end:

; **************************************

_signature:
    mov rbx, 0 ; coordinates pointer = 0

    mov r8, coordinatesSignature ; rdi = coordinatesSignature base address
    
    mov r9, 16 ; 8 coordinates or 16 elements in coordinatesSignature
    
    mov r10, 0 ; r10 => coordinates offset

    call _draw_letter

; **************************************

_exit:
    mov rbx, 0 ; rbx = 0
    mov rax, 1 ; rax = 1
    int 80h ; call the kernel
    
; **************************************    
    
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
    int 80h ; call the kernel
 
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
    
; **************************************                                 
                                                                                        
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
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
; **************************************                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
                                                                        
; r8 => current letter
; r9 => letter flag                                                                                                                                                                                                                                                  
_letter_cases_start:

_case_comma:
    cmp r8, 44 ; current letter == 44 (, in ASCII) ?
    jne _case_point ; current letter != 44 (, in ASCII)
    
    mov r9, 4 ; 2 coordinates or 4 elements in coordinatesComma
        
    mov r8, coordinatesComma ; r8 => coordinatesComma base address
    
    jmp _letter_cases_end

_case_point:
    cmp r8, 46 ; current letter == 46 (. in ASCII) ?
    jne _case_A ; current letter != 46 (. in ASCII)
    
    mov r9, 8 ; 4 coordinates or 8 elements in coordinatesPoint
        
    mov r8, coordinatesPoint ; r8 => coordinatesPoint base address
    
    jmp _letter_cases_end

_case_A:
    cmp r8, 65 ; current letter == 65 (A in ASCII) ?
    jne _case_B ; current letter != 65 (A in ASCII)
    
    mov r9, 16 ; 8 coordinates or 16 elements in coordinatesA
        
    mov r8, coordinatesA ; r8 => coordinatesA base address
    
    jmp _letter_cases_end

_case_B:
    cmp r8, 66 ; current letter == 66 (B in ASCII) ?
    jne _case_C ; current letter != 66 (B in ASCII)
    
    mov r9, 20 ; 10 coordinates or 20 elements in coordinatesB
        
    mov r8, coordinatesB ; r8 => coordinatesB base address
    
    jmp _letter_cases_end
    
_case_C:
    cmp r8, 67 ; current letter == 67 (C in ASCII) ?
    jne _case_D ; current letter != 67 (C in ASCII) 
    
    mov r9, 12 ; 6 coordinates or 12 elements in coordinatesC
        
    mov r8, coordinatesC ; r8 => coordinatesC base address
    
    jmp _letter_cases_end

_case_D:
    cmp r8, 68 ; current letter == 68 (D in ASCII) ?
    jne _case_E ; current letter != 68 (D in ASCII) 
    
    mov r9, 16 ; 8 coordinates or 16 elements in coordinatesD
        
    mov r8, coordinatesD ; r8 => coordinatesD base address
    
    jmp _letter_cases_end

_case_E:
    cmp r8, 69 ; current letter == 69 (E in ASCII) ?
    jne _case_F ; current letter != 69 (E in ASCII) 
    
    mov r9, 16 ; 8 coordinates or 16 elements in coordinatesE
        
    mov r8, coordinatesE ; r8 => coordinatesE base address
    
    jmp _letter_cases_end

_case_F:
    cmp r8, 70 ; current letter == 70 (F in ASCII) ?
    jne _case_G ; current letter != 70 (F in ASCII) 
    
    mov r9, 12 ; 6 coordinates or 12 elements in coordinatesF
        
    mov r8, coordinatesF ; r8 => coordinatesF base address
    
    jmp _letter_cases_end

_case_G:
    cmp r8, 71 ; current letter == 71 (G in ASCII) ?
    jne _case_H ; current letter != 71 (G in ASCII) 
    
    mov r9, 20 ; 10 coordinates or 20 elements in coordinatesG
        
    mov r8, coordinatesG ; r8 => coordinatesG base address
    
    jmp _letter_cases_end

_case_H:
    cmp r8, 72 ; current letter == 72 (H in ASCII) ?
    jne _case_I ; current letter != 72 (H in ASCII) 
    
    mov r9, 12 ; 6 coordinates or 12 elements in coordinatesH
        
    mov r8, coordinatesH ; r8 => coordinatesH base address
    
    jmp _letter_cases_end

_case_I:
    cmp r8, 73 ; current letter == 73 (I in ASCII) ?
    jne _case_J ; current letter != 73 (I in ASCII) 
    
    mov r9, 12 ; 6 coordinates or 12 elements in coordinatesI
        
    mov r8, coordinatesI ; r8 => coordinatesI base address
    
    jmp _letter_cases_end

_case_J:
    cmp r8, 74 ; current letter == 74 (J in ASCII) ?
    jne _case_K ; current letter != 74 (J in ASCII) 
    
    mov r9, 16 ; 8 coordinates or 16 elements in coordinatesJ
        
    mov r8, coordinatesJ ; r8 => coordinatesJ base address
    
    jmp _letter_cases_end

_case_K:
    cmp r8, 75 ; current letter == 75 (K in ASCII) ?
    jne _case_L ; current letter != 75 (K in ASCII) 
    
    mov r9, 12 ; 6 coordinates or 12 elements in coordinatesK
        
    mov r8, coordinatesK ; r8 => coordinatesK base address
    
    jmp _letter_cases_end

_case_L:
    cmp r8, 76 ; current letter == 76 (L in ASCII) ?
    jne _case_M ; current letter != 76 (L in ASCII) 
    
    mov r9, 8 ; 4 coordinates or 8 elements in coordinatesL
        
    mov r8, coordinatesL ; r8 => coordinatesL base address
    
    jmp _letter_cases_end

_case_M:
    cmp r8, 77 ; current letter == 77 (M in ASCII) ?
    jne _case_N ; current letter != 77 (M in ASCII) 
    
    mov r9, 16 ; 8 coordinates or 16 elements in coordinatesM
        
    mov r8, coordinatesM ; r8 => coordinatesM base address
    
    jmp _letter_cases_end

_case_N:
    cmp r8, 78 ; current letter == 78 (N in ASCII) ?
    jne _case_O ; current letter != 78 (N in ASCII) 
    
    mov r9, 12 ; 6 coordinates or 12 elements in coordinatesN
        
    mov r8, coordinatesN ; r8 => coordinatesN base address
    
    jmp _letter_cases_end

_case_O:
    cmp r8, 79 ; current letter == 79 (O in ASCII) ?
    jne _case_P ; current letter != 79 (O in ASCII) 
    
    mov r9, 16 ; 8 coordinates or 16 elements in coordinatesO
        
    mov r8, coordinatesO ; r8 => coordinatesO base address
    
    jmp _letter_cases_end

_case_P:
    cmp r8, 80 ; current letter == 80 (P in ASCII) ?
    jne _case_Q ; current letter != 80 (P in ASCII) 
    
    mov r9, 16 ; 8 coordinates or 16 elements in coordinatesP
        
    mov r8, coordinatesP ; r8 => coordinatesP base address
    
    jmp _letter_cases_end

_case_Q:
    cmp r8, 81 ; current letter == 81 (Q in ASCII) ?
    jne _case_R ; current letter != 81 (Q in ASCII) 
    
    mov r9, 20 ; 10 coordinates or 20 elements in coordinatesQ
        
    mov r8, coordinatesQ ; r8 => coordinatesQ base address
    
    jmp _letter_cases_end

_case_R:
    cmp r8, 82 ; current letter == 82 (R in ASCII) ?
    jne _case_S ; current letter != 82 (R in ASCII) 
    
    mov r9, 20 ; 10 coordinates or 20 elements in coordinatesR
        
    mov r8, coordinatesR ; r8 => coordinatesR base address
    
    jmp _letter_cases_end

_case_S:
    cmp r8, 83 ; current letter == 83 (S in ASCII) ?
    jne _case_T ; current letter != 83 (S in ASCII) 
    
    mov r9, 20 ; 10 coordinates or 20 elements in coordinatesS
        
    mov r8, coordinatesS ; r8 => coordinatesS base address
    
    jmp _letter_cases_end

_case_T:
    cmp r8, 84 ; current letter == 84 (T in ASCII) ?
    jne _case_U ; current letter != 84 (T in ASCII) 
    
    mov r9, 8 ; 4 coordinates or 8 elements in coordinatesT
        
    mov r8, coordinatesT ; r8 => coordinatesT base address
    
    jmp _letter_cases_end

_case_U:
    cmp r8, 85 ; current letter == 85 (U in ASCII) ?
    jne _case_V ; current letter != 85 (U in ASCII) 
    
    mov r9, 12 ; 6 coordinates or 12 elements in coordinatesU
        
    mov r8, coordinatesU ; r8 => coordinatesU base address
    
    jmp _letter_cases_end

_case_V:
    cmp r8, 86 ; current letter == 86 (V in ASCII) ?
    jne _case_W ; current letter != 86 (V in ASCII) 
    
    mov r9, 24 ; 12 coordinates or 24 elements in coordinatesV
        
    mov r8, coordinatesV ; r8 => coordinatesV base address
    
    jmp _letter_cases_end

_case_W:
    cmp r8, 87 ; current letter == 87 (W in ASCII) ?
    jne _case_X ; current letter != 87 (W in ASCII) 
    
    mov r9, 20 ; 10 coordinates or 20 elements in coordinatesW
        
    mov r8, coordinatesW ; r8 => coordinatesW base address
    
    jmp _letter_cases_end

_case_X:
    cmp r8, 88 ; current letter == 88 (X in ASCII) ?
    jne _case_Y ; current letter != 88 (X in ASCII) 
    
    mov r9, 8 ; 4 coordinates or 8 elements in coordinatesX
        
    mov r8, coordinatesX ; r8 => coordinatesX base address
    
    jmp _letter_cases_end

_case_Y:
    cmp r8, 89 ; current letter == 89 (Y in ASCII) ?
    jne _case_Z ; current letter != 89 (Y in ASCII) 
    
    mov r9, 12 ; 6 coordinates or 12 elements in coordinatesY
        
    mov r8, coordinatesY ; r8 => coordinatesY base address
    
    jmp _letter_cases_end

_case_Z:
    cmp r8, 90 ; current letter == 90 (Z in ASCII) ?
    jne _case_a ; current letter != 90 (Z in ASCII) 
    
    mov r9, 12 ; 6 coordinates or 12 elements in coordinatesZ
        
    mov r8, coordinatesZ ; r8 => coordinatesZ base address
    
    jmp _letter_cases_end    
    
_case_a:
    cmp r8, 97 ; current letter == 97 (a in ASCII) ?
    jne _case_b ; current letter != 97 (a in ASCII)
    
    mov r9, 16 ; 8 coordinates or 16 elements in coordinatesA
        
    mov r8, coordinatesA ; r8 => coordinatesA base address
    
    jmp _letter_cases_end

_case_b:
    cmp r8, 98 ; current letter == 98 (b in ASCII) ?
    jne _case_c ; current letter != 98 (b in ASCII)
    
    mov r9, 20 ; 10 coordinates or 20 elements in coordinatesB
        
    mov r8, coordinatesB ; r8 => coordinatesB base address
    
    jmp _letter_cases_end
    
_case_c:
    cmp r8, 99 ; current letter == 99 (c in ASCII) ?
    jne _case_d ; current letter != 99 (c in ASCII) 
    
    mov r9, 12 ; 6 coordinates or 12 elements in coordinatesC
        
    mov r8, coordinatesC ; r8 => coordinatesC base address
    
    jmp _letter_cases_end

_case_d:
    cmp r8, 100 ; current letter == 100 (d in ASCII) ?
    jne _case_e ; current letter != 100 (d in ASCII) 
    
    mov r9, 16 ; 8 coordinates or 16 elements in coordinatesD
        
    mov r8, coordinatesD ; r8 => coordinatesD base address
    
    jmp _letter_cases_end

_case_e:
    cmp r8, 101 ; current letter == 101 (e in ASCII) ?
    jne _case_f ; current letter != 101 (e in ASCII) 
    
    mov r9, 16 ; 8 coordinates or 16 elements in coordinatesE
        
    mov r8, coordinatesE ; r8 => coordinatesE base address
    
    jmp _letter_cases_end

_case_f:
    cmp r8, 102 ; current letter == 102 (f in ASCII) ?
    jne _case_g ; current letter != 102 (f in ASCII) 
    
    mov r9, 12 ; 6 coordinates or 12 elements in coordinatesF
        
    mov r8, coordinatesF ; r8 => coordinatesF base address
    
    jmp _letter_cases_end

_case_g:
    cmp r8, 103 ; current letter == 103 (g in ASCII) ?
    jne _case_h ; current letter != 103 (g in ASCII) 
    
    mov r9, 20 ; 10 coordinates or 20 elements in coordinatesG
        
    mov r8, coordinatesG ; r8 => coordinatesG base address
    
    jmp _letter_cases_end

_case_h:
    cmp r8, 104 ; current letter == 104 (h in ASCII) ?
    jne _case_i ; current letter != 104 (h in ASCII) 
    
    mov r9, 12 ; 6 coordinates or 12 elements in coordinatesH
        
    mov r8, coordinatesH ; r8 => coordinatesH base address
    
    jmp _letter_cases_end

_case_i:
    cmp r8, 105 ; current letter == 105 (i in ASCII) ?
    jne _case_j ; current letter != 105 (i in ASCII) 
    
    mov r9, 12 ; 6 coordinates or 12 elements in coordinatesI
        
    mov r8, coordinatesI ; r8 => coordinatesI base address
    
    jmp _letter_cases_end

_case_j:
    cmp r8, 106 ; current letter == 106 (j in ASCII) ?
    jne _case_k ; current letter != 106 (j in ASCII) 
    
    mov r9, 16 ; 8 coordinates or 16 elements in coordinatesJ
        
    mov r8, coordinatesJ ; r8 => coordinatesJ base address
    
    jmp _letter_cases_end

_case_k:
    cmp r8, 107 ; current letter == 107 (k in ASCII) ?
    jne _case_l ; current letter != 107 (k in ASCII) 
    
    mov r9, 12 ; 6 coordinates or 12 elements in coordinatesK
        
    mov r8, coordinatesK ; r8 => coordinatesK base address
    
    jmp _letter_cases_end

_case_l:
    cmp r8, 108 ; current letter == 108 (l in ASCII) ?
    jne _case_m ; current letter != 108 (l in ASCII) 
    
    mov r9, 8 ; 4 coordinates or 8 elements in coordinatesL
        
    mov r8, coordinatesL ; r8 => coordinatesL base address
    
    jmp _letter_cases_end

_case_m:
    cmp r8, 109 ; current letter == 109 (m in ASCII) ?
    jne _case_n ; current letter != 109 (m in ASCII) 
    
    mov r9, 16 ; 8 coordinates or 16 elements in coordinatesM
        
    mov r8, coordinatesM ; r8 => coordinatesM base address
    
    jmp _letter_cases_end

_case_n:
    cmp r8, 110 ; current letter == 110 (n in ASCII) ?
    jne _case_o ; current letter != 110 (n in ASCII) 
    
    mov r9, 12 ; 6 coordinates or 12 elements in coordinatesN
        
    mov r8, coordinatesN ; r8 => coordinatesN base address
    
    jmp _letter_cases_end

_case_o:
    cmp r8, 111 ; current letter == 111 (o in ASCII) ?
    jne _case_p ; current letter != 111 (o in ASCII) 
    
    mov r9, 16 ; 8 coordinates or 16 elements in coordinatesO
        
    mov r8, coordinatesO ; r8 => coordinatesO base address
    
    jmp _letter_cases_end

_case_p:
    cmp r8, 112 ; current letter == 112 (p in ASCII) ?
    jne _case_q ; current letter != 112 (p in ASCII) 
    
    mov r9, 16 ; 8 coordinates or 16 elements in coordinatesP
        
    mov r8, coordinatesP ; r8 => coordinatesP base address
    
    jmp _letter_cases_end

_case_q:
    cmp r8, 113 ; current letter == 113 (q in ASCII) ?
    jne _case_r ; current letter != 113 (q in ASCII) 
    
    mov r9, 20 ; 10 coordinates or 20 elements in coordinatesQ
        
    mov r8, coordinatesQ ; r8 => coordinatesQ base address
    
    jmp _letter_cases_end

_case_r:
    cmp r8, 114 ; current letter == 114 (r in ASCII) ?
    jne _case_s ; current letter != 114 (r in ASCII) 
    
    mov r9, 20 ; 10 coordinates or 20 elements in coordinatesR
        
    mov r8, coordinatesR ; r8 => coordinatesR base address
    
    jmp _letter_cases_end

_case_s:
    cmp r8, 115 ; current letter == 115 (s in ASCII) ?
    jne _case_t ; current letter != 115 (s in ASCII) 
    
    mov r9, 20 ; 10 coordinates or 20 elements in coordinatesS
        
    mov r8, coordinatesS ; r8 => coordinatesS base address
    
    jmp _letter_cases_end

_case_t:
    cmp r8, 116 ; current letter == 116 (t 116 in ASCII) ?
    jne _case_u ; current letter != 116 (t in ASCII) 
    
    mov r9, 8 ; 4 coordinates or 8 elements in coordinatesT
        
    mov r8, coordinatesT ; r8 => coordinatesT base address
    
    jmp _letter_cases_end

_case_u:
    cmp r8, 117 ; current letter == 117 (u in ASCII) ?
    jne _case_v ; current letter != 117 (u in ASCII) 
    
    mov r9, 12 ; 6 coordinates or 12 elements in coordinatesU
        
    mov r8, coordinatesU ; r8 => coordinatesU base address
    
    jmp _letter_cases_end

_case_v:
    cmp r8, 118 ; current letter == 118 (v in ASCII) ?
    jne _case_w ; current letter != 118 (v in ASCII) 
    
    mov r9, 24 ; 12 coordinates or 24 elements in coordinatesV
        
    mov r8, coordinatesV ; r8 => coordinatesV base address
    
    jmp _letter_cases_end

_case_w:
    cmp r8, 119 ; current letter == 119 (w in ASCII) ?
    jne _case_x ; current letter != 119 (w in ASCII) 
    
    mov r9, 20 ; 10 coordinates or 20 elements in coordinatesW
        
    mov r8, coordinatesW ; r8 => coordinatesW base address
    
    jmp _letter_cases_end

_case_x:
    cmp r8, 120 ; current letter == 120 (x in ASCII) ?
    jne _case_y ; current letter != 120 (x in ASCII) 
    
    mov r9, 8 ; 4 coordinates or 8 elements in coordinatesX
        
    mov r8, coordinatesX ; r8 => coordinatesX base address
    
    jmp _letter_cases_end

_case_y:
    cmp r8, 121 ; current letter == 121 (y in ASCII) ?
    jne _case_z ; current letter != 121 (y in ASCII) 
    
    mov r9, 12 ; 6 coordinates or 12 elements in coordinatesY
        
    mov r8, coordinatesY ; r8 => coordinatesY base address
    
    jmp _letter_cases_end

_case_z:                                    
    cmp r8, 122 ; current letter == 122 (z in ASCII) ?
    jne _case_acute_letters ; current letter != 122 (z in ASCII) 
    
    mov r9, 12 ; 6 coordinates or 12 elements in coordinatesZ
        
    mov r8, coordinatesZ ; r8 => coordinatesZ base address
    
    jmp _letter_cases_end                                                  
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
_case_acute_letters:
    cmp r8, 195 ; current letter == 195 (acute letter in ASCII) ?
    jne _letter_cases_end ; current letter != 195 (acute letter in ASCII)
    
    add rax, 1 ; letter pointer + 1
    
    mov r8, text ; r8 => text base address
    add r8, rax ; r8 = text base address + letter pointer
    
    movzx r8, byte [r8] ; rdi => current letter
                                                                                                 
_case_acute_A:                                    
    cmp r8, 129 ; current letter == 129 (Á in ASCII) ?
    jne _case_acute_E ; current letter != 129 (Á in ASCII) 
    
    mov r9, 16 ; 8 coordinates or 16 elements in coordinatesA
        
    mov r8, coordinatesA ; r8 => coordinatesA base address
    
    jmp _letter_cases_end 
    
_case_acute_E:                                     
    cmp r8, 137 ; current letter == 137 (É in ASCII) ?
    jne _case_acute_I ; current letter != 137 (É in ASCII) 
    
    mov r9, 16 ; 8 coordinates or 16 elements in coordinatesE
        
    mov r8, coordinatesE ; r8 => coordinatesE base address
    
    jmp _letter_cases_end 
    
_case_acute_I:                                   
    cmp r8, 141 ; current letter == 141 (Í in ASCII) ?
    jne _case_acute_O ; current letter != 141 (Í in ASCII) 
    
    mov r9, 12 ; 6 coordinates or 12 elements in coordinatesI
        
    mov r8, coordinatesI ; r8 => coordinatesI base address
    
    jmp _letter_cases_end 
    
_case_acute_O:                                   
    cmp r8, 147 ; current letter == 147 (Ó in ASCII) ?
    jne _case_acute_U ; current letter != 147 (Ó in ASCII) 
    
    mov r9, 16 ; 8 coordinates or 16 elements in coordinatesO
        
    mov r8, coordinatesO ; r8 => coordinatesO base address
    
    jmp _letter_cases_end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
                                                                                                                         
_case_acute_U:                                   
    cmp r8, 154 ; current letter == 154 (Ú in ASCII) ?
    jne _case_acute_a ; current letter != 154 (Ú in ASCII) 
    
    mov r9, 12 ; 6 coordinates or 12 elements in coordinatesU
        
    mov r8, coordinatesU ; r8 => coordinatesU base address
    
    jmp _letter_cases_end                                                                                                                                     
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
_case_acute_a:                                    
    cmp r8, 161 ; current letter == 161 (á in ASCII) ?
    jne _case_acute_e ; current letter != 161 (á in ASCII) 
    
    mov r9, 16 ; 8 coordinates or 16 elements in coordinatesA
        
    mov r8, coordinatesA ; r8 => coordinatesA base address
    
    jmp _letter_cases_end 
    
_case_acute_e:                                     
    cmp r8, 169 ; current letter == 169 (é in ASCII) ?
    jne _case_acute_i ; current letter != 169 (é in ASCII) 
    
    mov r9, 16 ; 8 coordinates or 16 elements in coordinatesE
        
    mov r8, coordinatesE ; r8 => coordinatesE base address
    
    jmp _letter_cases_end 
    
_case_acute_i:                                   
    cmp r8, 173 ; current letter == 173 (í in ASCII) ?
    jne _case_acute_o ; current letter != 173 (í in ASCII) 
    
    mov r9, 12 ; 6 coordinates or 12 elements in coordinatesI
        
    mov r8, coordinatesI ; r8 => coordinatesI base address
    
    jmp _letter_cases_end 
    
_case_acute_o:                                   
    cmp r8, 179 ; current letter == 179 (ó in ASCII) ?
    jne _case_acute_u ; current letter != 179 (ó in ASCII) 
    
    mov r9, 16 ; 8 coordinates or 16 elements in coordinatesO
        
    mov r8, coordinatesO ; r8 => coordinatesO base address
    
    jmp _letter_cases_end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
                                                                                                                         
_case_acute_u:                                   
    cmp r8, 186 ; current letter == 186 (ú in ASCII) ?
    jne _case_acute_N ; current letter != 186 (ú in ASCII) 
    
    mov r9, 12 ; 6 coordinates or 12 elements in coordinatesU
        
    mov r8, coordinatesU ; r8 => coordinatesU base address
    
    jmp _letter_cases_end                                                                                                                                                                      
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
 _case_acute_N:                                   
    cmp r8, 145 ; current letter == 145 (Ñ in ASCII) ?
    jne _case_acute_n ; current letter != 145 (Ñ in ASCII) 
    
    mov r9, 12 ; 6 coordinates or 12 elements in coordinatesN
        
    mov r8, coordinatesN ; r8 => coordinatesN base address
    
    jmp _letter_cases_end
                                                                                                                                                                                                                            
_case_acute_n:                                   
    ; current letter = 177 (ñ in ASCII)
    
    mov r9, 12 ; 6 coordinates or 12 elements in coordinatesN
        
    mov r8, coordinatesN ; r8 => coordinatesN base address
                                                                                                                                                                                                                                                                       
_letter_cases_end:
    ret

; **************************************

; rbx => coordinates pointer
; r8 => coordinatesLetter base address
; r9 => letter flag
; r10 => coordinates offset
_draw_letter:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  

_coordinates_loop_start:
    cmp rbx, r9 ; coordinates pointer < letter flag ?
    jge _coordinates_loop_end ; coordinates pointer >= letter flag
                 
    push rax ; preserve rax on the stack
    push rbx ; preserve rbx on the stack
    push rcx ; preserve rcx on the stack
    push rdx ; preserve rdx on the stack
    push rsi ; preserve rsi on the stack
    push rdi ; preserve rdi on the stack
    push r8 ; preserve r8 on the stack
    push r9 ; preserve r9 on the stack
    
    mov rax, r8 ; rax => coordinatesLetter base address
    
    movzx rdi, byte [rax + r10] ; coordinatesLetter[coordinates offset] = x1
    inc r10 ; coordinates offset + 1
    
    movzx rsi, byte [rax + r10] ; coordinatesLetter[coordinates offset] = y1
    inc r10 ; coordinates offset + 1
        
    movzx rdx, byte [rax + r10] ; coordinatesLetter[coordinates offset] = x2
    inc r10 ; coordinates offset + 1
    
    movzx rcx, byte [rax + r10] ; coordinatesLetter[coordinates offset] = y2
    inc r10 ; coordinates offset + 1
        
    push r10 ; preserve r10 on the stack   
                   
    call _bresenham
    
    ; r10 => number of coordinates of current line
    
    mov r11, r10 ; r11 = number of coordinates of current line
      
    pop r10 ; restore r10 from the stack
    pop r9 ; restore r9 from the stack
    pop r8 ; restore r8 from the stack
    pop rdi ; restore rdi from the stack
    pop rsi ; restore rsi from the stack
    pop rdx ; restore rdx from the stack
    pop rcx ; restore rcx from the stack
    pop rbx ; restore rbx from the stack
    pop rax ; restore rax from the stack
    
    mov r12, line ; r12 => line base address    
    
_line_loop_start:
    cmp rcx, r11 ; line pointer < number of coordinates of current line ?
    jge _line_loop_end ; line pointer >= number of coordinates of current line
    
    mov r13, rcx ; r13 => line pointer
    
    movzx r14, byte [r12 + r13] ; r14 = line[line pointer] => x
    
    inc r13 ; line pointer + 1
    
    movzx r15, byte [r12 + r13] ; r15 = line[line pointer] => y
    
    push rdx ; preserve rsi on the stack
    push rsi ; preserve rdi on the stack
    
    add rdx, r14 ; rdx = i + x => i_new
    
    mov r14, n ; r14 = n
    imul r14, r15 ; r14 = n * y
    sub rsi, r14 ; rsi = j - (n * y) => j_new
    
    add rdx, rsi ; rdx = i_new + j_new
    
    mov r13, rdx ; r13 = i_new + j_new
    
    pop rsi ; restore rdi from the stack
    pop rdx ; restore rsi from the stack 
        
    push rax ; preserve rax on the stack
    push rbx ; preserve rbx on the stack
    push rcx ; preserve rcx on the stack
    push rdx ; preserve rdx on the stack    
       
    call _update_output_file         
    
    pop rdx ; restore rdx from the stack
    pop rcx ; restore rcx from the stack
    pop rbx ; restore rbx from the stack
    pop rax ; restore rax from the stack
    
    add rcx, 2 ; line pointer + 2
    
    jmp _line_loop_start

_line_loop_end:

    mov rcx, 0 ; line pointer = 0 

    add rbx, 4 ; coordinates pointer + 4
    
    jmp _coordinates_loop_start

_coordinates_loop_end:
    ret

; **************************************                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
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
    mov rbx, line ; rbx = array address    
       
    mov [rbx + rax], rdi ; array[0] = x1
           
    add rax, 4 ; ofset++    
            
    mov [rbx + rax], rsi ; array[1] = y1
           
    add rax, 4 ; ofset++    
           
    mov [rbx + rax], rdx ; array[2] = x2
            
    add rax, 4 ; ofset++    
           
    mov [rbx + rax], rcx ; array[3] = y2
           
    ret

_next:
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
       
    inc r10 ; ofset++    
    
    mov [r11 + r10], rsi ; array[i] = y1
      
    inc r10 ; ofset++
    
    jmp _bresenham_increase_x
        
_bresenham_store_coordinate_2:
    mov [r11 + r10], rsi ; array[i] = y1
       
    inc r10 ; ofset++    
    
    mov [r11 + r10], rdi ; array[i] = x1
       
    inc r10 ; ofset++    
     
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
                                                                                                                                                                                                                            
; **************************************                                                                                                                                                                                                                                         

; r13 => number of bytes to move the cursor                                                                                                                                                                                                                                                                         
_update_output_file:
    mov     rcx, 1 ; rcx = write only access mode
    mov     rbx, outputFileName ; rbx = outputFileName base address
    mov     rax, 5 ; rax = SYS_OPEN
    int     80h ; call the kernel
 
    mov     rdx, 0 ; rdx = SEEK_SET
    mov     rcx, r13 ; rcx = r13 => number of bytes to move the cursor 
    mov     rbx, rax ; rbx = opened file descriptor
    mov     rax, 19 ; rax = SYS_LSEEK
    int     80h ; call the kernel
 
    mov     rdx, 1 ; rdx = number of bytes to write
    mov     rcx, pixel ; rcx = string base address
    mov     rbx, rbx ; rbx = opened file descriptor
    mov     rax, 4 ; rax = SYS_WRITE
    int     80h ; call the kernel
    
    mov     rbx, rbx ; rbx = rbx
    mov     rax, 6 ; rax = SYS_CLOSE
    int     80h ; call the kernel
    
    ret       
    
; **************************************

; rdi => letter counter by line                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
_check_word_overflow_start:
    
    call _word_length_start   
       
    ; r8 = word length
    
_check_word_overflow_division:    
    mov r9, rdi ; r9 = letter counter by line
    
    add r9, r8 ; r9 = letter counter by line + word length => overflow
    
    cmp r9, 41 ; overflow > 41 ? 
    jle _check_word_overflow_end ; overflow =< 41
            
    mov rdx, 0 ; i = 0
    add rsi, 1512 ; j + 1512
    
    mov rdi, 0 ; letter counter by line = 0
            
_check_word_overflow_end:
    ret

; ************************************** 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
; rax => letter pointer                                                                                                   
_word_length_start:
    mov r8, 0 ; r8 => word length   

    mov r9, rax ; r9 = letter pointer
    add r9, 1 ; r9 = letter pointer + 1
    
_word_length_loop:    
    mov r10, text; r10 => text base address
    
    add r10, r9 ; r10 = text base address + letter pointer
    
    movzx r10, byte [r10] ; r10 => current letter
    
    cmp r10, 32 ; current letter > 32 (" " in ASCII) ?
    jle _word_length_end ; current letter <= 32 (" " in ASCII)                
              
    add r8, 1 ; r8 = word length + 1
    add r9, 1 ; r9 = letter pointer + 1     
    
    jmp _word_length_loop
                                                                                                                          
_word_length_end:
    ret                                                                                                     
                                                                    
