; C-like if statement
; if (a < b) {
;    temp = a;
;    a = b;
;    b = temp;
;  }
        segment     .data
a       dq          9
b       dq          7
temp    dq          0

        segment     .text
        global      _start
_start:
        mov     rax, [a]            ; move a to rax
        mov     rbx, [b]            ; move b to rbx
        cmp     rax, rbx            ; set some flags
        jge     in_order            ; jump to in_order if a >= b
        mov     [temp], rax         ; move rax to temp (useless instruction)
        mov     [a], rbx            ; move rbx to a
        mov     [b], rax            ; move rax to b
in_order:
        xor     eax, eax
        ret