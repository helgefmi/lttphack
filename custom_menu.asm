; $1100 = first line -> $D100 in VRAM
; $1140 = second line
; $1780 = last line
; $40 bytes/32 tiles per line.

table chrmap.tbl

org $00806D
    db #$00
org $008089
    db #$80
org $0080A5
    db #$25

macro inc_mode()
    ; Assumes A=8
    LDA !ram_cm_mode : INC : STA !ram_cm_mode
endmacro

org $258000
CM_Main:
    PHB : PHK : PLB

    JSR CM_Local

    PLB
    RTL


CM_Local:
    LDA !ram_cm_mode

    JSL !UseImplicitRegIndexedLocalJumpTable

    dw CM_Init
    dw CM_DrawMenu
    dw CM_MenuDown
    dw CM_Active
    dw CM_MenuUp
    dw CM_Return


CM_Init:
    JSR cm_clear_buffer

  %ppu_off()
    JSR cm_transfer_tilemap
  %ppu_on()

  %a16()
    LDA #cm_mainmenu_indices : STA !ram_cm_active_menu_indices
  %a8()

    %inc_mode()
    RTS


CM_DrawMenu:
    ; play sound effect for opening item menu
    LDA.b #$11 : STA $012F

    JSR cm_draw_active_menu

    ; tell NMI to update tilemap
    LDA.b #$01 : STA $17
    LDA.b #$22 : STA $0116

    %inc_mode()
    RTS


CM_MenuDown:
  %a16()
    LDA $EA : SEC : SBC.w #$0008 : STA $EA
    CMP.w #$FF18
  %a8()

    BNE .notDoneScrolling

    %inc_mode()

  .notDoneScrolling
    RTS


CM_Active:
    ; $F4 = BYST | udlr
    ; $F6 = AXLR | ....

    LDA $F4 : CMP #$10 : BEQ .pressed_start
    CMP #$04 : BEQ .pressed_down
    CMP #$08 : BEQ .pressed_up
    LDA $F6 : CMP #$80 : BEQ .pressed_a

    ; Did not press anything
    BRA .done

  .pressed_start
    %inc_mode()
    BRA .done

  .pressed_up
  %a16()
    LDA !lowram_cm_cursor : DEC : DEC : JSR cm_fix_cursor_wrap : STA !lowram_cm_cursor
  %a8()
    JSR cm_draw_active_menu
    BRA .did_update_gfx

  .pressed_down
  %a16()
    LDA !lowram_cm_cursor : INC : INC : JSR cm_fix_cursor_wrap : STA !lowram_cm_cursor
  %a8()
    JSR cm_draw_active_menu
    BRA .did_update_gfx

  .pressed_a
    JSR cm_execute_cursor
    JSR cm_draw_active_menu
    BRA .did_update_gfx

  .did_update_gfx
    ; tell NMI to update tilemap
    LDA.b #$01 : STA $17
    LDA.b #$22 : STA $0116

  .done
    RTS


CM_MenuUp:
  %a16()
    LDA $EA : CLC : ADC.w #$0008 : STA $EA
  %a8()

    BNE .notDoneScrolling

    %inc_mode()

  .notDoneScrolling
    RTS

CM_Return:
  %ppu_off()
    JSL load_default_tileset
  %ppu_on()

    LDA !ram_cm_old_gamemode : STA $10
    LDA !ram_cm_old_submode : STA $11
    RTS


cm_clear_buffer:
  %a16()

    LDX.b #$00

    ; value of a transparent tile
    LDA #$207F

  .clearVramBuffer

    STA $1000, X : STA $1080, X
    STA $1100, X : STA $1180, X
    STA $1200, X : STA $1280, X
    STA $1300, X : STA $1380, X
    STA $1400, X : STA $1480, X
    STA $1500, X : STA $1580, X
    STA $1600, X : STA $1680, X
    STA $1700, X : STA $1780, X

    INX : INX : CPX.b #$80

    BNE .clearVramBuffer

  %a8()
    RTS


