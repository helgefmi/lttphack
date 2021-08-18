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

	LDA.b #$21 : STA.w $012F

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
	%list_item("None")
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
%toggle_bit_long_customtext_here("World", $7EF3CA, 6)
	%list_item("Dark World")
	%list_item("Light World")

;===================================================================================================
%choice_long_here("Progress", $7EF3C5, 4)
	%list_item("Started")
	%list_item("Uncle")
	%list_item("Zelda")
	%list_item("Agahnim")

;===================================================================================================
%choice_long_here("Map indicator", $7EF3C7, 9)
	%list_item("Castle")
	%list_item("Kakariko")
	%list_item("Sahasrahla")
	%list_item("Pendants")
	%list_item("Pedestal")
	%list_item("Tower")
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
	%list_item("Dead")
	%list_item("Alive")

;===================================================================================================
cm_submenu_game_state_flags:
%menu_header("GAME FLAGS", 12)
	%toggle_bit_long("Uncle dead", $7EF3C6, 0)
	%toggle_bit_long("Sanc priest", $7EF3C6, 1)
	%toggle_bit_long("Escaped", $7EF3C6, 2)
	%toggle_bit_long("Uncle left", $7EF3C6, 4)
	%toggle_bit_long("Aginah", $7EF3C6, 5)
	%toggle_bit_long("Fortune cycle", $7EF3C6, 6)

	%toggle_bit_long("Hobo bottle", $7EF3C9, 0)
	%toggle_bit_long("Vendor bottle", $7EF3C9, 1)
	%toggle_bit_long("Stumpy", $7EF3C9, 3)
	%toggle_bit_long("Purple chest", $7EF3C9, 4)
	%toggle_bit_long("Smithy rescued", $7EF3C9, 5)
	%toggle_bit_long("Tempering", $7EF3C9, 7)

;===================================================================================================
cm_game_state_crystals_submenu:
%menu_header("PENDANTS AND CRYSTALS", 10)
	%toggle_bit_long("Eastern", $7EF374, 2)
	%toggle_bit_long("Desert", $7EF374, 1)
	%toggle_bit_long("Hera", $7EF374, 0)
	%toggle_bit_long("Darkness", $7EF37A, 1)
	%toggle_bit_long("Thieves", $7EF37A, 5)
	%toggle_bit_long("Skull", $7EF37A, 6)
	%toggle_bit_long("Ice", $7EF37A, 2)
	%toggle_bit_long("Swamp", $7EF37A, 4)
	%toggle_bit_long("Mire", $7EF37A, 0)
	%toggle_bit_long("Turtle Rock", $7EF37A, 4)

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
	db !EX
	db !EP
	db !DP
	db !TH
	db !AT
	db !PD
	db !SP
	db !SW
	db !TT
	db !IP
	db !MM
	db !TR
	db !GT
	db !CV
