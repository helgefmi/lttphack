pushpc
org $008056 ; Game Mode Hijack
	JSL gamemode_hook
pullpc

macro test_shortcut(shortcut, func, leavecarry)
+	LDA.w !ram_ctrl1 : AND <shortcut> : CMP <shortcut> : BNE +
	AND.l !ram_ctrl1_filtered : BEQ +
	JSR.w <func>
	if equal(<leavecarry>, 0)
		CLC
	endif
	RTS
endmacro

gamemode_hook:
	PHB : PHK : PLB
	JSR check_mode_safety
	BEQ .safeForNone
	BVS .safeForAll
	BMI .safeForSome
;	BNE .pracMenu

.pracMenu
	JSR gamemode_shortcuts_practiceMenu
	BRA ++

.safeForSome
.safeForAll
	JSR gamemode_shortcuts_everything ; overflow flag checks the presets in here
	BCS .skip

.safeForNone ; we will exit in 16 bit A if it's not safe for anything
++	%a16()
	INC !lowram_room_gametime
	JSR gamemode_transition_detection

	%ai8()
	PLB
	JSL $0080B5 ; GameMode

	LDA !ram_lagometer_toggle : BEQ .done
	JSR gamemode_lagometer
.done
	RTL

.skip
	%ai8()
	PLB : RTL


!notVerySafe = select(!FEATURE_SD2SNES, .SD2SNESBranch, .OtherBranch)
gamemode_shortcuts:
.practiceMenu
	LDA $B0 : BEQ !notVerySafe
-	CLC : RTS

.everything
	LDA !ram_ctrl1_filtered : ORA !ram_ctrl1_filtered+1 : BEQ -
	%a16()

	BMI !notVerySafe

	%test_shortcut(!pracmenu_shortcut, gamemode_custom_menu, 1)

.SD2SNESBranch
	;------------------------------
	%test_shortcut(!ram_ctrl_load_last_preset, gamemode_load_previous_preset, 1)
	%test_shortcut(!ram_ctrl_save_state, gamemode_savestate_save, 1)
	%test_shortcut(!ram_ctrl_load_state, gamemode_savestate_load, 1)

.OtherBranch
	;------------------------------
	%test_shortcut(!ram_ctrl_reset_segment_timer, gamemode_reset_segment_timer, 0)
	%test_shortcut(!ram_ctrl_somaria_pits, gamemode_somaria_pits_wrapper, 0)
	%test_shortcut(!ram_ctrl_fix_vram, gamemode_fix_vram, 0)
	%test_shortcut(!ram_ctrl_fill_everything, gamemode_fill_everything, 0)
	%test_shortcut(!ram_ctrl_toggle_oob, gamemode_oob, 0)
	%test_shortcut(!ram_ctrl_skip_text, gamemode_skip_text, 0)
	%test_shortcut(!ram_ctrl_disable_sprites, gamemode_disable_sprites, 0)
;	%test_shortcut(!ram_ctrl_replay_last_movie, gamemode_replay_last_movie, 1)

+	CLC : RTS

!IGNORE_MODULE = $FFFF
resettimers:
	LDA !ram_can_reset_timer : BNE updatetimers
	LDA !lowram_room_realtime
	STA !lowram_room_realtime_copy : STZ !lowram_room_realtime
	LDA !lowram_room_gametime
	STA !lowram_room_gametime_copy : STZ !lowram_room_gametime
	LDA !lowram_idle_frames
	STA !lowram_idle_frames_copy : STZ !lowram_idle_frames
	LDA #$0000 : STA !ram_rng_counter
	LDA #$0001 : STA !ram_can_reset_timer
	BRA updatetimers_hud

updatetimers_item:
	STX !ram_received_item_copy

updatetimers:
	LDA !lowram_room_realtime : STA !lowram_room_realtime_copy
	LDA !lowram_room_gametime : STA !lowram_room_gametime_copy
	LDA !lowram_idle_frames : STA !lowram_idle_frames_copy

.hud
	JSL draw_counters

ignoremodule:
	LDA $10 : STA !ram_gamemode_copy
	RTS

allowreset:
	STZ !ram_can_reset_timer
	LDA $10 : STA !ram_gamemode_copy
	RTS

; enters A=16
gamemode_transition_detection:
	%i8()
	LDA $10 : CMP !ram_gamemode_copy : BNE .changed
	LDX $02D8 : CPX !ram_received_item_copy : BNE updatetimers_item

	RTS

.changed
	ASL : TAY ; shift left and give 2*module to Y

	LDA Submodule_tables, Y : CMP #!IGNORE_MODULE : BEQ ignoremodule ; ignore module

	STA $00
	LDY $11 ; get submodule
	LDA ($00), Y ; stay in 16 bit
	TAX ; this becomes 8 bit X so it's fine

	JMP (.actions, X)

