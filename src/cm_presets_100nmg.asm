;===================================================================================================
; PRESET DATA HEADER
;===================================================================================================
presetheader_100nmg:
	dw presetSRAM_100nmg ; location of SRAM
	dw presetpersistent_100nmg ; location of persistent data

;===================================================================================================
%menu_header("100% NMG", 17)
	%submenu("Escape", presetmenu_100nmg_escape)
	%submenu("Eastern Palace", presetmenu_100nmg_eastern_palace)
	%submenu("Desert Palace", presetmenu_100nmg_desert_palace)
	%submenu("Tower of Hera", presetmenu_100nmg_tower_of_hera)
	%submenu("Agahnim's Tower", presetmenu_100nmg_agahnims_tower)
	%submenu("Palace of Darkness", presetmenu_100nmg_palace_of_darkness)
	%submenu("Minigames", presetmenu_100nmg_minigames)
	%submenu("Thieves' Town", presetmenu_100nmg_thieves_town)
	%submenu("Skull Woods", presetmenu_100nmg_skull_woods)
	%submenu("Ice Palace", presetmenu_100nmg_ice_palace)
	%submenu("Misery Mire", presetmenu_100nmg_misery_mire)
	%submenu("Swamp Palace", presetmenu_100nmg_swamp_palace)
	%submenu("Collection", presetmenu_100nmg_collection)
	%submenu("Turtle Rock", presetmenu_100nmg_turtle_rock)
	%submenu("Ganon's Tower", presetmenu_100nmg_ganons_tower)
	%submenu("Ganon", presetmenu_100nmg_ganon)
	%submenu("Bosses", presetmenu_100nmg_boss)

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; ESCAPE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_100nmg_escape:
%menu_header("Escape", 16)

;---------------------------------------------------------------------------------------------------
%preset_UW("Link's Bed", "100nmg", "escape", "links_bed")
dw $0104 ; Screen ID
dw $0940, $215A ; Link Coords
dw $0900, $2110 ; Camera HV
db $00 ; Item
db $02 ; Direction
;-----------------------------
db $00 ; Entrance
db $02 ; Room layout
db $00 ; Floor
db $00 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside", "100nmg", "escape", "outside")
dw $002C ; Screen ID
dw $08B8, $0AFB ; Link Coords
dw $0832, $0A9D ; Camera HV
db $00 ; Item
db $02 ; Direction
;-----------------------------
dw $08BF, $0B0A ; Scroll X,Y
dw $0506 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Uncle", "100nmg", "escape", "uncle")
dw $0055 ; Screen ID
dw $0B9F, $0A96 ; Link Coords
dw $0B00, $0A10 ; Camera HV
db $00 ; Item
db $00 ; Direction
;-----------------------------
db $7D ; Entrance
db $81 ; Room layout
db $FF ; Floor
db $00 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Courtyard", "100nmg", "escape", "courtyard")
dw $0055 ; Screen ID
dw $0A78, $0BE1 ; Link Coords
dw $0A00, $0B10 ; Camera HV
db $00 ; Item
db $02 ; Direction
;-----------------------------
db $7D ; Entrance
db $82 ; Room layout
db $FF ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "100nmg", "escape", "entrance")
dw $001B ; Screen ID
dw $07F8, $06FA ; Link Coords
dw $0784, $069C ; Camera HV
db $00 ; Item
db $00 ; Direction
;-----------------------------
dw $0803, $0709 ; Scroll X,Y
dw $0532 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("1st Key Guard", "100nmg", "escape", "1st_key_guard")
dw $0001 ; Screen ID
dw $02F8, $0050 ; Link Coords
dw $0280, $0000 ; Camera HV
db $00 ; Item
db $00 ; Direction
;-----------------------------
db $04 ; Entrance
db $80 ; Room layout
db $00 ; Floor
db $00 ; Door / Peg state
db $01 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Stealth Room", "100nmg", "escape", "stealth_room")
dw $0082 ; Screen ID
dw $040A, $1178 ; Link Coords
dw $0400, $110B ; Camera HV
db $00 ; Item
db $04 ; Direction
;-----------------------------
db $04 ; Entrance
db $C2 ; Room layout
db $FF ; Floor
db $00 ; Door / Peg state
db $01 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE064, $0001) ; Room $72 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("2nd Key Guard", "100nmg", "escape", "2nd_key_guard")
dw $0071 ; Screen ID
dw $02C8, $0F78 ; Link Coords
dw $0200, $0F0B ; Camera HV
db $00 ; Item
db $06 ; Direction
;-----------------------------
db $04 ; Entrance
db $02 ; Room layout
db $FF ; Floor
db $02 ; Door / Peg state
db $01 ; Layer
dw $0001 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Ball 'n Chains", "100nmg", "escape", "ball_n_chains")
dw $0070 ; Screen ID
dw $0050, $0E20 ; Link Coords
dw $0000, $0E00 ; Camera HV
db $00 ; Item
db $00 ; Direction
;-----------------------------
db $04 ; Entrance
db $00 ; Room layout
db $FE ; Floor
db $00 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE062, $0003) ; Room $72 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Backtracking", "100nmg", "escape", "backtracking")
dw $0080 ; Screen ID
dw $0050, $1020 ; Link Coords
dw $0000, $1000 ; Camera HV
db $09 ; Item
db $00 ; Direction
;-----------------------------
db $04 ; Entrance
db $80 ; Room layout
db $FD ; Floor
db $00 ; Door / Peg state
db $00 ; Layer
dw $0006 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE062, $0003) ; Room $72 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Key Guard Revisited", "100nmg", "escape", "key_guard_revisited")
dw $0072 ; Screen ID
dw $04F8, $0F14 ; Link Coords
dw $0480, $0F00 ; Camera HV
db $09 ; Item
db $00 ; Direction
;-----------------------------
db $04 ; Entrance
db $82 ; Room layout
db $FF ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Throne Room", "100nmg", "escape", "throne_room")
dw $0061 ; Screen ID
dw $02F8, $0C30 ; Link Coords
dw $0280, $0C00 ; Camera HV
db $09 ; Item
db $00 ; Direction
;-----------------------------
db $04 ; Entrance
db $C0 ; Room layout
db $00 ; Floor
db $00 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Snake Avoidance Room", "100nmg", "escape", "snake_avoidance_room")
dw $0041 ; Screen ID
dw $03A8, $0820 ; Link Coords
dw $0300, $0800 ; Camera HV
db $09 ; Item
db $00 ; Direction
;-----------------------------
db $04 ; Entrance
db $C1 ; Room layout
db $01 ; Floor
db $00 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Sewer Rooms", "100nmg", "escape", "sewer_rooms")
dw $0032 ; Screen ID
dw $04F8, $0614 ; Link Coords
dw $0480, $0600 ; Camera HV
db $09 ; Item
db $00 ; Direction
;-----------------------------
db $04 ; Entrance
db $C0 ; Room layout
db $FF ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0002 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Key Rat", "100nmg", "escape", "key_rat")
dw $0021 ; Screen ID
dw $02F8, $0514 ; Link Coords
dw $0280, $0500 ; Camera HV
db $09 ; Item
db $00 ; Direction
;-----------------------------
db $04 ; Entrance
db $82 ; Room layout
db $FF ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Into Sanctuary", "100nmg", "escape", "into_sanctuary")
dw $0011 ; Screen ID
dw $0378, $0220 ; Link Coords
dw $0300, $0200 ; Camera HV
db $09 ; Item
db $00 ; Direction
;-----------------------------
db $04 ; Entrance
db $41 ; Room layout
db $FF ; Floor
db $00 ; Door / Peg state
db $00 ; Layer
dw $0050 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; EASTERN PALACE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_100nmg_eastern_palace:
%menu_header("Eastern Palace", 14)

