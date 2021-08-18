
;===================================================================================================
; PRESET DATA HEADER
;===================================================================================================
presetheader_lownmg:
	dw presetSRAM_lownmg ; location of SRAM

;===================================================================================================
%menu_header("Low% NMG", 15)
	%submenu("Hyrule Castle", presetmenu_lownmg_escape)
	%submenu("Eastern Palace", presetmenu_lownmg_eastern)
	%submenu("Desert Palace", presetmenu_lownmg_desert)
	%submenu("Tower of Hera", presetmenu_lownmg_hera)
	%submenu("Agahnim's Tower", presetmenu_lownmg_aga)
	%submenu("Palace of Darkness", presetmenu_lownmg_pod)
	%submenu("Thieves' Town", presetmenu_lownmg_thieves)
	%submenu("Skull Woods", presetmenu_lownmg_skull)
	%submenu("Misery Mire", presetmenu_lownmg_mire)
	%submenu("Swamp Palace", presetmenu_lownmg_swamp)
	%submenu("Ice Palace", presetmenu_lownmg_ice)
	%submenu("Turtle Rock", presetmenu_lownmg_trock)
	%submenu("Ganon's Tower", presetmenu_lownmg_gtower)
	%submenu("Ganon", presetmenu_lownmg_ganon)
	%submenu("Bosses", presetmenu_lownmg_boss)

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; HYRULE CASTLE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_lownmg_escape:
%menu_header("Hyrule Castle", 14)

;---------------------------------------------------------------------------------------------------
%preset_UW("Link's Bed", "lownmg", "escape", "bed")
dw $0104 ; Screen ID
dw $0940, $215A ; Link Coords
dw $2110, $0900 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $02 ; Room layout
db $03 ; Main GFX
db $FF ; Music
db $00 ; Floor
db $FF ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7EC167, $7D) ; Underworld exit cache
%write8($7EC165, $23) ; Underworld exit cache
%write8($7EC166, $51) ; Underworld exit cache
%write16_enable()
%write16($7E0696, $0003) ; Overworld Door
%write16($7E0542, $16CA) ; Object tilemap state
%write16($7E0468, $0001) ; Trap door state
%write16($7E0540, $15CA) ; Object tilemap state
%write16($7E0544, $17CA) ; Object tilemap state
%write16($7EC142, $0015) ; Underworld exit cache
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Courtyard", "lownmg", "escape", "courtyard")
dw $0055 ; Screen ID
dw $0A78, $0BDB ; Link Coords
dw $0B10, $0A00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $02 ; Link direction
;-----------------------------
db $00 ; Entrance
db $82 ; Room layout
db $01 ; Main GFX
db $03 ; Music
db $FF ; Floor
db $FF ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E010F, $00) ; 
%write16_enable()
%write16($7E0696, $0001) ; Overworld Door
%write16($7E0542, $19E6) ; Object tilemap state
%write16($7E0540, $18E6) ; Object tilemap state
%write16($7E0544, $1850) ; Object tilemap state
%write_7F()
%write8($7FE0EF, $41) ; Room $B7 persistent: Turtle Rock (Map Chest / Key Chest / Roller Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "lownmg", "escape", "entrance")
dw $001B ; Screen ID
dw $07F8, $06FA ; Link Coords
dw $069C, $0784 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $02 ; Link direction
;-----------------------------
dw $0803, $0709 ; Scroll X, Y
dw $0532 ; Unknown 1
dw $0004 ; Unknown 2
dw $000A ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("1st Key Guard", "lownmg", "escape", "1st_keyguard")
dw $0001 ; Screen ID
dw $02F8, $0054 ; Link Coords
dw $0000, $0280 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $7D ; Entrance
db $80 ; Room layout
db $04 ; Main GFX
db $10 ; Music
db $00 ; Floor
db $02 ; Palace No
db $00 ; Door
db $01 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0004) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Stealth Room", "lownmg", "escape", "stealth_room")
dw $0082 ; Screen ID
dw $0408, $1178 ; Link Coords
dw $110B, $0400 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $04 ; Entrance
db $C2 ; Room layout
db $04 ; Main GFX
db $10 ; Music
db $FF ; Floor
db $02 ; Palace No
db $00 ; Door
db $01 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0004) ; Overworld Door
%write16($7E0542, $2532) ; Object tilemap state
%write16($7E0540, $324C) ; Object tilemap state
%write16($7E0544, $2A32) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FE064, $0001) ; Room $72 persistent: Hyrule Castle (Map Chest Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("2nd Key Guard", "lownmg", "escape", "2nd_keyguard")
dw $0071 ; Screen ID
dw $02BA, $0F78 ; Link Coords
dw $0F0B, $0200 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $04 ; Link direction
;-----------------------------
db $04 ; Entrance
db $02 ; Room layout
db $04 ; Main GFX
db $10 ; Music
db $FF ; Floor
db $02 ; Palace No
db $02 ; Door
db $01 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0004) ; Overworld Door
%write16($7E0468, $0000) ; Trap door state
%write_7F()
%write16_enable()
%write16($7FE062, $0001) ; Room $71 persistent: Hyrule Castle (Boomerang Chest Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Ball'n Chains", "lownmg", "escape", "ball_n_chains")
dw $0070 ; Screen ID
dw $0050, $0E24 ; Link Coords
dw $0E00, $0000 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $06 ; Link direction
;-----------------------------
db $04 ; Entrance
db $00 ; Room layout
db $04 ; Main GFX
db $10 ; Music
db $FE ; Floor
db $02 ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0004) ; Overworld Door
%write16($7E0468, $0001) ; Trap door state
%write_7F()
%write16_enable()
%write16($7FE062, $0003) ; Room $71 persistent: Hyrule Castle (Boomerang Chest Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Backtracking", "lownmg", "escape", "backtracking")
dw $0080 ; Screen ID
dw $0050, $1024 ; Link Coords
dw $1000, $0000 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $04 ; Entrance
db $80 ; Room layout
db $04 ; Main GFX
db $10 ; Music
db $FD ; Floor
db $02 ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0004) ; Overworld Door
%write16($7E0542, $0434) ; Object tilemap state
%write16($7E0540, $0430) ; Object tilemap state
%write16($7E0544, $0438) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FE080, $0004) ; Room $80 persistent: Hyrule Castle (Jail Cell Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Key Guard Revisited", "lownmg", "escape", "keyguard_revisited")
dw $0072 ; Screen ID
dw $04F8, $0F24 ; Link Coords
dw $0F00, $0480 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $00 ; Link direction
;-----------------------------
db $04 ; Entrance
db $82 ; Room layout
db $04 ; Main GFX
db $10 ; Music
db $FF ; Floor
db $02 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0004) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Throne Room", "lownmg", "escape", "throne_room")
dw $0051 ; Screen ID
dw $02F8, $0A8F ; Link Coords
dw $0A22, $0280 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $00 ; Link direction
;-----------------------------
db $04 ; Entrance
db $C0 ; Room layout
db $04 ; Main GFX
db $10 ; Music
db $01 ; Floor
db $02 ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0004) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Snake Avoidance Room", "lownmg", "escape", "snake_avoidance_room")
dw $0041 ; Screen ID
dw $03A8, $0826 ; Link Coords
dw $0800, $0300 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $00 ; Link direction
;-----------------------------
db $04 ; Entrance
db $C1 ; Room layout
db $04 ; Main GFX
db $10 ; Music
db $01 ; Floor
db $00 ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0004) ; Overworld Door
%write16($7E0542, $0F34) ; Object tilemap state
%write16($7E0546, $1694) ; Object tilemap state
%write16($7E054A, $0E70) ; Object tilemap state
%write16($7E0540, $0A64) ; Object tilemap state
%write16($7E0544, $1034) ; Object tilemap state
%write16($7E0548, $053E) ; Object tilemap state
%write16($7E054C, $1590) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Sewer Rooms", "lownmg", "escape", "water_rooms")
dw $0032 ; Screen ID
dw $04F8, $0625 ; Link Coords
dw $0600, $0480 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $00 ; Link direction
;-----------------------------
db $04 ; Entrance
db $C0 ; Room layout
db $04 ; Main GFX
db $10 ; Music
db $FF ; Floor
db $00 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0004) ; Overworld Door
%write16($7E0542, $0B8A) ; Object tilemap state
%write16($7E0546, $0FF2) ; Object tilemap state
%write16($7E0540, $0D1C) ; Object tilemap state
%write16($7E0544, $0BF2) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FDFE4, $0010) ; Room $32 persistent: Hyrule Castle (Sewer Key Chest Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Key Rat", "lownmg", "escape", "keyrat")
dw $0021 ; Screen ID
dw $02F8, $0525 ; Link Coords
dw $0500, $0280 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $00 ; Link direction
;-----------------------------
db $04 ; Entrance
db $82 ; Room layout
db $04 ; Main GFX
db $10 ; Music
db $FF ; Floor
db $00 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0004) ; Overworld Door
%write16($7E0542, $1C64) ; Object tilemap state
%write16($7E0546, $18A8) ; Object tilemap state
%write16($7E054A, $1C30) ; Object tilemap state
%write16($7E054E, $0CEA) ; Object tilemap state
%write16($7E0552, $1C8A) ; Object tilemap state
%write16($7E0540, $14A0) ; Object tilemap state
%write16($7E0544, $1C68) ; Object tilemap state
%write16($7E0548, $1C52) ; Object tilemap state
%write16($7E054C, $0C92) ; Object tilemap state
%write16($7E0550, $138A) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Last Two Screens", "lownmg", "escape", "last_two_screens")
dw $0011 ; Screen ID
dw $0378, $0224 ; Link Coords
dw $0200, $0300 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $00 ; Link direction
;-----------------------------
db $04 ; Entrance
db $41 ; Room layout
db $04 ; Main GFX
db $10 ; Music
db $FF ; Floor
db $00 ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0004) ; Overworld Door
%write16($7E0542, $0F98) ; Object tilemap state
%write16($7E0546, $1390) ; Object tilemap state
%write16($7E054A, $13A0) ; Object tilemap state
%write16($7E0540, $0F90) ; Object tilemap state
%write16($7E0544, $0FA0) ; Object tilemap state
%write16($7E0548, $1398) ; Object tilemap state
%write16($7E054C, $455E) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FDFA2, $0046) ; Room $11 persistent: Hyrule Castle (Bombable Stock Room)
%write16($7FDFC2, $0001) ; Room $21 persistent: Hyrule Castle (Key-rat Room)
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; EASTERN PALACE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_lownmg_eastern:
%menu_header("Eastern Palace", 14)

