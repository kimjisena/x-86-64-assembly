; program: exit
; executes the exit syscall
; no input
; output: exit status

    global _start
    segment .text

_start:
    mov eax, 1  ; 1 is the exit syscall (32-bit)
    mov ebx, 0  ; 0 is the exit status
    int 0x80    ; execute syscall