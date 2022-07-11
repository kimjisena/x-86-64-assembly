; stos - store a string in rax to [rdi]
;
; stosb - store byte string
; stosw - store word string
; stosd - store doubleword string
; stosq - store quadword string
;
; Below is some code to fill an array with 1000000 doublewords all equal
; to 1

        segment .bss
des     resd    1000000

        segment .text
        global  _start
mov     eax,    1
mov     rcx,    1000000
lea     rdi,    [des]
rep     stosd