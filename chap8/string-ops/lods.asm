; lods - load a string from [esi] to rax while rcx is not zero
;
; lodsb - load byte string
; lodsw - load word string
; lodsd - load doubleword string
; lodsq - load quadword string
;
; Below is a loop which copies data from one array to another 
; removing characters equal to 13

        segment .data
src  times 1000000 db 1
des  times 1000000 db 0

        segment .text
        global  _start
    lea     rsi,    [src]
    lea     rdi,    [des]
    mov     ecx,    100000
more:
    lodsb
    cmp     al,     13
    je      skip
    stosb
skip:
    sub     ecx, 1
    jnz more