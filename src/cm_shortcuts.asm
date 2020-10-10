SHORTCUTS_SUBMENU:
%menu_header("CONTROLLER SHORTCUTS", 12)
	%ctrl_shortcut_final("LTTPHack menu", final_static_short_PracMenuShortcut)
	%ctrl_shortcut("Load last preset", !ram_ctrl_load_last_preset)
	%ctrl_shortcut("Save state", !ram_ctrl_save_state)
	%ctrl_shortcut("Load state", !ram_ctrl_load_state)
	%ctrl_shortcut("Reset seg timer", !ram_ctrl_reset_segment_timer)
	%ctrl_shortcut("Toggle OoB", !ram_ctrl_toggle_oob)
	%ctrl_shortcut("Skip text", !ram_ctrl_skip_text)
	%ctrl_shortcut("Remove sprites", !ram_ctrl_disable_sprites)
	%ctrl_shortcut("Toggle switch", !ram_ctrl_toggle_switch)
	%ctrl_shortcut("Fill everything", !ram_ctrl_fill_everything)
	%ctrl_shortcut("VRAM repair", !ram_ctrl_fix_vram)
	%ctrl_shortcut("Show somaria pits", !ram_ctrl_somaria_pits)

;===================================================================================================
DoShortCuts:
	PHB
	PHK
	PLB
	JSR check_mode_safety
	JSR .go

	PLB
	RTL

.go
	BEQ gamemode_shortcuts_nothing    ; safeForNone
	BVS gamemode_shortcuts_everything ; safeForAll
	BMI gamemode_shortcuts_everything ; safeForSome

gamemode_shortcuts:
.practiceMenu
	LDA.b SA1IRAM.CopyOf_B0
	REP #$20 ; this code is copyright Lui 2020
	BEQ .pracmenu_allowed
.nothing
	RTS

.everything
	TAY
	LDA.b SA1IRAM.CONTROLLER_1_FILTERED
	ORA.b SA1IRAM.CONTROLLER_1_FILTERED+1 : BEQ .nothing

	REP #$10
	LDX.w #0
	TYA
	BPL .pracmenu_allowed

	LDX.w #4

.pracmenu_allowed
	REP #$20

.nextcheck
	LDA.w .shortcut_routine, X
	BEQ ..nothingused

	STA.b SA1IRAM.SCRATCH+0
	LDA.b (SA1IRAM.SCRATCH+0)

	AND.b SA1IRAM.CONTROLLER_1
	CMP.b (SA1IRAM.SCRATCH+0)
	BNE ..fail

	AND.b SA1IRAM.CONTROLLER_1_FILTERED
	BEQ ..fail

	LDA.w .shortcut_routine+2, X
	BPL ..forsnes

..forsa1
	PHA
	LDA.w #gamemode_sa1_side_shortcut
	STA.b SA1IRAM.SHORTCUT_USED
	PLA
	JSL UseShortCutSA1
	RTS

..forsnes
	ORA.w #$8000 ; add in bit 7 that was used as a flag in rom table
	STA.b SA1IRAM.SHORTCUT_USED

..nothingused
	RTS

..fail
	INX
	INX
	INX
	INX
	BRA .nextcheck

!CPU_SIDE = $7FFF ; for routines to be done by the SNES CPU
!SA1_SIDE = $FFFF ; for routines to be done by the SA1 instead of the CPU

.shortcut_routine
	dw ..pracmenushortcut, gamemode_custom_menu&!CPU_SIDE
	dw !ram_ctrl_load_last_preset, gamemode_load_previous_preset&!CPU_SIDE
	dw !ram_ctrl_save_state, gamemode_savestate_save&!CPU_SIDE
	dw !ram_ctrl_load_state, gamemode_savestate_load&!CPU_SIDE
	dw !ram_ctrl_reset_segment_timer, gamemode_reset_segment_timer&!SA1_SIDE
	dw !ram_ctrl_somaria_pits, gamemode_somaria_pits_wrapper&!CPU_SIDE
	dw !ram_ctrl_fix_vram, gamemode_fix_vram&!CPU_SIDE
	dw !ram_ctrl_toggle_switch, gamemode_toggle_switch&!CPU_SIDE
	dw !ram_ctrl_fill_everything, gamemode_fill_everything&!CPU_SIDE
	dw !ram_ctrl_toggle_oob, gamemode_oob&!CPU_SIDE
	dw !ram_ctrl_skip_text, gamemode_skip_text&!CPU_SIDE
	dw !ram_ctrl_disable_sprites, gamemode_disable_sprites&!CPU_SIDE
	dw 0, 0

#final_static_short_PracMenuShortcut:
..pracmenushortcut
	dw $1010

; return values in P
!SOME_SAFE = $8080 ; some options are not always safe = negative flag
!ALL_SAFE = $4040 ; everything is safe = overflow flag
!NONE_SAFE = $0000 ; all modes unsafe = zero flag
; zero flag off = practice menu special

check_mode_safety:
	LDA.b SA1IRAM.CopyOf_10 : CMP.b #$0C : BNE .notCustomMenu
	REP #%11000010 ; clear NVZ
.neverSafe
	RTS

.notCustomMenu
	ASL : TAX ; get index
	REP #%01100000 ; clear V for checks and M for 16 bit accum
	LDA.w Module_safety, X
	BEQ .neverSafe ; staying in 16 bit A is fine here

	STA.b SA1IRAM.SCRATCH
	LDY.b SA1IRAM.CopyOf_11 ; get submodule

	SEP #$20
	LDA.b (SA1IRAM.SCRATCH), Y ; get safety level of submodule
	STA.b SA1IRAM.SCRATCH ; put it in $00
	LDY.b SA1IRAM.CopyOf_7EC011 : BEQ .safe ; check mosaics

	LDA.b #!SOME_SAFE ; not safe
	RTS

.safe
	BIT.b SA1IRAM.SCRATCH ; bit test to set NVZ
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
	dw !SOME_SAFE ; PreOverworld_safety
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