;---------------------------------------------------------------------------------------------------
%preset_UW("Before Cutscene", "100nmg", "eastern_palace", "before_cutscene")
dw $0002 ; Screen ID
dw $04F8, $01BF ; Link Coords
dw $0480, $0110 ; Camera HV
db $09 ; Item
db $02 ; Direction
;-----------------------------
db $04 ; Entrance
db $82 ; Room layout
db $00 ; Floor
db $01 ; Door / Peg state
db $01 ; Layer
dw $0010 ; Dead sprites
;-----------------------------
%write8_enable()
%write8($7E0642, $01) ; Room puzzle state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("After Cutscene", "100nmg", "eastern_palace", "after_cutscene")
dw $0012 ; Screen ID
dw $04F8, $0277 ; Link Coords
dw $0480, $020A ; Camera HV
db $09 ; Item
db $02 ; Direction
;-----------------------------
db $04 ; Entrance
db $C0 ; Room layout
db $00 ; Floor
db $00 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Octorok Overworld", "100nmg", "eastern_palace", "octorok_overworld")
dw $001D ; Screen ID
dw $0B10, $07E2 ; Link Coords
dw $0A9E, $071E ; Camera HV
db $09 ; Item
db $02 ; Direction
;-----------------------------
dw $0B1B, $078B ; Scroll X,Y
dw $0894 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Eastern Overworld", "100nmg", "eastern_palace", "eastern_overworld")
dw $002E ; Screen ID
dw $0C90, $0A05 ; Link Coords
dw $0C1E, $0A00 ; Camera HV
db $09 ; Item
db $00 ; Direction
;-----------------------------
dw $0C9B, $0A6D ; Scroll X,Y
dw $0002 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "100nmg", "eastern_palace", "entrance")
dw $001E ; Screen ID
dw $0F50, $062A ; Link Coords
dw $0EDE, $0600 ; Camera HV
db $09 ; Item
db $00 ; Direction
;-----------------------------
dw $0F5B, $066F ; Scroll X,Y
dw $005A ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Stalfos Room", "100nmg", "eastern_palace", "stalfos_room")
dw $00A8 ; Screen ID
dw $110A, $1578 ; Link Coords
dw $1100, $150B ; Camera HV
db $09 ; Item
db $04 ; Direction
;-----------------------------
db $08 ; Entrance
db $43 ; Room layout
db $00 ; Floor
db $02 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Big Chest Room 1", "100nmg", "eastern_palace", "big_chest_room_1")
dw $00A8 ; Screen ID
dw $11CD, $1478 ; Link Coords
dw $1100, $140B ; Camera HV
db $09 ; Item
db $06 ; Direction
;-----------------------------
db $08 ; Entrance
db $41 ; Room layout
db $00 ; Floor
db $02 ; Door / Peg state
db $01 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Dark Key Room", "100nmg", "eastern_palace", "dark_key_room")
dw $00BA ; Screen ID
dw $14E7, $1678 ; Link Coords
dw $1400, $160B ; Camera HV
db $09 ; Item
db $06 ; Direction
;-----------------------------
db $08 ; Entrance
db $00 ; Room layout
db $00 ; Floor
db $82 ; Door / Peg state
db $00 ; Layer
dw $0010 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Big Key Damage Boost", "100nmg", "eastern_palace", "big_key_damage_boost")
dw $00B9 ; Screen ID
dw $120A, $1678 ; Link Coords
dw $1200, $160B ; Camera HV
db $09 ; Item
db $04 ; Direction
;-----------------------------
db $08 ; Entrance
db $C0 ; Room layout
db $00 ; Floor
db $02 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Big Chest Room 2", "100nmg", "eastern_palace", "big_chest_room_2")
dw $00A8 ; Screen ID
dw $11CD, $1478 ; Link Coords
dw $1100, $140B ; Camera HV
db $09 ; Item
db $06 ; Direction
;-----------------------------
db $08 ; Entrance
db $41 ; Room layout
db $00 ; Floor
db $02 ; Door / Peg state
db $01 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Gifted with Greenies", "100nmg", "eastern_palace", "gifted_with_greenies")
dw $00A9 ; Screen ID
dw $12F8, $1414 ; Link Coords
dw $1280, $1400 ; Camera HV
db $09 ; Item
db $00 ; Direction
;-----------------------------
db $08 ; Entrance
db $C0 ; Room layout
db $00 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pot Room", "100nmg", "eastern_palace", "pot_room")
dw $0099 ; Screen ID
dw $1278, $1320 ; Link Coords
dw $1200, $1300 ; Camera HV
db $03 ; Item
db $00 ; Direction
;-----------------------------
db $08 ; Entrance
db $82 ; Room layout
db $00 ; Floor
db $00 ; Door / Peg state
db $00 ; Layer
dw $0008 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Zeldagamer Room", "100nmg", "eastern_palace", "zeldagamer_room")
dw $00D9 ; Screen ID
dw $120A, $1B78 ; Link Coords
dw $1200, $1B0B ; Camera HV
db $03 ; Item
db $04 ; Direction
;-----------------------------
db $08 ; Entrance
db $02 ; Room layout
db $01 ; Floor
db $82 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Armos", "100nmg", "eastern_palace", "armos")
dw $00D8 ; Screen ID
dw $1178, $1A14 ; Link Coords
dw $1100, $1A00 ; Camera HV
db $03 ; Item
db $00 ; Direction
;-----------------------------
db $08 ; Entrance
db $01 ; Room layout
db $01 ; Floor
db $81 ; Door / Peg state
db $00 ; Layer
dw $07FF ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; DESERT PALACE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_100nmg_desert_palace:
%menu_header("Desert Palace", 16)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Eastern Palace", "100nmg", "desert_palace", "outside_eastern_palace")
dw $001E ; Screen ID
dw $0F50, $062B ; Link Coords
dw $0ED6, $0600 ; Camera HV
db $03 ; Item
db $02 ; Direction
;-----------------------------
dw $0F5B, $066D ; Scroll X,Y
dw $005A ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Eastern Palace Spinspeed", "100nmg", "desert_palace", "eastern_palace_spinspeed")
dw $0105 ; Screen ID
dw $0A78, $21E1 ; Link Coords
dw $0A00, $2110 ; Camera HV
db $03 ; Item
db $02 ; Direction
;-----------------------------
db $45 ; Entrance
db $02 ; Room layout
db $00 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write16_enable()
%write16($7EC140, $001E) ; Entrance caching
%write16($7EC142, $0016) ; Entrance caching
%write16($7EC144, $06D7) ; Entrance caching
%write16($7EC146, $0C76) ; Entrance caching
%write16($7EC148, $0736) ; Entrance caching
%write16($7EC14A, $0CF0) ; Entrance caching
%write16($7EC14C, $001E) ; Entrance caching
%write16($7EC14E, $0710) ; Entrance caching
%write16($7EC150, $0744) ; Entrance caching
%write16($7EC152, $0CFB) ; Entrance caching
%write16($7EC154, $0600) ; Entrance caching
%write16($7EC156, $091E) ; Entrance caching
%write16($7EC158, $0C00) ; Entrance caching
%write16($7EC15A, $0F00) ; Entrance caching
%write16($7EC15C, $0520) ; Entrance caching
%write16($7EC15E, $0A00) ; Entrance caching
%write16($7EC160, $0B00) ; Entrance caching
%write16($7EC162, $1000) ; Entrance caching
%write16($7EC164, $2000) ; Entrance caching
%write16($7EC166, $0525) ; Entrance caching
%write16($7EC16A, $0009) ; Entrance caching
%write16($7EC16C, $FFF7) ; Entrance caching
%write16($7EC16E, $000A) ; Entrance caching
%write16($7EC170, $FFF6) ; Entrance caching
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Bridge Screen", "100nmg", "desert_palace", "bridge_screen")
dw $002E ; Screen ID
dw $0C08, $0A68 ; Link Coords
dw $0C00, $0A0A ; Camera HV
db $03 ; Item
db $04 ; Direction
;-----------------------------
dw $0C85, $0A77 ; Scroll X,Y
dw $0000 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Unholy Spinspeed", "100nmg", "desert_palace", "unholy_spinspeed")
dw $002A ; Screen ID
dw $0408, $0B98 ; Link Coords
dw $0400, $0B1E ; Camera HV
db $03 ; Item
db $00 ; Direction
;-----------------------------
dw $0485, $0B8D ; Scroll X,Y
dw $0900 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Holy Spinspeed", "100nmg", "desert_palace", "holy_spinspeed")
dw $0107 ; Screen ID
dw $0E78, $21E1 ; Link Coords
dw $0E00, $2110 ; Camera HV
db $03 ; Item
db $02 ; Direction
;-----------------------------
db $49 ; Entrance
db $02 ; Room layout
db $00 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write16_enable()
%write16($7EC140, $0029) ; Entrance caching
%write16($7EC142, $0016) ; Entrance caching
%write16($7EC144, $0A14) ; Entrance caching
%write16($7EC146, $0200) ; Entrance caching
%write16($7EC148, $0A77) ; Entrance caching
%write16($7EC14A, $0278) ; Entrance caching
%write16($7EC14C, $0029) ; Entrance caching
%write16($7EC14E, $0100) ; Entrance caching
%write16($7EC150, $0A83) ; Entrance caching
%write16($7EC152, $0285) ; Entrance caching
%write16($7EC154, $0A00) ; Entrance caching
%write16($7EC156, $0B1E) ; Entrance caching
%write16($7EC158, $0200) ; Entrance caching
%write16($7EC15A, $0300) ; Entrance caching
%write16($7EC15C, $0920) ; Entrance caching
%write16($7EC15E, $0C00) ; Entrance caching
%write16($7EC160, $0100) ; Entrance caching
%write16($7EC162, $0400) ; Entrance caching
%write16($7EC164, $2000) ; Entrance caching
%write16($7EC166, $092A) ; Entrance caching
%write16($7EC16A, $000A) ; Entrance caching
%write16($7EC16C, $FFF6) ; Entrance caching
%write16($7EC16E, $0000) ; Entrance caching
%write16($7EC170, $0000) ; Entrance caching
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Water Dash", "100nmg", "desert_palace", "water_dash")
dw $002C ; Screen ID
dw $08D0, $0BE2 ; Link Coords
dw $085E, $0B1E ; Camera HV
db $03 ; Item
db $02 ; Direction
;-----------------------------
dw $08DB, $0B8D ; Scroll X,Y
dw $090A ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Dam Dash", "100nmg", "desert_palace", "dam_dash")
dw $003C ; Screen ID
dw $0808, $0E28 ; Link Coords
dw $0800, $0E00 ; Camera HV
db $03 ; Item
db $04 ; Direction
;-----------------------------
dw $087D, $0E6D ; Scroll X,Y
dw $0000 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Desert Palace", "100nmg", "desert_palace", "outside_desert_palace")
dw $003A ; Screen ID
dw $040A, $0F88 ; Link Coords
dw $0400, $0F1E ; Camera HV
db $03 ; Item
db $04 ; Direction
;-----------------------------
dw $0485, $0F8B ; Scroll X,Y
dw $0880 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "100nmg", "desert_palace", "entrance")
dw $0030 ; Screen ID
dw $0128, $0CB9 ; Link Coords
dw $00AA, $0C57 ; Camera HV
db $0C ; Item
db $00 ; Direction
;-----------------------------
dw $012F, $0CC4 ; Scroll X,Y
dw $0294 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Key Bonk", "100nmg", "desert_palace", "key_bonk")
dw $0073 ; Screen ID
dw $0778, $0F14 ; Link Coords
dw $0700, $0F00 ; Camera HV
db $0C ; Item
db $00 ; Direction
;-----------------------------
db $09 ; Entrance
db $03 ; Room layout
db $FF ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pre Cannonball Room", "100nmg", "desert_palace", "pre_cannonball_room")
dw $0085 ; Screen ID
dw $0AE8, $1078 ; Link Coords
dw $0A00, $100B ; Camera HV
db $0C ; Item
db $06 ; Direction
;-----------------------------
db $09 ; Entrance
db $40 ; Room layout
db $FF ; Floor
db $02 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pot Room", "100nmg", "desert_palace", "pot_room")
dw $0073 ; Screen ID
dw $070A, $0F78 ; Link Coords
dw $0700, $0F0B ; Camera HV
db $0C ; Item
db $04 ; Direction
;-----------------------------
db $09 ; Entrance
db $03 ; Room layout
db $FF ; Floor
db $02 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Desert Ledge", "100nmg", "desert_palace", "desert_ledge")
dw $0083 ; Screen ID
dw $0678, $11E1 ; Link Coords
dw $0600, $1110 ; Camera HV
db $0C ; Item
db $02 ; Direction
;-----------------------------
db $09 ; Entrance
db $02 ; Room layout
db $FF ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Popo Genocide", "100nmg", "desert_palace", "popo_genocide")
dw $0053 ; Screen ID
dw $0678, $0AE1 ; Link Coords
dw $0600, $0A10 ; Camera HV
db $0C ; Item
db $02 ; Direction
;-----------------------------
db $0C ; Entrance
db $00 ; Room layout
db $01 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Torches", "100nmg", "desert_palace", "torches")
dw $0043 ; Screen ID
dw $0778, $0914 ; Link Coords
dw $0700, $0900 ; Camera HV
db $0C ; Item
db $00 ; Direction
;-----------------------------
db $0C ; Entrance
db $03 ; Room layout
db $01 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Lanmolas", "100nmg", "desert_palace", "lanmolas")
dw $0043 ; Screen ID
dw $0678, $0814 ; Link Coords
dw $0600, $0800 ; Camera HV
db $09 ; Item
db $00 ; Direction
;-----------------------------
db $0C ; Entrance
db $80 ; Room layout
db $01 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; TOWER OF HERA
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_100nmg_tower_of_hera:
%menu_header("Tower of Hera", 18)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Desert Palace", "100nmg", "tower_of_hera", "outside_desert_palace")
dw $0030 ; Screen ID
dw $0128, $0C3B ; Link Coords
dw $00A2, $0C00 ; Camera HV
db $01 ; Item
db $02 ; Direction
;-----------------------------
dw $012F, $0C6D ; Scroll X,Y
dw $0016 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Aginah Cave", "100nmg", "tower_of_hera", "aginah_cave")
dw $0030 ; Screen ID
dw $0328, $0D2A ; Link Coords
dw $02A6, $0CCC ; Camera HV
db $01 ; Item
db $00 ; Direction
;-----------------------------
dw $0333, $0D39 ; Scroll X,Y
dw $06D4 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Fake Flippers", "100nmg", "tower_of_hera", "fake_flippers")
dw $003C ; Screen ID
dw $09E6, $0FA8 ; Link Coords
dw $0900, $0F1E ; Camera HV
db $01 ; Item
db $06 ; Direction
;-----------------------------
dw $097D, $0F8B ; Scroll X,Y
dw $0820 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Bonk Rocks", "100nmg", "tower_of_hera", "bonk_rocks")
dw $0012 ; Screen ID
dw $04B8, $0468 ; Link Coords
dw $0432, $040A ; Camera HV
db $01 ; Item
db $00 ; Direction
;-----------------------------
dw $04BF, $0477 ; Scroll X,Y
dw $0088 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Boulder Lift", "100nmg", "tower_of_hera", "boulder_lift")
dw $0012 ; Screen ID
dw $0590, $0405 ; Link Coords
dw $0500, $0400 ; Camera HV
db $01 ; Item
db $00 ; Direction
;-----------------------------
dw $0585, $046D ; Scroll X,Y
dw $0020 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Old Man Cave", "100nmg", "tower_of_hera", "old_man_cave")
dw $000A ; Screen ID
dw $05A8, $02CA ; Link Coords
dw $0500, $0266 ; Camera HV
db $01 ; Item
db $00 ; Direction
;-----------------------------
dw $0585, $02D5 ; Scroll X,Y
dw $03A0 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Death Mountain", "100nmg", "tower_of_hera", "death_mountain")
dw $00F1 ; Screen ID
dw $0378, $1FE1 ; Link Coords
dw $0300, $1F10 ; Camera HV
db $01 ; Item
db $02 ; Direction
;-----------------------------
db $06 ; Entrance
db $C3 ; Room layout
db $00 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("After Mirror", "100nmg", "tower_of_hera", "after_mirror")
dw $0003 ; Screen ID
dw $0715, $03C0 ; Link Coords
dw $06A1, $031E ; Camera HV
db $01 ; Item
db $06 ; Direction
;-----------------------------
dw $0720, $038D ; Scroll X,Y
dw $1816 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Spectacle Rock Choice", "100nmg", "tower_of_hera", "spectacle_rock_choice")
dw $0003 ; Screen ID
dw $07B4, $01DF ; Link Coords
dw $0740, $017B ; Camera HV
db $01 ; Item
db $02 ; Direction
;-----------------------------
dw $07BF, $01EA ; Scroll X,Y
dw $0AAA ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Quickhop", "100nmg", "tower_of_hera", "quickhop")
dw $0003 ; Screen ID
dw $0819, $0149 ; Link Coords
dw $07A7, $00E6 ; Camera HV
db $14 ; Item
db $00 ; Direction
;-----------------------------
dw $0826, $0155 ; Scroll X,Y
dw $06B8 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "100nmg", "tower_of_hera", "entrance")
dw $0003 ; Screen ID
dw $08F0, $007A ; Link Coords
dw $087C, $0017 ; Camera HV
db $14 ; Item
db $00 ; Direction
;-----------------------------
dw $08FB, $0086 ; Scroll X,Y
dw $0050 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Tile Room", "100nmg", "tower_of_hera", "tile_room")
dw $0077 ; Screen ID
dw $0E78, $0E38 ; Link Coords
dw $0E00, $0E00 ; Camera HV
db $14 ; Item
db $00 ; Direction
;-----------------------------
db $33 ; Entrance
db $C0 ; Room layout
db $01 ; Floor
db $00 ; Door / Peg state
db $01 ; Layer
dw $0001 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mini Moldorm Room", "100nmg", "tower_of_hera", "mini_moldorm_room")
dw $0087 ; Screen ID
dw $0EE7, $1078 ; Link Coords
dw $0E00, $100C ; Camera HV
db $14 ; Item
db $06 ; Direction
;-----------------------------
db $33 ; Entrance
db $00 ; Room layout
db $00 ; Floor
db $92 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Torches", "100nmg", "tower_of_hera", "torches")
dw $0087 ; Screen ID
dw $0F78, $10E1 ; Link Coords
dw $0F00, $1010 ; Camera HV
db $14 ; Item
db $02 ; Direction
;-----------------------------
db $33 ; Entrance
db $01 ; Room layout
db $00 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Beetles", "100nmg", "tower_of_hera", "beetles")
dw $0077 ; Screen ID
dw $0F68, $0F48 ; Link Coords
dw $0EF0, $0EDC ; Camera HV
db $14 ; Item
db $00 ; Direction
;-----------------------------
db $33 ; Entrance
db $C3 ; Room layout
db $01 ; Floor
db $00 ; Door / Peg state
db $01 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Petting Zoo", "100nmg", "tower_of_hera", "petting_zoo")
dw $0031 ; Screen ID
dw $03B8, $0670 ; Link Coords
dw $0300, $0603 ; Camera HV
db $14 ; Item
db $00 ; Direction
;-----------------------------
db $33 ; Entrance
db $81 ; Room layout
db $02 ; Floor
db $10 ; Door / Peg state
db $00 ; Layer
dw $0580 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Bumper Skip", "100nmg", "tower_of_hera", "bumper_skip")
dw $0027 ; Screen ID
dw $0E38, $0471 ; Link Coords
dw $0E00, $0404 ; Camera HV
db $03 ; Item
db $00 ; Direction
;-----------------------------
db $33 ; Entrance
db $C0 ; Room layout
db $03 ; Floor
db $10 ; Door / Peg state
db $00 ; Layer
dw $0064 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Moldorm", "100nmg", "tower_of_hera", "moldorm")
dw $0017 ; Screen ID
dw $0FA8, $0270 ; Link Coords
dw $0F00, $0203 ; Camera HV
db $03 ; Item
db $00 ; Direction
;-----------------------------
db $33 ; Entrance
db $C1 ; Room layout
db $04 ; Floor
db $10 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; AGAHNIM'S TOWER
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_100nmg_agahnims_tower:
%menu_header("Agahnim's Tower", 16)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Hera", "100nmg", "agahnims_tower", "outside_hera")
dw $0003 ; Screen ID
dw $08F0, $007B ; Link Coords
dw $087C, $0017 ; Camera HV
db $03 ; Item
db $02 ; Direction
;-----------------------------
dw $08FB, $0086 ; Scroll X,Y
dw $0050 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Lumberjacks", "100nmg", "agahnims_tower", "lumberjacks")
dw $00E6 ; Screen ID
dw $0C78, $1DE1 ; Link Coords
dw $0C00, $1D10 ; Camera HV
db $03 ; Item
db $02 ; Direction
;-----------------------------
db $2F ; Entrance
db $C2 ; Room layout
db $00 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Lost Woods", "100nmg", "agahnims_tower", "lost_woods")
dw $0002 ; Screen ID
dw $0408, $007D ; Link Coords
dw $0400, $0019 ; Camera HV
db $03 ; Item
db $00 ; Direction
;-----------------------------
dw $048D, $0088 ; Scroll X,Y
dw $0100 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("After Grove", "100nmg", "agahnims_tower", "after_grove")
dw $0000 ; Screen ID
dw $00A0, $00CA ; Link Coords
dw $0022, $006A ; Camera HV
db $03 ; Item
db $02 ; Direction
;-----------------------------
dw $00A7, $00D9 ; Scroll X,Y
dw $0384 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("After Lost Woods", "100nmg", "agahnims_tower", "after_lost_woods")
dw $0000 ; Screen ID
dw $0388, $03E2 ; Link Coords
dw $0300, $031E ; Camera HV
db $03 ; Item
db $02 ; Direction
;-----------------------------
dw $038D, $038B ; Scroll X,Y
dw $17E0 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Castle Screen", "100nmg", "agahnims_tower", "castle_screen")
dw $001A ; Screen ID
dw $05E6, $0728 ; Link Coords
dw $0500, $06CA ; Camera HV
db $03 ; Item
db $06 ; Direction
;-----------------------------
dw $0585, $0737 ; Scroll X,Y
dw $0620 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Castle Entrance", "100nmg", "agahnims_tower", "castle_entrance")
dw $001B ; Screen ID
dw $07F8, $06FA ; Link Coords
dw $0786, $0698 ; Camera HV
db $03 ; Item
db $00 ; Direction
;-----------------------------
dw $0803, $0705 ; Scroll X,Y
dw $0530 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Tower Entrance", "100nmg", "agahnims_tower", "tower_entrance")
dw $001B ; Screen ID
dw $07F8, $065A ; Link Coords
dw $077E, $0600 ; Camera HV
db $03 ; Item
db $00 ; Direction
;-----------------------------
dw $0803, $066D ; Scroll X,Y
dw $0030 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Prize Pack Guards", "100nmg", "agahnims_tower", "prize_pack_guards")
dw $00E0 ; Screen ID
dw $00E8, $1C78 ; Link Coords
dw $0000, $1C0B ; Camera HV
db $03 ; Item
db $06 ; Direction
;-----------------------------
db $24 ; Entrance
db $00 ; Room layout
db $01 ; Floor
db $82 ; Door / Peg state
db $00 ; Layer
dw $0003 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Dark Maze", "100nmg", "agahnims_tower", "dark_maze")
dw $00D0 ; Screen ID
dw $010A, $1A78 ; Link Coords
dw $0100, $1A0B ; Camera HV
db $03 ; Item
db $04 ; Direction
;-----------------------------
db $24 ; Entrance
db $01 ; Room layout
db $02 ; Floor
db $02 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Dark Catwalk", "100nmg", "agahnims_tower", "dark_catwalk")
dw $00C0 ; Screen ID
dw $010A, $1978 ; Link Coords
dw $0100, $190B ; Camera HV
db $03 ; Item
db $04 ; Direction
;-----------------------------
db $24 ; Entrance
db $03 ; Room layout
db $03 ; Floor
db $02 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spear Guards", "100nmg", "agahnims_tower", "spear_guards")
dw $00C0 ; Screen ID
dw $0178, $1820 ; Link Coords
dw $0100, $1800 ; Camera HV
db $03 ; Item
db $00 ; Direction
;-----------------------------
db $24 ; Entrance
db $01 ; Room layout
db $03 ; Floor
db $00 ; Door / Peg state
db $00 ; Layer
dw $000C ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Red Alert II", "100nmg", "agahnims_tower", "red_alert_ii")
dw $00B0 ; Screen ID
dw $010A, $1678 ; Link Coords
dw $0100, $160B ; Camera HV
db $03 ; Item
db $04 ; Direction
;-----------------------------
db $24 ; Entrance
db $01 ; Room layout
db $04 ; Floor
db $82 ; Door / Peg state
db $00 ; Layer
dw $001E ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Circle of Pots", "100nmg", "agahnims_tower", "circle_of_pots")
dw $00B0 ; Screen ID
dw $0078, $16E1 ; Link Coords
dw $0000, $1610 ; Camera HV
db $03 ; Item
db $02 ; Direction
;-----------------------------
db $24 ; Entrance
db $00 ; Room layout
db $04 ; Floor
db $81 ; Door / Peg state
db $00 ; Layer
dw $003F ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Catwalk", "100nmg", "agahnims_tower", "catwalk")
dw $0040 ; Screen ID
dw $010A, $0978 ; Link Coords
dw $0100, $090B ; Camera HV
db $03 ; Item
db $04 ; Direction
;-----------------------------
db $24 ; Entrance
db $03 ; Room layout
db $05 ; Floor
db $02 ; Door / Peg state
db $01 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Agahnim", "100nmg", "agahnims_tower", "agahnim")
dw $0030 ; Screen ID
dw $0078, $0614 ; Link Coords
dw $0000, $0600 ; Camera HV
db $03 ; Item
db $00 ; Direction
;-----------------------------
db $24 ; Entrance
db $00 ; Room layout
db $06 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0001 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; PALACE OF DARKNESS
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_100nmg_palace_of_darkness:
%menu_header("Palace of Darkness", 14)

;---------------------------------------------------------------------------------------------------
%preset_OW("Pyramid", "100nmg", "palace_of_darkness", "pyramid")
dw $005B ; Screen ID
dw $07F0, $065C ; Link Coords
dw $0778, $0600 ; Camera HV
db $03 ; Item
db $02 ; Direction
;-----------------------------
dw $07F7, $066D ; Scroll X,Y
dw $002E ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Palace Overworld Screen", "100nmg", "palace_of_darkness", "palace_overworld_screen")
dw $006E ; Screen ID
dw $0C70, $0A05 ; Link Coords
dw $0C00, $0A00 ; Camera HV
db $03 ; Item
db $00 ; Direction
;-----------------------------
dw $0C7D, $0A6D ; Scroll X,Y
dw $0000 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "100nmg", "palace_of_darkness", "entrance")
dw $005E ; Screen ID
dw $0F50, $063A ; Link Coords
dw $0EDE, $0600 ; Camera HV
db $03 ; Item
db $00 ; Direction
;-----------------------------
dw $0F5B, $066F ; Scroll X,Y
dw $005A ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Main Hub (Small Key)", "100nmg", "palace_of_darkness", "main_hub_small_key")
dw $004A ; Screen ID
dw $14F8, $0814 ; Link Coords
dw $1480, $0800 ; Camera HV
db $14 ; Item
db $00 ; Direction
;-----------------------------
db $26 ; Entrance
db $80 ; Room layout
db $00 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Main Hub (Big Key)", "100nmg", "palace_of_darkness", "main_hub_big_key")
dw $004A ; Screen ID
dw $14F8, $0814 ; Link Coords
dw $1480, $0800 ; Camera HV
db $14 ; Item
db $00 ; Direction
;-----------------------------
db $26 ; Entrance
db $80 ; Room layout
db $00 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Main Hub (Hammerjump)", "100nmg", "palace_of_darkness", "main_hub_hammerjump")
dw $004A ; Screen ID
dw $14F8, $0814 ; Link Coords
dw $1480, $0800 ; Camera HV
db $14 ; Item
db $00 ; Direction
;-----------------------------
db $26 ; Entrance
db $80 ; Room layout
db $00 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Hammerjump", "100nmg", "palace_of_darkness", "hammerjump")
dw $002A ; Screen ID
dw $1478, $0414 ; Link Coords
dw $1400, $0400 ; Camera HV
db $14 ; Item
db $00 ; Direction
;-----------------------------
db $26 ; Entrance
db $C0 ; Room layout
db $00 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pre Sexy Statue", "100nmg", "palace_of_darkness", "pre_sexy_statue")
dw $003A ; Screen ID
dw $1578, $0614 ; Link Coords
dw $1500, $0600 ; Camera HV
db $14 ; Item
db $00 ; Direction
;-----------------------------
db $26 ; Entrance
db $C1 ; Room layout
db $00 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0010 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Sexy Statue Room", "100nmg", "palace_of_darkness", "sexy_statue_room")
dw $002A ; Screen ID
dw $15CD, $04F8 ; Link Coords
dw $1500, $048B ; Camera HV
db $03 ; Item
db $06 ; Direction
;-----------------------------
db $26 ; Entrance
db $C1 ; Room layout
db $00 ; Floor
db $12 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mimics", "100nmg", "palace_of_darkness", "mimics")
dw $002B ; Screen ID
dw $1678, $0414 ; Link Coords
dw $1600, $0400 ; Camera HV
db $03 ; Item
db $00 ; Direction
;-----------------------------
db $26 ; Entrance
db $40 ; Room layout
db $00 ; Floor
db $91 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write8_enable()
%write8($7E0642, $01) ; Room puzzle state (?)
%write8($7E0646, $01) ; hold switch
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Eye Statue", "100nmg", "palace_of_darkness", "eye_statue")
dw $001B ; Screen ID
dw $1678, $0315 ; Link Coords
dw $1600, $0300 ; Camera HV
db $03 ; Item
db $00 ; Direction
;-----------------------------
db $26 ; Entrance
db $02 ; Room layout
db $00 ; Floor
db $91 ; Door / Peg state
db $00 ; Layer
dw $0038 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Basement", "100nmg", "palace_of_darkness", "basement")
dw $001B ; Screen ID
dw $1790, $0257 ; Link Coords
dw $1700, $0200 ; Camera HV
db $03 ; Item
db $02 ; Direction
;-----------------------------
db $26 ; Entrance
db $81 ; Room layout
db $00 ; Floor
db $00 ; Door / Peg state
db $00 ; Layer
dw $0038 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Turtle Room", "100nmg", "palace_of_darkness", "turtle_room")
dw $000B ; Screen ID
dw $1678, $00D2 ; Link Coords
dw $1600, $0010 ; Camera HV
db $04 ; Item
db $02 ; Direction
;-----------------------------
db $26 ; Entrance
db $00 ; Room layout
db $FF ; Floor
db $11 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Helmasaur", "100nmg", "palace_of_darkness", "helmasaur")
dw $006A ; Screen ID
dw $1578, $0C21 ; Link Coords
dw $1500, $0C00 ; Camera HV
db $04 ; Item
db $00 ; Direction
;-----------------------------
db $26 ; Entrance
db $41 ; Room layout
db $FF ; Floor
db $11 ; Door / Peg state
db $00 ; Layer
dw $0010 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; MINIGAMES
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_100nmg_minigames:
%menu_header("Minigames", 17)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside PoD", "100nmg", "minigames", "outside_pod")
dw $005E ; Screen ID
dw $0F50, $063B ; Link Coords
dw $0ED6, $0600 ; Camera HV
db $04 ; Item
db $02 ; Direction
;-----------------------------
dw $0F5B, $066D ; Scroll X,Y
dw $005A ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Overworld Hammerdash", "100nmg", "minigames", "overworld_hammerdash")
dw $006E ; Screen ID
dw $0C08, $0A6A ; Link Coords
dw $0C00, $0A0C ; Camera HV
db $04 ; Item
db $04 ; Direction
;-----------------------------
dw $0C85, $0A79 ; Scroll X,Y
dw $0000 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Rupees Cave", "100nmg", "minigames", "rupees_cave")
dw $006C ; Screen ID
dw $08F0, $0BE2 ; Link Coords
dw $0872, $0B1E ; Camera HV
db $01 ; Item
db $02 ; Direction
;-----------------------------
dw $08F7, $0B8B ; Scroll X,Y
dw $0890 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Dash to Grove", "100nmg", "minigames", "dash_to_grove")
dw $0074 ; Screen ID
dw $0988, $0C6A ; Link Coords
dw $0900, $0C0C ; Camera HV
db $01 ; Item
db $02 ; Direction
;-----------------------------
dw $0985, $0C79 ; Scroll X,Y
dw $00A0 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Grove", "100nmg", "minigames", "grove")
dw $0072 ; Screen ID
dw $04DC, $0C05 ; Link Coords
dw $045E, $0C00 ; Camera HV
db $01 ; Item
db $00 ; Direction
;-----------------------------
dw $04E3, $0C6D ; Scroll X,Y
dw $000C ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("South Grove Cave", "100nmg", "minigames", "south_grove_cave")
dw $006A ; Screen ID
dw $04DF, $0BE2 ; Link Coords
dw $0465, $0B1E ; Camera HV
db $08 ; Item
db $02 ; Direction
;-----------------------------
dw $04EA, $0B8D ; Scroll X,Y
dw $090C ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Digging Game", "100nmg", "minigames", "digging_game")
dw $0069 ; Screen ID
dw $0208, $0BBA ; Link Coords
dw $0200, $0B1E ; Camera HV
db $14 ; Item
db $04 ; Direction
;-----------------------------
dw $0285, $0B8D ; Scroll X,Y
dw $0900 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Arrow Game Spinspeed", "100nmg", "minigames", "arrow_game_spinspeed")
dw $0068 ; Screen ID
dw $01E6, $0BB9 ; Link Coords
dw $0100, $0B1E ; Camera HV
db $14 ; Item
db $06 ; Direction
;-----------------------------
dw $0185, $0B8D ; Scroll X,Y
dw $0920 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Usain Bolt", "100nmg", "minigames", "usain_bolt")
dw $0028 ; Screen ID
dw $01E6, $0BBA ; Link Coords
dw $0100, $0B1E ; Camera HV
db $14 ; Item
db $06 ; Direction
;-----------------------------
dw $0185, $0B8D ; Scroll X,Y
dw $0920 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("After Activating Flute", "100nmg", "minigames", "after_activating_flute")
dw $0018 ; Screen ID
dw $0200, $07D9 ; Link Coords
dw $018A, $0775 ; Camera HV
db $08 ; Item
db $00 ; Direction
;-----------------------------
dw $0207, $07E4 ; Scroll X,Y
dw $0B32 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Return to Town", "100nmg", "minigames", "return_to_town")
dw $0018 ; Screen ID
dw $0200, $07B7 ; Link Coords
dw $017A, $0759 ; Camera HV
db $08 ; Item
db $04 ; Direction
;-----------------------------
dw $0207, $07C6 ; Scroll X,Y
dw $0B30 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Blind's Hut", "100nmg", "minigames", "blinds_hut")
dw $0018 ; Screen ID
dw $0208, $06AA ; Link Coords
dw $0186, $0648 ; Camera HV
db $01 ; Item
db $00 ; Direction
;-----------------------------
dw $0213, $06B5 ; Scroll X,Y
dw $02B0 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Kakariko Well", "100nmg", "minigames", "kakariko_well")
dw $0018 ; Screen ID
dw $0208, $06AA ; Link Coords
dw $0186, $0649 ; Camera HV
db $01 ; Item
db $02 ; Direction
;-----------------------------
dw $0213, $06B6 ; Scroll X,Y
dw $02B0 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("One Musketeer", "100nmg", "minigames", "one_musketeer")
dw $0018 ; Screen ID
dw $00B8, $06CA ; Link Coords
dw $0032, $0668 ; Camera HV
db $04 ; Item
db $02 ; Direction
;-----------------------------
dw $00BF, $06D5 ; Scroll X,Y
dw $0386 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Three Musketeers", "100nmg", "minigames", "three_musketeers")
dw $0018 ; Screen ID
dw $0090, $0605 ; Link Coords
dw $000A, $0600 ; Camera HV
db $04 ; Item
db $00 ; Direction
;-----------------------------
dw $0097, $066D ; Scroll X,Y
dw $0002 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("After Warp", "100nmg", "minigames", "after_warp")
dw $0050 ; Screen ID
dw $016D, $0553 ; Link Coords
dw $00E9, $04F5 ; Camera HV
db $04 ; Item
db $04 ; Direction
;-----------------------------
dw $0176, $0562 ; Scroll X,Y
dw $079E ; Tilemap position
;-----------------------------
%write8_enable()
%write8($7E031F, $90) ; iframes from mirror
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Chest Game", "100nmg", "minigames", "chest_game")
dw $0050 ; Screen ID
dw $0080, $05E2 ; Link Coords
dw $0000, $051E ; Camera HV
db $04 ; Item
db $02 ; Direction
;-----------------------------
dw $008D, $058B ; Scroll X,Y
dw $0880 ; Tilemap position
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; THIEVES' TOWN
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_100nmg_thieves_town:
%menu_header("Thieves' Town", 14)

