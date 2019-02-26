; Game Mode Hijack
org $008056
    JSL gamemode_hook


; Game Mode Hook
org !ORG
gamemode_hook:
    ; For convenience, so that we can access the full ctrl1 as 16bit.
    LDA $F0 : STA !ram_ctrl1
    LDA $F2 : STA !ram_ctrl1+1
    LDA $F4 : STA !ram_ctrl1_filtered
    LDA $F6 : STA !ram_ctrl1_filtered+1

  PHB : PHK : PLB
    JSR gamemode_savestate : BCS .skip_gamemode

    ; Update Game Time counter
  %a16()
    INC !lowram_room_gametime
  %a8()

    JSR gamemode_custom_menu : BCS .skip_gamemode
    JSR gamemode_load_previous_preset : BCS .skip_gamemode
    JSR gamemode_transition_detection
    JSR gamemode_oob
    JSR gamemode_skip_text
    JSR gamemode_disable_sprites
    JSR gamemode_fill_everything
    JSR gamemode_reset_segment_timer

  %ai8()
  PLB
    JSL $0080B5 ; GameModes

    LDA !ram_lagometer_toggle : BEQ .done
    JSR gamemode_lagometer

  .done
    RTL

  .skip_gamemode
  %ai8()
  PLB
    RTL


; Transition detection

gamemode_transition_detection:
  %ai8()
    LDA $10 : CMP !ram_gamemode_copy : BNE .gamemode_changed
    LDA $11 : CMP !ram_submode_copy : BNE .submode_changed
    LDA $02D8 : CMP !ram_received_item_copy : BNE .new_item_received

    RTS

  .new_item_received
    LDA $02D8 : STA !ram_received_item_copy
    JSR .show_counters
    BRA .done

  .gamemode_changed
    LDX #$FA

  - INX #6
    LDA .gamemode_table, X
    CMP #$FF : BEQ .done
    CMP !ram_gamemode_copy : BNE -
    LDA $10 : AND .gamemode_table+1, X : CMP .gamemode_table+2, X : BNE -
    LDA $11 : AND .gamemode_table+3, X : CMP .gamemode_table+4, X : BNE -

    LDA .gamemode_table+5, X
    BRA .transition_detected

  .submode_changed
    LDX #$FD

  - INX #3
    LDA .submode_table, X
    CMP #$FF : BEQ .done
    CMP !ram_gamemode_copy : BNE -
    LDA .submode_table+1, X : CMP $11 : BNE -

    LDA .gamemode_table+2, X

  .transition_detected
    CMP #!TD_RESET : BEQ .reset
    JSR .show_counters
    BRA .done

  .reset
    JSR .reset_counters

  .done
    ; Persist new game mode/submode.
    LDA $10 : STA !ram_gamemode_copy
    LDA $11 : STA !ram_submode_copy
    RTS

  .gamemode_table:
    ; Format:
    ; 1. Previous $10
    ; 2. AND operand for $10
    ; 3. CMP operand for $10
    ; 4-5. Same but for $11
    ; 6. Action to take

    ; Game start
    db $01, $00, $00, $00, $00 : db #!TD_RESET
    ; Dungeon -> Text mode
    db $07, $FF, $0E, $00, $00 : db #!TD_SHOW
    ; Dungeon -> Overworld
    db $07, $FF, $0F, $00, $00 : db #!TD_RESET
    ; Dungeon -> Wall Master (Fall into Hole too?)
    db $07, $FF, $11, $00, $00 : db #!TD_RESET
    ; Dungeon -> Magic Mirror
    db $07, $FF, $15, $00, $00 : db #!TD_RESET
    ; Overworld (normal) -> Overworld (special)
    db $09, $FF, $0B, $00, $00 : db #!TD_RESET
    ; Overworld (special) -> Overworld (normal)
    db $0B, $FF, $09, $00, $00 : db #!TD_RESET
    ; Overworld -> Dungeon
    db $09, $FF, $0F, $00, $00 : db #!TD_RESET
    db $0B, $FF, $0F, $00, $00 : db #!TD_RESET
    ; Overworld -> Fall in Hole
    db $09, $FF, $11, $00, $00 : db #!TD_RESET
    db $0B, $FF, $11, $00, $00 : db #!TD_RESET
    ; Overworld -> Text mode
    db $09, $FF, $0E, $FF, $0A : db #!TD_RESET
    db $0B, $FF, $0E, $FF, $0A : db #!TD_RESET
    ; Overworld -> Flute menu
    db $09, $FF, $0E, $00, $00 : db #!TD_SHOW
    db $0B, $FF, $0E, $00, $00 : db #!TD_SHOW
    ; Victory screen (LW?) -> Overworld
    db $13, $FF, $08, $00, $00 : db #!TD_RESET
    ; Victory screen (DW?) -> Overworld
    db $16, $FF, $08, $00, $00 : db #!TD_RESET

    db $FF


  .submode_table:
    ; Format:
    ; 1. Current $10
    ; 2. CMP operand for $11
    ; 3. Action to take
    ; Dungeon: Subtile transition
    db $07, $01, #!TD_RESET
    ; Dungeon: Supertile transition
    db $07, $02, #!TD_RESET
    ; Dungeon: Upwards transition
    db $07, $06, #!TD_RESET
    ; Dungeon: Downwards transition
    db $07, $07, #!TD_RESET
    ; Dungeon: Subtile staircase (up)
    db $07, $12, #!TD_RESET
    ; Dungeon: Subtile staircase (down)
    db $07, $13, #!TD_RESET
    ; Dungeon: Spiral staircase
    db $07, $0E, #!TD_RESET
    ; Dungeon: Warping to another room
    db $07, $15, #!TD_RESET
    ; Dungeon: Magic Mirror
    db $07, $19, #!TD_RESET
    ; Overworld: Normal transition
    db $09, $01, #!TD_RESET
    ; Overworld: Transition into Dark Woods
    db $09, $0D, #!TD_RESET
    ; Overworld: Magic Mirror
    db $09, $23, #!TD_RESET
    ; Overworld: Whirlpool
    db $09, $2E, #!TD_RESET

    db $FF

  .show_counters
  %a16()
    LDA !lowram_room_realtime : STA !lowram_room_realtime_copy
    LDA !lowram_room_gametime : STA !lowram_room_gametime_copy
    LDA !lowram_idle_frames : STA !lowram_idle_frames_copy
    JSL draw_counters
  %a8()

    RTS

  .reset_counters
  %a16()
    LDA !lowram_room_realtime : STA !lowram_room_realtime_copy : STZ !lowram_room_realtime
    LDA !lowram_room_gametime : STA !lowram_room_gametime_copy : STZ !lowram_room_gametime
    LDA !lowram_idle_frames : STA !lowram_idle_frames_copy : STZ !lowram_idle_frames
    LDA #$0000 : STA !ram_rng_counter
    JSL draw_counters
  %a8()

    RTS


