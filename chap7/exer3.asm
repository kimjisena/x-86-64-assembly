; xor-ing bytes of a quadword

    segment .data
data    dq  0x1337cafebeefb00b
result  db  0

    global _start
    segment .text
_start:
    ; set up stack frame
    push rbp
    mov rbp, rsp
    sub rsp, 16

    mov rax, [data]         ; load data into rax

    mov bl, al              ; copy al into bl (byte 0)

    ror rax, 8              ; right-rotate rax to expose byte 1
    xor bl, al              ; bl now has bl ^ al

    ror rax, 8              ; right-rotate rax to expose byte 2
    xor bl, al              ; bl now has bl ^ al

    ror rax, 8              ; right-rotate rax to expose byte 3
    xor bl, al              ; bl now has bl ^ al

    ror rax, 8              ; right-rotate rax to expose byte 4
    xor bl, al              ; bl now has bl ^ al

    ror rax, 8              ; right-rotate rax to expose byte 5
    xor bl, al              ; bl now has bl ^ al

    ror rax, 8              ; right-rotate rax to expose byte 6
    xor bl, al              ; bl now has bl ^ al

    ror rax, 8              ; right-rotate rax to expose byte 7
    xor bl, al              ; bl now has bl ^ al

    mov [result], bl        ; store bl into result

    ; prepare to return
    mov rax, 0
    leave
    ret