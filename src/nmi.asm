pushpc

; Other interrupt stuff
org $00CF50
BadInterrupt:
	JML OOPS

warnpc $00CFBE

;===================================================================================================
; Improves the speed of OAM clearing by 2 scanlines; credit: MathOnNapkins
; Has no effect on anything
; But it gives us consistent improvements to account for practice hack lag
;===================================================================================================
org $00805D
	JML WasteTimeIfNeeded

org $00841E
	LDA.b $F0 : STA.w SA1IRAM.CopyOf_F0
	LDA.b $F2 : STA.w SA1IRAM.CopyOf_F2
	LDA.b $F4 : STA.w SA1IRAM.CopyOf_F4
	LDA.b $F6 : STA.w SA1IRAM.CopyOf_F6

	LDA.b #$81 ; fire an IRQ to request shortcuts
	STA.w $2200

	REP #$10

	; 246,16 : 250,18
	; Vanilla OAM cycles: 4 scanlines - 10
	;
	; Improved to: 2 scanlines + 87
	; SA1 thing is 1 scanline + 52
	; Waste time check is 38
	; total is 3 scanlines + 184
	;
	; 152 left to waste
	;
	; NMI JSL+RTL = ~28 dots
	; NMI cache = ~44+14+14 dots
	; so NMI is ~100 dots
	;
	; 52 left to waste
	;
	; HUD uses ~38 dots

	; set up
	LDA.b #OAM_Cleaner>>16 : STA.w $4354
	LDX.w #$8001 : STX.w $4350

	LDA.b #$20

	; first half
	LDX.w #OAM_Cleaner : STX.w $4352
	LDX.w #$0801 : STX.w $2181 : STZ.w $2183
	LDX.w #$0080
	STX.w $4355
	STA.w $420B

	; second half
	STX.w $4355
	LDX.w #$0901 : STX.w $2181
	LDX.w #OAM_Cleaner : STX.w $4352
	STA.w $420B

	BIT.w SA1IRAM.SHORTCUT_USED+1
	BMI ++
	SEP #$30

	RTS

	; if shortcut was used, exit
++	PLX ; remove return point
	PEA.w RequestShortcut-1
	SEP #$30

	RTS

warnpc $008489

;===================================================================================================
; This small joypad improvement of 8 cycles gives us a little more leeway
; but we also use 10 cycles here for joypad 2
; net loss is 2 cycles, not an issue
;===================================================================================================
org $0083D1
	REP #$20

	LDA.w $421A
	STA.w SA1IRAM.JOYPAD2_NEW

	LDA.w $4218
	STA.b $00 ; not really necessary, but good for expected glitching

	SEP #$20
	STA.b $F2
	TAY
	EOR.b $FA
	AND.b $F2
	STA.b $F6
	STY.b $FA

	XBA
	STA.b $F0
	TAY
	EOR.b $F8
	AND.b $F0
	STA.b $F4
	STY.b $F8

	RTS

warnpc $0083F8

; NMI hook
org $0080D5
	JSL nmi_expand

; TM and TS writes
org $008176 : STA.w SA1RAM.layer_writer+0
org $00817B : STA.w SA1RAM.layer_writer+1

; The time this routine takes isn't relevant
; since it's never during game play
org $00E36A
	JSL LoadCustomHUDGFX
	PLB
	RTL

pullpc

; Needs to leave AI=8
nmi_expand:
	; enters AI=16
	SEP #$30
	; this covers the PHK : PLB we overwrote
	PHA ; A is 0 from right before the hook
	PLB ; and that happens to be the bank we want

	LDA.w SA1RAM.disabled_layers
	TRB.w SA1RAM.layer_writer+0
	TRB.w SA1RAM.layer_writer+1

	REP #$20
	LDA.w SA1RAM.layer_writer
	STA.w $212C
	SEP #$20

	LDA.b $12 : STA.w SA1IRAM.CopyOf_12

	LDA.b #$12 ; timers NMI
	STA.w $2200

	RTL

;===================================================================================================
; OAM cleaner optimization
;===================================================================================================
macro OAMVClear(pos)
	db $F0, <pos>+$05, $F0, <pos>+$09, $F0, <pos>+$0D, $F0, <pos>+$11
endmacro

OAM_Cleaner:
	%OAMVClear($00)
	%OAMVClear($10)
	%OAMVClear($20)
	%OAMVClear($30)
	%OAMVClear($40)
	%OAMVClear($50)
	%OAMVClear($60)
	%OAMVClear($70)
	%OAMVClear($80)
	%OAMVClear($90)
	%OAMVClear($A0)
	%OAMVClear($B0)
	%OAMVClear($C0)
	%OAMVClear($D0)
	%OAMVClear($E0)
	%OAMVClear($F0)

;===================================================================================================
; Custom NMI for hud
;===================================================================================================
NMI_RequestFullMenuUpdate:
	REP #$20

	LDA.w #NMI_UpdatePracticeHUD_full
	STA.w SA1RAM.SNES_NMI_VECTOR

	SEP #$30

	RTL

NMI_Request2RowsUpdate:
	REP #$20

	LDA.w #NMI_UpdatePracticeHUD_two_rows
	STA.w SA1RAM.SNES_NMI_VECTOR

	SEP #$30

	STX.w SA1RAM.SNES_NMI_args+0
	STY.w SA1RAM.SNES_NMI_args+1

	RTL

