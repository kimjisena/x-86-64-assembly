; C-like do-while loop
;
; data = "hello world";
; n = 0;
; i = 0;
; c = data[i];
; if (c != 0) {
;   do {
;    if (c == x) break;
;    i++;
;    c = data[i];
;   } while (c != 0);
;  }
; n = c == 0 ? -1 : i;

        segment .data
data    db      "hello world", 0
n       dq      0
needle  db      'w'

        global _start
        segment .text
_start:
        ; set up stack frame
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16

;       Register usage
;
;       rax: byte of data array
;       rbx: byte to search for
;       rcx: loop counter, 0 to n - 1 where n is the number of bytes
;
        mov     bl, [needle]
        xor     ecx, ecx
        mov     al, [data+rcx]
        cmp     al, 0
        jz      end_while
while:
        cmp     al, bl
        je      found
        inc     rcx
        mov     al, [data+rcx]
        cmp     al, 0
        jnz     while
end_while:
        mov     rcx, -1
found:
        mov     [n], rcx

        ; prepare to return
        xor     eax, eax
        leave
        ret