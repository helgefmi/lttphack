pushpc

org $028068 : JSL LoadCustomHUDGFX

pullpc

LoadCustomHUDGFX:
	REP #$20
	SEP #$10

	LDY.b #$01

	LDX.b #$80 : STX.w $2115
	LDA.w #$E000>>1 : STA.w $2116
	LDA.w #$1801 : STA.w $4300
	LDA.w #hud_table : STA.w $4302
	LDX.b #hud_table>>16 : STX.w $4304
	LDA.w #$1800 : STA.w $4305

	STY.w $420B

	; Font
	LDA.w #$7080 : STA.w $2116
	LDA.w #$1801 : STA.w $4300
	; we're writing 16 2BPP tiles to VRAM
	; 16*64*2 = 2048 bits, or 256 bytes
	; AKA 0x100 bytes
	; since the offset is a multiple of 256, we can just swap the bytes and
	LDA.w !config_hud_font : XBA : CLC : ADC.w #hud_font : STA.w $4302
	LDX.b #hud_font>>16 : STX.w $4304
	LDA.w #$0100 : STA.w $4305

	STY.w $420B

	; Input display
	LDA.w !config_input_display : AND.w #$0002 : BEQ .done

	LDA.w #$F700>>1 : STA.w $2116
	LDA.w #$1801 : STA.w $4300
	LDA.w #hud_inputchars : STA.w $4302
	LDX.b #hud_inputchars>>16 : STX.w $4304
	LDA.w #12*8*2 : STA.w $4305 ; writing 12 2BPP tiles

	STY.w $420B

.done
	SEP #$30

	RTL

hud_table:
	incbin resources/hud_gfx.2bpp

hud_font:
	incbin resources/hud_font.2bpp

cm_gfx:
	incbin resources/menu_font.2bpp

hud_inputchars:
	incbin resources/inputchars.2bpp