;---------------------------------------------------------------------------------------------------
%preset_UW("Before Cutscene", "lownmg", "eastern", "before_cutscene")
dw $0002 ; Screen ID
dw $04F8, $01BC ; Link Coords
dw $0110, $0480 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $00 ; Link direction
;-----------------------------
db $04 ; Entrance
db $82 ; Room layout
db $04 ; Main GFX
db $10 ; Music
db $00 ; Floor
db $00 ; Palace No
db $01 ; Door
db $01 ; Layer
;-----------------------------
%write8_enable()
%write8($7E0642, $01) ; Room puzzle state (?)
%write8($7E0B09, $B0) ; Arc variable
%write8($7E0B39, $00) ; Arc variable
%write8($7E0B3D, $00) ; Arc variable
%write8($7E0B3B, $00) ; Arc variable
%write8($7E0B3F, $00) ; Arc variable
%write8($7E0B0C, $A0) ; Arc variable
%write16_enable()
%write16($7E0696, $0004) ; Overworld Door
%write16($7E0542, $2850) ; Object tilemap state
%write16($7E0546, $2A2C) ; Object tilemap state
%write16($7E0468, $0000) ; Trap door state
%write16($7E0540, $2650) ; Object tilemap state
%write16($7E0544, $282C) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("After Cutscene", "lownmg", "eastern", "after_cutscene")
dw $0012 ; Screen ID
dw $04F8, $0274 ; Link Coords
dw $0207, $0480 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $02 ; Link direction
;-----------------------------
db $04 ; Entrance
db $C0 ; Room layout
db $04 ; Main GFX
db $10 ; Music
db $00 ; Floor
db $00 ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E0642, $00) ; Room puzzle state (?)
%write16_enable()
%write16($7E0696, $0004) ; Overworld Door
%write16($7E0468, $0001) ; Trap door state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Octorok OW", "lownmg", "eastern", "octorok")
dw $001D ; Screen ID
dw $0B10, $07DC ; Link Coords
dw $071E, $0A9E ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $02 ; Link direction
;-----------------------------
dw $0B1B, $078B ; Scroll X, Y
dw $0894 ; Unknown 1
dw $0000 ; Unknown 2
dw $0002 ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FE14B, $47) ; Overworld $E5 persistent: UNKNOWN
%write8($7FE17B, $47) ; Overworld $FD persistent: UNKNOWN
%write8($7FDFEB, $AD) ; Overworld $35 persistent: Lake Hylia
%write8($7FE057, $42) ; Overworld $6B persistent: Outside Haunted Grove
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("EP Overworld", "lownmg", "eastern", "outside_palace")
dw $002E ; Screen ID
dw $0C70, $0A08 ; Link Coords
dw $0A00, $0C00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $02 ; Link direction
;-----------------------------
dw $0C7D, $0A6D ; Scroll X, Y
dw $0000 ; Unknown 1
dw $0000 ; Unknown 2
dw $0000 ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FE167, $42) ; Overworld $F3 persistent: UNKNOWN
%write8($7FE04E, $42) ; Overworld $67 persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "lownmg", "eastern", "entrance")
dw $001E ; Screen ID
dw $0F50, $062D ; Link Coords
dw $0600, $0EDE ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $00 ; Link direction
;-----------------------------
dw $0F5B, $066F ; Scroll X, Y
dw $005C ; Unknown 1
dw $0000 ; Unknown 2
dw $0002 ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FE103, $52) ; Overworld $C1 persistent: UNKNOWN
%write8($7FE06E, $52) ; Overworld $77 persistent: Black Ice Cave
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Stalfos Room", "lownmg", "eastern", "stalfos_room")
dw $00A8 ; Screen ID
dw $111E, $1578 ; Link Coords
dw $150B, $1100 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $00 ; Link direction
;-----------------------------
db $04 ; Entrance
db $43 ; Room layout
db $05 ; Main GFX
db $11 ; Music
db $00 ; Floor
db $04 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E0B0C, $20) ; Arc variable
%write16_enable()
%write16($7E0696, $0005) ; Overworld Door
%write16($7E0542, $13B2) ; Object tilemap state
%write16($7E0546, $1CB2) ; Object tilemap state
%write16($7E054A, $36E0) ; Object tilemap state
%write16($7E0540, $138A) ; Object tilemap state
%write16($7E0544, $1C8A) ; Object tilemap state
%write16($7E0548, $181E) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Big Chest Room 1", "lownmg", "eastern", "big_chest_room_1")
dw $00A8 ; Screen ID
dw $11BA, $1478 ; Link Coords
dw $140B, $1100 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $04 ; Link direction
;-----------------------------
db $08 ; Entrance
db $41 ; Room layout
db $05 ; Main GFX
db $11 ; Music
db $00 ; Floor
db $04 ; Palace No
db $02 ; Door
db $01 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0005) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Dark Key Room", "lownmg", "eastern", "dark_key_room")
dw $00BA ; Screen ID
dw $14D1, $1678 ; Link Coords
dw $160B, $1400 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $06 ; Link direction
;-----------------------------
db $08 ; Entrance
db $00 ; Room layout
db $05 ; Main GFX
db $11 ; Music
db $00 ; Floor
db $04 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E0468, $00) ; Trap door state
%write16_enable()
%write16($7E0696, $0005) ; Overworld Door
%write16($7E0542, $0A4C) ; Object tilemap state
%write16($7E0546, $045E) ; Object tilemap state
%write16($7E054A, $0864) ; Object tilemap state
%write16($7E054E, $0A70) ; Object tilemap state
%write16($7E0540, $064C) ; Object tilemap state
%write16($7E0544, $0858) ; Object tilemap state
%write16($7E0548, $0C5E) ; Object tilemap state
%write16($7E054C, $0670) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Big Key DMG Boost", "lownmg", "eastern", "big_key_dmg_boost")
dw $00B9 ; Screen ID
dw $121F, $1678 ; Link Coords
dw $160B, $1200 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $06 ; Link direction
;-----------------------------
db $08 ; Entrance
db $C0 ; Room layout
db $05 ; Main GFX
db $11 ; Music
db $00 ; Floor
db $04 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0005) ; Overworld Door
%write16($7E0542, $1260) ; Object tilemap state
%write16($7E0546, $126C) ; Object tilemap state
%write16($7E0468, $0001) ; Trap door state
%write16($7E0540, $125C) ; Object tilemap state
%write16($7E0544, $1268) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FE0F4, $0014) ; Room $BA persistent: Eastern Palace (Dark Antifairy / Key Pot Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Big Chest Room 2", "lownmg", "eastern", "big_chest_room_2")
dw $00A8 ; Screen ID
dw $11BB, $1478 ; Link Coords
dw $140B, $1100 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $04 ; Link direction
;-----------------------------
db $08 ; Entrance
db $41 ; Room layout
db $05 ; Main GFX
db $11 ; Music
db $00 ; Floor
db $04 ; Palace No
db $02 ; Door
db $01 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0005) ; Overworld Door
%write16($7E0542, $13B2) ; Object tilemap state
%write16($7E0546, $1CB2) ; Object tilemap state
%write16($7E054A, $35E0) ; Object tilemap state
%write16($7E0540, $138A) ; Object tilemap state
%write16($7E0544, $1C8A) ; Object tilemap state
%write16($7E0548, $181E) ; Object tilemap state
%write16($7E0641, $0001) ; Room puzzle state (?)
%write16($7E0CFB, $041D) ; Rupee pull kill and damage counters
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Gifted With Greenies", "lownmg", "eastern", "gwg")
dw $00A9 ; Screen ID
dw $12F8, $1423 ; Link Coords
dw $1400, $1280 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $06 ; Link direction
;-----------------------------
db $08 ; Entrance
db $C0 ; Room layout
db $05 ; Main GFX
db $11 ; Music
db $00 ; Floor
db $04 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E0641, $00) ; Room puzzle state (?)
%write16_enable()
%write16($7E0696, $0005) ; Overworld Door
%write16($7E0542, $1370) ; Object tilemap state
%write16($7E0546, $1410) ; Object tilemap state
%write16($7E054A, $2C90) ; Object tilemap state
%write16($7E054E, $2CEC) ; Object tilemap state
%write16($7E0540, $146C) ; Object tilemap state
%write16($7E0544, $130C) ; Object tilemap state
%write16($7E0548, $2B90) ; Object tilemap state
%write16($7E054C, $2BEC) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pot Room", "lownmg", "eastern", "pot_room")
dw $0099 ; Screen ID
dw $1278, $1323 ; Link Coords
dw $1300, $1200 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
db $00 ; Link direction
;-----------------------------
db $08 ; Entrance
db $82 ; Room layout
db $05 ; Main GFX
db $11 ; Music
db $00 ; Floor
db $04 ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0005) ; Overworld Door
%write16($7E0542, $1454) ; Object tilemap state
%write16($7E0546, $1CAA) ; Object tilemap state
%write16($7E0540, $1428) ; Object tilemap state
%write16($7E0544, $13BE) ; Object tilemap state
%write16($7E0548, $1CD2) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FE0B2, $0008) ; Room $99 persistent: Eastern Palace (Eyegore Key Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Zeldagamer Room", "lownmg", "eastern", "zeldagamer_room")
dw $00D9 ; Screen ID
dw $121E, $1B78 ; Link Coords
dw $1B0B, $1200 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
db $00 ; Link direction
;-----------------------------
db $08 ; Entrance
db $02 ; Room layout
db $05 ; Main GFX
db $11 ; Music
db $01 ; Floor
db $04 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E0468, $00) ; Trap door state
%write16_enable()
%write16($7E0696, $0005) ; Overworld Door
%write16($7E0542, $1C5C) ; Object tilemap state
%write16($7E0540, $145C) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Armos", "lownmg", "eastern", "armos")
dw $00D8 ; Screen ID
dw $1178, $1A24 ; Link Coords
dw $1A00, $1100 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
db $04 ; Link direction
;-----------------------------
db $08 ; Entrance
db $01 ; Room layout
db $05 ; Main GFX
db $11 ; Music
db $01 ; Floor
db $04 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E03C4, $04) ; Ancilla Search Index
%write16_enable()
%write16($7E0696, $0005) ; Overworld Door
%write16($7E0542, $0ACA) ; Object tilemap state
%write16($7E0546, $0AF2) ; Object tilemap state
%write16($7E054A, $08F2) ; Object tilemap state
%write16($7E054E, $1860) ; Object tilemap state
%write16($7E0540, $08CA) ; Object tilemap state
%write16($7E0544, $0CCA) ; Object tilemap state
%write16($7E0548, $0CF2) ; Object tilemap state
%write16($7E054C, $185C) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FE130, $07FF) ; Room $D8 persistent: Eastern Palace (Zeldagamer Room / Pre-Armos Knights Room)
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; DESERT PALACE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_lownmg_desert:
%menu_header("Desert Palace", 14)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Eastern Palace", "lownmg", "desert", "outside_eastern_palace")
dw $001E ; Screen ID
dw $0F50, $062B ; Link Coords
dw $0600, $0ED6 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
db $00 ; Link direction
;-----------------------------
dw $0F5B, $066D ; Scroll X, Y
dw $005A ; Unknown 1
dw $0000 ; Unknown 2
dw $FFFA ; Unknown 3
;-----------------------------
%write8_enable()
%write8($7E0B09, $00) ; Arc variable
%write8($7E029F, $00) ; Arc variable
%write8($7E03C4, $03) ; Ancilla Search Index
%write8($7E02A1, $00) ; Arc variable
%write8($7E02A2, $17) ; Arc variable
%write8($7E0B08, $40) ; Arc variable
%write_7F()
%write8($7FE103, $52) ; Overworld $C1 persistent: UNKNOWN
%write8($7FE06E, $52) ; Overworld $77 persistent: Black Ice Cave
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Eastern Palace Spinspeed", "lownmg", "desert", "ep_spinspeed")
dw $0105 ; Screen ID
dw $0A78, $21D8 ; Link Coords
dw $2110, $0A00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $02 ; Link direction
;-----------------------------
db $08 ; Entrance
db $02 ; Room layout
db $0F ; Main GFX
db $18 ; Music
db $00 ; Floor
db $FF ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7EC167, $05) ; Underworld exit cache
%write8($7E0468, $01) ; Trap door state
%write8($7EC165, $20) ; Underworld exit cache
%write8($7EC166, $25) ; Underworld exit cache
%write16_enable()
%write16($7E0696, $000F) ; Overworld Door
%write16($7E0542, $1520) ; Object tilemap state
%write16($7EC140, $001E) ; Underworld exit cache
%write16($7EC144, $06D8) ; Underworld exit cache
%write16($7EC148, $0738) ; Underworld exit cache
%write16($7EC14C, $001E) ; Underworld exit cache
%write16($7EC150, $0745) ; Underworld exit cache
%write16($7EC154, $0600) ; Underworld exit cache
%write16($7EC158, $0C00) ; Underworld exit cache
%write16($7EC15C, $0520) ; Underworld exit cache
%write16($7EC160, $0B00) ; Underworld exit cache
%write16($7EC16C, $FFF8) ; Underworld exit cache
%write16($7EC170, $FFF6) ; Underworld exit cache
%write16($7E0540, $151C) ; Object tilemap state
%write16($7E0544, $141E) ; Object tilemap state
%write16($7EC142, $0016) ; Underworld exit cache
%write16($7EC146, $0C76) ; Underworld exit cache
%write16($7EC14A, $0CF0) ; Underworld exit cache
%write16($7EC14E, $0710) ; Underworld exit cache
%write16($7EC152, $0CFB) ; Underworld exit cache
%write16($7EC156, $091E) ; Underworld exit cache
%write16($7EC15A, $0F00) ; Underworld exit cache
%write16($7EC15E, $0A00) ; Underworld exit cache
%write16($7EC162, $1000) ; Underworld exit cache
%write16($7EC16A, $0008) ; Underworld exit cache
%write16($7EC16E, $000A) ; Underworld exit cache
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Bridge Screen", "lownmg", "desert", "bridge_screen")
dw $002E ; Screen ID
dw $0C0C, $0A68 ; Link Coords
dw $0A0A, $0C00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $02 ; Link direction
;-----------------------------
dw $0C85, $0A77 ; Scroll X, Y
dw $0000 ; Unknown 1
dw $FFF6 ; Unknown 2
dw $0000 ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FE167, $42) ; Overworld $F3 persistent: UNKNOWN
%write8($7FE04E, $42) ; Overworld $67 persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Unholy Spinspeed", "lownmg", "desert", "unholy_spinspeed")
dw $002A ; Screen ID
dw $0407, $0BA0 ; Link Coords
dw $0B1E, $0400 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $04 ; Link direction
;-----------------------------
dw $0485, $0B8D ; Scroll X, Y
dw $0900 ; Unknown 1
dw $0000 ; Unknown 2
dw $0000 ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FE07C, $A0) ; Overworld $7E persistent: UNKNOWN
%write8($7FE019, $1E) ; Overworld $4C persistent: UNKNOWN
%write8($7FE06D, $A1) ; Overworld $76 persistent: UNKNOWN
%write8($7FE161, $A1) ; Overworld $F0 persistent: UNKNOWN
%write8($7FE04E, $9F) ; Overworld $67 persistent: UNKNOWN
%write8($7FE06E, $2F) ; Overworld $77 persistent: Black Ice Cave
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Water Dash", "lownmg", "desert", "water_dash")
dw $002C ; Screen ID
dw $08D0, $0BE2 ; Link Coords
dw $0B1E, $085E ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $00 ; Link direction
;-----------------------------
dw $08DB, $0B8D ; Scroll X, Y
dw $090A ; Unknown 1
dw $0000 ; Unknown 2
dw $FFF2 ; Unknown 3
;-----------------------------
%write16_enable()
%write16($7E0542, $17DE) ; Object tilemap state
%write16($7E0546, $19D6) ; Object tilemap state
%write16($7E054A, $19E6) ; Object tilemap state
%write16($7E054E, $1BE6) ; Object tilemap state
%write16($7E0540, $17D6) ; Object tilemap state
%write16($7E0544, $17E6) ; Object tilemap state
%write16($7E0548, $19DE) ; Object tilemap state
%write16($7E054C, $1BD6) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Desert Palace", "lownmg", "desert", "outside_desert_palace")
dw $003A ; Screen ID
dw $0408, $0F88 ; Link Coords
dw $0F1E, $0400 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $02 ; Link direction
;-----------------------------
dw $0485, $0F8B ; Scroll X, Y
dw $0880 ; Unknown 1
dw $0000 ; Unknown 2
dw $0000 ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FE168, $3F) ; Overworld $F4 persistent: UNKNOWN
%write8($7FE01E, $01) ; Overworld $4F persistent: Mysterious Pond
%write8($7FE02B, $3F) ; Overworld $55 persistent: Dark Waterway
%write8($7FE0D7, $3A) ; Overworld $AB persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "lownmg", "desert", "desert_entrance")
dw $0030 ; Screen ID
dw $0128, $0CBA ; Link Coords
dw $0C58, $00AA ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $0C ; Item
db $04 ; Link direction
;-----------------------------
dw $012F, $0CC5 ; Scroll X, Y
dw $0294 ; Unknown 1
dw $0006 ; Unknown 2
dw $FFF6 ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Key Bonk", "lownmg", "desert", "keybonk")
dw $0073 ; Screen ID
dw $0778, $0F24 ; Link Coords
dw $0F00, $0700 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $0C ; Item
db $00 ; Link direction
;-----------------------------
db $49 ; Entrance
db $03 ; Room layout
db $12 ; Main GFX
db $11 ; Music
db $FF ; Floor
db $06 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0012) ; Overworld Door
%write16($7E0542, $159E) ; Object tilemap state
%write16($7E0546, $1890) ; Object tilemap state
%write16($7E054A, $1B9A) ; Object tilemap state
%write16($7E054E, $1A24) ; Object tilemap state
%write16($7E0552, $1724) ; Object tilemap state
%write16($7E0556, $0CB2) ; Object tilemap state
%write16($7E0540, $159A) ; Object tilemap state
%write16($7E0544, $1714) ; Object tilemap state
%write16($7E0548, $1A14) ; Object tilemap state
%write16($7E054C, $1B9E) ; Object tilemap state
%write16($7E0550, $18A8) ; Object tilemap state
%write16($7E0554, $0C8A) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FE068, $0001) ; Room $74 persistent: Desert Palace (Map Chest Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pre Cannonball Room", "lownmg", "desert", "pre_cannonball_room")
dw $0085 ; Screen ID
dw $0AD2, $1078 ; Link Coords
dw $100B, $0A00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $0C ; Item
db $00 ; Link direction
;-----------------------------
db $09 ; Entrance
db $40 ; Room layout
db $12 ; Main GFX
db $11 ; Music
db $FF ; Floor
db $06 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0012) ; Overworld Door
%write16($7E0542, $1C30) ; Object tilemap state
%write16($7E0540, $1C2C) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pot Room", "lownmg", "desert", "pot_room")
dw $0073 ; Screen ID
dw $071D, $0F78 ; Link Coords
dw $0F0B, $0700 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $0C ; Item
db $06 ; Link direction
;-----------------------------
db $09 ; Entrance
db $03 ; Room layout
db $12 ; Main GFX
db $11 ; Music
db $FF ; Floor
db $06 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0012) ; Overworld Door
%write16($7E0542, $159E) ; Object tilemap state
%write16($7E0546, $1890) ; Object tilemap state
%write16($7E054A, $1B9A) ; Object tilemap state
%write16($7E054E, $1A24) ; Object tilemap state
%write16($7E0552, $1724) ; Object tilemap state
%write16($7E0556, $0CB2) ; Object tilemap state
%write16($7E0540, $159A) ; Object tilemap state
%write16($7E0544, $1714) ; Object tilemap state
%write16($7E0548, $1A14) ; Object tilemap state
%write16($7E054C, $1B9E) ; Object tilemap state
%write16($7E0550, $18A8) ; Object tilemap state
%write16($7E0554, $0C8A) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FE08A, $001C) ; Room $85 persistent: Desert Palace (East Entrance Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Desert 2 Spinspeed", "lownmg", "desert", "desert2_spinspeed")
dw $0083 ; Screen ID
dw $0678, $11D8 ; Link Coords
dw $1110, $0600 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $0C ; Item
db $04 ; Link direction
;-----------------------------
db $09 ; Entrance
db $02 ; Room layout
db $12 ; Main GFX
db $11 ; Music
db $FF ; Floor
db $06 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0012) ; Overworld Door
%write16($7E0542, $0450) ; Object tilemap state
%write16($7E0546, $1C50) ; Object tilemap state
%write16($7E054A, $1914) ; Object tilemap state
%write16($7E054E, $1928) ; Object tilemap state
%write16($7E0540, $044C) ; Object tilemap state
%write16($7E0544, $1C4C) ; Object tilemap state
%write16($7E0548, $1514) ; Object tilemap state
%write16($7E054C, $191E) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Popo Genocide", "lownmg", "desert", "popo_genocide_room")
dw $0053 ; Screen ID
dw $0678, $0AD8 ; Link Coords
dw $0A10, $0600 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $0C ; Item
db $02 ; Link direction
;-----------------------------
db $09 ; Entrance
db $00 ; Room layout
db $12 ; Main GFX
db $11 ; Music
db $01 ; Floor
db $06 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0012) ; Overworld Door
%write16($7E0542, $0B60) ; Object tilemap state
%write16($7E0546, $0B68) ; Object tilemap state
%write16($7E054A, $1368) ; Object tilemap state
%write16($7E0540, $0B5C) ; Object tilemap state
%write16($7E0544, $0B64) ; Object tilemap state
%write16($7E0548, $08E2) ; Object tilemap state
%write16($7E054C, $1864) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Torches", "lownmg", "desert", "torches")
dw $0043 ; Screen ID
dw $0778, $0924 ; Link Coords
dw $0900, $0700 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $02 ; Link direction
;-----------------------------
db $0C ; Entrance
db $03 ; Room layout
db $12 ; Main GFX
db $11 ; Music
db $01 ; Floor
db $06 ; Palace No
db $01 ; Door
db $01 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0012) ; Overworld Door
%write16($7E0542, $044E) ; Object tilemap state
%write16($7E0546, $094E) ; Object tilemap state
%write16($7E054A, $1470) ; Object tilemap state
%write16($7E054E, $1C70) ; Object tilemap state
%write16($7E0552, $03B6) ; Object tilemap state
%write16($7E0556, $09B6) ; Object tilemap state
%write16($7E0540, $0442) ; Object tilemap state
%write16($7E0544, $0942) ; Object tilemap state
%write16($7E0548, $144C) ; Object tilemap state
%write16($7E054C, $1C4C) ; Object tilemap state
%write16($7E0550, $03AA) ; Object tilemap state
%write16($7E0554, $09AA) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FE026, $06E0) ; Room $53 persistent: Desert Palace (Popos 2 / Beamos Hellway Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Lanmolas", "lownmg", "desert", "lanmolas")
dw $0043 ; Screen ID
dw $0678, $0824 ; Link Coords
dw $0800, $0600 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $00 ; Link direction
;-----------------------------
db $0C ; Entrance
db $80 ; Room layout
db $12 ; Main GFX
db $11 ; Music
db $01 ; Floor
db $06 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E02A2, $00) ; Arc variable
%write16_enable()
%write16($7E0696, $0012) ; Overworld Door
%write16($7E0552, $83B6) ; Object tilemap state
%write16($7E0556, $89B6) ; Object tilemap state
%write16($7E0550, $83AA) ; Object tilemap state
%write16($7E0554, $89AA) ; Object tilemap state
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; TOWER OF HERA
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_lownmg_hera:
%menu_header("Tower of Hera", 14)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Desert Palace", "lownmg", "hera", "outside_desert_palace")
dw $0030 ; Screen ID
dw $0128, $0C3B ; Link Coords
dw $0C00, $00A2 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
db $00 ; Link direction
;-----------------------------
dw $012F, $0C6D ; Scroll X, Y
dw $0016 ; Unknown 1
dw $0000 ; Unknown 2
dw $000E ; Unknown 3
;-----------------------------
%write8_enable()
%write8($7E03C4, $00) ; Ancilla Search Index
%write8($7E02A2, $17) ; Arc variable
%write16_enable()
%write16($7E0468, $0000) ; Trap door state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Lake Hylia", "lownmg", "hera", "lake_hylia")
dw $003C ; Screen ID
dw $09E6, $0FA8 ; Link Coords
dw $0F1E, $0900 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $02 ; Link direction
;-----------------------------
dw $097D, $0F8B ; Scroll X, Y
dw $0820 ; Unknown 1
dw $0000 ; Unknown 2
dw $0000 ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FE048, $48) ; Overworld $64 persistent: UNKNOWN
%write8($7FE174, $09) ; Overworld $FA persistent: UNKNOWN
%write8($7FE07E, $01) ; Overworld $7F persistent: Dark Waterfall
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Ice Rod Overworld", "lownmg", "hera", "icerod_overworld")
dw $003F ; Screen ID
dw $0F70, $0E08 ; Link Coords
dw $0E00, $0EFE ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $06 ; Link direction
;-----------------------------
dw $0F7B, $0E6D ; Scroll X, Y
dw $001E ; Unknown 1
dw $0000 ; Unknown 2
dw $FFF2 ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FE038, $56) ; Overworld $5C persistent: UNKNOWN
%write8($7FE0C1, $09) ; Overworld $A0 persistent: UNKNOWN
%write8($7FE0D6, $09) ; Overworld $AB persistent: UNKNOWN
%write8($7FE047, $BB) ; Overworld $63 persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Waterwalk", "lownmg", "hera", "waterwalk")
dw $0120 ; Screen ID
dw $0078, $24D8 ; Link Coords
dw $2410, $0000 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $00 ; Link direction
;-----------------------------
db $0C ; Entrance
db $00 ; Room layout
db $06 ; Main GFX
db $1B ; Music
db $00 ; Floor
db $FF ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7EC167, $04) ; Underworld exit cache
%write8($7E0468, $01) ; Trap door state
%write8($7EC166, $27) ; Underworld exit cache
%write16_enable()
%write16($7E0696, $0006) ; Overworld Door
%write16($7EC140, $0037) ; Underworld exit cache
%write16($7EC144, $0C00) ; Underworld exit cache
%write16($7EC148, $0C47) ; Underworld exit cache
%write16($7EC14C, $0037) ; Underworld exit cache
%write16($7EC150, $0C6F) ; Underworld exit cache
%write16($7EC154, $0C00) ; Underworld exit cache
%write16($7EC158, $0E00) ; Underworld exit cache
%write16($7EC15C, $0B20) ; Underworld exit cache
%write16($7EC160, $0D00) ; Underworld exit cache
%write16($7EC16C, $0000) ; Underworld exit cache
%write16($7EC170, $0000) ; Underworld exit cache
%write16($7EC146, $0E00) ; Underworld exit cache
%write16($7EC14A, $0E48) ; Underworld exit cache
%write16($7EC14E, $0080) ; Underworld exit cache
%write16($7EC152, $0E7D) ; Underworld exit cache
%write16($7EC156, $0D1E) ; Underworld exit cache
%write16($7EC15E, $0E00) ; Underworld exit cache
%write16($7EC16A, $0000) ; Underworld exit cache
%write16($7EC16E, $0000) ; Underworld exit cache
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Death Mountain", "lownmg", "hera", "dm")
dw $00F1 ; Screen ID
dw $0378, $1FC1 ; Link Coords
dw $1F10, $0300 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $01 ; Item
db $02 ; Link direction
;-----------------------------
db $84 ; Entrance
db $C3 ; Room layout
db $06 ; Main GFX
db $12 ; Music
db $00 ; Floor
db $FF ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0006) ; Overworld Door
%write16($7E0540, $0540) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("After Mirror", "lownmg", "hera", "after_mirror")
dw $0003 ; Screen ID
dw $0718, $03C0 ; Link Coords
dw $031E, $06A4 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $01 ; Item
db $02 ; Link direction
;-----------------------------
dw $0723, $038D ; Scroll X, Y
dw $1816 ; Unknown 1
dw $0000 ; Unknown 2
dw $FFFC ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FDFCB, $F3) ; Overworld $25 persistent: Octorok Area
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Quickhop", "lownmg", "hera", "quickhop")
dw $0003 ; Screen ID
dw $081B, $0138 ; Link Coords
dw $00D4, $07A7 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $01 ; Item
db $06 ; Link direction
;-----------------------------
dw $0826, $0143 ; Scroll X, Y
dw $0638 ; Unknown 1
dw $000A ; Unknown 2
dw $0009 ; Unknown 3
;-----------------------------
%write8_enable()
%write8($7E029F, $02) ; Arc variable
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "lownmg", "hera", "entrance")
dw $0003 ; Screen ID
dw $08F0, $007E ; Link Coords
dw $001A, $087C ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $14 ; Item
db $04 ; Link direction
;-----------------------------
dw $08FB, $0089 ; Scroll X, Y
dw $0050 ; Unknown 1
dw $0004 ; Unknown 2
dw $FFF4 ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Tile room", "lownmg", "hera", "tile_room")
dw $0077 ; Screen ID
dw $0E78, $0E3B ; Link Coords
dw $0E00, $0E00 ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $06 ; Entrance
db $C0 ; Room layout
db $05 ; Main GFX
db $11 ; Music
db $01 ; Floor
db $14 ; Palace No
db $00 ; Door
db $01 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0005) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mini Moldorm Switch", "lownmg", "hera", "minimoldorm_switch")
dw $0087 ; Screen ID
dw $0ED4, $1078 ; Link Coords
dw $100C, $0E00 ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $33 ; Entrance
db $00 ; Room layout
db $05 ; Main GFX
db $11 ; Music
db $00 ; Floor
db $14 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0005) ; Overworld Door
%write16($7E0542, $0B10) ; Object tilemap state
%write16($7E0546, $0C18) ; Object tilemap state
%write16($7E054A, $0C28) ; Object tilemap state
%write16($7E054E, $1470) ; Object tilemap state
%write16($7E0552, $186C) ; Object tilemap state
%write16($7E0556, $1B6C) ; Object tilemap state
%write16($7E0468, $0000) ; Trap door state
%write16($7E0540, $0B0C) ; Object tilemap state
%write16($7E0544, $0C10) ; Object tilemap state
%write16($7E0548, $0C20) ; Object tilemap state
%write16($7E054C, $144C) ; Object tilemap state
%write16($7E0550, $1850) ; Object tilemap state
%write16($7E0554, $1B50) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Torches", "lownmg", "hera", "torches")
dw $0087 ; Screen ID
dw $0F78, $10D8 ; Link Coords
dw $1010, $0F00 ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $14 ; Item
db $06 ; Link direction
;-----------------------------
db $33 ; Entrance
db $01 ; Room layout
db $05 ; Main GFX
db $11 ; Music
db $00 ; Floor
db $14 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E0468, $01) ; Trap door state
%write16_enable()
%write16($7E0696, $0005) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Beetles", "lownmg", "hera", "beetles")
dw $0077 ; Screen ID
dw $0F68, $0F4B ; Link Coords
dw $0EDF, $0EF0 ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $14 ; Item
db $02 ; Link direction
;-----------------------------
db $33 ; Entrance
db $C3 ; Room layout
db $05 ; Main GFX
db $11 ; Music
db $01 ; Floor
db $14 ; Palace No
db $00 ; Door
db $01 ; Layer
;-----------------------------
%write8_enable()
%write8($7E02A2, $00) ; Arc variable
%write16_enable()
%write16($7E0696, $0005) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Petting Zoo", "lownmg", "hera", "petting_zoo")
dw $0031 ; Screen ID
dw $03B8, $0674 ; Link Coords
dw $0607, $0300 ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $33 ; Entrance
db $81 ; Room layout
db $05 ; Main GFX
db $11 ; Music
db $02 ; Floor
db $14 ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0005) ; Overworld Door
%write16($7E0542, $1C60) ; Object tilemap state
%write16($7E0540, $1C5C) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FDFE2, $0580) ; Room $31 persistent: Tower of Hera (Hardhat Beetles Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Moldorm", "lownmg", "hera", "moldorm")
dw $0017 ; Screen ID
dw $0FA8, $0274 ; Link Coords
dw $0207, $0F00 ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $33 ; Entrance
db $C1 ; Room layout
db $05 ; Main GFX
db $11 ; Music
db $04 ; Floor
db $14 ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E029F, $0C) ; Arc variable
%write16_enable()
%write16($7E0696, $0005) ; Overworld Door
%write16($7E0542, $0E64) ; Object tilemap state
%write16($7E0546, $1064) ; Object tilemap state
%write16($7E054A, $1264) ; Object tilemap state
%write16($7E054E, $0E68) ; Object tilemap state
%write16($7E0552, $1068) ; Object tilemap state
%write16($7E0556, $1268) ; Object tilemap state
%write16($7E0540, $0D64) ; Object tilemap state
%write16($7E0544, $0F64) ; Object tilemap state
%write16($7E0548, $1164) ; Object tilemap state
%write16($7E054C, $0D68) ; Object tilemap state
%write16($7E0550, $0F68) ; Object tilemap state
%write16($7E0554, $1168) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FDFCE, $0002) ; Room $27 persistent: Tower of Hera (Big Chest)
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; AGAHNIM'S TOWER
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_lownmg_aga:
%menu_header("Agahnim's Tower", 14)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Hera", "lownmg", "aga", "outside_hera")
dw $0003 ; Screen ID
dw $08F0, $007B ; Link Coords
dw $0017, $087C ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $01 ; Item
db $00 ; Link direction
;-----------------------------
dw $08FB, $0086 ; Scroll X, Y
dw $0050 ; Unknown 1
dw $0007 ; Unknown 2
dw $FFF4 ; Unknown 3
;-----------------------------
%write8_enable()
%write8($7E029F, $00) ; Arc variable
%write8($7E02A0, $17) ; Arc variable
%write_7F()
%write8($7FDFCB, $F3) ; Overworld $25 persistent: Octorok Area
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("First Rupee Tree", "lownmg", "aga", "first_rupee_tree")
dw $00E6 ; Screen ID
dw $0C78, $1DC0 ; Link Coords
dw $1D10, $0C00 ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $06 ; Item
db $02 ; Link direction
;-----------------------------
db $33 ; Entrance
db $C2 ; Room layout
db $06 ; Main GFX
db $12 ; Music
db $00 ; Floor
db $FF ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0006) ; Overworld Door
%write16($7E0542, $1058) ; Object tilemap state
%write16($7E0546, $1838) ; Object tilemap state
%write16($7E0540, $0C6C) ; Object tilemap state
%write16($7E0544, $1448) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FE14E, $0018) ; Room $E7 persistent: Cave
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Lost Woods", "lownmg", "aga", "lost_woods")
dw $0002 ; Screen ID
dw $0407, $007A ; Link Coords
dw $0016, $0400 ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $06 ; Item
db $02 ; Link direction
;-----------------------------
dw $048D, $0085 ; Scroll X, Y
dw $0100 ; Unknown 1
dw $0008 ; Unknown 2
dw $0000 ; Unknown 3
;-----------------------------
%write16_enable()
%write16($7E0CFB, $0001) ; Rupee pull kill and damage counters
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("After Grove", "lownmg", "aga", "after_grove")
dw $0000 ; Screen ID
dw $00A0, $00CB ; Link Coords
dw $006B, $0022 ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $06 ; Item
db $00 ; Link direction
;-----------------------------
dw $00A7, $00DA ; Scroll X, Y
dw $0306 ; Unknown 1
dw $FFF3 ; Unknown 2
dw $000E ; Unknown 3
;-----------------------------
%write16_enable()
%write16($7E0CFB, $0003) ; Rupee pull kill and damage counters
%write_7F()
%write8($7FE1E8, $E9) ; Overworld $134 persistent: UNKNOWN
%write8($7FE132, $01) ; Overworld $D9 persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("After Lost Woods", "lownmg", "aga", "after_lost_woods")
dw $0000 ; Screen ID
dw $0388, $03E0 ; Link Coords
dw $031E, $0300 ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $06 ; Item
db $02 ; Link direction
;-----------------------------
dw $0385, $038D ; Scroll X, Y
dw $1860 ; Unknown 1
dw $0000 ; Unknown 2
dw $0000 ; Unknown 3
;-----------------------------
%write16_enable()
%write16($7E0CFB, $0001) ; Rupee pull kill and damage counters
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Castle Screen", "lownmg", "aga", "castle_screen")
dw $001A ; Screen ID
dw $05E7, $0728 ; Link Coords
dw $06CA, $0500 ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $06 ; Item
db $02 ; Link direction
;-----------------------------
dw $057D, $0737 ; Scroll X, Y
dw $0620 ; Unknown 1
dw $FFF6 ; Unknown 2
dw $0000 ; Unknown 3
;-----------------------------
%write16_enable()
%write16($7E0CFB, $0003) ; Rupee pull kill and damage counters
%write_7F()
%write8($7FE06C, $43) ; Overworld $76 persistent: UNKNOWN
%write8($7FE144, $42) ; Overworld $E2 persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "lownmg", "aga", "entrance")
dw $001B ; Screen ID
dw $07F8, $065B ; Link Coords
dw $0600, $077E ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $06 ; Item
db $06 ; Link direction
;-----------------------------
dw $0803, $066D ; Scroll X, Y
dw $002E ; Unknown 1
dw $0000 ; Unknown 2
dw $FFF2 ; Unknown 3
;-----------------------------
%write16_enable()
%write16($7E0542, $044C) ; Object tilemap state
%write16($7E0540, $0470) ; Object tilemap state
%write_7F()
%write8($7FE0EF, $41) ; Overworld $B7 persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Fairy Skip", "lownmg", "aga", "fairy_skip")
dw $00E0 ; Screen ID
dw $00D1, $1C78 ; Link Coords
dw $1C0B, $0000 ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $03 ; Item
db $00 ; Link direction
;-----------------------------
db $04 ; Entrance
db $00 ; Room layout
db $04 ; Main GFX
db $10 ; Music
db $01 ; Floor
db $08 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0004) ; Overworld Door
%write16($7E0468, $0000) ; Trap door state
%write_7F()
%write16_enable()
%write16($7FE140, $0003) ; Room $E0 persistent: Agahnim's Tower (Entrance Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Dark Room of Despair", "lownmg", "aga", "dark_room_of_despair")
dw $00D0 ; Screen ID
dw $011F, $1A78 ; Link Coords
dw $1A0B, $0100 ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $03 ; Item
db $06 ; Link direction
;-----------------------------
db $24 ; Entrance
db $01 ; Room layout
db $04 ; Main GFX
db $10 ; Music
db $02 ; Floor
db $08 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0004) ; Overworld Door
%write16($7E0542, $0B8C) ; Object tilemap state
%write16($7E0546, $1030) ; Object tilemap state
%write16($7E054A, $1792) ; Object tilemap state
%write16($7E054E, $1C16) ; Object tilemap state
%write16($7E0552, $0D24) ; Object tilemap state
%write16($7E0468, $0001) ; Trap door state
%write16($7E0540, $059E) ; Object tilemap state
%write16($7E0544, $0D2A) ; Object tilemap state
%write16($7E0548, $14B0) ; Object tilemap state
%write16($7E054C, $1C0C) ; Object tilemap state
%write16($7E0550, $0A1E) ; Object tilemap state
%write16($7E0554, $1012) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FE140, $000F) ; Room $E0 persistent: Agahnim's Tower (Entrance Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Dark Room of Melancholy", "lownmg", "aga", "dark_room_of_melancholy")
dw $00C0 ; Screen ID
dw $011F, $1978 ; Link Coords
dw $190B, $0100 ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $03 ; Item
db $04 ; Link direction
;-----------------------------
db $24 ; Entrance
db $03 ; Room layout
db $04 ; Main GFX
db $10 ; Music
db $03 ; Floor
db $08 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0004) ; Overworld Door
%write16($7E0542, $0E0C) ; Object tilemap state
%write16($7E0546, $1B1C) ; Object tilemap state
%write16($7E054A, $06D8) ; Object tilemap state
%write16($7E054E, $0D24) ; Object tilemap state
%write16($7E0552, $1A10) ; Object tilemap state
%write16($7E0540, $0A30) ; Object tilemap state
%write16($7E0544, $1A0C) ; Object tilemap state
%write16($7E0548, $0710) ; Object tilemap state
%write16($7E054C, $06E4) ; Object tilemap state
%write16($7E0550, $1518) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FE120, $0030) ; Room $D0 persistent: Agahnim's Tower (Dark Maze)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spear Guards", "lownmg", "aga", "spear_guards")
dw $00C0 ; Screen ID
dw $0178, $1824 ; Link Coords
dw $1800, $0100 ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $03 ; Item
db $04 ; Link direction
;-----------------------------
db $24 ; Entrance
db $01 ; Room layout
db $04 ; Main GFX
db $10 ; Music
db $03 ; Floor
db $08 ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0004) ; Overworld Door
%write_7F()
%write16_enable()
%write16($7FE100, $0008) ; Room $C0 persistent: Agahnim's Tower (Dark Bridge Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Circle of Pots", "lownmg", "aga", "circle_of_pots")
dw $00B0 ; Screen ID
dw $0078, $16D8 ; Link Coords
dw $1610, $0000 ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $03 ; Item
db $00 ; Link direction
;-----------------------------
db $24 ; Entrance
db $00 ; Room layout
db $04 ; Main GFX
db $10 ; Music
db $04 ; Floor
db $08 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0004) ; Overworld Door
%write16($7E0542, $151C) ; Object tilemap state
%write16($7E0546, $1528) ; Object tilemap state
%write16($7E054A, $1910) ; Object tilemap state
%write16($7E054E, $1824) ; Object tilemap state
%write16($7E0552, $1B1C) ; Object tilemap state
%write16($7E0556, $1B28) ; Object tilemap state
%write16($7E055A, $172C) ; Object tilemap state
%write16($7E0468, $0000) ; Trap door state
%write16($7E0540, $1514) ; Object tilemap state
%write16($7E0544, $1520) ; Object tilemap state
%write16($7E0548, $1710) ; Object tilemap state
%write16($7E054C, $1818) ; Object tilemap state
%write16($7E0550, $1B14) ; Object tilemap state
%write16($7E0554, $1B20) ; Object tilemap state
%write16($7E0558, $192C) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FE0E0, $003F) ; Room $B0 persistent: Agahnim's Tower (Circle of Pots)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Catwalk", "lownmg", "aga", "catwalk")
dw $0040 ; Screen ID
dw $0134, $0978 ; Link Coords
dw $090B, $0100 ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $03 ; Item
db $02 ; Link direction
;-----------------------------
db $24 ; Entrance
db $03 ; Room layout
db $04 ; Main GFX
db $10 ; Music
db $05 ; Floor
db $08 ; Palace No
db $02 ; Door
db $01 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0004) ; Overworld Door
%write16($7E0468, $0001) ; Trap door state
%write_7F()
%write16_enable()
%write16($7FE0E0, $063F) ; Room $B0 persistent: Agahnim's Tower (Circle of Pots)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Agahnim", "lownmg", "aga", "agahnim")
dw $0030 ; Screen ID
dw $0078, $0624 ; Link Coords
dw $0600, $0000 ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $03 ; Item
db $04 ; Link direction
;-----------------------------
db $24 ; Entrance
db $00 ; Room layout
db $04 ; Main GFX
db $10 ; Music
db $06 ; Floor
db $08 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0004) ; Overworld Door
%write_7F()
%write16_enable()
%write16($7FDFE0, $0001) ; Room $30 persistent: Agahnim's Tower (Maiden Sacrifice Chamber)
%write16($7FE000, $0002) ; Room $40 persistent: Agahnim's Tower (Final Bridge Room)
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; PALACE OF DARKNESS
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_lownmg_pod:
%menu_header("Palace of Darkness", 14)

