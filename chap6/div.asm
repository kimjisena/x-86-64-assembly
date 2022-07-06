; division
; use div for unsigned ints
; use idiv for signed ints

    segment .data
x    dq      10089676
y    dq      200
quot dq      0
rem  dq      0

    global _start
    segment .text
_start:
    ; set up stack frame
    push rbp
    mov rbp, rsp
    sub rsp, 16

    mov rax, [x]    ; x will be the dividend
    mov rdx, 0      ; zero out rdx so that rdx:rax == rax
    idiv qword [y]  ; divide by y
    mov [quot], rax ; store the quotient
    mov [rem], rdx  ; store the remainder

    ; prepare to return
    mov rax, 0
    leave
    ret 