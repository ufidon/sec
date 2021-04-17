; assemble with fasm:
; fasm chn.asm chn.bin


码:
               mov     bx, 0x7c11
               mov     ah, 0x0e                ; 印符服务
环:            mov     al, [bx]
               or      al, al                  ; 串尾?
               jz      停
               inc     bx
               int     0x10                    ; 印符
               jmp     环                   ; 次符

停:          hlt                             ; 停机

信:           db        "万国码显示不了!", 0