;---------------------------------------------------------------------------------------------------
%preset_OW("Pyramid", "lownmg", "pod", "pyramid")
dw $005B ; Screen ID
dw $07F0, $065C ; Link Coords
dw $0600, $0778 ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $03 ; Item
db $00 ; Link direction
;-----------------------------
dw $07F7, $066D ; Scroll X, Y
dw $002E ; Unknown 1
dw $0000 ; Unknown 2
dw $FFF8 ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Palace Overworld Screen", "lownmg", "pod", "pod_overworld")
dw $006E ; Screen ID
dw $0C70, $0A04 ; Link Coords
dw $0A00, $0C00 ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $03 ; Item
db $02 ; Link direction
;-----------------------------
dw $0C7D, $0A6D ; Scroll X, Y
dw $0000 ; Unknown 1
dw $0000 ; Unknown 2
dw $0000 ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FE00C, $DB) ; Overworld $46 persistent: UNKNOWN
%write8($7FE038, $42) ; Overworld $5C persistent: UNKNOWN
%write8($7FE110, $7A) ; Overworld $C8 persistent: UNKNOWN
%write8($7FE160, $42) ; Overworld $F0 persistent: UNKNOWN
%write8($7FE124, $AD) ; Overworld $D2 persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "lownmg", "pod", "entrance")
dw $005E ; Screen ID
dw $0F50, $063C ; Link Coords
dw $0600, $0EDE ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $03 ; Item
db $00 ; Link direction
;-----------------------------
dw $0F5B, $066F ; Scroll X, Y
dw $005C ; Unknown 1
dw $0000 ; Unknown 2
dw $0002 ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FDFCD, $23) ; Overworld $26 persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Main Hub (small key)", "lownmg", "pod", "main_hub_small_key")
dw $004A ; Screen ID
dw $14F8, $0824 ; Link Coords
dw $0800, $1480 ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $24 ; Entrance
db $80 ; Room layout
db $07 ; Main GFX
db $16 ; Music
db $00 ; Floor
db $0C ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0007) ; Overworld Door
%write16($7E0542, $0520) ; Object tilemap state
%write16($7E0546, $0B20) ; Object tilemap state
%write16($7E054A, $0844) ; Object tilemap state
%write16($7E054E, $056E) ; Object tilemap state
%write16($7E0552, $0B6E) ; Object tilemap state
%write16($7E0540, $050E) ; Object tilemap state
%write16($7E0544, $0B0E) ; Object tilemap state
%write16($7E0548, $0838) ; Object tilemap state
%write16($7E054C, $055C) ; Object tilemap state
%write16($7E0550, $0B5C) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Main Hub (bk)", "lownmg", "pod", "main_hub_bk")
dw $004A ; Screen ID
dw $14F8, $0824 ; Link Coords
dw $0800, $1480 ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $26 ; Entrance
db $80 ; Room layout
db $07 ; Main GFX
db $16 ; Music
db $00 ; Floor
db $0C ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E0B0C, $D0) ; Arc variable
%write16_enable()
%write16($7E0696, $0007) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Main Hub (hammerjump)", "lownmg", "pod", "main_hub_hammeryump")
dw $004A ; Screen ID
dw $14F8, $0824 ; Link Coords
dw $0800, $1480 ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $26 ; Entrance
db $80 ; Room layout
db $07 ; Main GFX
db $16 ; Music
db $00 ; Floor
db $0C ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0007) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Hammerjump", "lownmg", "pod", "hammeryump")
dw $002A ; Screen ID
dw $1478, $0424 ; Link Coords
dw $0400, $1400 ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $26 ; Entrance
db $C0 ; Room layout
db $07 ; Main GFX
db $16 ; Music
db $00 ; Floor
db $0C ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0007) ; Overworld Door
%write16($7E0542, $1350) ; Object tilemap state
%write16($7E0540, $0C50) ; Object tilemap state
%write16($7E0544, $1328) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Archery Contest", "lownmg", "pod", "before_sexy_statue")
dw $003A ; Screen ID
dw $1578, $0624 ; Link Coords
dw $0600, $1500 ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $26 ; Entrance
db $C1 ; Room layout
db $07 ; Main GFX
db $16 ; Music
db $00 ; Floor
db $0C ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E0B3F, $01) ; Arc variable
%write16_enable()
%write16($7E0696, $0007) ; Overworld Door
%write16($7E0542, $0B20) ; Object tilemap state
%write16($7E0546, $0C20) ; Object tilemap state
%write16($7E0540, $0B1C) ; Object tilemap state
%write16($7E0544, $0C1C) ; Object tilemap state
%write16($7E0548, $4E64) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Sexy Statue Room", "lownmg", "pod", "sexy_statue_room")
dw $002A ; Screen ID
dw $15BC, $04F8 ; Link Coords
dw $048B, $1500 ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $26 ; Entrance
db $C1 ; Room layout
db $07 ; Main GFX
db $16 ; Music
db $00 ; Floor
db $0C ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0007) ; Overworld Door
%write16($7E0542, $1350) ; Object tilemap state
%write16($7E0540, $0C50) ; Object tilemap state
%write16($7E0544, $1328) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mimics", "lownmg", "pod", "mimics")
dw $002B ; Screen ID
dw $1678, $0414 ; Link Coords
dw $0400, $1600 ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $03 ; Item
db $06 ; Link direction
;-----------------------------
db $26 ; Entrance
db $40 ; Room layout
db $07 ; Main GFX
db $16 ; Music
db $00 ; Floor
db $0C ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E0642, $01) ; Room puzzle state (?)
%write16_enable()
%write16($7E0696, $0007) ; Overworld Door
%write16($7E0542, $0610) ; Object tilemap state
%write16($7E0546, $052C) ; Object tilemap state
%write16($7E054A, $072C) ; Object tilemap state
%write16($7E054E, $1692) ; Object tilemap state
%write16($7E0552, $16AA) ; Object tilemap state
%write16($7E0556, $151E) ; Object tilemap state
%write16($7E0468, $0000) ; Trap door state
%write16($7E0540, $0510) ; Object tilemap state
%write16($7E0544, $0710) ; Object tilemap state
%write16($7E0548, $062C) ; Object tilemap state
%write16($7E054C, $1592) ; Object tilemap state
%write16($7E0550, $15AA) ; Object tilemap state
%write16($7E0554, $151A) ; Object tilemap state
%write16($7E0558, $1522) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Statue", "lownmg", "pod", "statue")
dw $001B ; Screen ID
dw $1678, $0324 ; Link Coords
dw $0300, $1600 ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $03 ; Item
db $00 ; Link direction
;-----------------------------
db $26 ; Entrance
db $02 ; Room layout
db $07 ; Main GFX
db $16 ; Music
db $00 ; Floor
db $0C ; Palace No
db $01 ; Door
db $01 ; Layer
;-----------------------------
%write8_enable()
%write8($7E0642, $00) ; Room puzzle state (?)
%write16_enable()
%write16($7E0696, $0007) ; Overworld Door
%write16($7E0542, $1728) ; Object tilemap state
%write16($7E0540, $1714) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FDFB6, $0038) ; Room $1B persistent: Palace of Darkness (Mimics / Moving Wall Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Basement", "lownmg", "pod", "basement")
dw $001B ; Screen ID
dw $1790, $024F ; Link Coords
dw $0200, $1700 ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $03 ; Item
db $00 ; Link direction
;-----------------------------
db $26 ; Entrance
db $81 ; Room layout
db $07 ; Main GFX
db $16 ; Music
db $00 ; Floor
db $0C ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E02A0, $00) ; Arc variable
%write8($7E03C4, $0D) ; Ancilla Search Index
%write8($7E0468, $01) ; Trap door state
%write8($7E03C4, $00) ; Ancilla Search Index
%write16_enable()
%write16($7E0696, $0007) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Turtle Room", "lownmg", "pod", "turtle_room")
dw $000B ; Screen ID
dw $1678, $00D4 ; Link Coords
dw $0010, $1600 ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $04 ; Item
db $02 ; Link direction
;-----------------------------
db $26 ; Entrance
db $00 ; Room layout
db $07 ; Main GFX
db $16 ; Music
db $FF ; Floor
db $0C ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0007) ; Overworld Door
%write16($7E0542, $0966) ; Object tilemap state
%write16($7E0546, $03CA) ; Object tilemap state
%write16($7E054A, $076A) ; Object tilemap state
%write16($7E054E, $095E) ; Object tilemap state
%write16($7E0552, $085E) ; Object tilemap state
%write16($7E0556, $1814) ; Object tilemap state
%write16($7E055A, $1854) ; Object tilemap state
%write16($7E0540, $0962) ; Object tilemap state
%write16($7E0544, $096A) ; Object tilemap state
%write16($7E0548, $0CCA) ; Object tilemap state
%write16($7E054C, $086A) ; Object tilemap state
%write16($7E0550, $075E) ; Object tilemap state
%write16($7E0554, $5760) ; Object tilemap state
%write16($7E0558, $1828) ; Object tilemap state
%write16($7E055C, $1864) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Helma", "lownmg", "pod", "helma")
dw $006A ; Screen ID
dw $1578, $0C26 ; Link Coords
dw $0C00, $1500 ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $04 ; Item
db $02 ; Link direction
;-----------------------------
db $26 ; Entrance
db $41 ; Room layout
db $07 ; Main GFX
db $16 ; Music
db $FF ; Floor
db $0C ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0007) ; Overworld Door
%write16($7E0542, $03F2) ; Object tilemap state
%write16($7E0540, $03CA) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FE054, $0010) ; Room $6A persistent: Palace of Darkness (Rupee Room)
%write16($7FDF96, $03F0) ; Room $B persistent: Palace of Darkness (Turtle Room)
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; THIEVES' TOWN
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_lownmg_thieves:
%menu_header("Thieves' Town", 19)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside PoD", "lownmg", "thieves", "outside_pod")
dw $005E ; Screen ID
dw $0F50, $063B ; Link Coords
dw $0600, $0ED6 ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $04 ; Item
db $00 ; Link direction
;-----------------------------
dw $0F5B, $066D ; Scroll X, Y
dw $005A ; Unknown 1
dw $0000 ; Unknown 2
dw $FFFA ; Unknown 3
;-----------------------------
%write8_enable()
%write8($7E0ABD, $00) ; Palette swap
%write8($7E0B09, $08) ; Arc variable
%write8($7E03C4, $04) ; Ancilla Search Index
%write8($7E0B08, $08) ; Arc variable
%write8($7E0B0C, $4F) ; Arc variable
%write_7F()
%write8($7FDFCD, $23) ; Overworld $26 persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Overworld Hammerdash", "lownmg", "thieves", "ow_hammerdash")
dw $006E ; Screen ID
dw $0C06, $0A6A ; Link Coords
dw $0A0C, $0C00 ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $03 ; Item
db $02 ; Link direction
;-----------------------------
dw $0C85, $0A79 ; Scroll X, Y
dw $0000 ; Unknown 1
dw $FFF4 ; Unknown 2
dw $0000 ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FE00C, $DB) ; Overworld $46 persistent: UNKNOWN
%write8($7FE038, $42) ; Overworld $5C persistent: UNKNOWN
%write8($7FE110, $7A) ; Overworld $C8 persistent: UNKNOWN
%write8($7FE160, $42) ; Overworld $F0 persistent: UNKNOWN
%write8($7FE124, $AD) ; Overworld $D2 persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Grove", "lownmg", "thieves", "grove")
dw $0072 ; Screen ID
dw $04DC, $0C04 ; Link Coords
dw $0C00, $045E ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $04 ; Item
db $04 ; Link direction
;-----------------------------
dw $04E3, $0C6D ; Scroll X, Y
dw $000C ; Unknown 1
dw $0000 ; Unknown 2
dw $0002 ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FE13B, $26) ; Overworld $DD persistent: UNKNOWN
%write8($7FE163, $42) ; Overworld $F1 persistent: UNKNOWN
%write8($7FE150, $42) ; Overworld $E8 persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Usain Bolt", "lownmg", "thieves", "usain_bolt")
dw $002A ; Screen ID
dw $0409, $0B9D ; Link Coords
dw $0B1E, $0400 ; Camera VH
db $1B, $08, $38, $01 ; Mirror portal
db $04 ; Item
db $00 ; Link direction
;-----------------------------
dw $0485, $0B8D ; Scroll X, Y
dw $0900 ; Unknown 1
dw $0000 ; Unknown 2
dw $0000 ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FE07C, $A0) ; Overworld $7E persistent: UNKNOWN
%write8($7FE019, $1E) ; Overworld $4C persistent: UNKNOWN
%write8($7FE06D, $A1) ; Overworld $76 persistent: UNKNOWN
%write8($7FE161, $A1) ; Overworld $F0 persistent: UNKNOWN
%write8($7FE04E, $9F) ; Overworld $67 persistent: UNKNOWN
%write8($7FE06E, $2F) ; Overworld $77 persistent: Black Ice Cave
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("After Activating Flute", "lownmg", "thieves", "after_activating_flute")
dw $0018 ; Screen ID
dw $01D0, $0798 ; Link Coords
dw $0734, $0152 ; Camera VH
db $8C, $04, $88, $0A ; Mirror portal
db $08 ; Item
db $00 ; Link direction
;-----------------------------
dw $01D7, $07A3 ; Scroll X, Y
dw $092C ; Unknown 1
dw $000A ; Unknown 2
dw $000E ; Unknown 3
;-----------------------------
%write8_enable()
%write8($7E02A1, $23) ; Arc variable
%write8($7E02A2, $FD) ; Arc variable
%write_7F()
%write8($7FE102, $42) ; Overworld $C1 persistent: UNKNOWN
%write8($7FE128, $DC) ; Overworld $D4 persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("After Warp", "lownmg", "thieves", "darkworld")
dw $0050 ; Screen ID
dw $016B, $0553 ; Link Coords
dw $04F5, $00ED ; Camera VH
db $8C, $04, $88, $0A ; Mirror portal
db $08 ; Item
db $00 ; Link direction
;-----------------------------
dw $0172, $0562 ; Scroll X, Y
dw $079E ; Unknown 1
dw $FFFB ; Unknown 2
dw $0003 ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FE068, $26) ; Overworld $74 persistent: Dark Swamp North
%write8($7FE045, $13) ; Overworld $62 persistent: Locked Chest House
%write8($7FE136, $1A) ; Overworld $DB persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "lownmg", "thieves", "entrance")
dw $0058 ; Screen ID
dw $01F8, $07C2 ; Link Coords
dw $075C, $017E ; Camera VH
db $8C, $04, $88, $0A ; Mirror portal
db $04 ; Item
db $04 ; Link direction
;-----------------------------
dw $0203, $07D1 ; Scroll X, Y
dw $0B2E ; Unknown 1
dw $0004 ; Unknown 2
dw $FFF2 ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FE0E3, $13) ; Overworld $B1 persistent: UNKNOWN
%write8($7FE148, $26) ; Overworld $E4 persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("After Big Key", "lownmg", "thieves", "after_big_key")
dw $00DB ; Screen ID
dw $17E3, $1B68 ; Link Coords
dw $1AFB, $1700 ; Camera VH
db $8C, $04, $88, $0A ; Mirror portal
db $04 ; Item
db $00 ; Link direction
;-----------------------------
db $26 ; Entrance
db $C3 ; Room layout
db $0A ; Main GFX
db $16 ; Music
db $FF ; Floor
db $16 ; Palace No
db $00 ; Door
db $01 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000A) ; Overworld Door
%write16($7E0542, $0470) ; Object tilemap state
%write16($7E0546, $333E) ; Object tilemap state
%write16($7E0540, $040C) ; Object tilemap state
%write16($7E0544, $1058) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Stalfos Hallway", "lownmg", "thieves", "blind_hallway")
dw $00CC ; Screen ID
dw $1978, $1824 ; Link Coords
dw $1800, $1900 ; Camera VH
db $8C, $04, $88, $0A ; Mirror portal
db $04 ; Item
db $06 ; Link direction
;-----------------------------
db $34 ; Entrance
db $C1 ; Room layout
db $0A ; Main GFX
db $16 ; Music
db $FF ; Floor
db $16 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000A) ; Overworld Door
%write16($7E0542, $0424) ; Object tilemap state
%write16($7E0546, $1C70) ; Object tilemap state
%write16($7E0540, $0470) ; Object tilemap state
%write16($7E0544, $1C24) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Conveyor Gibos", "lownmg", "thieves", "conveyor_gibos")
dw $00BC ; Screen ID
dw $181F, $1778 ; Link Coords
dw $170B, $1800 ; Camera VH
db $8C, $04, $88, $0A ; Mirror portal
db $04 ; Item
db $00 ; Link direction
;-----------------------------
db $34 ; Entrance
db $02 ; Room layout
db $0A ; Main GFX
db $16 ; Music
db $FF ; Floor
db $16 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000A) ; Overworld Door
%write16($7E0542, $03B2) ; Object tilemap state
%write16($7E0546, $0CB2) ; Object tilemap state
%write16($7E054A, $1430) ; Object tilemap state
%write16($7E054E, $1C30) ; Object tilemap state
%write16($7E0552, $1520) ; Object tilemap state
%write16($7E0556, $1B20) ; Object tilemap state
%write16($7E055A, $0466) ; Object tilemap state
%write16($7E0540, $038A) ; Object tilemap state
%write16($7E0544, $0C8A) ; Object tilemap state
%write16($7E0548, $140C) ; Object tilemap state
%write16($7E054C, $1C0C) ; Object tilemap state
%write16($7E0550, $151C) ; Object tilemap state
%write16($7E0554, $1B1C) ; Object tilemap state
%write16($7E0558, $0456) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FE0F8, $0340) ; Room $BC persistent: Thieves Town (Conveyor Toilet)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Hellway", "lownmg", "thieves", "hellway")
dw $00BB ; Screen ID
dw $171E, $1778 ; Link Coords
dw $170B, $1700 ; Camera VH
db $8C, $04, $88, $0A ; Mirror portal
db $04 ; Item
db $04 ; Link direction
;-----------------------------
db $34 ; Entrance
db $03 ; Room layout
db $0A ; Main GFX
db $16 ; Music
db $FF ; Floor
db $16 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E0ABD, $01) ; Palette swap
%write16_enable()
%write16($7E0696, $000A) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Bombable Floor", "lownmg", "thieves", "bombable_floor")
dw $0065 ; Screen ID
dw $0AD5, $0D78 ; Link Coords
dw $0D0B, $0A00 ; Camera VH
db $8C, $04, $88, $0A ; Mirror portal
db $04 ; Item
db $04 ; Link direction
;-----------------------------
db $34 ; Entrance
db $02 ; Room layout
db $0A ; Main GFX
db $16 ; Music
db $00 ; Floor
db $16 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E0ABD, $00) ; Palette swap
%write8($7E0B3F, $00) ; Arc variable
%write8($7E0B0C, $B0) ; Arc variable
%write16_enable()
%write16($7E0696, $000A) ; Overworld Door
%write16($7E0542, $1560) ; Object tilemap state
%write16($7E0546, $1660) ; Object tilemap state
%write16($7E054A, $1C68) ; Object tilemap state
%write16($7E0540, $155C) ; Object tilemap state
%write16($7E0544, $165C) ; Object tilemap state
%write16($7E0548, $1C64) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Backtracking", "lownmg", "thieves", "backtracking_1")
dw $0064 ; Screen ID
dw $0878, $0D24 ; Link Coords
dw $0D00, $0800 ; Camera VH
db $8C, $04, $88, $0A ; Mirror portal
db $04 ; Item
db $06 ; Link direction
;-----------------------------
db $34 ; Entrance
db $02 ; Room layout
db $0A ; Main GFX
db $16 ; Music
db $00 ; Floor
db $16 ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E029F, $03) ; Arc variable
%write16_enable()
%write16($7E0696, $000A) ; Overworld Door
%write16($7E0542, $1610) ; Object tilemap state
%write16($7E0546, $1C24) ; Object tilemap state
%write16($7E054A, $1C2C) ; Object tilemap state
%write16($7E0540, $160C) ; Object tilemap state
%write16($7E0544, $1614) ; Object tilemap state
%write16($7E0548, $1C28) ; Object tilemap state
%write16($7E054C, $1C30) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Basement", "lownmg", "thieves", "basement")
dw $00BC ; Screen ID
dw $1878, $1624 ; Link Coords
dw $1600, $1800 ; Camera VH
db $8C, $04, $88, $0A ; Mirror portal
db $01 ; Item
db $00 ; Link direction
;-----------------------------
db $34 ; Entrance
db $00 ; Room layout
db $0A ; Main GFX
db $16 ; Music
db $FF ; Floor
db $16 ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000A) ; Overworld Door
%write16($7E0542, $03B2) ; Object tilemap state
%write16($7E0546, $0CB2) ; Object tilemap state
%write16($7E054A, $1430) ; Object tilemap state
%write16($7E054E, $1C30) ; Object tilemap state
%write16($7E0552, $1520) ; Object tilemap state
%write16($7E0556, $1B20) ; Object tilemap state
%write16($7E055A, $0466) ; Object tilemap state
%write16($7E0540, $038A) ; Object tilemap state
%write16($7E0544, $0C8A) ; Object tilemap state
%write16($7E0548, $140C) ; Object tilemap state
%write16($7E054C, $1C0C) ; Object tilemap state
%write16($7E0550, $151C) ; Object tilemap state
%write16($7E0554, $1B1C) ; Object tilemap state
%write16($7E0558, $0456) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Prison", "lownmg", "thieves", "prison")
dw $0045 ; Screen ID
dw $0AD4, $0978 ; Link Coords
dw $090B, $0A00 ; Camera VH
db $8C, $04, $88, $0A ; Mirror portal
db $01 ; Item
db $00 ; Link direction
;-----------------------------
db $34 ; Entrance
db $02 ; Room layout
db $0A ; Main GFX
db $16 ; Music
db $FE ; Floor
db $16 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000A) ; Overworld Door
%write16($7E0542, $07A0) ; Object tilemap state
%write16($7E0546, $08A0) ; Object tilemap state
%write16($7E054A, $0C30) ; Object tilemap state
%write16($7E054E, $0B6C) ; Object tilemap state
%write16($7E0552, $10EC) ; Object tilemap state
%write16($7E0540, $079C) ; Object tilemap state
%write16($7E0544, $089C) ; Object tilemap state
%write16($7E0548, $040C) ; Object tilemap state
%write16($7E054C, $0B5C) ; Object tilemap state
%write16($7E0550, $10DC) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FE00A, $0002) ; Room $45 persistent: Thieves Town (Jail Cells Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Gloves", "lownmg", "thieves", "after_gloves")
dw $0044 ; Screen ID
dw $091C, $0978 ; Link Coords
dw $090B, $0900 ; Camera VH
db $8C, $04, $88, $0A ; Mirror portal
db $04 ; Item
db $06 ; Link direction
;-----------------------------
db $34 ; Entrance
db $43 ; Room layout
db $0A ; Main GFX
db $16 ; Music
db $FE ; Floor
db $16 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000A) ; Overworld Door
%write16($7E0542, $07D0) ; Object tilemap state
%write16($7E0546, $08D0) ; Object tilemap state
%write16($7E054A, $1624) ; Object tilemap state
%write16($7E054E, $1828) ; Object tilemap state
%write16($7E0552, $1A18) ; Object tilemap state
%write16($7E0556, $1A20) ; Object tilemap state
%write16($7E0540, $07CC) ; Object tilemap state
%write16($7E0544, $08CC) ; Object tilemap state
%write16($7E0548, $1618) ; Object tilemap state
%write16($7E054C, $1728) ; Object tilemap state
%write16($7E0550, $1928) ; Object tilemap state
%write16($7E0554, $1A1C) ; Object tilemap state
%write16($7E0558, $1A24) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FE00A, $00E2) ; Room $45 persistent: Thieves Town (Jail Cells Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Backtracking", "lownmg", "thieves", "backtracking_2")
dw $0044 ; Screen ID
dw $08D4, $0978 ; Link Coords
dw $090B, $0800 ; Camera VH
db $8C, $04, $88, $0A ; Mirror portal
db $04 ; Item
db $04 ; Link direction
;-----------------------------
db $34 ; Entrance
db $02 ; Room layout
db $0A ; Main GFX
db $16 ; Music
db $FE ; Floor
db $16 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E0B3F, $01) ; Arc variable
%write16_enable()
%write16($7E0696, $000A) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pot Hammerdash", "lownmg", "thieves", "pot_hammerdash")
dw $0045 ; Screen ID
dw $0A78, $0824 ; Link Coords
dw $0800, $0A00 ; Camera VH
db $8C, $04, $88, $0A ; Mirror portal
db $04 ; Item
db $06 ; Link direction
;-----------------------------
db $34 ; Entrance
db $00 ; Room layout
db $0A ; Main GFX
db $16 ; Music
db $FE ; Floor
db $16 ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000A) ; Overworld Door
%write16($7E0542, $07A0) ; Object tilemap state
%write16($7E0546, $08A0) ; Object tilemap state
%write16($7E054A, $0C30) ; Object tilemap state
%write16($7E054E, $0B6C) ; Object tilemap state
%write16($7E0552, $10EC) ; Object tilemap state
%write16($7E0540, $079C) ; Object tilemap state
%write16($7E0544, $089C) ; Object tilemap state
%write16($7E0548, $040C) ; Object tilemap state
%write16($7E054C, $0B5C) ; Object tilemap state
%write16($7E0550, $10DC) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FE008, $0080) ; Room $44 persistent: Thieves Town (Big Chest Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Blind", "lownmg", "thieves", "blind")
dw $00BC ; Screen ID
dw $1978, $1620 ; Link Coords
dw $1600, $1900 ; Camera VH
db $8C, $04, $88, $0A ; Mirror portal
db $04 ; Item
db $00 ; Link direction
;-----------------------------
db $34 ; Entrance
db $41 ; Room layout
db $0A ; Main GFX
db $16 ; Music
db $FF ; Floor
db $16 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E03C4, $0A) ; Ancilla Search Index
%write8($7E02A1, $00) ; Arc variable
%write8($7E02A2, $00) ; Arc variable
%write8($7E03C4, $04) ; Ancilla Search Index
%write16_enable()
%write16($7E0696, $000A) ; Overworld Door
%write16($7E0542, $03B2) ; Object tilemap state
%write16($7E0546, $0CB2) ; Object tilemap state
%write16($7E054A, $1430) ; Object tilemap state
%write16($7E054E, $1C30) ; Object tilemap state
%write16($7E0552, $1520) ; Object tilemap state
%write16($7E0556, $1B20) ; Object tilemap state
%write16($7E055A, $0466) ; Object tilemap state
%write16($7E0540, $038A) ; Object tilemap state
%write16($7E0544, $0C8A) ; Object tilemap state
%write16($7E0548, $140C) ; Object tilemap state
%write16($7E054C, $1C0C) ; Object tilemap state
%write16($7E0550, $151C) ; Object tilemap state
%write16($7E0554, $1B1C) ; Object tilemap state
%write16($7E0558, $0456) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FE0F8, $0002) ; Room $BC persistent: Thieves Town (Conveyor Toilet)
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; SKULL WOODS
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_lownmg_skull:
%menu_header("Skull Woods", 9)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Thieves", "lownmg", "skull", "outside_thieves")
dw $0058 ; Screen ID
dw $01F8, $07BB ; Link Coords
dw $075D, $0176 ; Camera VH
db $8C, $04, $88, $0A ; Mirror portal
db $03 ; Item
db $00 ; Link direction
;-----------------------------
dw $0203, $07CA ; Scroll X, Y
dw $0B2E ; Unknown 1
dw $0003 ; Unknown 2
dw $FFFA ; Unknown 3
;-----------------------------
%write8_enable()
%write8($7E03C4, $04) ; Ancilla Search Index
%write_7F()
%write8($7FE0E3, $13) ; Overworld $B1 persistent: UNKNOWN
%write8($7FE148, $26) ; Overworld $E4 persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Dash to Skull Woods", "lownmg", "skull", "dash_to_sw")
dw $0058 ; Screen ID
dw $0347, $0605 ; Link Coords
dw $0600, $02C1 ; Camera VH
db $8C, $04, $88, $0A ; Mirror portal
db $03 ; Item
db $02 ; Link direction
;-----------------------------
dw $034E, $066D ; Scroll X, Y
dw $005A ; Unknown 1
dw $0000 ; Unknown 2
dw $000F ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Mummy Room", "lownmg", "skull", "mummy_room")
dw $0040 ; Screen ID
dw $0248, $024B ; Link Coords
dw $01EB, $01C2 ; Camera VH
db $8C, $04, $88, $0A ; Mirror portal
db $03 ; Item
db $00 ; Link direction
;-----------------------------
dw $024F, $025A ; Scroll X, Y
dw $0EBA ; Unknown 1
dw $0003 ; Unknown 2
dw $000E ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FE0FA, $23) ; Overworld $BD persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Bomb Jump", "lownmg", "skull", "bomb_jump")
dw $0040 ; Screen ID
dw $02E8, $025D ; Link Coords
dw $01FF, $0266 ; Camera VH
db $8C, $04, $88, $0A ; Mirror portal
db $03 ; Item
db $00 ; Link direction
;-----------------------------
dw $02F3, $026C ; Scroll X, Y
dw $0F4E ; Unknown 1
dw $0001 ; Unknown 2
dw $000A ; Unknown 3
;-----------------------------
%write8_enable()
%write8($7E0B3F, $00) ; Arc variable
%write16_enable()
%write16($7E0542, $0420) ; Object tilemap state
%write16($7E0546, $161E) ; Object tilemap state
%write16($7E054A, $1B4C) ; Object tilemap state
%write16($7E054E, $175C) ; Object tilemap state
%write16($7E0540, $075C) ; Object tilemap state
%write16($7E0544, $140C) ; Object tilemap state
%write16($7E0548, $1430) ; Object tilemap state
%write16($7E054C, $1954) ; Object tilemap state
%write16($7E0550, $1764) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Key Pot", "lownmg", "skull", "key_pot")
dw $0056 ; Screen ID
dw $0D1F, $0B78 ; Link Coords
dw $0B0C, $0D00 ; Camera VH
db $8C, $04, $88, $0A ; Mirror portal
db $01 ; Item
db $00 ; Link direction
;-----------------------------
db $29 ; Entrance
db $43 ; Room layout
db $09 ; Main GFX
db $16 ; Music
db $FF ; Floor
db $10 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E029F, $00) ; Arc variable
%write16_enable()
%write16($7E0696, $0009) ; Overworld Door
%write16($7E0542, $140C) ; Object tilemap state
%write16($7E0546, $0A5C) ; Object tilemap state
%write16($7E054A, $080C) ; Object tilemap state
%write16($7E054E, $0614) ; Object tilemap state
%write16($7E0552, $0724) ; Object tilemap state
%write16($7E0556, $0918) ; Object tilemap state
%write16($7E055A, $0924) ; Object tilemap state
%write16($7E0540, $1430) ; Object tilemap state
%write16($7E0544, $0664) ; Object tilemap state
%write16($7E0548, $0A60) ; Object tilemap state
%write16($7E054C, $0830) ; Object tilemap state
%write16($7E0550, $0718) ; Object tilemap state
%write16($7E0554, $0628) ; Object tilemap state
%write16($7E0558, $0A14) ; Object tilemap state
%write16($7E055C, $0A28) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Skull Entrance", "lownmg", "skull", "skull_entrance")
dw $0040 ; Screen ID
dw $0098, $00CD ; Link Coords
dw $006B, $0016 ; Camera VH
db $8C, $04, $88, $0A ; Mirror portal
db $01 ; Item
db $04 ; Link direction
;-----------------------------
dw $00A3, $00D8 ; Scroll X, Y
dw $0282 ; Unknown 1
dw $0005 ; Unknown 2
dw $FFFA ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FE0FA, $23) ; Overworld $BD persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mummy Hellway", "lownmg", "skull", "mummy_hellway")
dw $0049 ; Screen ID
dw $12D0, $0978 ; Link Coords
dw $090B, $1200 ; Camera VH
db $8C, $04, $88, $0A ; Mirror portal
db $05 ; Item
db $00 ; Link direction
;-----------------------------
db $29 ; Entrance
db $02 ; Room layout
db $09 ; Main GFX
db $16 ; Music
db $FF ; Floor
db $10 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0009) ; Overworld Door
%write16($7E0542, $1490) ; Object tilemap state
%write16($7E0546, $1B9C) ; Object tilemap state
%write16($7E054A, $14AC) ; Object tilemap state
%write16($7E054E, $18AC) ; Object tilemap state
%write16($7E0552, $0F68) ; Object tilemap state
%write16($7E0556, $055C) ; Object tilemap state
%write16($7E055A, $0FEE) ; Object tilemap state
%write16($7E0540, $1390) ; Object tilemap state
%write16($7E0544, $1B90) ; Object tilemap state
%write16($7E0548, $1BA0) ; Object tilemap state
%write16($7E054C, $17AC) ; Object tilemap state
%write16($7E0550, $1CAC) ; Object tilemap state
%write16($7E0554, $1068) ; Object tilemap state
%write16($7E0558, $0FCE) ; Object tilemap state
%write16($7E055C, $1870) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FE012, $0400) ; Room $49 persistent: Skull Woods (Gibdo Torch Puzzle Room)
%write16($7FE032, $0003) ; Room $59 persistent: Skull Woods (Final Section Entrance Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mummy Key", "lownmg", "skull", "mummy_key")
dw $0049 ; Screen ID
dw $1278, $0824 ; Link Coords
dw $0800, $1200 ; Camera VH
db $8C, $04, $88, $0A ; Mirror portal
db $05 ; Item
db $06 ; Link direction
;-----------------------------
db $2B ; Entrance
db $00 ; Room layout
db $09 ; Main GFX
db $16 ; Music
db $FF ; Floor
db $10 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0009) ; Overworld Door
%write16($7E0556, $855C) ; Object tilemap state
%write16($7E055A, $8FEE) ; Object tilemap state
%write16($7E0468, $0000) ; Trap door state
%write16($7E0558, $8FCE) ; Object tilemap state
%write16($7E055C, $9870) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FE012, $0C01) ; Room $49 persistent: Skull Woods (Gibdo Torch Puzzle Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mothula", "lownmg", "skull", "mothula")
dw $0039 ; Screen ID
dw $12D1, $0778 ; Link Coords
dw $070B, $1200 ; Camera VH
db $8C, $04, $88, $0A ; Mirror portal
db $05 ; Item
db $00 ; Link direction
;-----------------------------
db $2B ; Entrance
db $02 ; Room layout
db $09 ; Main GFX
db $16 ; Music
db $FF ; Floor
db $10 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E0468, $01) ; Trap door state
%write16_enable()
%write16($7E0696, $0009) ; Overworld Door
%write16($7E0542, $1C30) ; Object tilemap state
%write16($7E0546, $1A64) ; Object tilemap state
%write16($7E0540, $140C) ; Object tilemap state
%write16($7E0544, $1664) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FDFF2, $0002) ; Room $39 persistent: Skull Woods (Gibdo Key / Mothula Hole Room)
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; MISERY MIRE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_lownmg_mire:
%menu_header("Misery Mire", 21)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Skull", "lownmg", "mire", "outside_skull")
dw $0040 ; Screen ID
dw $0098, $00CB ; Link Coords
dw $0069, $0016 ; Camera VH
db $8C, $04, $88, $0A ; Mirror portal
db $05 ; Item
db $06 ; Link direction
;-----------------------------
dw $00A3, $00D6 ; Scroll X, Y
dw $0282 ; Unknown 1
dw $0007 ; Unknown 2
dw $FFFA ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FE0FA, $23) ; Overworld $BD persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Death Mountain", "lownmg", "mire", "dm")
dw $0003 ; Screen ID
dw $0678, $0328 ; Link Coords
dw $02CA, $060E ; Camera VH
db $8C, $04, $88, $0A ; Mirror portal
db $03 ; Item
db $02 ; Link direction
;-----------------------------
dw $0683, $0337 ; Scroll X, Y
dw $1600 ; Unknown 1
dw $FFF6 ; Unknown 2
dw $FFF2 ; Unknown 3
;-----------------------------
%write8_enable()
%write8($7E02A2, $FD) ; Arc variable
%write_7F()
%write8($7FDFCB, $F3) ; Overworld $25 persistent: Octorok Area
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Bridge Warp", "lownmg", "mire", "bridge_warp")
dw $002C ; Screen ID
dw $0898, $0A07 ; Link Coords
dw $0A00, $0820 ; Camera VH
db $98, $00, $CB, $00 ; Mirror portal
db $08 ; Item
db $04 ; Link direction
;-----------------------------
dw $089F, $0A6D ; Scroll X, Y
dw $0004 ; Unknown 1
dw $0000 ; Unknown 2
dw $0000 ; Unknown 3
;-----------------------------
%write8_enable()
%write8($7E02A2, $00) ; Arc variable
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Lottery", "lownmg", "mire", "lottery")
dw $0055 ; Screen ID
dw $0BE7, $0588 ; Link Coords
dw $051E, $0B00 ; Camera VH
db $1C, $08, $39, $01 ; Mirror portal
db $08 ; Item
db $00 ; Link direction
;-----------------------------
dw $0B7D, $058D ; Scroll X, Y
dw $0920 ; Unknown 1
dw $0000 ; Unknown 2
dw $0000 ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FE17B, $DB) ; Overworld $FD persistent: UNKNOWN
%write8($7FE168, $D4) ; Overworld $F4 persistent: UNKNOWN
%write8($7FE166, $12) ; Overworld $F3 persistent: UNKNOWN
%write8($7FE111, $BB) ; Overworld $C8 persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Medallion", "lownmg", "mire", "medallion")
dw $0057 ; Screen ID
dw $0F70, $0407 ; Link Coords
dw $0400, $0EFE ; Camera VH
db $1C, $08, $39, $01 ; Mirror portal
db $14 ; Item
db $06 ; Link direction
;-----------------------------
dw $0F7B, $046F ; Scroll X, Y
dw $009E ; Unknown 1
dw $0000 ; Unknown 2
dw $FFF2 ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FDFCC, $56) ; Overworld $26 persistent: UNKNOWN
%write8($7FE06E, $09) ; Overworld $77 persistent: Black Ice Cave
%write8($7FE106, $09) ; Overworld $C3 persistent: UNKNOWN
%write8($7FE128, $09) ; Overworld $D4 persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Zoras Domain", "lownmg", "mire", "zoras_domain")
dw $000F ; Screen ID
dw $0F3B, $0215 ; Link Coords
dw $0200, $0EC9 ; Camera VH
db $1C, $08, $39, $01 ; Mirror portal
db $14 ; Item
db $00 ; Link direction
;-----------------------------
dw $0F46, $026F ; Scroll X, Y
dw $0098 ; Unknown 1
dw $0000 ; Unknown 2
dw $FFF7 ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FE05D, $59) ; Overworld $6E persistent: Outside Hedge Maze
%write8($7FDFA6, $38) ; Overworld $13 persistent: Sanctuary
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Mire Overworld Screen", "lownmg", "mire", "darkworld_warp")
dw $0030 ; Screen ID
dw $0078, $0FA8 ; Link Coords
dw $0F1E, $0000 ; Camera VH
db $9D, $0E, $A8, $02 ; Mirror portal
db $14 ; Item
db $00 ; Link direction
;-----------------------------
dw $008D, $0F8D ; Scroll X, Y
dw $1880 ; Unknown 1
dw $0000 ; Unknown 2
dw $0000 ; Unknown 3
;-----------------------------
%write8_enable()
%write8($7E02A2, $8B) ; Altitude
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Mire Entrance", "lownmg", "mire", "entrance")
dw $0070 ; Screen ID
dw $0128, $0CDE ; Link Coords
dw $0C7A, $00A6 ; Camera VH
db $9D, $0E, $A8, $02 ; Mirror portal
db $08 ; Item
db $02 ; Link direction
;-----------------------------
dw $0133, $0CE9 ; Scroll X, Y
dw $0394 ; Unknown 1
dw $0004 ; Unknown 2
dw $FFFA ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mire 2", "lownmg", "mire", "mire2")
dw $0098 ; Screen ID
dw $1188, $1324 ; Link Coords
dw $1300, $1100 ; Camera VH
db $9D, $0E, $A8, $02 ; Mirror portal
db $10 ; Item
db $00 ; Link direction
;-----------------------------
db $2B ; Entrance
db $83 ; Room layout
db $0C ; Main GFX
db $16 ; Music
db $00 ; Floor
db $0E ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000C) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Main Hub", "lownmg", "mire", "main_hub")
dw $00D2 ; Screen ID
dw $0578, $1A24 ; Link Coords
dw $1A00, $0500 ; Camera VH
db $9D, $0E, $A8, $02 ; Mirror portal
db $05 ; Item
db $00 ; Link direction
;-----------------------------
db $27 ; Entrance
db $C1 ; Room layout
db $0C ; Main GFX
db $16 ; Music
db $FF ; Floor
db $0E ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000C) ; Overworld Door
%write16($7E0468, $0000) ; Trap door state
%write_7F()
%write16_enable()
%write16($7FE124, $03EF) ; Room $D2 persistent: Misery Mire (Mire02 / Wizzrobes Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Beat the Fireball", "lownmg", "mire", "beat_the_fireball")
dw $00B2 ; Screen ID
dw $0578, $17D8 ; Link Coords
dw $1710, $0500 ; Camera VH
db $9D, $0E, $A8, $02 ; Mirror portal
db $05 ; Item
db $00 ; Link direction
;-----------------------------
db $27 ; Entrance
db $03 ; Room layout
db $0C ; Main GFX
db $16 ; Music
db $FF ; Floor
db $0E ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000C) ; Overworld Door
%write16($7E0542, $2930) ; Object tilemap state
%write16($7E0546, $284C) ; Object tilemap state
%write16($7E054A, $2A4C) ; Object tilemap state
%write16($7E0540, $2830) ; Object tilemap state
%write16($7E0544, $2A30) ; Object tilemap state
%write16($7E0548, $294C) ; Object tilemap state
%write16($7E054C, $185E) ; Object tilemap state
%write16($7E0641, $0001) ; Room puzzle state (?)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Bari Key", "lownmg", "mire", "bari_key")
dw $00C2 ; Screen ID
dw $041F, $1978 ; Link Coords
dw $190B, $0400 ; Camera VH
db $9D, $0E, $A8, $02 ; Mirror portal
db $05 ; Item
db $02 ; Link direction
;-----------------------------
db $27 ; Entrance
db $C2 ; Room layout
db $0C ; Main GFX
db $16 ; Music
db $FF ; Floor
db $0E ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E0641, $00) ; Room puzzle state (?)
%write16_enable()
%write16($7E0696, $000C) ; Overworld Door
%write16($7E0542, $3044) ; Object tilemap state
%write16($7E0546, $07B4) ; Object tilemap state
%write16($7E0468, $0001) ; Trap door state
%write16($7E0540, $2E64) ; Object tilemap state
%write16($7E0544, $3440) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Sluggulas", "lownmg", "mire", "sluggulas")
dw $00C1 ; Screen ID
dw $0278, $19DB ; Link Coords
dw $1910, $0200 ; Camera VH
db $9D, $0E, $A8, $02 ; Mirror portal
db $05 ; Item
db $04 ; Link direction
;-----------------------------
db $27 ; Entrance
db $02 ; Room layout
db $0C ; Main GFX
db $16 ; Music
db $FF ; Floor
db $0E ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000C) ; Overworld Door
%write16($7E0542, $1430) ; Object tilemap state
%write16($7E0546, $1C30) ; Object tilemap state
%write16($7E0540, $140C) ; Object tilemap state
%write16($7E0544, $1C0C) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FE102, $0200) ; Room $C1 persistent: Misery Mire (Compass Chest / Tile Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Torches", "lownmg", "mire", "torches")
dw $00D1 ; Screen ID
dw $02A8, $1A24 ; Link Coords
dw $1A00, $0200 ; Camera VH
db $9D, $0E, $A8, $02 ; Mirror portal
db $05 ; Item
db $02 ; Link direction
;-----------------------------
db $27 ; Entrance
db $00 ; Room layout
db $0C ; Main GFX
db $16 ; Music
db $FF ; Floor
db $0E ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000C) ; Overworld Door
%write16($7E0542, $0430) ; Object tilemap state
%write16($7E0546, $0C70) ; Object tilemap state
%write16($7E054A, $0470) ; Object tilemap state
%write16($7E0540, $07A8) ; Object tilemap state
%write16($7E0544, $0C4C) ; Object tilemap state
%write16($7E0548, $044C) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spark Avoidance", "lownmg", "mire", "spark_avoidance")
dw $00C1 ; Screen ID
dw $03D2, $1878 ; Link Coords
dw $180B, $0300 ; Camera VH
db $9D, $0E, $A8, $02 ; Mirror portal
db $05 ; Item
db $00 ; Link direction
;-----------------------------
db $27 ; Entrance
db $01 ; Room layout
db $0C ; Main GFX
db $16 ; Music
db $FF ; Floor
db $0E ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000C) ; Overworld Door
%write16($7E0542, $1430) ; Object tilemap state
%write16($7E0546, $1C30) ; Object tilemap state
%write16($7E0540, $140C) ; Object tilemap state
%write16($7E0544, $1C0C) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Big Chest Room", "lownmg", "mire", "big_chest_room")
dw $00C3 ; Screen ID
dw $06D0, $1978 ; Link Coords
dw $190B, $0600 ; Camera VH
db $9D, $0E, $A8, $02 ; Mirror portal
db $05 ; Item
db $06 ; Link direction
;-----------------------------
db $27 ; Entrance
db $42 ; Room layout
db $0C ; Main GFX
db $16 ; Music
db $FF ; Floor
db $0E ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000C) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Wizzrobe", "lownmg", "mire", "wizzrobe")
dw $00B3 ; Screen ID
dw $0630, $1678 ; Link Coords
dw $160B, $0600 ; Camera VH
db $9D, $0E, $A8, $02 ; Mirror portal
db $05 ; Item
db $06 ; Link direction
;-----------------------------
db $27 ; Entrance
db $00 ; Room layout
db $0C ; Main GFX
db $16 ; Music
db $FF ; Floor
db $0E ; Palace No
db $02 ; Door
db $01 ; Layer
;-----------------------------
%write8_enable()
%write8($7E0B3F, $01) ; Arc variable
%write16_enable()
%write16($7E0696, $000C) ; Overworld Door
%write16($7E0542, $1430) ; Object tilemap state
%write16($7E0540, $140C) ; Object tilemap state
%write16($7E0544, $1C30) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Basement", "lownmg", "mire", "basement")
dw $00A2 ; Screen ID
dw $04F8, $143D ; Link Coords
dw $1400, $0480 ; Camera VH
db $9D, $0E, $A8, $02 ; Mirror portal
db $05 ; Item
db $04 ; Link direction
;-----------------------------
db $27 ; Entrance
db $C0 ; Room layout
db $0C ; Main GFX
db $16 ; Music
db $FF ; Floor
db $0E ; Palace No
db $00 ; Door
db $01 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000C) ; Overworld Door
%write16($7E0540, $1C0C) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FE0E4, $0001) ; Room $B2 persistent: Misery Mire (Slug Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spooky Action 1", "lownmg", "mire", "spooky_action_1")
dw $0093 ; Screen ID
dw $061F, $1378 ; Link Coords
dw $130B, $0600 ; Camera VH
db $9D, $0E, $A8, $02 ; Mirror portal
db $05 ; Item
db $00 ; Link direction
;-----------------------------
db $27 ; Entrance
db $02 ; Room layout
db $0C ; Main GFX
db $16 ; Music
db $FE ; Floor
db $0E ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000C) ; Overworld Door
%write16($7E0542, $0760) ; Object tilemap state
%write16($7E0546, $17A0) ; Object tilemap state
%write16($7E054A, $18A0) ; Object tilemap state
%write16($7E0540, $071C) ; Object tilemap state
%write16($7E0544, $179C) ; Object tilemap state
%write16($7E0548, $189C) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spooky Action 2", "lownmg", "mire", "spooky_action_2")
dw $0092 ; Screen ID
dw $051F, $1378 ; Link Coords
dw $130B, $0500 ; Camera VH
db $9D, $0E, $A8, $02 ; Mirror portal
db $12 ; Item
db $04 ; Link direction
;-----------------------------
db $27 ; Entrance
db $43 ; Room layout
db $0C ; Main GFX
db $16 ; Music
db $FE ; Floor
db $0E ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E0B3F, $00) ; Arc variable
%write16_enable()
%write16($7E0696, $000C) ; Overworld Door
%write16($7E0542, $175C) ; Object tilemap state
%write16($7E0546, $1768) ; Object tilemap state
%write16($7E0540, $1756) ; Object tilemap state
%write16($7E0544, $1762) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Vitreous", "lownmg", "mire", "vitty")
dw $00A0 ; Screen ID
dw $0078, $1424 ; Link Coords
dw $1400, $0000 ; Camera VH
db $9D, $0E, $A8, $02 ; Mirror portal
db $05 ; Item
db $04 ; Link direction
;-----------------------------
db $27 ; Entrance
db $C0 ; Room layout
db $0C ; Main GFX
db $16 ; Music
db $FF ; Floor
db $0E ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000C) ; Overworld Door
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; SWAMP PALACE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_lownmg_swamp:
%menu_header("Swamp Palace", 18)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Mire", "lownmg", "swamp", "outside_mire")
dw $0070 ; Screen ID
dw $0128, $0CDA ; Link Coords
dw $0C7C, $00A6 ; Camera VH
db $9D, $0E, $A8, $02 ; Mirror portal
db $03 ; Item
db $00 ; Link direction
;-----------------------------
dw $0133, $0CE9 ; Scroll X, Y
dw $0414 ; Unknown 1
dw $0004 ; Unknown 2
dw $FFFA ; Unknown 3
;-----------------------------
%write8_enable()
%write8($7E03C4, $00) ; Ancilla Search Index
%write8($7E02A2, $00) ; Arc variable
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Link's House", "lownmg", "swamp", "links_house")
dw $002C ; Screen ID
dw $08B8, $0B17 ; Link Coords
dw $0AB9, $0840 ; Camera VH
db $9D, $0E, $A8, $02 ; Mirror portal
db $12 ; Item
db $02 ; Link direction
;-----------------------------
dw $08BF, $0B26 ; Scroll X, Y
dw $0588 ; Unknown 1
dw $FFF7 ; Unknown 2
dw $0000 ; Unknown 3
;-----------------------------
%write8_enable()
%write8($7E02A2, $FE) ; Arc variable
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Swamp Overworld", "lownmg", "swamp", "swamp_overworld")
dw $0073 ; Screen ID
dw $07AF, $0DE0 ; Link Coords
dw $0D1E, $0700 ; Camera VH
db $28, $01, $DA, $0C ; Mirror portal
db $08 ; Item
db $04 ; Link direction
;-----------------------------
dw $0785, $0D8B ; Scroll X, Y
dw $08A0 ; Unknown 1
dw $0000 ; Unknown 2
dw $0000 ; Unknown 3
;-----------------------------
%write8_enable()
%write8($7E02A2, $A7) ; Arc variable
%write_7F()
%write8($7FE147, $AB) ; Overworld $E3 persistent: UNKNOWN
%write8($7FE164, $A9) ; Overworld $F2 persistent: UNKNOWN
%write8($7FE059, $13) ; Overworld $6C persistent: Dark Link's House
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Antifairy Room", "lownmg", "swamp", "antifairy_room")
dw $003B ; Screen ID
dw $0778, $0EED ; Link Coords
dw $0E8E, $06FB ; Camera VH
db $28, $01, $DA, $0C ; Mirror portal
db $04 ; Item
db $02 ; Link direction
;-----------------------------
dw $0780, $0EFB ; Scroll X, Y
dw $04A0 ; Unknown 1
dw $0002 ; Unknown 2
dw $0005 ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FE153, $D3) ; Overworld $E9 persistent: UNKNOWN
%write8($7FE07C, $09) ; Overworld $7E persistent: UNKNOWN
%write8($7FE164, $EC) ; Overworld $F2 persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "lownmg", "swamp", "entrance")
dw $007B ; Screen ID
dw $0778, $0EEE ; Link Coords
dw $0E90, $06FB ; Camera VH
db $7C, $07, $04, $0F ; Mirror portal
db $14 ; Item
db $00 ; Link direction
;-----------------------------
dw $0780, $0EFD ; Scroll X, Y
dw $04A0 ; Unknown 1
dw $0000 ; Unknown 2
dw $0005 ; Unknown 3
;-----------------------------
%write8_enable()
%write8($7E0B0C, $F0) ; Arc variable
%write16_enable()
%write16($7E0542, $193E) ; Object tilemap state
%write16($7E0540, $193A) ; Object tilemap state
%write16($7E0544, $1842) ; Object tilemap state
%write_7F()
%write8($7FE07D, $13) ; Overworld $7E persistent: UNKNOWN
%write8($7FE126, $AB) ; Overworld $D3 persistent: UNKNOWN
%write8($7FE0E2, $AA) ; Overworld $B1 persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("First Key Pot", "lownmg", "swamp", "first_key_pot")
dw $0028 ; Screen ID
dw $1078, $0425 ; Link Coords
dw $0400, $1000 ; Camera VH
db $7C, $07, $04, $0F ; Mirror portal
db $04 ; Item
db $00 ; Link direction
;-----------------------------
db $4E ; Entrance
db $C0 ; Room layout
db $08 ; Main GFX
db $16 ; Music
db $00 ; Floor
db $0A ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0008) ; Overworld Door
%write_7F()
%write16_enable()
%write16($7FDFD0, $000E) ; Room $28 persistent: Swamp Palace (Entrance Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Tiny Hallway Key", "lownmg", "swamp", "hallway_key_1")
dw $0037 ; Screen ID
dw $0EF8, $0734 ; Link Coords
dw $0700, $0E80 ; Camera VH
db $7C, $07, $04, $0F ; Mirror portal
db $04 ; Item
db $00 ; Link direction
;-----------------------------
db $25 ; Entrance
db $82 ; Room layout
db $08 ; Main GFX
db $16 ; Music
db $FF ; Floor
db $0A ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0008) ; Overworld Door
%write16($7E0542, $0520) ; Object tilemap state
%write16($7E0546, $1430) ; Object tilemap state
%write16($7E0540, $0420) ; Object tilemap state
%write16($7E0544, $0620) ; Object tilemap state
%write16($7E0548, $063C) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FDFF0, $0002) ; Room $38 persistent: Swamp Palace (Key Pot Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Water Lever 1", "lownmg", "swamp", "water_lever_1")
dw $0037 ; Screen ID
dw $0E78, $0724 ; Link Coords
dw $0700, $0E00 ; Camera VH
db $7C, $07, $04, $0F ; Mirror portal
db $04 ; Item
db $00 ; Link direction
;-----------------------------
db $25 ; Entrance
db $82 ; Room layout
db $08 ; Main GFX
db $16 ; Music
db $FF ; Floor
db $0A ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0008) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Main Hub", "lownmg", "swamp", "main_hub")
dw $0037 ; Screen ID
dw $0E1F, $0778 ; Link Coords
dw $070B, $0E00 ; Camera VH
db $7C, $07, $04, $0F ; Mirror portal
db $04 ; Item
db $00 ; Link direction
;-----------------------------
db $25 ; Entrance
db $82 ; Room layout
db $08 ; Main GFX
db $16 ; Music
db $FF ; Floor
db $0A ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0008) ; Overworld Door
%write_7F()
%write16_enable()
%write16($7FDFEE, $0002) ; Room $37 persistent: Swamp Palace (Map Chest / Water Fill Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Water Lever 2", "lownmg", "swamp", "water_lever_2")
dw $0036 ; Screen ID
dw $0C1B, $0678 ; Link Coords
dw $060B, $0C00 ; Camera VH
db $7C, $07, $04, $0F ; Mirror portal
db $04 ; Item
db $04 ; Link direction
;-----------------------------
db $25 ; Entrance
db $C0 ; Room layout
db $08 ; Main GFX
db $16 ; Music
db $FF ; Floor
db $0A ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E0B0C, $A0) ; Arc variable
%write16_enable()
%write16($7E0696, $0008) ; Overworld Door
%write16($7E0542, $0F9A) ; Object tilemap state
%write16($7E0546, $05C0) ; Object tilemap state
%write16($7E054A, $0470) ; Object tilemap state
%write16($7E054E, $1072) ; Object tilemap state
%write16($7E0540, $100A) ; Object tilemap state
%write16($7E0544, $05BC) ; Object tilemap state
%write16($7E0548, $046C) ; Object tilemap state
%write16($7E054C, $0FDE) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FDFEC, $0031) ; Room $36 persistent: Swamp Palace (Big Chest Room)
%write16($7FDFEA, $0240) ; Room $35 persistent: Swamp Palace (Big Key / BS Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Sociable Firebar", "lownmg", "swamp", "sociable_firebar")
dw $0034 ; Screen ID
dw $0878, $0725 ; Link Coords
dw $06B8, $0800 ; Camera VH
db $7C, $07, $04, $0F ; Mirror portal
db $04 ; Item
db $04 ; Link direction
;-----------------------------
db $25 ; Entrance
db $C2 ; Room layout
db $08 ; Main GFX
db $16 ; Music
db $FF ; Floor
db $0A ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0008) ; Overworld Door
%write16($7E0542, $085C) ; Object tilemap state
%write16($7E0546, $572A) ; Object tilemap state
%write16($7E054A, $5922) ; Object tilemap state
%write16($7E0540, $084E) ; Object tilemap state
%write16($7E0544, $5722) ; Object tilemap state
%write16($7E0548, $5726) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Backtracking", "lownmg", "swamp", "backtracking")
dw $0035 ; Screen ID
dw $0A1C, $0678 ; Link Coords
dw $060B, $0A00 ; Camera VH
db $7C, $07, $04, $0F ; Mirror portal
db $04 ; Item
db $00 ; Link direction
;-----------------------------
db $25 ; Entrance
db $80 ; Room layout
db $08 ; Main GFX
db $16 ; Music
db $FF ; Floor
db $0A ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0008) ; Overworld Door
%write16($7E0542, $0818) ; Object tilemap state
%write16($7E0546, $0820) ; Object tilemap state
%write16($7E054A, $1430) ; Object tilemap state
%write16($7E054E, $1C4C) ; Object tilemap state
%write16($7E0552, $1B64) ; Object tilemap state
%write16($7E0556, $1CF2) ; Object tilemap state
%write16($7E0540, $0814) ; Object tilemap state
%write16($7E0544, $081C) ; Object tilemap state
%write16($7E0548, $0824) ; Object tilemap state
%write16($7E054C, $174C) ; Object tilemap state
%write16($7E0550, $16F0) ; Object tilemap state
%write16($7E0554, $1758) ; Object tilemap state
%write16($7E0558, $063C) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Hookshot", "lownmg", "swamp", "hook_shot")
dw $0035 ; Screen ID
dw $0BD4, $0778 ; Link Coords
dw $070B, $0B00 ; Camera VH
db $7C, $07, $04, $0F ; Mirror portal
db $04 ; Item
db $04 ; Link direction
;-----------------------------
db $25 ; Entrance
db $83 ; Room layout
db $08 ; Main GFX
db $16 ; Music
db $FF ; Floor
db $0A ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0008) ; Overworld Door
%write_7F()
%write16_enable()
%write16($7FDFE8, $0003) ; Room $34 persistent: Swamp Palace (Push Block Puzzle / Pre-Big Key Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Hookdash", "lownmg", "swamp", "hookdash")
dw $0036 ; Screen ID
dw $0CF8, $0624 ; Link Coords
dw $0600, $0C80 ; Camera VH
db $7C, $07, $04, $0F ; Mirror portal
db $04 ; Item
db $06 ; Link direction
;-----------------------------
db $25 ; Entrance
db $C0 ; Room layout
db $08 ; Main GFX
db $16 ; Music
db $FF ; Floor
db $0A ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0008) ; Overworld Door
%write16($7E0542, $0F9A) ; Object tilemap state
%write16($7E0546, $05C0) ; Object tilemap state
%write16($7E054A, $0470) ; Object tilemap state
%write16($7E054E, $1072) ; Object tilemap state
%write16($7E0540, $100A) ; Object tilemap state
%write16($7E0544, $05BC) ; Object tilemap state
%write16($7E0548, $046C) ; Object tilemap state
%write16($7E054C, $0FDE) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Water Lever 3", "lownmg", "swamp", "water_lever_3")
dw $0026 ; Screen ID
dw $0DA8, $0423 ; Link Coords
dw $0400, $0D00 ; Camera VH
db $7C, $07, $04, $0F ; Mirror portal
db $0E ; Item
db $00 ; Link direction
;-----------------------------
db $25 ; Entrance
db $01 ; Room layout
db $08 ; Main GFX
db $16 ; Music
db $FF ; Floor
db $0A ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0008) ; Overworld Door
%write16($7E0542, $041C) ; Object tilemap state
%write16($7E0546, $1A16) ; Object tilemap state
%write16($7E0540, $080C) ; Object tilemap state
%write16($7E0544, $1396) ; Object tilemap state
%write16($7E0548, $1ADC) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FDFCC, $0400) ; Room $26 persistent: Swamp Palace (Statue Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Restock Room", "lownmg", "swamp", "restock")
dw $0066 ; Screen ID
dw $0D78, $0D33 ; Link Coords
dw $0D00, $0D00 ; Camera VH
db $7C, $07, $04, $0F ; Mirror portal
db $0E ; Item
db $00 ; Link direction
;-----------------------------
db $25 ; Entrance
db $83 ; Room layout
db $08 ; Main GFX
db $16 ; Music
db $FE ; Floor
db $0A ; Palace No
db $01 ; Door
db $01 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0008) ; Overworld Door
%write16($7E0542, $0654) ; Object tilemap state
%write16($7E0546, $0668) ; Object tilemap state
%write16($7E054A, $2630) ; Object tilemap state
%write16($7E054E, $2634) ; Object tilemap state
%write16($7E0552, $2638) ; Object tilemap state
%write16($7E0540, $0554) ; Object tilemap state
%write16($7E0544, $0568) ; Object tilemap state
%write16($7E0548, $2530) ; Object tilemap state
%write16($7E054C, $2534) ; Object tilemap state
%write16($7E0550, $2538) ; Object tilemap state
%write16($7E0554, $383C) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FE04C, $00C0) ; Room $66 persistent: Swamp Palace (Hidden Chest / Hidden Door Room)
%write16($7FE06C, $0002) ; Room $76 persistent: Swamp Palace (Water Drain Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Phelps Way", "lownmg", "swamp", "phelps_way")
dw $0016 ; Screen ID
dw $0D78, $02D8 ; Link Coords
dw $0210, $0D00 ; Camera VH
db $7C, $07, $04, $0F ; Mirror portal
db $0E ; Item
db $00 ; Link direction
;-----------------------------
db $25 ; Entrance
db $81 ; Room layout
db $08 ; Main GFX
db $16 ; Music
db $FF ; Floor
db $0A ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0008) ; Overworld Door
%write16($7E0542, $03C0) ; Object tilemap state
%write16($7E0546, $04C0) ; Object tilemap state
%write16($7E054A, $05C0) ; Object tilemap state
%write16($7E054E, $06C0) ; Object tilemap state
%write16($7E0540, $03BC) ; Object tilemap state
%write16($7E0544, $04BC) ; Object tilemap state
%write16($7E0548, $05BC) ; Object tilemap state
%write16($7E054C, $06BC) ; Object tilemap state
%write16($7E0550, $13F0) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FDFAC, $0004) ; Room $16 persistent: Swamp Palace (Swimming Treadmill)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Arrghus", "lownmg", "swamp", "arrghus")
dw $0016 ; Screen ID
dw $0C78, $0224 ; Link Coords
dw $0200, $0C00 ; Camera VH
db $7C, $07, $04, $0F ; Mirror portal
db $0E ; Item
db $02 ; Link direction
;-----------------------------
db $25 ; Entrance
db $80 ; Room layout
db $08 ; Main GFX
db $16 ; Music
db $FF ; Floor
db $0A ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0008) ; Overworld Door
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; ICE PALACE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_lownmg_ice:
%menu_header("Ice Palace", 12)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Swamp", "lownmg", "ice", "outside_swamp")
dw $007B ; Screen ID
dw $0778, $0EEB ; Link Coords
dw $0E8D, $06F2 ; Camera VH
db $7C, $07, $04, $0F ; Mirror portal
db $0E ; Item
db $00 ; Link direction
;-----------------------------
dw $077F, $0EFA ; Scroll X, Y
dw $049E ; Unknown 1
dw $0003 ; Unknown 2
dw $FFFE ; Unknown 3
;-----------------------------
%write8_enable()
%write8($7E0B09, $1B) ; Arc variable
%write8($7E0B39, $B9) ; Arc variable
%write8($7E0B3A, $BC) ; Arc variable
%write8($7E02A1, $02) ; Arc variable
%write8($7E0B3B, $B2) ; Arc variable
%write8($7E02A2, $00) ; Arc variable
%write8($7E0B08, $4D) ; Arc variable
%write8($7E0B0C, $01) ; Arc variable
%write8($7E0B38, $AC) ; Arc variable
%write8($7E0B3C, $A9) ; Arc variable
%write_7F()
%write8($7FE07D, $13) ; Overworld $7E persistent: UNKNOWN
%write8($7FE126, $AB) ; Overworld $D3 persistent: UNKNOWN
%write8($7FE0E2, $AA) ; Overworld $B1 persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Swim Pumping", "lownmg", "ice", "swim_pumping")
dw $003F ; Screen ID
dw $0E0B, $0F79 ; Link Coords
dw $0F17, $0E00 ; Camera VH
db $7C, $07, $04, $0F ; Mirror portal
db $12 ; Item
db $02 ; Link direction
;-----------------------------
dw $0E85, $0F84 ; Scroll X, Y
dw $0880 ; Unknown 1
dw $FFF9 ; Unknown 2
dw $0000 ; Unknown 3
;-----------------------------
%write8_enable()
%write8($7E02A2, $C2) ; Arc variable
%write_7F()
%write8($7FE0D6, $0B) ; Overworld $AB persistent: UNKNOWN
%write8($7FE047, $BB) ; Overworld $63 persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "lownmg", "ice", "ice_entrance")
dw $0075 ; Screen ID
dw $0CB8, $0DCA ; Link Coords
dw $0D68, $0C3B ; Camera VH
db $7D, $07, $FA, $0E ; Mirror portal
db $08 ; Item
db $04 ; Link direction
;-----------------------------
dw $0CC0, $0DD5 ; Scroll X, Y
dw $0BC6 ; Unknown 1
dw $0008 ; Unknown 2
dw $FFF5 ; Unknown 3
;-----------------------------
%write8_enable()
%write8($7E02A2, $00) ; Arc variable
%write_7F()
%write8($7FDFF9, $42) ; Overworld $3C persistent: Great Swamp SE
%write8($7FDFDA, $D4) ; Overworld $2D persistent: Bridge to Hyrule Castle
%write8($7FE01B, $42) ; Overworld $4D persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Ice 2", "lownmg", "ice", "ice2")
dw $000E ; Screen ID
dw $1D18, $0178 ; Link Coords
dw $010C, $1D00 ; Camera VH
db $7D, $07, $FA, $0E ; Mirror portal
db $05 ; Item
db $00 ; Link direction
;-----------------------------
db $25 ; Entrance
db $03 ; Room layout
db $0B ; Main GFX
db $16 ; Music
db $00 ; Floor
db $12 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000B) ; Overworld Door
%write16($7E0468, $0000) ; Trap door state
%write_7F()
%write16_enable()
%write16($7FDF9C, $0001) ; Room $E persistent: Ice Palace (Entrance Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Penguin Switch Room", "lownmg", "ice", "penguin_switch_room")
dw $001E ; Screen ID
dw $1DD4, $0378 ; Link Coords
dw $030B, $1D00 ; Camera VH
db $7D, $07, $FA, $0E ; Mirror portal
db $05 ; Item
db $04 ; Link direction
;-----------------------------
db $2D ; Entrance
db $03 ; Room layout
db $0B ; Main GFX
db $16 ; Music
db $FF ; Floor
db $12 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000B) ; Overworld Door
%write16($7E0542, $0760) ; Object tilemap state
%write16($7E0546, $0860) ; Object tilemap state
%write16($7E054A, $575E) ; Object tilemap state
%write16($7E0540, $075C) ; Object tilemap state
%write16($7E0544, $085C) ; Object tilemap state
%write16($7E0548, $0954) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FDF9C, $000D) ; Room $E persistent: Ice Palace (Entrance Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Bombable Floor", "lownmg", "ice", "bombable_floor")
dw $001E ; Screen ID
dw $1D78, $0320 ; Link Coords
dw $0300, $1D00 ; Camera VH
db $7D, $07, $FA, $0E ; Mirror portal
db $05 ; Item
db $06 ; Link direction
;-----------------------------
db $2D ; Entrance
db $03 ; Room layout
db $0B ; Main GFX
db $16 ; Music
db $FF ; Floor
db $12 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000B) ; Overworld Door
%write16($7E054A, $585A) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Conveyor Room", "lownmg", "ice", "conveyor_room")
dw $003E ; Screen ID
dw $1D78, $06D8 ; Link Coords
dw $0610, $1D00 ; Camera VH
db $7D, $07, $FA, $0E ; Mirror portal
db $05 ; Item
db $00 ; Link direction
;-----------------------------
db $2D ; Entrance
db $01 ; Room layout
db $0B ; Main GFX
db $16 ; Music
db $FE ; Floor
db $12 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000B) ; Overworld Door
%write16($7E0542, $0664) ; Object tilemap state
%write16($7E0546, $0A5C) ; Object tilemap state
%write16($7E0540, $0660) ; Object tilemap state
%write16($7E0544, $0A58) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FDFFC, $0006) ; Room $3E persistent: Ice Palace (Stalfos Knights / Conveyor Hellway)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("IPBJ", "lownmg", "ice", "ipbj")
dw $003E ; Screen ID
dw $1C78, $07D3 ; Link Coords
dw $0710, $1C00 ; Camera VH
db $7D, $07, $FA, $0E ; Mirror portal
db $01 ; Item
db $02 ; Link direction
;-----------------------------
db $2D ; Entrance
db $82 ; Room layout
db $0B ; Main GFX
db $16 ; Music
db $FE ; Floor
db $12 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E0468, $01) ; Trap door state
%write16_enable()
%write16($7E0696, $000B) ; Overworld Door
%write_7F()
%write16_enable()
%write16($7FDFFC, $0326) ; Room $3E persistent: Ice Palace (Stalfos Knights / Conveyor Hellway)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Penguin Lineup Room", "lownmg", "ice", "penguin_room")
dw $004E ; Screen ID
dw $1DB8, $0864 ; Link Coords
dw $0800, $1D00 ; Camera VH
db $7D, $07, $FA, $0E ; Mirror portal
db $01 ; Item
db $02 ; Link direction
;-----------------------------
db $2D ; Entrance
db $01 ; Room layout
db $0B ; Main GFX
db $16 ; Music
db $FE ; Floor
db $12 ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000B) ; Overworld Door
%write16($7E0542, $0B8C) ; Object tilemap state
%write16($7E0546, $0A30) ; Object tilemap state
%write16($7E0540, $078C) ; Object tilemap state
%write16($7E0544, $0C1C) ; Object tilemap state
%write16($7E0548, $0C70) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Lonely Firebar", "lownmg", "ice", "lonely_firebar")
dw $005E ; Screen ID
dw $1D1C, $0B78 ; Link Coords
dw $0B0B, $1D00 ; Camera VH
db $7D, $07, $FA, $0E ; Mirror portal
db $01 ; Item
db $00 ; Link direction
;-----------------------------
db $2D ; Entrance
db $03 ; Room layout
db $0B ; Main GFX
db $16 ; Music
db $FD ; Floor
db $12 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000B) ; Overworld Door
%write16($7E0542, $0460) ; Object tilemap state
%write16($7E0546, $0870) ; Object tilemap state
%write16($7E0540, $045C) ; Object tilemap state
%write16($7E0544, $084C) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FE05C, $001F) ; Room $6E persistent: Ice Palace (Pengators Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Last Two Screens", "lownmg", "ice", "last_two_screens")
dw $009E ; Screen ID
dw $1CD4, $1378 ; Link Coords
dw $130B, $1C00 ; Camera VH
db $7D, $07, $FA, $0E ; Mirror portal
db $04 ; Item
db $04 ; Link direction
;-----------------------------
db $2D ; Entrance
db $02 ; Room layout
db $0B ; Main GFX
db $16 ; Music
db $FB ; Floor
db $12 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000B) ; Overworld Door
%write16($7E0542, $1858) ; Object tilemap state
%write16($7E0546, $1CA4) ; Object tilemap state
%write16($7E0540, $13A4) ; Object tilemap state
%write16($7E0544, $179C) ; Object tilemap state
%write16($7E0548, $5764) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Kholdstare", "lownmg", "ice", "kholdstare")
dw $00CE ; Screen ID
dw $1D40, $18A9 ; Link Coords
dw $1810, $1D00 ; Camera VH
db $7D, $07, $FA, $0E ; Mirror portal
db $04 ; Item
db $06 ; Link direction
;-----------------------------
db $2D ; Entrance
db $01 ; Room layout
db $0B ; Main GFX
db $16 ; Music
db $FA ; Floor
db $12 ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000B) ; Overworld Door
%write16($7E0542, $0850) ; Object tilemap state
%write16($7E0546, $0BD0) ; Object tilemap state
%write16($7E054A, $0CD0) ; Object tilemap state
%write16($7E054E, $0AD0) ; Object tilemap state
%write16($7E0552, $0C70) ; Object tilemap state
%write16($7E0556, $0AF0) ; Object tilemap state
%write16($7E055A, $0870) ; Object tilemap state
%write16($7E055E, $0970) ; Object tilemap state
%write16($7E0540, $084C) ; Object tilemap state
%write16($7E0544, $0BCC) ; Object tilemap state
%write16($7E0548, $0CCC) ; Object tilemap state
%write16($7E054C, $0ACC) ; Object tilemap state
%write16($7E0550, $0C6C) ; Object tilemap state
%write16($7E0554, $0AEC) ; Object tilemap state
%write16($7E0558, $086C) ; Object tilemap state
%write16($7E055C, $096C) ; Object tilemap state
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; TURTLE ROCK
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_lownmg_trock:
%menu_header("Turtle Rock", 16)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Ice", "lownmg", "trock", "outside_ice")
dw $0075 ; Screen ID
dw $0CB8, $0DCB ; Link Coords
dw $0D6D, $0C3E ; Camera VH
db $7D, $07, $FA, $0E ; Mirror portal
db $05 ; Item
db $02 ; Link direction
;-----------------------------
dw $0CC3, $0DDA ; Scroll X, Y
dw $0BC6 ; Unknown 1
dw $0003 ; Unknown 2
dw $FFF2 ; Unknown 3
;-----------------------------
%write8_enable()
%write8($7E02A1, $05) ; Arc variable
%write_7F()
%write8($7FDFF9, $42) ; Overworld $3C persistent: Great Swamp SE
%write8($7FDFDA, $D4) ; Overworld $2D persistent: Bridge to Hyrule Castle
%write8($7FE01B, $42) ; Overworld $4D persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Death Mountain", "lownmg", "trock", "dm")
dw $0003 ; Screen ID
dw $0678, $0328 ; Link Coords
dw $02CA, $060A ; Camera VH
db $7D, $07, $FA, $0E ; Mirror portal
db $12 ; Item
db $02 ; Link direction
;-----------------------------
dw $067F, $0337 ; Scroll X, Y
dw $1600 ; Unknown 1
dw $FFF6 ; Unknown 2
dw $FFF6 ; Unknown 3
;-----------------------------
%write8_enable()
%write8($7E02A2, $FD) ; Arc variable
%write_7F()
%write8($7FDFCB, $F3) ; Overworld $25 persistent: Octorok Area
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Squirrels", "lownmg", "trock", "squirrels")
dw $00DF ; Screen ID
dw $1EF8, $1BDC ; Link Coords
dw $1B10, $1E80 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $08 ; Item
db $04 ; Link direction
;-----------------------------
db $2D ; Entrance
db $82 ; Room layout
db $06 ; Main GFX
db $12 ; Music
db $01 ; Floor
db $FF ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E02A2, $66) ; Arc variable
%write16_enable()
%write16($7E0696, $0006) ; Overworld Door
%write_7F()
%write16_enable()
%write16($7FE13E, $0003) ; Room $DF persistent: Cave
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Peg Puzzle", "lownmg", "trock", "peg_puzzle")
dw $0005 ; Screen ID
dw $0DE7, $0078 ; Link Coords
dw $0014, $0D00 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $0E ; Item
db $02 ; Link direction
;-----------------------------
dw $0D7D, $0083 ; Scroll X, Y
dw $0060 ; Unknown 1
dw $000A ; Unknown 2
dw $0000 ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FE17F, $CA) ; Overworld $FF persistent: UNKNOWN
%write8($7FE1BF, $EC) ; Overworld $11F persistent: UNKNOWN
%write8($7FE058, $CA) ; Overworld $6C persistent: Dark Link's House
%write8($7FE16E, $28) ; Overworld $F7 persistent: UNKNOWN
%write8($7FE037, $28) ; Overworld $5B persistent: Pyramid of Power
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "lownmg", "trock", "entrance")
dw $0047 ; Screen ID
dw $0F08, $013D ; Link Coords
dw $00DB, $0E96 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $0E ; Item
db $06 ; Link direction
;-----------------------------
dw $0F13, $014A ; Scroll X, Y
dw $0614 ; Unknown 1
dw $0003 ; Unknown 2
dw $000A ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Torches", "lownmg", "trock", "torches")
dw $00C6 ; Screen ID
dw $0DD4, $1878 ; Link Coords
dw $180B, $0D00 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $12 ; Item
db $00 ; Link direction
;-----------------------------
db $1F ; Entrance
db $C1 ; Room layout
db $0D ; Main GFX
db $16 ; Music
db $00 ; Floor
db $18 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E02A2, $00) ; Arc variable
%write16_enable()
%write16($7E0696, $000D) ; Overworld Door
%write16($7E0542, $190C) ; Object tilemap state
%write16($7E0540, $070C) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FE10C, $0020) ; Room $C6 persistent: Turtle Rock
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Roller Room", "lownmg", "trock", "roller_room")
dw $00C7 ; Screen ID
dw $0E78, $1822 ; Link Coords
dw $1800, $0E00 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $12 ; Item
db $06 ; Link direction
;-----------------------------
db $35 ; Entrance
db $C0 ; Room layout
db $0D ; Main GFX
db $16 ; Music
db $00 ; Floor
db $18 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000D) ; Overworld Door
%write16($7E0542, $0B0C) ; Object tilemap state
%write16($7E0546, $160C) ; Object tilemap state
%write16($7E054A, $894A) ; Object tilemap state
%write16($7E054E, $8DCA) ; Object tilemap state
%write16($7E0468, $0000) ; Trap door state
%write16($7E0540, $0A0C) ; Object tilemap state
%write16($7E0544, $1C0C) ; Object tilemap state
%write16($7E0548, $8932) ; Object tilemap state
%write16($7E054C, $8DB2) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pokey 0", "lownmg", "trock", "pokey_0")
dw $00C6 ; Screen ID
dw $0C78, $1823 ; Link Coords
dw $1800, $0C00 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $0E ; Item
db $00 ; Link direction
;-----------------------------
db $35 ; Entrance
db $C0 ; Room layout
db $0D ; Main GFX
db $16 ; Music
db $00 ; Floor
db $18 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000D) ; Overworld Door
%write16($7E0542, $190C) ; Object tilemap state
%write16($7E0468, $0001) ; Trap door state
%write16($7E0540, $070C) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FE10C, $0025) ; Room $C6 persistent: Turtle Rock
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Chomps", "lownmg", "trock", "chomps")
dw $00B6 ; Screen ID
dw $0C78, $1722 ; Link Coords
dw $1700, $0C00 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $12 ; Item
db $00 ; Link direction
;-----------------------------
db $35 ; Entrance
db $02 ; Room layout
db $0D ; Main GFX
db $16 ; Music
db $00 ; Floor
db $18 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000D) ; Overworld Door
%write16($7E0542, $0A96) ; Object tilemap state
%write16($7E0540, $095E) ; Object tilemap state
%write16($7E0544, $0AA6) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FE0EC, $0020) ; Room $B6 persistent: Turtle Rock (Chain Chomps Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pokey 1", "lownmg", "trock", "pokey_1")
dw $0014 ; Screen ID
dw $081C, $0278 ; Link Coords
dw $020B, $0800 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $05 ; Item
db $00 ; Link direction
;-----------------------------
db $35 ; Entrance
db $C0 ; Room layout
db $0D ; Main GFX
db $16 ; Music
db $FF ; Floor
db $18 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000D) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pokeys 2", "lownmg", "trock", "pokeys_2")
dw $0014 ; Screen ID
dw $0878, $03D7 ; Link Coords
dw $0310, $0800 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $05 ; Item
db $04 ; Link direction
;-----------------------------
db $35 ; Entrance
db $C2 ; Room layout
db $0D ; Main GFX
db $16 ; Music
db $FF ; Floor
db $18 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000D) ; Overworld Door
%write_7F()
%write16_enable()
%write16($7FDFA6, $0040) ; Room $13 persistent: Turtle Rock (Hokku-Bokku Key Room 2)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Crystal Roller", "lownmg", "trock", "crystal_roller")
dw $0014 ; Screen ID
dw $0878, $0224 ; Link Coords
dw $0200, $0800 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $05 ; Item
db $02 ; Link direction
;-----------------------------
db $35 ; Entrance
db $C0 ; Room layout
db $0D ; Main GFX
db $16 ; Music
db $FF ; Floor
db $18 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000D) ; Overworld Door
%write_7F()
%write16_enable()
%write16($7FDFC8, $0028) ; Room $24 persistent: Turtle Rock (Double Hokku-Bokku / Big chest Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Dark Room", "lownmg", "trock", "dark_room")
dw $0004 ; Screen ID
dw $0878, $0024 ; Link Coords
dw $0000, $0800 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $12 ; Item
db $00 ; Link direction
;-----------------------------
db $35 ; Entrance
db $00 ; Room layout
db $0D ; Main GFX
db $16 ; Music
db $FF ; Floor
db $18 ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E0B3B, $00) ; Arc variable
%write8($7E0B0C, $A0) ; Arc variable
%write8($7E0B3C, $00) ; Arc variable
%write16_enable()
%write16($7E0696, $000D) ; Overworld Door
%write16($7E0542, $16A2) ; Object tilemap state
%write16($7E0546, $19A2) ; Object tilemap state
%write16($7E054A, $13F0) ; Object tilemap state
%write16($7E0540, $1698) ; Object tilemap state
%write16($7E0544, $1998) ; Object tilemap state
%write16($7E0548, $13CC) ; Object tilemap state
%write16($7E054C, $5A5E) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Laser Skip", "lownmg", "trock", "laser_skip")
dw $00C5 ; Screen ID
dw $0A78, $19D8 ; Link Coords
dw $1910, $0A00 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $12 ; Item
db $00 ; Link direction
;-----------------------------
db $35 ; Entrance
db $42 ; Room layout
db $0D ; Main GFX
db $16 ; Music
db $FE ; Floor
db $18 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000D) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Switch Room", "lownmg", "trock", "switch_room")
dw $00C5 ; Screen ID
dw $0A18, $1978 ; Link Coords
dw $190B, $0A00 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $12 ; Item
db $02 ; Link direction
;-----------------------------
db $35 ; Entrance
db $42 ; Room layout
db $0D ; Main GFX
db $16 ; Music
db $FE ; Floor
db $18 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000D) ; Overworld Door
%write_7F()
%write16_enable()
%write16($7FE12A, $0010) ; Room $D5 persistent: Turtle Rock (Laser Key Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Trinexx", "lownmg", "trock", "trinexx")
dw $00B4 ; Screen ID
dw $0878, $1622 ; Link Coords
dw $1600, $0800 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $12 ; Item
db $04 ; Link direction
;-----------------------------
db $35 ; Entrance
db $C0 ; Room layout
db $0D ; Main GFX
db $16 ; Music
db $FD ; Floor
db $18 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000D) ; Overworld Door
%write16($7E0542, $1C30) ; Object tilemap state
%write16($7E0540, $1C2C) ; Object tilemap state
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; GANON'S TOWER
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_lownmg_gtower:
%menu_header("Ganon's Tower", 21)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Turtle Rock", "lownmg", "gtower", "outside_trock")
dw $0047 ; Screen ID
dw $0F08, $013B ; Link Coords
dw $00DD, $0E96 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $06 ; Item
db $00 ; Link direction
;-----------------------------
dw $0F13, $014A ; Scroll X, Y
dw $0712 ; Unknown 1
dw $0003 ; Unknown 2
dw $FFFA ; Unknown 3
;-----------------------------
%write8_enable()
%write8($7E0B09, $80) ; Arc variable
%write8($7E02A1, $00) ; Arc variable
%write8($7E0B08, $90) ; Arc variable
%write8($7E0B0C, $90) ; Arc variable
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "lownmg", "gtower", "entrance")
dw $0043 ; Screen ID
dw $08F8, $003D ; Link Coords
dw $0000, $087A ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $12 ; Item
db $02 ; Link direction
;-----------------------------
dw $08FF, $006D ; Scroll X, Y
dw $0050 ; Unknown 1
dw $0000 ; Unknown 2
dw $0006 ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spike Skip", "lownmg", "gtower", "spike_skip")
dw $008B ; Screen ID
dw $171C, $1078 ; Link Coords
dw $100C, $1700 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $04 ; Item
db $00 ; Link direction
;-----------------------------
db $35 ; Entrance
db $01 ; Room layout
db $0E ; Main GFX
db $16 ; Music
db $00 ; Floor
db $1A ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E0468, $00) ; Trap door state
%write8($7E0B0C, $50) ; Arc variable
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write16($7E0542, $171C) ; Object tilemap state
%write16($7E0546, $0864) ; Object tilemap state
%write16($7E054A, $085C) ; Object tilemap state
%write16($7E054E, $0C4C) ; Object tilemap state
%write16($7E0552, $144C) ; Object tilemap state
%write16($7E0556, $0864) ; Object tilemap state
%write16($7E0540, $0920) ; Object tilemap state
%write16($7E0544, $1720) ; Object tilemap state
%write16($7E0548, $0760) ; Object tilemap state
%write16($7E054C, $0960) ; Object tilemap state
%write16($7E0550, $0C70) ; Object tilemap state
%write16($7E0554, $1C4C) ; Object tilemap state
%write16($7E0641, $0001) ; Room puzzle state (?)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pre Firesnakes Room", "lownmg", "gtower", "pre_firesnakes_room")
dw $009B ; Screen ID
dw $16D2, $1278 ; Link Coords
dw $120B, $1600 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $04 ; Item
db $04 ; Link direction
;-----------------------------
db $37 ; Entrance
db $00 ; Room layout
db $0E ; Main GFX
db $16 ; Music
db $00 ; Floor
db $1A ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E0641, $00) ; Room puzzle state (?)
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write16($7E0542, $0C30) ; Object tilemap state
%write16($7E0546, $1820) ; Object tilemap state
%write16($7E0468, $0001) ; Trap door state
%write16($7E0540, $0430) ; Object tilemap state
%write16($7E0544, $181C) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FE096, $0020) ; Room $8B persistent: Ganon's Tower (Block Puzzle / Spike Skip / Map Chest Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Bombable Floor", "lownmg", "gtower", "bombable_floor")
dw $009C ; Screen ID
dw $1978, $1223 ; Link Coords
dw $1200, $1900 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $0E ; Item
db $06 ; Link direction
;-----------------------------
db $37 ; Entrance
db $C1 ; Room layout
db $0E ; Main GFX
db $16 ; Music
db $00 ; Floor
db $1A ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write16($7E0542, $0938) ; Object tilemap state
%write16($7E0540, $0838) ; Object tilemap state
%write16($7E0544, $0550) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FE0B8, $0033) ; Room $9C persistent: Ganon's Tower (Invisible Floor Maze Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Ice Armos", "lownmg", "gtower", "ice_armos")
dw $001C ; Screen ID
dw $19B0, $03B8 ; Link Coords
dw $0310, $1900 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $01 ; Item
db $00 ; Link direction
;-----------------------------
db $37 ; Entrance
db $03 ; Room layout
db $0E ; Main GFX
db $16 ; Music
db $FF ; Floor
db $1A ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E0302, $01) ; Selected menu item
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Floor 2", "lownmg", "gtower", "floor_2")
dw $000C ; Screen ID
dw $18F8, $0024 ; Link Coords
dw $0000, $1880 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $03 ; Item
db $00 ; Link direction
;-----------------------------
db $37 ; Entrance
db $C0 ; Room layout
db $0E ; Main GFX
db $16 ; Music
db $01 ; Floor
db $1A ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E0B09, $00) ; Arc variable
%write8($7E03C4, $03) ; Ancilla Search Index
%write8($7E0302, $00) ; Selected menu item
%write8($7E0B08, $40) ; Arc variable
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mimics 1", "lownmg", "gtower", "mimics1")
dw $006B ; Screen ID
dw $1678, $0CD9 ; Link Coords
dw $0C10, $1600 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $37 ; Entrance
db $80 ; Room layout
db $0E ; Main GFX
db $16 ; Music
db $02 ; Floor
db $1A ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E0468, $00) ; Trap door state
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write16($7E0542, $052C) ; Object tilemap state
%write16($7E0546, $082C) ; Object tilemap state
%write16($7E054A, $0B2C) ; Object tilemap state
%write16($7E054E, $1962) ; Object tilemap state
%write16($7E0540, $051C) ; Object tilemap state
%write16($7E0544, $081C) ; Object tilemap state
%write16($7E0548, $0B1C) ; Object tilemap state
%write16($7E054C, $195A) ; Object tilemap state
%write16($7E0550, $070C) ; Object tilemap state
%write16($7E0641, $0001) ; Room puzzle state (?)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mimics 2", "lownmg", "gtower", "mimics2")
dw $006B ; Screen ID
dw $16D4, $0D78 ; Link Coords
dw $0D0B, $1600 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $03 ; Item
db $02 ; Link direction
;-----------------------------
db $37 ; Entrance
db $02 ; Room layout
db $0E ; Main GFX
db $16 ; Music
db $02 ; Floor
db $1A ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E0641, $00) ; Room puzzle state (?)
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write_7F()
%write16_enable()
%write16($7FE056, $0240) ; Room $6B persistent: Ganon's Tower (Mimics Rooms)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spike Pit", "lownmg", "gtower", "spike_room")
dw $006B ; Screen ID
dw $1778, $0C24 ; Link Coords
dw $0C00, $1700 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $03 ; Item
db $06 ; Link direction
;-----------------------------
db $37 ; Entrance
db $81 ; Room layout
db $0E ; Main GFX
db $16 ; Music
db $02 ; Floor
db $1A ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E0468, $01) ; Trap door state
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write_7F()
%write16_enable()
%write16($7FE056, $2640) ; Room $6B persistent: Ganon's Tower (Mimics Rooms)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Gauntlet 1", "lownmg", "gtower", "gauntlet")
dw $005C ; Screen ID
dw $1978, $0A24 ; Link Coords
dw $0A00, $1900 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $03 ; Item
db $00 ; Link direction
;-----------------------------
db $37 ; Entrance
db $81 ; Room layout
db $0E ; Main GFX
db $16 ; Music
db $02 ; Floor
db $1A ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write16($7E0542, $16D8) ; Object tilemap state
%write16($7E0546, $19D8) ; Object tilemap state
%write16($7E054A, $19E4) ; Object tilemap state
%write16($7E054E, $16E4) ; Object tilemap state
%write16($7E0540, $165E) ; Object tilemap state
%write16($7E0544, $1854) ; Object tilemap state
%write16($7E0548, $1A5E) ; Object tilemap state
%write16($7E054C, $1868) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Gauntlet 3", "lownmg", "gtower", "gauntlet_3")
dw $005D ; Screen ID
dw $1A78, $0AD9 ; Link Coords
dw $0A10, $1A00 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $03 ; Item
db $00 ; Link direction
;-----------------------------
db $37 ; Entrance
db $00 ; Room layout
db $0E ; Main GFX
db $16 ; Music
db $03 ; Floor
db $1A ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write16($7E0542, $052C) ; Object tilemap state
%write16($7E0546, $0B2C) ; Object tilemap state
%write16($7E054A, $1430) ; Object tilemap state
%write16($7E054E, $1C30) ; Object tilemap state
%write16($7E0468, $0000) ; Trap door state
%write16($7E0540, $0510) ; Object tilemap state
%write16($7E0544, $0B10) ; Object tilemap state
%write16($7E0548, $140C) ; Object tilemap state
%write16($7E054C, $1C0C) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FE03A, $00FD) ; Room $5D persistent: Ganon's Tower (Gauntlet 1/2/3)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Lanmola 2", "lownmg", "gtower", "lanmola2")
dw $006D ; Screen ID
dw $1A1C, $0D78 ; Link Coords
dw $0D0B, $1A00 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $03 ; Item
db $02 ; Link direction
;-----------------------------
db $37 ; Entrance
db $02 ; Room layout
db $0E ; Main GFX
db $16 ; Music
db $03 ; Floor
db $1A ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write16($7E0542, $1A20) ; Object tilemap state
%write16($7E0546, $1B20) ; Object tilemap state
%write16($7E0540, $1A1C) ; Object tilemap state
%write16($7E0544, $1B1C) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FE03A, $0EFD) ; Room $5D persistent: Ganon's Tower (Gauntlet 1/2/3)
%write16($7FE05A, $00C9) ; Room $6D persistent: Ganon's Tower (Gauntlet 4/5)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Wizzrobes 1", "lownmg", "gtower", "wizz1")
dw $006C ; Screen ID
dw $1878, $0C24 ; Link Coords
dw $0C00, $1800 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $05 ; Item
db $04 ; Link direction
;-----------------------------
db $37 ; Entrance
db $00 ; Room layout
db $0E ; Main GFX
db $16 ; Music
db $03 ; Floor
db $1A ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E0468, $01) ; Trap door state
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write16($7E0542, $0628) ; Object tilemap state
%write16($7E0546, $0A28) ; Object tilemap state
%write16($7E0540, $0614) ; Object tilemap state
%write16($7E0544, $0A14) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Wizzrobes 2", "lownmg", "gtower", "wizz2")
dw $00A5 ; Screen ID
dw $0B78, $1524 ; Link Coords
dw $1500, $0B00 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $05 ; Item
db $00 ; Link direction
;-----------------------------
db $37 ; Entrance
db $83 ; Room layout
db $0E ; Main GFX
db $16 ; Music
db $04 ; Floor
db $1A ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write_7F()
%write16_enable()
%write16($7FE0CA, $008C) ; Room $A5 persistent: Ganon's Tower (Wizzrobes Rooms)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Torches 1", "lownmg", "gtower", "torches1")
dw $0095 ; Screen ID
dw $0BD4, $1278 ; Link Coords
dw $120B, $0B00 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $12 ; Item
db $00 ; Link direction
;-----------------------------
db $37 ; Entrance
db $41 ; Room layout
db $0E ; Main GFX
db $16 ; Music
db $04 ; Floor
db $1A ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write8_enable()
%write8($7E0B3F, $01) ; Arc variable
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write_7F()
%write16_enable()
%write16($7FE0AA, $0008) ; Room $95 persistent: Ganon's Tower (Final Collapsing Bridge Room)
%write16($7FE0CA, $08EF) ; Room $A5 persistent: Ganon's Tower (Wizzrobes Rooms)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Torches 2", "lownmg", "gtower", "torches2")
dw $0096 ; Screen ID
dw $0D78, $13A0 ; Link Coords
dw $1310, $0D00 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $09 ; Item
db $06 ; Link direction
;-----------------------------
db $37 ; Entrance
db $03 ; Room layout
db $0E ; Main GFX
db $16 ; Music
db $04 ; Floor
db $1A ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write16($7E0542, $1570) ; Object tilemap state
%write16($7E0546, $0B2E) ; Object tilemap state
%write16($7E054A, $120E) ; Object tilemap state
%write16($7E054E, $1820) ; Object tilemap state
%write16($7E0552, $8B0C) ; Object tilemap state
%write16($7E0556, $9220) ; Object tilemap state
%write16($7E0468, $0000) ; Trap door state
%write16($7E0540, $154C) ; Object tilemap state
%write16($7E0544, $0520) ; Object tilemap state
%write16($7E0548, $1120) ; Object tilemap state
%write16($7E054C, $180E) ; Object tilemap state
%write16($7E0550, $8420) ; Object tilemap state
%write16($7E0554, $8B32) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Helma Key", "lownmg", "gtower", "helma_key")
dw $003D ; Screen ID
dw $1B78, $0723 ; Link Coords
dw $0700, $1B00 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $05 ; Item
db $00 ; Link direction
;-----------------------------
db $37 ; Entrance
db $03 ; Room layout
db $0E ; Main GFX
db $16 ; Music
db $05 ; Floor
db $1A ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write16($7E0542, $0C70) ; Object tilemap state
%write16($7E0546, $1628) ; Object tilemap state
%write16($7E054A, $1A14) ; Object tilemap state
%write16($7E054E, $954C) ; Object tilemap state
%write16($7E0552, $9C50) ; Object tilemap state
%write16($7E0540, $0C4C) ; Object tilemap state
%write16($7E0544, $1618) ; Object tilemap state
%write16($7E0548, $1820) ; Object tilemap state
%write16($7E054C, $1A24) ; Object tilemap state
%write16($7E0550, $9570) ; Object tilemap state
%write16($7E0554, $9C6C) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Bombable Wall", "lownmg", "gtower", "bombable_wall")
dw $003D ; Screen ID
dw $1B1C, $0678 ; Link Coords
dw $060B, $1B00 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $05 ; Item
db $00 ; Link direction
;-----------------------------
db $37 ; Entrance
db $01 ; Room layout
db $0E ; Main GFX
db $16 ; Music
db $05 ; Floor
db $1A ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Moldorm 2", "lownmg", "gtower", "moldorm_2")
dw $003D ; Screen ID
dw $1A78, $07D5 ; Link Coords
dw $0710, $1A00 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $01 ; Item
db $04 ; Link direction
;-----------------------------
db $37 ; Entrance
db $02 ; Room layout
db $0E ; Main GFX
db $16 ; Music
db $05 ; Floor
db $1A ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write16($7E0468, $0001) ; Trap door state
%write16($7E0554, $1C6C) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Agahnim 2", "lownmg", "gtower", "agahnim_2")
dw $001D ; Screen ID
dw $1A78, $0223 ; Link Coords
dw $0200, $1A00 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $0E ; Item
db $02 ; Link direction
;-----------------------------
db $37 ; Entrance
db $80 ; Room layout
db $0E ; Main GFX
db $16 ; Music
db $06 ; Floor
db $1A ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; GANON
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_lownmg_ganon:
%menu_header("Ganon", 1)

