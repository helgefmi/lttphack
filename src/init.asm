; INIT
;
; Code that is run once after the game has been powered on.

!SRAM_VERSION = $000B

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
    ; If user holds Start+Select, we reinitialize.
    LDA !ram_ctrl1 : CMP #$0030 : BEQ .reinitialize

    LDA !ram_sram_initialized : CMP #!SRAM_VERSION : BEQ .sram_initialized

  .reinitialize
    LDA.w #!FEATURE_HUD : STA !ram_counters_toggle : STA !ram_input_display_toggle : STA !ram_toggle_lanmola_cycles
    LDA #$0001 : STA !ram_feature_music : STA !lowram_last_feature_music
    LDA #$0000
    STA !ram_xy_toggle : STA !ram_qw_toggle : STA !ram_lit_rooms_toggle : STA !ram_oob_toggle
    STA !ram_previous_preset_type : STA !ram_previous_preset_destination : STA !ram_secondary_counter_type
    STA !ram_enemy_hp_toggle

    ; Start + R
    LDA #$1010 : STA !ram_ctrl_prachack_menu
    ; B + L + Select
    LDA #$20A0 : STA !ram_ctrl_load_last_preset
    ; Y + R + Select
    LDA #$1060 : STA !ram_ctrl_save_state
    ; Y + L + Select
    LDA #$2060 : STA !ram_ctrl_load_state
    ; Unset
    LDA #$0000
    STA !ram_ctrl_toggle_oob
    STA !ram_ctrl_skip_text
    STA !ram_ctrl_disable_sprites
    STA !ram_ctrl_reset_segment_timer

    LDA #!SRAM_VERSION : STA !ram_sram_initialized

  .sram_initialized
    ; Some features probably should be turned off after a reset
  %a8()
    LDA #$00 : STA !ram_oob_toggle : STA !lowram_oob_toggle

  .done
    RTS
