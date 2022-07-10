; swapping using xor

    segment .data
a   dq  0xbeef
b   dq  0xcafe

    global _start
    segment .text
_start:
    ; set up stack frame
    push rbp
    mov rbp, rsp
    sub rsp, 16

    mov rax, [a]        ; load a into rax
    mov rbx, [b]        ; load b into rbx

    xor rax, rbx        ; rax now has rax ^ rbx
    xor rbx, rax        ; rbx now has rbx ^ rax ^ rbx = rax
    xor rax, rbx        ; rax now has rax ^ rbx ^ rax = rbx

    mov [a], rax        ; store rax into a
    mov [b], rbx        ; store rbx into b

    ; prepare to return
    mov rax, 0
    leave
    ret 