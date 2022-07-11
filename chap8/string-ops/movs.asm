; movs - move a string from [esi] to [edi] while rcx is not zero
;
; movsb - move byte string
; movsw - move word string
; movsd - move doubleword string
; movsq - move quadword string
;
; Below is some code to move 100K bytes from one array to another

        segment .data
src  times 100000 db 1
des  times 100000 db 0

        segment .text
        global  _start
lea     rsi,    [src]
lea     rdi,    [des]
mov     rcx,    100000
rep     movsb