;---------------------------------------------------------------------------------------------------
%preset_OW("Red Boomerang", "100nmg", "thieves_town", "red_boomerang")
dw $0058 ; Screen ID
dw $00C8, $076A ; Link Coords
dw $0046, $070C ; Camera HV
db $04 ; Item
db $02 ; Direction
;-----------------------------
dw $00D3, $0779 ; Scroll X,Y
dw $088A ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "100nmg", "thieves_town", "entrance")
dw $0058 ; Screen ID
dw $01F8, $07BA ; Link Coords
dw $0176, $075B ; Camera HV
db $01 ; Item
db $00 ; Direction
;-----------------------------
dw $0203, $07C8 ; Scroll X,Y
dw $0A2E ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("After Big Key", "100nmg", "thieves_town", "after_big_key")
dw $00DB ; Screen ID
dw $17E8, $1B68 ; Link Coords
dw $1700, $1AFB ; Camera HV
db $01 ; Item
db $06 ; Direction
;-----------------------------
db $34 ; Entrance
db $C3 ; Room layout
db $FF ; Floor
db $00 ; Door / Peg state
db $01 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Stalfos Hallway", "100nmg", "thieves_town", "stalfos_hallway")
dw $00CC ; Screen ID
dw $1978, $1814 ; Link Coords
dw $1900, $1800 ; Camera HV
db $01 ; Item
db $00 ; Direction
;-----------------------------
db $34 ; Entrance
db $C1 ; Room layout
db $FF ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Conveyor Gibos", "100nmg", "thieves_town", "conveyor_gibos")
dw $00BC ; Screen ID
dw $180A, $1778 ; Link Coords
dw $1800, $170B ; Camera HV
db $01 ; Item
db $04 ; Direction
;-----------------------------
db $34 ; Entrance
db $02 ; Room layout
db $FF ; Floor
db $02 ; Door / Peg state
db $00 ; Layer
dw $0240 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Hellway", "100nmg", "thieves_town", "hellway")
dw $00BB ; Screen ID
dw $170A, $1778 ; Link Coords
dw $1700, $170B ; Camera HV
db $01 ; Item
db $04 ; Direction
;-----------------------------
db $34 ; Entrance
db $03 ; Room layout
db $FF ; Floor
db $02 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write8_enable()
%write8($7E0ABD, $01) ; Palette swap
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Bombable Floor", "100nmg", "thieves_town", "bombable_floor")
dw $0065 ; Screen ID
dw $0AE8, $0D78 ; Link Coords
dw $0A00, $0D0B ; Camera HV
db $01 ; Item
db $06 ; Direction
;-----------------------------
db $34 ; Entrance
db $02 ; Room layout
db $00 ; Floor
db $12 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Backtracking", "100nmg", "thieves_town", "backtracking")
dw $0064 ; Screen ID
dw $0878, $0D20 ; Link Coords
dw $0800, $0D00 ; Camera HV
db $01 ; Item
db $00 ; Direction
;-----------------------------
db $34 ; Entrance
db $02 ; Room layout
db $00 ; Floor
db $10 ; Door / Peg state
db $00 ; Layer
dw $0040 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Basement", "100nmg", "thieves_town", "basement")
dw $00BC ; Screen ID
dw $1878, $1620 ; Link Coords
dw $1800, $1600 ; Camera HV
db $01 ; Item
db $00 ; Direction
;-----------------------------
db $34 ; Entrance
db $00 ; Room layout
db $FF ; Floor
db $10 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Prison", "100nmg", "thieves_town", "prison")
dw $0045 ; Screen ID
dw $0AE8, $0978 ; Link Coords
dw $0A00, $090B ; Camera HV
db $04 ; Item
db $06 ; Direction
;-----------------------------
db $34 ; Entrance
db $02 ; Room layout
db $FE ; Floor
db $12 ; Door / Peg state
db $00 ; Layer
dw $0002 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Gloves", "100nmg", "thieves_town", "gloves")
dw $0044 ; Screen ID
dw $090A, $0978 ; Link Coords
dw $0900, $090B ; Camera HV
db $04 ; Item
db $04 ; Direction
;-----------------------------
db $34 ; Entrance
db $43 ; Room layout
db $FE ; Floor
db $12 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("After Gloves", "100nmg", "thieves_town", "after_gloves")
dw $0044 ; Screen ID
dw $08E8, $0978 ; Link Coords
dw $0800, $090B ; Camera HV
db $04 ; Item
db $06 ; Direction
;-----------------------------
db $34 ; Entrance
db $02 ; Room layout
db $FE ; Floor
db $12 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pot Hammerdash", "100nmg", "thieves_town", "pot_hammerdash")
dw $0045 ; Screen ID
dw $0A78, $0820 ; Link Coords
dw $0A00, $0800 ; Camera HV
db $04 ; Item
db $00 ; Direction
;-----------------------------
db $34 ; Entrance
db $00 ; Room layout
db $FE ; Floor
db $10 ; Door / Peg state
db $00 ; Layer
dw $0002 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Blind", "100nmg", "thieves_town", "blind")
dw $00BC ; Screen ID
dw $1978, $1614 ; Link Coords
dw $1900, $1600 ; Camera HV
db $04 ; Item
db $00 ; Direction
;-----------------------------
db $34 ; Entrance
db $41 ; Room layout
db $FF ; Floor
db $11 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; SKULL WOODS
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_100nmg_skull_woods:
%menu_header("Skull Woods", 13)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Thieves", "100nmg", "skull_woods", "outside_thieves")
dw $0058 ; Screen ID
dw $01F8, $07BB ; Link Coords
dw $0176, $075D ; Camera HV
db $04 ; Item
db $02 ; Direction
;-----------------------------
dw $0203, $07CA ; Scroll X,Y
dw $0B2E ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Cursed Dwarf", "100nmg", "skull_woods", "cursed_dwarf")
dw $0058 ; Screen ID
dw $0388, $09E2 ; Link Coords
dw $0300, $091E ; Camera HV
db $04 ; Item
db $02 ; Direction
;-----------------------------
dw $038D, $098B ; Scroll X,Y
dw $1860 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Hammer Pegs", "100nmg", "skull_woods", "hammer_pegs")
dw $0058 ; Screen ID
dw $03E6, $0918 ; Link Coords
dw $0300, $08B4 ; Camera HV
db $04 ; Item
db $06 ; Direction
;-----------------------------
dw $038D, $0923 ; Scroll X,Y
dw $14E0 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Purple Chest", "100nmg", "skull_woods", "purple_chest")
dw $0121 ; Screen ID
dw $0278, $25E1 ; Link Coords
dw $0200, $2510 ; Camera HV
db $14 ; Item
db $02 ; Direction
;-----------------------------
db $64 ; Entrance
db $02 ; Room layout
db $00 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write16_enable()
%write16($7EC140, $0022) ; Entrance caching
%write16($7EC142, $0016) ; Entrance caching
%write16($7EC144, $0816) ; Entrance caching
%write16($7EC146, $0466) ; Entrance caching
%write16($7EC148, $0878) ; Entrance caching
%write16($7EC14A, $04D8) ; Entrance caching
%write16($7EC14C, $0022) ; Entrance caching
%write16($7EC14E, $000E) ; Entrance caching
%write16($7EC150, $0885) ; Entrance caching
%write16($7EC152, $04E3) ; Entrance caching
%write16($7EC154, $0800) ; Entrance caching
%write16($7EC156, $091E) ; Entrance caching
%write16($7EC158, $0400) ; Entrance caching
%write16($7EC15A, $0500) ; Entrance caching
%write16($7EC15C, $0720) ; Entrance caching
%write16($7EC15E, $0A00) ; Entrance caching
%write16($7EC160, $0300) ; Entrance caching
%write16($7EC162, $0600) ; Entrance caching
%write16($7EC164, $2000) ; Entrance caching
%write16($7EC166, $0623) ; Entrance caching
%write16($7EC16A, $0008) ; Entrance caching
%write16($7EC16C, $FFF8) ; Entrance caching
%write16($7EC16E, $000A) ; Entrance caching
%write16($7EC170, $FFF6) ; Entrance caching
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Locksmith", "100nmg", "skull_woods", "locksmith")
dw $003B ; Screen ID
dw $0778, $0F3D ; Link Coords
dw $06F2, $0EDF ; Camera HV
db $08 ; Item
db $04 ; Direction
;-----------------------------
dw $077F, $0F4C ; Scroll X,Y
dw $069E ; Tilemap position
;-----------------------------
%write8_enable()
%write8($7E031F, $90) ; iframes from mirror
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("After Warp", "100nmg", "skull_woods", "after_warp")
dw $0050 ; Screen ID
dw $016C, $0556 ; Link Coords
dw $00E8, $04F2 ; Camera HV
db $08 ; Item
db $00 ; Direction
;-----------------------------
dw $0175, $0561 ; Scroll X,Y
dw $081C ; Tilemap position
;-----------------------------
%write8_enable()
%write8($7E031F, $90) ; iframes from mirror
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Mummy Room", "100nmg", "skull_woods", "mummy_room")
dw $0040 ; Screen ID
dw $0248, $0249 ; Link Coords
dw $01C2, $01E9 ; Camera HV
db $14 ; Item
db $00 ; Direction
;-----------------------------
dw $024F, $0258 ; Scroll X,Y
dw $0EBA ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Bomb Jump", "100nmg", "skull_woods", "bomb_jump")
dw $0040 ; Screen ID
dw $02E8, $0259 ; Link Coords
dw $0266, $01FB ; Camera HV
db $14 ; Item
db $00 ; Direction
;-----------------------------
dw $02F3, $0268 ; Scroll X,Y
dw $0F4C ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Key Pot", "100nmg", "skull_woods", "key_pot")
dw $0056 ; Screen ID
dw $0D0A, $0B78 ; Link Coords
dw $0D00, $0B0C ; Camera HV
db $01 ; Item
db $04 ; Direction
;-----------------------------
db $29 ; Entrance
db $43 ; Room layout
db $FF ; Floor
db $02 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Skull Entrance", "100nmg", "skull_woods", "skull_entrance")
dw $0040 ; Screen ID
dw $0098, $00C9 ; Link Coords
dw $0012, $0067 ; Camera HV
db $05 ; Item
db $00 ; Direction
;-----------------------------
dw $009F, $00D4 ; Scroll X,Y
dw $0282 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mummy Hellway", "100nmg", "skull_woods", "mummy_hellway")
dw $0049 ; Screen ID
dw $12E8, $0978 ; Link Coords
dw $1200, $090B ; Camera HV
db $05 ; Item
db $06 ; Direction
;-----------------------------
db $2B ; Entrance
db $02 ; Room layout
db $FF ; Floor
db $02 ; Door / Peg state
db $00 ; Layer
dw $0400 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mummy Key", "100nmg", "skull_woods", "mummy_key")
dw $0049 ; Screen ID
dw $1278, $0814 ; Link Coords
dw $1200, $0800 ; Camera HV
db $05 ; Item
db $00 ; Direction
;-----------------------------
db $2B ; Entrance
db $00 ; Room layout
db $FF ; Floor
db $81 ; Door / Peg state
db $00 ; Layer
dw $0C41 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mothula", "100nmg", "skull_woods", "mothula")
dw $0039 ; Screen ID
dw $12E8, $0778 ; Link Coords
dw $1200, $070B ; Camera HV
db $05 ; Item
db $06 ; Direction
;-----------------------------
db $2B ; Entrance
db $02 ; Room layout
db $FF ; Floor
db $02 ; Door / Peg state
db $00 ; Layer
dw $0002 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; ICE PALACE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_100nmg_ice_palace:
%menu_header("Ice Palace", 17)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Skull", "100nmg", "ice_palace", "outside_skull")
dw $0040 ; Screen ID
dw $0098, $00CB ; Link Coords
dw $0016, $0069 ; Camera HV
db $05 ; Item
db $02 ; Direction
;-----------------------------
dw $00A3, $00D6 ; Scroll X,Y
dw $0282 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Bridge Warp", "100nmg", "ice_palace", "bridge_warp")
dw $002C ; Screen ID
dw $0898, $0A05 ; Link Coords
dw $0820, $0A00 ; Camera HV
db $08 ; Item
db $00 ; Direction
;-----------------------------
dw $089F, $0A6D ; Scroll X,Y
dw $0004 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Moblin Dash", "100nmg", "ice_palace", "moblin_dash")
dw $0065 ; Screen ID
dw $0A40, $0805 ; Link Coords
dw $0A00, $0800 ; Camera HV
db $08 ; Item
db $00 ; Direction
;-----------------------------
dw $0A7D, $086F ; Scroll X,Y
dw $0000 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Lottery", "100nmg", "ice_palace", "lottery")
dw $0055 ; Screen ID
dw $0BE6, $0588 ; Link Coords
dw $0B00, $051E ; Camera HV
db $08 ; Item
db $06 ; Direction
;-----------------------------
dw $0B7D, $058D ; Scroll X,Y
dw $0920 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Medallion", "100nmg", "ice_palace", "medallion")
dw $0057 ; Screen ID
dw $0F70, $0405 ; Link Coords
dw $0EFE, $0400 ; Camera HV
db $08 ; Item
db $00 ; Direction
;-----------------------------
dw $0F7B, $046F ; Scroll X,Y
dw $009E ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Zora's Domain", "100nmg", "ice_palace", "zoras_domain")
dw $000F ; Screen ID
dw $0F38, $0214 ; Link Coords
dw $0EC6, $0200 ; Camera HV
db $14 ; Item
db $00 ; Direction
;-----------------------------
dw $0F43, $026F ; Scroll X,Y
dw $0098 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Tiny Warp Dik", "100nmg", "ice_palace", "tiny_warp_dik")
dw $000F ; Screen ID
dw $0F38, $0217 ; Link Coords
dw $0EC6, $0200 ; Camera HV
db $14 ; Item
db $02 ; Direction
;-----------------------------
dw $0F43, $026F ; Scroll X,Y
dw $0098 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "100nmg", "ice_palace", "entrance")
dw $0075 ; Screen ID
dw $0CB8, $0DC9 ; Link Coords
dw $0C33, $0D67 ; Camera HV
db $05 ; Item
db $00 ; Direction
;-----------------------------
dw $0CC0, $0DD4 ; Scroll X,Y
dw $0BC6 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Ice 2", "100nmg", "ice_palace", "ice_2")
dw $000E ; Screen ID
dw $1D0A, $0178 ; Link Coords
dw $1D00, $010C ; Camera HV
db $05 ; Item
db $04 ; Direction
;-----------------------------
db $2D ; Entrance
db $03 ; Room layout
db $00 ; Floor
db $82 ; Door / Peg state
db $00 ; Layer
dw $0001 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Penguin Switch Room", "100nmg", "ice_palace", "penguin_switch_room")
dw $001E ; Screen ID
dw $1DE8, $0378 ; Link Coords
dw $1D00, $030B ; Camera HV
db $05 ; Item
db $06 ; Direction
;-----------------------------
db $2D ; Entrance
db $03 ; Room layout
db $FF ; Floor
db $82 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Bombable Floor", "100nmg", "ice_palace", "bombable_floor")
dw $001E ; Screen ID
dw $1D78, $0314 ; Link Coords
dw $1D00, $0300 ; Camera HV
db $05 ; Item
db $00 ; Direction
;-----------------------------
db $2D ; Entrance
db $03 ; Room layout
db $FF ; Floor
db $81 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Conveyor Room", "100nmg", "ice_palace", "conveyor_room")
dw $003E ; Screen ID
dw $1D78, $06E1 ; Link Coords
dw $1D00, $0610 ; Camera HV
db $01 ; Item
db $02 ; Direction
;-----------------------------
db $2D ; Entrance
db $01 ; Room layout
db $FE ; Floor
db $91 ; Door / Peg state
db $00 ; Layer
dw $0006 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("IPBJ", "100nmg", "ice_palace", "ipbj")
dw $003E ; Screen ID
dw $1C78, $07E1 ; Link Coords
dw $1C00, $0710 ; Camera HV
db $01 ; Item
db $02 ; Direction
;-----------------------------
db $2D ; Entrance
db $82 ; Room layout
db $FE ; Floor
db $11 ; Door / Peg state
db $00 ; Layer
dw $0306 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Penguin Lineup", "100nmg", "ice_palace", "penguin_lineup")
dw $004E ; Screen ID
dw $1DB8, $0860 ; Link Coords
dw $1D00, $0800 ; Camera HV
db $04 ; Item
db $00 ; Direction
;-----------------------------
db $2D ; Entrance
db $01 ; Room layout
db $FE ; Floor
db $10 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Lonely Firebar", "100nmg", "ice_palace", "lonely_firebar")
dw $005E ; Screen ID
dw $1D0A, $0B78 ; Link Coords
dw $1D00, $0B0B ; Camera HV
db $04 ; Item
db $04 ; Direction
;-----------------------------
db $2D ; Entrance
db $03 ; Room layout
db $FD ; Floor
db $12 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Last 2 Rooms", "100nmg", "ice_palace", "last_2_rooms")
dw $009E ; Screen ID
dw $1D50, $1378 ; Link Coords
dw $1D00, $130B ; Camera HV
db $04 ; Item
db $06 ; Direction
;-----------------------------
db $2D ; Entrance
db $03 ; Room layout
db $FB ; Floor
db $10 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Kholdstare", "100nmg", "ice_palace", "kholdstare")
dw $00CE ; Screen ID
dw $1D40, $18B0 ; Link Coords
dw $1D00, $1810 ; Camera HV
db $04 ; Item
db $02 ; Direction
;-----------------------------
db $2D ; Entrance
db $01 ; Room layout
db $FA ; Floor
db $10 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; MISERY MIRE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_100nmg_misery_mire:
%menu_header("Misery Mire", 21)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Ice", "100nmg", "misery_mire", "outside_ice")
dw $0075 ; Screen ID
dw $0CB8, $0DCB ; Link Coords
dw $0C3E, $0D6D ; Camera HV
db $05 ; Item
db $02 ; Direction
;-----------------------------
dw $0CC3, $0DDA ; Scroll X,Y
dw $0BC6 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Death Mountain", "100nmg", "misery_mire", "death_mountain")
dw $0003 ; Screen ID
dw $0679, $0328 ; Link Coords
dw $060B, $02CA ; Camera HV
db $08 ; Item
db $06 ; Direction
;-----------------------------
dw $0680, $0337 ; Scroll X,Y
dw $1600 ; Tilemap position
;-----------------------------
%write8_enable()
%write8($7E031F, $90) ; iframes from mirror
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Spike Cave", "100nmg", "misery_mire", "spike_cave")
dw $0043 ; Screen ID
dw $0928, $024A ; Link Coords
dw $08BA, $01E8 ; Camera HV
db $04 ; Item
db $00 ; Direction
;-----------------------------
dw $092F, $0255 ; Scroll X,Y
dw $0ED6 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Dark Death Mountain", "100nmg", "misery_mire", "dark_death_mountain")
dw $0117 ; Screen ID
dw $0F78, $23E0 ; Link Coords
dw $0F00, $2310 ; Camera HV
db $0D ; Item
db $02 ; Direction
;-----------------------------
db $41 ; Entrance
db $C3 ; Room layout
db $00 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write16_enable()
%write16($7EC140, $0043) ; Entrance caching
%write16($7EC142, $0116) ; Entrance caching
%write16($7EC144, $01E6) ; Entrance caching
%write16($7EC146, $08BA) ; Entrance caching
%write16($7EC148, $0247) ; Entrance caching
%write16($7EC14A, $0928) ; Entrance caching
%write16($7EC14C, $0043) ; Entrance caching
%write16($7EC14E, $0ED6) ; Entrance caching
%write16($7EC150, $0253) ; Entrance caching
%write16($7EC152, $092F) ; Entrance caching
%write16($7EC154, $0000) ; Entrance caching
%write16($7EC156, $031E) ; Entrance caching
%write16($7EC158, $0600) ; Entrance caching
%write16($7EC15A, $0900) ; Entrance caching
%write16($7EC15C, $FF20) ; Entrance caching
%write16($7EC15E, $0400) ; Entrance caching
%write16($7EC160, $0500) ; Entrance caching
%write16($7EC162, $0A00) ; Entrance caching
%write16($7EC164, $2100) ; Entrance caching
%write16($7EC166, $1441) ; Entrance caching
%write16($7EC16A, $0008) ; Entrance caching
%write16($7EC16C, $FFF8) ; Entrance caching
%write16($7EC16E, $FFF6) ; Entrance caching
%write16($7EC170, $000A) ; Entrance caching
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Free Flutedash", "100nmg", "misery_mire", "free_flutedash")
dw $0003 ; Screen ID
dw $06BD, $004B ; Link Coords
dw $064F, $0000 ; Camera HV
db $0C ; Item
db $02 ; Direction
;-----------------------------
dw $06C4, $006D ; Scroll X,Y
dw $000A ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Mire Portal", "100nmg", "misery_mire", "mire_portal")
dw $0030 ; Screen ID
dw $00A0, $0FB8 ; Link Coords
dw $001E, $0F1E ; Camera HV
db $08 ; Item
db $00 ; Direction
;-----------------------------
dw $00AB, $0F8D ; Scroll X,Y
dw $1882 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Mire Entrance", "100nmg", "misery_mire", "mire_entrance")
dw $0070 ; Screen ID
dw $0128, $0CDA ; Link Coords
dw $00A6, $0C76 ; Camera HV
db $10 ; Item
db $00 ; Direction
;-----------------------------
dw $0133, $0CE5 ; Scroll X,Y
dw $0394 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mire 2", "100nmg", "misery_mire", "mire_2")
dw $0098 ; Screen ID
dw $1188, $1320 ; Link Coords
dw $1100, $1300 ; Camera HV
db $05 ; Item
db $00 ; Direction
;-----------------------------
db $27 ; Entrance
db $83 ; Room layout
db $00 ; Floor
db $00 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Main Hub", "100nmg", "misery_mire", "main_hub")
dw $00D2 ; Screen ID
dw $0578, $1A15 ; Link Coords
dw $0500, $1A00 ; Camera HV
db $05 ; Item
db $00 ; Direction
;-----------------------------
db $27 ; Entrance
db $C1 ; Room layout
db $FF ; Floor
db $81 ; Door / Peg state
db $00 ; Layer
dw $03EF ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Beat the Fireball", "100nmg", "misery_mire", "beat_the_fireball")
dw $00B2 ; Screen ID
dw $0578, $17E1 ; Link Coords
dw $0500, $1710 ; Camera HV
db $05 ; Item
db $02 ; Direction
;-----------------------------
db $27 ; Entrance
db $03 ; Room layout
db $FF ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Bari Key", "100nmg", "misery_mire", "bari_key")
dw $00C2 ; Screen ID
dw $040A, $1978 ; Link Coords
dw $0400, $190B ; Camera HV
db $05 ; Item
db $04 ; Direction
;-----------------------------
db $27 ; Entrance
db $C2 ; Room layout
db $FF ; Floor
db $02 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Sluggulas", "100nmg", "misery_mire", "sluggulas")
dw $00C1 ; Screen ID
dw $0278, $19E1 ; Link Coords
dw $0200, $1910 ; Camera HV
db $05 ; Item
db $02 ; Direction
;-----------------------------
db $27 ; Entrance
db $02 ; Room layout
db $FF ; Floor
db $11 ; Door / Peg state
db $00 ; Layer
dw $0200 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Torches", "100nmg", "misery_mire", "torches")
dw $00D1 ; Screen ID
dw $02A8, $1A20 ; Link Coords
dw $0200, $1A00 ; Camera HV
db $05 ; Item
db $00 ; Direction
;-----------------------------
db $27 ; Entrance
db $00 ; Room layout
db $FF ; Floor
db $10 ; Door / Peg state
db $00 ; Layer
dw $0040 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spark Gamble", "100nmg", "misery_mire", "spark_gamble")
dw $00C1 ; Screen ID
dw $03E8, $1878 ; Link Coords
dw $0300, $180B ; Camera HV
db $05 ; Item
db $06 ; Direction
;-----------------------------
db $27 ; Entrance
db $01 ; Room layout
db $FF ; Floor
db $12 ; Door / Peg state
db $00 ; Layer
dw $0200 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Big Chest Room", "100nmg", "misery_mire", "big_chest_room")
dw $00C3 ; Screen ID
dw $06E8, $1978 ; Link Coords
dw $0600, $190B ; Camera HV
db $05 ; Item
db $06 ; Direction
;-----------------------------
db $27 ; Entrance
db $42 ; Room layout
db $FF ; Floor
db $12 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spike Key", "100nmg", "misery_mire", "spike_key")
dw $00C3 ; Screen ID
dw $0678, $1816 ; Link Coords
dw $0600, $1800 ; Camera HV
db $05 ; Item
db $00 ; Direction
;-----------------------------
db $27 ; Entrance
db $40 ; Room layout
db $FF ; Floor
db $11 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Wizzrobe", "100nmg", "misery_mire", "wizzrobe")
dw $00B3 ; Screen ID
dw $0623, $1678 ; Link Coords
dw $0600, $160B ; Camera HV
db $05 ; Item
db $04 ; Direction
;-----------------------------
db $27 ; Entrance
db $00 ; Room layout
db $FF ; Floor
db $12 ; Door / Peg state
db $01 ; Layer
dw $0002 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Basement", "100nmg", "misery_mire", "basement")
dw $00A2 ; Screen ID
dw $04F8, $1438 ; Link Coords
dw $0480, $1400 ; Camera HV
db $05 ; Item
db $00 ; Direction
;-----------------------------
db $27 ; Entrance
db $C0 ; Room layout
db $FF ; Floor
db $10 ; Door / Peg state
db $01 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spooky Action 1", "100nmg", "misery_mire", "spooky_action_1")
dw $0093 ; Screen ID
dw $060A, $1378 ; Link Coords
dw $0600, $130B ; Camera HV
db $05 ; Item
db $04 ; Direction
;-----------------------------
db $27 ; Entrance
db $02 ; Room layout
db $FE ; Floor
db $12 ; Door / Peg state
db $00 ; Layer
dw $0020 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spooky Action 2", "100nmg", "misery_mire", "spooky_action_2")
dw $0092 ; Screen ID
dw $050A, $1378 ; Link Coords
dw $0500, $130B ; Camera HV
db $05 ; Item
db $04 ; Direction
;-----------------------------
db $27 ; Entrance
db $43 ; Room layout
db $FE ; Floor
db $02 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Vitreous", "100nmg", "misery_mire", "vitreous")
dw $00A0 ; Screen ID
dw $0078, $1414 ; Link Coords
dw $0000, $1400 ; Camera HV
db $03 ; Item
db $00 ; Direction
;-----------------------------
db $27 ; Entrance
db $C0 ; Room layout
db $FF ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; SWAMP PALACE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_100nmg_swamp_palace:
%menu_header("Swamp Palace", 20)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Mire", "100nmg", "swamp_palace", "outside_mire")
dw $0070 ; Screen ID
dw $0128, $0CDA ; Link Coords
dw $00A6, $0C7C ; Camera HV
db $03 ; Item
db $02 ; Direction
;-----------------------------
dw $0133, $0CE9 ; Scroll X,Y
dw $0414 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Link's House", "100nmg", "swamp_palace", "links_house")
dw $002C ; Screen ID
dw $08B8, $0B17 ; Link Coords
dw $0840, $0AB9 ; Camera HV
db $08 ; Item
db $02 ; Direction
;-----------------------------
dw $08BF, $0B26 ; Scroll X,Y
dw $0588 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("After Warp", "100nmg", "swamp_palace", "after_warp")
dw $0073 ; Screen ID
dw $073C, $0C47 ; Link Coords
dw $06BF, $0C00 ; Camera HV
db $04 ; Item
db $06 ; Direction
;-----------------------------
dw $0744, $0C75 ; Scroll X,Y
dw $0018 ; Tilemap position
;-----------------------------
%write8_enable()
%write8($7E031F, $90) ; iframes from mirror
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Bombos Medallion", "100nmg", "swamp_palace", "bombos_medallion")
dw $007B ; Screen ID
dw $0608, $0F18 ; Link Coords
dw $0600, $0EBA ; Camera HV
db $04 ; Item
db $04 ; Direction
;-----------------------------
dw $0685, $0F27 ; Scroll X,Y
dw $0580 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Dam", "100nmg", "swamp_palace", "dam")
dw $003B ; Screen ID
dw $0778, $0EE9 ; Link Coords
dw $0700, $0E87 ; Camera HV
db $14 ; Item
db $00 ; Direction
;-----------------------------
dw $077D, $0EF4 ; Scroll X,Y
dw $04A0 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "100nmg", "swamp_palace", "entrance")
dw $007B ; Screen ID
dw $0778, $0EE9 ; Link Coords
dw $0700, $0E87 ; Camera HV
db $04 ; Item
db $00 ; Direction
;-----------------------------
dw $077D, $0EF4 ; Scroll X,Y
dw $04A0 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("First Key Pot", "100nmg", "swamp_palace", "first_key_pot")
dw $0028 ; Screen ID
dw $1078, $0420 ; Link Coords
dw $1000, $0400 ; Camera HV
db $04 ; Item
db $00 ; Direction
;-----------------------------
db $25 ; Entrance
db $C0 ; Room layout
db $00 ; Floor
db $00 ; Door / Peg state
db $00 ; Layer
dw $000E ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Tiny Hallway Key", "100nmg", "swamp_palace", "tiny_hallway_key")
dw $0037 ; Screen ID
dw $0EF8, $0714 ; Link Coords
dw $0E80, $0700 ; Camera HV
db $04 ; Item
db $00 ; Direction
;-----------------------------
db $25 ; Entrance
db $82 ; Room layout
db $FF ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Hammer Peg Lever", "100nmg", "swamp_palace", "hammer_peg_lever")
dw $0037 ; Screen ID
dw $0E78, $0714 ; Link Coords
dw $0E00, $0700 ; Camera HV
db $04 ; Item
db $00 ; Direction
;-----------------------------
db $25 ; Entrance
db $82 ; Room layout
db $FF ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Main Hub", "100nmg", "swamp_palace", "main_hub")
dw $0037 ; Screen ID
dw $0E0A, $0778 ; Link Coords
dw $0E00, $070B ; Camera HV
db $04 ; Item
db $04 ; Direction
;-----------------------------
db $25 ; Entrance
db $82 ; Room layout
db $FF ; Floor
db $02 ; Door / Peg state
db $00 ; Layer
dw $0002 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Crystal Switch Lever", "100nmg", "swamp_palace", "crystal_switch_lever")
dw $0036 ; Screen ID
dw $0C0A, $0678 ; Link Coords
dw $0C00, $060B ; Camera HV
db $04 ; Item
db $04 ; Direction
;-----------------------------
db $25 ; Entrance
db $C0 ; Room layout
db $FF ; Floor
db $02 ; Door / Peg state
db $00 ; Layer
dw $0011 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FDFEA, $0240) ; Room $35 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Sociable Firebar", "100nmg", "swamp_palace", "sociable_firebar")
dw $0034 ; Screen ID
dw $0878, $0720 ; Link Coords
dw $0800, $06B3 ; Camera HV
db $04 ; Item
db $00 ; Direction
;-----------------------------
db $25 ; Entrance
db $C2 ; Room layout
db $FF ; Floor
db $00 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FDFEA, $0240) ; Room $35 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Backtracking", "100nmg", "swamp_palace", "backtracking")
dw $0035 ; Screen ID
dw $0A0A, $0678 ; Link Coords
dw $0A00, $060B ; Camera HV
db $04 ; Item
db $04 ; Direction
;-----------------------------
db $25 ; Entrance
db $80 ; Room layout
db $FF ; Floor
db $02 ; Door / Peg state
db $00 ; Layer
dw $0240 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FDFEA, $0240) ; Room $35 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Hookshot", "100nmg", "swamp_palace", "hookshot")
dw $0035 ; Screen ID
dw $0BE8, $0778 ; Link Coords
dw $0B00, $070B ; Camera HV
db $04 ; Item
db $06 ; Direction
;-----------------------------
db $25 ; Entrance
db $83 ; Room layout
db $FF ; Floor
db $02 ; Door / Peg state
db $00 ; Layer
dw $0240 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Hookdash", "100nmg", "swamp_palace", "hookdash")
dw $0036 ; Screen ID
dw $0CF8, $0614 ; Link Coords
dw $0C80, $0600 ; Camera HV
db $0E ; Item
db $00 ; Direction
;-----------------------------
db $25 ; Entrance
db $C0 ; Room layout
db $FF ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0031 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Final Lever", "100nmg", "swamp_palace", "final_lever")
dw $0026 ; Screen ID
dw $0DA8, $0420 ; Link Coords
dw $0D00, $0400 ; Camera HV
db $0E ; Item
db $00 ; Direction
;-----------------------------
db $25 ; Entrance
db $01 ; Room layout
db $FF ; Floor
db $00 ; Door / Peg state
db $00 ; Layer
dw $0400 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Waterfall Room", "100nmg", "swamp_palace", "waterfall_room")
dw $0076 ; Screen ID
dw $0C78, $0E30 ; Link Coords
dw $0C00, $0E00 ; Camera HV
db $0E ; Item
db $00 ; Direction
;-----------------------------
db $25 ; Entrance
db $40 ; Room layout
db $FE ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0002 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Restock Room", "100nmg", "swamp_palace", "restock_room")
dw $0066 ; Screen ID
dw $0D78, $0D14 ; Link Coords
dw $0D00, $0D00 ; Camera HV
db $0E ; Item
db $00 ; Direction
;-----------------------------
db $25 ; Entrance
db $83 ; Room layout
db $FE ; Floor
db $01 ; Door / Peg state
db $01 ; Layer
dw $00C0 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Phelps' Way", "100nmg", "swamp_palace", "phelps_way")
dw $0016 ; Screen ID
dw $0D78, $02E1 ; Link Coords
dw $0D00, $0210 ; Camera HV
db $0E ; Item
db $02 ; Direction
;-----------------------------
db $25 ; Entrance
db $81 ; Room layout
db $FF ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0004 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Arrghus", "100nmg", "swamp_palace", "arrghus")
dw $0016 ; Screen ID
dw $0C78, $0214 ; Link Coords
dw $0C00, $0200 ; Camera HV
db $0E ; Item
db $00 ; Direction
;-----------------------------
db $25 ; Entrance
db $80 ; Room layout
db $FF ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0004 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; COLLECTION
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_100nmg_collection:
%menu_header("Collection", 12)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Swamp", "100nmg", "collection", "outside_swamp")
dw $007B ; Screen ID
dw $0778, $0EEB ; Link Coords
dw $06F2, $0E8D ; Camera HV
db $0E ; Item
db $02 ; Direction
;-----------------------------
dw $077F, $0EFA ; Scroll X,Y
dw $049E ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Lake Hylia", "100nmg", "collection", "lake_hylia")
dw $007C ; Screen ID
dw $09E6, $0F78 ; Link Coords
dw $0900, $0F1A ; Camera HV
db $0E ; Item
db $06 ; Direction
;-----------------------------
dw $097D, $0F87 ; Scroll X,Y
dw $08A0 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Hobo", "100nmg", "collection", "hobo")
dw $006E ; Screen ID
dw $0C08, $0AB7 ; Link Coords
dw $0C00, $0A53 ; Camera HV
db $14 ; Item
db $04 ; Direction
;-----------------------------
dw $0C7D, $0AC2 ; Scroll X,Y
dw $0300 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Hammer Peg Bridge", "100nmg", "collection", "hammer_peg_bridge")
dw $002D ; Screen ID
dw $0B91, $0B26 ; Link Coords
dw $0B00, $0AC2 ; Camera HV
db $14 ; Item
db $06 ; Direction
;-----------------------------
dw $0B85, $0B31 ; Scroll X,Y
dw $0620 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Super Bomb", "100nmg", "collection", "super_bomb")
dw $006C ; Screen ID
dw $08B8, $0AFA ; Link Coords
dw $083E, $0A96 ; Camera HV
db $04 ; Item
db $00 ; Direction
;-----------------------------
dw $08C3, $0B05 ; Scroll X,Y
dw $0506 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("After Fat Fairy", "100nmg", "collection", "after_fat_fairy")
dw $0116 ; Screen ID
dw $0D78, $23E1 ; Link Coords
dw $0D00, $2310 ; Camera HV
db $0E ; Item
db $02 ; Direction
;-----------------------------
db $63 ; Entrance
db $03 ; Room layout
db $00 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write16_enable()
%write16($7EC140, $005B) ; Entrance caching
%write16($7EC142, $0116) ; Entrance caching
%write16($7EC144, $0754) ; Entrance caching
%write16($7EC146, $06FC) ; Entrance caching
%write16($7EC148, $07B8) ; Entrance caching
%write16($7EC14A, $0778) ; Entrance caching
%write16($7EC14C, $005B) ; Entrance caching
%write16($7EC14E, $0A1E) ; Entrance caching
%write16($7EC150, $07C3) ; Entrance caching
%write16($7EC152, $0781) ; Entrance caching
%write16($7EC154, $0600) ; Entrance caching
%write16($7EC156, $091E) ; Entrance caching
%write16($7EC158, $0600) ; Entrance caching
%write16($7EC15A, $0900) ; Entrance caching
%write16($7EC15C, $0520) ; Entrance caching
%write16($7EC15E, $0A00) ; Entrance caching
%write16($7EC160, $0500) ; Entrance caching
%write16($7EC162, $0A00) ; Entrance caching
%write16($7EC164, $2100) ; Entrance caching
%write16($7EC166, $263B) ; Entrance caching
%write16($7EC16A, $000A) ; Entrance caching
%write16($7EC16C, $FFF6) ; Entrance caching
%write16($7EC16E, $FFF4) ; Entrance caching
%write16($7EC170, $000C) ; Entrance caching
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("King's Tomb", "100nmg", "collection", "kings_tomb")
dw $0055 ; Screen ID
dw $0A0A, $04E8 ; Link Coords
dw $0A00, $0484 ; Camera HV
db $0E ; Item
db $04 ; Direction
;-----------------------------
dw $0A7D, $04F3 ; Scroll X,Y
dw $0480 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Graveyard Ledge", "100nmg", "collection", "graveyard_ledge")
dw $0054 ; Screen ID
dw $099D, $04C8 ; Link Coords
dw $0900, $0466 ; Camera HV
db $14 ; Item
db $06 ; Direction
;-----------------------------
dw $0985, $04D5 ; Scroll X,Y
dw $0320 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Pmurderdactyl Trio", "100nmg", "collection", "pmurderdactyl_trio")
dw $0052 ; Screen ID
dw $0590, $0405 ; Link Coords
dw $0500, $0400 ; Camera HV
db $13 ; Item
db $00 ; Direction
;-----------------------------
dw $0585, $046F ; Scroll X,Y
dw $00A0 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Bumper Cave", "100nmg", "collection", "bumper_cave")
dw $004A ; Screen ID
dw $05A8, $02C9 ; Link Coords
dw $0500, $0265 ; Camera HV
db $13 ; Item
db $00 ; Direction
;-----------------------------
dw $0585, $02D4 ; Scroll X,Y
dw $03A0 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Lumberjack Tree", "100nmg", "collection", "lumberjack_tree")
dw $004A ; Screen ID
dw $0510, $0205 ; Link Coords
dw $048A, $0200 ; Camera HV
db $13 ; Item
db $00 ; Direction
;-----------------------------
dw $0517, $026D ; Scroll X,Y
dw $0012 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Ice Rod Overworld", "100nmg", "collection", "ice_rod_overworld")
dw $003F ; Screen ID
dw $0F70, $0E05 ; Link Coords
dw $0EF6, $0E00 ; Camera HV
db $08 ; Item
db $00 ; Direction
;-----------------------------
dw $0F7B, $0E6D ; Scroll X,Y
dw $001E ; Tilemap position
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; TURTLE ROCK
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_100nmg_turtle_rock:
%menu_header("Turtle Rock", 17)

