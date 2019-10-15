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
	dw !menu_end
	%cm_header("GAME STATE")

cm_game_state_world:
	dw !CM_ACTION_TOGGLE_BIT_TEXT
	dl !ram_cm_gamestate_world
	db $40
	%cm_item("World")
	%cm_item("Light World")
	%cm_item("Dark World")
	db !list_end

cm_game_state_crystal_switch:
	dw !CM_ACTION_CHOICE_JSR
	dw .update_tilemap
	dl !ram_cm_crystal_switch
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
	LDA #$22 : STA $012F
	JSL !Sprite_DisableAll
	RTS

cm_game_state_skip_text:
	%cm_jsr("Skip text")

.routine
	LDA #$04 : STA $1CD4
	RTS

; }}}