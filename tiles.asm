; Load Tiles Hijack
org $028068
    JSL load_default_tileset

; Load Tiles Hook
org $248000
load_default_tileset:
    %ai8()
    LDA.b #$02 : STA $2101

    ; Note that this one messes with $00-0F a bunch.
    JSL $00E310

    PHB : PHK : PLB

    %a16()
    ; dest address. #$7000 = $E000 in VRAM. (multiply by 2)
    LDA #$7000 : STA $2116

    LDX.b #00
    LDY.b #12 ; number of tiles

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
    DW #$0000,#$1800,#$3C00,#$6600,#$7E00,#$6600,#$6600,#$0000
    DW #$0000,#$7C00,#$6600,#$7C00,#$6600,#$6600,#$7C00,#$0000
    DW #$0000,#$6600,#$3C00,#$1800,#$1800,#$3C00,#$6600,#$0000
    DW #$0000,#$6600,#$6600,#$3C00,#$1800,#$1800,#$1800,#$0000
    DW #$0000,#$6000,#$6000,#$6000,#$6000,#$7E00,#$7E00,#$0000
    DW #$0000,#$7C00,#$6600,#$6600,#$7C00,#$6C00,#$6600,#$0000
    DW #$1000,#$3800,#$7C00,#$FE00,#$3800,#$3800,#$3800,#$0000
    DW #$3800,#$3800,#$3800,#$FE00,#$7C00,#$3800,#$1000,#$0000
    DW #$0800,#$0C00,#$7E00,#$7F00,#$7E00,#$0C00,#$0800,#$0000
    DW #$1000,#$3000,#$7E00,#$FE00,#$7E00,#$3000,#$1000,#$0000
    DW #$0000,#$0000,#$E800,#$8800,#$E800,#$2800,#$EE00,#$0000
    DW #$0000,#$0000,#$EE00,#$8400,#$E400,#$2400,#$E400,#$0000

; L, u, R, Y, X, SL
ctrl_top_bit_table:
    DW #$2000,#$0008,#$1000,#$0040,#$4000,#$0020
ctrl_top_gfx_table:
    DW #$2404,#$2406,#$2405,#$2403,#$2402,#$240A

; l, d, r, B, A, ST
ctrl_bot_bit_table:
    DW #$0002,#$0004,#$0001,#$0080,#$8000,#$0010
ctrl_bot_gfx_table:
    DW #$2409,#$2407,#$2408,#$2401,#$2400,#$240B
