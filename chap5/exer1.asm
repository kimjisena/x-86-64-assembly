; loading data into registers

    segment .data
a   dd      0x97 ; decimal 151
b   dd      89
c   dd      -256
d   dd      -170

    global _start
    segment .text
_start:
    ; set up stack: not necessary in this case tho
    push rbp        ; new stack frame alert
    mov rbp, rsp    ; align rbp at current rsp
    sub rsp, 16     ; set aside 16 bytes for local variables

    ; load data into registers
    mov eax, [a]    ; load a into rax
    mov ebx, [b]    ; load b into rbx
    mov ecx, [c]    ; load c into rcx
    mov edx, [d]    ; load d into rdx

    ; add up all data, leave result in rdx
    add eax, ebx    ; add rbx to rax
    add eax, ecx    ; add rcx to rax
    add edx, eax    ; add rax to rdx

    ; get ready to return
    xor eax, eax    ; zero rax
    leave           ; restore previous stack frame
    ret             ; return