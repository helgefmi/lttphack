EQUIPMENT_SUBMENU:
%menu_header("EQUIPMENT", 19)

;===================================================================================================
%numfield_long("Magic", !ram_equipment_magic_meter, 0, $80, 8)

;===================================================================================================
%numfield_long_func_prgtext("HP", !ram_equipment_curhp, 0, $A0, 8, this, cm_draw_hp)
	LDA.l !ram_equipment_curhp
	CMP.l !ram_equipment_maxhp
	BCC ..not_max

	LDA.l !ram_equipment_maxhp
	BRA ..set

..not_max
	BIT.b SA1IRAM.cm_shoulder
	BVS ..flatten
	BPL ..set

..flatten
	AND.b #$F8

..set
	STA.l !ram_equipment_curhp
	RTL

#cm_draw_hp:
	PHA ; save A
	LSR ; divide by 8 for hearts
	LSR
	LSR

	JSL CMDRAW_NUMFIELD_DEC_FROM_FUNC ; draw our max HP

	SEP #$20
	PLA
	AND.b #$07 ; get fractional
	ORA.b #$40
	JML CMDRAW_1_CHARACTER

;===================================================================================================
%numfield_func("Max HP", SA1RAM.cm_equipment_maxhp, 3, 20, 5, this)
	LDA.w SA1RAM.cm_equipment_maxhp
	ASL #3
	STA.l !ram_equipment_maxhp
	RTL

;===================================================================================================
%func("Fill rupees", this)
	REP #$20
	LDA.w #999
	STA.l $7EF360
	STA.l $7EF362
	RTL

;===================================================================================================
%func_filtered("Fill everything", gamemode_fill_everything)

;===================================================================================================
%choice_long_func_filtered_here("Sword", !ram_equipment_sword, 5, set_sword)
	%list_item("No")
	%list_item("Fighter")
	%list_item("Master")
	%list_item("Tempered")
	%list_item("Gold")

#set_sword:
	JSL DecompSwordGfx
	JML Palette_Sword

;===================================================================================================
%choice_long_func_filtered_here("Shield", !ram_equipment_shield, 4, set_shield)
	%list_item("No")
	%list_item("Fighter")
	%list_item("Red")
	%list_item("Mirror")

#set_shield:
	JSL DecompShieldGfx
	JML Palette_Shield

;===================================================================================================
%choice_long_func_filtered_here("Armor", !ram_equipment_armor, 3, Palette_Armor)
	%list_item("Green")
	%list_item("Blue")
	%list_item("Red")

;===================================================================================================
%choice_long_func_filtered_here("Gloves", !ram_equipment_gloves, 3, Palette_Armor)
	%list_item("Bare hands")
	%list_item("Power glove")
	%list_item("Titan's mitt")

;===================================================================================================
%toggle_long_func("Boots", !ram_equipment_boots, this)
	LSR
	LDA.l !ram_capabilities
	AND.b #$FB
	BCC ++
	ORA.b #$04
++	STA.l !ram_capabilities
	RTL

;===================================================================================================
%toggle_long_func("Flippers", !ram_equipment_flippers, this)
	LSR
	LDA.l !ram_capabilities
	AND.b #$FD
	BCC ++
	ORA.b #$02
++	STA.l !ram_capabilities
	RTL

;===================================================================================================
%toggle_long("Moon pearl", !ram_equipment_moon_pearl)

;===================================================================================================
%toggle_long("Half magic", !ram_equipment_half_magic)

;===================================================================================================
%numfield_long("Heart pieces", $7EF36B, 0, 3, 1)

;===================================================================================================
%add_menu_item(BOMBS_SETTER)
%numfield_long_2digits("Arrows", !ram_equipment_arrows_filler, 0, 50, 5)
%numfield_long("Keys", !ram_equipment_keys, 0, 9, 1)

;===================================================================================================
%submenu("Big keys", BIG_KEYS_SUBMENU)
%submenu("Small keys", SMALL_KEYS_SUBMENU)

;===================================================================================================
BIG_KEYS_SUBMENU:
%menu_header("BIG KEYS", 14)
	%toggle_bit_long("Sewers", !ram_game_big_keys_2, 7)
	%toggle_bit_long("Hyrule Castle", !ram_game_big_keys_2, 6)
	%toggle_bit_long("Eastern", !ram_game_big_keys_2, 5)
	%toggle_bit_long("Desert", !ram_game_big_keys_2, 4)
	%toggle_bit_long("ATower", !ram_game_big_keys_2, 3)
	%toggle_bit_long("Swamp", !ram_game_big_keys_2, 2)
	%toggle_bit_long("Darkness", !ram_game_big_keys_2, 1)
	%toggle_bit_long("Mire", !ram_game_big_keys_2, 0)
	%toggle_bit_long("Skull", !ram_game_big_keys_1, 7)
	%toggle_bit_long("Ice", !ram_game_big_keys_1, 6)
	%toggle_bit_long("Hera", !ram_game_big_keys_1, 5)
	%toggle_bit_long("Thieves", !ram_game_big_keys_1, 4)
	%toggle_bit_long("Turtle Rock", !ram_game_big_keys_1, 3)
	%toggle_bit_long("GTower", !ram_game_big_keys_1, 2)

;===================================================================================================
SMALL_KEYS_SUBMENU:
%menu_header("SMALL KEYS", 13)
	%numfield_long("Escape", $7EF37C, 0, 9, 1)
	%numfield_long("Eastern", $7EF37E, 0, 9, 1)
	%numfield_long("Desert", $7EF37F, 0, 9, 1)
	%numfield_long("Hera", $7EF386, 0, 9, 1)
	%numfield_long("ATower", $7EF380, 0, 9, 1)
	%numfield_long("Darkness", $7EF382, 0, 9, 1)
	%numfield_long("Thieves", $7EF387, 0, 9, 1)
	%numfield_long("Skull", $7EF384, 0, 9, 1)
	%numfield_long("Ice", $7EF385, 0, 9, 1)
	%numfield_long("Swamp", $7EF381, 0, 9, 1)
	%numfield_long("Mire", $7EF383, 0, 9, 1)
	%numfield_long("Turtle Rock", $7EF388, 0, 9, 1)
	%numfield_long("GTower", $7EF389, 0, 9, 1)
