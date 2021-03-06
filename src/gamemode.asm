pushpc
; Game Mode Hijack
org $008056
	JSL gamemode_hook
pullpc

gamemode_hook:
	PHB : PHK : PLB
	JSR gamemode_shortcuts : BCS .skip_gamemode

	%a16() : INC !lowram_room_gametime : %a8()

	JSR gamemode_transition_detection

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

macro test_shortcut(shortcut, func, continue)
+	LDA.w !ram_ctrl1 : AND.l <shortcut> : CMP.l <shortcut> : BNE +
	AND.l !ram_ctrl1_filtered : BEQ +
	JSR.w <func>
	if equal(<continue>, 0)
		CLC
	endif
	RTS
endmacro

gamemode_shortcuts:
	LDA $10 : CMP #$0C : BNE .not_setting_new_inputs
	LDA $B0 : BEQ .not_setting_new_inputs
	CLC : RTS

.not_setting_new_inputs
	%a16()
	LDA !ram_ctrl1_filtered : BNE +

	%a8()
	CLC : RTS

	%test_shortcut(!ram_ctrl_save_state, gamemode_savestate_save, 1)
	%test_shortcut(!ram_ctrl_load_state, gamemode_savestate_load, 1)
	%test_shortcut(!pracmenu_shortcut, gamemode_custom_menu, 1)
	%test_shortcut(!ram_ctrl_load_last_preset, gamemode_load_previous_preset, 1)

;	%test_shortcut(!ram_ctrl_replay_last_movie, gamemode_replay_last_movie, 1)

	%test_shortcut(!ram_ctrl_toggle_oob, gamemode_oob, 0)
	%test_shortcut(!ram_ctrl_skip_text, gamemode_skip_text, 0)
	%test_shortcut(!ram_ctrl_disable_sprites, gamemode_disable_sprites, 0)
	%test_shortcut(!ram_ctrl_fill_everything, gamemode_fill_everything, 0)
	%test_shortcut(!ram_ctrl_reset_segment_timer, gamemode_reset_segment_timer, 0)
	%test_shortcut(!ram_ctrl_fix_vram, gamemode_fix_vram, 0)
	%test_shortcut(!ram_ctrl_somaria_pits, gamemode_somaria_pits_wrapper, 0)

+	CLC : RTS


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

-	INX #6
	LDA .gamemode_table, X
	CMP #$FF : BEQ .done
	CMP !ram_gamemode_copy : BNE -
	LDA $10 : AND .gamemode_table+1, X : CMP .gamemode_table+2, X : BNE -
	LDA $11 : AND .gamemode_table+3, X : CMP .gamemode_table+4, X : BNE -

	LDA .gamemode_table+5, X
	BRA .transition_detected

.submode_changed
	LDX #$FD

-	INX #3
	LDA .submode_table, X
	CMP #$FF : BEQ .done
	CMP !ram_gamemode_copy : BNE -
	LDA .submode_table+1, X : CMP $11 : BNE -

	LDA .submode_table+2, X

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
	; Used to decide if we can use the Custom Menu, Poverty Save/Load or Load last preset.
	%ai8()
	PHB : PHK : PLB
	LDX $10 : LDA .unsafe_gamemodes, X : BNE .not_safe
	CPX #$07 : BNE .not_dungeon

	LDA $11 : CMP #$06 : BEQ .not_safe ; Upwards floor transition
			  CMP #$07 : BEQ .not_safe ; Downward floor transition
			  CMP #$12 : BEQ .not_safe ; Subtile staircase (up)
			  CMP #$13 : BEQ .not_safe ; Subtile staircase (down)
			  CMP #$0E : BEQ .not_safe ; Spiral staircase
			  CMP #$0F : BEQ .not_safe ; Enter underworld spotlight effect

.not_dungeon
	CPX #$09 : BNE .not_overworld
	LDA $11 : CMP #$23 : BEQ .not_safe ; Mirror transition

.not_overworld
	CPX #$0E : BNE .not_messaging
	LDA $11 : CMP #$03 : BEQ .not_safe ; Dungeon map
			  CMP #$07 : BEQ .not_safe ; Overworld map
			  CMP #$09 : BEQ .not_safe ; Flute map

.not_messaging
	; Don't allow custom menu during mosaic effects
	LDA $7EC011 : BNE .not_safe

	PLB
	SEC : RTS

.not_safe
	PLB
	CLC : RTS

