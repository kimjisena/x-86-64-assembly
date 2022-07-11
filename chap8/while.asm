; C-like while loop
        segment .data
data    dq      0xfedcba9876543210
sum     dq      0

    global _start
    segment .text
_start:
    ; set up stack frame
    push rbp
    mov rbp, rsp
    sub rsp, 16

    ; prepare to return
    mov rax, 0
    leave
    ret 