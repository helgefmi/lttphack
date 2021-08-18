GAMESTATE_SUBMENU:
%menu_header("GAME STATE", 10)

;===================================================================================================
%func("Skip text", this)
	LDA.b #$04
	STA.w $1CD4
	RTL

;===================================================================================================
%func("Remove sprites", this)
	SEP #$30
	LDA #$22 : STA $012F
	JML Sprite_DisableAll

;===================================================================================================
%submenu("Reset dungeons", cm_game_reset_dungeons_submenu)

;===================================================================================================
%submenu("Toggle bosses defeated", cm_game_state_bosses_submenu)

;===================================================================================================
%submenu("Pendants and crystals", cm_game_state_crystals_submenu)

;===================================================================================================
%submenu("Game flags", cm_submenu_game_state_flags)

;===================================================================================================
%choice_long_func_here("Follower", $7EF3CC, 15, $00D463)
	%list_item("Lonely Link")
	%list_item("Zelda")
	%list_item("Garbage")
	%list_item("Trash")
	%list_item("Old man")
	%list_item("Zelda text")
	%list_item("Blind")
	%list_item("Frog")
	%list_item("Dwarf")
	%list_item("Sign man")
	%list_item("Kiki")
	%list_item("??????")
	%list_item("Purple chest")
	%list_item("Super bomb")
	%list_item("Sasha text")

;===================================================================================================
%toggle_bit_long_customtext_here("World", !ram_gamestate_world, 2)
	%list_item("Light World")
	%list_item("Dark World")

;===================================================================================================
%choice_long_here("Progress", !ram_game_progress, 4)
	%list_item("Started")
	%list_item("Uncle")
	%list_item("Zelda")
	%list_item("Agahnim")

;===================================================================================================
%choice_long_here("Map indicator", !ram_game_map_indicator, 9)
	%list_item("Castle")
	%list_item("Kakariko")
	%list_item("Sahasrahla")
	%list_item("Pendants")
	%list_item("MS")
	%list_item("ATower")
	%list_item("Darkness")
	%list_item("Crystals")
	%list_item("GTower")


;===================================================================================================
cm_game_state_bosses_submenu:
%menu_header("BOSSES DEFEATED", 12)
	%toggle_bit_long_customtext("Armos", $7EF191, 7, bossalivetext)
	%toggle_bit_long_customtext("Lanmola", $7EF067, 7, bossalivetext)
	%toggle_bit_long_customtext("Moldorm", $7EF00F, 7, bossalivetext)
	%toggle_bit_long_customtext("Agahnim", $7EF041, 7, bossalivetext)
	%toggle_bit_long_customtext("Helmasaur", $7EF0B5, 7, bossalivetext)
	%toggle_bit_long_customtext("Blind", $7EF159, 7, bossalivetext)
	%toggle_bit_long_customtext("Mothula", $7EF053, 7, bossalivetext)
	%toggle_bit_long_customtext("Kholdstare", $7EF1BD, 7, bossalivetext)
	%toggle_bit_long_customtext("Arrghus", $7EF00D, 7, bossalivetext)
	%toggle_bit_long_customtext("Vitreous", $7EF121, 7, bossalivetext)
	%toggle_bit_long_customtext("Trinexx", $7EF149, 7, bossalivetext)
	%toggle_bit_long_customtext("Agahnim 2", $7EF01B, 7, bossalivetext)

#bossalivetext:
%list_header(2)
	%list_item("Alive")
	%list_item("Dead")

;===================================================================================================
cm_submenu_game_state_flags:
%menu_header("GAME FLAGS", 6)
	%toggle_bit_long("Uncle dead", !ram_game_flags, 0)
	%toggle_bit_long("Sanc priest", !ram_game_flags, 1)
	%toggle_bit_long("Escaped", !ram_game_flags, 2)
	%toggle_bit_long("Uncle left", !ram_game_flags, 4)
	%toggle_bit_long("Aginah", !ram_game_flags, 5)
	%toggle_bit_long("Fortune cycle", !ram_game_flags, 6)

;===================================================================================================
cm_game_state_crystals_submenu:
%menu_header("PENDANTS AND CRYSTALS", 10)
	%toggle_bit_long("Eastern", !ram_game_pendants, 2)
	%toggle_bit_long("Desert", !ram_game_pendants, 1)
	%toggle_bit_long("Hera", !ram_game_pendants, 0)
	%toggle_bit_long("Darkness", !ram_game_crystals, 1)
	%toggle_bit_long("Thieves", !ram_game_crystals, 5)
	%toggle_bit_long("Skull", !ram_game_crystals, 6)
	%toggle_bit_long("Ice", !ram_game_crystals, 2)
	%toggle_bit_long("Swamp", !ram_game_crystals, 4)
	%toggle_bit_long("Mire", !ram_game_crystals, 0)
	%toggle_bit_long("Turtle Rock", !ram_game_crystals, 4)

;===================================================================================================
cm_game_reset_dungeons_submenu:
%menu_header("RESET DUNGEONS", 14)
	%func("Escape", reset_dungeon_func)
	%func("Eastern Palace", reset_dungeon_func)
	%func("Desert Palace", reset_dungeon_func)
	%func("Tower of Hera", reset_dungeon_func)
	%func("Agahnim's Tower", reset_dungeon_func)
	%func("Palace of Darkness", reset_dungeon_func)
	%func("Swamp Palace", reset_dungeon_func)
	%func("Skull Woods", reset_dungeon_func)
	%func("Thieves' Town", reset_dungeon_func)
	%func("Ice Palace", reset_dungeon_func)
	%func("Misery Mire", reset_dungeon_func)
	%func("Turtle Rock", reset_dungeon_func)
	%func("Ganon's Tower", reset_dungeon_func)
	%func("Other", reset_dungeon_func)


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

#supertile_dungeons:
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

reset_dungeon_func:
	PHB : PHK : PLB
	PHD

	LDY.b SA1IRAM.cm_cursor
	LDX.w .list,Y

	REP #$30
	LDA #$0000
	TCD
	STX.b $00

	LDX.w #(256+40)*2 ; eg1 size + eg2 size, words

--	LDY.w supertile_dungeons,X
	CPY.b $00 : BNE ++
	STA.l $7EF000,X
++	DEX #2 : BPL --

	; check current room
	INC ; sets accum to #$0001
	BIT.b $1B : BEQ ++ ; make sure we're indoors

	LDA.b $A0 : ASL : TAX
	LDA.w supertile_dungeons,X
	CMP.b $00 : BNE ++
	STZ.w $0400 : STZ.w $0402 : STZ.w $0408

++	PLD
	PLB
	RTL

.list
	db !EX, !EP, !DP, !TH
	db !AT, !PD, !SP, !SW
	db !TT, !IP, !MM, !TR
	db !GT, !CV
