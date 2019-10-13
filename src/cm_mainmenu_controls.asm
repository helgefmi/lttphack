; RECONFIGURE CONTROLS {{{

cm_main_goto_ctrl:
	%cm_submenu("Shortcuts", cm_submenu_ctrl)

cm_submenu_ctrl:
	dw cm_ctrl_open_lttphack_menu
	dw cm_ctrl_load_last_preset
;    dw cm_ctrl_replay_last_movie
	dw cm_ctrl_save_state
	dw cm_ctrl_load_state
	dw cm_ctrl_reset_segment_timer
	dw cm_ctrl_toggle_oob
	dw cm_ctrl_skip_text
	dw cm_ctrl_disable_sprites
	dw cm_ctrl_fill_everything
	dw cm_ctrl_fix_vram
	dw cm_ctrl_somaria_pits
	dw !menu_end
	%cm_header("CONTROLLER SHORTCUTS")

cm_ctrl_open_lttphack_menu:
	%cm_ctrl_shortcut("LTTPHack menu", !ram_ctrl_prachack_menu)

cm_ctrl_load_last_preset:
	%cm_ctrl_shortcut("Load last preset", !ram_ctrl_load_last_preset)

;cm_ctrl_replay_last_movie:
;    %cm_ctrl_shortcut("Replay last movie", !ram_ctrl_replay_last_movie)

cm_ctrl_save_state:
	%cm_ctrl_shortcut("Save !statename", !ram_ctrl_save_state)

cm_ctrl_load_state:
	%cm_ctrl_shortcut("Load !statename2", !ram_ctrl_load_state)

cm_ctrl_reset_segment_timer:
	%cm_ctrl_shortcut("Reset seg timer", !ram_ctrl_reset_segment_timer)

cm_ctrl_toggle_oob:
	%cm_ctrl_shortcut("Toggle OoB", !ram_ctrl_toggle_oob)

cm_ctrl_skip_text:
	%cm_ctrl_shortcut("Skip text", !ram_ctrl_skip_text)

cm_ctrl_disable_sprites:
	%cm_ctrl_shortcut("Remove sprites", !ram_ctrl_disable_sprites)

cm_ctrl_fill_everything:
	%cm_ctrl_shortcut("Fill everything", !ram_ctrl_fill_everything)

cm_ctrl_fix_vram:
	%cm_ctrl_shortcut("VRAM repair", !ram_ctrl_fix_vram)

cm_ctrl_somaria_pits:
	%cm_ctrl_shortcut("Show somaria pits", !ram_ctrl_somaria_pits)
; }}}