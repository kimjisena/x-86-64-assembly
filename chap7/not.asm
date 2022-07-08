; bit-wise not


    segment .data
x   dq      0xff00

    global _start
    segment .text
_start:
    ; set up stack frame
    push rbp
    mov rbp, rsp
    sub rsp, 16

    mov rax, 0
    not rax         ; rax == Oxffffffffffffffff
    mov rdx, 0      ; preparing for divide
    mov rbx, 15     ; will divide by 15 (0xf)
    div rbx         ; unsigned divide
                    ; rax == Ox1111111111111111
    not rax         ; rax == Oxeeeeeeeeeeeeeeee
    not word [x]    ; a == 0x00ff

    ; prepare to return
    mov rax, 0
    leave
    ret 