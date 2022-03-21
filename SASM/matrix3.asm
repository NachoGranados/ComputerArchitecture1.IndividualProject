%include "io64.inc"

section .bss

;text resb 255 ; variable to store file contents

section .data

n equ 250 ; number of columns

pixel db '0'

matrix times 62500 db '`'

text db 'LAS BALLENAS SON UNOS ENORMES ANIMALES QUE PUEDEN ALCANZAR LOS VEINTE METROS DE LARGO. A PESAR DE SU TAMANO, SE ALIMENTAN DE PLANCTON. EL PLANCTON ESTA FORMADO POR PEQUENOS ANIMALES QUE VIVEN EN LA SUPERFICIE DEL MAR. LO FORMAN MILLONES DE LARVAS QUE CUANDO SE HACEN GRANDES SE TRANSFORMAN EN CANGREJOS, GAMBAS, ETC. LA BALLENA, PARA COMERLOS, ABRE LA BOCA Y TRAGA UNA GRAN CANTIDAD DE AGUA. EL AGUA ES FILTRADA Y DEVUELTA AL MAR. EL PLANCTON QUEDA ATRAPADO EN UNA ESPECIE DE FILTRO Y LE SIRVE DE ALIMENTO. LUEGO VUELVE A TRAGAR OTRA GRAN CANTIDAD DE AGUA Y ASI MUCHAS VECES. DE ESTA FORMA, EL ANIMAL MAS GRANDE DE LA TIERRA, SE ALIMENTA DE UNOS ANIMALITOS TAN PEQUENOS, QUE ES DIFICIL VERLOS A SIMPLE VISTA.' ; variable to store file contents

inputFileName db 'input.txt', 0h
outputFileName db 'output.txt', 0h 

;coordinates times 10 db 10
;coordinates db 0

coordinatesComma db 2, 0, 3, 1
coordinatesPoint db 1, 0, 2, 0, 1, 1, 2, 1

;                        *           *           *           *           *           *
;               1  2  3  4  5  6  7  8  9  10 11 12 13 14 15 16 17 18 19 20 21 22 23 24
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
;coordinatesL db 0, 0, 4, 0, 0, 1, 0, 4




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

line times 10 db 10

;text db 'Las ballenas son unos enormes animales que pueden alcanzar los veinte metros de largo. A pesar de su tamano, se alimentan de plancton. El plancton esta formado por pequenos animales que viven en la superficie del mar. Lo forman millones de larvas que cuando se hacen grandes se transforman en cangrejos, gambas, etc. La ballena, para comerlos, abre la boca y traga una gran cantidad de agua. El agua es filtrada y devuelta al mar. El plancton queda atrapado en una especie de filtro y le sirve de alimento. Luego vuelve a tragar otra gran cantidad de agua y asi muchas veces. De esta forma, el animal mas grande de la tierra, se alimenta de unos animalitos tan pequenos, que es dificil verlos a simple vista.' ; variable to store file contents

;matrix times 1500 db '1'

section .text

global CMAIN

CMAIN:
    mov rbp, rsp; for correct debugging  
    
_read_input_text_file: 
    ;mov     rcx, 0 ; rcx = 0
    ;mov     rbx, inputFileName ; rcx = inputFileName address
    ;mov     rax, 5 ; rax = 5
    ;int     80h ; call the kernel

    ;mov     rdx, 1000 ; rdx => number of bytes to read
    ;mov     rcx, inputFileName ; rcx = inputFileName address
    ;mov     rbx, rax ; rbx = rax
    ;mov     rax, 3 ; rax = 3
    ;int     80h ; call the kernel
 
    ;mov     rax, text ; rax = text address
   
    ;call    _print_string_2   
            
_create_output_text_file:
    mov     rcx, 0777o ; rcx = 0777o
    mov     rbx, outputFileName ; rbx = filename address
    mov     rax, 8 ; rax = 8
    int     80h ; call the kernel
    
