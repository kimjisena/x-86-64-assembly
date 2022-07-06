; loading data into registers, with sign extension

    segment .data
a   db  -41
b   dw  32120
c   dd  -127469
d   dq  987364834
sum dq  0

    global _start
    segment .text
_start:
    ; set up stack: not necessary in this case tho
    push rbp        ; new stack frame alert
    mov rbp, rsp    ; align rbp at current rsp
    sub rsp, 16     ; set aside 16 bytes for local variables

    ; load data into registers
    movsx  rax, byte  [a]    ; load a into rax, sign extend
    movsx  rbx, word  [b]    ; load b into rbx, sign extend
    movsxd rcx, dword [c]    ; load c into rcx, sign extend
    mov    rdx,       [d]    ; load d into rdx

    ; add up all data, leave result in sum
    add rax, rbx    ; add rbx to rax
    add rax, rcx    ; add rcx to rax
    add rax, rdx    ; add rdx to rax
    mov [sum], rax  ; store result in sum

    ; get ready to return
    xor eax, eax    ; zero rax
    leave           ; restore previous stack frame
    ret             ; return