cm_transfer_tilemap:
    %i16()

    ; word-access, incr by 1
    LDA #$80 : STA $2115

    LDX #$7000 : STX $2116 ; VRAM address (E000 in vram)
    LDX #cm_hud_table : STX $4302 ; Source offset 
    LDA #$25 : STA $4304 ; Source bank
    LDX #$0720 : STX $4305 ; Size (0x10 = 1 tile)
    LDA #$01 : STA $4300 ; word, normal increment (DMA MODE)
    LDA #$18 : STA $4301 ; destination (VRAM write)
    LDA #$01 : STA $420B ; initiate DMA (channel 1)

    %i8()
    RTS


cm_draw_active_menu:
  %ai16()
    LDA !ram_cm_active_menu_indices : STA $00
    LDY #$0000
    LDX #$0144

  .loop
    CPY !lowram_cm_cursor : BEQ .on_cursor

  %a8()
    LDA.b #$24 : STA $04
    JMP .next_item

  .on_cursor
  %a8()
    LDA.b #$20 : STA $04
    
  .next_item
  %a16()
    LDA ($00), y : BEQ .end
    
    PHY : PHX

    STA $02 : JSR cm_draw_text

  %ai8()
    INY : LDA ($02), y : TAX
    JSR (cm_action_draw_table, x)
  %ai16()

    PLX : PLY
    TXA : CLC : ADC #$0040 : TAX
    INY : INY
    JMP .loop

  .end
    STA !ram_debug

  %ai8()
    RTS


cm_draw_text:
    %a8()
    LDY #$0000

  .loop
    LDA ($02), y : CMP #$FF : BEQ .end
    STA $1000, x : INX
    LDA $04 : STA $1000, x : INX
    INY : JMP .loop

  .end
    %a16()
    RTS


cm_draw_icon:
  %a8()
    STA $1000, x : INX
    LDA #$20 : STA $1000, x
  %a16()
    RTS


cm_fix_cursor_wrap:
  TAX

  %ai16()
    LDA !ram_cm_active_menu_indices : STA $00
    LDY #$0000

  .loop
  %a16()
    LDA ($00), y : BEQ .after_loop
    INY : INY
    JMP .loop

  .after_loop
  %ai8()

    ; X = cursor
    ; Y = max + 2

    STY $00
    TXA

    BMI .set_to_max
    CMP $00 : BEQ .set_to_zero : BCS .set_to_zero

    BRA .end

  .set_to_zero
    LDA.b #$00
    BRA .end

  .set_to_max
    LDA $00
    DEC : DEC

  .end
  %ai8()
    RTS


cm_execute_cursor:
  %ai16()
    LDA !ram_cm_active_menu_indices : STA $00
    LDY !lowram_cm_cursor

    ; Put the correct menu item at $00
    LDA ($00), y : STA $00

    ; Skip the text
    LDY #$0000
  %a8()
  .loop
    LDA ($00), y : CMP #$FF : BEQ .done_with_text
    INY : BRA .loop

  .done_with_text
    INY : LDA ($00), y
    TAX
    INY

  %ai8()
    JSR (cm_action_table, x)
    RTS


cm_action_table:
    dw cm_action_toggle_byte

print pc
cm_action_draw_table:
    dw cm_action_draw_toggle_byte


cm_action_draw_toggle_byte:
    RTS

cm_action_toggle_byte:
  %a16()
    LDA ($00), y : STA $04
  %a8()
    INY : INY : LDA ($00), y : STA $06
    LDA [$04] : EOR.b #$01 : STA [$04]
    RTS


cm_hud_table:
    incbin cm_gfx.bin;


cm_mainmenu_indices:
    dw #cm_mainmenu_toggle_xy
    dw #cm_mainmenu_toggle_qw
    dw #cm_mainmenu_toggle_lit_rooms
    dw #cm_mainmenu_toggle_oob
    dw #$0000


cm_mainmenu_toggle_xy:
    db "Coordinates", #$FF
    db !CM_ACTION_TOGGLE_BYTE
    dl !ram_xy_toggle

cm_mainmenu_toggle_qw:
    db "Quickwarp indicator", #$FF
    db !CM_ACTION_TOGGLE_BYTE
    dl !ram_qw_indicator_toggle

cm_mainmenu_toggle_oob:
    db "OoB mode", #$FF
    db !CM_ACTION_TOGGLE_BYTE
    dl !lowram_oob_toggle

cm_mainmenu_toggle_lit_rooms:
    db "Lit rooms", #$FF
    db !CM_ACTION_TOGGLE_BYTE
    dl !ram_lit_rooms_toggle
