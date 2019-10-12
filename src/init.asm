pushpc
; INIT
;
; Code that is run once after the game has been powered on.

!SRAM_VERSION = $001F

; Overrides the following:
; LDA.b #$81 : STA $4200
org $00802F
	JSL init_hook
	NOP

pullpc
init_hook:
	LDA #$81 : STA $4200
	JSL init_expand
	%ai8()
	RTL

init_expand:
	; enters AI=8
	; If user holds Start+Select, we reinitialize.
	; we need some manual joypad reading
	LDA #$01 : STA $4016 : STZ $4016 ; pulse controller

	STZ $00 : STZ $01
	LDY #$10 ; reading 16 bits
--	LDA $4016 ; if the last bit is on, carry will be set, otherwise, it won't; A is still 1
	LSR
	ROL $00 : ROL $01 ; roll carry
	DEY : BNE -- ; decrement

	%a16()
	LDA $00
	AND #$FF00 : CMP #$3000 : BEQ .reinitialize

	LDA !ram_sram_initialized : CMP #!SRAM_VERSION : BEQ .sram_initialized

.reinitialize
	JSR init_initialize

.sram_initialized
	; Some features probably should be turned off after a reset
	%a8()
	STZ !lowram_oob_toggle

.done
	JSL music_init
	RTL

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
