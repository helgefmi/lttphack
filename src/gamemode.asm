; Game Mode Hijack
org $008056
    JSL gamemode_hook


; Game Mode Hook
org $208000
gamemode_hook:
    ; For convenience, so that we can access the full ctrl1 as 16bit.
    LDA $F0 : STA !ram_ctrl1
    LDA $F2 : STA !ram_ctrl1+1
    LDA $F4 : STA !ram_ctrl1_filtered
    LDA $F6 : STA !ram_ctrl1_filtered+1

    if !FEATURE_SS || !FEATURE_PSS
        JSR gamemode_savestate : BCS .exit
    endif

    ; Update Game Time counter
  %a16()
    INC !lowram_room_gametime
  %a8()

    JSR gamemode_custom_menu : BCS .exit
    JSR gamemode_load_previous_preset : BCS .exit
    JSR gamemode_transition_detection
    JSR gamemode_oob
    JSR gamemode_skip_text
    JSR gamemode_disable_sprites
    JSR gamemode_reset_segment_timer

  %ai8()
    JSL $0080B5 ; GameModes

    LDA !ram_lag_indicator : BEQ .done
    JSR gamemode_lag_indicator

  .done
    RTL

  .exit
  %ai8()
    RTL


; Transition detection
gamemode_transition_detection:
  %a8()
    LDA $10 : CMP !ram_gamemode_copy : BNE .gamemode_changed
    LDA $11 : CMP !ram_submode_copy : BNE .submode_changed
    LDA $02D8 : CMP !ram_received_item_copy : BNE .new_item_received

    RTS

  .new_item_received
    LDA $02D8 : STA !ram_received_item_copy
    JMP .only_show_counters

  .gamemode_changed
    LDA !ram_gamemode_copy

    CMP #$01 : BEQ .show_and_reset_counters
    CMP #$07 : BEQ .gamemode_dungeon
    CMP #$09 : BEQ .gamemode_overworld
    CMP #$0B : BEQ .gamemode_overworld ; "Special" overworld (?)
    CMP #$13 : BEQ .gamemode_victory ; LW?
    CMP #$16 : BEQ .gamemode_victory ; DW?

    JMP .td_end

  .gamemode_victory
    LDA $10

    ; Just killed a boss. Loading overworld.
    CMP #$08 : BEQ .show_and_reset_counters

    JMP .td_end

  .gamemode_dungeon
    LDA $10

    ; Text mode. Don't reset counters.
    CMP #$0E : BEQ .only_show_counters

    ; Dungeon -> Overworld
    CMP #$0F : BEQ .show_and_reset_counters

    ; Caught by Wall Master
    CMP #$11 : BEQ .show_and_reset_counters

    JMP .td_end

  .gamemode_overworld
    LDA $10

    ; OW (special) -> OW
    CMP #$09 : BEQ .show_and_reset_counters

    ; OW -> OW (special)
    CMP #$0B : BEQ .show_and_reset_counters

    ; Overworld -> Dungeon
    CMP #$0F : BEQ .show_and_reset_counters

    ; Fall in hole
    CMP #$11 : BEQ .show_and_reset_counters

    ; Text mode. Don't reset counters.
    CMP #$0E : BNE .td_end

    LDA $11 : CMP #$0A : BEQ .show_and_reset_counters

    BRA .only_show_counters

    JMP .td_end

  .submode_changed
    LDA $10

    ; Dungeon
    CMP #$07 : BEQ .submode_dungeon

    ; Overworld
    CMP #$09 : BEQ .submode_overworld

    JMP .td_end

  .show_and_reset_counters
    ; Reset per-room counters
  %a16()
    JSR gamemode_reset_counters

    JSL draw_counters
    JMP .td_end

  .only_show_counters
  %a16()
    LDA !lowram_room_realtime : STA !lowram_room_realtime_copy
    LDA !lowram_room_gametime : STA !lowram_room_gametime_copy
    LDA !lowram_idle_frames : STA !lowram_idle_frames_copy

    JSL draw_counters
    JMP .td_end

  .submode_overworld
    LDA $11

    ; Normal transition
    CMP #$01 : BEQ .show_and_reset_counters

    ; Transition into Dark Woods
    CMP #$0D : BEQ .show_and_reset_counters

    ; Mirror
    CMP #$23 : BEQ .show_and_reset_counters

    ; Whirlpool
    CMP #$2E : BEQ .show_and_reset_counters

    JMP .td_end

  .submode_dungeon
    LDA $11

    ; Normal transition intra-room
    CMP #$01 : BEQ .show_and_reset_counters

    ; Normal transition inter-room
    CMP #$02 : BEQ .show_and_reset_counters

    ; Transition upwards
    CMP #$06 : BEQ .show_and_reset_counters

    ; Transition upwards
    CMP #$07 : BEQ .show_and_reset_counters

    ; Walking up straight inter-room staircase
    CMP #$12 : BEQ .show_and_reset_counters

    ; Walking down straight inter-room staircase
    CMP #$13 : BEQ .show_and_reset_counters

    ; Transition inter-room staircase
    CMP #$0E : BEQ .show_and_reset_counters

    ; Warping to another room
    CMP #$15 : BEQ .show_and_reset_counters

    ; Magic mirror
    CMP #$19 : BEQ .show_and_reset_counters

    JMP .td_end

  .td_end
  %a8()
    ; Persist new game mode/submode.
    LDA $10 : STA !ram_gamemode_copy
    LDA $11 : STA !ram_submode_copy

    RTS


