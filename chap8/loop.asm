; the `loop` instruction
; `loop` decrements rcx until 0
; `loop` is limited to 8-bit immediate field (-128 to +127)
;
; right-most occurence of a character

        segment .data
data    db      "hello new world", 0
needle  db      'w'
n       dd      15
loc     dd      0

        global _start
        segment .text
_start:
        ; set up stack frame
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16

;       Register usage
;
;       rax: byte to search for
;       rcx: loop counter, n to 0
;
        mov     al, [needle]
        mov     ecx, [n]
more:
        cmp     [data+rcx-1], al
        je      found
        loop    more
found:
        sub     ecx, 1
        mov     [loc], ecx

        ; prepare to return
        xor     eax, eax
        leave
        ret