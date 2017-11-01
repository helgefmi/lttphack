; INIT
;
; Code that is run once after the game has been powered on.

org $0CC1FF
    JML init_hook


org $268000
init_hook:
    ; enters AI=16
    ; need to be at AI=8 before RTL
    STA $CA
    JSR init_expand
  %ai8()
    RTL

init_expand:
    ; enters AI=8
  %a16()
    LDA !ram_sram_initialized : CMP #$1234 : BEQ .sram_initialized

    LDA.w #!FEATURE_HUD : STA !ram_enemy_hp_toggle : STA !ram_counters_toggle : STA !ram_input_display_toggle : STA !ram_toggle_lanmola_cycles
    LDA #$0000 : STA !ram_xy_toggle : STA !ram_qw_toggle : STA !ram_lit_rooms_toggle : STA !ram_oob_toggle : STA !ram_savestate_controller

    LDA #!ram_ctrl1_word : STA !ram_savestate_ctrl_to_use
    LDA !SHORTCUT_LOAD_P1 : STA !ram_savestate_load_shortcut
    LDA !SHORTCUT_SAVE_P1 : STA !ram_savestate_save_shortcut

    LDA #$1234 : STA !ram_sram_initialized

  .sram_initialized
    ; Set P1
    LDA #!ram_ctrl1_word : STA !ram_savestate_ctrl_to_use
    LDA !SHORTCUT_LOAD_P1 : STA !ram_savestate_load_shortcut
    LDA !SHORTCUT_SAVE_P1 : STA !ram_savestate_save_shortcut

    ; Check if we need to set P2
  %a8()
    LDA !ram_savestate_controller : BEQ .done
  %a16()
    LDA #!ram_ctrl2_word : STA !ram_savestate_ctrl_to_use
    LDA !SHORTCUT_LOAD_P2 : STA !ram_savestate_load_shortcut
    LDA !SHORTCUT_SAVE_P2 : STA !ram_savestate_save_shortcut

    ; Some features probably should be turned off after a reset
  %a8()
    LDA #$00 : STA !ram_oob_toggle : STA !lowram_oob_toggle

  .done
    RTS