;---------------------------------------------------------------------------------------------------
%preset_OW("Death Mountain", "100nmg", "turtle_rock", "death_mountain")
dw $0003 ; Screen ID
dw $0679, $0328 ; Link Coords
dw $060F, $02CA ; Camera HV
db $08 ; Item
db $06 ; Direction
;-----------------------------
dw $0684, $0337 ; Scroll X,Y
dw $1600 ; Tilemap position
;-----------------------------
%write8_enable()
%write8($7E031F, $90) ; iframes from mirror
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Squirrels", "100nmg", "turtle_rock", "squirrels")
dw $00DF ; Screen ID
dw $1EF8, $1BE1 ; Link Coords
dw $1E80, $1B10 ; Camera HV
db $0E ; Item
db $02 ; Direction
;-----------------------------
db $1F ; Entrance
db $82 ; Room layout
db $01 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0003 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Peg Puzzle", "100nmg", "turtle_rock", "peg_puzzle")
dw $0005 ; Screen ID
dw $0DE6, $0078 ; Link Coords
dw $0D00, $0014 ; Camera HV
db $0E ; Item
db $06 ; Direction
;-----------------------------
dw $0D7D, $0083 ; Scroll X,Y
dw $0060 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "100nmg", "turtle_rock", "entrance")
dw $0047 ; Screen ID
dw $0F08, $0139 ; Link Coords
dw $0E96, $00D7 ; Camera HV
db $11 ; Item
db $00 ; Direction
;-----------------------------
dw $0F13, $0146 ; Scroll X,Y
dw $0614 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Torches", "100nmg", "turtle_rock", "torches")
dw $00C6 ; Screen ID
dw $0DE8, $1878 ; Link Coords
dw $0D00, $180B ; Camera HV
db $12 ; Item
db $06 ; Direction
;-----------------------------
db $35 ; Entrance
db $C1 ; Room layout
db $00 ; Floor
db $02 ; Door / Peg state
db $00 ; Layer
dw $0028 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Roller Room", "100nmg", "turtle_rock", "roller_room")
dw $00C7 ; Screen ID
dw $0E78, $1814 ; Link Coords
dw $0E00, $1800 ; Camera HV
db $13 ; Item
db $00 ; Direction
;-----------------------------
db $35 ; Entrance
db $C0 ; Room layout
db $00 ; Floor
db $81 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pokey 0", "100nmg", "turtle_rock", "pokey_0")
dw $00C6 ; Screen ID
dw $0C78, $1814 ; Link Coords
dw $0C00, $1800 ; Camera HV
db $12 ; Item
db $00 ; Direction
;-----------------------------
db $35 ; Entrance
db $C0 ; Room layout
db $00 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0029 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Chomps", "100nmg", "turtle_rock", "chomps")
dw $00B6 ; Screen ID
dw $0C78, $1714 ; Link Coords
dw $0C00, $1700 ; Camera HV
db $12 ; Item
db $00 ; Direction
;-----------------------------
db $35 ; Entrance
db $02 ; Room layout
db $00 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0020 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pokey 1", "100nmg", "turtle_rock", "pokey_1")
dw $0014 ; Screen ID
dw $080A, $0278 ; Link Coords
dw $0800, $020B ; Camera HV
db $12 ; Item
db $04 ; Direction
;-----------------------------
db $35 ; Entrance
db $C0 ; Room layout
db $FF ; Floor
db $02 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pokeys 2", "100nmg", "turtle_rock", "pokeys_2")
dw $0014 ; Screen ID
dw $0878, $03D6 ; Link Coords
dw $0800, $0310 ; Camera HV
db $12 ; Item
db $02 ; Direction
;-----------------------------
db $35 ; Entrance
db $C2 ; Room layout
db $FF ; Floor
db $11 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Bomb Yeet", "100nmg", "turtle_rock", "bomb_yeet")
dw $0024 ; Screen ID
dw $080A, $0578 ; Link Coords
dw $0800, $050B ; Camera HV
db $01 ; Item
db $04 ; Direction
;-----------------------------
db $35 ; Entrance
db $02 ; Room layout
db $FF ; Floor
db $12 ; Door / Peg state
db $00 ; Layer
dw $0028 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Mimic Cave", "100nmg", "turtle_rock", "mimic_cave")
dw $0005 ; Screen ID
dw $0D78, $0169 ; Link Coords
dw $0D00, $0106 ; Camera HV
db $14 ; Item
db $00 ; Direction
;-----------------------------
dw $0D7D, $0175 ; Scroll X,Y
dw $07E0 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Crystaroller Room", "100nmg", "turtle_rock", "crystaroller_room")
dw $0014 ; Screen ID
dw $0878, $0214 ; Link Coords
dw $0800, $0200 ; Camera HV
db $12 ; Item
db $00 ; Direction
;-----------------------------
db $19 ; Entrance
db $C0 ; Room layout
db $FF ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Dark Maze", "100nmg", "turtle_rock", "dark_maze")
dw $0004 ; Screen ID
dw $0878, $0020 ; Link Coords
dw $0800, $0000 ; Camera HV
db $12 ; Item
db $00 ; Direction
;-----------------------------
db $19 ; Entrance
db $00 ; Room layout
db $FF ; Floor
db $10 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Laser Skip", "100nmg", "turtle_rock", "laser_skip")
dw $00C5 ; Screen ID
dw $0A78, $19E1 ; Link Coords
dw $0A00, $1910 ; Camera HV
db $12 ; Item
db $02 ; Direction
;-----------------------------
db $19 ; Entrance
db $42 ; Room layout
db $FE ; Floor
db $11 ; Door / Peg state
db $00 ; Layer
dw $0040 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Switch Room", "100nmg", "turtle_rock", "switch_room")
dw $00C5 ; Screen ID
dw $0A0A, $1978 ; Link Coords
dw $0A00, $190B ; Camera HV
db $12 ; Item
db $04 ; Direction
;-----------------------------
db $19 ; Entrance
db $42 ; Room layout
db $FE ; Floor
db $12 ; Door / Peg state
db $00 ; Layer
dw $0040 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Trinexx", "100nmg", "turtle_rock", "trinexx")
dw $00B4 ; Screen ID
dw $0878, $1614 ; Link Coords
dw $0800, $1600 ; Camera HV
db $12 ; Item
db $00 ; Direction
;-----------------------------
db $19 ; Entrance
db $C0 ; Room layout
db $FD ; Floor
db $11 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; GANON'S TOWER
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_100nmg_ganons_tower:
%menu_header("Ganon's Tower", 23)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Turtle Rock", "100nmg", "ganons_tower", "outside_turtle_rock")
dw $0047 ; Screen ID
dw $0F08, $013B ; Link Coords
dw $0E96, $00DD ; Camera HV
db $05 ; Item
db $02 ; Direction
;-----------------------------
dw $0F13, $014A ; Scroll X,Y
dw $0712 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Hookshot Cave", "100nmg", "ganons_tower", "hookshot_cave")
dw $0045 ; Screen ID
dw $0D48, $0109 ; Link Coords
dw $0CCA, $00A9 ; Camera HV
db $05 ; Item
db $00 ; Direction
;-----------------------------
dw $0D4F, $0116 ; Scroll X,Y
dw $05DA ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "100nmg", "ganons_tower", "entrance")
dw $0043 ; Screen ID
dw $08F8, $0039 ; Link Coords
dw $087A, $0000 ; Camera HV
db $14 ; Item
db $00 ; Direction
;-----------------------------
dw $08FF, $006F ; Scroll X,Y
dw $0050 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spike Skip", "100nmg", "ganons_tower", "spike_skip")
dw $008B ; Screen ID
dw $170A, $1078 ; Link Coords
dw $1700, $100C ; Camera HV
db $04 ; Item
db $04 ; Direction
;-----------------------------
db $37 ; Entrance
db $01 ; Room layout
db $00 ; Floor
db $82 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pre Firesnakes Room", "100nmg", "ganons_tower", "pre_firesnakes_room")
dw $009B ; Screen ID
dw $16E8, $1278 ; Link Coords
dw $1600, $120B ; Camera HV
db $02 ; Item
db $06 ; Direction
;-----------------------------
db $37 ; Entrance
db $00 ; Room layout
db $00 ; Floor
db $12 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Bombable Floor", "100nmg", "ganons_tower", "bombable_floor")
dw $009C ; Screen ID
dw $1978, $1214 ; Link Coords
dw $1900, $1200 ; Camera HV
db $01 ; Item
db $00 ; Direction
;-----------------------------
db $37 ; Entrance
db $C1 ; Room layout
db $00 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0032 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Ice Armos", "100nmg", "ganons_tower", "ice_armos")
dw $001C ; Screen ID
dw $19A0, $03A8 ; Link Coords
dw $1900, $0310 ; Camera HV
db $0A ; Item
db $02 ; Direction
;-----------------------------
db $37 ; Entrance
db $03 ; Room layout
db $FF ; Floor
db $00 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Red Mail", "100nmg", "ganons_tower", "red_mail")
dw $001C ; Screen ID
dw $1978, $02E1 ; Link Coords
dw $1900, $0210 ; Camera HV
db $03 ; Item
db $02 ; Direction
;-----------------------------
db $37 ; Entrance
db $01 ; Room layout
db $FF ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $003F ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Floor 3", "100nmg", "ganons_tower", "floor_3")
dw $000C ; Screen ID
dw $18F8, $0020 ; Link Coords
dw $1880, $0000 ; Camera HV
db $14 ; Item
db $00 ; Direction
;-----------------------------
db $37 ; Entrance
db $C0 ; Room layout
db $01 ; Floor
db $00 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mimics 1", "100nmg", "ganons_tower", "mimics_1")
dw $006B ; Screen ID
dw $1678, $0CE1 ; Link Coords
dw $1600, $0C10 ; Camera HV
db $03 ; Item
db $02 ; Direction
;-----------------------------
db $37 ; Entrance
db $80 ; Room layout
db $02 ; Floor
db $91 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mimics 2", "100nmg", "ganons_tower", "mimics_2")
dw $006B ; Screen ID
dw $16E8, $0D78 ; Link Coords
dw $1600, $0D0B ; Camera HV
db $03 ; Item
db $06 ; Direction
;-----------------------------
db $37 ; Entrance
db $02 ; Room layout
db $02 ; Floor
db $92 ; Door / Peg state
db $00 ; Layer
dw $0240 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spike Room", "100nmg", "ganons_tower", "spike_room")
dw $006B ; Screen ID
dw $1778, $0C14 ; Link Coords
dw $1700, $0C00 ; Camera HV
db $03 ; Item
db $00 ; Direction
;-----------------------------
db $37 ; Entrance
db $81 ; Room layout
db $02 ; Floor
db $11 ; Door / Peg state
db $00 ; Layer
dw $2640 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Gauntlet 1", "100nmg", "ganons_tower", "gauntlet_1")
dw $005C ; Screen ID
dw $1978, $0A20 ; Link Coords
dw $1900, $0A00 ; Camera HV
db $03 ; Item
db $00 ; Direction
;-----------------------------
db $37 ; Entrance
db $81 ; Room layout
db $02 ; Floor
db $00 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Gauntlet 3", "100nmg", "ganons_tower", "gauntlet_3")
dw $005D ; Screen ID
dw $1A78, $0AE1 ; Link Coords
dw $1A00, $0A10 ; Camera HV
db $03 ; Item
db $02 ; Direction
;-----------------------------
db $37 ; Entrance
db $00 ; Room layout
db $03 ; Floor
db $81 ; Door / Peg state
db $00 ; Layer
dw $00FD ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Lanmola 2", "100nmg", "ganons_tower", "lanmola_2")
dw $006C ; Screen ID
dw $19D8, $0D78 ; Link Coords
dw $1900, $0D0B ; Camera HV
db $03 ; Item
db $04 ; Direction
;-----------------------------
db $37 ; Entrance
db $03 ; Room layout
db $03 ; Floor
db $02 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Wizzrobes 1", "100nmg", "ganons_tower", "wizzrobes_1")
dw $006C ; Screen ID
dw $1878, $0C20 ; Link Coords
dw $1800, $0C00 ; Camera HV
db $03 ; Item
db $00 ; Direction
;-----------------------------
db $37 ; Entrance
db $00 ; Room layout
db $03 ; Floor
db $00 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Wizzrobes 2", "100nmg", "ganons_tower", "wizzrobes_2")
dw $00A5 ; Screen ID
dw $0B78, $1514 ; Link Coords
dw $0B00, $1500 ; Camera HV
db $12 ; Item
db $00 ; Direction
;-----------------------------
db $37 ; Entrance
db $83 ; Room layout
db $04 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0C8C ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Torches 1", "100nmg", "ganons_tower", "torches_1")
dw $0095 ; Screen ID
dw $0BE8, $1278 ; Link Coords
dw $0B00, $120B ; Camera HV
db $12 ; Item
db $06 ; Direction
;-----------------------------
db $37 ; Entrance
db $41 ; Room layout
db $04 ; Floor
db $02 ; Door / Peg state
db $00 ; Layer
dw $000C ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Torches 2", "100nmg", "ganons_tower", "torches_2")
dw $0096 ; Screen ID
dw $0D78, $1399 ; Link Coords
dw $0D00, $1310 ; Camera HV
db $05 ; Item
db $00 ; Direction
;-----------------------------
db $37 ; Entrance
db $03 ; Room layout
db $04 ; Floor
db $00 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Helma Key", "100nmg", "ganons_tower", "helma_key")
dw $003D ; Screen ID
dw $1B78, $0715 ; Link Coords
dw $1B00, $0700 ; Camera HV
db $05 ; Item
db $00 ; Direction
;-----------------------------
db $37 ; Entrance
db $03 ; Room layout
db $05 ; Floor
db $81 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Bombable Wall", "100nmg", "ganons_tower", "bombable_wall")
dw $003D ; Screen ID
dw $1B0A, $0678 ; Link Coords
dw $1B00, $060B ; Camera HV
db $01 ; Item
db $04 ; Direction
;-----------------------------
db $37 ; Entrance
db $01 ; Room layout
db $05 ; Floor
db $82 ; Door / Peg state
db $00 ; Layer
dw $000C ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Moldorm 2", "100nmg", "ganons_tower", "moldorm_2")
dw $003D ; Screen ID
dw $1A78, $07E1 ; Link Coords
dw $1A00, $0710 ; Camera HV
db $0E ; Item
db $02 ; Direction
;-----------------------------
db $37 ; Entrance
db $02 ; Room layout
db $05 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $000C ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Agahnim 2", "100nmg", "ganons_tower", "agahnim_2")
dw $001D ; Screen ID
dw $1A78, $0214 ; Link Coords
dw $1A00, $0200 ; Camera HV
db $0E ; Item
db $00 ; Direction
;-----------------------------
db $37 ; Entrance
db $80 ; Room layout
db $06 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; GANON
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_100nmg_ganon:
%menu_header("Ganon", 1)

