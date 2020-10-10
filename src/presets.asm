pushpc
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

; When Link dies
org $0780E1
	; 0780e1 lda $10
	; 0780e3 sta $010c
	; 0780e6 lda #$12
	; 0780e8 sta $10
	; 0780ea lda #$01
	; 0780ec sta $11

	; 0780ee lda #$00
	; 0780f0 sta $031f
	; 0780f3 sta $7ef372
	JSL preset_autoload_preset
	NOP             ; STA $010C
	NOP : NOP       ; LDA #$12
	NOP : NOP       ; STA $10
	NOP : NOP       ; LDA #$01
	NOP : NOP       ; STA $11

; 0ab944 lda #$10
; 0ab946 sta $012f
; 0ab949 lda $8a
; 0ab94b and #$bf
; 0ab94d ldx #$02
; 0ab94f cmp #$18
; 0ab951 bne $b95d
; 0ab95d cpx $0130
; 0ab960 bne $b968
; 0ab968 stx $012c
org $0AB944
	JSL music_overworld_track
	BCC .runLogic
	RTL
.runLogic


org $02C240
load_entrance_local:
	; Enters AI=8
	; This is called without using presets too, so need to redirect to the correct code.
	LDA.w SA1RAM.preset_type : BNE .custom

	JSR Dungeon_LoadEntrance
	SEP #$30
	RTS

.custom
	LDA #$00 : STA.w SA1RAM.preset_type
	JSR Dungeon_LoadEntrance
	JSL preset_load_dungeon
	SEP #$30
	RTS
warnpc $02C270


; Module_CloseSpotlight
; This is called first
org $02987D
	;02987d jsl $068328
	;029881 lda $11
	;029883 asl a
	;029884 tax
	JSL preset_did_we_load_preset
	BCC +
	RTL
	NOP : +


; Module_Dungeon -> Spotlight_Open
; This is called last
org $02922F
	JSL preset_spotlight_open_hook
	BRA + : +
	;02922f jsl $00f290
	;029233 inc $b0
	;029235 rts

pullpc
preset_load_next_frame:
	; This subroutine is used for any preset loading (load last, replay movie, from menu, autopreset)
	SEP #$30
	JSR preset_deinit_current_state

	REP #$30
	JSR preset_clear_tilemap

	SEP #$30
	LDA #$F0 : STA $012C
	LDA #$05 : STA $012D

	LDA.w SA1RAM.preset_type : CMP #$02 : BEQ .dungeon

	; "Moving floor" flag that needs to be reset to prevent overworld bugs
	; when loading preset from Mothula, Conveyor rooms etc.
	STZ $046C

	; Jumps to Bird Menu module
	LDA #$0E : STA $10
	LDA #$0A : STA $11

	; Make sure we're back into light word after the Messaging module is done.
	LDA #$09 : STA $010C

	; Skip the opening of overworld map and such. We want instaport.
	LDA #$06 : STA $0200

	RTL

.dungeon
	LDA #$08 : STA.w SA1RAM.preset_spotlight_timer

	; Makes PreDungeon not use a smaller "entrance only" table for data.
	STZ $04AA
	; We didn't die
	STZ $010A

	; Put us in Spotlight_close Module.
	LDA #$0F : STA $10
	STZ $11

	; Puts us in PreDungeon after Spotlight_close is done.
	LDA #$06 : STA $010C

	RTL


preset_deinit_current_state:
	; Enters: AI=8
	; Leaves: AI=8

	; This is mainly needed to stop interactions with nearby sprites (e.g. talking to Kiki)
	JSL Sprite_ResetAll

	; Clears the warp vortex.
	STZ $1ABF
	STZ $1ACF
	STZ $1ADF
	STZ $1AEF

	; clears camera shake offsets
	STZ $011A : STZ $011B
	STZ $011C : STZ $011D

	LDA #$81 : STA $4200 ; disable IRQ

	LDA.b $10 : CMP #$0E : BNE .not_message_module
	LDA.b $11 : CMP #$02 : BNE .not_message_module

	JSR preset_deinit_dialog_mode

.not_message_module
	RTS


preset_deinit_dialog_mode:
	; Enters: AI=8
	; Leaves: AI=8

	REP #$30
	; Clears HUD3 VRAM in case there's text present.
	LDA $1CD2 : STA $1CD0

	LDA $1CD0 : XBA : STA $1002
	LDA #$2E42 : STA $1004
	LDA #$387F : STA $1006

	LDA #$FFFF : STA $1008

	SEP #$30
	LDA #$01 : STA $14

	STZ $1CD8

	RTS

; ------------
; Load Preset
; ------------

