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