;---------------------------------------------------------------------------------------------------
%preset_OW("Ganon", "100nmg", "ganon", "ganon")
dw $005B ; Screen ID
dw $07F0, $065C ; Link Coords
dw $0778, $0600 ; Camera HV
db $0E ; Item
db $02 ; Direction
;-----------------------------
dw $07F7, $066D ; Scroll X,Y
dw $002E ; Tilemap position
;-----------------------------
%write_end()

;===================================================================================================
presetmenu_100nmg_boss:
%menu_header("Bosses", 13)
%existing_preset("100nmg", "eastern_palace", "armos")
%existing_preset("100nmg", "desert_palace", "lanmolas")
%existing_preset("100nmg", "tower_of_hera", "moldorm")
%existing_preset("100nmg", "agahnims_tower", "agahnim")
%existing_preset("100nmg", "palace_of_darkness", "helmasaur")
%existing_preset("100nmg", "thieves_town", "blind")
%existing_preset("100nmg", "skull_woods", "mothula")
%existing_preset("100nmg", "ice_palace", "kholdstare")
%existing_preset("100nmg", "misery_mire", "vitreous")
%existing_preset("100nmg", "swamp_palace", "arrghus")
%existing_preset("100nmg", "turtle_rock", "trinexx")
%existing_preset("100nmg", "ganons_tower", "agahnim_2")
%existing_preset("100nmg", "ganon", "ganon")

