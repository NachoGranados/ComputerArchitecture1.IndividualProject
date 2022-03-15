;------------------------------------------
; void iprint(Integer number)
; Integer printing function (itoa)
iprint:
    push    rax             ; preserve eax on the stack to be restored after function runs
    push    rcx             ; preserve ecx on the stack to be restored after function runs
    push    rdx             ; preserve edx on the stack to be restored after function runs
    push    rsi             ; preserve esi on the stack to be restored after function runs
    mov     rcx, 0          ; counter of how many bytes we need to print in the end
 
divideLoop:
    inc     rcx             ; count each byte to print - number of characters
    mov     rdx, 0          ; empty edx
    mov     rsi, 10         ; mov 10 into esi
    idiv    rsi             ; divide eax by esi
    add     rdx, 48         ; convert edx to it's ascii representation - edx holds the remainder after a divide instruction
    push    rdx             ; push edx (string representation of an intger) onto the stack
    cmp     rax, 0          ; can the integer be divided anymore?
    jnz     divideLoop      ; jump if not zero to the label divideLoop
 
printLoop:
    dec     rcx             ; count down each byte that we put on the stack
    mov     rax, rsp        ; mov the stack pointer into eax for printing
    call    sprint          ; call our string print function
    pop     rax             ; remove last character from the stack to move esp forward
    cmp     rcx, 0          ; have we printed all bytes we pushed onto the stack?
    jnz     printLoop       ; jump is not zero to the label printLoop
 
    pop     rsi             ; restore esi from the value we pushed onto the stack at the start
    pop     rdx             ; restore edx from the value we pushed onto the stack at the start
    pop     rcx             ; restore ecx from the value we pushed onto the stack at the start
    pop     rax             ; restore eax from the value we pushed onto the stack at the start
    ret
 
 
;------------------------------------------
; void iprintLF(Integer number)
; Integer printing function with linefeed (itoa)
iprintLF:
    call    iprint          ; call our integer printing function
 
    push    rax             ; push eax onto the stack to preserve it while we use the eax register in this function
    mov     rax, 0Ah        ; move 0Ah into eax - 0Ah is the ascii character for a linefeed
    push    rax             ; push the linefeed onto the stack so we can get the address
    mov     rax, rsp        ; move the address of the current stack pointer into eax for sprint
    call    sprint          ; call our sprint function
    pop     rax             ; remove our linefeed character from the stack
    pop     rax             ; restore the original value of eax before our function was called
    ret
 
 
;------------------------------------------
; int slen(String message)
; String length calculation function
slen:
    push    rbx
    mov     rbx, rax
 
nextchar:
    cmp     byte [rax], 0
    jz      finished
    inc     rax
    jmp     nextchar
 
finished:
    sub     rax, rbx
    pop     rbx
    ret
 
 
;------------------------------------------
; void sprint(String message)
; String printing function
sprint:
    push    rdx
    push    rcx
    push    rbx
    push    rax
    call    slen
 
    mov     rdx, rax
    pop     rax
 
    mov     rcx, rax
    mov     rbx, 1
    mov     rax, 4
    int     80h
 
    pop     rbx
    pop     rcx
    pop     rdx
    ret
 
 
;------------------------------------------
; void sprintLF(String message)
; String printing with line feed function
sprintLF:
    call    sprint
 
    push    rax
    mov     rax, 0AH
    push    rax
    mov     rax, rsp
    call    sprint
    pop     rax
    pop     rax
    ret
 
 
;------------------------------------------
; void exit()
; Exit program and restore resources
quit:
    mov     rbx, 0
    mov     rax, 1
    int     80h
    ret