gamemode_unsafe_modes:
    db #$01 ; 0x00 - Triforce / Zelda startup screens
    db #$01 ; 0x01 - File Select screen
    db #$01 ; 0x02 - Copy Player Mode
    db #$01 ; 0x03 - Erase Player Mode
    db #$01 ; 0x04 - Name Player Mode
    db #$01 ; 0x05 - Loading Game Mode
    db #$00 ; 0x06 - Pre Dungeon Mode
    db #$00 ; 0x07 - Dungeon Mode
    db #$00 ; 0x08 - Pre Overworld Mode
    db #$00 ; 0x09 - Overworld Mode
    db #$00 ; 0x0A - Pre Overworld Mode (special overworld)
    db #$00 ; 0x0B - Overworld Mode (special overworld)
    db #$01 ; 0x0C - Custom Menu
    db #$00 ; 0x0D - Blank Screen
    db #$00 ; 0x0E - Text Mode/Item Screen/Map
    db #$01 ; 0x0F - Closing Spotlight
    db #$01 ; 0x10 - Opening Spotlight
    db #$01 ; 0x11 - Happens when you fall into a hole from the OW.
    db #$01 ; 0x12 - Death Mode
    db #$00 ; 0x13 - Boss Victory Mode (refills stats)
    db #$01 ; 0x14 - Attract Mode
    db #$00 ; 0x15 - Module for Magic Mirror
    db #$00 ; 0x16 - Module for refilling stats after boss.
    db #$01 ; 0x17 - Quitting mode (save and quit)
    db #$00 ; 0x18 - Ganon exits from Agahnim's body. Chase Mode.
    db #$01 ; 0x19 - Triforce Room scene
    db #$01 ; 0x1A - End sequence
    db #$01 ; 0x1B - Screen to select where to start from (House, sanctuary, etc.)

gamemode_safe_to_change_mode:
  %ai8()
    PHB : PHK : PLB
    LDX $10 : LDA gamemode_unsafe_modes, X : BNE .not_safe
    CPX #$07 : BNE .not_dungeon

    LDA $11 : CMP #$06 : BEQ .not_safe ; Upwards floor transition
              CMP #$07 : BEQ .not_safe ; Downward floor transition
              CMP #$0F : BEQ .not_safe ; Enter underworld spotlight effect

  .not_dungeon
    ; Don't allow custom menu during mosaic effects
    LDA $7EC011 : BNE .not_safe

    PLB
    SEC : RTS

  .not_safe
    PLB
    CLC : RTS


; Custom Menu
gamemode_custom_menu:
  %a16()
    LDA !ram_ctrl1 : AND !ram_ctrl_prachack_menu : CMP !ram_ctrl_prachack_menu : BNE .no_custom_menu
    AND !ram_ctrl1_filtered : BEQ .no_custom_menu

  %a8()
    JSR gamemode_safe_to_change_mode : BCC .no_custom_menu

    LDA $10 : STA !ram_cm_old_gamemode
    LDA $11 : STA !ram_cm_old_submode

    LDA.b #$0C : STA $10
    STZ $11

    SEC : RTS

  .no_custom_menu
    CLC : RTS


; Load previous preset
gamemode_load_previous_preset:
  %a16()
    ; Load last preset shortcut check
    LDA !ram_ctrl1 : AND !ram_ctrl_load_last_preset : CMP !ram_ctrl_load_last_preset : BNE .no_load_preset
    AND !ram_ctrl1_filtered : BEQ .no_load_preset

  %a8()
    JSR gamemode_safe_to_change_mode : BCC .no_load_preset

    ; Loading during text mode make the text stay or the item menu to bug
    LDA $10 : CMP #$0E : BEQ .no_load_preset
    LDA !ram_previous_preset_destination : BEQ .no_load_preset

    STZ !lowram_is_poverty_load

    JSL preset_load_last_preset
    SEC : RTS

  .no_load_preset
    CLC : RTS


