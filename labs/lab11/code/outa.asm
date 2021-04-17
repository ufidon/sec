; assemble with nasm:
; nasm -f bin outa.asm -o outa.bin

bits    16

mov     ax, 0x0e41
int     0x10
hlt