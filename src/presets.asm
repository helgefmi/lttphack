; Hooks the "load target area" JSL call done after choosing a destination in the Bird menu.
org $0AB90D
    JSL preset_load_overworld


; Hooks the "load entrance" JSL call done in PreDungeon Module.
org $02D6FC
    JSL preset_load_dungeon


; We need a means to JSR into the "load entrance" module right after our variables are set.
; This spot does not have much free space, but enough for this.
org $02FCE0
post_load_dungeon:
  %a16()
    TSC : INC : INC : INC : TCS
  %a8()
    JMP $D836
    RTL


org $278000
preset_load_next_frame:
  %ai8()
    JSR preset_deinit_current_submodule

    LDA !ram_preset_type : CMP #$02 : BEQ .dungeon

    ; Jumps to Bird Menu module
    LDA.b #$0E : STA $10

    ; Make sure we're back into light word after the Messaging module is done.
    LDA.b #$09 : STA $010C

    ; Skip the opening of overworld map and such. We want instaport.
    LDA.b #$06 : STA $0200

    LDA.b #$0A : STA $11

    RTL

  .dungeon
    ; Makes PreDungeon not use a smaller "entrance only" table for data.
    STZ $04AA ; 
    STZ $010A ; death

    ; Don't remember anymore :-) \todo
    LDA $7EF3CC : AND #$FB : STA $7EF3CC

    ; Put us in Spotlight_close Module.
    LDA.b #$0F : STA $10
    STZ $11

    ; Puts us in PreDungeon after Spotlight_close is done.
    LDA.b #$06 : STA $010C

    RTL


preset_deinit_current_submodule:
    ; Enters: AI=8
    ; Leaves: AI=8

    LDA !ram_cm_old_gamemode : CMP.b #$0E : BNE .not_message_module
    LDA !ram_cm_old_submode : CMP.b #$02 : BNE .not_message_module

    JSR preset_deinit_dialog_mode
    
  .not_message_module
    RTS


preset_deinit_dialog_mode:
    ; Enters: AI=8
    ; Leaves: AI=8

  %ai16()
    ; Clears HUD3 VRAM in case there's text present.
    LDA $1CD2 : STA $1CD0

    LDA $1CD0 : XBA : STA $1002
    LDA #$2E42 : STA $1004
    LDA #$387F : STA $1006

    LDA.w #$FFFF : STA $1008

  %ai8()
    LDA.b #$01 : STA $14

    STZ $1CD8

    RTS

; ------------
; Load Preset
; ------------

preset_load_overworld:
  ; Enters: AI=8
    LDA !ram_preset_type : BNE .preset

    ; This means we got here from the actual Bird menu (how boring),
    ; so lets just jump to the original function.
    JML !BirdTravel_LoadTargetAreaData

  .preset
    ; Set link to be in the Overworld
    STZ $1B

    ; So we don't load infinitely
    LDA.b #$00 : STA !ram_preset_type

  %a16()
  PHB : PHK : PLB
    LDA !ram_preset_destination : STA $00

    STZ $04AC

    ; Screen index
    LDA ($00) : INC $00 : INC $00 : STA $8A : STA $040A

    ; Link X/Y
    LDA ($00) : INC $00 : INC $00 : STA $22
    LDA ($00) : INC $00 : INC $00 : STA $20

    ; BG scroll X/Y
    LDA ($00) : INC $00 : INC $00 : STA $E6 : STA $0124
    LDA ($00) : INC $00 : INC $00 : STA $E8 : STA $0122
    LDA ($00) : INC $00 : INC $00 : STA $E0 : STA $0120
    LDA ($00) : INC $00 : INC $00 : STA $E2 : STA $011E

    ; Camera scroll X/Y
    LDA ($00) : INC $00 : INC $00 : STA $061C : DEC #2 : STA $061E
    LDA ($00) : INC $00 : INC $00 : STA $0618 : DEC #2 : STA $061A

    ; Unknown
    LDA ($00) : INC $00 : INC $00 : STA $84 : SEC : SBC #$0400 : AND.w #$0F80 : ASL A : XBA : STA $88
    LDA $84 : SEC : SBC.w #$0010 : AND.w #$003E : LSR A : STA $86

    LDA ($00) : INC $00 : INC $00 : STA $0624
    LDA.w #$0000 : SEC : SBC $0624 : STA $0626

    LDA ($00) : INC $00 : INC $00 : STA $0628
    LDA.w #$0000 : SEC : SBC $0628 : STA $062A
  PLB

  %a8()
    ; LW/DW
    LDA $8A : AND #$40 : STA $7EF3CA
  %a16()

    ; Makes it possible to spawn in the middle of a field/not inside doorway?
    STZ $0696
    
    ; Clears RAM in case it's needed (used for when lifting big rocks?).
    STZ $0698

    JML !BirdTravel_LoadTargetAreaData_AfterData


