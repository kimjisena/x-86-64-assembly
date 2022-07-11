; C-like if-elseif-else statement
; if (a < b) {
;    result = 1;
;  } else if (a > c) {
;    result = 2;
;  } else {
;    result = 3;
;  }

        segment     .data
a       dq          9
b       dq          8
c       dq          7
result  dq          0

        segment     .text
        global      _start
_start:
        mov     rax, [a]            ; move a to rax
        mov     rbx, [b]            ; move b to rbx
        cmp     rax, rbx            ; set some flags
        jnl     else_if             ; jump to else_if if a not less than b
        mov     qword [result], 1   ; move 1 to result
        jmp     endif
else_if:
        mov     rcx, [c]            ; move c to rcx
        cmp     rax, rcx            ; set some flags
        jng     else                ; jump to else if a not greater than c
        mov     qword [result], 2   ; move 2 to result
        jmp     endif
else:
        mov     qword [result], 3   ; move 3 to result
endif:
        xor     eax, eax
        ret