macro cm_header(title)
	table ../resources/header.tbl
		db #$24, "<title>", #$FF
	table ../resources/normal.tbl
endmacro

macro cm_item(title)
	db #$24, "<title>", #$FF
endmacro

macro cm_preset(title, addr)
	dw !CM_ACTION_PRESET
	dw <addr>
	db #$24, "<title>", #$FF
endmacro

macro cm_toggle(title, addr)
	dw !CM_ACTION_TOGGLE
	dl #<addr>
	db #$24, "<title>", #$FF
endmacro

macro cm_toggle_jsr(title, addr)
	dw !CM_ACTION_TOGGLE_JSR
	dw .toggle
	dl <addr>
	db #$24, "<title>", #$FF
endmacro

macro cm_submenu(title, addr)
	dw !CM_ACTION_SUBMENU
	dl <addr>
	db #$24, "<title>", #$FF
endmacro

macro cm_numfield(title, addr, start, end, increment)
	dw !CM_ACTION_NUMFIELD
	dl <addr>
	db <start>, <end>, <increment>
	db #$24, "<title>", #$FF
endmacro

macro cm_toggle_bit(title, addr, mask)
	dw !CM_ACTION_TOGGLE_BIT
	dl <addr>
	db <mask>
	db #$24, "<title>", #$FF
endmacro

macro cm_jsr(title)
	dw !CM_ACTION_JSR
	dw .routine
	db #$24, "<title>", #$FF
endmacro

macro cm_ctrl_shortcut(title, addr)
	dw !CM_ACTION_CTRL_SHORTCUT
	dl <addr>
	db #$24, "<title>", #$FF
endmacro

macro cm_movie(title, slot)
	dw !CM_ACTION_MOVIE
	db #<slot>
	db #$00, "<title>", #$FF
endmacro

; MAIN MENU

cm_mainmenu_indices:
	dw cm_main_goto_presets
	dw cm_main_goto_items
	dw cm_main_goto_equipment
	dw cm_main_goto_game_state
	dw cm_main_goto_link_state
	dw cm_main_goto_gameplay
	dw cm_main_goto_rng_control
	dw cm_main_goto_ctrl
	dw cm_main_goto_hud
	dw cm_main_goto_config
;    dw cm_main_goto_movies
	dw !menu_end
	%cm_header("LTTPHACK !VERSION")

incsrc cm_mainmenu_items.asm
incsrc cm_mainmenu_equipment.asm
incsrc cm_mainmenu_gamestate.asm
incsrc cm_mainmenu_linkstate.asm
incsrc cm_mainmenu_gameplay.asm
incsrc cm_mainmenu_rng.asm
incsrc cm_mainmenu_controls.asm
incsrc cm_mainmenu_hud.asm
incsrc cm_mainmenu_config.asm
;incsrc cm_mainmenu_movies.asm


; PRESETS {{{

cm_main_goto_presets:
	dw !CM_ACTION_SUBMENU_VARIABLE
	dl !ram_preset_category
	db $06
	dl cm_nmg_submenu_presets
	dl cm_hundo_submenu_presets
	dl cm_lownmg_submenu_presets
	dl cm_low_submenu_presets
	dl cm_ad_submenu_presets
	dl cm_anyrmg_submenu_presets
	%cm_item("Presets")

incsrc cm_presets_nmg.asm
incsrc cm_presets_hundo.asm
incsrc cm_presets_lowleg.asm
incsrc cm_presets_ad.asm
incsrc cm_presets_anyrmg.asm

org $A58000

incsrc cm_presets_lownmg.asm

; }}}