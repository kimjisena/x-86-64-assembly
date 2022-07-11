; C-like if-else statement
; if (a < b) {
;    max = b;
;  } else {
;    max = a;
;  }

        segment     .data
a       dq          7
b       dq          8
max     dq          0

        segment     .text
        global      _start
_start:
        mov     rax, [a]            ; move a to rax
        mov     rbx, [b]            ; move b to rbx
        cmp     rax, rbx            ; set some flags
        jnl     else                ; jump to else if a > b
        mov     [max], rbx          ; move rbx to max
        jmp     endif               ; jump to endif
else:   mov     [max], rax          ; move rax to max
endif:
        xor     eax, eax
        ret