preset_load_overworld:
	; Enters: AI=8
	LDA.w SA1RAM.preset_type : BNE .preset

	; This means we got here from the actual Bird menu (how boring),
	; so let's just jump to the original function.
	JML BirdTravel_LoadTargetAreaData

.preset
	PHB : PHK : PLB
	; Set link to be in the Overworld
	STZ $1B

	LDA.w !ram_preset_category : TAX
	LDA.l cm_preset_data_banks, X : STA $02

	REP #$30
	LDA.w SA1RAM.preset_destination : STA $00
	LDY #$0000

	STZ $04AC

	; Screen index
	LDA [$00], Y : INY #2 : STA $8A : STA $040A

	; Link X/Y
	LDA [$00], Y : INY #2 : STA $22
	LDA [$00], Y : INY #2 : STA $20

	; BG scroll X/Y
	LDA [$00], Y : INY #2 : STA $E6 : STA $0124
	LDA [$00], Y : INY #2 : STA $E8 : STA $0122
	LDA [$00], Y : INY #2 : STA $E0 : STA $0120
	LDA [$00], Y : INY #2 : STA $E2 : STA $011E

	; Camera scroll X/Y
	LDA [$00], Y : INY #2 : STA $061C : DEC #2 : STA $061E
	LDA [$00], Y : INY #2 : STA $0618 : DEC #2 : STA $061A

	; Unknown
	LDA [$00], Y : INY #2 : STA $84 : SEC : SBC #$0400 : AND #$0F80 : ASL A : XBA : STA $88
	LDA $84 : SEC : SBC #$0010 : AND #$003E : LSR A : STA $86

	LDA [$00], Y : INY #2 : STA $0624
	LDA #$0000 : SEC : SBC $0624 : STA $0626

	LDA [$00], Y : INY #2 : STA $0628
	LDA #$0000 : SEC : SBC $0628 : STA $062A

	LDA [$00], Y : INY #2 : STA.w SA1RAM.preset_end_of_sram_state

	SEP #$30
	; LW/DW
	LDA $8A : AND #$40 : STA $7EF3CA

	; Reset which BG to interact with (can be set to 1 during falling animations and more)
	STZ $EE

	JSR preset_reset_state_after_loading
	JSR preset_reset_counters

	REP #$30
	JSR preset_load_state
	SEP #$10

	; Makes it possible to spawn in the middle of a field/not inside doorway?
	STZ $0696

	; Clears RAM in case it's needed (used for when lifting big rocks?).
	STZ $0698

	LDA $0136 : BEQ .dontNeedNewMusicBank

	JSL music_reload

	REP #$20

.dontNeedNewMusicBank

	PLB
	JML BirdTravel_LoadTargetAreaData_AfterData


preset_load_dungeon:
	; Can leave with anything.
	PHB

	LDA.w !ram_preset_category : TAX
	LDA.l cm_preset_data_banks, X : STA $02
	REP #$30
	LDA.w SA1RAM.preset_destination : STA $00
	LDY #$0000

	; Room index
	LDA [$00], Y : INY : INY : STA $A0 : STA $048E

	; BG1/2 vertical and horizontal scroll
	LDA [$00], Y : INY #2 : STA $E6 : STA $0124
	LDA [$00], Y : INY #2 : STA $E8 : STA $0122
	LDA [$00], Y : INY #2 : STA $E0 : STA $0120
	LDA [$00], Y : INY #2 : STA $E2 : STA $011E

	; Link X/Y
	LDA [$00], Y : INY #2 : STA $22
	LDA [$00], Y : INY #2 : STA $20

	; Camera scroll X/Y
	LDA [$00], Y : INY #2 : STA $061C : INC #2 : STA $061E
	LDA [$00], Y : INY #2 : STA $0618 : INC #2 : STA $061A
	LDA #$01F8 : STA $EC

	; Door settings
	LDA [$00], Y : INY #2 : STA $0696 : STZ $0698

	; Relative coordinates (scroll edges?)
	LDA [$00], Y : INY #2 : STA $0600
	LDA [$00], Y : INY #2 : STA $0602
	LDA [$00], Y : INY #2 : STA $0604
	LDA [$00], Y : INY #2 : STA $0606
	LDA [$00], Y : INY #2 : STA $0608
	LDA [$00], Y : INY #2 : STA $060A
	LDA [$00], Y : INY #2 : STA $060C
	LDA [$00], Y : INY #2 : STA $060E

	LDA #$0000 : STA $0610
	LDA #$0110 : STA $0612
	LDA #$0000 : STA $0614
	LDA #$0100 : STA $0616

	; Quadrant stuff
	LDA [$00], Y : INY #2 : STA $A6
	LDA [$00], Y : INY #2 : STA $A9

	SEP #$20

	; Set link to be in the Overworld
	LDA #$01 : STA $1B

	; Main blockset value (main graphics)
	LDA [$00], Y : REP #$20 : INY : SEP #$20 : STA $0AA1

	; Music track value. Is it the beginning music?
	LDA [$00], Y : REP #$20 : INY : SEP #$20 : STA $0132 : CMP #$03 : BNE .notBeginningMusic

	; Check game status
	; Is it less than first part?
	LDA $7EF3C5 : CMP #$02 : BCC .haventSavedZelda

	; Play the cave music if it's first or second part.
	LDA #$12