; Save state
gamemode_savestate:
    LDA $10 : CMP #$0C : BNE .not_setting_new_inputs
    LDA $B0 : BEQ .not_setting_new_inputs
    CLC : RTS

  .not_setting_new_inputs
  %ai16()
    LDA !ram_ctrl1 : AND !ram_ctrl_save_state : CMP !ram_ctrl_save_state : BNE .test_load_state
    AND !ram_ctrl1_filtered : BEQ .test_load_state

if !FEATURE_PSS
    ; make sure we're not on a screen transition or falling down
    LDA $0126 : AND #$00FF : ORA $0410 : BNE .test_load_state
    LDA $5B : AND #$00FF : CMP #$0002 : BCS .test_load_state

  %a8()
    JSL save_preset_data
  %ai8()
    SEC : RTS

else

  %a8()
    ; store DMA to SRAM
    LDY #$0000 : LDX #$0000
-   LDA $4300, X : STA $770000, X
    INX
    INY : CPY #$000B : BNE -
    CPX #$007B : BEQ +
    INX : INX : INX : INX : INX
    LDY #$0000
    JMP -
    ; end of DMA to SRAM

  + JSR ppuoff
    LDA #$80 : STA $4310
    JSR func_dma2

    LDA #$81 : STA $4310
    LDA #$39 : STA $4311
    JMP end
endif

  .test_load_state
    LDA !ram_ctrl1 : AND !ram_ctrl_load_state : CMP !ram_ctrl_load_state : BNE .no_bueno
    AND !ram_ctrl1_filtered : BEQ .no_bueno
    BRA .do_load_state

  .no_bueno
    JMP after_save_state

  .do_load_state
  
if !FEATURE_PSS
  %a8()
    JSR gamemode_safe_to_change_mode : BCC .no_load

    ; Loading during text mode makes the text stay or the item menu to bug
    LDA $10 : CMP #$0E : BEQ .no_load
    
    LDA !ram_can_load_pss : BEQ .no_load
    
  %a16()
    LDA #!sram_pss_offset+1 : STA !ram_preset_destination
  %a8()
    LDA !sram_pss_offset : STA !ram_preset_type
    LDA.b #12 : STA $10
    LDA.b #05 : STA $11
    LDA #$01 : STA !lowram_is_poverty_load

  %ai8()
    SEC : RTS
    
  .no_load:
  %ai8()
    CLC : RTS

else

  %a8()
    STZ $420C
    JSR ppuoff
    STZ $4310
    JSR func_dma2

    LDX $1C : STX $212C
    LDX $1E : STX $212E
    LDX $94 : STX $2105
    LDX $96 : STX $2123
    LDX $99 : STX $2130

    INC $15
    LDA $0133 : STA $012C
    STZ $0133
    LDA $0638 : STA $211F
    LDA $0639 : STA $211F
    LDA $063A : STA $2120
    LDA $063B : STA $2120
    LDA $98 : STA $2125
    LDA $9B : STA $420C

    LDA #$01 : STA $4310
    LDA #$18 : STA $4311

+ %a8()
    JMP end
endif

  ppuoff:
    LDA #$80 : STA $13 : STA $2100
    STZ $4200
    RTS

  func_dma1:
    LDX #$7500 : LDY #$0000 : LDA #$80 : JSR func_dma1b
    LDX #$7600 : LDY #$4000 : LDA #$80 : JSR func_dma1b
    RTS

  func_dma1b:
    STY $2116 : STZ $4312 : STX $4313 : STZ $4315 : STA $4316 : STZ $2115

    LDA $4311 : CMP #$39 : BNE +
    LDA $2139

  + LDA #$02 : STA $420B
    RTS

  func_dma2:
    PLX : STX $4318

    STZ $2181 : STZ $4312

    LDY #$0071 : LDX #$0000 : JSR func_dma2b
    INY : LDX #$0080 : JSR func_dma2b
    INY : LDX #$0100 : JSR func_dma2b
    INY : LDX #$0180 : JSR func_dma2b

    LDX $4318 : PHX

    RTS

  func_dma2b:
    STZ $4313 : STY $4314 : STX $2182
    LDA #$80 : STA $4311 : STA $4316
    LDA #$02 : STA $420B
    RTS

  end:
    JSR func_dma1

    ; load DMA from SRAM
    LDY #$0000 : LDX #$0000
  %a8()
  - LDA $770000, X : STA $4300, X
    INX
    INY : CPY #$000B : BNE -
    CPX #$007B : BEQ +
    INX : INX : INX : INX : INX
    LDY #$0000
    JMP -
    ; end of DMA from SRAM

  + LDA #$A1 : STA $4200
    LDA #$0F : STA $13 : STA $2100
  %ai8()
    LDA #$01 : STA !lowram_last_frame_did_saveload
    SEC : RTS

  after_save_state:
  %ai8()
    CLC : RTS