gamemode_safe_to_change_mode:
  %ai8()
    PHB : PHK : PLB
    LDX $10 : LDA .unsafe_modes, X : BNE .not_safe
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

  .unsafe_modes
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


; Custom Menu
gamemode_custom_menu:
  %a16()
    LDA !ram_ctrl1 : AND !ram_ctrl_prachack_menu : CMP !ram_ctrl_prachack_menu : BNE .no_custom_menu
    AND !ram_ctrl1_filtered : BEQ .no_custom_menu

  %a8()
    JSR gamemode_safe_to_change_mode : BCC .no_custom_menu

    LDA $10 : STA !ram_cm_old_gamemode
    LDA $11 : STA !ram_cm_old_submode

    LDA #$0C : STA $10
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

if !FEATURE_SD2SNES

  %a8()
    ; store DMA to SRAM
    LDY #$0000 : LDX #$0000
-   LDA $4300, X : STA !ram_ss_dma_buffer, X
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

else

    ; make sure we're not on a screen transition or falling down
    LDA $0126 : AND #$00FF : ORA $0410 : BNE .test_load_state
    LDA $5B : AND #$00FF : CMP #$0002 : BCS .test_load_state

  %a8()
    JSL save_preset_data
  %ai8()
    SEC : RTS

endif

  .test_load_state
    LDA !ram_ctrl1 : AND !ram_ctrl_load_state : CMP !ram_ctrl_load_state : BNE .no_bueno
    AND !ram_ctrl1_filtered : BEQ .no_bueno
    BRA .do_load_state

  .no_bueno
    JMP after_save_state

  .do_load_state

    LDA !ram_rerandomize_toggle : BEQ .dont_rerandomize_1

    ; Save the current framecounter & rng accumulator
    LDA $1A : STA !ram_rerandomize_framecount
    LDA $0FA1 : STA !ram_rerandomize_accumulator

  .dont_rerandomize_1

