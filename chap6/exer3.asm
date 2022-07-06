; average i.e sum(n)/n

    segment .data
a      dq      78
b      dq      87
c      dq      91
d      dq      79
avg    dq      0
rem    dq      0

    global _start
    segment .text
_start:
    ; set up stack frame
    push rbp
    mov rbp, rsp
    sub rsp, 16

    mov rax, [a]        ; get a from memory
    add rax, [b]        ; add b to rax
    add rax, [c]        ; add c to rax
    add rax, [d]        ; add d to rax
    xor rdx, rdx        ; set rdx to zero so that rdx:rax == rax
    mov rbx, 4          ; set rbx to 4 (divisor)
    div rbx             ; divide rax by rbx
    mov [avg], rax      ; store quotient in avg
    mov [rem], rdx      ; store reminder in rem

    ; prepare to return
    mov rax, 0          ; set rax to 0
    leave
    ret 