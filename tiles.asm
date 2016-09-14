; TILES
;
; Takes care to expand the tileset with our own stuff, so we can draw custom HUD items.

; Load Tiles Hijack
org $028068
    JSL load_default_tileset


; Load Tiles Hook
org $248000
load_default_tileset:
  ; Enters: AI=8
  ; Leave with: AI=8
  %ai8()
    LDA.b #$02 : STA $2101

    ; Note that this one messes with $00-0F a bunch.
    JSL $00E310

    PHB : PHK : PLB

  %a16()
    ; dest address. #$7000 = $E000 in VRAM. (multiply by 2)
    LDA #$7000 : STA $2116

    LDX.b #00
    LDY.b #14 ; number of tiles

  .loop
    ; loop
    LDA hud_table,x : STA $2118 : INX : INX
    LDA hud_table,x : STA $2118 : INX : INX
    LDA hud_table,x : STA $2118 : INX : INX
    LDA hud_table,x : STA $2118 : INX : INX
    LDA hud_table,x : STA $2118 : INX : INX
    LDA hud_table,x : STA $2118 : INX : INX
    LDA hud_table,x : STA $2118 : INX : INX
    LDA hud_table,x : STA $2118 : INX : INX
    DEY : BEQ .end
    JMP .loop

  .end
    PLB

  %ai8()
    RTL

hud_table:
    incbin hud_gfx.bin