if !FEATURE_SD2SNES

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

    LDA !ram_rerandomize_toggle : BEQ .dont_rerandomize_2

    LDA !ram_rerandomize_framecount : STA $1A
    LDA !ram_rerandomize_accumulator : STA $0FA1

    .dont_rerandomize_2

+ %a8()
    JMP end

else

  %a8()
    JSR gamemode_safe_to_change_mode : BCC .no_load

    ; Loading during text mode makes the text stay or the item menu to bug
    LDA $10 : CMP #$0E : BEQ .no_load

    LDA !ram_can_load_pss : BEQ .no_load

  %a16()
    LDA #!sram_pss_offset+1 : STA !ram_preset_destination
  %a8()
    LDA !sram_pss_offset : STA !ram_preset_type
    LDA #12 : STA $10
    LDA #05 : STA $11
    LDA #$01 : STA !lowram_is_poverty_load

  %ai8()
    SEC : RTS

  .no_load:
  %ai8()
    CLC : RTS

endif

  ppuoff:
    LDA #$80 : STA $2100
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
  - LDA !ram_ss_dma_buffer, X : STA $4300, X
    INX
    INY : CPY #$000B : BNE -
    CPX #$007B : BEQ +
    INX : INX : INX : INX : INX
    LDY #$0000
    JMP -
    ; end of DMA from SRAM

  + LDA #$A1 : STA $4200
    LDA $13 : STA $2100
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


gamemode_fill_everything:
  %a16()
    LDA !ram_ctrl1 : AND !ram_ctrl_fill_everything : CMP !ram_ctrl_fill_everything : BNE .done
    AND !ram_ctrl1_filtered : BEQ .done

    JMP .fill_inventory

  .done
    %a8()
    RTS

  .fill_inventory
  %a8()
    LDA #$01
    STA !ram_item_book
    STA !ram_item_hook
    STA !ram_item_fire_rod
    STA !ram_item_ice_rod
    STA !ram_item_bombos
    STA !ram_item_ether
    STA !ram_item_2quake
    STA !ram_item_lantern
    STA !ram_item_hammer
    STA !ram_item_net
    STA !ram_item_somaria
    STA !ram_item_byrna
    STA !ram_item_cape
    STA !ram_equipment_boots_menu
    STA !ram_equipment_flippers_menu
    STA !ram_equipment_moon_pearl
    STA !ram_equipment_half_magic

    LDA #$02
    STA !ram_item_boom
    STA !ram_item_mirror
    STA !ram_item_powder
    STA !ram_equipment_gloves
    STA !ram_equipment_shield
    STA !ram_equipment_armor

    LDA #$03
    STA !ram_item_bow
    STA !ram_item_bottle_array+0
    STA !ram_item_flute

    LDA #$04
    STA !ram_item_bottle_array+1
    STA !ram_equipment_sword

    LDA #$05
    STA !ram_item_bottle_array+2

    LDA #$06 : STA !ram_item_bottle_array+3

    LDA #$09 : STA !ram_equipment_keys
    LDA #20<<3 : STA !ram_equipment_maxhp
    LDA #19<<3 : STA !ram_equipment_curhp

    ; rupees
    %a16() : LDA #$03E7 : STA $7EF360 : STA $7EF362 : %a8()

    LDA #$78
    STA !ram_equipment_magic_meter

    LDA #30
    STA !ram_item_bombs
    STA !ram_equipment_arrows_filler

    LDA #$FF
    STA !ram_capabilities

    JSL !DecompSwordGfx
    JSL !Palette_Sword
    JSL !DecompShieldGfx
    JSL !Palette_Shield
    JSL !Palette_Armor

    LDA !ram_game_progress : BNE .exit
    LDA #$01 : STA !ram_game_progress

  .exit
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


gamemode_lagometer:
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