.haventSavedZelda

	STA $0132

.notBeginningMusic

.loop
	LDA $2140 : BNE .loop

	; Starting floor
	LDA [$00], Y : REP #$20 : INY : SEP #$20 : STA $A4

	; Load the palace number.
	LDA [$00], Y : REP #$20 : INY : SEP #$20 : STA $040C

	; Doorway orientation
	LDA [$00], Y : REP #$20 : INY : SEP #$20 : STA $6C

	; Starting BG
	; Set the position that Link starts at.
	; NOTE that original code had a LSR #4 here that I removed, since I serialize this differently.
	LDA [$00], Y : STA $EE

	; Set Pseudo bg level
	LDA [$00], Y : REP #$20 : INY : SEP #$20 : AND #$0F : STA $0476

	PHY

	SEP #$30
	JSR preset_reset_state_after_loading
	JSR preset_reset_counters

	REP #$30
	PLY
	LDA [$00], Y : INY #2 : STA.w SA1RAM.preset_end_of_sram_state
	JSR preset_load_state
	SEP #$30
	PLB
	RTL


preset_sprite_reset_all:
	; Enters AI=8
	; Call the original routine
	JSL Sprite_ResetAll

	; Check if we want to load our own state.
	REP #$30
	LDA.w SA1RAM.preset_end_of_sram_state : BEQ .end

	JSR preset_load_state
	LDA #$0000 : STA.w SA1RAM.preset_end_of_sram_state
	;JSL movie_preset_loaded
.end
	SEP #$30
	RTL


preset_load_state:
	; Enters AI=16

	JSR preset_clear_for_initial_preset

	SEP #$20
	LDA.w !ram_preset_category : TAX
	PHB : LDA.l cm_preset_data_banks, X : PHA : PLB
	REP #$20
	LDA.w SA1RAM.preset_end_of_sram_state : STA $06
	LDA.w !ram_preset_category : AND #$00FF : ASL : TAX
	LDA.l preset_start_ptrs, X : STA $00

.next_item
	; Sets up $02-$04 with the long address we want to manipulate.
	LDA $00 : CMP $06 : BEQ .done_with_state
	LDA ($00) : INC $00 : INC $00 : STA $02
	LDA ($00) : INC $00 : INC $00 : STA $04

	; High byte of A = How many bytes to copy over.
	XBA : AND #$00FF : CMP #$0001 : BEQ .one_byte

	LDA ($00) : INC $00 : INC $00 : STA [$02]
	BRA .next_item

.one_byte
	SEP #$20
	LDA ($00) : STA [$02]
	REP #$20
	INC $00
	BRA .next_item

.done_with_state
	PLB

	REP #$30
	JSL Sprite_LoadGfxProperties

	SEP #$30
	; Reload graphics and palette for sword, shield and armor
	JSL DecompSwordGfx
	JSL Palette_Sword
	JSL DecompShieldGfx
	JSL Palette_Shield
	JSL Palette_Armor

	; Check if we're in overworld
	LDA $1B : BEQ .in_overworld

	JSL UpdateBarrierTileChr

	LDA $11 : PHA
	LDA #$07 : STA $0690
	JSL Dungeon_AnimateTrapDoors
	PLA : STA $11

.in_overworld
	; Check if we currently have a tagalong
	LDA $7EF3CC : BEQ .no_tagalong
	JSL Tagalong_LoadGfx

.no_tagalong
	LDA.l !ram_game_progress : CMP #$02 : BMI .done

	LDA.w !ram_sanctuary_heart : BEQ .done
	LDA.l !ram_equipment_maxhp : CLC : ADC #$08 : STA.l !ram_equipment_maxhp
	LDA.l !ram_equipment_curhp : CLC : ADC #$08 : STA.l !ram_equipment_curhp

.done
	REP #$30
	RTS


preset_clear_for_initial_preset:
	; Enters AI=16
	LDA #$0000
	LDX #$0000

-	STA $7EF000, X : STA $7EF100, X : STA $7EF200, X : STA $7EF300, X : STA $7EF400, X
	STZ $0B00, X : STZ $0C00, X : STZ $0D00, X : STZ $0E00, X : STZ $0F00, X
	INX #2 : CPX #$0100 : BNE -

	LDX #$0000
