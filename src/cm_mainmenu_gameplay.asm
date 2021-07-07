; GAMEPLAY {{{
cm_main_goto_gameplay:
	%cm_submenu("Gameplay", cm_submenu_gameplay)

cm_submenu_gameplay:
	dw cm_gameplay_skip_triforce
	dw cm_gameplay_sanctuary
	dw cm_gameplay_disable_beams
	dw cm_gameplay_lit_rooms
	dw cm_gameplay_fast_moving_walls
	dw cm_gameplay_probes
	dw cm_gameplay_bonk_items
	dw cm_gameplay_shutoffbg1
	dw cm_gameplay_shutoffbg2
	dw cm_gameplay_oob
	dw !menu_end
	%cm_header("GAMEPLAY")

cm_gameplay_skip_triforce:
	%cm_toggle("Skip Triforce", !ram_skip_triforce_toggle)

cm_gameplay_sanctuary:
	%cm_toggle("Sanc heart", !ram_sanctuary_heart)

cm_gameplay_disable_beams:
	%cm_toggle("Disable beams", !disable_beams)

cm_gameplay_probes:
	%cm_toggle("Visible probes", !ram_probe_toggle)

cm_gameplay_bonk_items:
	%cm_toggle("See bonk items", !ram_bonk_items_toggle)

cm_gameplay_lit_rooms:
	%cm_toggle_jsr("Lit rooms", !ram_lit_rooms_toggle)
.toggle
	LDA !ram_lit_rooms_toggle : ORA $1B : BEQ .leaveon
	LDA #$10 : STA $99
.leaveon
	RTS

cm_gameplay_fast_moving_walls:
	%cm_toggle("Fast walls", !ram_fast_moving_walls)

cm_gameplay_shutoffbg1:
	%cm_toggle_bit("Disable BG1", !disabled_layers, #$01)

cm_gameplay_shutoffbg2:
	%cm_toggle_bit("Disable BG2", !disabled_layers, #$02)

cm_gameplay_oob:
	%cm_toggle("OoB mode", !lowram_oob_toggle)

; }}}