NMI_RequestCurrentRowUpdateUnless:
	REP #$20

	LDA.w SA1RAM.SNES_NMI_VECTOR
	CMP.w #NMI_UpdatePracticeHUD_full
	BEQ .no

	LDA.w #NMI_UpdatePracticeHUD_current_row
	STA.w SA1RAM.SNES_NMI_VECTOR

.no
	SEP #$30
	RTL

;===================================================================================================

NMI_UpdatePracticeHUD:

.full
	REP #$20

	LDA.w #SA1RAM.MENU

	STA.w $4352
	LDA.w #$6C00

	STA.w $2116
	LDA.w #$0800

.start
	STA.w $4355
	LDA.w #$1801
	STA.w $4350

	SEP #$20

	LDA.b #$80
	STA.w $2115

	STZ.w $4354

	LDA.b #$20
	STA.w $420B

	RTS

;---------------------------------------------------------------------------------------------------

.current_row
	REP #$20
	LDA.w SA1IRAM.cm_cursor
	BRA .do_row

.two_rows
	REP #$20
	LDA.w SA1RAM.SNES_NMI_args+0
	JSR .do_row

	REP #$20
	LDA.w SA1RAM.SNES_NMI_args+1

;---------------------------------------------------------------------------------------------------

.do_row
	AND.w #$00FF
	XBA
	LSR
	LSR
	PHA
	LSR
	ADC.w #$6C60
	STA.w $2116

	PLA
	ADC.w #SA1RAM.MENU+(64*3)
	STA.w $4352

	LDA.w #$0040
	BRA .start

;===================================================================================================

SNES_ENABLE_CUSTOM_NMI:
	REP #$20

	LDA.w #SNES_CUSTOM_NMI_nothing
	STA.w SA1RAM.SNES_NMI_VECTOR

--	SEP #$21

	LDA.b #$11
	STA.w $2200

	ROL A
-	DEC A : BPL -

	; check if custom NMI is enabled
	LDA.b #$10
	AND.w $2300
	BEQ --

	RTL

SNES_DISABLE_CUSTOM_NMI:
--	SEP #$21

	LDA.b #$10
	STA.w $2200

	ROL A
-	DEC A : BPL -

	; check if custom NMI is enabled
	LDA.b #$10
	AND.w $2300
	BNE --

	RTL

;===================================================================================================

SNES_CUSTOM_NMI:
	REP #$30
	PHA
	PHX
	PHY
	PHD
	PHB

	SEP #$21
	LDA.l $004210

	PEA.w $0000
	PLD
	TDC ; A = 0000
	TAX ; X = 0000

	PHK
	PLB

	STA.w $420C ; disable HDMA aggressively

	ROR ; A = 80
	STA.w $2100

	LDA.b $12
	BEQ .good_to_go

	JMP .lagging

.good_to_go
	INC.b $12

	JSR.w (SA1RAM.SNES_NMI_VECTOR,X)

	PEA.w $0000 ; used to be D=0 later
	PEA.w $2100
	PLD

	PHK
	PLB

	SEP #$30
	LDA.b #$04 ; only show BG3
	STA.b $212C
	STZ.b $212D

	LDA.b #$09 : STA.w $2105 ; BG mode 1
	LDA.b #$63 : STA.w $2109 ; restore tilemap and char addresses
	LDA.b #$07 : STA.w $210C

	; BG 3 scroll
	LDA.b #$01
	STZ.b $2111
	STA.b $2111

	STZ.b $2112
	STA.b $2112

	STZ.b $2106 ; no mosaic

	STZ.b $2123 ; no windowing
	STZ.b $2124
	STZ.b $2125

	STZ.b $212E
	STZ.b $212F

	STZ.b $2131 ; no color math

	; handle music and sfx
	LDX.b #3

--	LDA.w $012C,X
	STA.b $40,X
	STZ.w $012C,X
	DEX
	BPL --

	PLD ; D=0000
	TDC ; A=0000

	; Refresh colors every frame just cause it's easier
	REP #$10
	LDY.w #0

.next_color
	LDA.w .cgrams,Y
	BMI .done_color

	INY
	STA.w $2121

	LDX.w .cgrams,Y
	INY
	INY

	STX.b $00

	LDA.b ($00)
	ASL
	TAX

	LDA.l COLORS_YAY,X
	STA.w $2122

	INX
	LDA.l COLORS_YAY,X
	STA.w $2122

	BRA .next_color

.done_color
	SEP #$30

	JSL ReadJoyPad_long

	LDA.b $F0 : STA.w SA1IRAM.CopyOf_F0
	LDA.b $F2 : STA.w SA1IRAM.CopyOf_F2
	LDA.b $F4 : STA.w SA1IRAM.CopyOf_F4
	LDA.b $F6 : STA.w SA1IRAM.CopyOf_F6

	REP #$20

	LDA.w #.nothing
	STA.w SA1RAM.SNES_NMI_VECTOR

.lagging
	SEP #$20

	LDA.b #$0F
	STA.w $2100

	JMP.w SA1NMI_EXIT

.nothing
	RTS

.cgrams
	db 00 : dw !config_hud_bg
	db 03 : dw !config_hud_bg

	db 17 : dw !config_hud_header_hl
	db 18 : dw !config_hud_header_fg
	db 19 : dw !config_hud_header_bg

	db 22 : dw !config_hud_sel_fg
	db 23 : dw !config_hud_sel_bg

	db 30 : dw !config_hud_sel_bg
	db 31 : dw !config_hud_sel_fg

	db 26 : dw !config_hud_dis_fg
	db 27 : dw !config_hud_bg

	db $FF ; done
