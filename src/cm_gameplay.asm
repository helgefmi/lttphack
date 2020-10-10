GAMEPLAY_SUBMENU:
%menu_header("GAMEPLAY", 11)

;===================================================================================================
%toggle_onoff("Skip Triforce", !ram_skip_triforce_toggle)
%toggle_onoff("NMG Sanc heart", !ram_nmg_sanctuary_heart)

;===================================================================================================
%choice_here("NMG Powder", !ram_nmg_powder, 3)
	%list_item("No")
	%list_item("Mushroom")
	%list_item("Powder")

;===================================================================================================
%toggle("Disable beams", !disable_beams)

;===================================================================================================
%toggle_func_onoff_here("Lit rooms", !ram_lit_rooms_toggle)
	ORA.w $001B
	BEQ ++

	LDA.b #$10
	STA.w $0099

++	RTL

;===================================================================================================
%toggle_onoff("Fast walls", !ram_fast_moving_walls)
%toggle_onoff("Visible probes", !ram_probe_toggle)
%toggle_onoff("See bonk items", !ram_bonk_items_toggle)

;===================================================================================================
%toggle_bit("Disable BG1", SA1RAM.disabled_layers, 0)
%toggle_bit("Disable BG2", SA1RAM.disabled_layers, 1)
%toggle_onoff("OoB mode", $037F)