gamemode_oob:
  %a16()
    LDA !ram_ctrl1 : AND !ram_ctrl_toggle_oob : CMP !ram_ctrl_toggle_oob : BNE .dont_toggle
    AND !ram_ctrl1_filtered : BEQ .dont_toggle

  %a8()
    LDA !ram_oob_toggle : EOR #$01 : STA !ram_oob_toggle

  .dont_toggle:
  %a8()
    LDA !ram_oob_toggle : STA !lowram_oob_toggle
    RTS


gamemode_skip_text:
  %a16()
    LDA !ram_ctrl1 : AND !ram_ctrl_skip_text : CMP !ram_ctrl_skip_text : BNE .done
    AND !ram_ctrl1_filtered : BEQ .done

  %a8()
    LDA #$04 : STA $1CD4

  .done
    %a8()
    RTS


gamemode_disable_sprites:
  %a16()
    LDA !ram_ctrl1 : AND !ram_ctrl_disable_sprites : CMP !ram_ctrl_disable_sprites : BNE .done
    AND !ram_ctrl1_filtered : BEQ .done

  %a8()
    JSL !Sprite_DisableAll

  .done
    %a8()
    RTS


gamemode_reset_segment_timer:
  %a16()
    LDA !ram_ctrl1 : AND !ram_ctrl_reset_segment_timer : CMP !ram_ctrl_reset_segment_timer : BNE .done
    AND !ram_ctrl1_filtered : BEQ .done

    STZ !lowram_seg_frames
    STZ !lowram_seg_seconds
    STZ !lowram_seg_minutes

  .done
    %a8()
    RTS


gamemode_reset_counters:
    LDA !lowram_room_realtime : STA !lowram_room_realtime_copy : STZ !lowram_room_realtime
    LDA !lowram_room_gametime : STA !lowram_room_gametime_copy : STZ !lowram_room_gametime
    LDA !lowram_idle_frames : STA !lowram_idle_frames_copy : STZ !lowram_idle_frames
    LDA #$0000 : STA !ram_rng_counter
    RTS


print pc
gamemode_lag_indicator:
  %ai16()
    LDA !lowram_nmi_counter : CMP #$0002 : BCS .lag_frame
    LDA #$3C00 : STA !lowram_draw_tmp

    LDA $2137 : LDA $213D : AND #$00FF : CMP #$007F : BCS .warning
    BRA .draw

  .warning
    PHA : LDA #$2800 : STA !lowram_draw_tmp : PLA
    BRA .draw

  .lag_frame
    LDA #$3400 : STA !lowram_draw_tmp
    LDA #$00FF

  .draw
    STZ !lowram_nmi_counter

    AND #$00FF : LSR : CLC : ADC #$0007 : AND #$FFF8 : TAX

    LDA.l .mp_tilemap+0, X : ORA !lowram_draw_tmp : STA $7EC742
    LDA.l .mp_tilemap+2, X : ORA !lowram_draw_tmp : STA $7EC782
    LDA.l .mp_tilemap+4, X : ORA !lowram_draw_tmp : STA $7EC7C2
    LDA.l .mp_tilemap+6, X : ORA !lowram_draw_tmp : STA $7EC802

  %ai8()
    RTS

  .mp_tilemap
    dw $00F5, $00F5, $00F5, $00F5
    dw $00F5, $00F5, $00F5, $005F
    dw $00F5, $00F5, $00F5, $004C
    dw $00F5, $00F5, $00F5, $004D
    dw $00F5, $00F5, $00F5, $004E
    dw $00F5, $00F5, $005F, $005E
    dw $00F5, $00F5, $004C, $005E
    dw $00F5, $00F5, $004D, $005E
    dw $00F5, $00F5, $004E, $005E
    dw $00F5, $005F, $005E, $005E
    dw $00F5, $004C, $005E, $005E
    dw $00F5, $004D, $005E, $005E
    dw $00F5, $004E, $005E, $005E
    dw $005F, $005E, $005E, $005E
    dw $004C, $005E, $005E, $005E
    dw $004D, $005E, $005E, $005E
    dw $004E, $005E, $005E, $005E
