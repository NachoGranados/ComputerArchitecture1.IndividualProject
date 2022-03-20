%include "io64.inc"

section .data
filename db 'test.txt', 0h    ; the filename to create
contents  db 'Z'     ; the contents to write at the start of the file
;contents  db 0ah, 0h     ; the contents to write at the start of the file

section .text
global CMAIN

CMAIN: 
    mov     ecx, 1              ; flag for writeonly access mode (O_WRONLY)
    mov     ebx, filename       ; filename of the file to open
    mov     eax, 5              ; invoke SYS_OPEN (kernel opcode 5)
    int     80h                 ; call the kernel
 
    mov     edx, 0              ; whence argument (SEEK_END)
    mov     ecx, 20              ; move the cursor 0 bytes
    mov     ebx, eax            ; move the opened file descriptor into EBX
    mov     eax, 19             ; invoke SYS_LSEEK (kernel opcode 19)
    int     80h                 ; call the kernel
 
    ;mov     edx, 2              ; number of bytes to write - one for each letter of our contents string
    mov     edx, 1              ; number of bytes to write - one for each letter of our contents string
    mov     ecx, contents       ; move the memory address of our contents string into ecx
    mov     ebx, ebx            ; move the opened file descriptor into EBX (not required as EBX already has the FD)
    mov     eax, 4              ; invoke SYS_WRITE (kernel opcode 4)
    int     80h                 ; call the kernel
 
quit:
    mov     rbx, 0
    mov     rax, 1
    int     80h
        