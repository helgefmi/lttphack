pushpc
; INIT
;
; Code that is run once after the game has been powered on.

!SRAM_VERSION = $001E

; Overrides the following:
; LDA.b #$81 : STA $4200
org $00802F
    JSL init_hook
    NOP

pullpc
init_hook:
    LDA #$81 : STA $4200
    JSL init_expand
  %ai8()
    RTL

init_expand:
    ; enters AI=8
    ; If user holds Start+Select, we reinitialize.
    ; we need some manual joypad reading
    LDA #$01 : STA $4016 : STZ $4016 ; pulse controller

    STZ $00 : STZ $01
    LDY #$10 ; reading 16 bits
--  LDA $4016 ; if the last bit is on, carry will be set, otherwise, it won't; A is still 1
    LSR
    ROL $00 : ROL $01 ; roll carry
    DEY : BNE -- ; decrement

  %a16()
    LDA $00
    AND #$FF00 : CMP #$3000 : BEQ .reinitialize

    LDA !ram_sram_initialized : CMP #!SRAM_VERSION : BEQ .sram_initialized

  .reinitialize
    JSR init_initialize

  .sram_initialized
    ; Some features probably should be turned off after a reset
  %a8()
    STZ !lowram_oob_toggle

  .done
    JSL music_init
    RTL

init_initialize:
    LDA.w #!FEATURE_HUD
    STA !ram_counters_idle
    STA !ram_counters_lag
    STA !ram_counters_real
    STA !ram_input_display_toggle
    STA !ram_toggle_lanmola_cycles

    LDA #$0001
    STA !ram_feature_music
    STA !ram_rerandomize_toggle

    LDA #$0000
    STA !ram_can_load_pss
    STA !ram_counters_segment
    STA !ram_enemy_hp_toggle
    STA !ram_lagometer_toggle
    STA !ram_lit_rooms_toggle
    STA !ram_preset_category
    STA !ram_previous_preset_destination
    STA !ram_previous_preset_type
    STA !ram_skip_triforce_toggle
    STA !ram_qw_toggle
    STA !ram_secondary_counter_type
    STA !ram_subpixels_toggle
    STA !ram_xy_toggle
    STA !ram_sanctuary_heart
    STA !ram_autoload_preset
    STA !ram_movie_mode
    STA !ram_movie_index
    STA !ram_movie_timer
    STA !ram_prev_ctrl

    ; Start + R
    LDA #$1010 : STA !ram_ctrl_prachack_menu
    ; B + L + Select
    LDA #$20A0 : STA !ram_ctrl_load_last_preset
    ; Y + R + Select
    LDA #$1060 : STA !ram_ctrl_save_state
    ; Y + L + Select
    LDA #$2060 : STA !ram_ctrl_load_state
    ; R + L + Select
    LDA #$3020 : STA !ram_ctrl_replay_last_movie

    ; Unset
    LDA #$0000
    STA !ram_ctrl_toggle_oob
    STA !ram_ctrl_skip_text
    STA !ram_ctrl_reset_segment_timer
    STA !ram_ctrl_disable_sprites
    STA !ram_ctrl_fill_everything
    STA !ram_ctrl_fix_vram

    LDA #!SRAM_VERSION : STA !ram_sram_initialized

  %i16()
    LDA #$0000
    LDX #$00FE
  .loop
    STA !sram_movies, X
    DEX #2 : BPL .loop
  %i8()

    RTS