;---------------------------------------------------------------------------------------------------
%preset_OW("Pyramid", "lownmg", "ganon", "pyramid")
dw $005B ; Screen ID
dw $07F0, $065C ; Link Coords
dw $0600, $0778 ; Camera VH
db $B8, $0C, $CB, $0D ; Mirror portal
db $0E ; Item
db $00 ; Link direction
;-----------------------------
dw $07F7, $066D ; Scroll X, Y
dw $002E ; Unknown 1
dw $0000 ; Unknown 2
dw $FFF8 ; Unknown 3
;-----------------------------
%write8_enable()
%write8($7E02A1, $D1) ; Arc variable
%write8($7E02A2, $FE) ; Arc variable
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; BOSSES
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_lownmg_boss:
%menu_header("Bosses", 0)
;===================================================================================================

;===================================================================================================
presetpersistent_lownmg_escape:
;-----------------------------
.bed
..end
;-----------------------------
.courtyard
..end
;-----------------------------
.entrance
..end
;-----------------------------
.1st_keyguard
..end
;-----------------------------
.stealth_room
..end
;-----------------------------
.2nd_keyguard
..end
;-----------------------------
.ball_n_chains
..end
;-----------------------------
.backtracking
..end
;-----------------------------
.keyguard_revisited
..end
;-----------------------------
.throne_room
..end
;-----------------------------
.snake_avoidance_room
..end
;-----------------------------
.water_rooms
..end
;-----------------------------
.keyrat
..end
;-----------------------------
.last_two_screens
%write8_enable()
%write8($7E0FC8, $02) ; Prize pack index
%write_end()
..end

