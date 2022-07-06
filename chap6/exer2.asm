; slope of a line segment i.e m = (x2 - x1)/(y2 - y1)

    segment .data
x1      dq      20
x2      dq      64
y1      dq      15
y2      dq      72
xdiff   dq      0
ydiff   dq      0

    global _start
    segment .text
_start:
    ; set up stack frame
    push rbp
    mov rbp, rsp
    sub rsp, 16

    mov rax, [x2]       ; get x2 from memory
    sub rax, [x1]       ; subtract x2 from x1
    mov [xdiff], rax    ; store result in xdiff
    mov rax, [y2]       ; get y2 from memory
    sub rax, [y1]       ; subtract y1 from y2
    mov [ydiff], rax    ; store result in xdiff

    ; prepare to return
    mov rbx, 1          ; set rbx to 1
    mov rax, 0          ; set rax to 0
    cmovz rax, rbx      ; conditionally set rax to 1 if ZF is set
    leave
    ret 