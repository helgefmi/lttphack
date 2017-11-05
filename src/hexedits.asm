; == SRAM ==

if !FEATURE_SS
    org $00FFD8
        db $08 ; 256kb
endif


; == CTRL 2 ==
;
; Enable controller 2 CLR
; Overrides the following:
; $0083F8: 60  RTS
org $0083F8
    NOP


; == FRAME ADVANCE ==

; Overrides the following
;$008039: 80 16  BRA $008051
org $008039
    NOP : NOP


; Overrides the following
; $00803B: A5 F6  LDA $F6
; $00803D: 29 20  AND #$20
org $00803B
    LDA $F5 : AND.b #$00

; Overrides the following
; $008044: A5 F6  LDA $F6
; $008046: 29 10  AND #$10
org $008044
    LDA $F7 : AND.b #$00


; == BAGE CHEAT CODE ==
;
; Make it so saving on third filename slot gives you
; full equipment.
;
; NOP's out some code since originally, there were more
; requirements for this feature to happen.
org $0CDB79
    CPX #$0A00 ; Checks if the player saved in third space.
    ; There's a BNE I didn't wanna touch here.
org $0CDB7E
    NOP : NOP : NOP : NOP   ; AF F8 83 00   LDA.l $0083F8
    NOP : NOP : NOP         ; 29 FF 00      AND #$00FF
    NOP : NOP : NOP         ; C9 60 00      CMP #$0060
    NOP : NOP               ; F0 21         BEQ $0CDC49
    NOP : NOP : NOP : NOP   ; AF D9 03 70   LDA $7003D9
    NOP : NOP : NOP         ; C9 01 00      CMP #$0001
    NOP : NOP               ; D0 18         BNE $0CDC49


; == INTRO MASH SKIP ==
;
; 0cc106 lda $f6
; 0cc108 and #$c0
; 0cc10a ora $f4
; 0cc10c and #$d0
; 0cc10e beq $c113

org $0CC10E
    BNE $C113

; 0cc204 dec $13       [000013] A:0c0c X:00fc Y:00ff S:01f9 D:0000 DB:00 nvMXdizC V:240 H: 196 F:24
; 0cc206 bne $c26a     [0cc26a] A:0c0c X:00fc Y:00ff S:01f9 D:0000 DB:00 nvMXdizC V:240 H: 204 F:24
; 0cc26a rtl                    A:0c0c X:00fc Y:00ff S:01f9 D:0000 DB:00 nvMXdizC V:240 H: 226 F:24
org $0CC204
    STZ $13