-	STZ $0FC7, X
	INX #2 : CPX #$0010 : BNE -

	LDX #$0000

-	STZ $029E, X
	INX #2 : CPX #$000A : BNE -

	STZ $0ABD
	STZ $0B09

	RTS

preset_clear_tilemap:
	; Enteres AI=16
	LDA #$0000
	LDX #$0000

.loop
	STA $7F2000, X : STA $7F2200, X : STA $7F2400, X : STA $7F2600, X
	STA $7F2800, X : STA $7F2A00, X : STA $7F2C00, X : STA $7F2E00, X
	STA $7F3000, X : STA $7F3200, X : STA $7F3400, X : STA $7F3600, X
	STA $7F3800, X : STA $7F3A00, X : STA $7F3C00, X : STA $7F3E00, X
	INX #2 : CPX #$0200 : BNE .loop

	RTS


preset_reset_state_after_loading:
	; Assumes A=8

	; Reset a bunch of Link state (sleeping, falling in hole etc).
	JSL Player_ResetState

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

	; Remove stair lag
	STZ $57
	
	; Room transition flags (change layer, alter dungeon ID)
	STZ $EF

	RTS


preset_reset_counters:
	SEP #$20
	STZ.w SA1IRAM.LanmoCycles+0
	STZ.w SA1IRAM.LanmoCycles+1
	STZ.w SA1IRAM.LanmoCycles+2
	LDA #$41 : STA SA1IRAM.TIMER_FLAG
	RTS


preset_load_last_preset:
	REP #$20
	LDA.w SA1RAM.previous_preset_destination : STA.w SA1RAM.preset_destination
	SEP #$20
	LDA.w SA1RAM.previous_preset_type : STA.w SA1RAM.preset_type
	LDA #12 : STA $10
	LDA #05 : STA $11
	RTL


preset_duck_dropoff_hook:
	PHA
	LDA.w SA1RAM.preset_type : BNE .custom

	PLA
	JML $099509

.custom
	LDA #$00 : STA.w SA1RAM.preset_type

	LDA $02E0 : ORA $56 : BEQ .notBunny

	; Fixes bunny graphics after Palette_ArmorAndGloves messes it up
	JSL LoadGearPalettes_bunny

.notBunny
	PLA
	RTL


preset_autoload_preset:
	LDA.w !ram_autoload_preset : BEQ .die

	JML preset_load_last_preset

.die
	LDA $10 : STA $010C
	LDA #$12 : STA $10
	LDA #$01 : STA $11
	RTL


preset_did_we_load_preset:
	LDA.w SA1RAM.preset_spotlight_timer : BEQ .not_preset
	DEC : STA.w SA1RAM.preset_spotlight_timer : BEQ .done
	STA $2100 : STA $13
	SEC
	RTL

.done
.muted

	LDA $010C : STA $10
	STZ $11
	LDA #$80 : STA $2100 : STA $13
	LDA #$08 : STA.w SA1RAM.preset_spotlight_timer
	SEC
	RTL

.not_preset
	LDA $11 : ASL : TAX
	CLC
	RTL


preset_spotlight_open_hook:
	LDA.w SA1RAM.preset_spotlight_timer : BEQ .not_preset
	DEC : STA.w SA1RAM.preset_spotlight_timer : BEQ .done
	LDA #$0F : SEC : SBC.w SA1RAM.preset_spotlight_timer : STA $2100 : STA $13
	RTL

.done
	LDA $0132 : CMP #$FF : BEQ .muted
	STA $012C

.muted
	LDA $02E0 : ORA $56 : BEQ .notBunny

	; Fixes bunny graphics after Palette_ArmorAndGloves messes it up
	JSL LoadGearPalettes_bunny

.notBunny
	LDA $010C : STA $10
	STZ $11
	LDA #$0F : STA $2100 : STA $13
	RTL

.not_preset
	JSL $00F290
	INC $B0
	RTL

preset_start_ptrs:
	dw sram_nmg_esc_bed
	dw sram_hundo_esc_bed
	dw sram_lownmg_esc_bed
	dw sram_low_esc_bed
	dw sram_ad2020_east_bed
	dw sram_ad_esc_links_bed
	dw sram_anyrmg_east_bed

preset_end_of_base_states:
	dw sram_nmg_esc_bed_after
	dw sram_hundo_esc_bed_after
	dw sram_lownmg_esc_bed_after
	dw sram_low_esc_bed_after
	dw sram_ad2020_east_bed_after
	dw sram_ad_esc_links_bed_after
	dw sram_anyrmg_east_bed_after
