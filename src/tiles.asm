pushpc
; TILES
;
; Takes care to expand the tileset with our own stuff, so we can draw custom HUD items.

; Load Tiles Hijack
org $028068
	JSL load_default_tileset

; Load Tiles Hook
pullpc
load_default_tileset:
LoadCustomHUDGFX:
	%a16()
	%i8()
	LDY #$01 ; dma channel 0

	LDX #$80 : STX $2115
	LDA #$7000 : STA $2116 ; VRAM address ($E000 in vram)
	LDA #$1801 : STA $4300 ; word, normal increment, destination $2118
	LDA.w #hud_table : STA $4302 ; Source offset
	LDX.b #hud_table>>16 : STX $4304 ; Source bank
	LDA #$1800 : STA $4305 ; Size (0x800 = 1 sheet)

	STY $420B ; initiate DMA (channel 1)

	; next, load the font
LoadHudFont:
	LDA #$7080 : STA $2116
	LDA #$1801 : STA $4300
	; we're writing 16 2BPP tiles to VRAM
	; so 16*64*2 = 2048 bits, or 256 bytes
	; AKA 0x100 bytes
	; since the offset is a multiple of 256,
	; we can just swap the bytes and
	; add them in as the offset
	LDA !ram_hud_font : XBA : CLC : ADC.w #hud_font : STA $4302
	LDX.b #hud_font>>16 : STX $4304
	LDA #$0100 : STA $4305

	STY $420B

LoadHudInputDisplay:
	LDA !ram_input_display : AND #$0002 : BEQ CustomCharsDone
	LDA #$7000 : STA $2116
	LDA #$1801 : STA $4300
	LDA #hud_inputchars : STA $4302
	LDX.b #hud_inputchars>>16 : STX $4304
	; we're writing 12 2BPP tiles to VRAM
	LDA.w #12*8*2 : STA $4305

	STY $420B

CustomCharsDone:
	%ai8() ; expected flags from both entry points/DecompAndDirectCopy
	RTL

hud_table:
	incbin ../resources/hud_gfx1.2bpp
	incbin ../resources/hud_gfx2.2bpp
	incbin ../resources/hud_gfx3.2bpp

hud_font:
	incbin ../resources/hud_font1.2bpp
	incbin ../resources/hud_font2.2bpp

cm_hud_table:
	incbin ../resources/menu_font1.2bpp
	incbin ../resources/menu_font2.2bpp

hud_inputchars:
	incbin ../resources/inputchars.2bpp