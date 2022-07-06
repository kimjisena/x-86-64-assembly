; dsqrd = (x1 - x2)**2 + (y1 - y2)**2

    segment .data
x1      dq      20
x2      dq      64
y1      dq      15
y2      dq      72
dsqrd   dq      0   

    global _start
    segment .text
_start:
    ; set up stack frame
    push rbp
    mov rbp, rsp
    sub rsp, 16

    mov rax, [x1]       ; get x1 from memory
    sub rax, [x2]       ; subtract x2 from x1
    mul rax             ; square rax i.e rax * rax
    mov r8, rax         ; store result in r8
    mov rbx, [y1]       ; get y1 from memory
    sub rbx, [y2]       ; subtract y2 from y1
    mov rax, rbx        ; copy rbx into rax
    mul rbx             ; square rbx i.e rbx * rbx
    add rax, r8         ; add r8 to rax
    mov [dsqrd], rax    ; store result to memory

    ; prepare to return
    mov rax, 0
    leave
    ret 