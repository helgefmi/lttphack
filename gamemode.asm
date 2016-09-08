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

    ; Acmlm's Save State {{{

    %ai16()
    LDA !ram_ctrl1_word : CMP #$1060 : BEQ +
    JMP b

+   %a8()
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

  b:
    CMP #$2060 : BEQ +
    JMP after_save_state

  + %a8()
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
-   LDA $770000, X : STA $4300, X
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
    RTL

    ; }}}

  after_save_state:

  .update_gt_counter
    %a16()
    INC !lowram_room_gametime

  .input_inc_sword
    %a8()
    LDA $F5 : CMP.b #$02 : BNE .input_inc_armor

    LDA $7EF359 : INC A : CMP.b #$05 : BNE +

    LDA.b #$01

  + STA $7EF359

  .input_inc_armor
    LDA $F5 : CMP.b #$01 : BNE .input_inc_shield

    LDA $7EF35B : INC A : CMP.b #$03 : BNE +

    LDA.b #$00

  + STA $7EF35B

  .input_inc_shield
    LDA $F5 : CMP.b #$08 : BNE .input_restore

    LDA $7EF35A : INC A : CMP.b #$04 : BNE +

    LDA.b #$01

  + STA $7EF35A

  .input_restore
    LDA $F5 : CMP.b #$10 : BNE .input_toggle_xy

    ; 1/2 magic
    LDA.b #$01 : STA $7EF37B

    ; refill hearts, magic, bombs, and arrows
    LDA.b #$FF : STA $7EF372 : STA $7EF373 : STA $7EF375 : STA $7EF376

    ; 999 rupees
    LDA.b #$E7 : STA $7EF360
    LDA.b #$03 : STA $7EF361

    ; give the player 9 keys
    LDA.b #9 : STA $7EF36F

  .input_toggle_xy
    LDA $F7 : CMP.b #$40 : BNE .input_toggle_always_lit

    LDA !ram_xy_toggle : EOR.b #$1 : STA !ram_xy_toggle

  .input_toggle_always_lit
    LDA $F5 : CMP.b #$04 : BNE .custom_menu

    LDA !ram_lit_rooms_toggle : EOR.b #$1 : STA !ram_lit_rooms_toggle

  .custom_menu
    LDA $10 : CMP.b #$0C : BEQ transition_detection

    %a16()
    LDA !ram_ctrl1_word : AND #$1000 : CMP #$1000 : BNE transition_detection
    %a8()
    LDA $F4 : CMP #$10 : BNE transition_detection

    %ai8()
    LDA $10 : STA !ram_cm_old_gamemode
    LDA $11 : STA !ram_cm_old_submode
    LDA.b #$00 : STA $11
    LDA #$0C : STA $10
    LDA #$00 : STA $11
    RTL

  transition_detection:
    ; Transition detection {{{

    %ai8()
    LDA $10 : CMP !ram_gamemode_copy : BNE .gamemode_changed
    LDA $11 : CMP !ram_submode_copy : BNE .submode_changed
    LDA $02D8 : CMP !ram_received_item_copy : BNE .new_item_received

    JMP end_of_gamemode_hook

  .new_item_received
    LDA $02D8 : STA !ram_received_item_copy

    JMP .only_show_counters

  .gamemode_changed
    LDA !ram_gamemode_copy

    CMP #$05 : BEQ .gamemode_load_game
    CMP #$07 : BEQ .gamemode_dungeon
    CMP #$09 : BEQ .gamemode_overworld
    CMP #$0B : BEQ .gamemode_overworld ; "Special" overworld (?)
    CMP #$13 : BEQ .gamemode_victory ; LW?
    CMP #$16 : BEQ .gamemode_victory ; DW?

    JMP .end

  .gamemode_victory
    LDA $10

    ; Just killed a boss. Loading overworld.
    CMP #$08 : BEQ .show_and_reset_counters

    JMP .end

  .gamemode_load_game
    LDA $10

    ; Link in bed
    CMP #$07 : BEQ .show_and_reset_counters

    JMP .end

  .gamemode_dungeon
    LDA $10

    ; Text mode. Don't reset counters.
    CMP #$0E : BEQ .only_show_counters

    ; Dungeon -> Overworld
    CMP #$0F : BEQ .show_and_reset_counters

    ; Caught by Wall Master
    CMP #$11 : BEQ .show_and_reset_counters

    JMP .end

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

    JMP .end

  .submode_changed
    LDA $10

    ; Dungeon
    CMP #$07 : BEQ .submode_dungeon

    ; Overworld
    CMP #$09 : BEQ .submode_overworld

    JMP .end

  .show_and_reset_counters
    ; Reset per-room counters
    %a16()
    LDA !lowram_room_realtime : STA !lowram_room_realtime_copy : STZ !lowram_room_realtime
    LDA !lowram_room_gametime : STA !lowram_room_gametime_copy : STZ !lowram_room_gametime

    JSL draw_counters
    JMP .end

  .only_show_counters
    %a16()
    LDA !lowram_room_realtime : STA !lowram_room_realtime_copy
    LDA !lowram_room_gametime : STA !lowram_room_gametime_copy

    JSL draw_counters
    JMP .end

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

    JMP .end

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

    JMP .end

  .end
    %a8()
    ; Persist new game mode/submode.
    LDA $10 : STA !ram_gamemode_copy
    LDA $11 : STA !ram_submode_copy

    ; }}}

  end_of_gamemode_hook:
    %ai8()
    JSL $0080B5 ; GameModes
    RTL
