; multiplication
; use mul for unsigned ints
; use imul for signed ints

    segment .data
data    dq      1288736
high    dq      0
low     dq      0
x       dq      -120

    global _start
    segment .text
_start:
    ; set up stack frame
    push rbp
    mov rbp, rsp
    sub rsp, 16

    ; imul one operand
    mov     rax, 146782         ; set rax to 146782
    imul    qword [data]        ; multiply data by rax
    mov     [high], rdx         ; store upper part of product
    mov     [low], rax          ; store lower part of product

    ; imul two operands
    mov     rax, 1678           ; set rax to 1678
    imul    rax, 100            ; multiply rax by 100
    mov     r8, 89763           ; set r8 to 89763
    mov     r9, -34826          ; set r9 to -34826
    mov     r10, 5638           ; set r10 to 5638
    imul    r8, [x]             ; multiply r8 by x
    imul    r9, r10             ; multiply r9 by r10

    ; imul three operands
    imul    rbx, [x], 100       ; store 100*x in rbx
    imul    rdx, rbx, 50        ; store 50*rbx in rdx

    ; prepare to return
    mov rax, 0
    leave
    ret 