.actions
	dw ignoremodule ; this is why we stay in 16 bit, so we can store the mode
	dw updatetimers ; these other actions can deal with bitmode themselves
	dw resettimers
	dw allowreset

Submodule_tables:
	dw !IGNORE_MODULE ; Intro_sub
	dw !IGNORE_MODULE ; SelectFile_sub
	dw !IGNORE_MODULE ; CopyFile_sub
	dw !IGNORE_MODULE ; EraseFile_sub
	dw !IGNORE_MODULE ; NamePlayer_sub
	dw !IGNORE_MODULE ; LoadFile_sub
	dw !IGNORE_MODULE ; PreDungeon_sub
	dw Dungeon_sub
	dw PreOverworld_sub
	dw Overworld_sub
	dw PreOverworld_sub
	dw Overworld_sub
	dw !IGNORE_MODULE ; Custom menu
	dw !IGNORE_MODULE ; Unknown1_sub
	dw Messaging_sub
	dw CloseSpotlight_sub
	dw OpenSpotlight_sub
	dw HoleToDungeon_sub
	dw !IGNORE_MODULE ; Death_sub
	dw !IGNORE_MODULE ; BossVictory_sub
	dw !IGNORE_MODULE ; Attract_sub
	dw !IGNORE_MODULE ; Mirror_sub
	dw Victory_sub
	dw Quit_sub
	dw !IGNORE_MODULE ; GanonEmerges_sub
	dw !IGNORE_MODULE ; TriforceRoom_sub
	dw !IGNORE_MODULE ; EndSequence_sub
	dw !IGNORE_MODULE ; LocationMenu_sub

; How to behave on modules, pre shifted for address jumps
!T_Nothing = 0<<1 ; Do nothing
!T_Update = 1<<1 ; Update timers without resetting
!T_Reset = 2<<1 ; Reset timers and update
!T_Allow = 3<<1 ; Reset timers and update
	PreDungeon_sub: ; $06
		db !T_Nothing, !T_Nothing, !T_Nothing, !T_Nothing ; 0x00, 0x01, 0x02, 0x03

	Dungeon_sub: ; $07
		db !T_Allow, !T_Reset, !T_Reset, !T_Update ; 0x00, 0x01, 0x02, 0x03
		db !T_Update, !T_Update, !T_Reset, !T_Reset ; 0x04, 0x05, 0x06, 0x07
		db !T_Update, !T_Update, !T_Nothing, !T_Update ; 0x08, 0x09, 0x0A, 0x0B
		db !T_Update, !T_Update, !T_Reset, !T_Nothing ; 0x0C, 0x0D, 0x0E, 0x0F
		db !T_Update, !T_Update, !T_Reset, !T_Reset ; 0x10, 0x11, 0x12, 0x13
		db !T_Nothing, !T_Reset, !T_Nothing, !T_Nothing ; 0x14, 0x15, 0x16, 0x17
		db !T_Nothing, !T_Nothing, !T_Update ; 0x18, 0x19, 0x1A

	PreOverworld_sub: ; $08/$0A
		db !T_Reset, !T_Nothing, !T_Nothing ; 0x00, 0x01, 0x02

	Overworld_sub: ; $09/$0B
		db !T_Allow, !T_Reset, !T_Nothing, !T_Nothing ; 0x00, 0x01, 0x02, 0x03
		db !T_Nothing, !T_Nothing, !T_Nothing, !T_Nothing ; 0x04, 0x05, 0x06, 0x07
		db !T_Nothing, !T_Nothing, !T_Nothing, !T_Nothing ; 0x08, 0x09, 0x0A, 0x0B
		db !T_Nothing, !T_Nothing, !T_Nothing, !T_Nothing ; 0x0C, 0x0D, 0x0E, 0x0F
		db !T_Nothing, !T_Nothing, !T_Nothing, !T_Nothing ; 0x10, 0x11, 0x12, 0x13
		db !T_Nothing, !T_Nothing, !T_Nothing, !T_Reset ; 0x14, 0x15, 0x16, 0x17
		db !T_Nothing, !T_Nothing, !T_Nothing, !T_Nothing ; 0x18, 0x19, 0x1A, 0x1B
		db !T_Nothing, !T_Nothing, !T_Nothing, !T_Nothing ; 0x1C, 0x1D, 0x1E, 0x1F
		db !T_Update, !T_Nothing, !T_Nothing, !T_Nothing ; 0x20, 0x21, 0x22, 0x23
		db !T_Reset, !T_Nothing, !T_Nothing, !T_Nothing ; 0x24, 0x25, 0x26, 0x27
		db !T_Nothing, !T_Nothing, !T_Nothing, !T_Update ; 0x28, 0x29, 0x2A, 0x2B
		db !T_Update, !T_Update, !T_Reset, !T_Nothing ; 0x2C, 0x2D, 0x2E, 0x2F

	Messaging_sub: ; $0E
		db !T_Nothing, !T_Update, !T_Update, !T_Update ; 0x00, 0x01, 0x02, 0x03
		db !T_Nothing, !T_Nothing, !T_Nothing, !T_Nothing ; 0x04, 0x05, 0x06, 0x07
		db !T_Nothing, !T_Nothing, !T_Nothing, !T_Update ; 0x08, 0x09, 0x0A, 0x0B

	CloseSpotlight_sub: ; $0F
	OpenSpotlight_sub: ; $10 ???
		db !T_Reset, !T_Nothing ; 0x00, 0x01

	HoleToDungeon_sub: ; $11
		db !T_Reset, !T_Nothing, !T_Nothing, !T_Nothing ; 0x00, 0x01, 0x02, 0x03
		db !T_Nothing, !T_Nothing ; 0x04, 0x05

	Victory_sub: ; $16
	Quit_sub: ; $17

		db !T_Nothing, !T_Nothing, !T_Nothing, !T_Nothing ; 0x00, 0x01, 0x02, 0x03
		db !T_Nothing, !T_Nothing, !T_Nothing, !T_Nothing ; 0x04, 0x05, 0x06, 0x07
		db !T_Nothing, !T_Nothing, !T_Nothing, !T_Nothing ; 0x08, 0x09, 0x0A, 0x0B
		db !T_Nothing, !T_Nothing, !T_Nothing, !T_Nothing ; 0x0C, 0x0D, 0x0E, 0x0F
		db !T_Nothing, !T_Nothing, !T_Nothing, !T_Nothing ; 0x10, 0x11, 0x12, 0x13
		db !T_Nothing, !T_Nothing, !T_Nothing, !T_Nothing ; 0x14, 0x15, 0x16, 0x17
		db !T_Nothing, !T_Nothing, !T_Nothing, !T_Nothing ; 0x18, 0x19, 0x1A, 0x1B
		db !T_Nothing, !T_Nothing, !T_Nothing, !T_Nothing ; 0x1C, 0x1D, 0x1E, 0x1F
		db !T_Nothing, !T_Nothing, !T_Nothing, !T_Nothing ; 0x20, 0x21, 0x22, 0x23
		db !T_Nothing, !T_Nothing, !T_Nothing, !T_Nothing ; 0x24, 0x25, 0x26, 0x27
		db !T_Nothing, !T_Nothing, !T_Nothing, !T_Nothing ; 0x28, 0x29, 0x2A, 0x2B
		db !T_Nothing, !T_Nothing, !T_Nothing, !T_Nothing ; 0x2C, 0x2D, 0x2E, 0x2F


