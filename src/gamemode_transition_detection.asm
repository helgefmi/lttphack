  %ai8()
    LDA $10 : CMP !ram_gamemode_copy : BNE .gamemode_changed
    LDA $11 : CMP !ram_submode_copy : BNE .submode_changed
    LDA $02D8 : CMP !ram_received_item_copy : BNE .new_item_received

    JMP .end_of_gamemode_hook

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

    JMP .td_end

  .td_end
  %a8()
    ; Persist new game mode/submode.
    LDA $10 : STA !ram_gamemode_copy
    LDA $11 : STA !ram_submode_copy
