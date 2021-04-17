; assemble with nasm:
; nasm -f bin chn.asm -o chn.bin

bits       16

start:
               mov     bx, 0x7c11
               mov     ah, 0x0e                ; print char service
.loop          mov     al, [bx]
               or      al, al                  ; end of string?
               jz      halt
               inc     bx
               int     0x10                    ; print char
               jmp     .loop                   ; next char

halt:          hlt                             ; halt

;msg:           db        "Cyber Hacker!", 0
msg:            db        "万国码显示不了!", 0