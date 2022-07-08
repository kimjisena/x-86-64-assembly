; bit-wise or

    global _start
    segment .text
_start:
    ; set up stack frame
    push rbp
    mov rbp, rsp
    sub rsp, 16

    mov     rax, 0x1000
    or      rax, 1      ; make the number odd
    or      rax, 0xff00 ; set bits 15 - 8

    ; prepare to return
    mov rax, 0
    leave
    ret 