_write_output_text_file:
    mov rdx, 62500 ; rdx = number of bytes to write
    mov rcx, matrix ; rcx = matrix base address
    mov rbx, rax ; rbx = file descriptor
    mov rax, 4 ; rax = SYS_WRITE
    int 80h ; call the kernel   
    
    
    
    
    
    
    
    
    
    
    
;_open_output_text_file:
;    mov     rcx, 0 ; rcx = 0
;    mov     rbx, outputFileName ; rbx = filename address
;    mov     rax, 5 ; rax = 5
;    int     80h ; call the kernel


    
    ;jmp _exit
















_loops_variables:      
    mov rax, 0 ; rax => letter pointer (text variable)
    mov rbx, 0 ; rbx => coordinates pointer (coordinates variable)
    mov rcx, 0 ; rcx => line pointer (line variable)
    mov rdx, 0 ; rdx => i (matrix variable)
    ;mov rsi, 4 ; rsi => j (matrix variable)   
    mov rsi, 1000 ; rsi => j (matrix variable)   
    
_letter_loop_start:  
    push rax ; preserve rax on the stack
    
    mov rax, text ; rax = text address
    
    call _text_length
    
    mov rdi, rax ; rdi => text lenght     
    
    pop rax ; restore rax from the stack

    cmp rax, rdi ; letter pointer < len ?
    jge _letter_loop_end ; letter pointer >= len
    
    
    
    
    
    
    mov rdi, text ; rdi => text base address
    add rdi, rax ; rdi = text base address + letter pointer
    
    movzx rdi, byte [rdi] ; rdi => current letter
    
    cmp rdi, 32 ; current letter == 32 (" " in ASCII) ?
    jne _pass ; current letter != 32 (" " in ASCII)
    
    jmp _coordinates_loop_end
      
    
    
_pass:    
    mov r8, 0 ; r8 => letter flag
    
    
    
  
    
    
    
    
    
    
    
    
    call _letter_cases_start
    
    
    
    ; CASES DE LAS LETRAS
    ; ASIGNAR EL FLAG DE CADA LETRA QUE ES LA CANTIDAD DE CORDENADAS QUE ESA LETRA TIENE
    
    ; AL FINAL DE LOS CASES, rdi ALMACENARA LA DIRECCION DE MEMORIA DEL ARREGLO DE COORDENADAS DE LA RESPECTIVA LETRA
    
    
    
    mov r9, 0 ; r9 => coordinates offset    
    
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
    
   ;mov rax, coordinates ; rax => coordinates base address
    mov rax, rdi ; rax => coordinates base address
    
    ;mov rdi, [rax + r9] ; cordinates[ofset] = x1        
    ;add r9, 8 ; ofset++    
    movzx rdi, byte [rax + r9] ; cordinates[ofset] = x1
    inc r9
    
    ;mov rsi, [rax + r9] ; cordinates[ofset] = y1       
    ;add r9, 8 ; ofset++     
    movzx rsi, byte [rax + r9] ; cordinates[ofset] = y1
    inc r9
        
    ;mov rdx, [rax + r9] ; cordinates[ofset] = x2    
    ;add r9, 8 ; ofset++         
    movzx rdx, byte [rax + r9] ; cordinates[ofset] = x2
    inc r9
    
    ;mov rcx, [rax + r9] ; cordinates[ofset] = y2    
    ;add r9, 8 ; ofset++
    movzx rcx, byte [rax + r9] ; cordinates[ofset] = y2
    inc r9
    
    
    push r9 ; preserve r9 on the stack   
               
    ; LLAMAR AL ALGORITMO DE BRESENHAM
    
    ;mov rdi, 0
    ;mov rsi, 2
    ;mov rdx, 4
    ;mov rcx, 3    
    
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
    
    ;sar r10, 2 ; r10 => number of coordinates of current line ****************
    mov r11, line ; r11 => line base address    
    
