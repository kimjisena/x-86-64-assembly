; conditional move

    segment .data
x   dq      51

    global _start
    segment .text
_start:
    ; set up stack frame
    push rbp
    mov rbp, rsp
    sub rsp, 16

    ; convert rax to absolute value
    mov     rax, -124
    mov     rbx, rax        ; save original value
    neg     rax             ; negate rax
    cmovl   rax, rbx        ; replace rax if neg

    ; replace the diff with 0 if diff < 0
    mov     rbx, 0          ; set rbx to 0
    mov     rax, [x]        ; get x from memory
    sub     rax, 100        ; subtract 100 from x
    cmovl   rax, rbx        ; set rax to 0 if rax was neg

    ; prepare to return
    mov rax, 0
    leave
    ret 