; arrays

    segment .data
a   times   10  dq  0 ; array of 10 8-byte ints initialized to 0
b   dq  0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ; array of 10 8-byte ints
s   db  "Kim Jisena", 10, 0 ; null-terminated string 

    segment .bss
c   resd    5 ; array of 5 2-byte ints in heap i.e iptr = (int*)malloc(sizeof(int) * 5);