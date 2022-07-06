; addition

    segment .data
a   dq      151
b   dq      310
sum dq      0

    global _start
    segment .text
_start:
    ; set up stack frame
    push rbp
    mov rbp, rsp
    sub rsp, 16

    mov rax, 9       ; set rax to 9
    add [a], rax     ; add rax to a
    mov rax, [b]     ; get b into rax
    add rax, 10      ; add 10 to rax
    add rax, [a]     ; add a to rax
    mov [sum], rax   ; save sum in sum

    ; prepare to return
    mov rax, 0
    leave
    ret 