; C-like while loop
;
; data = 0xfedcba9876543210;
; sum = 0;
; i = 0;
; while (i < 64) {
;    sum += data & 1;
;    data = data >> 1;
;    i++;
; }
        segment .data
data    dq      0xfedcba9876543210
sum     dq      0

        global _start
        segment .text
_start:
        ; set up stack frame
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16

;       Register usage
;
;       rax: bits being examined
;       rbx: carry bit after bt, setc
;       rcx: loop counter, 0 - 63
;       rdx: sum of 1 bits
;
        mov     rax, [data]
        xor     ebx, ebx
        xor     ecx, ecx
        xor     edx, edx
while:
        cmp     rcx, 64
        jnl     end_while
        bt      rax, 0
        setc    bl
        add     edx, ebx
        shr     rax, 1
        inc     rcx
        jmp     while
end_while:
        mov     [sum], rdx

        ; prepare to return
        xor     eax, eax
        leave
        ret