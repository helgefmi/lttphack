; Replaces `JSL BirdTravel_LoadTargetAreaData` from BirdTravel_LoadTargetArea.
org $0AB90D
    JSL preset_load_overworld

org $0AB9A6
    JSL preset_duck_dropoff_hook

; Replaces `JSL Sprite_ResetAll` from BirdTravel_LoadTargetAreaData.
org $02EA33
    JSL preset_sprite_reset_all


; Replaces `JSL Sprite_ResetAll` from Module_PreOverworld:.
org $028252
    JSL preset_sprite_reset_all


; Replaces `JSL Dungeon_LoadEntrance` from Module_PreDungeon.
org $028154
    JSR load_entrance_local


org $02C240
load_entrance_local:
    ; Enters AI=8
    ; This is called without using presets too, so need to redirect to the correct code.
    LDA !ram_preset_type : BNE .custom

    JSR !Dungeon_LoadEntrance
  %ai8()
    RTS

  .custom
    LDA.b #$00 : STA !ram_preset_type
    JSR !Dungeon_LoadEntrance
    JSL preset_load_dungeon
  %ai8()
    RTS
warnpc $02C270


org $278000
preset_load_next_frame:
  %ai8()
    JSR preset_deinit_current_state
  %ai16()
    JSR preset_clear_tilemap
  %ai8()

    LDA #$F1 : STA $012C
    LDA #$05 : STA $012D

    LDA !ram_preset_type : CMP #$02 : BEQ .dungeon

    ; Jumps to Bird Menu module
    LDA.b #$0E : STA $10
    LDA.b #$0A : STA $11

    ; Make sure we're back into light word after the Messaging module is done.
    LDA.b #$09 : STA $010C

    ; Skip the opening of overworld map and such. We want instaport.
    LDA.b #$06 : STA $0200

    RTL

  .dungeon
    ; Makes PreDungeon not use a smaller "entrance only" table for data.
    STZ $04AA
    ; We didn't die
    STZ $010A

    ; Put us in Spotlight_close Module.
    LDA.b #$0F : STA $10
    STZ $11

    ; Puts us in PreDungeon after Spotlight_close is done.
    LDA.b #$06 : STA $010C

    RTL


preset_deinit_current_state:
    ; Enters: AI=8
    ; Leaves: AI=8

    ; This is mainly needed to stop interactions with nearby sprites (e.g. talking to Kiki)
    JSL !Sprite_ResetAll

    ; Clears the warp vortex.
    STZ $1ABF
    STZ $1ACF
    STZ $1ADF
    STZ $1AEF

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

    LDA ($00) : STA !ram_preset_end_of_sram_state
  PLB

  %a8()
    ; LW/DW
    LDA $8A : AND #$40 : STA $7EF3CA

    ; Reset which BG to interact with (can be set to 1 during falling animations and more)
    STZ $EE

    JSR preset_reset_state_after_loading
    JSR preset_reset_counters
  %a16()

  %i16()
    JSR preset_load_state
  %i8()

    ; Makes it possible to spawn in the middle of a field/not inside doorway?
    STZ $0696
    
    ; Clears RAM in case it's needed (used for when lifting big rocks?).
    STZ $0698

    JML !BirdTravel_LoadTargetAreaData_AfterData


preset_load_dungeon:
  ; Can leave with anything.
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

    ; Relative coordinates (scroll edges?)
    LDA ($00) : INC $00 : INC $00 : STA $0600
    LDA ($00) : INC $00 : INC $00 : STA $0602
    LDA ($00) : INC $00 : INC $00 : STA $0604
    LDA ($00) : INC $00 : INC $00 : STA $0606
    LDA ($00) : INC $00 : INC $00 : STA $0608
    LDA ($00) : INC $00 : INC $00 : STA $060A
    LDA ($00) : INC $00 : INC $00 : STA $060C
    LDA ($00) : INC $00 : INC $00 : STA $060E

    LDA #$0000 : STA $0610
    LDA #$0110 : STA $0612
    LDA #$0000 : STA $0614
    LDA #$0100 : STA $0616

    ; Quadrant stuff
    LDA ($00) : INC $00 : INC $00 : STA $A6
    LDA ($00) : INC $00 : INC $00 : STA $A9

  %a8()

    ; Set link to be in the Overworld
    LDA.b #$01 : STA $1B

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
    ; NOTE that original code had a LSR #4 here that I removed, since I serialize this differently.
    LDA ($00) : STA $EE

    ; Set Pseudo bg level
    LDA ($00) : %a16() : INC $00 : %a8() : AND.b #$0F : STA $0476

    JSR preset_reset_state_after_loading
    JSR preset_reset_counters

  %ai16()
    LDA ($00) : STA !ram_preset_end_of_sram_state
    JSR preset_load_state
  %ai8()

  PLB
    RTL


