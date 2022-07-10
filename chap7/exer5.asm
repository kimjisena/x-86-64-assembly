; a product of 2 float values using integer arithmetic and bit operations

    segment .data
a       dd  112.65
b       dd  52.964
prod    dd  0

    global _start
    segment .text
_start:
    ; set up stack frame
    push rbp
    mov rbp, rsp
    sub rsp, 16

    mov eax, [a]                ; load a into rax
    mov ebx, [b]                ; load b into rbx

    ; sign of the product
    mov r8d, eax                ; copy rax into r8
    shr r8d, 31                 ; expose bit 31
    mov r9d, ebx                ; copy rbx into r9
    shr r9d, 31                 ; expose bit 31
    or  r8d, r9d                ; store sign in r8
    shl r8d, 31                 ; align r8

    ; fractions
    mov r9d, eax                ; copy rax into r9
    mov ecx, 0x7fffff           ; our bit mask
    and r9d, ecx                ; mask out bits 0 to 22
    ror r9d, 23                 ; right-rotate r9d to expose bit 23
    or  r9d, 0x1                ; `or` in implied 1 bit
    rol r9d, 23                 ; align r9d

    mov r10d, ebx               ; copy rbx into r10
    mov ecx, 0x7fffff           ; our bit mask
    and r10d, ecx               ; mask out bits 0 to 22
    ror r10d, 23                ; right-rotate r10d to expose bit 23
    or  r10d, 0x1               ; `or` in implied 1 bit
    rol r10d, 23                ; align r10d

    ; exponent of the product
    mov cl, -46                 ; load -46 (default exponent)

    mov r11d, eax               ; copy rax into r11
    shr r11d, 23                ; shift right 23 bits
    and r11d, 0xff              ; mask out bits 0 to 7
    sub r11d, 127               ; subtract exponent bias

    mov r12d, ebx               ; copy rbx into r12
    shr r12d, 23                ; shift right 23 bits
    and r12d, 0xff              ; mask out bits 0 to 7
    sub r12d, 127               ; subtract exponent bias

    add cl, r11b                ; add r11 to rcx
    add cl, r12b                ; add r12 to rcx
    add cl, 127                 ; add exponent bias

    ; product of fractions
    imul r9d, r10d              ; r9 has the result of r9 * r10
    mov r13d, 0x7fffff          ; our bit mask
    and r9d, r13d               ; mask out bits 0 to 22

    ; product
    ror r9d, 23                 ; right rotate r9 23 bits
    or  r9b, cl                 ; `or` in the exponent bits
    rol r9d, 23                 ; align r9
    or  r9d, r8d                ; `or` in the sign bit
    mov [prod], r9d             ; store product in prod

    ; prepare to return
    mov rax, 0
    leave
    ret