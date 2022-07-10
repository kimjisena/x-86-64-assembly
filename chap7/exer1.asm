; count all the 1 bits in a byte stored in mem (no loop)

    segment .data
x   dw      0xfa

    global _start
    segment .text
_start:
    ; set up stack frame
    push rbp
    mov rbp, rsp
    sub rsp, 16

    xor eax, eax        ; keep 1-bit count in rax
    xor ebx, ebx        ; keep tested bit in rbx

    bt  word [x], 0     ; test bit 0
    setc bl             ; get the tested bit
    add eax, ebx        ; possibly increment count

    bt  word [x], 1     ; test bit 1
    setc bl             ; get the tested bit
    add eax, ebx        ; possibly increment count

    bt  word [x], 2     ; test bit 2
    setc bl             ; get the tested bit
    add eax, ebx        ; possibly increment count

    bt  word [x], 3     ; test bit 3
    setc bl             ; get the tested bit
    add eax, ebx        ; possibly increment count

    bt  word [x], 4     ; test bit 4
    setc bl             ; get the tested bit
    add eax, ebx        ; possibly increment count

    bt  word [x], 5     ; test bit 5
    setc bl             ; get the tested bit
    add eax, ebx        ; possibly increment count

    bt  word [x], 6     ; test bit 6
    setc bl             ; get the tested bit
    add eax, ebx        ; possibly increment count

    bt  word [x], 7     ; test bit 7
    setc bl             ; get the tested bit
    add eax, ebx        ; possibly increment count

    ; prepare to return
    mov rax, 0
    leave
    ret 