_line_loop_start:
    cmp rcx, r10 ; line pointer < number of coordinates of current line ?
    jge _line_loop_end ; line pointer >= number of coordinates of current line
    
    mov r12, rcx ; r12 => line pointer
    ;imul r12, 8 ; r12 = line pointer * 8 ???????????????????????????????????????
    
    ;mov r13, [r11 + r12] ; r13 = line[line pointer] => x
    movzx r13, byte [r11 + r12] ; r13 = line[line pointer] => x
    
    ;add r12, 8 ; line pointer ++
    inc r12 ; line pointer ++
    
    ;mov r14, [r11 + r12] ; r14 = line[line pointer] => y
    movzx r14, byte [r11 + r12] ; r14 = line[line pointer] => y
    
    push rdx ; preserve rsi on the stack
    push rsi ; preserve rdi on the stack
    
    add rdx, r13 ; rdx = x + i => i_new
    
    mov r15, n ; r15 = n
    imul r14, r15 ; r14 = n * y
    sub rsi, r14 ; rsi = j - (n * y) => j_new
    
    ;mov r15, n ; r15 => n
    ;imul r15, rdx ; r15 = n * i_new
    ;add r15, rsi ; r15 = (n * i_new) + j_new
    
    ;imul rdx, 4;  rdx = 4 * i_new
    ;add rdx, rsi ; rdx = (4 * i_new) + j_new
    add rdx, rsi ; rdx = i_new + j_new
    
    ;mov r15, rdx ; r15 = (4 * i_new) + j_new
    mov r13, rdx ; r13 = i_new + j_new
    
    pop rsi ; restore rdi from the stack
    pop rdx ; restore rsi from the stack 
    
    ;mov r13, matrix ; r13 => matrix base address
    
    ;mov r14, pixel ; r14 => pixel
    ;movzx r14, byte [r14] ; r14 = '0'
    ;mov r14, 5
    
    ;mov r12, 0
    ;add r12, r13
    ;add r12, r15
    
    ;push r13
    
    ;add r13, r15
    
    ;pop r13
    
    ;mov [r13 + r15], r14 ; matrix[i_new + j_new] = pixel
    
    push rax ; preserve rax on the stack
    push rbx ; preserve rbx on the stack
    push rcx ; preserve rcx on the stack
    push rdx ; preserve rdx on the stack    
   
    ;mov [r13 + r15], r14 ; matrix[i_new + j_new] = pixel 
    
    call _update_output_file         
    
    pop rdx ; restore rdx from the stack
    pop rcx ; restore rcx from the stack
    pop rbx ; restore rbx from the stack
    pop rax ; restore rax from the stack
    
    add rcx, 2 ; line pointer + 2
    
    jmp _line_loop_start

_line_loop_end:

    mov rcx, 0 ; line pointer = 0 

    ;add rdx, 6 ; i + 6

    add rbx, 4 ; coordinates pointer + 4
    
    jmp _coordinates_loop_start

_coordinates_loop_end:

    mov rbx, 0 ; coordinates pointer = 0

    add rax, 1 ; letter pointer + 1

    add rdx, 6 ; i + 6   
    
    push rax ; preserve rax on the stack
    push rbx ; preserve rbx on the stack
    ;push rcx ; preserve rcx on the stack
    push rdx ; preserve rdx on the stack
    
    ;mov rax, 82 ; dividendo
    
    ; rax => dividend
    
    mov rdx, 0 ; rdx => residue
    
    mov rbx, 41 ; rbx => divider
    
    div rbx ; rax = rax / rbx
    
    mov r14, rdx ; r14 = rdx => residue
    
    pop rdx ; restore rdx from the stack
    ;pop rcx ; restore rcx from the stack
    pop rbx ; restore rbx from the stack
    pop rax ; restore rax from the stack
    
    cmp r14, 0 ; residue == 0 ?
    jne _continue ; residue != 0
    
    mov rdx, 0 ; i = 0
    add rsi, 1500 ; j + 1500
            
_continue:              

    ;add rax, 1 ; letter pointer + 1
            
    jmp _letter_loop_start

_letter_loop_end:
        
_exit:
    mov rbx, 0 ; rbx = 0
    mov rax, 1; rax = 1
    int 80h  
    
      
        
          
  
  
  
  
            
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
                                                    
                                                              
                                                                        
; rdi => current letter
; r8 => letter flag                                                                                                                                                                                                                                                  
_letter_cases_start:

