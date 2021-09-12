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
	dw !config_ctrl_load_last_preset, gamemode_load_previous_preset&!CPU_SIDE
	dw !config_ctrl_save_state, gamemode_savestate_save&!CPU_SIDE
	dw !config_ctrl_load_state, gamemode_savestate_load&!CPU_SIDE
	dw !config_ctrl_reset_segment_timer, gamemode_reset_segment_timer&!SA1_SIDE
	dw !config_ctrl_somaria_pits, gamemode_somaria_pits_wrapper&!CPU_SIDE
	dw !config_ctrl_fix_vram, gamemode_fix_vram&!CPU_SIDE
	dw !config_ctrl_toggle_switch, gamemode_toggle_switch&!CPU_SIDE
	dw !config_ctrl_fill_everything, gamemode_fill_everything&!CPU_SIDE
	dw !config_ctrl_toggle_oob, gamemode_oob&!CPU_SIDE
	dw !config_ctrl_skip_text, gamemode_skip_text&!CPU_SIDE
	dw !config_ctrl_disable_sprites, gamemode_disable_sprites&!CPU_SIDE
	dw 0, 0

#final_static_short_PracMenuShortcut:
..pracmenushortcut
	dw $1010
