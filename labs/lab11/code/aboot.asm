; assemble with fasm:
; fasm aboot.asm aboot.bin
; use16
; By default, when there is no format directive in source file, flat assembler simply puts
; generated instruction codes into output, creating this way flat binary file. By default
; it generates 16{bit code, but you can always turn it into the 16{bit or 32{bit mode by
; using use16 or use32 directive. 

mov     ax, 0x0e41
int     0x10
hlt