_case_comma:
    cmp rdi, 44 ; current letter == 44 (, in ASCII) ?
    jne _case_point ; current letter != 44 (, in ASCII)
    
    mov r8, 4 ; 2 coordinates or 4 elements in coordinatesComma
        
    mov rdi, coordinatesComma ; rdi => coordinatesComma base address
    
    jmp _letter_cases_end

_case_point:
    cmp rdi, 46 ; current letter == 46 (. in ASCII) ?
    jne _case_A ; current letter != 46 (. in ASCII)
    
    mov r8, 8 ; 4 coordinates or 8 elements in coordinatesPoint
        
    mov rdi, coordinatesPoint ; rdi => coordinatesPoint base address
    
    jmp _letter_cases_end

_case_A:
    cmp rdi, 65 ; current letter == 65 (A in ASCII) ?
    jne _case_B ; current letter != 65 (A in ASCII)
    
    mov r8, 16 ; 8 coordinates or 16 elements in coordinatesA
        
    mov rdi, coordinatesA ; rdi => coordinatesA base address
    
    jmp _letter_cases_end

_case_B:
    cmp rdi, 66 ; current letter == 66 (B in ASCII) ?
    jne _case_C ; current letter != 66 (B in ASCII)
    
    mov r8, 20 ; 10 coordinates or 20 elements in coordinatesB
        
    mov rdi, coordinatesB ; rdi => coordinatesB base address
    
    jmp _letter_cases_end
    
_case_C:
    cmp rdi, 67 ; current letter == 67 (C in ASCII) ?
    jne _case_D ; current letter != 67 (C in ASCII) 
    
    mov r8, 12 ; 6 coordinates or 12 elements in coordinatesC
        
    mov rdi, coordinatesC ; rdi => coordinatesC base address
    
    jmp _letter_cases_end

_case_D:
    cmp rdi, 68 ; current letter == 68 (D in ASCII) ?
    jne _case_E ; current letter != 68 (D in ASCII) 
    
    mov r8, 16 ; 8 coordinates or 16 elements in coordinatesD
        
    mov rdi, coordinatesD ; rdi => coordinatesD base address
    
    jmp _letter_cases_end

_case_E:
    cmp rdi, 69 ; current letter == 69 (E in ASCII) ?
    jne _case_F ; current letter != 69 (E in ASCII) 
    
    mov r8, 16 ; 8 coordinates or 16 elements in coordinatesE
        
    mov rdi, coordinatesE ; rdi => coordinatesE base address
    
    jmp _letter_cases_end

_case_F:
    cmp rdi, 70 ; current letter == 70 (F in ASCII) ?
    jne _case_G ; current letter != 70 (F in ASCII) 
    
    mov r8, 12 ; 6 coordinates or 12 elements in coordinatesF
        
    mov rdi, coordinatesF ; rdi => coordinatesF base address
    
    jmp _letter_cases_end

_case_G:
    cmp rdi, 71 ; current letter == 71 (G in ASCII) ?
    jne _case_H ; current letter != 71 (G in ASCII) 
    
    mov r8, 20 ; 10 coordinates or 20 elements in coordinatesG
        
    mov rdi, coordinatesG ; rdi => coordinatesG base address
    
    jmp _letter_cases_end

_case_H:
    cmp rdi, 72 ; current letter == 72 (H in ASCII) ?
    jne _case_I ; current letter != 72 (H in ASCII) 
    
    mov r8, 12 ; 6 coordinates or 12 elements in coordinatesH
        
    mov rdi, coordinatesH ; rdi => coordinatesH base address
    
    jmp _letter_cases_end

_case_I:
    cmp rdi, 73 ; current letter == 73 (I in ASCII) ?
    jne _case_J ; current letter != 73 (I in ASCII) 
    
    mov r8, 12 ; 6 coordinates or 12 elements in coordinatesI
        
    mov rdi, coordinatesI ; rdi => coordinatesI base address
    
    jmp _letter_cases_end

