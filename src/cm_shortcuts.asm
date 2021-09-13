SHORTCUTS_SUBMENU:
%menu_header("CONTROLLER SHORTCUTS", 12)
	%ctrl_shortcut_final("LTTPHack menu", final_static_short_PracMenuShortcut)
	%ctrl_shortcut("Load last preset", !config_ctrl_load_last_preset)
	%ctrl_shortcut("Save state", !config_ctrl_save_state)
	%ctrl_shortcut("Load state", !config_ctrl_load_state)
	%ctrl_shortcut("Reset seg timer", !config_ctrl_reset_segment_timer)
	%ctrl_shortcut("Toggle OoB", !config_ctrl_toggle_oob)
	%ctrl_shortcut("Skip text", !config_ctrl_skip_text)
	%ctrl_shortcut("Remove sprites", !config_ctrl_disable_sprites)
	%ctrl_shortcut("Toggle switch", !config_ctrl_toggle_switch)
	%ctrl_shortcut("Fill everything", !config_ctrl_fill_everything)
	%ctrl_shortcut("VRAM repair", !config_ctrl_fix_vram)
	%ctrl_shortcut("Mark all pits", !config_ctrl_somaria_pits)

;===================================================================================================
DoShortCuts:
	PHB
	PHK
	PLB

	JSR gamemode_shortcuts

	PLB
	RTL

--	RTS

gamemode_shortcuts:
	REP #$30 ; this code is copyright Lui 2020

	LDA.b SA1IRAM.CONTROLLER_1_FILTERED : BEQ --

	LDX.w #0

.nextcheck
	LDA.w .shortcut_routine,X
	BEQ ..nothingused

	STA.b SA1IRAM.SCRATCH+0
	LDA.b (SA1IRAM.SCRATCH+0)

	AND.b SA1IRAM.CONTROLLER_1
	CMP.b (SA1IRAM.SCRATCH+0)
	BNE ..fail

	AND.b SA1IRAM.CONTROLLER_1_FILTERED
	BEQ ..fail

	LDA.w .shortcut_routine+2,X
	BPL ..forsnes

..forsa1
	PHA
	LDA.w #SA1SideShortcut
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
	dw ..pracmenushortcut, Shortcut_EnterPracticeMenu&!CPU_SIDE
	dw !config_ctrl_load_last_preset, Shortcut_LoadLastPreset&!CPU_SIDE
	dw !config_ctrl_save_state, Shortcut_SaveState&!CPU_SIDE
	dw !config_ctrl_load_state, Shortcut_LoadState&!CPU_SIDE
	dw !config_ctrl_reset_segment_timer, Shortcut_ResetSegmentTimer&!SA1_SIDE
	dw !config_ctrl_somaria_pits, Shortcut_ShowPits&!CPU_SIDE
	dw !config_ctrl_fix_vram, Shortcut_FixGraphics&!CPU_SIDE
	dw !config_ctrl_toggle_switch, Shortcut_ToggleCrystalSwitch&!CPU_SIDE
	dw !config_ctrl_fill_everything, Shortcut_FillEverything&!CPU_SIDE
	dw !config_ctrl_toggle_oob, Shortcut_ToggleOoB&!CPU_SIDE
	dw !config_ctrl_skip_text, Shortcut_SkipText&!CPU_SIDE
	dw !config_ctrl_disable_sprites, Shortcut_DisableSprites&!CPU_SIDE
	dw 0, 0

#final_static_short_PracMenuShortcut:
..pracmenushortcut
	dw $1010