;===================================================================================================
presetpersistent_100nmg:

;===================================================================================================
presetpersistent_100nmg_escape:
;-----------------------------
.links_bed
%write_sq()
..end
;-----------------------------
.outside
..end
;-----------------------------
.uncle
..end
;-----------------------------
.courtyard
..end
;-----------------------------
.entrance
..end
;-----------------------------
.1st_key_guard
..end
;-----------------------------
.stealth_room
..end
;-----------------------------
.2nd_key_guard
..end
;-----------------------------
.ball_n_chains
..end
;-----------------------------
.backtracking
..end
;-----------------------------
.key_guard_revisited
..end
;-----------------------------
.throne_room
..end
;-----------------------------
.snake_avoidance_room
..end
;-----------------------------
.sewer_rooms
..end
;-----------------------------
.key_rat
..end
;-----------------------------
.into_sanctuary
%write8($7E0FC8, $02) ; Prize pack 1
..end

;===================================================================================================
presetpersistent_100nmg_eastern_palace:
;-----------------------------
.before_cutscene
..end
;-----------------------------
.after_cutscene
..end
;-----------------------------
.octorok_overworld
..end
;-----------------------------
.eastern_overworld
..end
;-----------------------------
.entrance
%write8($7E0FC8, $04) ; Prize pack 1
..end
;-----------------------------
.stalfos_room
..end
;-----------------------------
.big_chest_room_1
%write8($7E0FCC, $01) ; Prize pack 5
..end
;-----------------------------
.dark_key_room
..end
;-----------------------------
.big_key_damage_boost
..end
;-----------------------------
.big_chest_room_2
..end
;-----------------------------
.gifted_with_greenies
..end
;-----------------------------
.pot_room
..end
;-----------------------------
.zeldagamer_room
..end
;-----------------------------
.armos
%write8($7E0FC8, $00) ; Prize pack 1
%write8($7E0FCB, $02) ; Prize pack 4
%write8($7E0FCC, $03) ; Prize pack 5
..end

;===================================================================================================
presetpersistent_100nmg_desert_palace:
;-----------------------------
.outside_eastern_palace
..end
;-----------------------------
.eastern_palace_spinspeed
..end
;-----------------------------
.bridge_screen
..end
;-----------------------------
.unholy_spinspeed
..end
;-----------------------------
.holy_spinspeed
..end
;-----------------------------
.water_dash
..end
;-----------------------------
.dam_dash
..end
;-----------------------------
.outside_desert_palace
..end
;-----------------------------
.entrance
..end
;-----------------------------
.key_bonk
%write8($7E0FC8, $01) ; Prize pack 1
..end
;-----------------------------
.pre_cannonball_room
..end
;-----------------------------
.pot_room
%write8($7E0FC8, $02) ; Prize pack 1
..end
;-----------------------------
.desert_ledge
..end
;-----------------------------
.popo_genocide
..end
;-----------------------------
.torches
%write8($7E0FC8, $04) ; Prize pack 1
..end
;-----------------------------
.lanmolas
..end

;===================================================================================================
presetpersistent_100nmg_tower_of_hera:
;-----------------------------
.outside_desert_palace
..end
;-----------------------------
.aginah_cave
..end
;-----------------------------
.fake_flippers
..end
;-----------------------------
.bonk_rocks
..end
;-----------------------------
.boulder_lift
..end
;-----------------------------
.old_man_cave
..end
;-----------------------------
.death_mountain
..end
;-----------------------------
.after_mirror
..end
;-----------------------------
.spectacle_rock_choice
..end
;-----------------------------
.quickhop
%write_mirror($19, $08, $5B, $01)
..end
;-----------------------------
.entrance
..end
;-----------------------------
.tile_room
..end
;-----------------------------
.mini_moldorm_room
..end
;-----------------------------
.torches
..end
;-----------------------------
.beetles
..end
;-----------------------------
.petting_zoo
%write8($7E0FCC, $04) ; Prize pack 5
..end
;-----------------------------
.bumper_skip
%write8($7E0FC8, $05) ; Prize pack 1
..end
;-----------------------------
.moldorm
..end

;===================================================================================================
presetpersistent_100nmg_agahnims_tower:
;-----------------------------
.outside_hera
..end
;-----------------------------
.lumberjacks
..end
;-----------------------------
.lost_woods
..end
;-----------------------------
.after_grove
..end
;-----------------------------
.after_lost_woods
%write8($7E0FCC, $05) ; Prize pack 5
..end
;-----------------------------
.castle_screen
..end
;-----------------------------
.castle_entrance
..end
;-----------------------------
.tower_entrance
..end
;-----------------------------
.prize_pack_guards
%write8($7E0FC8, $06) ; Prize pack 1
..end
;-----------------------------
.dark_maze
..end
;-----------------------------
.dark_catwalk
%write8($7E0FC7, $02) ; Prize pack 0
..end
;-----------------------------
.spear_guards
..end
;-----------------------------
.red_alert_ii
%write8($7E0FC9, $01) ; Prize pack 2
..end
;-----------------------------
.circle_of_pots
%write8($7E0FC7, $03) ; Prize pack 0
..end
;-----------------------------
.catwalk
%write8($7E0FC7, $04) ; Prize pack 0
..end
;-----------------------------
.agahnim
..end

;===================================================================================================
presetpersistent_100nmg_palace_of_darkness:
;-----------------------------
.pyramid
..end
;-----------------------------
.palace_overworld_screen
..end
;-----------------------------
.entrance
..end
;-----------------------------
.main_hub_small_key
..end
;-----------------------------
.main_hub_big_key
%write8($7E0FCC, $06) ; Prize pack 5
..end
;-----------------------------
.main_hub_hammerjump
..end
;-----------------------------
.hammerjump
..end
;-----------------------------
.pre_sexy_statue
%write8($7E0FCC, $07) ; Prize pack 5
..end
;-----------------------------
.sexy_statue_room
..end
;-----------------------------
.mimics
..end
;-----------------------------
.eye_statue
%write8($7E0FCB, $04) ; Prize pack 4
..end
;-----------------------------
.basement
..end
;-----------------------------
.turtle_room
..end
;-----------------------------
.helmasaur
%write8($7E0FC8, $02) ; Prize pack 1
..end

;===================================================================================================
presetpersistent_100nmg_minigames:
;-----------------------------
.outside_pod
..end
;-----------------------------
.overworld_hammerdash
..end
;-----------------------------
.rupees_cave
..end
;-----------------------------
.dash_to_grove
..end
;-----------------------------
.grove
..end
;-----------------------------
.south_grove_cave
%write_mirror($A5, $04, $88, $0A)
..end
;-----------------------------
.digging_game
%write_mirror($44, $04, $4F, $0D)
..end
;-----------------------------
.arrow_game_spinspeed
..end
;-----------------------------
.usain_bolt
%write8($7E0FC7, $05) ; Prize pack 0
%write_mirror($AA, $01, $7B, $0B)
..end
;-----------------------------
.after_activating_flute
..end
;-----------------------------
.return_to_town
..end
;-----------------------------
.blinds_hut
..end
;-----------------------------
.kakariko_well
..end
;-----------------------------
.one_musketeer
..end
;-----------------------------
.three_musketeers
..end
;-----------------------------
.after_warp
..end
;-----------------------------
.chest_game
..end

;===================================================================================================
presetpersistent_100nmg_thieves_town:
;-----------------------------
.red_boomerang
..end
;-----------------------------
.entrance
..end
;-----------------------------
.after_big_key
..end
;-----------------------------
.stalfos_hallway
..end
;-----------------------------
.conveyor_gibos
..end
;-----------------------------
.hellway
..end
;-----------------------------
.bombable_floor
..end
;-----------------------------
.backtracking
..end
;-----------------------------
.basement
..end
;-----------------------------
.prison
..end
;-----------------------------
.gloves
..end
;-----------------------------
.after_gloves
..end
;-----------------------------
.pot_hammerdash
..end
;-----------------------------
.blind
..end

;===================================================================================================
presetpersistent_100nmg_skull_woods:
;-----------------------------
.outside_thieves
%write8($7E02A1, $0E) ; Slot 3 Altitude
%write8($7E02A2, $00) ; Slot 4 Altitude
..end
;-----------------------------
.cursed_dwarf
..end
;-----------------------------
.hammer_pegs
..end
;-----------------------------
.purple_chest
%write_mirror($D8, $04, $8C, $08)
..end
;-----------------------------
.locksmith
%write8($7E02A2, $F9) ; Slot 4 Altitude
%write_mirror($29, $05, $A8, $08)
..end
;-----------------------------
.after_warp
%write8($7E02A2, $CA) ; Slot 4 Altitude
..end
;-----------------------------
.mummy_room
..end
;-----------------------------
.bomb_jump
%write8($7E0FCC, $00) ; Prize pack 5
..end
;-----------------------------
.key_pot
..end
;-----------------------------
.skull_entrance
..end
;-----------------------------
.mummy_hellway
..end
;-----------------------------
.mummy_key
%write8($7E0FC8, $03) ; Prize pack 1
%write8($7E0FC9, $03) ; Prize pack 2
..end
;-----------------------------
.mothula
..end

;===================================================================================================
presetpersistent_100nmg_ice_palace:
;-----------------------------
.outside_skull
%write8($7E02A1, $11) ; Slot 3 Altitude
%write8($7E02A2, $00) ; Slot 4 Altitude
..end
;-----------------------------
.bridge_warp
%write_mirror($98, $00, $CB, $00)
..end
;-----------------------------
.moblin_dash
..end
;-----------------------------
.lottery
..end
;-----------------------------
.medallion
..end
;-----------------------------
.zoras_domain
%write_mirror($9D, $0E, $A6, $02)
..end
;-----------------------------
.tiny_warp_dik
..end
;-----------------------------
.entrance
..end
;-----------------------------
.ice_2
..end
;-----------------------------
.penguin_switch_room
%write8($7E0FCC, $01) ; Prize pack 5
..end
;-----------------------------
.bombable_floor
%write8($7E0FC9, $07) ; Prize pack 2
..end
;-----------------------------
.conveyor_room
%write8($7E0FCA, $02) ; Prize pack 3
..end
;-----------------------------
.ipbj
%write8($7E0FCC, $02) ; Prize pack 5
..end
;-----------------------------
.penguin_lineup
..end
;-----------------------------
.lonely_firebar
%write8($7E0FC9, $01) ; Prize pack 2
..end
;-----------------------------
.last_2_rooms
..end
;-----------------------------
.kholdstare
..end

;===================================================================================================
presetpersistent_100nmg_misery_mire:
;-----------------------------
.outside_ice
%write8($7E02A1, $00) ; Slot 3 Altitude
..end
;-----------------------------
.death_mountain
%write8($7E02A2, $FD) ; Slot 4 Altitude
%write_mirror($B8, $0C, $CB, $0D)
..end
;-----------------------------
.spike_cave
%write8($7E02A2, $83) ; Slot 4 Altitude
..end
;-----------------------------
.dark_death_mountain
..end
;-----------------------------
.free_flutedash
%write8($7E02A2, $0F) ; Slot 4 Altitude
%write_mirror($20, $08, $38, $01)
..end
;-----------------------------
.mire_portal
%write8($7E02A2, $8B) ; Slot 4 Altitude
..end
;-----------------------------
.mire_entrance
..end
;-----------------------------
.mire_2
..end
;-----------------------------
.main_hub
%write8($7E0FC7, $07) ; Prize pack 0
%write8($7E0FC8, $05) ; Prize pack 1
..end
;-----------------------------
.beat_the_fireball
..end
;-----------------------------
.bari_key
..end
;-----------------------------
.sluggulas
..end
;-----------------------------
.torches
..end
;-----------------------------
.spark_gamble
..end
;-----------------------------
.big_chest_room
..end
;-----------------------------
.spike_key
..end
;-----------------------------
.wizzrobe
..end
;-----------------------------
.basement
..end
;-----------------------------
.spooky_action_1
%write8($7E0FCC, $03) ; Prize pack 5
..end
;-----------------------------
.spooky_action_2
..end
;-----------------------------
.vitreous
..end

;===================================================================================================
presetpersistent_100nmg_swamp_palace:
;-----------------------------
.outside_mire
%write8($7E02A1, $0E) ; Slot 3 Altitude
%write8($7E02A2, $00) ; Slot 4 Altitude
..end
;-----------------------------
.links_house
%write8($7E02A2, $A7) ; Slot 4 Altitude
%write_mirror($92, $02, $6B, $0C)
..end
;-----------------------------
.after_warp
..end
;-----------------------------
.bombos_medallion
..end
;-----------------------------
.dam
%write8($7E02A1, $05) ; Slot 3 Altitude
%write8($7E0FCC, $04) ; Prize pack 5
%write_mirror($70, $07, $0F, $0F)
..end
;-----------------------------
.entrance
%write8($7E0FC7, $00) ; Prize pack 0
%write8($7E0FC8, $06) ; Prize pack 1
..end
;-----------------------------
.first_key_pot
..end
;-----------------------------
.tiny_hallway_key
%write8($7E0FC8, $07) ; Prize pack 1
..end
;-----------------------------
.hammer_peg_lever
..end
;-----------------------------
.main_hub
..end
;-----------------------------
.crystal_switch_lever
..end
;-----------------------------
.sociable_firebar
..end
;-----------------------------
.backtracking
..end
;-----------------------------
.hookshot
..end
;-----------------------------
.hookdash
..end
;-----------------------------
.final_lever
..end
;-----------------------------
.waterfall_room
..end
;-----------------------------
.restock_room
..end
;-----------------------------
.phelps_way
..end
;-----------------------------
.arrghus
..end

;===================================================================================================
presetpersistent_100nmg_collection:
;-----------------------------
.outside_swamp
%write8($7E02A1, $0E) ; Slot 3 Altitude
%write8($7E02A2, $00) ; Slot 4 Altitude
..end
;-----------------------------
.lake_hylia
..end
;-----------------------------
.hobo
%write_mirror($84, $0B, $37, $0D)
..end
;-----------------------------
.hammer_peg_bridge
%write_mirror($A6, $0B, $26, $0B)
..end
;-----------------------------
.super_bomb
..end
;-----------------------------
.after_fat_fairy
%write8($7E02A2, $E4) ; Slot 4 Altitude
%write_mirror($1D, $08, $88, $09)
..end
;-----------------------------
.kings_tomb
..end
;-----------------------------
.graveyard_ledge
%write_mirror($A7, $09, $C8, $04)
..end
;-----------------------------
.pmurderdactyl_trio
%write_mirror($12, $09, $6F, $04)
..end
;-----------------------------
.bumper_cave
..end
;-----------------------------
.lumberjack_tree
..end
;-----------------------------
.ice_rod_overworld
%write8($7E02A2, $2E) ; Slot 4 Altitude
%write_mirror($E0, $04, $E0, $01)
..end

;===================================================================================================
presetpersistent_100nmg_turtle_rock:
;-----------------------------
.death_mountain
%write8($7E02A2, $FE) ; Slot 4 Altitude
%write8($7E0FC7, $01) ; Prize pack 0
..end
;-----------------------------
.squirrels
%write8($7E02A2, $7C) ; Slot 4 Altitude
..end
;-----------------------------
.peg_puzzle
..end
;-----------------------------
.entrance
..end
;-----------------------------
.torches
%write8($7E02A2, $00) ; Slot 4 Altitude
%write8($7E0FCC, $05) ; Prize pack 5
..end
;-----------------------------
.roller_room
..end
;-----------------------------
.pokey_0
%write8($7E0FCC, $06) ; Prize pack 5
..end
;-----------------------------
.chomps
%write8($7E0FCD, $01) ; Prize pack 6
..end
;-----------------------------
.pokey_1
..end
;-----------------------------
.pokeys_2
%write8($7E0FCD, $03) ; Prize pack 6
..end
;-----------------------------
.bomb_yeet
%write8($7E0FCD, $05) ; Prize pack 6
..end
;-----------------------------
.mimic_cave
%write_mirror($70, $0D, $78, $01)
..end
;-----------------------------
.crystaroller_room
%write8($7E0FCB, $07) ; Prize pack 4
..end
;-----------------------------
.dark_maze
..end
;-----------------------------
.laser_skip
..end
;-----------------------------
.switch_room
..end
;-----------------------------
.trinexx
%write8($7E0FCD, $06) ; Prize pack 6
..end

;===================================================================================================
presetpersistent_100nmg_ganons_tower:
;-----------------------------
.outside_turtle_rock
%write8($7E02A1, $08) ; Slot 3 Altitude
..end
;-----------------------------
.hookshot_cave
..end
;-----------------------------
.entrance
%write_mirror($F8, $0C, $6B, $00)
..end
;-----------------------------
.spike_skip
..end
;-----------------------------
.pre_firesnakes_room
%write8($7E0FCC, $07) ; Prize pack 5
..end
;-----------------------------
.bombable_floor
..end
;-----------------------------
.ice_armos
..end
;-----------------------------
.red_mail
%write8($7E0B08, $40) ; Arc variable
%write8($7E0B09, $00) ; Arc variable
..end
;-----------------------------
.floor_3
..end
;-----------------------------
.mimics_1
..end
;-----------------------------
.mimics_2
..end
;-----------------------------
.spike_room
..end
;-----------------------------
.gauntlet_1
..end
;-----------------------------
.gauntlet_3
%write8($7E0FCC, $02) ; Prize pack 5
..end
;-----------------------------
.lanmola_2
%write8($7E0FCC, $04) ; Prize pack 5
..end
;-----------------------------
.wizzrobes_1
..end
;-----------------------------
.wizzrobes_2
%write8($7E0FC7, $04) ; Prize pack 0
..end
;-----------------------------
.torches_1
%write8($7E0FC7, $06) ; Prize pack 0
..end
;-----------------------------
.torches_2
..end
;-----------------------------
.helma_key
..end
;-----------------------------
.bombable_wall
..end
;-----------------------------
.moldorm_2
..end
;-----------------------------
.agahnim_2
..end

;===================================================================================================
presetpersistent_100nmg_ganon:
;-----------------------------
.ganon
%write8($7E02A2, $F8) ; Slot 4 Altitude
..end

