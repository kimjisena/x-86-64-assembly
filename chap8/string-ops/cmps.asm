; cmps - compare [esi] to [edi] and update status flags
;
; cmpsb - compare byte string
; cmpsw - compare word string
; cmpsd - compare doubleword string
; cmpsq - compare quadword string
;
; Below is an implementation of the C memcmp function

        segment .data
src  times 1000000 db 1
des  times 1000000 db 0

        segment .text
        global  memcmp
    lea     rsi,    [src]
    lea     rdi,    [des]
memcmp:
    mov     rcx,    rdx
    repe    cmpsb               ; compare until end or difference
    cmp     rcx,    0
    jz      equal               ; reached to the end
    movzx   eax, byte [rdi-1]
    movzx   ecx, byte [rsi-1]
    sub     rax, rcx
    ret
equal:
    xor     eax, eax
    ret