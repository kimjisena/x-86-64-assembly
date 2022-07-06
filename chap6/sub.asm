; subtraction

    segment .data
a    dq      100
b    dq      200
diff dq      0

    global _start
    segment .text
_start:
    ; set up stack frame
    push rbp
    mov rbp, rsp
    sub rsp, 16

    mov rax, 10      ; set rax to 10
    sub [a], rax     ; subtract 10 from a
    sub [b], rax     ; subtract 10 from b
    mov rax, [b]     ; get b into rax
    sub rax, [a]     ; set rax to b - a
    mov [diff], rax  ; save difference in diff

    ; prepare to return
    mov rax, 0
    leave
    ret 