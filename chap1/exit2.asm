; program: exit using main
; executes the exit syscall
; no input
; output status

    global main
    segment .text
    
main:
    mov eax, 1 ; 1 is the exit syscall (32-bit)
    mov ebx, 0 ; 0 is the exit status
    int 0x80   ; execute syscall