; return values in P
!SOME_SAFE = $8080 ; some presets are not always safe = negative flag

!ALL_SAFE = $4040 ; everything is safe = overflow flag
!NONE_SAFE = $0000 ; all modes unsafe = zero flag
; zero flag off = practice menu special

check_mode_safety:
	LDA $10 : CMP #$0C : BNE .notCustomMenu
	CLV ; clear overflow
	LDA #$01 ; make sure N/Z flags are not set
.neverSafe
	RTS

.notCustomMenu
	ASL : TAX ; get index
	REP #%11100010 ; clear NVMZ for checks and for 16 bit accum
	LDA Module_safety, X
	BEQ .neverSafe ; staying in 16 bit A is fine here

	STA $00
	LDY $11 ; get submodule

	%a8()
	LDA ($00), Y ; get safety level of submodule
	STA $00 ; put it in $00
	LDA $7EC011 : BEQ .safe ; check mosaics

	LDA.b #!SOME_SAFE ; not safe
	RTS

.safe
	LDA #$C0 : BIT $00 ; bit test to set NVZ
	RTS

Module_safety:
	dw !SOME_SAFE ; Intro_safety
	dw !SOME_SAFE ; SelectFile_safety
	dw !SOME_SAFE ; CopyFile_safety
	dw !SOME_SAFE ; EraseFile_safety
	dw !SOME_SAFE ; NamePlayer_safety
	dw !SOME_SAFE ; LoadFile_safety
	dw !SOME_SAFE ; PreDungeon_safety
	dw Dungeon_safety
	dw !SOME_SAFE ; PreOverworld_safety
	dw Overworld_safety
	dw !ALL_SAFE ; PreOverworld_safety
	dw Overworld_safety
	dw !SOME_SAFE ; CustomMenu_safety ; unsafe, but custom behavior
	dw !SOME_SAFE ; Unknown1_safety
	dw Messaging_safety
	dw !SOME_SAFE ; CloseSpotlight_safety
	dw !SOME_SAFE ; OpenSpotlight_safety
	dw !SOME_SAFE ; HoleToDungeon_safety
	dw !SOME_SAFE ; Death_safety
	dw !ALL_SAFE ; BossVictory_safety
	dw !SOME_SAFE ; Attract_safety
	dw !ALL_SAFE ; Mirror_safety
	dw !ALL_SAFE ; Victory_safety
	dw !SOME_SAFE ; Quit_safety
	dw !ALL_SAFE ; GanonEmerges_safety
	dw !SOME_SAFE ; TriforceRoom_safety
	dw !SOME_SAFE ;  EndSequence_safety
	dw !SOME_SAFE ; LocationMenu_safety