!safe = 0
!unsafe = 1
.unsafe_gamemodes
	db !unsafe ; 0x00 - Triforce / Zelda startup screens
	db !unsafe ; 0x01 - File Select screen
	db !unsafe ; 0x02 - Copy Player Mode
	db !unsafe ; 0x03 - Erase Player Mode
	db !unsafe ; 0x04 - Name Player Mode
	db !unsafe ; 0x05 - Loading Game Mode
	db !unsafe ; 0x06 - Pre Dungeon Mode
	db !safe ; 0x07 - Dungeon Mode
	db !unsafe ; 0x08 - Pre Overworld Mode
	db !safe ; 0x09 - Overworld Mode
	db !safe ; 0x0A - Pre Overworld Mode (special overworld)
	db !safe ; 0x0B - Overworld Mode (special overworld)
	db !unsafe ; 0x0C - Custom Menu
	db !safe ; 0x0D - Blank Screen
	db !safe ; 0x0E - Text Mode/Item Screen/Map
	db !unsafe ; 0x0F - Closing Spotlight
	db !unsafe ; 0x10 - Opening Spotlight
	db !unsafe ; 0x11 - Happens when you fall into a hole from the OW.
	db !unsafe ; 0x12 - Death Mode
	db !safe ; 0x13 - Boss Victory Mode (refills stats)
	db !unsafe ; 0x14 - Attract Mode
	db !safe ; 0x15 - Module for Magic Mirror
	db !safe ; 0x16 - Module for refilling stats after boss.
	db !unsafe ; 0x17 - Quitting mode (save and quit)
	db !safe ; 0x18 - Ganon exits from Agahnim's body. Chase Mode.
	db !unsafe ; 0x19 - Triforce Room scene
	db !unsafe ; 0x1A - End sequence
	db !unsafe ; 0x1B - Screen to select where to start from (House, sanctuary, etc.)


; Custom Menu
gamemode_custom_menu:
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
	%a8()
	JSR gamemode_safe_to_change_mode : BCC .no_load_preset

	; Loading during text mode make the text stay or the item menu to bug
	LDA $10 : CMP #$0E : BEQ .no_load_preset
	%a16()
	LDA !ram_previous_preset_destination
	%a8()
	BEQ .no_load_preset

	STZ !lowram_is_poverty_load

	JSL preset_load_last_preset
	SEC : RTS

.no_load_preset
	%a8()
	CLC : RTS

; Replay last movie
gamemode_replay_last_movie:
	%a8()
	LDA !ram_movie_mode : CMP #$02 : BEQ .no_replay

	%ai8()
	JSR gamemode_load_previous_preset : BCC .no_replay
	LDA #$02 : STA !ram_movie_next_mode

	SEC : RTS

.no_replay
	%a8()
	CLC : RTS

; Save state
gamemode_savestate:
.save
if !FEATURE_SD2SNES
	%a8()
	%i16()
	; Remember which song bank was loaded before load stating
	; I put it here too, since `end` code runs both on save and load state..
	LDA $0136 : STA !sram_old_music_bank

	; store DMA to SRAM
	LDY #$0000 : LDX #$0000
-	LDA $4300, X : STA !sram_ss_dma_buffer, X
	INX
	INY : CPY #$000B : BNE -
	CPX #$007B : BEQ +
	INX #5
	LDY #$0000
	BRA -
	; end of DMA to SRAM

+	JSR ppuoff
	LDA #$80 : STA $4310
	JSR func_dma2

	LDA #$81 : STA $4310
	LDA #$39 : STA $4311
	JMP end

else

	; make sure we're not on a screen transition or falling down
	LDA $0126 : AND #$00FF : ORA $0410 : BNE .skip
	LDA $5B : AND #$00FF : CMP #$0002 : BCS .skip
	JSR gamemode_safe_to_change_mode : BCC .skip
	BRA .continue

.skip
	%ai8()
	CLC : RTS

.continue
	%a8()
	JSL save_preset_data
	%ai8()
	SEC : RTS

endif

.load
	%a8()
	%i16()
	; Remember which song bank was loaded before load stating (so we can change if needed)
	LDA $0136 : STA !sram_old_music_bank

	LDA !ram_rerandomize_toggle : BEQ .dont_rerandomize_1

	; Save the current framecounter & rng accumulator
	LDA $1A : STA !ram_rerandomize_framecount
	LDA $0FA1 : STA !ram_rerandomize_accumulator

.dont_rerandomize_1

if !FEATURE_SD2SNES

	%a8()
	; Mute music
	LDA #$F0 : STA $2140

	; Mute ambient sounds
	LDA #$05 : STA $2141

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
	LDA $0130 : STA $012C
	STZ $0133

	LDA $0131 : CMP #$17 : BEQ .annoyingSounds ; Bird music
	STA $012D : STZ $0131

