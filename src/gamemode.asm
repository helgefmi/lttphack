; Game Mode Hijack
org $008056
    JSL gamemode_hook


; Game Mode Hook
org $208000
gamemode_hook:
    ; For convenience, so that we can access the full ctrl1 as 16bit.
    LDA $F0 : STA !ram_ctrl1_word
    LDA $F2 : STA !ram_ctrl1_byte2
    LDA $F4 : STA !ram_ctrl1_filtered
    LDA $F6 : STA !ram_ctrl1_filtered_byte2
	
    LDA $F1 : STA !ram_ctrl2_word
    LDA $F3 : STA !ram_ctrl2_byte2

    if !FEATURE_SS
        JSR gamemode_savestate : BCS .exit
    endif

    ; Update Game Time counter
  %a16()
    INC !lowram_room_gametime
  %a8()

    JSR gamemode_custom_menu : BCS .exit
    JSR gamemode_load_previous_preset : BCS .exit
    JSR gamemode_transition_detection

  %ai8()
    JSL $0080B5 ; GameModes
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

    ; Text mode. Don't reset counters.
    CMP #$0E : BEQ .only_show_counters

    ; Overworld -> Dungeon
    CMP #$0F : BEQ .show_and_reset_counters

    ; Fall in hole
    CMP #$11 : BEQ .show_and_reset_counters

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
    LDA !lowram_room_realtime : STA !lowram_room_realtime_copy : STZ !lowram_room_realtime
    LDA !lowram_room_gametime : STA !lowram_room_gametime_copy : STZ !lowram_room_gametime
    LDA #$0000 : STA !ram_rng_counter

    JSL draw_counters
    JMP .td_end

  .only_show_counters
  %a16()
    LDA !lowram_room_realtime : STA !lowram_room_realtime_copy
    LDA !lowram_room_gametime : STA !lowram_room_gametime_copy

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
    LDA !ram_ctrl1_word : AND #$1000 : CMP #$1000 : BNE .no_custom_menu
  %a8()
    LDA $F4 : CMP #$10 : BNE .no_custom_menu
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
    LDA !ram_ctrl1_word : CMP !SHORTCUT_LOAD_LAST_PRESET : BNE .no_load_preset
    AND !ram_ctrl1_filtered : BEQ .no_load_preset

  %a8()
    JSR gamemode_safe_to_change_mode : BCC .no_load_preset

    ; Loading during text mode make the text stay or the item menu to bug
    LDA $10 : CMP #$0E : BEQ .no_load_preset
    LDA !ram_previous_preset_destination : BEQ .no_load_preset

    JSL preset_load_last_preset
    SEC : RTS

  .no_load_preset
    CLC : RTS


; Save state
gamemode_savestate:
  %ai16()
    LDA (!ram_savestate_ctrl_to_use)
    CMP !ram_savestate_load_shortcut : BEQ .do_save_state
    JMP .test_load_state

  .do_save_state
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

  .test_load_state
    CMP !ram_savestate_save_shortcut : BEQ .do_load_state
    JMP after_save_state

  .do_load_state
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