;===================================================================================================
presetSRAM_100nmg:
;-----------------------------
.escape
;-----------------------------
..links_bed
%write8($7EF36C, $18) ; Max HP
%write8($7EF36D, $18) ; Health
%write8($7EF36F, $FF) ; Keys
%write8($7EF379, $F8) ; Ability
%writeroom($104, $0002)
...end
;-----------------------------
..outside
%write8($7EF3C6, $10) ; Game flags A
%write8($7EF3CC, $05) ; Follower
...end
;-----------------------------
..uncle
%writeroom($055, $000C)
...end
;-----------------------------
..courtyard
%write8($7EF359, $01) ; Sword
%write8($7EF35A, $01) ; Shield
%write8($7EF3C5, $01) ; Game state
%write8($7EF3C6, $11) ; Game flags A
%write8($7EF3C8, $03) ; Spawn point
%write8($7EF3CC, $00) ; Follower
%writeroom($055, $000F)
...end
;-----------------------------
..entrance
...end
;-----------------------------
..1st_key_guard
%write8($7EF36F, $00) ; Keys
%writeroom($001, $000C)
%writeroom($050, $0005)
%writeroom($060, $0005)
%writeroom($061, $000F)
...end
;-----------------------------
..stealth_room
%writeroom($072, $840F)
%writeroom($082, $000F)
...end
;-----------------------------
..2nd_key_guard
%writeroom($071, $0002)
%writeroom($081, $000F)
...end
;-----------------------------
..ball_n_chains
%writeroom($070, $0008)
%writeroom($071, $840B)
...end
;-----------------------------
..backtracking
%write8($7EF34A, $01) ; Lamp
%write8($7EF3C8, $02) ; Spawn point
%write8($7EF3CC, $01) ; Follower
%write16sram($7EF366, $4000) ; Big keys
%writeroom($080, $043C)
...end
;-----------------------------
..key_guard_revisited
...end
;-----------------------------
..throne_room
%writeroom($051, $000F)
...end
;-----------------------------
..snake_avoidance_room
%write8($7EF3C8, $04) ; Spawn point
%writeroom($041, $000F)
...end
;-----------------------------
..sewer_rooms
%writeroom($032, $801F)
%writeroom($042, $000C)
...end
;-----------------------------
..key_rat
%write8($7EF36D, $16) ; Health
%writeroom($021, $0003)
%writeroom($022, $8003)
...end
;-----------------------------
..into_sanctuary
%write16sram($7EF360, $0006) ; Rupees
%writeroom($011, $2005)
%writeroom($021, $840F)
...end
;-----------------------------
.eastern_palace
;-----------------------------
..before_cutscene
%writeroom($002, $000F)
...end
;-----------------------------
..after_cutscene
%write8($7EF3C5, $02) ; Game state
%write8($7EF3C6, $15) ; Game flags A
%write8($7EF3C7, $01) ; Map marker
%write8($7EF3C8, $01) ; Spawn point
%write8($7EF3CC, $00) ; Follower
%write8($7EF29B, $20) ; OW screen $1B
%writeroom($012, $000F)
...end
;-----------------------------
..octorok_overworld
%write8($7EF36C, $20) ; Max HP
%write8($7EF36D, $20) ; Health
%write8($7EF36F, $FF) ; Keys
%writeroom($012, $001F)
...end
;-----------------------------
..eastern_overworld
...end
;-----------------------------
..entrance
%write16sram($7EF360, $001A) ; Rupees
...end
;-----------------------------
..stalfos_room
%write8($7EF36F, $00) ; Keys
%writeroom($0A8, $0005)
%writeroom($0A9, $000F)
%writeroom($0B9, $000F)
%writeroom($0C9, $000F)
...end
;-----------------------------
..big_chest_room_1
%writeroom($0A8, $000F)
...end
;-----------------------------
..dark_key_room
%write8($7EF377, $05) ; Arrows
%writeroom($0AA, $000A)
%writeroom($0BA, $0008)
...end
;-----------------------------
..big_key_damage_boost
%writeroom($0BA, $840C)
%writeroom($0B9, $800F)
...end
;-----------------------------
..big_chest_room_2
%write8($7EF36D, $14) ; Health
%write16sram($7EF366, $6000) ; Big keys
%writeroom($0B8, $8015)
%writeroom($0A8, $200F)
...end
;-----------------------------
..gifted_with_greenies
%write8($7EF340, $02) ; Bow
%write8($7EF377, $0F) ; Arrows
%writeroom($0A9, $201F)
...end
;-----------------------------
..pot_room
%write8($7EF36E, $10) ; Magic
%write8($7EF377, $0E) ; Arrows
%writeroom($099, $C403)
...end
;-----------------------------
..zeldagamer_room
%write8($7EF377, $18) ; Arrows
%writeroom($0D9, $0003)
%writeroom($0DA, $0002)
...end
;-----------------------------
..armos
%write8($7EF36D, $1C) ; Health
%write8($7EF377, $1A) ; Arrows
%write16sram($7EF360, $001F) ; Rupees
%writeroom($0D8, $0005)
...end
;-----------------------------
.desert_palace
;-----------------------------
..outside_eastern_palace
%write8($7EF36C, $28) ; Max HP
%write8($7EF36D, $28) ; Health
%write8($7EF36E, $80) ; Magic
%write8($7EF36F, $FF) ; Keys
%write8($7EF374, $04) ; Pendants
%write8($7EF377, $08) ; Arrows
%writeroom($0C8, $0801)
...end
;-----------------------------
..eastern_palace_spinspeed
%write8($7EF343, $03) ; Bombs
%write8($7EF355, $01) ; Boots
%write8($7EF379, $FC) ; Ability
%write8($7EF3C7, $03) ; Map marker
%write16sram($7EF360, $0083) ; Rupees
%writeroom($105, $807A)
...end
;-----------------------------
..bridge_screen
...end
;-----------------------------
..unholy_spinspeed
%write16sram($7EF360, $0084) ; Rupees
...end
;-----------------------------
..holy_spinspeed
%write8($7EF34E, $01) ; Book
%writeroom($107, $F002)
...end
;-----------------------------
..water_dash
...end
;-----------------------------
..dam_dash
...end
;-----------------------------
..outside_desert_palace
...end
;-----------------------------
..entrance
...end
;-----------------------------
..key_bonk
%write8($7EF36F, $00) ; Keys
%write8($7EF377, $0D) ; Arrows
%write16sram($7EF360, $0089) ; Rupees
%writeroom($073, $0001)
%writeroom($074, $0003)
%writeroom($084, $000F)
...end
;-----------------------------
..pre_cannonball_room
%writeroom($073, $0405)
%writeroom($075, $0002)
%writeroom($085, $400A)
...end
;-----------------------------
..pot_room
%write8($7EF377, $12) ; Arrows
%write16sram($7EF366, $7000) ; Big keys
%writeroom($075, $0017)
%writeroom($085, $400E)
...end
;-----------------------------
..desert_ledge
%write8($7EF354, $01) ; Gloves
%write8($7EF377, $1C) ; Arrows
%writeroom($073, $041F)
%writeroom($083, $0007)
...end
;-----------------------------
..popo_genocide
%write8($7EF36B, $01) ; Heart pieces
%write8($7EF2B0, $40) ; OW screen $30
%writeroom($053, $0008)
%writeroom($063, $840A)
...end
;-----------------------------
..torches
%writeroom($043, $6401)
%writeroom($053, $240F)
...end
;-----------------------------
..lanmolas
%write8($7EF36E, $70) ; Magic
%writeroom($043, $E48D)
...end
;-----------------------------
.tower_of_hera
;-----------------------------
..outside_desert_palace
%write8($7EF36C, $30) ; Max HP
%write8($7EF36D, $30) ; Health
%write8($7EF36E, $80) ; Magic
%write8($7EF36F, $FF) ; Keys
%write8($7EF374, $06) ; Pendants
%write8($7EF377, $0C) ; Arrows
%writeroom($033, $0802)
...end
;-----------------------------
..aginah_cave
...end
;-----------------------------
..fake_flippers
%write8($7EF343, $02) ; Bombs
%write8($7EF36B, $02) ; Heart pieces
%write8($7EF36D, $28) ; Health
%write8($7EF3C6, $35) ; Game flags A
%writeroom($10A, $801F)
...end
;-----------------------------
..bonk_rocks
...end
;-----------------------------
..boulder_lift
%write8($7EF36B, $03) ; Heart pieces
%write8($7EF293, $20) ; OW screen $13
%writeroom($124, $0011)
...end
;-----------------------------
..old_man_cave
%write8($7EF36D, $24) ; Health
%write16sram($7EF360, $008A) ; Rupees
...end
;-----------------------------
..death_mountain
%write8($7EF3C8, $05) ; Spawn point
%write8($7EF3CC, $04) ; Follower
%writeroom($0F0, $000F)
%writeroom($0F1, $000F)
...end
;-----------------------------
..after_mirror
%write8($7EF353, $02) ; Mirror
%write8($7EF3C8, $01) ; Spawn point
%write8($7EF3CC, $00) ; Follower
...end
;-----------------------------
..spectacle_rock_choice
...end
;-----------------------------
..quickhop
%write8($7EF343, $01) ; Bombs
%write8($7EF36B, $01) ; Heart pieces
%write8($7EF36C, $38) ; Max HP
%write8($7EF36D, $30) ; Health
%write8($7EF283, $40) ; OW screen $03
%writeroom($0EA, $040F)
%writeroom($0F9, $000F)
%writeroom($0FA, $000F)
...end
;-----------------------------
..entrance
...end
;-----------------------------
..tile_room
%write8($7EF36F, $00) ; Keys
%write8($7EF386, $01) ; TH keys
%writeroom($077, $800F)
%writeroom($087, $0402)
...end
;-----------------------------
..mini_moldorm_room
%writeroom($087, $040A)
...end
;-----------------------------
..torches
%writeroom($087, $040E)
...end
;-----------------------------
..beetles
%write8($7EF36E, $6C) ; Magic
%write8($7EF386, $00) ; TH keys
%write16sram($7EF366, $7020) ; Big keys
%writeroom($087, $041F)
...end
;-----------------------------
..petting_zoo
%write8($7EF343, $02) ; Bombs
%writeroom($031, $800F)
...end
;-----------------------------
..bumper_skip
%write8($7EF357, $01) ; Pearl
%write8($7EF36D, $28) ; Health
%writeroom($027, $001F)
...end
;-----------------------------
..moldorm
%writeroom($017, $000F)
...end
;-----------------------------
.agahnims_tower
;-----------------------------
..outside_hera
%write8($7EF36C, $40) ; Max HP
%write8($7EF36D, $40) ; Health
%write8($7EF36E, $80) ; Magic
%write8($7EF36F, $FF) ; Keys
%write8($7EF374, $07) ; Pendants
%write8($7EF3C7, $04) ; Map marker
%writeroom($007, $080F)
...end
;-----------------------------
..lumberjacks
%writeroom($0E6, $000F)
%writeroom($0E7, $000F)
...end
;-----------------------------
..lost_woods
...end
;-----------------------------
..after_grove
%write8($7EF359, $02) ; Sword
%write8($7EF3C7, $05) ; Map marker
%write8($7EF300, $40) ; OW screen $80
...end
;-----------------------------
..after_lost_woods
%write8($7EF344, $01) ; Powder
%write8($7EF36B, $02) ; Heart pieces
%writeroom($0E1, $020F)
...end
;-----------------------------
..castle_screen
...end
;-----------------------------
..castle_entrance
...end
;-----------------------------
..tower_entrance
%write8($7EF29B, $60) ; OW screen $1B
...end
;-----------------------------
..prize_pack_guards
%write8($7EF36F, $00) ; Keys
%write8($7EF377, $0A) ; Arrows
%write16sram($7EF360, $008B) ; Rupees
%writeroom($0E0, $000A)
...end
;-----------------------------
..dark_maze
%writeroom($0D0, $0004)
%writeroom($0E0, $201E)
...end
;-----------------------------
..dark_catwalk
%writeroom($0C0, $0001)
%writeroom($0D0, $801F)
...end
;-----------------------------
..spear_guards
%writeroom($0C0, $240F)
...end
;-----------------------------
..red_alert_ii
%write8($7EF377, $06) ; Arrows
%writeroom($0B0, $0004)
...end
;-----------------------------
..circle_of_pots
%writeroom($0B0, $000C)
...end
;-----------------------------
..catwalk
%write8($7EF377, $0B) ; Arrows
%write16sram($7EF360, $008C) ; Rupees
%writeroom($040, $0001)
%writeroom($0B0, $240F)
...end
;-----------------------------
..agahnim
%writeroom($030, $840A)
%writeroom($040, $000B)
...end
;-----------------------------
.palace_of_darkness
;-----------------------------
..pyramid
%write8($7EF36F, $FF) ; Keys
%write8($7EF3C5, $03) ; Game state
%write8($7EF3C7, $06) ; Map marker
%write8($7EF3CA, $40) ; LW/DW
%write8($7EF282, $20) ; OW screen $02
%writeroom($020, $0802)
...end
;-----------------------------
..palace_overworld_screen
%write8($7EF36B, $03) ; Heart pieces
%write8($7EF2DB, $40) ; OW screen $5B
...end
;-----------------------------
..entrance
%write16sram($7EF360, $001E) ; Rupees
%write8($7EF2DE, $20) ; OW screen $5E
...end
;-----------------------------
..main_hub_small_key
%write8($7EF343, $04) ; Bombs
%write8($7EF36F, $00) ; Keys
%writeroom($009, $0018)
%writeroom($04A, $200F)
...end
;-----------------------------
..main_hub_big_key
%write8($7EF343, $05) ; Bombs
%write8($7EF36F, $01) ; Keys
%write8($7EF382, $01) ; PD keys
%writeroom($00A, $001F)
%writeroom($03A, $800F)
...end
;-----------------------------
..main_hub_hammerjump
%write8($7EF36F, $00) ; Keys
%write8($7EF382, $00) ; PD keys
%write16sram($7EF366, $7220) ; Big keys
%writeroom($00A, $801F)
%writeroom($03A, $801F)
...end
;-----------------------------
..hammerjump
%writeroom($02A, $402F)
...end
;-----------------------------
..pre_sexy_statue
%write8($7EF34B, $01) ; Hammer
%write8($7EF36D, $38) ; Health
%write8($7EF36F, $01) ; Keys
%write8($7EF382, $01) ; PD keys
%writeroom($019, $802F)
%writeroom($01A, $301A)
...end
;-----------------------------
..sexy_statue_room
%write8($7EF377, $0A) ; Arrows
...end
;-----------------------------
..mimics
%write8($7EF343, $07) ; Bombs
%write8($7EF36D, $40) ; Health
%writeroom($02B, $000A)
...end
;-----------------------------
..eye_statue
%write8($7EF377, $06) ; Arrows
%writeroom($01B, $0002)
...end
;-----------------------------
..basement
%write8($7EF377, $05) ; Arrows
%writeroom($01B, $008E)
...end
;-----------------------------
..turtle_room
%write8($7EF36F, $00) ; Keys
%writeroom($00B, $200C)
...end
;-----------------------------
..helmasaur
%write16sram($7EF360, $0023) ; Rupees
%writeroom($00B, $200F)
%writeroom($06A, $8005)
...end
;-----------------------------
.minigames
;-----------------------------
..outside_pod
%write8($7EF36C, $48) ; Max HP
%write8($7EF36D, $48) ; Health
%write8($7EF36F, $FF) ; Keys
%write8($7EF37A, $02) ; Crystals
%write8($7EF382, $00) ; PD keys
%write8($7EF3C7, $07) ; Map marker
%writeroom($05A, $0801)
...end
;-----------------------------
..overworld_hammerdash
...end
;-----------------------------
..rupees_cave
...end
;-----------------------------
..dash_to_grove
%write8($7EF343, $06) ; Bombs
%write8($7EF36D, $40) ; Health
%write16sram($7EF360, $014F) ; Rupees
%write8($7EF2F4, $02) ; OW screen $74
%writeroom($11E, $0401)
...end
;-----------------------------
..grove
%write16sram($7EF360, $0150) ; Rupees
...end
;-----------------------------
..south_grove_cave
%write8($7EF34C, $02) ; Flute
...end
;-----------------------------
..digging_game
%write8($7EF36B, $00) ; Heart pieces
%write8($7EF36C, $50) ; Max HP
%write8($7EF36D, $50) ; Health
%writeroom($11B, $0402)
...end
;-----------------------------
..arrow_game_spinspeed
%write8($7EF36B, $01) ; Heart pieces
%write16sram($7EF360, $0133) ; Rupees
%write8($7EF2E8, $40) ; OW screen $68
...end
;-----------------------------
..usain_bolt
%write8($7EF36B, $02) ; Heart pieces
%write8($7EF3CA, $00) ; LW/DW
%write8($7EF2A8, $40) ; OW screen $28
...end
;-----------------------------
..after_activating_flute
%write8($7EF34C, $03) ; Flute
%write8($7EF34D, $01) ; Net
%write8($7EF34F, $01) ; Bottles
%write8($7EF35C, $02) ; Bottle 1
%write8($7EF298, $20) ; OW screen $18
%writeroom($102, $0002)
%writeroom($103, $001A)
...end
;-----------------------------
..return_to_town
%write8($7EF344, $02) ; Powder
%write16sram($7EF360, $0134) ; Rupees
%writeroom($109, $0082)
...end
;-----------------------------
..blinds_hut
%write8($7EF35D, $02) ; Bottle 2
%write8($7EF3C9, $02) ; Game flags B
%write16sram($7EF360, $00D0) ; Rupees
...end
;-----------------------------
..kakariko_well
%write8($7EF343, $05) ; Bombs
%write8($7EF36B, $03) ; Heart pieces
%write16sram($7EF360, $00DF) ; Rupees
%writeroom($119, $0003)
%writeroom($11D, $801F)
...end
;-----------------------------
..one_musketeer
%write8($7EF343, $07) ; Bombs
%write8($7EF36B, $00) ; Heart pieces
%write8($7EF36C, $58) ; Max HP
%write8($7EF36D, $58) ; Health
%write16sram($7EF360, $0120) ; Rupees
%writeroom($02F, $81FB)
...end
;-----------------------------
..three_musketeers
...end
;-----------------------------
..after_warp
%write8($7EF3CA, $40) ; LW/DW
...end
;-----------------------------
..chest_game
...end
;-----------------------------
.thieves_town
;-----------------------------
..red_boomerang
%write8($7EF36B, $01) ; Heart pieces
%write8($7EF377, $06) ; Arrows
%write16sram($7EF360, $0102) ; Rupees
%writeroom($106, $F402)
...end
;-----------------------------
..entrance
%write8($7EF341, $02) ; Boomerang
%write8($7EF343, $06) ; Bombs
%write8($7EF2D8, $22) ; OW screen $58
%writeroom($106, $F412)
...end
;-----------------------------
..after_big_key
%write8($7EF36F, $00) ; Keys
%write16sram($7EF366, $7230) ; Big keys
%writeroom($0CB, $000F)
%writeroom($0CC, $000F)
%writeroom($0DB, $002F)
%writeroom($0DC, $000F)
...end
;-----------------------------
..stalfos_hallway
%writeroom($0CC, $800F)
...end
;-----------------------------
..conveyor_gibos
%writeroom($0BC, $C407)
...end
;-----------------------------
..hellway
%writeroom($0BB, $0001)
...end
;-----------------------------
..bombable_floor
%writeroom($064, $0003)
%writeroom($065, $0002)
%writeroom($0AB, $8402)
%writeroom($0BB, $000B)
...end
;-----------------------------
..backtracking
%write8($7EF343, $05) ; Bombs
%writeroom($065, $0103)
...end
;-----------------------------
..basement
%writeroom($0BB, $000F)
%writeroom($0BC, $C40F)
...end
;-----------------------------
..prison
%writeroom($045, $000A)
...end
;-----------------------------
..gloves
%write8($7EF3CC, $06) ; Follower
%writeroom($044, $4005)
%writeroom($045, $00FF)
...end
;-----------------------------
..after_gloves
%write8($7EF354, $02) ; Gloves
%writeroom($044, $4017)
...end
;-----------------------------
..pot_hammerdash
%write8($7EF377, $0B) ; Arrows
...end
;-----------------------------
..blind
...end
;-----------------------------
.skull_woods
;-----------------------------
..outside_thieves
%write8($7EF36C, $60) ; Max HP
%write8($7EF36D, $60) ; Health
%write8($7EF36F, $FF) ; Keys
%write8($7EF37A, $22) ; Crystals
%write8($7EF3CC, $00) ; Follower
%writeroom($0AC, $0A01)
...end
;-----------------------------
..cursed_dwarf
%write16sram($7EF360, $022E) ; Rupees
%writeroom($11C, $0011)
...end
;-----------------------------
..hammer_pegs
%write8($7EF3CC, $07) ; Follower
...end
;-----------------------------
..purple_chest
%write8($7EF359, $FF) ; Sword
%write8($7EF36B, $02) ; Heart pieces
%write8($7EF3C9, $A2) ; Game flags B
%write8($7EF3CA, $00) ; LW/DW
%write8($7EF3CC, $00) ; Follower
%write16sram($7EF360, $0224) ; Rupees
%write8($7EF2E2, $20) ; OW screen $62
%writeroom($121, $0002)
%writeroom($127, $0402)
...end
;-----------------------------
..locksmith
%write8($7EF359, $03) ; Sword
%write8($7EF36E, $70) ; Magic
%write8($7EF37B, $01) ; 1/2 magic
%write8($7EF3C9, $22) ; Game flags B
%write8($7EF3CC, $0C) ; Follower
%writeroom($0E3, $0007)
...end
;-----------------------------
..after_warp
%write8($7EF35E, $02) ; Bottle 3
%write8($7EF3C9, $32) ; Game flags B
%write8($7EF3CA, $40) ; LW/DW
%write8($7EF3CC, $00) ; Follower
...end
;-----------------------------
..mummy_room
...end
;-----------------------------
..bomb_jump
%write16sram($7EF366, $72B0) ; Big keys
%writeroom($057, $001A)
...end
;-----------------------------
..key_pot
%write8($7EF343, $04) ; Bombs
%write8($7EF345, $01) ; Fire Rod
%write8($7EF36D, $50) ; Health
%write8($7EF36F, $00) ; Keys
%writeroom($056, $0407)
%writeroom($058, $0012)
...end
;-----------------------------
..skull_entrance
%write8($7EF36E, $68) ; Magic
%write8($7EF36F, $FF) ; Keys
%write8($7EF384, $01) ; SW keys
%write8($7EF2C0, $20) ; OW screen $40
...end
;-----------------------------
..mummy_hellway
%write8($7EF36F, $00) ; Keys
%writeroom($049, $2002)
%writeroom($059, $800A)
...end
;-----------------------------
..mummy_key
%write8($7EF36E, $48) ; Magic
%writeroom($049, $A00F)
...end
;-----------------------------
..mothula
%writeroom($039, $4402)
...end
;-----------------------------
.ice_palace
;-----------------------------
..outside_skull
%write8($7EF36C, $68) ; Max HP
%write8($7EF36D, $68) ; Health
%write8($7EF36E, $80) ; Magic
%write8($7EF36F, $FF) ; Keys
%write8($7EF37A, $62) ; Crystals
%write8($7EF384, $00) ; SW keys
%writeroom($029, $0801)
%writeroom($039, $4403)
...end
;-----------------------------
..bridge_warp
%write8($7EF3CA, $00) ; LW/DW
...end
;-----------------------------
..moblin_dash
%write8($7EF3CA, $40) ; LW/DW
...end
;-----------------------------
..lottery
...end
;-----------------------------
..medallion
...end
;-----------------------------
..zoras_domain
%write8($7EF349, $01) ; Quake
%write8($7EF3CA, $00) ; LW/DW
...end
;-----------------------------
..tiny_warp_dik
%write8($7EF356, $01) ; Flippers
%write8($7EF36B, $03) ; Heart pieces
%write8($7EF379, $FE) ; Ability
%write16sram($7EF360, $0030) ; Rupees
%write8($7EF301, $40) ; OW screen $81
%write8($7EF304, $0F) ; OW screen $84
...end
;-----------------------------
..entrance
%write8($7EF3CA, $40) ; LW/DW
...end
;-----------------------------
..ice_2
%write8($7EF36E, $78) ; Magic
%write8($7EF36F, $00) ; Keys
%writeroom($00E, $0001)
...end
;-----------------------------
..penguin_switch_room
%write8($7EF36E, $80) ; Magic
%writeroom($00E, $8403)
%writeroom($01E, $0003)
%writeroom($02E, $0004)
...end
;-----------------------------
..bombable_floor
%writeroom($01F, $0002)
...end
;-----------------------------
..conveyor_room
%write8($7EF343, $02) ; Bombs
%writeroom($01E, $0007)
%writeroom($03E, $0004)
...end
;-----------------------------
..ipbj
%write8($7EF36D, $60) ; Health
%writeroom($03E, $4407)
...end
;-----------------------------
..penguin_lineup
%write8($7EF343, $01) ; Bombs
%writeroom($04E, $400C)
...end
;-----------------------------
..lonely_firebar
%write8($7EF36D, $58) ; Health
%writeroom($05E, $0001)
%writeroom($06E, $0004)
...end
;-----------------------------
..last_2_rooms
%writeroom($05E, $0003)
%writeroom($07E, $0002)
%writeroom($09E, $0003)
...end
;-----------------------------
..kholdstare
%writeroom($0BE, $0001)
%writeroom($0CE, $0004)
...end
;-----------------------------
.misery_mire
;-----------------------------
..outside_ice
%write8($7EF36C, $70) ; Max HP
%write8($7EF36D, $70) ; Health
%write8($7EF36F, $FF) ; Keys
%write8($7EF37A, $66) ; Crystals
%writeroom($0DE, $0804)
...end
;-----------------------------
..death_mountain
%write8($7EF3CA, $00) ; LW/DW
...end
;-----------------------------
..spike_cave
%write8($7EF3CA, $40) ; LW/DW
...end
;-----------------------------
..dark_death_mountain
%write8($7EF351, $01) ; Byrna
%write8($7EF36D, $08) ; Health
%write8($7EF36E, $60) ; Magic
%writeroom($117, $001F)
...end
;-----------------------------
..free_flutedash
%write8($7EF348, $01) ; Ether
%write8($7EF3CA, $00) ; LW/DW
...end
;-----------------------------
..mire_portal
...end
;-----------------------------
..mire_entrance
%write8($7EF36B, $00) ; Heart pieces
%write8($7EF36C, $78) ; Max HP
%write8($7EF36D, $78) ; Health
%write8($7EF36E, $50) ; Magic
%write8($7EF3CA, $40) ; LW/DW
%write16sram($7EF360, $0044) ; Rupees
%write8($7EF2F0, $20) ; OW screen $70
%writeroom($10D, $003A)
...end
;-----------------------------
..mire_2
%write8($7EF36F, $00) ; Keys
%writeroom($098, $0003)
...end
;-----------------------------
..main_hub
%write8($7EF36E, $48) ; Magic
%writeroom($0D2, $000F)
...end
;-----------------------------
..beat_the_fireball
%write8($7EF36F, $01) ; Keys
%writeroom($0B2, $0001)
%writeroom($0B3, $0402)
%writeroom($0C2, $000F)
...end
;-----------------------------
..bari_key
%write8($7EF36F, $00) ; Keys
%writeroom($0C2, $400F)
...end
;-----------------------------
..sluggulas
%writeroom($0C1, $C403)
...end
;-----------------------------
..torches
%write8($7EF36E, $80) ; Magic
%writeroom($0D1, $0008)
...end
;-----------------------------
..spark_gamble
%write8($7EF36E, $60) ; Magic
%write16sram($7EF366, $73B0) ; Big keys
%writeroom($097, $010F)
%writeroom($0B1, $0007)
%writeroom($0C1, $C407)
%writeroom($0D1, $001B)
...end
;-----------------------------
..big_chest_room
%write8($7EF36D, $70) ; Health
%writeroom($0C3, $000A)
...end
;-----------------------------
..spike_key
%write8($7EF350, $01) ; Somaria
%writeroom($0C3, $001F)
...end
;-----------------------------
..wizzrobe
%write8($7EF36D, $58) ; Health
%writeroom($0B3, $841A)
...end
;-----------------------------
..basement
%write8($7EF36D, $60) ; Health
%writeroom($0A2, $800F)
%writeroom($0B2, $800D)
...end
;-----------------------------
..spooky_action_1
%write8($7EF36E, $5C) ; Magic
%writeroom($093, $000E)
...end
;-----------------------------
..spooky_action_2
%write8($7EF36E, $54) ; Magic
%writeroom($092, $0005)
...end
;-----------------------------
..vitreous
%write8($7EF36E, $44) ; Magic
%writeroom($091, $0005)
%writeroom($092, $0007)
%writeroom($0A0, $800F)
...end
;-----------------------------
.swamp_palace
;-----------------------------
..outside_mire
%write8($7EF36C, $80) ; Max HP
%write8($7EF36D, $80) ; Health
%write8($7EF36E, $80) ; Magic
%write8($7EF36F, $FF) ; Keys
%write8($7EF377, $03) ; Arrows
%write8($7EF37A, $67) ; Crystals
%writeroom($090, $0802)
...end
;-----------------------------
..links_house
%write8($7EF36B, $01) ; Heart pieces
%write8($7EF3CA, $00) ; LW/DW
%write8($7EF2B0, $60) ; OW screen $30
%writeroom($126, $0201)
...end
;-----------------------------
..after_warp
%write8($7EF3CA, $40) ; LW/DW
...end
;-----------------------------
..bombos_medallion
...end
;-----------------------------
..dam
%write8($7EF347, $01) ; Bombos
%write8($7EF3CA, $00) ; LW/DW
...end
;-----------------------------
..entrance
%write8($7EF36B, $02) ; Heart pieces
%write8($7EF3CA, $40) ; LW/DW
%write8($7EF2BB, $60) ; OW screen $3B
%write8($7EF2FB, $20) ; OW screen $7B
%writeroom($028, $0100)
%writeroom($10B, $008F)
...end
;-----------------------------
..first_key_pot
%write8($7EF36F, $00) ; Keys
%writeroom($028, $811F)
...end
;-----------------------------
..tiny_hallway_key
%writeroom($037, $1003)
%writeroom($038, $440A)
...end
;-----------------------------
..hammer_peg_lever
%writeroom($037, $340F)
...end
;-----------------------------
..main_hub
%writeroom($037, $348F)
...end
;-----------------------------
..crystal_switch_lever
%writeroom($035, $040F)
%writeroom($036, $200F)
...end
;-----------------------------
..sociable_firebar
%writeroom($034, $000F)
%writeroom($035, $848F)
...end
;-----------------------------
..backtracking
%write16sram($7EF360, $0067) ; Rupees
%write16sram($7EF366, $77B0) ; Big keys
%writeroom($035, $849F)
%writeroom($054, $000F)
...end
;-----------------------------
..hookshot
...end
;-----------------------------
..hookdash
%write8($7EF342, $01) ; Hookshot
%writeroom($036, $641F)
...end
;-----------------------------
..final_lever
%write8($7EF377, $08) ; Arrows
%writeroom($026, $8007)
...end
;-----------------------------
..waterfall_room
%writeroom($076, $008E)
...end
;-----------------------------
..restock_room
%writeroom($066, $0003)
...end
;-----------------------------
..phelps_way
%write8($7EF377, $0D) ; Arrows
%writeroom($016, $000C)
%writeroom($066, $000F)
...end
;-----------------------------
..arrghus
%write8($7EF36D, $78) ; Health
%writeroom($016, $440F)
...end
;-----------------------------
.collection
;-----------------------------
..outside_swamp
%write8($7EF36C, $88) ; Max HP
%write8($7EF36D, $88) ; Health
%write8($7EF36F, $FF) ; Keys
%write8($7EF37A, $77) ; Crystals
%writeroom($006, $0802)
...end
;-----------------------------
..lake_hylia
%write8($7EF2BB, $40) ; OW screen $3B
%write8($7EF2FB, $00) ; OW screen $7B
%writeroom($028, $801F)
%writeroom($10B, $000F)
...end
;-----------------------------
..hobo
%write8($7EF36B, $03) ; Heart pieces
%write8($7EF36D, $78) ; Health
%write8($7EF2B5, $40) ; OW screen $35
...end
;-----------------------------
..hammer_peg_bridge
%write8($7EF35F, $02) ; Bottle 4
%write8($7EF3C9, $33) ; Game flags B
%write8($7EF3CA, $00) ; LW/DW
%write8($7EF300, $60) ; OW screen $80
...end
;-----------------------------
..super_bomb
%write8($7EF3CA, $40) ; LW/DW
...end
;-----------------------------
..after_fat_fairy
%write8($7EF340, $04) ; Bow
%write8($7EF359, $04) ; Sword
%write16sram($7EF360, $0003) ; Rupees
%write8($7EF2DB, $42) ; OW screen $5B
%writeroom($116, $0001)
%writeroom($11C, $0013)
...end
;-----------------------------
..kings_tomb
%write16sram($7EF360, $0004) ; Rupees
...end
;-----------------------------
..graveyard_ledge
%write8($7EF352, $01) ; Cape
%write8($7EF294, $20) ; OW screen $14
%writeroom($113, $001A)
...end
;-----------------------------
..pmurderdactyl_trio
%write8($7EF343, $04) ; Bombs
%write8($7EF36B, $00) ; Heart pieces
%write8($7EF36C, $90) ; Max HP
%write8($7EF36D, $90) ; Health
%writeroom($11B, $860A)
...end
;-----------------------------
..bumper_cave
%write8($7EF36E, $64) ; Magic
...end
;-----------------------------
..lumberjack_tree
%write8($7EF36B, $01) ; Heart pieces
%write8($7EF36E, $3F) ; Magic
%write16sram($7EF360, $0009) ; Rupees
%write8($7EF2CA, $40) ; OW screen $4A
%writeroom($0EB, $0005)
%writeroom($0FB, $000F)
...end
;-----------------------------
..ice_rod_overworld
%write8($7EF36B, $02) ; Heart pieces
%write8($7EF3CA, $00) ; LW/DW
%writeroom($0E2, $020F)
...end
;-----------------------------
.turtle_rock
;-----------------------------
..death_mountain
%write8($7EF343, $03) ; Bombs
%write8($7EF346, $01) ; Ice Rod
%write8($7EF2B7, $02) ; OW screen $37
%writeroom($120, $001A)
...end
;-----------------------------
..squirrels
%writeroom($0DF, $0003)
%writeroom($0EF, $0003)
...end
;-----------------------------
..peg_puzzle
...end
;-----------------------------
..entrance
%write8($7EF36E, $2F) ; Magic
%write8($7EF3CA, $40) ; LW/DW
%write8($7EF287, $20) ; OW screen $07
%write8($7EF2C7, $20) ; OW screen $47
...end
;-----------------------------
..torches
%write8($7EF36E, $7C) ; Magic
%write8($7EF36F, $00) ; Keys
%writeroom($0C6, $000F)
%writeroom($0D6, $8005)
...end
;-----------------------------
..roller_room
%write8($7EF36D, $88) ; Health
%write8($7EF36E, $60) ; Magic
%writeroom($0C7, $000F)
...end
;-----------------------------
..pokey_0
%write8($7EF36E, $32) ; Magic
%writeroom($0B7, $002A)
%writeroom($0C6, $800F)
...end
;-----------------------------
..chomps
%write8($7EF36D, $90) ; Health
%writeroom($0B6, $3402)
...end
;-----------------------------
..pokey_1
%write8($7EF36E, $2A) ; Magic
%write8($7EF377, $12) ; Arrows
%writeroom($014, $000F)
%writeroom($015, $000F)
%writeroom($0B6, $B41A)
...end
;-----------------------------
..pokeys_2
%write8($7EF36E, $80) ; Magic
%write16sram($7EF366, $77B8) ; Big keys
%writeroom($013, $8405)
%writeroom($014, $401F)
...end
;-----------------------------
..bomb_yeet
%write16sram($7EF360, $001D) ; Rupees
%writeroom($024, $000A)
...end
;-----------------------------
..mimic_cave
%write8($7EF343, $03) ; Bombs
%write8($7EF36F, $FF) ; Keys
%write8($7EF3CA, $00) ; LW/DW
%write16sram($7EF360, $001E) ; Rupees
%writeroom($023, $8001)
%writeroom($10C, $0002)
...end
;-----------------------------
..crystaroller_room
%write8($7EF35A, $03) ; Shield
%write8($7EF36B, $03) ; Heart pieces
%write8($7EF36E, $7C) ; Magic
%write8($7EF36F, $00) ; Keys
%write8($7EF3CA, $40) ; LW/DW
%writeroom($014, $C01F)
%writeroom($024, $801F)
%writeroom($10C, $001A)
...end
;-----------------------------
..dark_maze
%writeroom($004, $C01A)
...end
;-----------------------------
..laser_skip
%write8($7EF36D, $88) ; Health
%write8($7EF36E, $78) ; Magic
%writeroom($004, $C01A)
%writeroom($0B5, $000F)
%writeroom($0C5, $000A)
...end
;-----------------------------
..switch_room
%write8($7EF36E, $74) ; Magic
%writeroom($0C5, $800A)
%writeroom($0D5, $008A)
...end
;-----------------------------
..trinexx
%write8($7EF36E, $6C) ; Magic
%writeroom($0B4, $800F)
%writeroom($0C4, $800F)
...end
;-----------------------------
.ganons_tower
;-----------------------------
..outside_turtle_rock
%write8($7EF36C, $98) ; Max HP
%write8($7EF36D, $98) ; Health
%write8($7EF36E, $80) ; Magic
%write8($7EF36F, $FF) ; Keys
%write8($7EF37A, $7F) ; Crystals
%write8($7EF3C7, $08) ; Map marker
%writeroom($0A4, $0802)
...end
;-----------------------------
..hookshot_cave
%write8($7EF2C5, $20) ; OW screen $45
...end
;-----------------------------
..entrance
%write8($7EF343, $01) ; Bombs
%write8($7EF36B, $00) ; Heart pieces
%write8($7EF36C, $A0) ; Max HP
%write8($7EF36D, $A0) ; Health
%write8($7EF285, $40) ; OW screen $05
%write8($7EF2C3, $20) ; OW screen $43
%writeroom($02C, $3003)
%writeroom($03C, $800F)
...end
;-----------------------------
..spike_skip
%write8($7EF36F, $01) ; Keys
%writeroom($00C, $000F)
%writeroom($08B, $0404)
%writeroom($08C, $0008)
...end
;-----------------------------
..pre_firesnakes_room
%writeroom($08B, $040E)
%writeroom($09B, $8408)
...end
;-----------------------------
..bombable_floor
%write8($7EF36D, $98) ; Health
%write8($7EF377, $17) ; Arrows
%writeroom($07D, $201E)
%writeroom($09B, $840F)
%writeroom($09C, $000F)
...end
;-----------------------------
..ice_armos
%writeroom($01C, $0001)
%writeroom($08C, $0009)
...end
;-----------------------------
..red_mail
%write8($7EF377, $11) ; Arrows
%write16sram($7EF366, $77BC) ; Big keys
%writeroom($01C, $0015)
...end
;-----------------------------
..floor_3
%write8($7EF35B, $02) ; Armor
%write8($7EF389, $01) ; GT keys
%writeroom($01C, $0017)
%writeroom($08C, $001B)
...end
;-----------------------------
..mimics_1
%write8($7EF36D, $80) ; Health
%write8($7EF377, $10) ; Arrows
%writeroom($06B, $000C)
...end
;-----------------------------
..mimics_2
%write8($7EF377, $0E) ; Arrows
%writeroom($06B, $000E)
...end
;-----------------------------
..spike_room
%write8($7EF377, $0C) ; Arrows
%writeroom($06B, $800F)
...end
;-----------------------------
..gauntlet_1
%writeroom($05B, $8005)
%writeroom($05C, $000C)
...end
;-----------------------------
..gauntlet_3
%write8($7EF377, $0B) ; Arrows
%write16sram($7EF360, $001F) ; Rupees
%writeroom($05D, $000C)
...end
;-----------------------------
..lanmola_2
%write8($7EF36D, $78) ; Health
%write8($7EF377, $09) ; Arrows
%writeroom($05D, $000E)
%writeroom($06C, $0001)
%writeroom($06D, $000A)
...end
;-----------------------------
..wizzrobes_1
%write8($7EF377, $06) ; Arrows
%writeroom($06C, $000B)
...end
;-----------------------------
..wizzrobes_2
%write8($7EF36D, $80) ; Health
%write8($7EF36E, $7C) ; Magic
%writeroom($0A5, $000B)
...end
;-----------------------------
..torches_1
%write8($7EF36E, $78) ; Magic
%writeroom($095, $0005)
%writeroom($0A5, $000F)
...end
;-----------------------------
..torches_2
%write8($7EF36E, $58) ; Magic
%writeroom($096, $000B)
...end
;-----------------------------
..helma_key
%write8($7EF36E, $38) ; Magic
%writeroom($03D, $0001)
...end
;-----------------------------
..bombable_wall
%write8($7EF36D, $78) ; Health
%writeroom($03D, $4405)
...end
;-----------------------------
..moldorm_2
%write8($7EF343, $00) ; Bombs
%write8($7EF36F, $00) ; Keys
%writeroom($03D, $740F)
%writeroom($04D, $800F)
...end
;-----------------------------
..agahnim_2
%writeroom($01D, $800C)
%writeroom($04C, $0005)
...end
;-----------------------------
.ganon
;-----------------------------
..ganon
%write8($7EF36F, $FF) ; Keys
%write8($7EF389, $00) ; GT keys
%write8($7EF2DB, $62) ; OW screen $5B
%writeroom($00D, $0802)
...end
;===================================================================================================
presetend_100nmg:
print "100nmg size: $", hex(presetend_100nmg-presetheader_100nmg)