_case_J:
    cmp rdi, 74 ; current letter == 74 (J in ASCII) ?
    jne _case_K ; current letter != 74 (J in ASCII) 
    
    mov r8, 16 ; 8 coordinates or 16 elements in coordinatesJ
        
    mov rdi, coordinatesJ ; rdi => coordinatesJ base address
    
    jmp _letter_cases_end

_case_K:
    cmp rdi, 75 ; current letter == 75 (K in ASCII) ?
    jne _case_L ; current letter != 75 (K in ASCII) 
    
    mov r8, 12 ; 6 coordinates or 12 elements in coordinatesK
        
    mov rdi, coordinatesK ; rdi => coordinatesK base address
    
    jmp _letter_cases_end

_case_L:
    cmp rdi, 76 ; current letter == 76 (L in ASCII) ?
    jne _case_M ; current letter != 76 (L in ASCII) 
    
    mov r8, 8 ; 4 coordinates or 8 elements in coordinatesL
        
    mov rdi, coordinatesL ; rdi => coordinatesL base address
    
    jmp _letter_cases_end

_case_M:
    cmp rdi, 77 ; current letter == 77 (M in ASCII) ?
    jne _case_N ; current letter != 77 (M in ASCII) 
    
    mov r8, 16 ; 8 coordinates or 16 elements in coordinatesM
        
    mov rdi, coordinatesM ; rdi => coordinatesM base address
    
    jmp _letter_cases_end

_case_N:
    cmp rdi, 78 ; current letter == 78 (N in ASCII) ?
    jne _case_O ; current letter != 78 (N in ASCII) 
    
    mov r8, 12 ; 6 coordinates or 12 elements in coordinatesN
        
    mov rdi, coordinatesN ; rdi => coordinatesN base address
    
    jmp _letter_cases_end

_case_O:
    cmp rdi, 79 ; current letter == 79 (O in ASCII) ?
    jne _case_P ; current letter != 79 (O in ASCII) 
    
    mov r8, 16 ; 8 coordinates or 16 elements in coordinatesO
        
    mov rdi, coordinatesO ; rdi => coordinatesO base address
    
    jmp _letter_cases_end

_case_P:
    cmp rdi, 80 ; current letter == 80 (P in ASCII) ?
    jne _case_Q ; current letter != 80 (P in ASCII) 
    
    mov r8, 16 ; 8 coordinates or 16 elements in coordinatesP
        
    mov rdi, coordinatesP ; rdi => coordinatesP base address
    
    jmp _letter_cases_end

_case_Q:
    cmp rdi, 81 ; current letter == 81 (Q in ASCII) ?
    jne _case_R ; current letter != 81 (Q in ASCII) 
    
    mov r8, 20 ; 10 coordinates or 20 elements in coordinatesQ
        
    mov rdi, coordinatesQ ; rdi => coordinatesQ base address
    
    jmp _letter_cases_end

_case_R:
    cmp rdi, 82 ; current letter == 82 (R in ASCII) ?
    jne _case_S ; current letter != 82 (R in ASCII) 
    
    mov r8, 20 ; 10 coordinates or 20 elements in coordinatesR
        
    mov rdi, coordinatesR ; rdi => coordinatesR base address
    
    jmp _letter_cases_end

_case_S:
    cmp rdi, 83 ; current letter == 83 (S in ASCII) ?
    jne _case_T ; current letter != 83 (S in ASCII) 
    
    mov r8, 20 ; 10 coordinates or 20 elements in coordinatesS
        
    mov rdi, coordinatesS ; rdi => coordinatesS base address
    
    jmp _letter_cases_end

_case_T:
    cmp rdi, 84 ; current letter == 84 (T in ASCII) ?
    jne _case_U ; current letter != 84 (T in ASCII) 
    
    mov r8, 8 ; 4 coordinates or 8 elements in coordinatesT
        
    mov rdi, coordinatesT ; rdi => coordinatesT base address
    
    jmp _letter_cases_end

_case_U:
    cmp rdi, 85 ; current letter == 85 (U in ASCII) ?
    jne _case_V ; current letter != 85 (U in ASCII) 
    
    mov r8, 12 ; 6 coordinates or 12 elements in coordinatesU
        
    mov rdi, coordinatesU ; rdi => coordinatesU base address
    
    jmp _letter_cases_end

