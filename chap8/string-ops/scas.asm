; scas - scan [edi] for a string matching  eax
;
; scasb - scan byte string
; scasw - scan word string
; scasd - scan doubleword string
; scasq - scan quadword string
;
; Below is an implementation of the C strlen function

        segment .data
src  times 1000000 db 1
des  times 1000000 db 0

        segment .text
        global  strlen
    lea     rsi,    [src]
    lea     rdi,    [des]
strlen:
    cld                 ; prepare to increment rdi
    mov     rcx, -1     ; maximum number of iterations
    xor     al, al      ; will scan for 0
    repne   scasb       ; repeatedly scan for 0
    mov     rax, -2     ; start at -1, end 1 past the end
    sub     rax, rcx
    ret