.annoyingSounds
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

+	LDA #$02 : STA $420B
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
	%i16()
-	LDA !sram_ss_dma_buffer, X : STA $4300, X
	INX
	INY : CPY #$000B : BNE -
	CPX #$007B : BEQ +
	INX #5
	LDY #$0000
	BRA -
	; end of DMA from SRAM

+	LDA !sram_old_music_bank : CMP $0136 : BEQ .songBankNotChanged
	JSL music_reload

.songBankNotChanged

	LDA #$81 : STA $4200
	LDA $13 : STA $2100
	%ai8()
	LDA #$01 : STA !lowram_last_frame_did_saveload
	SEC : RTS

after_save_state:
	%ai8()
	CLC : RTS


gamemode_oob:
	%a8()
	LDA !lowram_oob_toggle : EOR #$01 : STA !lowram_oob_toggle
	RTS


gamemode_skip_text:
	%a8()
	LDA #$04 : STA $1CD4

.done
	%a8()
	RTS


gamemode_disable_sprites:
	%a8()
	JSL !Sprite_DisableAll

.done
	%a8()
	RTS


gamemode_fill_everything:
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
	STZ !lowram_seg_frames
	STZ !lowram_seg_seconds
	STZ !lowram_seg_minutes

.done
	%a8()
	RTS

gamemode_fix_vram:
	%a16()
	LDA #$0280 : STA $2100
	LDA #$0313 : STA $2107
	LDA #$0063 : STA $2109 ; zeros out unused bg4
	LDA #$0722 : STA $210B
	STZ $2133 ; mode 7 register hit, but who cares

	%a8()
	LDA #$80 : STA $13 : STA $2100 ; keep fblank on while we do stuff
	LDA $1B : BEQ ++
	JSR fix_vram_uw
	JSL load_default_tileset

	LDA $7EC172 : BEQ ++
	JSR fixpegs ; quick and dirty pegs reset

++	LDA #$0F : STA $13
	RTS

fixpegs:

	%ai16()
	LDX #$0000
--	LDA $7EB4C0, X : STA $7F0000, X
	LDA $7EB340, X : STA $7F0080, X
	INX #2 : CPX #$0080 : BNE --
	%ai8()
	LDA #$17 : STA $17
	RTS

fix_vram_uw: ; mostly copied from PalaceMap_RestoreGraphics - pc: $56F19
	PHB
	LDA #$00 : PHA : PLB ; need to be bank00
	LDA $9B : PHA
	STZ $9B : STZ $420C

	JSL $00834B ; Vram_EraseTilemaps.normal

	JSL $00E1DB ; InitTilesets

	JSL $0DFA8C ; HUD.RebuildLong2

.just_redraw
	STZ $0418
	STZ $045C

.drawQuadrants

	JSL $0091C4
	JSL $0090E3
	JSL $00913F
	JSL $0090E3

	LDA $045C : CMP #$10 : BNE .drawQuadrants

	STZ $17
	STZ $B0

	PLA : STA $9B
	PLB : RTS

; wrapper because of push and pull logic
; need this to make it safe and ultimately fix INIDISP ($13)
gamemode_somaria_pits_wrapper:
	%a8()
	LDA $1B : BEQ ++ ; don't do this outdoors

	LDA #$80 : STA $13 : STA $2100 ; keep fblank on while we do stuff
	JSR gamemode_somaria_pits
	LDA #$0F : STA $13

++	RTS

gamemode_somaria_pits:
	PHB ; rebalanced in redraw
	PEA $007F ; push both bank 00 and bank 7F (wram)
	PLB ; but only pull 7F for now

	%ai16()

	LDY #$0FFE

--	LDA $2000, Y : AND #$00FF ; checks tile attributes table
	CMP #$0020 : BEQ .ispit
	;CMP #$00B0 : BCC .skip
	;CMP #$00BF : BCS .skip ; range B0-BE, which are pits
	BRA .skip

.ispit
	TYA : ASL : TAX
	LDA #$050F : STA $7E2000, X

.skip
	DEY : BPL --

.time_for_tilemaps ; just a delimiting label
	%ai8()
	PLB ; pull to bank 00 for this next stuff

	LDA $9B : PHA ; rebalanced in redraw
	STZ $9B : STZ $420C

	JMP fix_vram_uw_just_redraw ; jmp to have 1 less rts and because of stack

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
