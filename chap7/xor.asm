; bit-wise xor

    global _start
    segment .text
_start:
    ; set up stack frame
    push rbp
    mov rbp, rsp
    sub rsp, 16

    mov     rax, 0x1234567812345678
    xor     eax, eax               ; set rax to 0
    mov     rax, 0x1234
    xor     rax, 0xf               ; change to 0x123b

    ; prepare to return
    mov rax, 0
    leave
    ret 