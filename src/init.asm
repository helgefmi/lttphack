pushpc
; Code that is run once after the game has been powered on.

; Overrides the following:
; LDA.b #$81 : STA $4200
org $00802F
	JSL init_hook
	NOP

; need to fix a small buffer myself since it empties to 0 not in init
org $0CC1FF
JSL ClearWatchBuffer_pre

org $008829
JSL ClearBank7F

pullpc
ClearBank7F:
	STA.b $13
	INC.b $15

	STZ $2181
	STZ $2182
	LDA.b #$01
	STA $2183

	LDA.b #.zero>>0
	STA $4302
	LDA.b #.zero>>8
	STA $4303
	LDA.b #.zero>>16
	STA $4304

	LDA #$FF ; fill the whole thing
	STA $4305
	STA $4306

	LDA #$08
	STA $4300
	LDA #$80
	STA $4301

	LDA #$01
	STA $420B ; can't write bank 7F yet

	STZ $2180 ; last byte

	RTL

.zero
	dw 0

ClearWatchBuffer:
	PHX
	PHA
	PHP
	REP #$20
	SEP #$10
	LDA #$207F
	LDX #$3E

--	STA.l !dg_buffer_r0, X
	STA.l !dg_buffer_r1, X
	STA.l !dg_buffer_r2, X
	STA.l !dg_buffer_r3, X
	STA.l !dg_buffer_r4, X
	DEX : DEX : BPL --

	PLP
	PLA
	PLX
	RTL

.pre
	STA.b $CA ; vanilla code
	SEP #$30
	BRA ClearWatchBuffer

init_hook:
	JSL init_expand
	%ai8()
	LDA #$81 : STA $4200
	RTL

init_expand:
	LDA #$01 : STA $420D ; enable fast rom
	; enters AI=8
	; If user holds Start+Select, we reinitialize.
	; we need some manual joypad reading
	LDA #$01 : STA $4016 : STZ $4016 ; pulse controller

	STZ $00 : STZ $01
	LDY #$10 ; reading 16 bits
--	LDA $4016 ; if the last bit is on, carry will be set, otherwise, it won't; A is still 1
	LSR
	ROL $00 : ROL $01 ; roll carry from A and then from $00
	DEY : BNE -- ; decrement

	%a16()
	LDA $00
	AND #$FF00 : CMP #$3000 : BEQ .forcereset
	LDA !ram_ctrl_prachack_menu : CMP #$1010 : BEQ .noforcereset

.forcereset
	JSR init_initialize_all
	BRA .sram_initialized

.noforcereset
	LDA !ram_sram_initialized : CMP #!SRAM_VERSION : BEQ .sram_initialized

.reinitialize
	JSR init_initialize

.sram_initialized
	; Some features probably should be turned off after a reset
	%a8()
	STZ !lowram_oob_toggle
	LDA #$00
	STA.l !ram_superwatch
	STA.l !ram_superwatch+1
	LDA.l !ram_feature_music : BNE +
	JSL mute_music
+
.done
	RTL

init_initialize_all:
	!PERM_INIT

init_initialize:
	!INIT_ASSEMBLY

	LDA #!SRAM_VERSION : STA !ram_sram_initialized

	%i16()
	LDA #$0000
	LDX #$00FE
.loop
	STA !sram_movies, X
	DEX #2 : BPL .loop
	%i8()

	RTS