preset_sprite_reset_all:
    ; Enters AI=8
    ; Call the original routine
    JSL !Sprite_ResetAll

    ; Check if we want to load our own state.
  %ai16()
    LDA !ram_preset_end_of_sram_state : BEQ .end
    JSR preset_load_state
    LDA.w #$0000 : STA !ram_preset_end_of_sram_state
  .end
  %ai8()
    RTL


preset_load_state:
    ; Enters AI=16

    JSR preset_clear_sram

  PHB : PHK : PLB
    LDA !ram_preset_end_of_sram_state : STA $06
    LDA #sram_esc_bed : STA $00

  .next_item
    ; Sets up $02-$04 with the long address we want to manipulate.
    LDA $00 : CMP $06 : BEQ .done_with_state
    LDA ($00) : INC $00 : INC $00 : STA $02
    LDA ($00) : INC $00 : INC $00 : STA $04

    ; High byte of A = How many bytes to copy over.
    XBA : AND.w #$00FF : CMP #$0001 : BEQ .one_byte

    LDA ($00) : INC $00 : INC $00 : STA [$02]
    BRA .next_item

  .one_byte
  %a8()
    LDA ($00) : STA [$02]
  %a16()
    INC $00
    BRA .next_item

  .done_with_state
    PLB

  %ai16()
    JSL !Sprite_LoadGfxProperties

  %ai8()
    ; Reload graphics and palette for sword, shield and armor
    JSL !DecompSwordGfx
    JSL !Palette_Sword
    JSL !DecompShieldGfx
    JSL !Palette_Shield
    JSL !Palette_Armor

    ; Check if we're in overworld
    LDA $1B : BEQ .in_overworld

    JSL !UpdateBarrierTileChr

  LDA $11 : PHA
    LDA.b #$07 : STA $0690
    JSL !Dungeon_AnimateTrapDoors
  PLA : STA $11

  .in_overworld
    ; Check if we currently have a tagalong
    LDA $7EF3CC : BEQ .done
    JSL !Tagalong_LoadGfx

  .done
  %ai16()
    RTS


preset_clear_sram:
    ; Enteres AI=16
    LDA.w #$0000
    LDX.w #$0000

  .loop
    STA $7EF000, X : STA $7EF100, X : STA $7EF200, X : STA $7EF300, X : STA $7EF400, X
    INX #2 : CPX.w #$0100 : BNE .loop

    RTS

preset_clear_tilemap:
    ; Enteres AI=16
    LDA.w #$0000
    LDX.w #$0000

  .loop
    STA $7F2000, X : STA $7F2200, X : STA $7F2400, X : STA $7F2600, X
    STA $7F2800, X : STA $7F2A00, X : STA $7F2C00, X : STA $7F2E00, X
    STA $7F3000, X : STA $7F3200, X : STA $7F3400, X : STA $7F3600, X
    STA $7F3800, X : STA $7F3A00, X : STA $7F3C00, X : STA $7F3E00, X
    INX #2 : CPX.w #$0200 : BNE .loop

    RTS


preset_reset_state_after_loading:
    ; Assumes A=8

    ; Reset a bunch of Link state (sleeping, falling in hole etc).
    JSL !Player_ResetState

    ; Resets "Link Immovable" flag
    STZ $02E4

    ; Makes Link able to use pause/select menu (reset during medallion usage)
    STZ $0112

    ; Resets some state variable that makes Link "jump off" water after the first movement into land.
    STZ $0345

    ; Link general state (makes him not sleep..)
    STZ $5D

    ; Resets a scroll value for intra-room transitions
    STZ $0126

    ; I think maybe this resets being on a conveyorbelt? At least the first one ..
    STZ $03F3 : STZ $0322

    RTS


preset_reset_counters:
  %a16()
    STZ !lowram_room_realtime
    STZ !lowram_room_gametime
    STZ !lowram_seg_frames
    STZ !lowram_seg_seconds
    STZ !lowram_seg_minutes
    STZ !lowram_idle_frames
  %a8()
    RTS


preset_load_last_preset:
  %a16()
    LDA !ram_previous_preset_destination : STA !ram_preset_destination
  %a8()
    LDA !ram_previous_preset_type : STA !ram_preset_type
    LDA.b #12 : STA $10
    LDA.b #05 : STA $11
    RTL


preset_duck_dropoff_hook:
  PHA
    LDA !ram_preset_type : BNE .custom

  PLA
    JML $099509

  .custom
    LDA.b #$00 : STA !ram_preset_type
  PLA
    RTL


incsrc preset_data.asm
