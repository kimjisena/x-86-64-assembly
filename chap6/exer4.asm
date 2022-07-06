; cost of electricity for a home
; cpkh - cost per kilowatt hour (in pennies)
; khs - kilowatt hours used
; bill = ($5.00 + (cpkh * khs))/100
; cdol - cost in dollars
; cpen - const in pennies

    segment .data
cpkh   dq      69
khs    dq      50
cdol   dq      5
cpen   dq      0

    global _start
    segment .text
_start:
    ; set up stack frame
    push rbp
    mov rbp, rsp
    sub rsp, 16

    mov rax, [cpkh]     ; get cpkh from memory
    mov rbx, [khs]      ; get khs from memory
    mov rdx, rbx        ; copy rbx to rdx
    mov r8, 0           ; set r8 to 0
    neg rdx             ; negate rdx set or unset SF
    cmovg rbx, r8       ; set rbx to 0 if khs < 0
    imul rbx            ; multiply rax by rbx -> rdx:rax
    mov rcx, 100        ; set rcx to 100
    idiv rcx            ; divide rdx:rax by rbx
    add [cdol], rax     ; add quotient to cdol
    add [cpen], rdx     ; add remainder to cpen

    ; prepare to return
    mov rax, 0          ; set rax to 0
    leave
    ret 