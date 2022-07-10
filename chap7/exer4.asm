; dissecting a double sign:exp:1.fraction

    segment .data
data    dq  0x1337cafebeefb00b
sign    db  0
exp     dw  0
frac    dq  0

    global _start
    segment .text
_start:
    ; set up stack frame
    push rbp
    mov rbp, rsp
    sub rsp, 16

    mov rax, [data]             ; load data into rax

    ; sign bit extraction
    mov rbx, rax                ; copy rax into rbx
    shr rbx, 63                 ; shift right 63 bits
    mov [sign], bl              ; store bl into sign

    ; fraction bits extraction
    mov rbx, rax                ; copy rax into rbx
    mov rcx, 0xfffffffffffff    ; our bit mask
    and rbx, rcx                ; mask out bits 0 to 51
    ror rbx, 52                 ; right-rotate rbx to expose bit 52
    or  rbx, 0x1                ; `or` in implied 1 bit
    rol rbx, 52                 ; align rbx
    mov [frac], rbx             ; store rbx into frac

    ; exponent
    mov rbx, rax                ; copy rax into rbx
    shr rbx, 52                 ; shift right 52 bits
    and rbx, 0x7ff              ; mask out bits 0 to 10
    sub rbx, 1023               ; subtract exponent bias
    mov [exp], bx               ; store rbx into exp

    ; prepare to return
    mov rax, 0
    leave
    ret