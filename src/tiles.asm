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
  ; Enters: AI=8
  ; Leave with: AI=8
	%ai8()
	LDA.b #$02 : STA $2101

	%a16() : LDA $C8 : PHA : %a8()
	; Note that this one messes with $00-0F a bunch.
	JSL $00E310
	%a16() : PLA : STA $C8 : %a8()

	%i16()
	; word-access, incr by 1
	LDA #$80 : STA $2115

	LDX #$7000 : STX $2116 ; VRAM address (E000 in vram)
	LDX #hud_table : STX $4302 ; Source offset
	LDA #hud_table>>16 : STA $4304 ; Source bank
	LDX #$02C0 : STX $4305 ; Size (0x10 = 1 tile)
	LDA #$01 : STA $4300 ; word, normal increment (DMA MODE)
	LDA #$18 : STA $4301 ; destination (VRAM write)
	LDA #$01 : STA $420B ; initiate DMA (channel 1)
	%ai8()
	RTL

hud_table:
	incbin ../resources/hud_gfx.bin
