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
  %ai8()
    JSR init_expand
    RTL

init_expand:
    ; enters AI=16
    ; must leave at AI=16
    LDA.b #$01
    STA !ram_enemy_hp_toggle
    STA !ram_counters_toggle
    STA !ram_input_display_toggle
    STA !ram_toggle_lanmola_cycles

  %ai16() ; Init control for savestate
    LDA #!ram_ctrl1_word : STA !ram_savestate_ctrl_to_use
    LDA !SHORTCUT_LOAD_P1 : STA !ram_savestate_load_shortcut
    LDA !SHORTCUT_SAVE_P1 : STA !ram_savestate_save_shortcut
  %ai8()

    RTS