;===================================================================================================
presetpersistent_lownmg_eastern:
;-----------------------------
.before_cutscene
%write8_enable()
%write8($7E0B31, $00) ; Arc variable
%write8($7E0B35, $00) ; Arc variable
%write8($7E0B33, $00) ; Arc variable
%write8($7E0B37, $00) ; Arc variable
%write_end()
..end
;-----------------------------
.after_cutscene
..end
;-----------------------------
.octorok
..end
;-----------------------------
.outside_palace
..end
;-----------------------------
.entrance
%write8_enable()
%write8($7E0FC8, $03) ; Prize pack index
%write_end()
..end
;-----------------------------
.stalfos_room
..end
;-----------------------------
.big_chest_room_1
%write8_enable()
%write8($7E0FCC, $02) ; Prize pack index
%write_end()
..end
;-----------------------------
.dark_key_room
..end
;-----------------------------
.big_key_dmg_boost
%write8_enable()
%write8($7E0FC8, $04) ; Prize pack index
%write8($7E0B37, $FF) ; Arc variable
%write_end()
..end
;-----------------------------
.big_chest_room_2
%write8_enable()
%write8($7E0B37, $00) ; Arc variable
%write_end()
..end
;-----------------------------
.gwg
..end
;-----------------------------
.pot_room
..end
;-----------------------------
.zeldagamer_room
..end
;-----------------------------
.armos
%write8_enable()
%write8($7E0FC8, $01) ; Prize pack index
%write8($7E0FCB, $03) ; Prize pack index
%write_end()
..end

