org $0DFEC3
	dw $207F, $207F, $207F, $207F, $207F, $207F

; SA-1 menu DMA is 1 dot slower
; I'll let it slide
org $008B71 : LDX.w #SA1RAM.HUD>>0
org $008B77 : LDA.b #SA1RAM.HUD>>16

; move floor indicators (not just to iram, but also a different location)
;org $0AFDB5 : STA.l SA1RAM.HUD+$0AA
;org $0AFDB9 : STA.l SA1RAM.HUD+$0AC
;org $0AFDBD : STA.l SA1RAM.HUD+$0EA
;org $0AFDC1 : STA.l SA1RAM.HUD+$0EC

; move timer locations (not just to iram, but also a different location)
;org $0AFE25 : STA.l SA1RAM.HUD+$0F2, X
;org $0AFE2C : STA.l SA1RAM.HUD+$132, X

; vanilla stuff to leave alone, so it writes nowhere useful
;org $0AFD9F : STA.l SA1RAM.HUD+$0F2, X
;org $0AFDA6 : STA.l SA1RAM.HUD+$132, X
;org $0AFD48 : STA.l SA1RAM.HUD+$0F2
;org $0AFD4D : STA.l SA1RAM.HUD+$134
;org $0AFD52 : STA.l SA1RAM.HUD+$132
;org $0AFD59 : STA.l SA1RAM.HUD+$0F4

org $0DFA99 : LDY.w #SA1RAM.HUD
org $0DFA9C : MVN $0D,$0D

org $0DFB2B : STA.l SA1RAM.HUD+$01E
org $0DFB31 : STA.l SA1RAM.HUD+$01F
org $0DFB37 : STA.l SA1RAM.HUD+$020
org $0DFB3D : STA.l SA1RAM.HUD+$021
org $0DFB94 : STA.l SA1RAM.HUD+$04A
org $0DFB9C : STA.l SA1RAM.HUD+$04C
org $0DFBA4 : STA.l SA1RAM.HUD+$08A
org $0DFBAC : STA.l SA1RAM.HUD+$08C
org $0DFC3A : STA.l SA1RAM.HUD+$004
org $0DFC41 : STA.l SA1RAM.HUD+$006
org $0DFC48 : STA.l SA1RAM.HUD+$008
org $0DFC5E : STA.l SA1RAM.HUD+$046
org $0DFC65 : STA.l SA1RAM.HUD+$086
org $0DFC6C : STA.l SA1RAM.HUD+$0C6
org $0DFC73 : STA.l SA1RAM.HUD+$106
org $0DFC88 : STA.l SA1RAM.HUD+$050
org $0DFC94 : STA.l SA1RAM.HUD+$052
org $0DFCA0 : STA.l SA1RAM.HUD+$054
org $0DFCB8 : STA.l SA1RAM.HUD+$058
org $0DFCC4 : STA.l SA1RAM.HUD+$05A
org $0DFCDC : STA.l SA1RAM.HUD+$05E
org $0DFCE8 : STA.l SA1RAM.HUD+$060
org $0DFD0A : STA.l SA1RAM.HUD+$064
org $0DFD13 : STA.l SA1RAM.HUD+$024
org $0DFD5D : STA.l SA1RAM.HUD+$042, X
org $0DFD73 : STA.l SA1RAM.HUD+$042, X
org $0DFD7C : STA.l SA1RAM.HUD+$044, X
org $0DFD8E : STA.l SA1RAM.HUD+$042, X
org $0DFD97 : STA.l SA1RAM.HUD+$044, X
org $0DFDA2 : STA.l SA1RAM.HUD+$042, X
org $0DFDAB : STA.l SA1RAM.HUD+$044, X
org $0DFDB4 : STA.l SA1RAM.HUD+$046, X

; HP stuff we leave writing to vanilla WRAM
; org $0DFDC1 : STA.l SA1RAM.HUD+$042, X

; tracking stuff related to heart refill, but leaving it alone
;org $0DF151 : LDA.b #SA1RAM.HUD+$068>>0
;org $0DF155 : LDA.b #SA1RAM.HUD+$068>>8
;org $0DF159 : LDA.b #SA1RAM.HUD+$068>>16
;org $0DFBC2 : LDA.b #SA1RAM.HUD+$068>>0
;org $0DFBC6 : LDA.b #SA1RAM.HUD+$068>>8
;org $0DFBCA : LDA.b #SA1RAM.HUD+$068>>16
;org $0DFBEE : LDA.b #SA1RAM.HUD+$068>>0
;org $0DFBF2 : LDA.b #SA1RAM.HUD+$068>>8
;org $0DFBF6 : LDA.b #SA1RAM.HUD+$068>>16

; Heart refill variable is something that doesn't bother me to move
org $07A1A1 : STA.w SA1IRAM.Moved_0208
org $07A1CC : STA.w SA1IRAM.Moved_0208
org $07A202 : STA.w SA1IRAM.Moved_0208
org $08F454 : LDA.w SA1IRAM.Moved_020A
org $09F71A : LDA.w SA1IRAM.Moved_020A
org $0DDCA8 : LDA.w SA1IRAM.Moved_020A
org $0DDCFF : INC.w SA1IRAM.Moved_020A
org $0DDD04 : STA.w SA1IRAM.Moved_0208
org $0DF140 : LDA.w SA1IRAM.Moved_020A
org $0DF15D : DEC.w SA1IRAM.Moved_0208
org $0DF184 : LDX.w SA1IRAM.Moved_0209
org $0DF18B : STA.w SA1IRAM.Moved_0208
org $0DF19E : LDA.w SA1IRAM.Moved_0209
org $0DF1A4 : STA.w SA1IRAM.Moved_0209
org $0DF1AE : STZ.w SA1IRAM.Moved_020A



