; bit testing and setting

    global _start
    segment .text
_start:
    ; set up stack frame
    push rbp
    mov rbp, rsp
    sub rsp, 16

    mov rax, 0xaa
    bt rax, 1          ; test bit 1
    setc bl            ; ebx equals tested bit

    bts rax, 0         ; test and set bit 0
    setc cl            ; ecx equals tested bit

    btr rax, 1         ; test and clear(reset) bit 1
    setc dl            ; edx equals tested bit

    ; prepare to return
    mov rax, 0
    leave
    ret 