preset_load_dungeon:
  ; Enters AI=16
  %a16()
  PHB : PHK : PLB
    LDA !ram_preset_destination : STA $00

    ; Room index
    LDA ($00) : INC $00 : INC $00 : STA $A0 : STA $048E

    ; BG1/2 vertical and horizontal scroll
    LDA ($00) : INC $00 : INC $00 : STA $E6 : STA $0124
    LDA ($00) : INC $00 : INC $00 : STA $E8 : STA $0122
    LDA ($00) : INC $00 : INC $00 : STA $E0 : STA $0120
    LDA ($00) : INC $00 : INC $00 : STA $E2 : STA $011E

    ; Link X/Y
    LDA ($00) : INC $00 : INC $00 : STA $22
    LDA ($00) : INC $00 : INC $00 : STA $20

    ; Camera scroll X/Y
    LDA ($00) : INC $00 : INC $00 : STA $061C : INC #2 : STA $061E
    LDA ($00) : INC $00 : INC $00 : STA $0618 : INC #2 : STA $061A
    LDA #$01F8 : STA $EC

    ; Door settings
    LDA ($00) : INC $00 : INC $00 : STA $0696 : STZ $0698

    LDA #$0000 : STA $0610
    LDA #$0110 : STA $0612
    LDA #$0000 : STA $0614
    LDA #$0100 : STA $0616

  %a8()

    ; Set link to be in the Overworld
    LDA.b #$01 : STA $1B

    ; Relative coordinates (scroll edges?)
    LDA ($00) : %a16() : INC $00 : %a8() : STA $0601
    LDA ($00) : %a16() : INC $00 : %a8() : STA $0603
    LDA ($00) : %a16() : INC $00 : %a8() : STA $0605
    LDA ($00) : %a16() : INC $00 : %a8() : STA $0607
    LDA ($00) : %a16() : INC $00 : %a8() : STA $0609
    LDA ($00) : %a16() : INC $00 : %a8() : STA $060B
    LDA ($00) : %a16() : INC $00 : %a8() : STA $060D
    LDA ($00) : %a16() : INC $00 : %a8() : STA $060F

    STZ $0600 : STZ $0602

    LDA.b #$10 : STA $0604 : STA $0606 : STA $0608 : STA $060A : STA $060C : STA $060E

    ; Make it so Link faces south (down) at most entrances.
    ; \todo we removed the special case where Link faces down.
    LDA.b #$02 : STA $2F

    ; Main blockset value (main graphics)
    LDA ($00) : %a16() : INC $00 : %a8() : STA $0AA1

    ; Music track value. Is it the beginning music?
    LDA ($00) : %a16() : INC $00 : %a8() : STA $0132 : CMP.b #$03 : BNE .notBeginningMusic

    ; Check game status
    ; Is it less than first part?
    LDA $7EF3C5 : CMP.b #$02 : BCC .haventSavedZelda

    ; Play the cave music if it's first or second part.
    LDA.b #$12

  .haventSavedZelda

    STA $0132

  .notBeginningMusic

    ; Starting floor
    LDA ($00) : %a16() : INC $00 : %a8() : STA $A4

    ; Load the palace number.
    LDA ($00) : %a16() : INC $00 : %a8() : STA $040C

    ; Doorway orientation
    LDA ($00) : %a16() : INC $00 : %a8() : STA $6C

    ; Starting BG
    ; Set the position that Link starts at.
    LDA ($00) : LSR #4 : STA $EE
    ; Set Pseudo bg level
    LDA ($00) : %a16() : INC $00 : %a8() : AND.b #$0F : STA $0476

    ; .quadrant1
    LDA ($00) : LSR #4 : STA $A6
    LDA ($00) : %a16() : INC $00 : %a8() : AND.b #$0F : STA $A7
    ; .quadrant2
    LDA ($00) : LSR #4 : STA $A9
    LDA ($00) : %a16() : INC $00 : %a8() : AND.b #$0F : STA $AA

  ; Erase the footprint of this hook
  %a16()
  PLB
    TSC : INC : INC : INC : TCS
  %a8()
    ; Go back to the original function, since've set up our variables.
    JML $02D836

incsrc preset_data.asm
