; negate an operand (2's complement)

    segment .data
x   dd      678
y   db      -127

    global _start
    segment .text
_start:
    ; set up stack frame
    push rbp
    mov rbp, rsp
    sub rsp, 16

    mov rax, 3567       ; load 3567 into rax
    neg dword [x]       ; negate x -> -x
    neg byte [y]        ; negate y -> -y
    neg rax             ; negate rax -> -rax

    ; prepare to return
    mov rax, 0
    leave
    ret 