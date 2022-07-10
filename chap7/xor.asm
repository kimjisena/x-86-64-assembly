; bit-wise xor

    global _start
    segment .text
_start:
    ; set up stack frame
    push rbp
    mov rbp, rsp
    sub rsp, 16

    ; bit field extraction -> extract bits 8 - 15
    mov     rax, 0x12345678
    shr     rax, 8          ; rax now holds 0x123456
    and     rax, 0xff       ; rax now holds 0x56

    ; bit field insertion -> replace bits 8 - 15
    mov     rax, 0x12345678
    mov     rdx, 0xaa       ; replacement field
    mov     rbx, 0xff       ; 8-bit mask
    shl     rbx, 8          ; align mask at bit 8
    not     rbx             ; invert mask
    and     rax, rbx        ; clear bits 8 - 15
    shl     rdx, 8          ; align replacement field
    or      rax, rdx        ; rax now holds 0x1234aa78

    ; prepare to return
    mov rax, 0
    leave
    ret 