;===================================================================================================
presetpersistent_lownmg_desert:
;-----------------------------
.outside_eastern_palace
%write8_enable()
%write8($7E0B31, $48) ; Arc variable
%write8($7E0B35, $48) ; Arc variable
%write8($7E0B32, $48) ; Arc variable
%write8($7E0B33, $48) ; Arc variable
%write8($7E0B30, $48) ; Arc variable
%write8($7E0B34, $48) ; Arc variable
%write_end()
..end
;-----------------------------
.ep_spinspeed
..end
;-----------------------------
.bridge_screen
..end
;-----------------------------
.unholy_spinspeed
..end
;-----------------------------
.water_dash
..end
;-----------------------------
.outside_desert_palace
..end
;-----------------------------
.desert_entrance
..end
;-----------------------------
.keybonk
..end
;-----------------------------
.pre_cannonball_room
..end
;-----------------------------
.pot_room
%write8_enable()
%write8($7E0FC8, $02) ; Prize pack index
%write_end()
..end
;-----------------------------
.desert2_spinspeed
..end
;-----------------------------
.popo_genocide_room
%write8_enable()
%write8($7E0B37, $91) ; Arc variable
%write_end()
..end
;-----------------------------
.torches
%write8_enable()
%write8($7E0FC8, $03) ; Prize pack index
%write8($7E0B37, $96) ; Arc variable
%write_end()
..end
;-----------------------------
.lanmolas
%write8_enable()
%write8($7E0B37, $8B) ; Arc variable
%write_end()
..end

;===================================================================================================
presetpersistent_lownmg_hera:
;-----------------------------
.outside_desert_palace
..end
;-----------------------------
.lake_hylia
..end
;-----------------------------
.icerod_overworld
..end
;-----------------------------
.waterwalk
..end
;-----------------------------
.dm
..end
;-----------------------------
.after_mirror
%write8_enable()
%write8($7E0B37, $00) ; Arc variable
%write_end()
..end
;-----------------------------
.quickhop
..end
;-----------------------------
.entrance
..end
;-----------------------------
.tile_room
..end
;-----------------------------
.minimoldorm_switch
%write8_enable()
%write8($7E0B37, $80) ; Arc variable
%write_end()
..end
;-----------------------------
.torches
..end
;-----------------------------
.beetles
..end
;-----------------------------
.petting_zoo
%write8_enable()
%write8($7E0FCC, $04) ; Prize pack index
%write_end()
..end
;-----------------------------
.moldorm
..end

;===================================================================================================
presetpersistent_lownmg_aga:
;-----------------------------
.outside_hera
..end
;-----------------------------
.first_rupee_tree
..end
;-----------------------------
.lost_woods
..end
;-----------------------------
.after_grove
..end
;-----------------------------
.after_lost_woods
..end
;-----------------------------
.castle_screen
..end
;-----------------------------
.entrance
..end
;-----------------------------
.fairy_skip
%write8_enable()
%write8($7E0FC8, $05) ; Prize pack index
%write_end()
..end
;-----------------------------
.dark_room_of_despair
..end
;-----------------------------
.dark_room_of_melancholy
..end
;-----------------------------
.spear_guards
..end
;-----------------------------
.circle_of_pots
..end
;-----------------------------
.catwalk
%write8_enable()
%write8($7E0FC7, $01) ; Prize pack index
%write_end()
..end
;-----------------------------
.agahnim
..end

;===================================================================================================
presetpersistent_lownmg_pod:
;-----------------------------
.pyramid
..end
;-----------------------------
.pod_overworld
..end
;-----------------------------
.entrance
..end
;-----------------------------
.main_hub_small_key
..end
;-----------------------------
.main_hub_bk
%write8_enable()
%write8($7E0B35, $00) ; Arc variable
%write8($7E0B33, $00) ; Arc variable
%write8($7E0B37, $00) ; Arc variable
%write8($7E0B34, $00) ; Arc variable
%write_end()
..end
;-----------------------------
.main_hub_hammeryump
..end
;-----------------------------
.hammeryump
..end
;-----------------------------
.before_sexy_statue
%write8_enable()
%write8($7E0FCD, $01) ; Prize pack index
%write8($7E0B37, $08) ; Arc variable
%write_end()
..end
;-----------------------------
.sexy_statue_room
..end
;-----------------------------
.mimics
..end
;-----------------------------
.statue
%write8_enable()
%write8($7E0FCB, $05) ; Prize pack index
%write_end()
..end
;-----------------------------
.basement
..end
;-----------------------------
.turtle_room
..end
;-----------------------------
.helma
%write8_enable()
%write8($7E0FC8, $02) ; Prize pack index
%write_end()
..end

;===================================================================================================
presetpersistent_lownmg_thieves:
;-----------------------------
.outside_pod
%write8_enable()
%write8($7E0B31, $00) ; Arc variable
%write8($7E0B32, $00) ; Arc variable
%write8($7E0B33, $0F) ; Arc variable
%write8($7E0B30, $02) ; Arc variable
%write_end()
..end
;-----------------------------
.ow_hammerdash
..end
;-----------------------------
.grove
..end
;-----------------------------
.usain_bolt
..end
;-----------------------------
.after_activating_flute
..end
;-----------------------------
.darkworld
..end
;-----------------------------
.entrance
..end
;-----------------------------
.after_big_key
..end
;-----------------------------
.blind_hallway
..end
;-----------------------------
.conveyor_gibos
..end
;-----------------------------
.hellway
..end
;-----------------------------
.bombable_floor
%write8_enable()
%write8($7E0B33, $00) ; Arc variable
%write8($7E0B37, $00) ; Arc variable
%write_end()
..end
;-----------------------------
.backtracking_1
..end
;-----------------------------
.basement
..end
;-----------------------------
.prison
..end
;-----------------------------
.after_gloves
%write8_enable()
%write8($7E0B37, $A0) ; Arc variable
%write_end()
..end
;-----------------------------
.backtracking_2
%write8_enable()
%write8($7E0B37, $00) ; Arc variable
%write_end()
..end
;-----------------------------
.pot_hammerdash
%write8_enable()
%write8($7E0B37, $03) ; Arc variable
%write_end()
..end
;-----------------------------
.blind
..end

;===================================================================================================
presetpersistent_lownmg_skull:
;-----------------------------
.outside_thieves
..end
;-----------------------------
.dash_to_sw
..end
;-----------------------------
.mummy_room
..end
;-----------------------------
.bomb_jump
%write8_enable()
%write8($7E0FCC, $05) ; Prize pack index
%write8($7E0B37, $FB) ; Arc variable
%write_end()
..end
;-----------------------------
.key_pot
%write8_enable()
%write8($7E0FC8, $03) ; Prize pack index
%write8($7E0B36, $D8) ; Arc variable
%write8($7E0B37, $A0) ; Arc variable
%write_end()
..end
;-----------------------------
.skull_entrance
%write8_enable()
%write8($7E0B36, $45) ; Arc variable
%write_end()
..end
;-----------------------------
.mummy_hellway
%write8_enable()
%write8($7E0FCC, $06) ; Prize pack index
%write8($7E0B37, $B1) ; Arc variable
%write_end()
..end
;-----------------------------
.mummy_key
%write8_enable()
%write8($7E0FC9, $01) ; Prize pack index
%write8($7E0B37, $9A) ; Arc variable
%write_end()
..end
;-----------------------------
.mothula
%write8_enable()
%write8($7E0B37, $6B) ; Arc variable
%write_end()
..end

;===================================================================================================
presetpersistent_lownmg_mire:
;-----------------------------
.outside_skull
%write8_enable()
%write8($7E0B37, $43) ; Arc variable
%write_end()
..end
;-----------------------------
.dm
%write8_enable()
%write8($7E0B37, $00) ; Arc variable
%write_end()
..end
;-----------------------------
.bridge_warp
..end
;-----------------------------
.lottery
%write8_enable()
%write8($7E0FC8, $04) ; Prize pack index
%write_end()
..end
;-----------------------------
.medallion
..end
;-----------------------------
.zoras_domain
..end
;-----------------------------
.darkworld_warp
..end
;-----------------------------
.entrance
..end
;-----------------------------
.mire2
..end
;-----------------------------
.main_hub
%write8_enable()
%write8($7E0FC8, $06) ; Prize pack index
%write8($7E0FC7, $04) ; Prize pack index
%write_end()
..end
;-----------------------------
.beat_the_fireball
..end
;-----------------------------
.bari_key
..end
;-----------------------------
.sluggulas
%write8_enable()
%write8($7E0B37, $94) ; Arc variable
%write_end()
..end
;-----------------------------
.torches
%write8_enable()
%write8($7E0B37, $8F) ; Arc variable
%write_end()
..end
;-----------------------------
.spark_avoidance
%write8_enable()
%write8($7E0B37, $00) ; Arc variable
%write_end()
..end
;-----------------------------
.big_chest_room
%write8_enable()
%write8($7E0B37, $A0) ; Arc variable
%write_end()
..end
;-----------------------------
.wizzrobe
%write8_enable()
%write8($7E0B37, $10) ; Arc variable
%write_end()
..end
;-----------------------------
.basement
..end
;-----------------------------
.spooky_action_1
..end
;-----------------------------
.spooky_action_2
%write8_enable()
%write8($7E0B37, $5E) ; Arc variable
%write_end()
..end
;-----------------------------
.vitty
%write8_enable()
%write8($7E0B37, $87) ; Arc variable
%write_end()
..end

;===================================================================================================
presetpersistent_lownmg_swamp:
;-----------------------------
.outside_mire
..end
;-----------------------------
.links_house
..end
;-----------------------------
.swamp_overworld
%write8_enable()
%write8($7E0FC8, $07) ; Prize pack index
%write_end()
..end
;-----------------------------
.antifairy_room
..end
;-----------------------------
.entrance
%write8_enable()
%write8($7E0B36, $00) ; Arc variable
%write8($7E0B37, $00) ; Arc variable
%write_end()
..end
;-----------------------------
.first_key_pot
..end
;-----------------------------
.hallway_key_1
..end
;-----------------------------
.water_lever_1
..end
;-----------------------------
.main_hub
..end
;-----------------------------
.water_lever_2
%write8_enable()
%write8($7E0B35, $BE) ; Arc variable
%write8($7E0FCC, $07) ; Prize pack index
%write8($7E0B36, $C3) ; Arc variable
%write8($7E0B33, $AF) ; Arc variable
%write8($7E0B37, $BB) ; Arc variable
%write8($7E0B34, $B9) ; Arc variable
%write_end()
..end
;-----------------------------
.sociable_firebar
%write8_enable()
%write8($7E0B35, $C5) ; Arc variable
%write8($7E0B36, $C9) ; Arc variable
%write8($7E0B33, $B9) ; Arc variable
%write8($7E0B37, $CD) ; Arc variable
%write8($7E0B34, $BF) ; Arc variable
%write_end()
..end
;-----------------------------
.backtracking
..end
;-----------------------------
.hook_shot
..end
;-----------------------------
.hookdash
%write8_enable()
%write8($7E0B35, $A2) ; Arc variable
%write8($7E0B36, $75) ; Arc variable
%write8($7E0B33, $89) ; Arc variable
%write8($7E0B37, $9B) ; Arc variable
%write8($7E0B34, $94) ; Arc variable
%write_end()
..end
;-----------------------------
.water_lever_3
%write8_enable()
%write8($7E0B35, $97) ; Arc variable
%write8($7E0B36, $6A) ; Arc variable
%write8($7E0B33, $75) ; Arc variable
%write8($7E0B37, $90) ; Arc variable
%write8($7E0B34, $89) ; Arc variable
%write_end()
..end
;-----------------------------
.restock
%write8_enable()
%write8($7E0B35, $27) ; Arc variable
%write8($7E0B36, $23) ; Arc variable
%write8($7E0B37, $1F) ; Arc variable
%write_end()
..end
;-----------------------------
.phelps_way
%write8_enable()
%write8($7E0B35, $62) ; Arc variable
%write8($7E0B36, $5E) ; Arc variable
%write8($7E0B37, $63) ; Arc variable
%write_end()
..end
;-----------------------------
.arrghus
..end

;===================================================================================================
presetpersistent_lownmg_ice:
;-----------------------------
.outside_swamp
%write8_enable()
%write8($7E0B31, $B4) ; Arc variable
%write8($7E0B35, $AF) ; Arc variable
%write8($7E0B32, $BD) ; Arc variable
%write8($7E0B36, $A4) ; Arc variable
%write8($7E0B33, $C0) ; Arc variable
%write8($7E0B37, $A0) ; Arc variable
%write8($7E0B30, $A9) ; Arc variable
%write8($7E0B34, $BB) ; Arc variable
%write_end()
..end
;-----------------------------
.swim_pumping
..end
;-----------------------------
.ice_entrance
..end
;-----------------------------
.ice2
..end
;-----------------------------
.penguin_switch_room
..end
;-----------------------------
.bombable_floor
..end
;-----------------------------
.conveyor_room
%write8_enable()
%write8($7E0FCA, $02) ; Prize pack index
%write8($7E0B37, $9F) ; Arc variable
%write_end()
..end
;-----------------------------
.ipbj
%write8_enable()
%write8($7E0FCC, $00) ; Prize pack index
%write8($7E0B37, $22) ; Arc variable
%write_end()
..end
;-----------------------------
.penguin_room
%write8_enable()
%write8($7E0B37, $1A) ; Arc variable
%write_end()
..end
;-----------------------------
.lonely_firebar
%write8_enable()
%write8($7E0FC9, $04) ; Prize pack index
%write8($7E0B37, $A0) ; Arc variable
%write_end()
..end
;-----------------------------
.last_two_screens
..end
;-----------------------------
.kholdstare
..end

;===================================================================================================
presetpersistent_lownmg_trock:
;-----------------------------
.outside_ice
..end
;-----------------------------
.dm
%write8_enable()
%write8($7E0B37, $00) ; Arc variable
%write_end()
..end
;-----------------------------
.squirrels
..end
;-----------------------------
.peg_puzzle
..end
;-----------------------------
.entrance
..end
;-----------------------------
.torches
..end
;-----------------------------
.roller_room
..end
;-----------------------------
.pokey_0
%write8_enable()
%write8($7E0FCC, $01) ; Prize pack index
%write_end()
..end
;-----------------------------
.chomps
%write8_enable()
%write8($7E0FCD, $02) ; Prize pack index
%write_end()
..end
;-----------------------------
.pokey_1
..end
;-----------------------------
.pokeys_2
%write8_enable()
%write8($7E0FCD, $03) ; Prize pack index
%write_end()
..end
;-----------------------------
.crystal_roller
%write8_enable()
%write8($7E0FCD, $05) ; Prize pack index
%write_end()
..end
;-----------------------------
.dark_room
%write8_enable()
%write8($7E0B35, $00) ; Arc variable
%write8($7E0B36, $00) ; Arc variable
%write8($7E0B33, $00) ; Arc variable
%write8($7E0B37, $4C) ; Arc variable
%write8($7E0B34, $00) ; Arc variable
%write_end()
..end
;-----------------------------
.laser_skip
%write8_enable()
%write8($7E0B37, $49) ; Arc variable
%write_end()
..end
;-----------------------------
.switch_room
..end
;-----------------------------
.trinexx
..end

;===================================================================================================
presetpersistent_lownmg_gtower:
;-----------------------------
.outside_trock
..end
;-----------------------------
.entrance
..end
;-----------------------------
.spike_skip
%write8_enable()
%write8($7E0B37, $00) ; Arc variable
%write_end()
..end
;-----------------------------
.pre_firesnakes_room
..end
;-----------------------------
.bombable_floor
..end
;-----------------------------
.ice_armos
..end
;-----------------------------
.floor_2
%write8_enable()
%write8($7E0B31, $BD) ; Arc variable
%write8($7E0B35, $70) ; Arc variable
%write8($7E0B32, $90) ; Arc variable
%write8($7E0B33, $52) ; Arc variable
%write8($7E0B37, $06) ; Arc variable
%write8($7E0B30, $AD) ; Arc variable
%write8($7E0B34, $42) ; Arc variable
%write_end()
..end
;-----------------------------
.mimics1
..end
;-----------------------------
.mimics2
%write8_enable()
%write8($7E0FCB, $07) ; Prize pack index
%write_end()
..end
;-----------------------------
.spike_room
%write8_enable()
%write8($7E0FCB, $00) ; Prize pack index
%write_end()
..end
;-----------------------------
.gauntlet
..end
;-----------------------------
.gauntlet_3
%write8_enable()
%write8($7E0FCC, $05) ; Prize pack index
%write_end()
..end
;-----------------------------
.lanmola2
%write8_enable()
%write8($7E0FCC, $06) ; Prize pack index
%write_end()
..end
;-----------------------------
.wizz1
..end
;-----------------------------
.wizz2
%write8_enable()
%write8($7E0FC7, $06) ; Prize pack index
%write_end()
..end
;-----------------------------
.torches1
%write8_enable()
%write8($7E0B37, $05) ; Arc variable
%write8($7E0FC7, $00) ; Prize pack index
%write_end()
..end
;-----------------------------
.torches2
%write8_enable()
%write8($7E0B37, $08) ; Arc variable
%write_end()
..end
;-----------------------------
.helma_key
%write8_enable()
%write8($7E0B37, $0B) ; Arc variable
%write_end()
..end
;-----------------------------
.bombable_wall
%write8_enable()
%write8($7E0B37, $09) ; Arc variable
%write_end()
..end
;-----------------------------
.moldorm_2
%write8_enable()
%write8($7E0B37, $10) ; Arc variable
%write_end()
..end
;-----------------------------
.agahnim_2
..end

;===================================================================================================
presetpersistent_lownmg_ganon:
;-----------------------------
.pyramid
..end

