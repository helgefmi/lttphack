; CONFIGURATION {{{
cm_main_goto_config:
	%cm_submenu("Configuration", cm_submenu_config)

cm_submenu_config:
	dw cm_gameplay_rerandomize
	dw cm_config_music
	dw cm_config_autoload_preset
	dw cm_config_preset_category
	dw cm_config_hud_font
	dw cm_config_extralag
	dw !menu_end
	%cm_header("CONFIGURATION")

cm_gameplay_rerandomize:
	%cm_toggle("Rerandomize", !ram_rerandomize_toggle)

cm_config_music:
	%cm_toggle_jsr("Music", !ram_feature_music)

.toggle
	JSL music_reload

	LDA $0130 : CMP #$FF : BEQ .muted

	STA $012C : STZ $0133

.muted

	RTS

cm_config_autoload_preset:
	%cm_toggle("Death reload", !ram_autoload_preset)

cm_config_preset_category:
	dw !CM_ACTION_CHOICE
	dl !ram_preset_category
	%cm_item("Preset cat")
	%cm_item("NMG")
	%cm_item("Hundo")
	%cm_item("Low")
	%cm_item("AD")
	db !list_end


cm_config_hud_font:
	dw !CM_ACTION_CHOICE
	dl !ram_hud_font
	%cm_item("HUD font")

	%cm_item("Classic")
	%cm_item("Normal")
	%cm_item("Italic")
	%cm_item("Mario World")
	%cm_item("DKC")
	%cm_item("ZAMN")
	%cm_item("SMT")
	%cm_item("Earthbound")

	%cm_item("FF6")
	%cm_item("Lufia 2")
	%cm_item("Goonies 2")
	%cm_item("Emerald")
	%cm_item("TI-83")
	%cm_item("Pac-Man")

	db !list_end

cm_config_extralag:
	%cm_numfield("Lag test", !ram_LAG, 1, 127, 1)
; }}}
