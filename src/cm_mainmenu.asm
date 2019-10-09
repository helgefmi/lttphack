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
	dw <addr>
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
	dw cm_main_goto_gameplay
	dw cm_main_goto_rng_control
	dw cm_main_goto_ctrl
	dw cm_main_goto_hud
	dw cm_main_goto_config
;    dw cm_main_goto_movies
	dw !menu_end
	%cm_header("LTTPHACK !VERSION")

; ITEMS {{{

cm_main_goto_items:
	%cm_submenu("Items", cm_submenu_items)

cm_submenu_items:
	dw cm_items_bow
	dw cm_items_boom
	dw cm_items_hook
	dw cm_equipment_bombs
	dw cm_items_powder
	dw cm_items_fire_rod
	dw cm_items_ice_rod
	dw cm_items_bombos
	dw cm_items_ether
	dw cm_items_quake
	dw cm_items_lantern
	dw cm_items_hammer
	dw cm_items_flute
	dw cm_items_net
	dw cm_items_book
	dw cm_items_submenu_bottles
	dw cm_items_somaria
	dw cm_items_byrna
	dw cm_items_cape
	dw cm_items_mirror
	dw !menu_end
	%cm_header("ITEMS")

cm_items_bow:
	dw !CM_ACTION_CHOICE_JSR
	dw #.set_ram_value
	dl #!ram_cm_item_bow
	%cm_item("Bow")
	%cm_item("No")
	%cm_item("Normal")
	%cm_item("Silver")
	db !list_end

.set_ram_value
	; 0 = No bow
	; 1/2 = Normal bow without/with arrows
	; 3/4 = Silver bow without/with arrows
	ASL : TAX : BEQ .end

	LDA !ram_equipment_arrows : BNE .end
	DEX
.end
	TXA : STA !ram_item_bow
	RTS

cm_items_boom:
	dw !CM_ACTION_CHOICE
	dl #!ram_item_boom
	%cm_item("Boomerang")
	%cm_item("No")
	%cm_item("Blue")
	%cm_item("Red")
	db !list_end

cm_items_hook:
	%cm_toggle("Hookshot", !ram_item_hook)

cm_items_powder:
	dw !CM_ACTION_CHOICE
	dl #!ram_item_powder
	%cm_item("Powder")
	%cm_item("No")
	%cm_item("Shroom")
	%cm_item("Powder")
	db !list_end

cm_items_fire_rod:
	%cm_toggle("Fire rod", !ram_item_fire_rod)

cm_items_ice_rod:
	%cm_toggle("Ice rod", !ram_item_ice_rod)

cm_items_bombos:
	%cm_toggle("Bombos", !ram_item_bombos)

cm_items_ether:
	%cm_toggle("Ether", !ram_item_ether)

cm_items_quake:
	%cm_toggle("Quake", !ram_item_2quake)

cm_items_lantern:
	%cm_toggle("Lantern", !ram_item_lantern)

cm_items_hammer:
	%cm_toggle("Hammer", !ram_item_hammer)

cm_items_flute:
	dw !CM_ACTION_CHOICE
	dl #!ram_item_flute
	%cm_item("Flute")
	%cm_item("No")
	%cm_item("Shovel")
	%cm_item("Flute (off)")
	%cm_item("Flute")
	db !list_end

cm_items_net:
	%cm_toggle("Net", !ram_item_net)

cm_items_book:
	%cm_toggle("Book", !ram_item_book)

cm_items_somaria:
	%cm_toggle("Somaria", !ram_item_somaria)

cm_items_byrna:
	%cm_toggle("Byrna", !ram_item_byrna)

cm_items_cape:
	%cm_toggle("Cape", !ram_item_cape)

cm_items_mirror:
	%cm_toggle_jsr("Mirror", !ram_cm_item_mirror)

.toggle
	; 0 -> 2
	ASL : STA !ram_item_mirror
	RTS

; Bottles submenu

cm_items_submenu_bottles:
	%cm_submenu("Bottles", cm_submenu_bottles)

cm_submenu_bottles:
	dw cm_items_bottle_1
	dw cm_items_bottle_2
	dw cm_items_bottle_3
	dw cm_items_bottle_4
	dw !menu_end
	%cm_header("BOTTLES")

macro bottle_contents()
	%cm_item("No bottle")
	%cm_item("Shroooom")
	%cm_item("Empty")
	%cm_item("Red")
	%cm_item("Green")
	%cm_item("Blue")
	%cm_item("Fairy")
	%cm_item("Bee")
	%cm_item("Golden bee")
	db !list_end
endmacro

cm_items_bottle_1:
	dw !CM_ACTION_CHOICE
	dl !ram_item_bottle_array
	%cm_item("Bottle 1")
	%bottle_contents()

cm_items_bottle_2:
	dw !CM_ACTION_CHOICE
	dl !ram_item_bottle_array+1
	%cm_item("Bottle 2")
	%bottle_contents()

cm_items_bottle_3:
	dw !CM_ACTION_CHOICE
	dl !ram_item_bottle_array+2
	%cm_item("Bottle 3")
	%bottle_contents()

cm_items_bottle_4:
	dw !CM_ACTION_CHOICE
	dl !ram_item_bottle_array+3
	%cm_item("Bottle 4")
	%bottle_contents()

; }}}
; EQUIPMENT {{{

cm_main_goto_equipment:
	%cm_submenu("Equipment", cm_submenu_equipment)

cm_submenu_equipment:
	dw cm_equipment_fill_magic
	dw cm_equipment_fill_hearts
	dw cm_equipment_fill_rupees

	dw cm_equipment_sword
	dw cm_equipment_shield
	dw cm_equipment_armor

	dw cm_equipment_gloves
	dw cm_equipment_boots
	dw cm_equipment_flippers
	dw cm_equipment_moon_pearl
	dw cm_equipment_half_magic

	dw cm_equipment_maxhp
	dw cm_equipment_bombs
	dw cm_equipment_arrows
	dw cm_equipment_keys
	; dw cm_equipment_goto_small_keys_submenu ; maybe?
	dw cm_equipment_goto_big_keys_submenu

	dw !menu_end
	%cm_header("EQUIPMENT")

cm_equipment_boots:
	%cm_toggle_jsr("Boots", !ram_cm_equipment_boots)

.toggle
	CMP #$00 : BEQ .set_no_boots

	LDA #$04 : ORA !ram_capabilities : STA !ram_capabilities
	LDA #$01 : STA !ram_equipment_boots_menu

	 BRA .end

.set_no_boots

	LDA !ram_capabilities : AND #$FB : STA !ram_capabilities
	LDA #$00 : STA !ram_equipment_boots_menu

.end
	RTS

cm_equipment_gloves:
	dw !CM_ACTION_CHOICE
	dl !ram_equipment_gloves
	%cm_item("Gloves")
	%cm_item("No")
	%cm_item("Power glove")
	%cm_item("Titan's mitt")
	db !list_end

cm_equipment_flippers:
	%cm_toggle_jsr("Flippers", !ram_cm_equipment_flippers)

.toggle
	CMP #$00 : BEQ .set_no_flippers

	LDA #$02 : ORA !ram_capabilities : STA !ram_capabilities
	LDA #$01 : STA !ram_equipment_flippers_menu

	 BRA .end

.set_no_flippers

	LDA !ram_capabilities : AND #$FD : STA !ram_capabilities
	LDA #$00 : STA !ram_equipment_flippers_menu

.end
	RTS

cm_equipment_moon_pearl:
	%cm_toggle("Moon pearl", !ram_equipment_moon_pearl)

cm_equipment_half_magic:
	%cm_toggle("Half magic", !ram_equipment_half_magic)

cm_equipment_sword:
	dw !CM_ACTION_CHOICE_JSR
	dw #.toggle_sword
	dl !ram_equipment_sword
	%cm_item("Sword")
	%cm_item("No")
	%cm_item("Fighter")
	%cm_item("Master")
	%cm_item("Tempered")
	%cm_item("Gold")
	db !list_end

.toggle_sword
	JSL !DecompSwordGfx
	JSL !Palette_Sword
	RTS

cm_equipment_shield:
	dw !CM_ACTION_CHOICE_JSR
	dw #.toggle_shield
	dl !ram_equipment_shield
	%cm_item("Shield")
	%cm_item("No")
	%cm_item("Fighter")
	%cm_item("Red")
	%cm_item("Mirror")
	db !list_end

.toggle_shield
	JSL !DecompShieldGfx
	JSL !Palette_Shield
	RTS

cm_equipment_armor:
	dw !CM_ACTION_CHOICE_JSR
	dw #.toggle_armor
	dl !ram_equipment_armor
	%cm_item("Armor")
	%cm_item("Green")
	%cm_item("Blue")
	%cm_item("Red")
	db !list_end

.toggle_armor
	JSL !Palette_Armor
	RTS

cm_equipment_fill_magic:
	%cm_jsr("Fill magic")

.routine
	LDA #$80 : STA !ram_equipment_magic_meter
	RTS

cm_equipment_fill_rupees:
	%cm_jsr("Fill rupees")

.routine
	%a16()
	; Sets 999 rupees.
	LDA #$03E7 : STA $7EF360
	RTS

cm_equipment_fill_hearts:
	%cm_jsr("Fill HP")

.routine
	LDA !ram_equipment_maxhp : STA !ram_equipment_curhp
	RTS

cm_equipment_maxhp:
	dw !CM_ACTION_CHOICE_JSR
	dw #.set_maxhp
	dl !ram_cm_equipment_maxhp
	%cm_item("Max HP")
	%cm_item("3")
	%cm_item("4")
	%cm_item("5")
	%cm_item("6")
	%cm_item("7")
	%cm_item("8")
	%cm_item("9")
	%cm_item("10")
	%cm_item("11")
	%cm_item("12")
	%cm_item("13")
	%cm_item("14")
	%cm_item("15")
	%cm_item("16")
	%cm_item("17")
	%cm_item("18")
	%cm_item("19")
	%cm_item("20")
	db !list_end

.set_maxhp
	INC #3
	ASL #3
	; Need to fill HP to get immediate effect
	STA !ram_equipment_maxhp : STA !ram_equipment_curhp
	RTS

cm_equipment_bombs:
	%cm_numfield("Bombs", !ram_item_bombs, #$00, #$1E, #$05)

cm_equipment_arrows:
	%cm_numfield("Arrows", !ram_equipment_arrows_filler, #$00, #$1E, #$05)

cm_equipment_keys:
	%cm_numfield("Keys", !ram_equipment_keys, #$00, #$09, #$01)

cm_equipment_goto_big_keys_submenu:
	%cm_submenu("Big keys", cm_submenu_big_keys)

cm_submenu_big_keys:
	dw cm_big_keys_sewers
	dw cm_big_keys_hc
	dw cm_big_keys_eastern
	dw cm_big_keys_desert
	dw cm_big_keys_hera
	dw cm_big_keys_aga
	dw cm_big_keys_pod
	dw cm_big_keys_thieves
	dw cm_big_keys_skull
	dw cm_big_keys_ice
	dw cm_big_keys_swamp
	dw cm_big_keys_mire
	dw cm_big_keys_trock
	dw cm_big_keys_gtower

	dw !menu_end
	%cm_header("BIG KEYS")

cm_big_keys_sewers:
	%cm_toggle_bit("Sewers", !ram_game_big_keys_2, #$80)

cm_big_keys_hc:
	%cm_toggle_bit("Hyrule Castle", !ram_game_big_keys_2, #$40)

cm_big_keys_eastern:
	%cm_toggle_bit("Eastern", !ram_game_big_keys_2, #$20)

cm_big_keys_desert:
	%cm_toggle_bit("Desert", !ram_game_big_keys_2, #$10)

cm_big_keys_aga:
	%cm_toggle_bit("ATower", !ram_game_big_keys_2, #$08)

cm_big_keys_swamp:
	%cm_toggle_bit("Swamp", !ram_game_big_keys_2, #$04)

cm_big_keys_pod:
	%cm_toggle_bit("Darkness", !ram_game_big_keys_2, #$02)

cm_big_keys_mire:
	%cm_toggle_bit("Mire", !ram_game_big_keys_2, #$01)

cm_big_keys_skull:
	%cm_toggle_bit("Skull", !ram_game_big_keys_1, #$80)

cm_big_keys_ice:
	%cm_toggle_bit("Ice", !ram_game_big_keys_1, #$40)

cm_big_keys_hera:
	%cm_toggle_bit("Hera", !ram_game_big_keys_1, #$20)

cm_big_keys_thieves:
	%cm_toggle_bit("Thieves", !ram_game_big_keys_1, #$10)

cm_big_keys_trock:
	%cm_toggle_bit("Turtle Rock", !ram_game_big_keys_1, #$08)

cm_big_keys_gtower:
	%cm_toggle_bit("GTower", !ram_game_big_keys_1, #$04)

;-----

cm_equipment_goto_small_keys_submenu:
	%cm_submenu("Small keys", cm_submenu_small_keys)

cm_submenu_small_keys:
	dw cm_small_keys_escape
	dw cm_small_keys_eastern
	dw cm_small_keys_desert
	dw cm_small_keys_hera
	dw cm_small_keys_aga
	dw cm_small_keys_pod
	dw cm_small_keys_thieves
	dw cm_small_keys_skull
	dw cm_small_keys_ice
	dw cm_small_keys_swamp
	dw cm_small_keys_mire
	dw cm_small_keys_trock
	dw cm_small_keys_gtower

	dw !menu_end
	%cm_header("SMALL KEYS")

cm_small_keys_escape:
	%cm_numfield("Escape", $7EF37C, #$00, #$09, #$01)

cm_small_keys_eastern:
	%cm_numfield("Eastern", $7EF37E, #$00, #$09, #$01)

cm_small_keys_desert:
	%cm_numfield("Desert", $7EF37F, #$00, #$09, #$01)

cm_small_keys_hera:
	%cm_numfield("Hera", $7EF386, #$00, #$09, #$01)

cm_small_keys_aga:
	%cm_numfield("ATower", $7EF380, #$00, #$09, #$01)

cm_small_keys_pod:
	%cm_numfield("Darkness", $7EF382, #$00, #$09, #$01)

cm_small_keys_thieves:
	%cm_numfield("Thieves", $7EF387, #$00, #$09, #$01)

cm_small_keys_skull:
	%cm_numfield("Skull", $7EF384, #$00, #$09, #$01)

cm_small_keys_ice:
	%cm_numfield("Ice", $7EF385, #$00, #$09, #$01)

cm_small_keys_swamp:
	%cm_numfield("Swamp", $7EF381, #$00, #$09, #$01)

cm_small_keys_mire:
	%cm_numfield("Mire", $7EF383, #$00, #$09, #$01)

cm_small_keys_trock:
	%cm_numfield("Turtle Rock", $7EF388, #$00, #$09, #$01)

cm_small_keys_gtower:
	%cm_numfield("GTower", $7EF389, #$00, #$09, #$01)


; }}}
; PRESETS {{{

cm_main_goto_presets:
	dw !CM_ACTION_SUBMENU_VARIABLE
	dl !ram_preset_category
	db $04
	dw cm_nmg_submenu_presets
	dw cm_hundo_submenu_presets
	dw cm_low_submenu_presets
	dw cm_ad_submenu_presets
	%cm_item("Presets")

incsrc cm_presets_nmg.asm
incsrc cm_presets_hundo.asm
incsrc cm_presets_low.asm
incsrc cm_presets_ad.asm

; }}}
; GAMEPLAY {{{
cm_main_goto_gameplay:
	%cm_submenu("Gameplay", cm_submenu_gameplay)

cm_submenu_gameplay:
	dw cm_gameplay_skip_triforce
	dw cm_gameplay_sanctuary
	dw cm_gameplay_disable_beams
	dw cm_gameplay_probes
	dw cm_gameplay_lit_rooms
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

cm_gameplay_shutoffbg1:
	%cm_toggle_bit("Disable BG1", !disabled_layers, #$01)

cm_gameplay_shutoffbg2:
	%cm_toggle_bit("Disable BG2", !disabled_layers, #$02)

cm_gameplay_oob:
	%cm_toggle("OoB Mode", !lowram_oob_toggle)

; }}}
; CONFIGURATION {{{
cm_main_goto_config:
	%cm_submenu("Configuration", cm_submenu_config)

cm_submenu_config:
	dw cm_gameplay_rerandomize
	dw cm_config_music
	dw cm_config_autoload_preset
	dw cm_config_preset_category
	dw cm_config_extralag
	dw !menu_end
	%cm_header("CONFIGURATION")

cm_gameplay_rerandomize:
	%cm_toggle("Rerandomize", !ram_rerandomize_toggle)

cm_config_extralag:
	%cm_numfield("Lag test", !ram_LAG, 1, 127, 1)

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
	%cm_item("Preset Cat")
	%cm_item("NMG")
	%cm_item("Hundo")
	%cm_item("Low")
	%cm_item("AD")
	db !list_end
; }}}
; MOVIES {{{

;cm_main_goto_movies:
;    %cm_submenu("Movies", cm_submenu_movies)
;
;cm_submenu_movies:
;    dw cm_movie_1
;    dw cm_movie_2
;    dw cm_movie_3
;    dw cm_movie_4
;    dw cm_movie_5
;    dw cm_movie_6
;    dw cm_movie_7
;    dw cm_movie_8
;    dw cm_movie_9
;    dw cm_movie_10
;    dw cm_movie_11
;    dw cm_movie_12
;    dw cm_movie_13
;    dw cm_movie_14
;    dw cm_movie_15
;    dw cm_movie_16
;    dw !menu_end
;    %cm_header("MOVIES")
;
;cm_movie_1:
;    %cm_movie("Movie 01 (0000 bytes)", 0)
;
;cm_movie_2:
;    %cm_movie("Movie 02 (0000 bytes)", 1)
;
;cm_movie_3:
;    %cm_movie("Movie 03 (0000 bytes)", 2)
;
;cm_movie_4:
;    %cm_movie("Movie 04 (0000 bytes)", 3)
;
;cm_movie_5:
;    %cm_movie("Movie 05 (0000 bytes)", 4)
;
;cm_movie_6:
;    %cm_movie("Movie 06 (0000 bytes)", 5)
;
;cm_movie_7:
;    %cm_movie("Movie 07 (0000 bytes)", 6)
;
;cm_movie_8:
;    %cm_movie("Movie 08 (0000 bytes)", 7)
;
;cm_movie_9:
;    %cm_movie("Movie 09 (0000 bytes)", 8)
;
;cm_movie_10:
;    %cm_movie("Movie 10 (0000 bytes)", 9)
;
;cm_movie_11:
;    %cm_movie("Movie 11 (0000 bytes)", 10)
;
;cm_movie_12:
;    %cm_movie("Movie 12 (0000 bytes)", 11)
;
;cm_movie_13:
;    %cm_movie("Movie 13 (0000 bytes)", 12)
;
;cm_movie_14:
;    %cm_movie("Movie 14 (0000 bytes)", 13)
;
;cm_movie_15:
;    %cm_movie("Movie 15 (0000 bytes)", 14)
;
;cm_movie_16:
;    %cm_movie("Movie 16 (0000 bytes)", 15)

; }}}
; HUD EXTRAS {{{

cm_main_goto_hud:
	%cm_submenu("HUD extras", cm_submenu_hud)

cm_submenu_hud:
	dw cm_hud_input_display
	dw cm_hud_real
	dw cm_hud_lag
	dw cm_hud_idle
	dw cm_hud_segment
	dw cm_hud_xy
	dw cm_hud_subpixels
	dw cm_hud_qw
	dw cm_hud_lanmola_cycle_count
	dw cm_hud_lagometer
	dw cm_hud_enemy_hp
	dw cm_hud_misslots
	dw !menu_end
	%cm_header("HUD EXTRAS")

cm_hud_real:
	%cm_toggle("Room time", !ram_counters_real)

cm_hud_lag:
	%cm_toggle("Lag counter", !ram_counters_lag)

cm_hud_idle:
	%cm_toggle("Idle frames", !ram_counters_idle)

cm_hud_segment:
	%cm_toggle("Segment time", !ram_counters_segment)

cm_hud_xy:
	dw !CM_ACTION_CHOICE
	dl #!ram_xy_toggle
	%cm_item("Coordinates")
	%cm_item("No")
	%cm_item("Hexadecimal")
	%cm_item("Decimal")
	db !list_end

cm_hud_subpixels:
	dw !CM_ACTION_CHOICE
	dl #!ram_subpixels_toggle
	%cm_item("Subpixels")
	%cm_item("No")
	%cm_item("Subpixels")
	%cm_item("Speed")
	db !list_end

cm_hud_lagometer:
	%cm_toggle_jsr("Lagometer", !ram_lagometer_toggle)

.toggle
	%a16()
	  LDA #$207F : STA $7EC742 : STA $7EC782 : STA $7EC7C2 : STA $7EC802
	RTS

cm_hud_input_display:
	%cm_toggle_jsr("Input display", !ram_input_display_toggle)

.toggle
	%a16()
	LDA #$207F
	STA !POS_MEM_INPUT_DISPLAY_TOP+0 : STA !POS_MEM_INPUT_DISPLAY_TOP+2
	STA !POS_MEM_INPUT_DISPLAY_TOP+4 : STA !POS_MEM_INPUT_DISPLAY_TOP+6
	STA !POS_MEM_INPUT_DISPLAY_TOP+8 : STA !POS_MEM_INPUT_DISPLAY_BOT+0
	STA !POS_MEM_INPUT_DISPLAY_BOT+2 : STA !POS_MEM_INPUT_DISPLAY_BOT+4
	STA !POS_MEM_INPUT_DISPLAY_BOT+6 : STA !POS_MEM_INPUT_DISPLAY_BOT+8

	RTS

cm_hud_enemy_hp:
	%cm_toggle_jsr("Enemy HP", !ram_enemy_hp_toggle)

.toggle
	%ai16()
	LDA #$207F : STA !POS_MEM_ENEMY_HEART_GFX
	LDX.w #!POS_ENEMY_HEARTS : STA $7EC700, X : STA $7EC702, X
	RTS

cm_hud_qw:
	%cm_toggle_jsr("QW indicator", !ram_qw_toggle)

.toggle
	%a16()
	LDA #$207F : STA $7EC80A
	LDA #$207F : STA $7EC80C
	RTS

cm_hud_lanmola_cycle_count:
	%cm_toggle_jsr("Lanmola cycs", !ram_toggle_lanmola_cycles)

.toggle
	%a8()
	LDA #$00
	STA !ram_lanmola_cycles
	STA !ram_lanmola_cycles+1
	STA !ram_lanmola_cycles+2
	RTS

cm_hud_misslots:
	%cm_toggle("Misslots RAM", !ram_misslots_toggle)

; }}}
; GAME STATE {{{

cm_main_goto_game_state:
	%cm_submenu("Game state", cm_submenu_game_state)

cm_submenu_game_state:
	dw cm_game_state_skip_text
	dw cm_game_state_disable_sprites
	dw cm_game_state_reset_screen
	dw cm_game_state_goto_reset_dungeons_submenu
	dw cm_game_state_goto_bosses_submenu
	dw cm_game_state_goto_crystals_submenu
	dw cm_game_state_goto_flags_submenu
	dw cm_game_state_world
	dw cm_game_state_progress
	dw cm_game_state_map_indicator
	dw cm_game_state_crystal_switch
	dw cm_game_state_armed_eg
	dw cm_game_state_eg_strength
	dw !menu_end
	%cm_header("GAME STATE")

cm_game_state_world:
	dw !CM_ACTION_TOGGLE_BIT_TEXT
	dl !ram_cm_gamestate_world
	db $40
	db #$24, "World", #$FF
	%cm_item("Light World")
	%cm_item("Dark World")
	db !list_end

cm_game_state_crystal_switch:
	dw !CM_ACTION_CHOICE_JSR
	dw #.update_tilemap
	dl #!ram_cm_crystal_switch
	%cm_item("Switch Color")
	%cm_item("Red")
	%cm_item("Blue")
	db !list_end

.update_tilemap
	STA $7EC172
	CMP !ram_cm_old_crystal_switch : BEQ .skip

	LDA !ram_cm_old_gamemode : CMP #$07 : BNE .done
	LDA !ram_cm_old_submode : BNE .done

	LDA #$16 : STA !ram_cm_old_submode

	RTS

.skip
	LDA #$00 : STA !ram_cm_old_submode

.done
	RTS

cm_game_state_armed_eg:
	%cm_toggle_jsr("Armed EG", !ram_cm_armed_eg)

.toggle
	LDA !ram_cm_armed_eg : STA $7E047A
	RTS

cm_game_state_eg_strength:
	dw !CM_ACTION_CHOICE
	dl !ram_eg_strength
	%cm_item("EG strength")
	%cm_item("EG 0")
	%cm_item("Strong")
	%cm_item("Weak")
	db !list_end

cm_game_state_reset_screen:
	%cm_jsr("Reset current room")

.routine
	LDA $1B : BEQ .overworld

	STZ $0400 : STZ $0401 : STZ $0402 : STZ $0403 : STZ $0408
	LDA $A0 : ASL : TAX
	LDA #$00 : STA $7EF000, X
	BRA .end

.overworld
	LDX $8A
	LDA #$00 : STA $7EF280, X

.end
	LDA #$09 : STA $012F
	RTS

!EX = $01 ; escape
!EP = $02 ; eastern palace
!DP = $03 ; desert palace
!TH = $04 ; tower of hera

!AT = $0A ; aga's tower

!PD = $11 ; palace of darkness
!SP = $12 ; swamp palace
!SW = $13 ; skull woods
!TT = $14 ; thieves' town
!IP = $15 ; ice palace
!MM = $16 ; misery mire
!TR = $17 ; turtle rock
!GT = $18 ; ganon's tower

!CV = $FF ; caves and houses
!UU = !CV ; unused caves, just for convenience

macro reset_dungeon(dungeon, id)
	dw !CM_ACTION_JSR
	dw ?routine
	db #$24, "<dungeon>", #$FF

?routine:
	LDA #$09 : STA $012F
	LDA #<id>
	JMP reset_dungeon
endmacro

cm_game_state_goto_reset_dungeons_submenu:
	%cm_submenu("Reset dungeons", cm_game_reset_dungeons_submenu)

cm_game_reset_dungeons_submenu:
	dw cm_game_state_dungeons_escape
	dw cm_game_state_dungeons_eastern_palace
	dw cm_game_state_dungeons_desert_palace
	dw cm_game_state_dungeons_tower_of_hera
	dw cm_game_state_dungeons_aga_tower
	dw cm_game_state_dungeons_palace_of_darkness
	dw cm_game_state_dungeons_swamp_palace
	dw cm_game_state_dungeons_skull_woods
	dw cm_game_state_dungeons_thieves_town
	dw cm_game_state_dungeons_ice_palace
	dw cm_game_state_dungeons_misery_mire
	dw cm_game_state_dungeons_turtle_rock
	dw cm_game_state_dungeons_ganons_tower
	dw cm_game_state_dungeons_caves
	dw !menu_end
	%cm_header("RESET DUNGEONS")


cm_game_state_dungeons_escape:
	%reset_dungeon("Escape", !EX)

cm_game_state_dungeons_eastern_palace:
	%reset_dungeon("Eastern Palace", !EP)

cm_game_state_dungeons_desert_palace:
	%reset_dungeon("Desert Palace", !DP)

cm_game_state_dungeons_tower_of_hera:
	%reset_dungeon("Tower of Hera", !TH)

cm_game_state_dungeons_aga_tower:
	%reset_dungeon("Agahnim's Tower", !AT)

cm_game_state_dungeons_palace_of_darkness:
	%reset_dungeon("Palace of Darkness", !PD)

cm_game_state_dungeons_swamp_palace:
	%reset_dungeon("Swamp Palace", !SP)

cm_game_state_dungeons_skull_woods:
	%reset_dungeon("Skull Woods", !SW)

cm_game_state_dungeons_thieves_town:
	%reset_dungeon("Thieves' Town", !TT)

cm_game_state_dungeons_ice_palace:
	%reset_dungeon("Ice Palace", !IP)

cm_game_state_dungeons_misery_mire:
	%reset_dungeon("Misery Mire", !MM)

cm_game_state_dungeons_turtle_rock:
	%reset_dungeon("Turtle Rock", !TR)

cm_game_state_dungeons_ganons_tower:
	%reset_dungeon("Ganon's Tower", !GT)

cm_game_state_dungeons_caves:
	%reset_dungeon("Other", !CV)

supertile_dungeons:
	; eg1
	dw !CV, !EX, !EX, !CV, !TR, !UU, !SP, !TH, !CV, !PD, !PD, !PD, !GT, !GT, !IP, !UU
	dw !CV, !EX, !EX, !TR, !TR, !TR, !SP, !TH, !CV, !PD, !PD, !PD, !GT, !GT, !IP, !IP
	dw !AT, !EX, !EX, !TR, !TR, !UU, !SP, !TH, !SP, !SW, !PD, !PD, !CV, !UU, !IP, !CV
	dw !AT, !TH, !EX, !DP, !SP, !SP, !SP, !SP, !SP, !SW, !PD, !PD, !CV, !GT, !IP, !IP
	dw !AT, !EX, !EX, !DP, !TT, !TT, !SP, !UU, !UU, !SW, !PD, !PD, !GT, !GT, !IP, !IP
	dw !EX, !EX, !EX, !DP, !SP, !CV, !SW, !SW, !SW, !SW, !PD, !GT, !GT, !GT, !IP, !IP
	dw !EX, !EX, !EX, !DP, !TT, !TT, !SP, !SW, !SW, !UU, !PD, !GT, !GT, !GT, !IP, !UU
	dw !EX, !EX, !EX, !DP, !DP, !DP, !SP, !TH, !UU, !UU, !UU, !GT, !GT, !GT, !IP, !IP
	dw !EX, !EX, !EX, !DP, !DP, !DP, !UU, !TH, !UU, !EP, !UU, !GT, !GT, !GT, !IP, !UU
	dw !MM, !MM, !MM, !MM, !UU, !GT, !GT, !MM, !MM, !EP, !UU, !GT, !GT, !GT, !IP, !IP
	dw !MM, !MM, !MM, !MM, !TR, !GT, !GT, !TH, !EP, !EP, !EP, !TT, !TT, !UU, !IP, !IP
	dw !AT, !MM, !MM, !MM, !TR, !TR, !TR, !TR, !EP, !EP, !EP, !TT, !TT, !UU, !IP, !IP
	dw !AT, !MM, !MM, !MM, !TR, !TR, !TR, !TR, !EP, !EP, !UU, !TT, !TT, !UU, !IP, !UU
	dw !AT, !MM, !MM, !CV, !CV, !TR, !TR, !UU, !EP, !EP, !EP, !TT, !TT, !UU, !IP, !CV
	dw !AT, !CV, !CV, !CV, !CV, !CV, !CV, !CV, !CV, !UU, !CV, !CV, !UU, !CV, !CV, !CV
	dw !CV, !CV, !CV, !CV, !CV, !CV, !UU, !UU, !CV, !CV, !CV, !CV, !UU, !CV, !CV, !CV

	; eg 2
	dw !CV, !CV, !CV, !CV, !CV, !CV, !CV, !CV, !CV, !CV, !CV, !CV, !CV, !CV, !CV, !CV
	dw !CV, !CV, !CV, !CV, !CV, !CV, !CV, !CV, !CV, !CV, !CV, !CV, !CV, !CV, !CV, !CV
	dw !CV, !CV, !CV, !CV, !CV, !CV, !CV, !CV

reset_dungeon:
	PHB : PHK : PLB
	%ai16()
	AND #$00FF
	STA $00
	LDA #$0000

	LDX.w #(256+40)*2 ; eg1 size + eg2 size, words

--	LDY supertile_dungeons, X
	CPY $00 : BNE ++
	STA $7EF000, X
++	DEX #2 : BPL --

	; check current room
	INC ; sets accum to #$0001
	BIT $1B : BEQ ++ ; make sure we're indoors

	LDA $A0 : ASL : TAX
	LDA supertile_dungeons, X
	CMP $00 : BNE ++
	STZ $0400 : STZ $0402 : STZ $0408

++	PLB : RTS

cm_game_state_progress:
	dw !CM_ACTION_CHOICE
	dl !ram_game_progress
	%cm_item("Progress")
	%cm_item("Started")
	%cm_item("Uncle")
	%cm_item("Zelda")
	%cm_item("Agahnim")
	db !list_end

cm_game_state_map_indicator:
	dw !CM_ACTION_CHOICE
	dl !ram_game_map_indicator
	%cm_item("Map indicator")
	%cm_item("Castle")
	%cm_item("Kakariko")
	%cm_item("Sahasrahla")
	%cm_item("Pendants")
	%cm_item("MS")
	%cm_item("ATower")
	%cm_item("Darkness")
	%cm_item("Crystals")
	%cm_item("GTower")
	db !list_end

cm_game_state_goto_flags_submenu:
	%cm_submenu("Game flags", cm_submenu_game_state_flags)

cm_submenu_game_state_flags:
	dw cm_game_state_flags_uncle
	dw cm_game_state_flags_sanc_priest
	dw cm_game_state_flags_escaped
	dw cm_game_state_flags_uncle_left_home
	dw cm_game_state_flags_talked_to_aginah
	dw cm_game_state_flags_fortune_teller_cycle
	dw !menu_end
	%cm_header("GAME FLAGS")

cm_game_state_flags_uncle:
	%cm_toggle_bit("Uncle dead", !ram_game_flags, #$01)

cm_game_state_flags_sanc_priest:
	%cm_toggle_bit("Sanc priest", !ram_game_flags, #$02)

cm_game_state_flags_escaped:
	%cm_toggle_bit("Escaped", !ram_game_flags, #$04)

cm_game_state_flags_uncle_left_home:
	%cm_toggle_bit("Uncle left", !ram_game_flags, #$10)

cm_game_state_flags_talked_to_aginah:
	%cm_toggle_bit("Aginah", !ram_game_flags, #$20)

cm_game_state_flags_fortune_teller_cycle:
	%cm_toggle_bit("Fortune cycle", !ram_game_flags, #$40)

cm_game_state_goto_bosses_submenu:
	%cm_submenu("Toggle bosses defeated", cm_game_state_bosses_submenu)

cm_game_state_bosses_submenu:
	dw cm_game_state_bosses_armos
	dw cm_game_state_bosses_lanmolas
	dw cm_game_state_bosses_moldorm
	dw cm_game_state_bosses_agahnim
	dw cm_game_state_bosses_helma
	dw cm_game_state_bosses_blind
	dw cm_game_state_bosses_mothula
	dw cm_game_state_bosses_kholdstare
	dw cm_game_state_bosses_arrghus
	dw cm_game_state_bosses_vitty
	dw cm_game_state_bosses_trinexx
	dw cm_game_state_bosses_agahnim_2
	dw !menu_end
	%cm_header("BOSSES DEFEATED")

cm_game_state_bosses_armos:
	%cm_toggle_bit("Armos", $7EF191, #$08)

cm_game_state_bosses_lanmolas:
	%cm_toggle_bit("Lanmola", $7EF067, #$08)

cm_game_state_bosses_moldorm:
	%cm_toggle_bit("Moldorm", $7EF00F, #$08)

cm_game_state_bosses_agahnim:
	%cm_toggle_bit("Agahnim", $7EF041, #$08)

cm_game_state_bosses_helma:
	%cm_toggle_bit("Helmasaur", $7EF0B5, #$08)

cm_game_state_bosses_blind:
	%cm_toggle_bit("Blind", $7EF159, #$08)

cm_game_state_bosses_mothula:
	%cm_toggle_bit("Mothula", $7EF053, #$08)

cm_game_state_bosses_kholdstare:
	%cm_toggle_bit("Kholdstare", $7EF1BD, #$08)

cm_game_state_bosses_arrghus:
	%cm_toggle_bit("Arrghus", $7EF00D, #$08)

cm_game_state_bosses_vitty:
	%cm_toggle_bit("Vitreous", $7EF121, #$08)

cm_game_state_bosses_trinexx:
	%cm_toggle_bit("Trinexx", $7EF149, #$08)

cm_game_state_bosses_agahnim_2:
	%cm_toggle_bit("Agahnim 2", $7EF01B, #$08)

cm_game_state_goto_crystals_submenu:
	%cm_submenu("Pendants and crystals", cm_game_state_crystals_submenu)

cm_game_state_crystals_submenu:
	dw cm_game_state_pendant_eastern
	dw cm_game_state_pendant_desert
	dw cm_game_state_pendant_hera
	dw cm_game_state_crystal_pod
	dw cm_game_state_crystal_theives
	dw cm_game_state_crystal_skull
	dw cm_game_state_crystal_ice
	dw cm_game_state_crystal_swamp
	dw cm_game_state_crystal_mire
	dw cm_game_state_crystal_trock
	dw !menu_end
	%cm_header("PENDANTS AND CRYSTALS")

cm_game_state_pendant_eastern:
	%cm_toggle_bit("Eastern", !ram_game_pendants, #$04)

cm_game_state_pendant_desert:
	%cm_toggle_bit("Desert", !ram_game_pendants, #$02)

cm_game_state_pendant_hera:
	%cm_toggle_bit("Hera", !ram_game_pendants, #$01)

cm_game_state_crystal_pod:
	%cm_toggle_bit("Darkness", !ram_game_crystals, #$02)

cm_game_state_crystal_theives:
	%cm_toggle_bit("Thieves", !ram_game_crystals, #$20)

cm_game_state_crystal_skull:
	%cm_toggle_bit("Skull", !ram_game_crystals, #$40)

cm_game_state_crystal_ice:
	%cm_toggle_bit("Ice", !ram_game_crystals, #$04)

cm_game_state_crystal_swamp:
	%cm_toggle_bit("Swamp", !ram_game_crystals, #$10)

cm_game_state_crystal_mire:
	%cm_toggle_bit("Mire", !ram_game_crystals, #$01)

cm_game_state_crystal_trock:
	%cm_toggle_bit("Turtle Rock", !ram_game_crystals, #$08)

cm_game_state_disable_sprites:
	%cm_jsr("Remove sprites")

.routine
	%ai8()
	JSL !Sprite_DisableAll
	RTS

cm_game_state_skip_text:
	%cm_jsr("Skip text")

.routine
	LDA #$04 : STA $1CD4
	RTS

; }}}
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
; RNG CONTROL {{{

cm_main_goto_rng_control:
	%cm_submenu("RNG control", cm_submenu_rng_control)

cm_submenu_rng_control:
	dw cm_rng_drops
	dw cm_rng_pokey
	dw cm_rng_agahnim
	dw cm_rng_helmasaur
	dw cm_rng_ganon_warp
	dw cm_rng_ganon_warp_location
	dw cm_rng_eyegore
	dw cm_rng_arrghus
	dw cm_rng_turtles
	dw cm_rng_cannonballs
	dw cm_rng_soldiers
	dw cm_rng_lanmola
	dw cm_rng_conveyor
	dw !menu_end
	%cm_header("RNG CONTROL")

cm_rng_pokey:
	dw !CM_ACTION_CHOICE
	dl !ram_pokey_rng
	%cm_item("Pokeys")
	%cm_item("Random")
	%cm_item("ul ul")
	%cm_item("ur ul")
	%cm_item("dr ul")
	%cm_item("dl ul")
	%cm_item("ul ur")
	%cm_item("ur ur")
	%cm_item("dr ur")
	%cm_item("dl ur")
	%cm_item("ul dr")
	%cm_item("ur dr")
	%cm_item("dr dr")
	%cm_item("dl dr")
	%cm_item("ul dl")
	%cm_item("ur dl")
	%cm_item("dr dl")
	%cm_item("dl dl")
	db !list_end

cm_rng_agahnim:
	dw !CM_ACTION_CHOICE
	dl !ram_agahnim_rng
	%cm_item("Agahnim")
	%cm_item("Random")
	%cm_item("Yellow")
	%cm_item("Blue")
	db !list_end

cm_rng_helmasaur:
	dw !CM_ACTION_CHOICE
	dl !ram_helmasaur_rng
	%cm_item("Helmasaur")
	%cm_item("Random")
	%cm_item("No fireball")
	%cm_item("Fireball")
	db !list_end

cm_rng_ganon_warp:
	dw !CM_ACTION_CHOICE
	dl !ram_ganon_warp_rng
	%cm_item("Ganon warps")
	%cm_item("Random")
	%cm_item("No warp")
	%cm_item("Warp")
	db !list_end

cm_rng_ganon_warp_location:
	dw !CM_ACTION_CHOICE
	dl !ram_ganon_warp_location_rng
	%cm_item("Ganon warp to")
	%cm_item("Random")
	%cm_item("Far left")
	%cm_item("Bottom left")
	%cm_item("Bottom right")
	%cm_item("Far right")
	db !list_end

cm_rng_eyegore:
	dw !CM_ACTION_CHOICE
	dl !ram_eyegore_rng
	%cm_item("Eyegore walk")
	%cm_item("Random")
	%cm_item("Short")
	%cm_item("Medium")
	%cm_item("Long")
	db !list_end

cm_rng_arrghus:
	dw !CM_ACTION_CHOICE
	dl !ram_arrghus_rng
	%cm_item("Arrghus walk")
	%cm_item("Random")
	%cm_item("Shortest")
	%cm_item("Short")
	%cm_item("Medium")
	%cm_item("Long")
	%cm_item("Longest")
	db !list_end

cm_rng_turtles:
	dw !CM_ACTION_CHOICE
	dl !ram_turtles_rng
	%cm_item("Turtles walk")
	%cm_item("Random")
	%cm_item("Shortest")
	%cm_item("01")
	%cm_item("02")
	%cm_item("03")
	%cm_item("04")
	%cm_item("05")
	%cm_item("06")
	%cm_item("07")
	%cm_item("08")
	%cm_item("09")
	%cm_item("0A")
	%cm_item("0B")
	%cm_item("0C")
	%cm_item("0D")
	%cm_item("0E")
	%cm_item("0F")
	%cm_item("10")
	%cm_item("11")
	%cm_item("12")
	%cm_item("13")
	%cm_item("14")
	%cm_item("15")
	%cm_item("16")
	%cm_item("17")
	%cm_item("18")
	%cm_item("19")
	%cm_item("1A")
	%cm_item("1B")
	%cm_item("1C")
	%cm_item("1D")
	%cm_item("1E")
	%cm_item("Slowest")
	db !list_end

cm_rng_cannonballs:
	dw !CM_ACTION_CHOICE
	dl !ram_cannonballs_rng
	%cm_item("Cannonballs")
	%cm_item("Random")
	%cm_item("00")
	%cm_item("01")
	%cm_item("02")
	%cm_item("03")
	%cm_item("04")
	%cm_item("05")
	%cm_item("06")
	%cm_item("07")
	%cm_item("08")
	%cm_item("09")
	%cm_item("0A")
	%cm_item("0B")
	%cm_item("0C")
	%cm_item("0D")
	%cm_item("0E")
	%cm_item("0F")
	%cm_item("10")
	%cm_item("11")
	%cm_item("12")
	%cm_item("13")
	%cm_item("14")
	%cm_item("15")
	%cm_item("16")
	%cm_item("17")
	%cm_item("18")
	%cm_item("19")
	%cm_item("1A")
	%cm_item("1B")
	%cm_item("1C")
	%cm_item("1D")
	%cm_item("1E")
	%cm_item("1F")
	db !list_end

cm_rng_soldiers:
	dw !CM_ACTION_CHOICE
	dl !ram_soldiers_rng
	%cm_item("Soldiers")
	%cm_item("Random")
	%cm_item("00")
	%cm_item("01")
	%cm_item("02")
	%cm_item("03")
	%cm_item("04")
	%cm_item("05")
	%cm_item("06")
	%cm_item("07")
	%cm_item("08")
	%cm_item("09")
	%cm_item("0A")
	%cm_item("0B")
	%cm_item("0C")
	%cm_item("0D")
	%cm_item("0E")
	%cm_item("0F")
	%cm_item("10")
	%cm_item("11")
	%cm_item("12")
	%cm_item("13")
	%cm_item("14")
	%cm_item("15")
	%cm_item("16")
	%cm_item("17")
	%cm_item("18")
	%cm_item("19")
	%cm_item("1A")
	%cm_item("1B")
	%cm_item("1C")
	%cm_item("1D")
	%cm_item("1E")
	%cm_item("1F")
	db !list_end


cm_rng_lanmola:
	dw !CM_ACTION_CHOICE
	dl !ram_lanmola_rng
	%cm_item("Lanmola exit")
	%cm_item("Random")
	%cm_item("0,0")
	%cm_item("0,1")
	%cm_item("0,2")
	%cm_item("0,3")
	%cm_item("0,4")
	%cm_item("0,5")
	%cm_item("0,6")
	%cm_item("0,7")
	%cm_item("1,0")
	%cm_item("1,1")
	%cm_item("1,2")
	%cm_item("1,3")
	%cm_item("1,4")
	%cm_item("1,5")
	%cm_item("1,6")
	%cm_item("1,7")
	%cm_item("2,0")
	%cm_item("2,1")
	%cm_item("2,2")
	%cm_item("2,3")
	%cm_item("2,4")
	%cm_item("2,5")
	%cm_item("2,6")
	%cm_item("2,7")
	%cm_item("3,0")
	%cm_item("3,1")
	%cm_item("3,2")
	%cm_item("3,3")
	%cm_item("3,4")
	%cm_item("3,5")
	%cm_item("3,6")
	%cm_item("3,7")
	%cm_item("4,0")
	%cm_item("4,1")
	%cm_item("4,2")
	%cm_item("4,3")
	%cm_item("4,4")
	%cm_item("4,5")
	%cm_item("4,6")
	%cm_item("4,7")
	%cm_item("5,0")
	%cm_item("5,1")
	%cm_item("5,2")
	%cm_item("5,3")
	%cm_item("5,4")
	%cm_item("5,5")
	%cm_item("5,6")
	%cm_item("5,7")
	%cm_item("6,0")
	%cm_item("6,1")
	%cm_item("6,2")
	%cm_item("6,3")
	%cm_item("6,4")
	%cm_item("6,5")
	%cm_item("6,6")
	%cm_item("6,7")
	%cm_item("7,0")
	%cm_item("7,1")
	%cm_item("7,2")
	%cm_item("7,3")
	%cm_item("7,4")
	%cm_item("7,5")
	%cm_item("7,6")
	%cm_item("7,7")
	db !list_end

cm_rng_conveyor:
	dw !CM_ACTION_CHOICE
	dl !ram_conveyor_rng
	%cm_item("Conveyor belt")
	%cm_item("Random")
	%cm_item("Right")
	%cm_item("Left")
	%cm_item("Down")
	%cm_item("Up")
	db !list_end

cm_rng_drops:
	dw !CM_ACTION_CHOICE
	dl !ram_drop_rng
	%cm_item("Prize packs")
	%cm_item("Vanilla")
	%cm_item("Always")
	%cm_item("Never")
	db !list_end

; }}}