;===================================================================================================
presetpersistent_lownmg_boss:
;===================================================================================================
presetSRAM_lownmg:
;---------------------------------------------------------------------------------------------------
.escape
;---------------------------------------------------------------------------------------------------
..bed
%write8($7EF36F, $FF) ; Keys
%write8($7EF36C, $1818) ; Health (goal)
%write8($7EF377, $F8) ; abilities
%write16sram($7EF401, $FFFF) ; Deaths
%writeroom($104, $0002) ; Room $0104: Unknown (...............q)
%writeroom($106, $F000) ; Room $0106: Unknown (.dddb...........)
%writeroom($107, $F000) ; Room $0107: Unknown (.dddb...........)
...end
;---------------------------------------------------------------------------------------------------
..courtyard
%write8($7EF2BB, $00) ; Overworld $3B: Unknown (........)
%write8($7EF2FB, $00) ; Overworld $7B: Unknown (........)
%write8($7EF3C8, $03) ; Entrances Phase
%write8($7EF359, $01) ; Sword
%write8($7EF3C5, $01) ; Game Phase 1
%write8($7EF35A, $01) ; Shield
%write16sram($7EF360, $01) ; Rupees (actual)
%write8($7EF3C6, $11) ; Game Phase 2
%writeroom($055, $000F) ; Room $0055: Castle Secret Entrance / Uncle Death Room (.............qqq)
%writeroom($028, $0000) ; Room $0028: Swamp Palace (Entrance Room) (................)
...end
;---------------------------------------------------------------------------------------------------
..entrance
...end
;---------------------------------------------------------------------------------------------------
..1st_keyguard
%write8($7EF36F, $00) ; Keys
%writeroom($050, $0005) ; Room $0050: Hyrule Castle (West Corridor) (..............q.)
%writeroom($060, $0005) ; Room $0060: Hyrule Castle (West Entrance Room) (..............q.)
%writeroom($001, $000C) ; Room $0001: Hyrule Castle (North Corridor) (.............qq.)
%writeroom($061, $000F) ; Room $0061: Hyrule Castle (Main Entrance Room) (.............qqq)
...end
;---------------------------------------------------------------------------------------------------
..stealth_room
%writeroom($072, $840F) ; Room $0072: Hyrule Castle (Map Chest Room) (.d....K......qqq)
%writeroom($082, $000F) ; Room $0082: Hyrule Castle (Basement Chasm Room) (.............qqq)
...end
;---------------------------------------------------------------------------------------------------
..2nd_keyguard
%writeroom($071, $0002) ; Room $0071: Hyrule Castle (Boomerang Chest Room) (...............q)
%writeroom($081, $000F) ; Room $0081: Hyrule Castle (.............qqq)
...end
;---------------------------------------------------------------------------------------------------
..ball_n_chains
%writeroom($070, $0008) ; Room $0070: Hyrule Castle (Small Corridor to Jail Cells) (.............q..)
%writeroom($071, $840B) ; Room $0071: Hyrule Castle (Boomerang Chest Room) (.d....K......q.q)
...end
;---------------------------------------------------------------------------------------------------
..backtracking
%write8($7EF3D3, $00) ; Super Bomb Boom
%write8($7EF3FF, $00) ; Deaths
%write8($7EF3C8, $02) ; Entrances Phase
%write8($7EF3CC, $01) ; Tagalong
%write8($7EF3E5, $00) ; Validity (checksum)
%write8($7EF34A, $01) ; Torch
%write16sram($7EF366, $4000) ; BigKey1
%writeroom($080, $043C) ; Room $0080: Hyrule Castle (Jail Cell Room) (......K....cqqq.)
...end
;---------------------------------------------------------------------------------------------------
..keyguard_revisited
...end
;---------------------------------------------------------------------------------------------------
..throne_room
%writeroom($051, $000F) ; Room $0051: Hyrule Castle (Throne Room) (.............qqq)
...end
;---------------------------------------------------------------------------------------------------
..snake_avoidance_room
%write8($7EF3C8, $04) ; Entrances Phase
%writeroom($041, $000F) ; Room $0041: Hyrule Castle (First Dark Room) (.............qqq)
...end
;---------------------------------------------------------------------------------------------------
..water_rooms
%writeroom($032, $801F) ; Room $0032: Hyrule Castle (Sewer Key Chest Room) (.d..........qqqq)
%writeroom($042, $000C) ; Room $0042: Hyrule Castle (6 Ropes Room) (.............qq.)
...end
;---------------------------------------------------------------------------------------------------
..keyrat
%writeroom($022, $8003) ; Room $0022: Hyrule Castle (Sewer Text Trigger Room) (.d.............q)
%writeroom($021, $0003) ; Room $0021: Hyrule Castle (Key-rat Room) (...............q)
...end
;---------------------------------------------------------------------------------------------------
..last_two_screens
%writeroom($011, $2005) ; Room $0011: Hyrule Castle (Bombable Stock Room) (...d..........q.)
%writeroom($021, $840F) ; Room $0021: Hyrule Castle (Key-rat Room) (.d....K......qqq)
...end
;---------------------------------------------------------------------------------------------------
.eastern
;---------------------------------------------------------------------------------------------------
..before_cutscene
%write8($7EF36D, $14) ; Health (actual)
%writeroom($002, $000F) ; Room $0002: Hyrule Castle (Switch Room) (.............qqq)
...end
;---------------------------------------------------------------------------------------------------
..after_cutscene
%write8($7EF29B, $20) ; Overworld $1B: Unknown (...?....)
%write8($7EF3C7, $01) ; Map Phase
%write8($7EF3E3, $00) ; Player name
%write8($7EF3C8, $01) ; Entrances Phase
%write8($7EF3CC, $00) ; Tagalong
%write8($7EF3C5, $02) ; Game Phase 1
%write8($7EF3C6, $15) ; Game Phase 2
%writeroom($012, $000F) ; Room $0012: Sanctuary (.............qqq)
...end
;---------------------------------------------------------------------------------------------------
..octorok
%write8($7EF36F, $FF) ; Keys
...end
;---------------------------------------------------------------------------------------------------
..outside_palace
...end
;---------------------------------------------------------------------------------------------------
..entrance
%write16sram($7EF360, $06) ; Rupees (actual)
...end
;---------------------------------------------------------------------------------------------------
..stalfos_room
%write8($7EF36F, $00) ; Keys
%write8($7EF36D, $18) ; Health (actual)
%writeroom($0A8, $0005) ; Room $00A8: Eastern Palace (Stalfos Spawn Room) (..............q.)
%writeroom($0A9, $000F) ; Room $00A9: Eastern Palace (Big Chest Room) (.............qqq)
%writeroom($0B9, $000F) ; Room $00B9: Eastern Palace (Lobby Cannonballs Room) (.............qqq)
%writeroom($0C9, $000F) ; Room $00C9: Eastern Palace (Entrance Room) (.............qqq)
...end
;---------------------------------------------------------------------------------------------------
..big_chest_room_1
%writeroom($0A8, $000F) ; Room $00A8: Eastern Palace (Stalfos Spawn Room) (.............qqq)
...end
;---------------------------------------------------------------------------------------------------
..dark_key_room
%write8($7EF377, $05) ; Arrows
%writeroom($0AA, $000A) ; Room $00AA: Eastern Palace (Map Chest Room) (.............q.q)
%writeroom($0BA, $0008) ; Room $00BA: Eastern Palace (Dark Antifairy / Key Pot Room) (.............q..)
...end
;---------------------------------------------------------------------------------------------------
..big_key_dmg_boost
%write8($7EF373, $00) ; Magic filler
%write16sram($7EF360, $1A) ; Rupees (actual)
%write8($7EF36E, $10) ; Magic Power
%writeroom($0BA, $840C) ; Room $00BA: Eastern Palace (Dark Antifairy / Key Pot Room) (.d....K......qq.)
%writeroom($0B9, $800F) ; Room $00B9: Eastern Palace (Lobby Cannonballs Room) (.d...........qqq)
...end
;---------------------------------------------------------------------------------------------------
..big_chest_room_2
%write8($7EF36D, $0C) ; Health (actual)
%write16sram($7EF366, $6000) ; BigKey1
%writeroom($0A8, $200F) ; Room $00A8: Eastern Palace (Stalfos Spawn Room) (...d.........qqq)
%writeroom($0B8, $8015) ; Room $00B8: Eastern Palace (Big Key Room) (.d..........q.q.)
...end
;---------------------------------------------------------------------------------------------------
..gwg
%write8($7EF34F, $00) ; Bottles
%write8($7EF377, $0F) ; Arrows
%write8($7EF340, $02) ; Bow
%writeroom($0A9, $201F) ; Room $00A9: Eastern Palace (Big Chest Room) (...d........qqqq)
...end
;---------------------------------------------------------------------------------------------------
..pot_room
%write8($7EF377, $0E) ; Arrows
%write8($7EF36E, $20) ; Magic Power
%writeroom($099, $C403) ; Room $0099: Eastern Palace (Eyegore Key Room) (.dd...K........q)
...end
;---------------------------------------------------------------------------------------------------
..zeldagamer_room
%write8($7EF377, $18) ; Arrows
%writeroom($0DA, $0002) ; Room $00DA: Eastern Palace (...............q)
%writeroom($0D9, $0003) ; Room $00D9: Eastern Palace (Canonball Room) (...............q)
...end
;---------------------------------------------------------------------------------------------------
..armos
%write8($7EF377, $1E) ; Arrows
%write8($7EF36D, $14) ; Health (actual)
%write16sram($7EF360, $24) ; Rupees (actual)
%writeroom($0D8, $0005) ; Room $00D8: Eastern Palace (Zeldagamer Room / Pre-Armos Knights Room) (..............q.)
...end
;---------------------------------------------------------------------------------------------------
.desert
;---------------------------------------------------------------------------------------------------
..outside_eastern_palace
%write8($7EF36F, $FF) ; Keys
%write8($7EF377, $06) ; Arrows
%write8($7EF3E7, $00) ; Deaths
%write8($7EF374, $04) ; Pendants
%write8($7EF36D, $18) ; Health (actual)
%write8($7EF36E, $80) ; Magic Power
%writeroom($0C8, $0801) ; Room $00C8: Eastern Palace (Armos Knights[Boss]) (.....k..........)
...end
;---------------------------------------------------------------------------------------------------
..ep_spinspeed
%write8($7EF343, $03) ; Bombs
%write8($7EF3C7, $03) ; Map Phase
%write8($7EF355, $01) ; Boots
%write8($7EF375, $00) ; Bomb filler
%write8($7EF379, $FC) ; Ability Flags
%write16sram($7EF360, $88) ; Rupees (actual)
%writeroom($105, $807A) ; Room $0105: Unknown (.d........ccqq.q)
...end
;---------------------------------------------------------------------------------------------------
..bridge_screen
...end
;---------------------------------------------------------------------------------------------------
..unholy_spinspeed
...end
;---------------------------------------------------------------------------------------------------
..water_dash
%write8($7EF34E, $01) ; Book of Mudora
%writeroom($107, $F002) ; Room $0107: Unknown (.dddb..........q)
...end
;---------------------------------------------------------------------------------------------------
..outside_desert_palace
...end
;---------------------------------------------------------------------------------------------------
..desert_entrance
...end
;---------------------------------------------------------------------------------------------------
..keybonk
%write8($7EF36F, $00) ; Keys
%write8($7EF377, $0B) ; Arrows
%writeroom($074, $0003) ; Room $0074: Desert Palace (Map Chest Room) (...............q)
%writeroom($084, $000F) ; Room $0084: Desert Palace (Main Entrance Room) (.............qqq)
%writeroom($073, $0001) ; Room $0073: Desert Palace (Big Chest Room) (................)
...end
;---------------------------------------------------------------------------------------------------
..pre_cannonball_room
%writeroom($073, $0405) ; Room $0073: Desert Palace (Big Chest Room) (......K.......q.)
%writeroom($075, $0002) ; Room $0075: Desert Palace (Big Key Chest Room) (...............q)
%writeroom($085, $400A) ; Room $0085: Desert Palace (East Entrance Room) (..d..........q.q)
...end
;---------------------------------------------------------------------------------------------------
..pot_room
%write8($7EF377, $10) ; Arrows
%write16sram($7EF366, $7000) ; BigKey1
%writeroom($075, $0017) ; Room $0075: Desert Palace (Big Key Chest Room) (............q.qq)
%writeroom($085, $400E) ; Room $0085: Desert Palace (East Entrance Room) (..d..........qqq)
...end
;---------------------------------------------------------------------------------------------------
..desert2_spinspeed
%write8($7EF377, $1A) ; Arrows
%write8($7EF354, $01) ; Gloves
%writeroom($073, $041F) ; Room $0073: Desert Palace (Big Chest Room) (......K.....qqqq)
%writeroom($083, $0007) ; Room $0083: Desert Palace (West Entrance Room) (..............qq)
...end
;---------------------------------------------------------------------------------------------------
..popo_genocide_room
%write8($7EF37F, $00) ; Key for dungeon $03
%writeroom($053, $0008) ; Room $0053: Desert Palace (Popos 2 / Beamos Hellway Room) (.............q..)
%writeroom($063, $840A) ; Room $0063: Desert Palace (Final Section Entrance Room) (.d....K......q.q)
...end
;---------------------------------------------------------------------------------------------------
..torches
%writeroom($043, $6401) ; Room $0043: Desert Palace (Torch Puzzle / Moving Wall Room) (..dd..K.........)
%writeroom($053, $240F) ; Room $0053: Desert Palace (Popos 2 / Beamos Hellway Room) (...d..K......qqq)
...end
;---------------------------------------------------------------------------------------------------
..lanmolas
%write8($7EF377, $1E) ; Arrows
%write8($7EF36E, $70) ; Magic Power
%writeroom($043, $E48D) ; Room $0043: Desert Palace (Torch Puzzle / Moving Wall Room) (.ddd..K..c...qq.)
...end
;---------------------------------------------------------------------------------------------------
.hera
;---------------------------------------------------------------------------------------------------
..outside_desert_palace
%write8($7EF36F, $FF) ; Keys
%write8($7EF377, $0A) ; Arrows
%write8($7EF374, $06) ; Pendants
%write8($7EF3E9, $00) ; Deaths
%write8($7EF36E, $80) ; Magic Power
%writeroom($033, $0802) ; Room $0033: Desert Palace (Lanmolas[Boss]) (.....k.........q)
...end
;---------------------------------------------------------------------------------------------------
..lake_hylia
...end
;---------------------------------------------------------------------------------------------------
..icerod_overworld
...end
;---------------------------------------------------------------------------------------------------
..waterwalk
%write8($7EF2B7, $02) ; Overworld $37: Unknown (.......?)
%write8($7EF343, $02) ; Bombs
%write8($7EF346, $01) ; Ice Rod
%writeroom($120, $001A) ; Room $0120: Unknown (............qq.q)
...end
;---------------------------------------------------------------------------------------------------
..dm
%write8($7EF3C8, $05) ; Entrances Phase
%write8($7EF3CC, $04) ; Tagalong
%write16sram($7EF360, $89) ; Rupees (actual)
%writeroom($0F0, $000F) ; Room $00F0: Cave (Lost Old Man Starting Cave) (.............qqq)
%writeroom($0F1, $000F) ; Room $00F1: Cave (Lost Old Man Starting Cave) (.............qqq)
...end
;---------------------------------------------------------------------------------------------------
..after_mirror
%write8($7EF353, $02) ; Magic Mirror
%write8($7EF3C8, $01) ; Entrances Phase
%write8($7EF3CC, $00) ; Tagalong
...end
;---------------------------------------------------------------------------------------------------
..quickhop
%write8($7EF343, $01) ; Bombs
...end
;---------------------------------------------------------------------------------------------------
..entrance
...end
;---------------------------------------------------------------------------------------------------
..tile_room
%write8($7EF36F, $00) ; Keys
%write8($7EF386, $01) ; Key for dungeon $0A
%writeroom($077, $800F) ; Room $0077: Tower of Hera (Entrance Room) (.d...........qqq)
%writeroom($087, $0402) ; Room $0087: Tower of Hera (Tile Room) (......K........q)
...end
;---------------------------------------------------------------------------------------------------
..minimoldorm_switch
%writeroom($087, $040A) ; Room $0087: Tower of Hera (Tile Room) (......K......q.q)
...end
;---------------------------------------------------------------------------------------------------
..torches
%writeroom($087, $040E) ; Room $0087: Tower of Hera (Tile Room) (......K......qqq)
...end
;---------------------------------------------------------------------------------------------------
..beetles
%write16sram($7EF366, $7020) ; BigKey1
%write8($7EF36E, $70) ; Magic Power
%write8($7EF386, $00) ; Key for dungeon $0A
%writeroom($087, $041F) ; Room $0087: Tower of Hera (Tile Room) (......K.....qqqq)
...end
;---------------------------------------------------------------------------------------------------
..petting_zoo
%write8($7EF343, $02) ; Bombs
%write8($7EF377, $0F) ; Arrows
%writeroom($031, $800F) ; Room $0031: Tower of Hera (Hardhat Beetles Room) (.d...........qqq)
...end
;---------------------------------------------------------------------------------------------------
..moldorm
%write8($7EF357, $01) ; Moon Pearl
%write8($7EF36D, $10) ; Health (actual)
%writeroom($017, $000F) ; Room $0017: Tower of Hera (Moldorm Fall Room) (.............qqq)
%writeroom($027, $001F) ; Room $0027: Tower of Hera (Big Chest) (............qqqq)
...end
;---------------------------------------------------------------------------------------------------
.aga
;---------------------------------------------------------------------------------------------------
..outside_hera
%write8($7EF343, $00) ; Bombs
%write8($7EF36F, $FF) ; Keys
%write8($7EF3C7, $04) ; Map Phase
%write8($7EF3F7, $00) ; Deaths
%write8($7EF374, $07) ; Pendants
%write8($7EF36D, $18) ; Health (actual)
%write8($7EF36E, $80) ; Magic Power
%writeroom($007, $080F) ; Room $0007: Tower of Hera (Moldorm[Boss]) (.....k.......qqq)
...end
;---------------------------------------------------------------------------------------------------
..first_rupee_tree
%writeroom($0E6, $000F) ; Room $00E6: Cave (.............qqq)
%writeroom($0E7, $000F) ; Room $00E7: Cave (.............qqq)
...end
;---------------------------------------------------------------------------------------------------
..lost_woods
%write16sram($7EF360, $98) ; Rupees (actual)
%write8($7EF36E, $70) ; Magic Power
...end
;---------------------------------------------------------------------------------------------------
..after_grove
%write8($7EF3C7, $05) ; Map Phase
%write8($7EF300, $40) ; Overworld $80: Unknown (..?.....)
%write8($7EF359, $02) ; Sword
...end
;---------------------------------------------------------------------------------------------------
..after_lost_woods
%write16sram($7EF360, $E8) ; Rupees (actual)
...end
;---------------------------------------------------------------------------------------------------
..castle_screen
...end
;---------------------------------------------------------------------------------------------------
..entrance
%write8($7EF29B, $60) ; Overworld $1B: Unknown (..??....)
%write16sram($7EF360, $138) ; Rupees (actual)
...end
;---------------------------------------------------------------------------------------------------
..fairy_skip
%write8($7EF36F, $00) ; Keys
%write8($7EF377, $0D) ; Arrows
%writeroom($0E0, $000A) ; Room $00E0: Agahnim's Tower (Entrance Room) (.............q.q)
...end
;---------------------------------------------------------------------------------------------------
..dark_room_of_despair
%writeroom($0D0, $0004) ; Room $00D0: Agahnim's Tower (Dark Maze) (..............q.)
%writeroom($0E0, $201E) ; Room $00E0: Agahnim's Tower (Entrance Room) (...d........qqqq)
...end
;---------------------------------------------------------------------------------------------------
..dark_room_of_melancholy
%writeroom($0C0, $0001) ; Room $00C0: Agahnim's Tower (Dark Bridge Room) (................)
%writeroom($0D0, $801F) ; Room $00D0: Agahnim's Tower (Dark Maze) (.d..........qqqq)
...end
;---------------------------------------------------------------------------------------------------
..spear_guards
%writeroom($0C0, $240F) ; Room $00C0: Agahnim's Tower (Dark Bridge Room) (...d..K......qqq)
...end
;---------------------------------------------------------------------------------------------------
..circle_of_pots
%write8($7EF377, $09) ; Arrows
%writeroom($0B0, $000C) ; Room $00B0: Agahnim's Tower (Circle of Pots) (.............qq.)
...end
;---------------------------------------------------------------------------------------------------
..catwalk
%write8($7EF377, $0E) ; Arrows
%write16sram($7EF360, $139) ; Rupees (actual)
%writeroom($040, $0001) ; Room $0040: Agahnim's Tower (Final Bridge Room) (................)
%writeroom($0B0, $240F) ; Room $00B0: Agahnim's Tower (Circle of Pots) (...d..K......qqq)
...end
;---------------------------------------------------------------------------------------------------
..agahnim
%writeroom($030, $840A) ; Room $0030: Agahnim's Tower (Maiden Sacrifice Chamber) (.d....K......q.q)
%writeroom($040, $000B) ; Room $0040: Agahnim's Tower (Final Bridge Room) (.............q.q)
...end
;---------------------------------------------------------------------------------------------------
.pod
;---------------------------------------------------------------------------------------------------
..pyramid
%write8($7EF36F, $FF) ; Keys
%write8($7EF3C7, $06) ; Map Phase
%write8($7EF3EB, $00) ; Deaths
%write8($7EF3C5, $03) ; Game Phase 1
%write8($7EF282, $20) ; Overworld $02: Unknown (...?....)
%write8($7EF36E, $80) ; Magic Power
%write8($7EF3CA, $40) ; LW/DW
%writeroom($020, $0802) ; Room $0020: Agahnim's Tower (Agahnim[Boss]) (.....k.........q)
...end
;---------------------------------------------------------------------------------------------------
..pod_overworld
...end
;---------------------------------------------------------------------------------------------------
..entrance
%write8($7EF2DE, $20) ; Overworld $5E: Unknown (...?....)
%write16sram($7EF360, $CB) ; Rupees (actual)
...end
;---------------------------------------------------------------------------------------------------
..main_hub_small_key
%write8($7EF343, $02) ; Bombs
%write8($7EF36F, $00) ; Keys
%write8($7EF382, $01) ; Key for dungeon $06
%writeroom($04A, $200F) ; Room $004A: Palace of Darkness (Entrance Room) (...d.........qqq)
%writeroom($009, $0018) ; Room $0009: Palace of Darkness (............qq..)
...end
;---------------------------------------------------------------------------------------------------
..main_hub_bk
%write8($7EF343, $03) ; Bombs
%write8($7EF36F, $01) ; Keys
%writeroom($00A, $001F) ; Room $000A: Palace of Darkness (Stalfos Trap Room) (............qqqq)
%writeroom($03A, $800F) ; Room $003A: Palace of Darkness (Bombable Floor Room) (.d...........qqq)
...end
;---------------------------------------------------------------------------------------------------
..main_hub_hammeryump
%write8($7EF36F, $00) ; Keys
%write16sram($7EF366, $7220) ; BigKey1
%write8($7EF382, $00) ; Key for dungeon $06
%writeroom($00A, $801F) ; Room $000A: Palace of Darkness (Stalfos Trap Room) (.d..........qqqq)
%writeroom($03A, $801F) ; Room $003A: Palace of Darkness (Bombable Floor Room) (.d..........qqqq)
...end
;---------------------------------------------------------------------------------------------------
..hammeryump
%writeroom($02A, $402F) ; Room $002A: Palace of Darkness (Big Hub Room) (..d........c.qqq)
...end
;---------------------------------------------------------------------------------------------------
..before_sexy_statue
%write8($7EF34B, $01) ; Hammer
%write8($7EF36F, $01) ; Keys
%write8($7EF36D, $10) ; Health (actual)
%write8($7EF382, $01) ; Key for dungeon $06
%writeroom($01A, $301A) ; Room $001A: Palace of Darkness (Big Chest Room) (...db.......qq.q)
%writeroom($019, $802F) ; Room $0019: Palace of Darkness (Dark Maze) (.d.........c.qqq)
...end
;---------------------------------------------------------------------------------------------------
..sexy_statue_room
%write8($7EF377, $0D) ; Arrows
...end
;---------------------------------------------------------------------------------------------------
..mimics
%write8($7EF343, $05) ; Bombs
%write8($7EF36D, $18) ; Health (actual)
%writeroom($02B, $000A) ; Room $002B: Palace of Darkness (Map Chest / Fairy Room) (.............q.q)
...end
;---------------------------------------------------------------------------------------------------
..statue
%write8($7EF377, $18) ; Arrows
%writeroom($01B, $0002) ; Room $001B: Palace of Darkness (Mimics / Moving Wall Room) (...............q)
...end
;---------------------------------------------------------------------------------------------------
..basement
%write8($7EF377, $16) ; Arrows
%write8($7EF36E, $74) ; Magic Power
%writeroom($01B, $008E) ; Room $001B: Palace of Darkness (Mimics / Moving Wall Room) (.........c...qqq)
...end
;---------------------------------------------------------------------------------------------------
..turtle_room
%write8($7EF36F, $00) ; Keys
%writeroom($00B, $200C) ; Room $000B: Palace of Darkness (Turtle Room) (...d.........qq.)
...end
;---------------------------------------------------------------------------------------------------
..helma
%write16sram($7EF360, $D0) ; Rupees (actual)
%writeroom($06A, $8005) ; Room $006A: Palace of Darkness (Rupee Room) (.d............q.)
%writeroom($00B, $200F) ; Room $000B: Palace of Darkness (Turtle Room) (...d.........qqq)
...end
;---------------------------------------------------------------------------------------------------
.thieves
;---------------------------------------------------------------------------------------------------
..outside_pod
%write8($7EF36F, $FF) ; Keys
%write8($7EF377, $10) ; Arrows
%write8($7EF3C7, $07) ; Map Phase
%write8($7EF3EF, $00) ; Deaths
%write8($7EF36E, $80) ; Magic Power
%write8($7EF37A, $02) ; Crystals
%write8($7EF382, $00) ; Key for dungeon $06
%writeroom($05A, $0801) ; Room $005A: Palace of Darkness (Helmasaur King[Boss]) (.....k..........)
...end
;---------------------------------------------------------------------------------------------------
..ow_hammerdash
...end
;---------------------------------------------------------------------------------------------------
..grove
...end
;---------------------------------------------------------------------------------------------------
..usain_bolt
%write8($7EF34C, $02) ; Flute
%write8($7EF3CA, $00) ; LW/DW
...end
;---------------------------------------------------------------------------------------------------
..after_activating_flute
%write8($7EF298, $20) ; Overworld $18: Unknown (...?....)
%write8($7EF34C, $03) ; Flute
...end
;---------------------------------------------------------------------------------------------------
..darkworld
%write8($7EF3CA, $40) ; LW/DW
...end
;---------------------------------------------------------------------------------------------------
..entrance
%write8($7EF2D8, $20) ; Overworld $58: Unknown (...?....)
...end
;---------------------------------------------------------------------------------------------------
..after_big_key
%write8($7EF36F, $00) ; Keys
%write16sram($7EF366, $7230) ; BigKey1
%writeroom($0CC, $000F) ; Room $00CC: Thieves Town (North East Entrance Room) (.............qqq)
%writeroom($0DC, $000F) ; Room $00DC: Thieves Town (South East Entrance Room) (.............qqq)
%writeroom($0CB, $000F) ; Room $00CB: Thieves Town (North West Entrance Room) (.............qqq)
%writeroom($0DB, $002F) ; Room $00DB: Thieves Town (Main (South West) Entrance Room) (...........c.qqq)
...end
;---------------------------------------------------------------------------------------------------
..blind_hallway
%writeroom($0CC, $800F) ; Room $00CC: Thieves Town (North East Entrance Room) (.d...........qqq)
...end
;---------------------------------------------------------------------------------------------------
..conveyor_gibos
%writeroom($0BC, $C407) ; Room $00BC: Thieves Town (Conveyor Toilet) (.dd...K.......qq)
...end
;---------------------------------------------------------------------------------------------------
..hellway
%writeroom($0BB, $0001) ; Room $00BB: Thieves Town (Hellway) (................)
...end
;---------------------------------------------------------------------------------------------------
..bombable_floor
%writeroom($064, $0003) ; Room $0064: Thieves Town (West Attic Room) (...............q)
%writeroom($065, $0002) ; Room $0065: Thieves Town (East Attic Room) (...............q)
%writeroom($0AB, $8402) ; Room $00AB: Thieves Town (Moving Spikes / Key Pot Room) (.d....K........q)
%writeroom($0BB, $000B) ; Room $00BB: Thieves Town (Hellway) (.............q.q)
...end
;---------------------------------------------------------------------------------------------------
..backtracking_1
%write8($7EF343, $04) ; Bombs
%writeroom($065, $0103) ; Room $0065: Thieves Town (East Attic Room) (........c......q)
...end
;---------------------------------------------------------------------------------------------------
..basement
%writeroom($0BC, $C40F) ; Room $00BC: Thieves Town (Conveyor Toilet) (.dd...K......qqq)
%writeroom($0BB, $000F) ; Room $00BB: Thieves Town (Hellway) (.............qqq)
...end
;---------------------------------------------------------------------------------------------------
..prison
%writeroom($045, $000A) ; Room $0045: Thieves Town (Jail Cells Room) (.............q.q)
...end
;---------------------------------------------------------------------------------------------------
..after_gloves
%write8($7EF3CC, $06) ; Tagalong
%writeroom($044, $4005) ; Room $0044: Thieves Town (Big Chest Room) (..d...........q.)
%writeroom($045, $00FF) ; Room $0045: Thieves Town (Jail Cells Room) (.........cccqqqq)
...end
;---------------------------------------------------------------------------------------------------
..backtracking_2
%write8($7EF354, $02) ; Gloves
%writeroom($044, $4017) ; Room $0044: Thieves Town (Big Chest Room) (..d.........q.qq)
...end
;---------------------------------------------------------------------------------------------------
..pot_hammerdash
%write8($7EF377, $15) ; Arrows
...end
;---------------------------------------------------------------------------------------------------
..blind
%write8($7EF36E, $74) ; Magic Power
...end
;---------------------------------------------------------------------------------------------------
.skull
;---------------------------------------------------------------------------------------------------
..outside_thieves
%write8($7EF36F, $FF) ; Keys
%write8($7EF377, $0F) ; Arrows
%write8($7EF3CC, $00) ; Tagalong
%write8($7EF3F9, $00) ; Deaths
%write8($7EF36E, $80) ; Magic Power
%write8($7EF37A, $22) ; Crystals
%write8($7EF387, $00) ; Key for dungeon $0B
%writeroom($0AC, $0A01) ; Room $00AC: Thieves Town (Blind The Thief[Boss]) (.....k.R........)
...end
;---------------------------------------------------------------------------------------------------
..dash_to_sw
%write16sram($7EF360, $1FC) ; Rupees (actual)
%writeroom($11C, $0011) ; Room $011C: Unknown (............q...)
...end
;---------------------------------------------------------------------------------------------------
..mummy_room
...end
;---------------------------------------------------------------------------------------------------
..bomb_jump
%write16sram($7EF366, $72B0) ; BigKey1
%writeroom($057, $001A) ; Room $0057: Skull Woods (Big Key Room) (............qq.q)
...end
;---------------------------------------------------------------------------------------------------
..key_pot
%write8($7EF343, $03) ; Bombs
%write8($7EF36F, $00) ; Keys
%write8($7EF345, $01) ; Fire Rod
%write8($7EF36D, $10) ; Health (actual)
%write16sram($7EF360, $201) ; Rupees (actual)
%writeroom($056, $0005) ; Room $0056: Skull Woods (Key Pot / Trap Room) (..............q.)
%writeroom($058, $0012) ; Room $0058: Skull Woods (Big Chest Room) (............q..q)
...end
;---------------------------------------------------------------------------------------------------
..skull_entrance
%write8($7EF36F, $FF) ; Keys
%write8($7EF2C0, $20) ; Overworld $40: Unknown (...?....)
%write8($7EF384, $01) ; Key for dungeon $08
%write8($7EF36E, $70) ; Magic Power
%writeroom($056, $0407) ; Room $0056: Skull Woods (Key Pot / Trap Room) (......K.......qq)
...end
;---------------------------------------------------------------------------------------------------
..mummy_hellway
%write8($7EF36F, $00) ; Keys
%writeroom($049, $2002) ; Room $0049: Skull Woods (Gibdo Torch Puzzle Room) (...d...........q)
%writeroom($059, $800A) ; Room $0059: Skull Woods (Final Section Entrance Room) (.d...........q.q)
...end
;---------------------------------------------------------------------------------------------------
..mummy_key
%write8($7EF36E, $20) ; Magic Power
%writeroom($049, $A00F) ; Room $0049: Skull Woods (Gibdo Torch Puzzle Room) (.d.d.........qqq)
...end
;---------------------------------------------------------------------------------------------------
..mothula
%write8($7EF36D, $18) ; Health (actual)
%write8($7EF36E, $10) ; Magic Power
%writeroom($039, $4402) ; Room $0039: Skull Woods (Gibdo Key / Mothula Hole Room) (..d...K........q)
...end
;---------------------------------------------------------------------------------------------------
.mire
;---------------------------------------------------------------------------------------------------
..outside_skull
%write8($7EF36F, $FF) ; Keys
%write8($7EF3F3, $00) ; Deaths
%write8($7EF384, $00) ; Key for dungeon $08
%write8($7EF36E, $80) ; Magic Power
%write8($7EF37A, $62) ; Crystals
%writeroom($029, $0801) ; Room $0029: Skull Woods (Mothula[Boss]) (.....k..........)
%writeroom($039, $4403) ; Room $0039: Skull Woods (Gibdo Key / Mothula Hole Room) (..d...K........q)
...end
;---------------------------------------------------------------------------------------------------
..dm
%write8($7EF3CA, $00) ; LW/DW
...end
;---------------------------------------------------------------------------------------------------
..bridge_warp
%write8($7EF348, $01) ; Ether Medallion
...end
;---------------------------------------------------------------------------------------------------
..lottery
%write8($7EF3CA, $40) ; LW/DW
...end
;---------------------------------------------------------------------------------------------------
..medallion
...end
;---------------------------------------------------------------------------------------------------
..zoras_domain
%write8($7EF349, $01) ; Quake Medallion
%write8($7EF3CA, $00) ; LW/DW
...end
;---------------------------------------------------------------------------------------------------
..darkworld_warp
%write8($7EF304, $0F) ; 
%write8($7EF379, $FE) ; Ability Flags
%write8($7EF356, $01) ; Flippers
%write16sram($7EF360, $0D) ; Rupees (actual)
...end
;---------------------------------------------------------------------------------------------------
..entrance
%write8($7EF2F0, $20) ; Overworld $70: Unknown (...?....)
%write8($7EF36E, $60) ; Magic Power
%write8($7EF3CA, $40) ; LW/DW
...end
;---------------------------------------------------------------------------------------------------
..mire2
%write8($7EF36F, $00) ; Keys
%writeroom($098, $0003) ; Room $0098: Misery Mire (Entrance Room) (...............q)
...end
;---------------------------------------------------------------------------------------------------
..main_hub
%write8($7EF36E, $50) ; Magic Power
%writeroom($0D2, $000F) ; Room $00D2: Misery Mire (Mire02 / Wizzrobes Room) (.............qqq)
...end
;---------------------------------------------------------------------------------------------------
..beat_the_fireball
%write8($7EF36F, $01) ; Keys
%write8($7EF377, $14) ; Arrows
%writeroom($0A2, $001F) ; Room $00A2: Misery Mire (Bridge Key Chest Room) (............qqqq)
%writeroom($0B2, $000D) ; Room $00B2: Misery Mire (Slug Room) (.............qq.)
%writeroom($0C2, $000F) ; Room $00C2: Misery Mire (Big Hub Room) (.............qqq)
...end
;---------------------------------------------------------------------------------------------------
..bari_key
%write8($7EF36F, $00) ; Keys
%writeroom($0C2, $400F) ; Room $00C2: Misery Mire (Big Hub Room) (..d..........qqq)
...end
;---------------------------------------------------------------------------------------------------
..sluggulas
%writeroom($0C1, $C403) ; Room $00C1: Misery Mire (Compass Chest / Tile Room) (.dd...K........q)
...end
;---------------------------------------------------------------------------------------------------
..torches
%write8($7EF373, $69) ; Magic filler
%write8($7EF36E, $57) ; Magic Power
%writeroom($0D1, $0008) ; Room $00D1: Misery Mire (Conveyor Slug / Big Key Room) (.............q..)
...end
;---------------------------------------------------------------------------------------------------
..spark_avoidance
%write8($7EF373, $00) ; Magic filler
%write16sram($7EF366, $73B0) ; BigKey1
%write8($7EF36E, $40) ; Magic Power
%writeroom($097, $010F) ; Room $0097: Misery Mire (Torch Puzzle / Moving Wall Room) (........c....qqq)
%writeroom($0B1, $0007) ; Room $00B1: Misery Mire (Hourglass Room) (..............qq)
%writeroom($0C1, $C407) ; Room $00C1: Misery Mire (Compass Chest / Tile Room) (.dd...K.......qq)
%writeroom($0D1, $001B) ; Room $00D1: Misery Mire (Conveyor Slug / Big Key Room) (............qq.q)
...end
;---------------------------------------------------------------------------------------------------
..big_chest_room
%writeroom($0C3, $000A) ; Room $00C3: Misery Mire (Big Chest Room) (.............q.q)
...end
;---------------------------------------------------------------------------------------------------
..wizzrobe
%write8($7EF350, $01) ; Cane of Somaria
%writeroom($0B3, $840A) ; Room $00B3: Misery Mire (Spike Key Chest Room) (.d....K......q.q)
%writeroom($0C3, $001F) ; Room $00C3: Misery Mire (Big Chest Room) (............qqqq)
...end
;---------------------------------------------------------------------------------------------------
..basement
%write16sram($7EF360, $0E) ; Rupees (actual)
%writeroom($0A2, $801F) ; Room $00A2: Misery Mire (Bridge Key Chest Room) (.d..........qqqq)
%writeroom($0B2, $800D) ; Room $00B2: Misery Mire (Slug Room) (.d...........qq.)
...end
;---------------------------------------------------------------------------------------------------
..spooky_action_1
%write8($7EF36E, $38) ; Magic Power
%writeroom($093, $000E) ; Room $0093: Misery Mire (Dark Cane Floor Switch Puzzle Room) (.............qqq)
...end
;---------------------------------------------------------------------------------------------------
..spooky_action_2
%write8($7EF36E, $28) ; Magic Power
%writeroom($092, $0005) ; Room $0092: Misery Mire (Dark Bomb Wall / Switches Room) (..............q.)
...end
;---------------------------------------------------------------------------------------------------
..vitty
%write8($7EF36E, $08) ; Magic Power
%writeroom($092, $0007) ; Room $0092: Misery Mire (Dark Bomb Wall / Switches Room) (..............qq)
%writeroom($0A0, $800F) ; Room $00A0: Misery Mire (Pre-Vitreous Room) (.d...........qqq)
%writeroom($091, $0005) ; Room $0091: Misery Mire (Final Switch Room) (..............q.)
...end
;---------------------------------------------------------------------------------------------------
.swamp
;---------------------------------------------------------------------------------------------------
..outside_mire
%write8($7EF36F, $FF) ; Keys
%write8($7EF377, $03) ; Arrows
%write8($7EF383, $00) ; Key for dungeon $07
%write8($7EF3F1, $00) ; Deaths
%write8($7EF36E, $80) ; Magic Power
%write8($7EF37A, $63) ; Crystals
%writeroom($090, $0802) ; Room $0090: Misery Mire (Vitreous[Boss]) (.....k.........q)
...end
;---------------------------------------------------------------------------------------------------
..links_house
%write8($7EF3CA, $00) ; LW/DW
...end
;---------------------------------------------------------------------------------------------------
..swamp_overworld
%write8($7EF3CA, $40) ; LW/DW
...end
;---------------------------------------------------------------------------------------------------
..antifairy_room
%write8($7EF3CA, $00) ; LW/DW
...end
;---------------------------------------------------------------------------------------------------
..entrance
%write8($7EF2BB, $20) ; Overworld $3B: Unknown (...?....)
%write8($7EF2FB, $20) ; Overworld $7B: Unknown (...?....)
%write8($7EF3CA, $40) ; LW/DW
%writeroom($10B, $008F) ; Room $010B: Unknown (.........c...qqq)
%writeroom($028, $0001) ; Room $0028: Swamp Palace (Entrance Room) (................)
...end
;---------------------------------------------------------------------------------------------------
..first_key_pot
%write8($7EF36F, $00) ; Keys
%writeroom($028, $811F) ; Room $0028: Swamp Palace (Entrance Room) (.d......c...qqqq)
...end
;---------------------------------------------------------------------------------------------------
..hallway_key_1
%write8($7EF343, $04) ; Bombs
%writeroom($038, $440A) ; Room $0038: Swamp Palace (Key Pot Room) (..d...K......q.q)
%writeroom($037, $1003) ; Room $0037: Swamp Palace (Map Chest / Water Fill Room) (....b..........q)
...end
;---------------------------------------------------------------------------------------------------
..water_lever_1
%writeroom($037, $340F) ; Room $0037: Swamp Palace (Map Chest / Water Fill Room) (...db.K......qqq)
...end
;---------------------------------------------------------------------------------------------------
..main_hub
%writeroom($037, $348F) ; Room $0037: Swamp Palace (Map Chest / Water Fill Room) (...db.K..c...qqq)
...end
;---------------------------------------------------------------------------------------------------
..water_lever_2
%write16sram($7EF360, $0F) ; Rupees (actual)
%writeroom($036, $200F) ; Room $0036: Swamp Palace (Big Chest Room) (...d.........qqq)
%writeroom($035, $040F) ; Room $0035: Swamp Palace (Big Key / BS Room) (......K......qqq)
...end
;---------------------------------------------------------------------------------------------------
..sociable_firebar
%writeroom($034, $000F) ; Room $0034: Swamp Palace (Push Block Puzzle / Pre-Big Key Room) (.............qqq)
%writeroom($035, $848F) ; Room $0035: Swamp Palace (Big Key / BS Room) (.d....K..c...qqq)
...end
;---------------------------------------------------------------------------------------------------
..backtracking
%write16sram($7EF366, $77B0) ; BigKey1
%writeroom($054, $000F) ; Room $0054: Swamp Palace (Upstairs Pits Room) (.............qqq)
%writeroom($035, $849F) ; Room $0035: Swamp Palace (Big Key / BS Room) (.d....K..c..qqqq)
...end
;---------------------------------------------------------------------------------------------------
..hook_shot
...end
;---------------------------------------------------------------------------------------------------
..hookdash
%write8($7EF342, $01) ; Hookshot
%writeroom($036, $641F) ; Room $0036: Swamp Palace (Big Chest Room) (..dd..K.....qqqq)
...end
;---------------------------------------------------------------------------------------------------
..water_lever_3
%writeroom($026, $8007) ; Room $0026: Swamp Palace (Statue Room) (.d............qq)
...end
;---------------------------------------------------------------------------------------------------
..restock
%writeroom($066, $0003) ; Room $0066: Swamp Palace (Hidden Chest / Hidden Door Room) (...............q)
%writeroom($076, $008E) ; Room $0076: Swamp Palace (Water Drain Room) (.........c...qqq)
...end
;---------------------------------------------------------------------------------------------------
..phelps_way
%write8($7EF343, $05) ; Bombs
%write8($7EF377, $08) ; Arrows
%writeroom($016, $000C) ; Room $0016: Swamp Palace (Swimming Treadmill) (.............qq.)
%writeroom($066, $000F) ; Room $0066: Swamp Palace (Hidden Chest / Hidden Door Room) (.............qqq)
...end
;---------------------------------------------------------------------------------------------------
..arrghus
%writeroom($016, $440F) ; Room $0016: Swamp Palace (Swimming Treadmill) (..d...K......qqq)
...end
;---------------------------------------------------------------------------------------------------
.ice
;---------------------------------------------------------------------------------------------------
..outside_swamp
%write8($7EF36F, $FF) ; Keys
%write8($7EF381, $00) ; Key for dungeon $05
%write8($7EF3ED, $00) ; Deaths
%write8($7EF37A, $73) ; Crystals
%writeroom($006, $0802) ; Room $0006: Swamp Palace (Arrghus[Boss]) (.....k.........q)
...end
;---------------------------------------------------------------------------------------------------
..swim_pumping
%write8($7EF2BB, $00) ; Overworld $3B: Unknown (........)
%write8($7EF2FB, $00) ; Overworld $7B: Unknown (........)
%write8($7EF3CA, $00) ; LW/DW
%writeroom($10B, $000F) ; Room $010B: Unknown (.............qqq)
%writeroom($028, $0080) ; Room $0028: Swamp Palace (Entrance Room) (.........c......)
...end
;---------------------------------------------------------------------------------------------------
..ice_entrance
%write8($7EF3CA, $40) ; LW/DW
...end
;---------------------------------------------------------------------------------------------------
..ice2
%write8($7EF36F, $00) ; Keys
%write8($7EF36E, $70) ; Magic Power
%writeroom($00E, $0001) ; Room $000E: Ice Palace (Entrance Room) (................)
...end
;---------------------------------------------------------------------------------------------------
..penguin_switch_room
%writeroom($00E, $8403) ; Room $000E: Ice Palace (Entrance Room) (.d....K........q)
%writeroom($01E, $0003) ; Room $001E: Ice Palace (Bomb Floor / Bari Room) (...............q)
%writeroom($02E, $0004) ; Room $002E: Ice Palace (Compass Room) (..............q.)
...end
;---------------------------------------------------------------------------------------------------
..bombable_floor
%writeroom($01F, $0002) ; Room $001F: Ice Palace (Pengator / Big Key Room) (...............q)
...end
;---------------------------------------------------------------------------------------------------
..conveyor_room
%write8($7EF343, $03) ; Bombs
%writeroom($01E, $0007) ; Room $001E: Ice Palace (Bomb Floor / Bari Room) (..............qq)
%writeroom($03E, $0004) ; Room $003E: Ice Palace (Stalfos Knights / Conveyor Hellway) (..............q.)
...end
;---------------------------------------------------------------------------------------------------
..ipbj
%writeroom($03E, $4407) ; Room $003E: Ice Palace (Stalfos Knights / Conveyor Hellway) (..d...K.......qq)
...end
;---------------------------------------------------------------------------------------------------
..penguin_room
%write8($7EF343, $02) ; Bombs
%writeroom($04E, $400C) ; Room $004E: Ice Palace (Bomb-Jump Room) (..d..........qq.)
...end
;---------------------------------------------------------------------------------------------------
..lonely_firebar
%write8($7EF343, $00) ; Bombs
%writeroom($05E, $0001) ; Room $005E: Ice Palace (Lonely Firebar) (................)
%writeroom($06E, $0004) ; Room $006E: Ice Palace (Pengators Room) (..............q.)
...end
;---------------------------------------------------------------------------------------------------
..last_two_screens
%writeroom($05E, $0003) ; Room $005E: Ice Palace (Lonely Firebar) (...............q)
%writeroom($07E, $0002) ; Room $007E: Ice Palace (Hidden Chest / Bombable Floor Room) (...............q)
%writeroom($09E, $0002) ; Room $009E: Ice Palace (Big Chest Room) (...............q)
...end
;---------------------------------------------------------------------------------------------------
..kholdstare
%write8($7EF36E, $80) ; Magic Power
%writeroom($09E, $0003) ; Room $009E: Ice Palace (Big Chest Room) (...............q)
%writeroom($0BE, $0001) ; Room $00BE: Ice Palace (Block Puzzle Room) (................)
%writeroom($0CE, $0004) ; Room $00CE: Ice Palace (Hole to Kholdstare Room) (..............q.)
...end
;---------------------------------------------------------------------------------------------------
.trock
;---------------------------------------------------------------------------------------------------
..outside_ice
%write8($7EF36F, $FF) ; Keys
%write8($7EF385, $00) ; Key for dungeon $09
%write8($7EF3F5, $00) ; Deaths
%write8($7EF37A, $77) ; Crystals
%writeroom($0DE, $0804) ; Room $00DE: Ice Palace (Kholdstare[Boss]) (.....k........q.)
...end
;---------------------------------------------------------------------------------------------------
..dm
%write8($7EF3CA, $00) ; LW/DW
...end
;---------------------------------------------------------------------------------------------------
..squirrels
%writeroom($0DF, $0003) ; Room $00DF: Cave (...............q)
%writeroom($0EF, $0003) ; Room $00EF: Cave (Crystal Switch / 5 Chests Room) (...............q)
...end
;---------------------------------------------------------------------------------------------------
..peg_puzzle
...end
;---------------------------------------------------------------------------------------------------
..entrance
%write8($7EF287, $20) ; Overworld $07: Unknown (...?....)
%write8($7EF2C7, $20) ; Overworld $47: Unknown (...?....)
%write8($7EF36E, $60) ; Magic Power
%write8($7EF3CA, $40) ; LW/DW
...end
;---------------------------------------------------------------------------------------------------
..torches
%write8($7EF343, $01) ; Bombs
%write8($7EF36F, $00) ; Keys
%write8($7EF36E, $70) ; Magic Power
%writeroom($0C6, $000F) ; Room $00C6: Turtle Rock (.............qqq)
%writeroom($0D6, $8005) ; Room $00D6: Turtle Rock (Entrance Room) (.d............q.)
...end
;---------------------------------------------------------------------------------------------------
..roller_room
%write8($7EF36D, $10) ; Health (actual)
%write8($7EF36E, $38) ; Magic Power
%writeroom($0C7, $000F) ; Room $00C7: Turtle Rock (Torch Puzzle) (.............qqq)
...end
;---------------------------------------------------------------------------------------------------
..pokey_0
%write8($7EF36D, $18) ; Health (actual)
%write8($7EF36E, $78) ; Magic Power
%writeroom($0C6, $800F) ; Room $00C6: Turtle Rock (.d...........qqq)
%writeroom($0B7, $002A) ; Room $00B7: Turtle Rock (Map Chest / Key Chest / Roller Room) (...........c.q.q)
...end
;---------------------------------------------------------------------------------------------------
..chomps
%write8($7EF36E, $68) ; Magic Power
%writeroom($0B6, $3402) ; Room $00B6: Turtle Rock (Chain Chomps Room) (...db.K........q)
...end
;---------------------------------------------------------------------------------------------------
..pokey_1
%write8($7EF36E, $58) ; Magic Power
%writeroom($014, $000F) ; Room $0014: Turtle Rock (Big Key Room) (.............qqq)
%writeroom($0B6, $B41A) ; Room $00B6: Turtle Rock (Chain Chomps Room) (.d.db.K.....qq.q)
%writeroom($015, $000F) ; Room $0015: Turtle Rock (.............qqq)
...end
;---------------------------------------------------------------------------------------------------
..pokeys_2
%write16sram($7EF366, $77B8) ; BigKey1
%write8($7EF36E, $80) ; Magic Power
%writeroom($014, $401F) ; Room $0014: Turtle Rock (Big Key Room) (..d.........qqqq)
%writeroom($013, $8405) ; Room $0013: Turtle Rock (Hokku-Bokku Key Room 2) (.d....K.......q.)
...end
;---------------------------------------------------------------------------------------------------
..crystal_roller
%write8($7EF36E, $60) ; Magic Power
%writeroom($014, $C01F) ; Room $0014: Turtle Rock (Big Key Room) (.dd.........qqqq)
%writeroom($024, $800C) ; Room $0024: Turtle Rock (Double Hokku-Bokku / Big chest Room) (.d...........qq.)
...end
;---------------------------------------------------------------------------------------------------
..dark_room
%writeroom($004, $C01A) ; Room $0004: Turtle Rock (Crysta-roller Room) (.dd.........qq.q)
...end
;---------------------------------------------------------------------------------------------------
..laser_skip
%write8($7EF36D, $10) ; Health (actual)
%write8($7EF36E, $58) ; Magic Power
%writeroom($0B5, $000F) ; Room $00B5: Turtle Rock (Dark Maze) (.............qqq)
%writeroom($0C5, $000A) ; Room $00C5: Turtle Rock (Laser Bridge) (.............q.q)
...end
;---------------------------------------------------------------------------------------------------
..switch_room
%writeroom($0C5, $800A) ; Room $00C5: Turtle Rock (Laser Bridge) (.d...........q.q)
%writeroom($0D5, $008A) ; Room $00D5: Turtle Rock (Laser Key Room) (.........c...q.q)
...end
;---------------------------------------------------------------------------------------------------
..trinexx
%write8($7EF36E, $80) ; Magic Power
%writeroom($0B4, $800F) ; Room $00B4: Turtle Rock (Pre-Trinexx Room) (.d...........qqq)
%writeroom($0C4, $800F) ; Room $00C4: Turtle Rock (Final Crystal Switch Puzzle Room) (.d...........qqq)
...end
;---------------------------------------------------------------------------------------------------
.gtower
;---------------------------------------------------------------------------------------------------
..outside_trock
%write8($7EF36F, $FF) ; Keys
%write8($7EF3C7, $08) ; Map Phase
%write8($7EF3FB, $00) ; Deaths
%write8($7EF36D, $18) ; Health (actual)
%write8($7EF37A, $7F) ; Crystals
%writeroom($0A4, $0802) ; Room $00A4: Turtle Rock (Trinexx[Boss]) (.....k.........q)
...end
;---------------------------------------------------------------------------------------------------
..entrance
%write8($7EF2C3, $20) ; Overworld $43: Unknown (...?....)
...end
;---------------------------------------------------------------------------------------------------
..spike_skip
%write8($7EF36F, $01) ; Keys
%writeroom($00C, $000F) ; Room $000C: Ganon's Tower (Entrance Room) (.............qqq)
%writeroom($08C, $0008) ; Room $008C: Ganon's Tower (East and West Downstairs / Big Chest Room) (.............q..)
%writeroom($08B, $0404) ; Room $008B: Ganon's Tower (Block Puzzle / Spike Skip / Map Chest Room) (......K.......q.)
...end
;---------------------------------------------------------------------------------------------------
..pre_firesnakes_room
%write8($7EF36E, $70) ; Magic Power
%writeroom($08B, $040E) ; Room $008B: Ganon's Tower (Block Puzzle / Spike Skip / Map Chest Room) (......K......qqq)
%writeroom($09B, $8408) ; Room $009B: Ganon's Tower (Many Spikes / Warp Maze Room) (.d....K......q..)
...end
;---------------------------------------------------------------------------------------------------
..bombable_floor
%write8($7EF377, $0D) ; Arrows
%writeroom($09C, $000F) ; Room $009C: Ganon's Tower (Invisible Floor Maze Room) (.............qqq)
%writeroom($07D, $201E) ; Room $007D: Ganon's Tower (Winder / Warp Maze Room) (...d........qqqq)
%writeroom($09B, $840F) ; Room $009B: Ganon's Tower (Many Spikes / Warp Maze Room) (.d....K......qqq)
...end
;---------------------------------------------------------------------------------------------------
..ice_armos
%write8($7EF377, $17) ; Arrows
%writeroom($01C, $0001) ; Room $001C: Ganon's Tower (Ice Armos) (................)
%writeroom($08C, $0089) ; Room $008C: Ganon's Tower (East and West Downstairs / Big Chest Room) (.........c...q..)
...end
;---------------------------------------------------------------------------------------------------
..floor_2
%write8($7EF377, $0F) ; Arrows
%write8($7EF389, $01) ; Key for dungeon $0D
%write16sram($7EF366, $77BC) ; BigKey1
%writeroom($01C, $0035) ; Room $001C: Ganon's Tower (Ice Armos) (...........cq.q.)
...end
;---------------------------------------------------------------------------------------------------
..mimics1
%write8($7EF36E, $80) ; Magic Power
%writeroom($06B, $000C) ; Room $006B: Ganon's Tower (Mimics Rooms) (.............qq.)
...end
;---------------------------------------------------------------------------------------------------
..mimics2
%write8($7EF377, $0B) ; Arrows
%writeroom($06B, $000E) ; Room $006B: Ganon's Tower (Mimics Rooms) (.............qqq)
...end
;---------------------------------------------------------------------------------------------------
..spike_room
%write8($7EF377, $07) ; Arrows
%writeroom($06B, $800F) ; Room $006B: Ganon's Tower (Mimics Rooms) (.d...........qqq)
...end
;---------------------------------------------------------------------------------------------------
..gauntlet
%writeroom($05C, $000C) ; Room $005C: Ganon's Tower (Ganon-Ball Z) (.............qq.)
%writeroom($05B, $8005) ; Room $005B: Ganon's Tower (Spike Pit Room) (.d............q.)
...end
;---------------------------------------------------------------------------------------------------
..gauntlet_3
%write8($7EF377, $05) ; Arrows
%writeroom($05D, $000C) ; Room $005D: Ganon's Tower (Gauntlet 1/2/3) (.............qq.)
...end
;---------------------------------------------------------------------------------------------------
..lanmola2
%write8($7EF377, $04) ; Arrows
%write8($7EF36E, $70) ; Magic Power
%writeroom($05D, $000E) ; Room $005D: Ganon's Tower (Gauntlet 1/2/3) (.............qqq)
%writeroom($06D, $000A) ; Room $006D: Ganon's Tower (Gauntlet 4/5) (.............q.q)
...end
;---------------------------------------------------------------------------------------------------
..wizz1
%write8($7EF36E, $20) ; Magic Power
%writeroom($06C, $000B) ; Room $006C: Ganon's Tower (Lanmolas Room) (.............q.q)
...end
;---------------------------------------------------------------------------------------------------
..wizz2
%write16sram($7EF360, $10) ; Rupees (actual)
%write8($7EF36E, $18) ; Magic Power
%writeroom($0A5, $000B) ; Room $00A5: Ganon's Tower (Wizzrobes Rooms) (.............q.q)
...end
;---------------------------------------------------------------------------------------------------
..torches1
%write8($7EF36E, $10) ; Magic Power
%writeroom($095, $0005) ; Room $0095: Ganon's Tower (Final Collapsing Bridge Room) (..............q.)
%writeroom($0A5, $000F) ; Room $00A5: Ganon's Tower (Wizzrobes Rooms) (.............qqq)
...end
;---------------------------------------------------------------------------------------------------
..torches2
%write8($7EF373, $1F) ; Magic filler
%write8($7EF36E, $65) ; Magic Power
%writeroom($096, $000B) ; Room $0096: Ganon's Tower (Torches 1 Room) (.............q.q)
...end
;---------------------------------------------------------------------------------------------------
..helma_key
%write8($7EF373, $00) ; Magic filler
%write8($7EF36E, $40) ; Magic Power
%writeroom($03D, $0001) ; Room $003D: Ganon's Tower (Torch Room 2) (................)
...end
;---------------------------------------------------------------------------------------------------
..bombable_wall
%write8($7EF36F, $00) ; Keys
%writeroom($03D, $4005) ; Room $003D: Ganon's Tower (Torch Room 2) (..d...........q.)
...end
;---------------------------------------------------------------------------------------------------
..moldorm_2
%write8($7EF343, $00) ; Bombs
%write8($7EF36E, $80) ; Magic Power
%writeroom($03D, $704F) ; Room $003D: Ganon's Tower (Torch Room 2) (..ddb.....c..qqq)
...end
;---------------------------------------------------------------------------------------------------
..agahnim_2
%writeroom($04C, $0005) ; Room $004C: Ganon's Tower (Mini-Helmasaur Conveyor Room) (..............q.)
%writeroom($01D, $800C) ; Room $001D: Ganon's Tower (Final Hallway) (.d...........qq.)
%writeroom($04D, $800F) ; Room $004D: Ganon's Tower (Moldorm Room) (.d...........qqq)
...end
;---------------------------------------------------------------------------------------------------
.ganon
;---------------------------------------------------------------------------------------------------
..pyramid
%write8($7EF2DB, $20) ; Overworld $5B: Unknown (...?....)
%write8($7EF36F, $FF) ; Keys
%write8($7EF389, $00) ; Key for dungeon $0D
%write8($7EF3FD, $00) ; Deaths
%writeroom($00D, $0802) ; Room $000D: Ganon's Tower (Agahnim2[Boss]) (.....k.........q)
...end
;---------------------------------------------------------------------------------------------------
.boss
;===================================================================================================
presetend_lownmg:
print "lownmg size: $", hex(presetend_lownmg-presetheader_lownmg)