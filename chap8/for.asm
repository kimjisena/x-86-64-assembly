; C-like for loop
;
; Array addition
;
; long int a[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0};
; long int b[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
; long int c[10];
; int i;
; int n = 10;
; for (i = 0; i < n; i++) {
;    c[i] = a[i] + b [i];
; }

        segment .data
a               dq  1, 2, 3, 4, 5, 6, 7, 8, 9, 0
b               dq  0, 1, 2, 3, 4, 5, 6, 7, 8, 9
c   times 10    dq  0
n               dq  10
        global _start
        segment .text
_start:
        ; set up stack frame
        push        rbp
        mov         rbp, rsp
        sub         rsp, 16

;       Register usage
;
;       rax: sum(a[i], b[i])
;       rcx: loop counter, 0 to n - 1
;       rdx: number of elements, n
;
        mov         rdx, [n]
        xor         ecx, ecx
for:
        cmp         rcx, rdx
        je          end_for
        mov         rax, [a+rcx*8]
        add         rax, [b+rcx*8]
        mov         [c+rcx*8], rax
        inc         rcx
        jmp         for
end_for:
        ; prepare to return
        xor         eax, eax
        leave
        ret