; How to behave on modules, pre shifted for address jumps

	Dungeon_safety: ; $07
		db !ALL_SAFE, !ALL_SAFE, !ALL_SAFE, !ALL_SAFE ; 0x00, 0x01, 0x02, 0x03
		db !ALL_SAFE, !ALL_SAFE, !SOME_SAFE, !SOME_SAFE ; 0x04, 0x05, 0x06, 0x07
		db !ALL_SAFE, !ALL_SAFE, !ALL_SAFE, !ALL_SAFE ; 0x08, 0x09, 0x0A, 0x0B
		db !ALL_SAFE, !ALL_SAFE, !SOME_SAFE, !SOME_SAFE ; 0x0C, 0x0D, 0x0E, 0x0F
		db !ALL_SAFE, !ALL_SAFE, !SOME_SAFE, !SOME_SAFE ; 0x10, 0x11, 0x12, 0x13
		db !ALL_SAFE, !ALL_SAFE, !ALL_SAFE, !ALL_SAFE ; 0x14, 0x15, 0x16, 0x17
		db !ALL_SAFE, !ALL_SAFE, !ALL_SAFE ; 0x18, 0x19, 0x1A

	Overworld_safety: ; $09/$0B
		db !ALL_SAFE, !ALL_SAFE, !ALL_SAFE, !ALL_SAFE ; 0x00, 0x01, 0x02, 0x03
		db !ALL_SAFE, !ALL_SAFE, !ALL_SAFE, !ALL_SAFE ; 0x04, 0x05, 0x06, 0x07
		db !ALL_SAFE, !ALL_SAFE, !ALL_SAFE, !ALL_SAFE ; 0x08, 0x09, 0x0A, 0x0B
		db !ALL_SAFE, !ALL_SAFE, !ALL_SAFE, !ALL_SAFE ; 0x0C, 0x0D, 0x0E, 0x0F
		db !ALL_SAFE, !ALL_SAFE, !ALL_SAFE, !ALL_SAFE ; 0x10, 0x11, 0x12, 0x13
		db !ALL_SAFE, !ALL_SAFE, !ALL_SAFE, !ALL_SAFE ; 0x14, 0x15, 0x16, 0x17
		db !ALL_SAFE, !ALL_SAFE, !ALL_SAFE, !ALL_SAFE ; 0x18, 0x19, 0x1A, 0x1B
		db !ALL_SAFE, !ALL_SAFE, !ALL_SAFE, !ALL_SAFE ; 0x1C, 0x1D, 0x1E, 0x1F
		db !ALL_SAFE, !ALL_SAFE, !ALL_SAFE, !SOME_SAFE; 0x20, 0x21, 0x22, 0x23
		db !ALL_SAFE, !ALL_SAFE, !ALL_SAFE, !ALL_SAFE ; 0x24, 0x25, 0x26, 0x27
		db !ALL_SAFE, !ALL_SAFE, !ALL_SAFE, !ALL_SAFE ; 0x28, 0x29, 0x2A, 0x2B
		db !ALL_SAFE, !ALL_SAFE, !ALL_SAFE, !ALL_SAFE ; 0x2C, 0x2D, 0x2E, 0x2F

	Messaging_safety: ; $0E
		db !ALL_SAFE, !ALL_SAFE, !ALL_SAFE, !NONE_SAFE ; 0x00, 0x01, 0x02, 0x03
		db !ALL_SAFE, !ALL_SAFE, !ALL_SAFE, !NONE_SAFE ; 0x04, 0x05, 0x06, 0x07
		db !ALL_SAFE, !NONE_SAFE, !ALL_SAFE, !ALL_SAFE ; 0x08, 0x09, 0x0A, 0x0B

; Custom Menu
gamemode_custom_menu:
	LDA $10 : STA !ram_cm_old_gamemode

	LDA #$000C : STA $10

	SEC : RTS


; Load previous preset
gamemode_load_previous_preset:
	%a8()

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
	%a8()
	JSL save_preset_data
	%ai8()
	SEC : RTS

.skip
	%ai8()
	CLC : RTS

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