_case_V:
    cmp rdi, 86 ; current letter == 86 (V in ASCII) ?
    jne _case_W ; current letter != 86 (V in ASCII) 
    
    mov r8, 24 ; 12 coordinates or 24 elements in coordinatesV
        
    mov rdi, coordinatesV ; rdi => coordinatesV base address
    
    jmp _letter_cases_end

_case_W:
    cmp rdi, 87 ; current letter == 87 (W in ASCII) ?
    jne _case_X ; current letter != 87 (W in ASCII) 
    
    mov r8, 20 ; 10 coordinates or 20 elements in coordinatesW
        
    mov rdi, coordinatesW ; rdi => coordinatesW base address
    
    jmp _letter_cases_end

_case_X:
    cmp rdi, 88 ; current letter == 88 (X in ASCII) ?
    jne _case_Y ; current letter != 88 (X in ASCII) 
    
    mov r8, 8 ; 4 coordinates or 8 elements in coordinatesX
        
    mov rdi, coordinatesX ; rdi => coordinatesX base address
    
    jmp _letter_cases_end

_case_Y:
    cmp rdi, 89 ; current letter == 89 (Y in ASCII) ?
    jne _case_Z ; current letter != 89 (Y in ASCII) 
    
    mov r8, 12 ; 6 coordinates or 12 elements in coordinatesY
        
    mov rdi, coordinatesY ; rdi => coordinatesY base address
    
    jmp _letter_cases_end

_case_Z:
    ; current letter = 90 (Z in ASCII)
    
    mov r8, 12 ; 6 coordinates or 12 elements in coordinatesZ
        
    mov rdi, coordinatesZ ; rdi => coordinatesZ base address
    
_letter_cases_end:
    ret
                                                                                 
                                                                                                                                                                  
                                                                                                                                                                                                                                                   
                                                                                                                                                                                                                                                                                                                                                                                                                     

                                                                                            
                                                                                                                                                                                        
                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
                                                                                                      
                                                                                                                
                                                                                                                          
                                                                                                                                    
                                                                                                                                              
                                                                                                                                                        
                                                                                                                                                                  
                                                                                                                                                                            
                                                                                                                                                                                      
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
    
    ;add r10, 4 ; ofset++    
    inc r10 ; ofset++    
    
    mov [r11 + r10], rsi ; array[i] = y1
   
    ;add r10, 4 ; ofset++    
    inc r10 ; ofset++
    
    jmp _bresenham_increase_x
        
_bresenham_store_coordinate_2:
    mov [r11 + r10], rsi ; array[i] = y1
    
    ;add r10, 4 ; ofset++    
    inc r10 ; ofset++    
    
    mov [r11 + r10], rdi ; array[i] = x1
    
    ;add r10, 4 ; ofset++    
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

                                                                                                                                                                                                                                                                                                                                                                                                                      
                                                                                                                                                                                                                    
                                                                                                                                                                                                                              
                                                                                                                                                                                                                                        

; r13 => number of bytes to move the cursor                                                                                                                                                                                                                                                                         
_update_output_file:
    mov     rcx, 1 ; rcx = write only access mode
    mov     rbx, outputFileName ; rbx = outputFileName base address
    mov     rax, 5 ; rax = SYS_OPEN
    int     80h ; call the kernel
 
    mov     rdx, 0 ; rdx = SEEK_SET
    mov     rcx, r13 ; rcx = r13 => number of bytes to move the cursor 
    ;mov     rcx, 5000 ; rcx = r13 => number of bytes to move the cursor 
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
                                                                                                                                                                                                                                                                                                    
              
                
                  
                    
                      
                        
                          
                            
                              
     ;_open_output_text_file:
;    mov     rcx, 0 ; rcx = 0
;    mov     rbx, outputFileName ; rbx = filename address
;    mov     rax, 5 ; rax = 5
;    int     80h                           
                                  
                                 

                                        

                                                    
                                                      
                                                        
                                                          
                                                            
                                                              
                                                                
                                                                    