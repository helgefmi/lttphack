; Hooks into the "load target area" JSL call done after choosing a destination
; in the Bird menu.
org $0AB90D
    JSL poverty_load_state


org $278000
poverty_load_next_frame:
  %ai8()
    JSR poverty_deinit_current_submodule

    ; Jumps to Bird Menu module
    LDA.b #$0E : STA $10

    ; Make sure we're back into light word after the Messaging module is done.
    LDA.b #$09 : STA $010C

    ; Skip the opening of overworld map and such. We want instaport.
    LDA.b #$06 : STA $0200

    LDA.b #$0A : STA $11
    RTL


poverty_deinit_current_submodule:
    ; Enters: AI=8
    ; Leaves: AI=8

    LDA $10 : CMP.b #$0E : CMP .not_message_module
    LDA $11 : CMP.b #$02 : CMP .not_message_module

    JSR poverty_deinit_dialog_mode
    
  .not_message_module
    ; Set link to be in the Overworld
    STZ $1B

    RTS


poverty_deinit_dialog_mode:
    ; Enters: AI=8
    ; Leaves: AI=8

  %ai16()
    LDA $1CD2 : STA $1CD0

    LDA $1CD0 : XBA : STA $1002
    LDA #$2E42 : STA $1004
    LDA #$387F : STA $1006

    LDA.w #$FFFF : STA $1008

  %ai8()
    LDA.b #$01 : STA $14

    STZ $1CD8

    RTS


; ----------
; Load Area
; ----------

table_ow_screen_index:
    dw $0013, $006E

table_ow_unknown_1:
    dw $001C, $0000

table_ow_bg1_vscroll:
    dw $0400, $0A00

table_ow_bg2_vscroll:
    dw $0400, $0A00

table_ow_bg1_hscroll:
    dw $06DE, $0D6B

table_ow_bg2_hscroll:
    dw $06DE, $0C00

table_ow_link_y:
    dw $045A, $0A15

table_ow_link_x:
    dw $0758, $0C7E

table_ow_scroll_y:
    dw $046D, $0A6D

table_ow_scroll_x:
    dw $0763, $0C85

table_ow_unknown_2:
    dw 0, 0

table_ow_unknown_3:
    dw 2, 2

table_world_type:
    dw $0000, $0040

; ==============================================================================

poverty_load_state:
  ; Enters: AI=8
    LDA !ram_poverty_do_load : BEQ .normal_flute_menu
    LDA.b #$00 : STA !ram_poverty_do_load
    LDA !ram_poverty_type : CMP.b #$01 : BEQ .load_preset_data
    LDA !ram_poverty_type : CMP.b #$00 : BEQ .load_custom_data

  .normal_flute_menu
    ; This means we got here from the actual Bird menu (how boring),
    ; so lets just jump to the original function.
    JML !BirdTravel_LoadTargetAreaData

  .load_preset_data
  PHB : PHK : PLB
  %a16()
    LDA !ram_poverty_slot : ASL : TAX
    LDA table_ow_screen_index, X : STA !ram_table_ow_screen_index
    LDA table_ow_unknown_1, X : STA !ram_table_ow_unknown_1
    LDA table_ow_bg1_vscroll, X : STA !ram_table_ow_bg1_vscroll
    LDA table_ow_bg2_vscroll, X : STA !ram_table_ow_bg2_vscroll
    LDA table_ow_bg1_hscroll, X : STA !ram_table_ow_bg1_hscroll
    LDA table_ow_bg2_hscroll, X : STA !ram_table_ow_bg2_hscroll
    LDA table_ow_link_y, X : STA !ram_table_ow_link_y
    LDA table_ow_link_x, X : STA !ram_table_ow_link_x
    LDA table_ow_scroll_y, X : STA !ram_table_ow_scroll_y
    LDA table_ow_scroll_x, X : STA !ram_table_ow_scroll_x
    LDA table_ow_unknown_2, X : STA !ram_table_ow_unknown_2
    LDA table_ow_unknown_3, X : STA !ram_table_ow_unknown_3
    LDA table_world_type, X : STA !ram_table_world_type
    LDX #$00
  PLB

    BRA .load_state

  .load_custom_data
  %a16()
    LDA !ram_poverty_slot : INC : ASL : TAX

  .load_state
    STZ $04AC

    ; BG scroll X/Y
    LDA !ram_table_ow_bg1_vscroll, X : STA $E6 : STA $0124
    LDA !ram_table_ow_bg2_vscroll, X : STA $E8 : STA $0122
    LDA !ram_table_ow_bg1_hscroll, X : STA $E0 : STA $0120
    LDA !ram_table_ow_bg2_hscroll, X : STA $E2 : STA $011E

    ; Link X/Y
    LDA !ram_table_ow_link_y, X : STA $20
    LDA !ram_table_ow_link_x, X : STA $22

    ; Unknown
    LDA !ram_table_ow_unknown_2, X : STA $0624
    LDA.w #$0000 : SEC : SBC $0624 : STA $0626

    LDA !ram_table_ow_unknown_3, X : STA $0628
    LDA.w #$0000 : SEC : SBC $0628 : STA $062A

    ; Screen index
    LDA !ram_table_ow_screen_index, X : STA $8A : STA $040A

    ; Unknown
    LDA !ram_table_ow_unknown_1, X : STA $84 : SEC : SBC #$0400 : AND.w #$0F80 : ASL A : XBA : STA $88
    LDA $84 : SEC : SBC.w #$0010 : AND.w #$003E : LSR A : STA $86

    ; Camera scroll X/Y
    LDA !ram_table_ow_scroll_y, X : STA $0618 : DEC #2 : STA $061A
    LDA !ram_table_ow_scroll_x, X : STA $061C : DEC #2 : STA $061E

  %a8()
    ; LW/DW
    LDA !ram_table_world_type, X : STA $7EF3CA
  %a16()

    ; Makes it possible to spawn in the middle of a field/not inside doorway?
    STZ $0696
    
    ; Clears RAM in case it's needed (used for when lifting big rocks?).
    STZ $0698

    JML !BirdTravel_LoadTargetAreaData_AfterData

; ----------
; Save area
; ----------

poverty_save_state:
  %ai16()
    LDA !ram_poverty_slot : INC : ASL : TAX

    ; Scroll X/Y
    LDA $E6 : STA !ram_table_ow_bg1_vscroll, X
    LDA $E8 : STA !ram_table_ow_bg2_vscroll, X
    LDA $E0 : STA !ram_table_ow_bg1_hscroll, X
    LDA $E2 : STA !ram_table_ow_bg2_hscroll, X

    ; Link X/Y
    LDA $20 : STA !ram_table_ow_link_y, X
    LDA $22 : STA !ram_table_ow_link_x, X

    ; Unknown
    LDA $0624 : STA !ram_table_ow_unknown_2, X
    LDA $0628 : STA !ram_table_ow_unknown_3, X

    ; Screen index
    LDA $8A : STA !ram_table_ow_screen_index, X

    ; Unknown
    LDA $84 : STA !ram_table_ow_unknown_1, X

    ; Camera scroll X/Y
    LDA $0618 : STA !ram_table_ow_scroll_y, X
    LDA $061C : STA !ram_table_ow_scroll_x, X

    ; LW/DW
    LDA $7EF3CA : STA !ram_table_world_type, X

  %ai8()
    RTL
