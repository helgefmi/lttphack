GAMEPLAY_SUBMENU:
%menu_header("GAMEPLAY", 9)

;===================================================================================================
%toggle_onoff("Skip Triforce", !config_skip_triforce_toggle)

%toggle("Disable beams", !disable_beams)

;===================================================================================================
%toggle_func_onoff_here("Lit rooms", !config_lit_rooms_toggle)
	LDA.w $001B : BEQ ++

	LDA.b #$20 : STA.w $009A
	LDA.b #$40 : STA.w $009B
	LDA.b #$80 : STA.w $009C

++	RTL

;===================================================================================================
%toggle_onoff("Fast walls", !config_fast_moving_walls)

%toggle_onoff("Visible probes", !config_probe_toggle)

%toggle_onoff("Show STC pits", !config_somaria_pits)

%toggle_bit("Disable BG1", SA1RAM.disabled_layers, 0)

%toggle_bit("Disable BG2", SA1RAM.disabled_layers, 1)

%toggle_onoff("OoB mode", $037F)