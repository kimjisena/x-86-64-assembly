; a switch statement using unconditional jump

        segment     .data
switch: dq      _start.case0
        dq      _start.case1
        dq      _start.case2
i:      dq      2
        segment     .text
        global      _start          ; tell linker about _start
_start:   
        mov     rax, [i]            ; move i to rax
        jmp     [switch+rax*8]      ; switch(i)
.case0:
        mov     rbx, 100            ; go here if i == 0
        jmp     .end                ; break
.case1:
        mov     rbx, 101            ; go here if i == 1
        jmp     .end                ; break
.case2:
        mov     rbx, 102            ; go here if i == 2
.end:
        xor     eax, eax
        ret