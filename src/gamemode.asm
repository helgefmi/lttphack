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
        incsrc gamemode_savestate.asm
    endif

    ; Update Game Time counter
  %a16()
    INC !lowram_room_gametime

    ; Custom Menu
    LDA !ram_ctrl1_word : AND #$1000 : CMP #$1000 : BNE .no_custom_menu
  %a8()
    LDA $F4 : CMP #$10 : BNE .no_custom_menu

    LDA $10 : CMP.b #$06 : BCC .no_custom_menu ; Startup/File select etc
              CMP.b #$0C : BEQ .no_custom_menu ; Custom Menu
              CMP.b #$0F : BEQ .no_custom_menu ; Closing Spotlight
              CMP.b #$10 : BEQ .no_custom_menu ; Opening Spotlight
              CMP.b #$11 : BEQ .no_custom_menu ; Fall into dungeon via hole
              CMP.b #$12 : BEQ .no_custom_menu ; Death Mode
              CMP.b #$17 : BEQ .no_custom_menu ; Quitting mode (s&q)
              CMP.b #$1B : BEQ .no_custom_menu ; Entrance select
              CMP.b #$14 : BEQ .no_custom_menu ; Attract Mode
              CMP.b #$19 : BEQ .no_custom_menu ; Triforce Room scene
              CMP.b #$1A : BEQ .no_custom_menu ; End sequence

    ; We still allow the following, untill it's proven to be a hassle:
    ; 0x06 - Pre Dungeon Mode
    ; 0x07 - Dungeon Mode
    ; 0x08 - Pre Overworld Mode
    ; 0x09 - Overworld Mode
    ; 0x0A - Pre Overworld Mode (special overworld)
    ; 0x0B - Overworld Mode (special overworld)
    ; 0x0E - Text Mode/Item Screen/Map
    ; 0x13 - Boss Victory Mode (refills stats)
    ; 0x15 - Module for Magic Mirror
    ; 0x16 - Module for refilling stats after boss.
    ; 0x18 - Ganon exits from Agahnim's body. Chase Mode.

    LDA $10 : CMP #$07 : BNE .not_dungeon
    LDA $11 : CMP #$06 : BEQ .no_custom_menu ; Upwards floor transition
              CMP #$07 : BEQ .no_custom_menu ; Downward floor transition
              CMP #$0F : BEQ .no_custom_menu ; Downward floor transition

  .not_dungeon
    ; Don't allow custom menu during mosaic effects
    LDA $7EC011 : BNE .no_custom_menu

  %a8()
    LDA $10 : STA !ram_cm_old_gamemode
    LDA $11 : STA !ram_cm_old_submode

    LDA.b #$0C : STA $10
    STZ $11

    RTL

  .no_custom_menu
    %a8()
    ; Loading during text mode make the text stay or the item menu to bug
    LDA $10 : CMP #$0E : BEQ .no_load_preset
  %a16()
    LDA !ram_previous_preset_destination : BEQ .no_load_preset

    ; Load last preset shortcut check
    LDA !ram_ctrl1_word : CMP !SHORTCUT_LOAD_LAST_PRESET : BNE .no_load_preset
    AND !ram_ctrl1_filtered : BEQ .no_load_preset

    JSL preset_load_last_preset
    RTL

  .no_load_preset
  %a8()
    incsrc gamemode_transition_detection.asm

  .end_of_gamemode_hook
  %ai8()
    JSL $0080B5 ; GameModes
    RTL
