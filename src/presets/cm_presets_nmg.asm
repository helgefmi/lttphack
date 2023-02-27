;===================================================================================================
; PRESET DATA HEADER
;===================================================================================================
presetheader_nmg:
	dw presetSRAM_nmg ; location of SRAM
	dw presetpersistent_nmg ; location of persistent data

;===================================================================================================
%menu_header("Any% NMG (NO SQ)", 15)
	%submenu("Escape", presetmenu_nmg_escape)
	%submenu("Eastern Palace", presetmenu_nmg_eastern)
	%submenu("Desert Palace", presetmenu_nmg_desert)
	%submenu("Tower of Hera", presetmenu_nmg_hera)
	%submenu("Agahnim's Tower", presetmenu_nmg_aga)
	%submenu("Palace of Darkness", presetmenu_nmg_pod)
	%submenu("Thieves' Town", presetmenu_nmg_thieves)
	%submenu("Skull Woods", presetmenu_nmg_skull)
	%submenu("Ice Palace", presetmenu_nmg_ice)
	%submenu("Swamp Palace", presetmenu_nmg_swamp)
	%submenu("Misery Mire", presetmenu_nmg_mire)
	%submenu("Turtle Rock", presetmenu_nmg_trock)
	%submenu("Ganon's Tower", presetmenu_nmg_gtower)
	%submenu("Ganon", presetmenu_nmg_ganon)
	%submenu("Bosses", presetmenu_nmg_boss)

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; HYRULE CASTLE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_nmg_escape:
%menu_header("Escape", 14)

;---------------------------------------------------------------------------------------------------
%preset_UW("Link's Bed", "nmg", "escape", "bed")
dw $0104 ; Screen ID
dw $0940, $215A ; Link Coords
dw $0900, $2110 ; Camera HV
db $00 ; Item
db $02 ; Link direction
;-----------------------------
db $00 ; Entrance
db $20 ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Courtyard", "nmg", "escape", "courtyard")
dw $0055 ; Screen ID
dw $0A78, $0BC6 ; Link Coords
dw $0A00, $0B10 ; Camera HV
db $00 ; Item
db $02 ; Link direction
;-----------------------------
db $7D ; Entrance
db $AF ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "nmg", "escape", "entrance")
dw $001B ; Screen ID
dw $07F9, $0709 ; Link Coords
dw $0785, $06AB ; Camera HV
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $0804, $0718 ; Scroll X,Y
dw $05B2 ; Tilemap position
;dw $0005 ; Scroll mod Y
;dw $0009 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("1st Key Guard", "nmg", "escape", "1st_keyguard")
dw $0001 ; Screen ID
dw $02F8, $0062 ; Link Coords
dw $0280, $0000 ; Camera HV
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $04 ; Entrance
db $80 ; Room layout / Floor
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Stealth Room", "nmg", "escape", "stealth_room")
dw $0082 ; Screen ID
dw $040B, $1178 ; Link Coords
dw $0400, $110B ; Camera HV
db $00 ; Item
db $04 ; Link direction
;-----------------------------
db $04 ; Entrance
db $EF ; Room layout / Floor
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE064, $0001) ; Room $72 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("2nd Key Guard", "nmg", "escape", "2nd_keyguard")
dw $0071 ; Screen ID
dw $02AD, $0F78 ; Link Coords
dw $0200, $0F0B ; Camera HV
db $00 ; Item
db $06 ; Link direction
;-----------------------------
db $04 ; Entrance
db $2F ; Room layout / Floor
db $8C ; Door / Peg state / Layer
dw $0001 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Ball 'n Chains", "nmg", "escape", "ball_n_chains")
dw $0070 ; Screen ID
dw $0050, $0E2D ; Link Coords
dw $0000, $0E00 ; Camera HV
db $02 ; Item
db $00 ; Link direction
;-----------------------------
db $04 ; Entrance
db $0E ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE062, $0003) ; Room $71 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Backtracking", "nmg", "escape", "backtracking")
dw $0080 ; Screen ID
dw $0050, $1026 ; Link Coords
dw $0000, $1000 ; Camera HV
db $02 ; Item
db $00 ; Link direction
;-----------------------------
db $04 ; Entrance
db $8D ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0004 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE062, $0003) ; Room $71 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Key Guard Revisited", "nmg", "escape", "keyguard_revisited")
dw $0072 ; Screen ID
dw $04F8, $0F2D ; Link Coords
dw $0480, $0F00 ; Camera HV
db $02 ; Item
db $00 ; Link direction
;-----------------------------
db $04 ; Entrance
db $AF ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Throne Room", "nmg", "escape", "throne_room")
dw $0051 ; Screen ID
dw $02F8, $0A8E ; Link Coords
dw $0280, $0A21 ; Camera HV
db $02 ; Item
db $00 ; Link direction
;-----------------------------
db $04 ; Entrance
db $C1 ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Snake Avoidance Room", "nmg", "escape", "snake_avoidance_room")
dw $0041 ; Screen ID
dw $03A8, $082D ; Link Coords
dw $0300, $0800 ; Camera HV
db $02 ; Item
db $00 ; Link direction
;-----------------------------
db $04 ; Entrance
db $D1 ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Sewer Rooms", "nmg", "escape", "water_rooms")
dw $0032 ; Screen ID
dw $04F8, $061F ; Link Coords
dw $0480, $0600 ; Camera HV
db $02 ; Item
db $00 ; Link direction
;-----------------------------
db $04 ; Entrance
db $CF ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Key Rat", "nmg", "escape", "keyrat")
dw $0021 ; Screen ID
dw $02F8, $052D ; Link Coords
dw $0280, $0500 ; Camera HV
db $02 ; Item
db $00 ; Link direction
;-----------------------------
db $04 ; Entrance
db $AF ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Into Sanctuary", "nmg", "escape", "into_sanctuary")
dw $0011 ; Screen ID
dw $0378, $022D ; Link Coords
dw $0300, $0200 ; Camera HV
db $02 ; Item
db $00 ; Link direction
;-----------------------------
db $04 ; Entrance
db $5F ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FDFC2, $0001) ; Room $21 sprite deaths
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; EASTERN
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_nmg_eastern:
%menu_header("Eastern Palace", 15)

;---------------------------------------------------------------------------------------------------
%preset_UW("Before Cutscene", "nmg", "eastern", "before_cutscene")
dw $0002 ; Screen ID
dw $04F8, $01B8 ; Link Coords
dw $0480, $0110 ; Camera HV
db $02 ; Item
db $02 ; Link direction
;-----------------------------
db $04 ; Entrance
db $A0 ; Room layout / Floor
db $8D ; Door / Peg state / Layer
dw $000A ; Dead sprites
;-----------------------------
%write8_enable()
%write8($7E0642, $01) ; Room puzzle state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("After Cutscene", "nmg", "eastern", "after_cutscene")
dw $0012 ; Screen ID
dw $04F8, $027A ; Link Coords
dw $0480, $020D ; Camera HV
db $02 ; Item
db $02 ; Link direction
;-----------------------------
db $04 ; Entrance
db $C0 ; Room layout / Floor
db $08 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Octorok OW", "nmg", "eastern", "octorok")
dw $001D ; Screen ID
dw $0B10, $07DC ; Link Coords
dw $0A9E, $071E ; Camera HV
db $02 ; Item
db $02 ; Link direction
;-----------------------------
dw $0B1B, $078B ; Scroll X,Y
dw $0894 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $0002 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("EP Overworld", "nmg", "eastern", "outside_palace")
dw $002E ; Screen ID
dw $0C70, $0A08 ; Link Coords
dw $0C00, $0A00 ; Camera HV
db $02 ; Item
db $00 ; Link direction
;-----------------------------
dw $0C7D, $0A6D ; Scroll X,Y
dw $0000 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $0000 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "nmg", "eastern", "entrance")
dw $001E ; Screen ID
dw $0F50, $0637 ; Link Coords
dw $0EDE, $0600 ; Camera HV
db $02 ; Item
db $00 ; Link direction
;-----------------------------
dw $0F5B, $066F ; Scroll X,Y
dw $005A ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $FFF2 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Stalfos Room", "nmg", "eastern", "stalfos_room")
dw $00A8 ; Screen ID
dw $1128, $1577 ; Link Coords
dw $1100, $150A ; Camera HV
db $02 ; Item
db $04 ; Link direction
;-----------------------------
db $08 ; Entrance
db $70 ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Big Chest Room 1", "nmg", "eastern", "big_chest_room_1")
dw $00A8 ; Screen ID
dw $11C6, $1478 ; Link Coords
dw $1100, $140B ; Camera HV
db $02 ; Item
db $06 ; Link direction
;-----------------------------
db $08 ; Entrance
db $50 ; Room layout / Floor
db $0E ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Dark Key Room", "nmg", "eastern", "dark_key_room")
dw $00BA ; Screen ID
dw $14CA, $1678 ; Link Coords
dw $1400, $160B ; Camera HV
db $02 ; Item
db $06 ; Link direction
;-----------------------------
db $08 ; Entrance
db $00 ; Room layout / Floor
db $82 ; Door / Peg state / Layer
dw $0010 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Big Key Damage Boost", "nmg", "eastern", "big_key_dmg_boost")
dw $00B9 ; Screen ID
dw $1225, $1678 ; Link Coords
dw $1200, $160B ; Camera HV
db $02 ; Item
db $04 ; Link direction
;-----------------------------
db $08 ; Entrance
db $C0 ; Room layout / Floor
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE0F4, $0050) ; Room $BA sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Big Chest Room 2", "nmg", "eastern", "big_chest_room_2")
dw $00A8 ; Screen ID
dw $11B2, $1478 ; Link Coords
dw $1100, $140B ; Camera HV
db $02 ; Item
db $06 ; Link direction
;-----------------------------
db $08 ; Entrance
db $50 ; Room layout / Floor
db $0E ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Gifted with Greenies", "nmg", "eastern", "gwg")
dw $00A9 ; Screen ID
dw $12F8, $142B ; Link Coords
dw $1280, $1400 ; Camera HV
db $03 ; Item
db $00 ; Link direction
;-----------------------------
db $08 ; Entrance
db $C0 ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pot Room", "nmg", "eastern", "pot_room")
dw $0099 ; Screen ID
dw $1278, $132D ; Link Coords
dw $1200, $1300 ; Camera HV
db $03 ; Item
db $00 ; Link direction
;-----------------------------
db $08 ; Entrance
db $A0 ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $00D8 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Zeldagamer Room", "nmg", "eastern", "zeldagamer_room")
dw $00D9 ; Screen ID
dw $1228, $1B78 ; Link Coords
dw $1200, $1B0B ; Camera HV
db $03 ; Item
db $04 ; Link direction
;-----------------------------
db $08 ; Entrance
db $21 ; Room layout / Floor
db $80 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Double Reddies", "nmg", "eastern", "double_reddies")
dw $00D8 ; Screen ID
dw $1178, $1B31 ; Link Coords
dw $1100, $1B00 ; Camera HV
db $03 ; Item
db $06 ; Direction
;-----------------------------
db $08 ; Entrance
db $31 ; Room layout
db $80 ; Door / Peg state / Layer
dw $0700 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Armos", "nmg", "eastern", "armos")
dw $00D8 ; Screen ID
dw $1178, $1A30 ; Link Coords
dw $1100, $1A00 ; Camera HV
db $03 ; Item
db $00 ; Link direction
;-----------------------------
db $08 ; Entrance
db $11 ; Room layout / Floor
db $80 ; Door / Peg state / Layer
dw $07FF ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; DESERT
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_nmg_desert:
%menu_header("Desert Palace", 14)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Eastern Palace", "nmg", "desert", "outside_eastern_palace")
dw $001E ; Screen ID
dw $0F50, $0638 ; Link Coords
dw $0ED6, $0600 ; Camera HV
db $03 ; Item
db $02 ; Link direction
;-----------------------------
dw $0F5B, $066D ; Scroll X,Y
dw $005A ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $FFFA ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Eastern Palace Spinspeed", "nmg", "desert", "ep_spinspeed")
dw $0105 ; Screen ID
dw $0A78, $21C2 ; Link Coords
dw $0A00, $2110 ; Camera HV
db $03 ; Item
db $02 ; Link direction
;-----------------------------
db $45 ; Entrance
db $20 ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write8_enable()
%write8($7EC167, $05) ; Underworld exit cache
%write8($7EC165, $20) ; Underworld exit cache
%write8($7EC166, $25) ; Underworld exit cache
%write16_enable()
%write16($7EC140, $001E) ; Underworld exit cache
%write16($7EC142, $0016) ; Underworld exit cache
%write16($7EC144, $06D7) ; Underworld exit cache
%write16($7EC146, $0C76) ; Underworld exit cache
%write16($7EC148, $0736) ; Underworld exit cache
%write16($7EC14A, $0CF0) ; Underworld exit cache
%write16($7EC14C, $001E) ; Underworld exit cache
%write16($7EC14E, $0710) ; Underworld exit cache
%write16($7EC150, $0744) ; Underworld exit cache
%write16($7EC152, $0CFB) ; Underworld exit cache
%write16($7EC154, $0600) ; Underworld exit cache
%write16($7EC156, $091E) ; Underworld exit cache
%write16($7EC158, $0C00) ; Underworld exit cache
%write16($7EC15A, $0F00) ; Underworld exit cache
%write16($7EC15C, $0520) ; Underworld exit cache
%write16($7EC15E, $0A00) ; Underworld exit cache
%write16($7EC160, $0B00) ; Underworld exit cache
%write16($7EC162, $1000) ; Underworld exit cache
%write16($7EC16A, $0009) ; Underworld exit cache
%write16($7EC16C, $FFF7) ; Underworld exit cache
%write16($7EC16E, $000A) ; Underworld exit cache
%write16($7EC170, $FFF6) ; Underworld exit cache
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Bridge Screen", "nmg", "desert", "bridge_screen")
dw $002E ; Screen ID
dw $0C13, $0A69 ; Link Coords
dw $0C00, $0A0B ; Camera HV
db $03 ; Item
db $04 ; Link direction
;-----------------------------
dw $0C85, $0A78 ; Scroll X,Y
dw $0000 ; Tilemap position
;dw $FFF5 ; Scroll mod Y
;dw $0000 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Unholy Spinspeed", "nmg", "desert", "unholy_spinspeed")
dw $002A ; Screen ID
dw $0407, $0B9A ; Link Coords
dw $0400, $0B1E ; Camera HV
db $03 ; Item
db $00 ; Link direction
;-----------------------------
dw $0485, $0B8D ; Scroll X,Y
dw $0900 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $0000 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Water Dash", "nmg", "desert", "water_dash")
dw $002C ; Screen ID
dw $08D2, $0BE2 ; Link Coords
dw $0860, $0B1E ; Camera HV
db $03 ; Item
db $02 ; Link direction
;-----------------------------
dw $08DD, $0B8D ; Scroll X,Y
dw $090C ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $0000 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Desert Palace", "nmg", "desert", "outside_desert_palace")
dw $003A ; Screen ID
dw $040E, $0F88 ; Link Coords
dw $0400, $0F1E ; Camera HV
db $03 ; Item
db $04 ; Link direction
;-----------------------------
dw $0485, $0F8B ; Scroll X,Y
dw $0880 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $0000 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "nmg", "desert", "desert_entrance")
dw $0030 ; Screen ID
dw $0128, $0CBA ; Link Coords
dw $00AA, $0C5B ; Camera HV
db $0C ; Item
db $00 ; Link direction
;-----------------------------
dw $012F, $0CC3 ; Scroll X,Y
dw $0294 ; Tilemap position
;dw $0008 ; Scroll mod Y
;dw $FFF6 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Key Bonk", "nmg", "desert", "keybonk")
dw $0073 ; Screen ID
dw $0778, $0F22 ; Link Coords
dw $0700, $0F00 ; Camera HV
db $0C ; Item
db $00 ; Link direction
;-----------------------------
db $09 ; Entrance
db $3F ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE068, $0001) ; Room $74 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pre Cannonball Room", "nmg", "desert", "pre_cannonball_room")
dw $0085 ; Screen ID
dw $0ACB, $1078 ; Link Coords
dw $0A00, $100B ; Camera HV
db $0C ; Item
db $06 ; Link direction
;-----------------------------
db $09 ; Entrance
db $4F ; Room layout / Floor
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F()
%write8($7F23DC, $00) ; Bastard door
%write8($7F23E3, $00)
%write8($7F249C, $00)
%write8($7F24A3, $00)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pot Room", "nmg", "desert", "pot_room")
dw $0073 ; Screen ID
dw $0725, $0F78 ; Link Coords
dw $0700, $0F0B ; Camera HV
db $0C ; Item
db $04 ; Link direction
;-----------------------------
db $09 ; Entrance
db $3F ; Room layout / Floor
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE08A, $001C) ; Room $85 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Desert 2 Spinspeed", "nmg", "desert", "desert2_spinspeed")
dw $0083 ; Screen ID
dw $0678, $11C3 ; Link Coords
dw $0600, $1110 ; Camera HV
db $0C ; Item
db $02 ; Link direction
;-----------------------------
db $09 ; Entrance
db $2F ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Popo Genocide", "nmg", "desert", "popo_genocide_room")
dw $0053 ; Screen ID
dw $0678, $0AC6 ; Link Coords
dw $0600, $0A10 ; Camera HV
db $0C ; Item
db $02 ; Link direction
;-----------------------------
db $09 ; Entrance
db $01 ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Torches", "nmg", "desert", "torches")
dw $0043 ; Screen ID
dw $0778, $092E ; Link Coords
dw $0700, $0900 ; Camera HV
db $09 ; Item
db $00 ; Link direction
;-----------------------------
db $0C ; Entrance
db $31 ; Room layout / Floor
db $0D ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE026, $06E0) ; Room $53 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Lanmolas", "nmg", "desert", "lanmolas")
dw $0043 ; Screen ID
dw $0678, $082E ; Link Coords
dw $0600, $0800 ; Camera HV
db $09 ; Item
db $00 ; Link direction
;-----------------------------
db $0C ; Entrance
db $81 ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; HERA
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_nmg_hera:
%menu_header("Tower of Hera", 12)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Desert Palace", "nmg", "hera", "outside_desert_palace")
dw $0030 ; Screen ID
dw $0128, $0C41 ; Link Coords
dw $00A2, $0C00 ; Camera HV
db $03 ; Item
db $02 ; Link direction
;-----------------------------
dw $012F, $0C6D ; Scroll X,Y
dw $0016 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $000E ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Fake Flippers", "nmg", "hera", "fake_flippers")
dw $003C ; Screen ID
dw $09E0, $0F7C ; Link Coords
dw $0900, $0F1E ; Camera HV
db $03 ; Item
db $06 ; Link direction
;-----------------------------
dw $097D, $0F8B ; Scroll X,Y
dw $0820 ; Tilemap position
;dw $FFF2 ; Scroll mod Y
;dw $0000 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Death Mountain", "nmg", "hera", "dm")
dw $00F1 ; Screen ID
dw $0378, $1FC1 ; Link Coords
dw $0300, $1F10 ; Camera HV
db $03 ; Item
db $02 ; Link direction
;-----------------------------
db $06 ; Entrance
db $F0 ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("After Mirror", "nmg", "hera", "after_mirror")
dw $0003 ; Screen ID
dw $071E, $03C0 ; Link Coords
dw $06AA, $031E ; Camera HV
db $03 ; Item
db $06 ; Link direction
;-----------------------------
dw $0729, $038D ; Scroll X,Y
dw $1816 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $FFF6 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Quickhop", "nmg", "hera", "quickhop")
dw $0003 ; Screen ID
dw $081B, $0138 ; Link Coords
dw $07A5, $00D4 ; Camera HV
db $14 ; Item
db $04 ; Link direction
;-----------------------------
dw $0824, $0143 ; Scroll X,Y
dw $0638 ; Tilemap position
;dw $000A ; Scroll mod Y
;dw $000B ; Scroll mod X
;-----------------------------
%write8_enable()
%write8($7E031F, $90) ; iframes from mirror
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "nmg", "hera", "entrance")
dw $0003 ; Screen ID
dw $08F0, $0085 ; Link Coords
dw $087C, $0021 ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
dw $08FB, $0090 ; Scroll X,Y
dw $00D0 ; Tilemap position
;dw $000D ; Scroll mod Y
;dw $FFF4 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Tile room", "nmg", "hera", "tile_room")
dw $0077 ; Screen ID
dw $0E78, $0E45 ; Link Coords
dw $0E00, $0E00 ; Camera HV
db $02 ; Item
db $00 ; Link direction
;-----------------------------
db $33 ; Entrance
db $C1 ; Room layout / Floor
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Torches", "nmg", "hera", "torches")
dw $0087 ; Screen ID
dw $0F78, $10BC ; Link Coords
dw $0F00, $1010 ; Camera HV
db $02 ; Item
db $02 ; Link direction
;-----------------------------
db $33 ; Entrance
db $10 ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Beetles", "nmg", "hera", "beetles")
dw $0077 ; Screen ID
dw $0F68, $0F4E ; Link Coords
dw $0EF0, $0EE2 ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $33 ; Entrance
db $F1 ; Room layout / Floor
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Petting Zoo", "nmg", "hera", "petting_zoo")
dw $0031 ; Screen ID
dw $03B8, $067C ; Link Coords
dw $0300, $060F ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $33 ; Entrance
db $92 ; Room layout / Floor
db $40 ; Door / Peg state / Layer
dw $0580 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Bumper Skip", "nmg", "hera", "bumper_skip")
dw $0027 ; Screen ID
dw $0E38, $0471 ; Link Coords
dw $0E00, $0404 ; Camera HV
db $03 ; Item
db $00 ; Direction
;-----------------------------
db $33 ; Entrance
db $C3 ; Room layout / Floor
db $40 ; Door / Peg state / Layer
dw $0064 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Moldorm", "nmg", "hera", "moldorm")
dw $0017 ; Screen ID
dw $0FA8, $027A ; Link Coords
dw $0F00, $020D ; Camera HV
db $03 ; Item
db $00 ; Link direction
;-----------------------------
db $33 ; Entrance
db $D4 ; Room layout / Floor
db $40 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FDFCE, $0024) ; Room $27 sprite deaths
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; AGAHNIM'S TOWER
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_nmg_aga:
%menu_header("Agahnim's Tower", 14)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Hera", "nmg", "aga", "outside_hera")
dw $0003 ; Screen ID
dw $08F0, $007C ; Link Coords
dw $087C, $0018 ; Camera HV
db $03 ; Item
db $02 ; Link direction
;-----------------------------
dw $08FB, $0087 ; Scroll X,Y
dw $0050 ; Tilemap position
;dw $0006 ; Scroll mod Y
;dw $FFF4 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("First Rupee Tree", "nmg", "aga", "first_rupee_tree")
dw $00E6 ; Screen ID
dw $0C78, $1DB8 ; Link Coords
dw $0C00, $1D10 ; Camera HV
db $03 ; Item
db $02 ; Link direction
;-----------------------------
db $2F ; Entrance
db $E0 ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE14E, $0008) ; Room $E7 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Lost Woods", "nmg", "aga", "lost_woods")
dw $0002 ; Screen ID
dw $0406, $007A ; Link Coords
dw $0400, $0016 ; Camera HV
db $03 ; Item
db $04 ; Link direction
;-----------------------------
dw $048D, $0085 ; Scroll X,Y
dw $0100 ; Tilemap position
;dw $0008 ; Scroll mod Y
;dw $0000 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("After Grove", "nmg", "aga", "after_grove")
dw $0000 ; Screen ID
dw $00A0, $00CB ; Link Coords
dw $0022, $006B ; Camera HV
db $03 ; Item
db $02 ; Link direction
;-----------------------------
dw $00A7, $00DA ; Scroll X,Y
dw $0306 ; Tilemap position
;dw $FFF3 ; Scroll mod Y
;dw $000E ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("After Lost Woods", "nmg", "aga", "after_lost_woods")
dw $0000 ; Screen ID
dw $0388, $03D0 ; Link Coords
dw $0300, $031E ; Camera HV
db $03 ; Item
db $02 ; Link direction
;-----------------------------
dw $0385, $038D ; Scroll X,Y
dw $1860 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $0000 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Castle Screen", "nmg", "aga", "castle_screen")
dw $001A ; Screen ID
dw $05E5, $0728 ; Link Coords
dw $0500, $06CA ; Camera HV
db $03 ; Item
db $06 ; Link direction
;-----------------------------
dw $057D, $0737 ; Scroll X,Y
dw $0620 ; Tilemap position
;dw $FFF6 ; Scroll mod Y
;dw $0000 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "nmg", "aga", "entrance")
dw $001B ; Screen ID
dw $07F8, $065C ; Link Coords
dw $077E, $0600 ; Camera HV
db $03 ; Item
db $00 ; Link direction
;-----------------------------
dw $0803, $066D ; Scroll X,Y
dw $002E ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $FFF2 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Prize Pack Guards", "nmg", "aga", "prize_pack_guards")
dw $00E0 ; Screen ID
dw $00DA, $1C78 ; Link Coords
dw $0000, $1C0B ; Camera HV
db $03 ; Item
db $06 ; Link direction
;-----------------------------
db $24 ; Entrance
db $01 ; Room layout / Floor
db $82 ; Door / Peg state / Layer
dw $0003 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Dark Room of Despair", "nmg", "aga", "dark_room_of_despair")
dw $00D0 ; Screen ID
dw $010A, $1A78 ; Link Coords
dw $0100, $1A0B ; Camera HV
db $03 ; Item
db $04 ; Link direction
;-----------------------------
db $24 ; Entrance
db $12 ; Room layout / Floor
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE140, $000F) ; Room $E0 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Dark Room of Melancholy", "nmg", "aga", "dark_room_of_melancholy")
dw $00C0 ; Screen ID
dw $0125, $1978 ; Link Coords
dw $0100, $190B ; Camera HV
db $03 ; Item
db $04 ; Link direction
;-----------------------------
db $24 ; Entrance
db $33 ; Room layout / Floor
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE120, $0020) ; Room $D0 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spear Guards", "nmg", "aga", "spear_guards")
dw $00C0 ; Screen ID
dw $0178, $182C ; Link Coords
dw $0100, $1800 ; Camera HV
db $03 ; Item
db $00 ; Link direction
;-----------------------------
db $24 ; Entrance
db $13 ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0018 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Circle of Pots", "nmg", "aga", "circle_of_pots")
dw $00B0 ; Screen ID
dw $0078, $16C4 ; Link Coords
dw $0000, $1610 ; Camera HV
db $03 ; Item
db $02 ; Link direction
;-----------------------------
db $24 ; Entrance
db $04 ; Room layout / Floor
db $81 ; Door / Peg state / Layer
dw $003F ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Catwalk", "nmg", "aga", "catwalk")
dw $0040 ; Screen ID
dw $012C, $0978 ; Link Coords
dw $0100, $090B ; Camera HV
db $02 ; Item
db $04 ; Link direction
;-----------------------------
db $24 ; Entrance
db $35 ; Room layout / Floor
db $0E ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE0E0, $043F) ; Room $B0 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Agahnim", "nmg", "aga", "agahnim")
dw $0030 ; Screen ID
dw $0078, $062D ; Link Coords
dw $0000, $0600 ; Camera HV
db $02 ; Item
db $00 ; Link direction
;-----------------------------
db $24 ; Entrance
db $06 ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0001 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; PALACE OF DARKNESS
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_nmg_pod:
%menu_header("Palace of Darkness", 14)

;---------------------------------------------------------------------------------------------------
%preset_OW("Pyramid", "nmg", "pod", "pyramid")
dw $005B ; Screen ID
dw $07F0, $0660 ; Link Coords
dw $0778, $0602 ; Camera HV
db $02 ; Item
db $02 ; Link direction
;-----------------------------
dw $07F7, $066F ; Scroll X,Y
dw $002E ; Tilemap position
;dw $FFFE ; Scroll mod Y
;dw $FFF8 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Palace Overworld Screen", "nmg", "pod", "pod_overworld")
dw $006E ; Screen ID
dw $0C70, $0A0C ; Link Coords
dw $0C00, $0A00 ; Camera HV
db $02 ; Item
db $00 ; Link direction
;-----------------------------
dw $0C7D, $0A6D ; Scroll X,Y
dw $0000 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $0000 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "nmg", "pod", "entrance")
dw $005E ; Screen ID
dw $0F50, $064C ; Link Coords
dw $0EDE, $0600 ; Camera HV
db $02 ; Item
db $00 ; Link direction
;-----------------------------
dw $0F5B, $066F ; Scroll X,Y
dw $005A ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $FFF2 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Main Hub (Small Key)", "nmg", "pod", "main_hub_small_key")
dw $004A ; Screen ID
dw $14F8, $081B ; Link Coords
dw $1480, $0800 ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $26 ; Entrance
db $80 ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Main Hub (Big Key)", "nmg", "pod", "main_hub_bk")
dw $004A ; Screen ID
dw $14F8, $081A ; Link Coords
dw $1480, $0800 ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $26 ; Entrance
db $80 ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Main Hub (Hammerjump)", "nmg", "pod", "main_hub_hammeryump")
dw $004A ; Screen ID
dw $14F8, $0818 ; Link Coords
dw $1480, $0800 ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $26 ; Entrance
db $80 ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Hammerjump", "nmg", "pod", "hammeryump")
dw $002A ; Screen ID
dw $1478, $0424 ; Link Coords
dw $1400, $0400 ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $26 ; Entrance
db $C0 ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pre Sexy Statue", "nmg", "pod", "before_sexy_statue")
dw $003A ; Screen ID
dw $1578, $062C ; Link Coords
dw $1500, $0600 ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $26 ; Entrance
db $D0 ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Sexy Statue Room", "nmg", "pod", "sexy_statue_room")
dw $002A ; Screen ID
dw $15B4, $04F8 ; Link Coords
dw $1500, $048B ; Camera HV
db $03 ; Item
db $06 ; Link direction
;-----------------------------
db $26 ; Entrance
db $D0 ; Room layout / Floor
db $42 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mimics", "nmg", "pod", "mimics")
dw $002B ; Screen ID
dw $1678, $0413 ; Link Coords
dw $1600, $0400 ; Camera HV
db $03 ; Item
db $00 ; Link direction
;-----------------------------
db $26 ; Entrance
db $40 ; Room layout / Floor
db $C1 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write8_enable()
%write8($7E0642, $01) ; Room puzzle state (?)
%write8($7E0646, $01) ; hold switch
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Statue", "nmg", "pod", "statue")
dw $001B ; Screen ID
dw $1678, $0320 ; Link Coords
dw $1600, $0300 ; Camera HV
db $03 ; Item
db $00 ; Link direction
;-----------------------------
db $26 ; Entrance
db $20 ; Room layout / Floor
db $CD ; Door / Peg state / Layer
dw $0038 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Basement", "nmg", "pod", "basement")
dw $001B ; Screen ID
dw $1790, $0251 ; Link Coords
dw $1700, $0200 ; Camera HV
db $04 ; Item
db $02 ; Link direction
;-----------------------------
db $26 ; Entrance
db $90 ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Turtle Room", "nmg", "pod", "turtle_room")
dw $000B ; Screen ID
dw $1678, $00C8 ; Link Coords
dw $1600, $0010 ; Camera HV
db $04 ; Item
db $02 ; Link direction
;-----------------------------
db $26 ; Entrance
db $0F ; Room layout / Floor
db $C1 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Helmasaur", "nmg", "pod", "helma")
dw $006A ; Screen ID
dw $1578, $0C24 ; Link Coords
dw $1500, $0C00 ; Camera HV
db $04 ; Item
db $00 ; Link direction
;-----------------------------
db $26 ; Entrance
db $5F ; Room layout / Floor
db $41 ; Door / Peg state / Layer
dw $0010 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; THIEVES' TOWN
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_nmg_thieves:
%menu_header("Thieves' Town", 18)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside PoD", "nmg", "thieves", "outside_pod")
dw $005E ; Screen ID
dw $0F50, $063E ; Link Coords
dw $0ED6, $0600 ; Camera HV
db $04 ; Item
db $02 ; Link direction
;-----------------------------
dw $0F5B, $066D ; Scroll X,Y
dw $005A ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $FFFA ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Overworld Hammerdash", "nmg", "thieves", "ow_hammerdash")
dw $006E ; Screen ID
dw $0C06, $0A6A ; Link Coords
dw $0C00, $0A0C ; Camera HV
db $04 ; Item
db $04 ; Link direction
;-----------------------------
dw $0C85, $0A79 ; Scroll X,Y
dw $0000 ; Tilemap position
;dw $FFF4 ; Scroll mod Y
;dw $0000 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Grove", "nmg", "thieves", "grove")
dw $0072 ; Screen ID
dw $04DA, $0C0C ; Link Coords
dw $045C, $0C00 ; Camera HV
db $04 ; Item
db $00 ; Link direction
;-----------------------------
dw $04E1, $0C6D ; Scroll X,Y
dw $000C ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $0004 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Usain Bolt", "nmg", "thieves", "usain_bolt")
dw $002A ; Screen ID
dw $0407, $0B99 ; Link Coords
dw $0400, $0B1E ; Camera HV
db $08 ; Item
db $00 ; Link direction
;-----------------------------
dw $0485, $0B8D ; Scroll X,Y
dw $0900 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $0000 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("After Activating Flute", "nmg", "thieves", "after_activating_flute")
dw $0018 ; Screen ID
dw $01CA, $0798 ; Link Coords
dw $014C, $0734 ; Camera HV
db $08 ; Item
db $04 ; Link direction
;-----------------------------
dw $01D1, $07A3 ; Scroll X,Y
dw $092A ; Tilemap position
;dw $000A ; Scroll mod Y
;dw $0004 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("After Warp", "nmg", "thieves", "darkworld")
dw $0050 ; Screen ID
dw $0161, $0553 ; Link Coords
dw $00E3, $04F5 ; Camera HV
db $04 ; Item
db $04 ; Link direction
;-----------------------------
dw $0168, $0562 ; Scroll X,Y
dw $079E ; Tilemap position
;dw $FFFB ; Scroll mod Y
;dw $000D ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "nmg", "thieves", "entrance")
dw $0058 ; Screen ID
dw $01F8, $07C2 ; Link Coords
dw $017E, $0764 ; Camera HV
db $04 ; Item
db $00 ; Link direction
;-----------------------------
dw $0203, $07D1 ; Scroll X,Y
dw $0BAE ; Tilemap position
;dw $000C ; Scroll mod Y
;dw $FFF2 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("After Big Key", "nmg", "thieves", "after_big_key")
dw $00DB ; Screen ID
dw $17BA, $1B68 ; Link Coords
dw $1700, $1AFB ; Camera HV
db $04 ; Item
db $06 ; Link direction
;-----------------------------
db $34 ; Entrance
db $FF ; Room layout / Floor
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Stalfos Hallway", "nmg", "thieves", "blind_hallway")
dw $00CC ; Screen ID
dw $1978, $181D ; Link Coords
dw $1900, $1800 ; Camera HV
db $04 ; Item
db $00 ; Link direction
;-----------------------------
db $34 ; Entrance
db $DF ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE138, $0080) ; Room $DC sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Conveyor Gibos", "nmg", "thieves", "conveyor_gibos")
dw $00BC ; Screen ID
dw $181D, $1778 ; Link Coords
dw $1800, $170B ; Camera HV
db $04 ; Item
db $04 ; Link direction
;-----------------------------
db $34 ; Entrance
db $2F ; Room layout / Floor
db $02 ; Door / Peg state / Layer
dw $0340 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Hellway", "nmg", "thieves", "hellway")
dw $00BB ; Screen ID
dw $1716, $1778 ; Link Coords
dw $1700, $170B ; Camera HV
db $01 ; Item
db $04 ; Link direction
;-----------------------------
db $34 ; Entrance
db $3F ; Room layout / Floor
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write8_enable()
%write8($7E0ABD, $01) ; Palette swap
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Bombable Floor", "nmg", "thieves", "bombable_floor")
dw $0065 ; Screen ID
dw $0AE7, $0D78 ; Link Coords
dw $0A00, $0D0B ; Camera HV
db $01 ; Item
db $06 ; Link direction
;-----------------------------
db $34 ; Entrance
db $20 ; Room layout / Floor
db $42 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Backtracking", "nmg", "thieves", "backtracking_1")
dw $0064 ; Screen ID
dw $0878, $0D28 ; Link Coords
dw $0800, $0D00 ; Camera HV
db $01 ; Item
db $00 ; Link direction
;-----------------------------
db $34 ; Entrance
db $20 ; Room layout / Floor
db $40 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Basement", "nmg", "thieves", "basement")
dw $00BC ; Screen ID
dw $1878, $162A ; Link Coords
dw $1800, $1600 ; Camera HV
db $01 ; Item
db $00 ; Link direction
;-----------------------------
db $34 ; Entrance
db $0F ; Room layout / Floor
db $40 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Prison", "nmg", "thieves", "prison")
dw $0045 ; Screen ID
dw $0AE4, $0978 ; Link Coords
dw $0A00, $090B ; Camera HV
db $04 ; Item
db $06 ; Link direction
;-----------------------------
db $34 ; Entrance
db $2E ; Room layout / Floor
db $42 ; Door / Peg state / Layer
dw $0002 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("After Mitts", "nmg", "thieves", "after_mitts")
dw $0044 ; Screen ID
dw $08DC, $0978 ; Link Coords
dw $0800, $090B ; Camera HV
db $04 ; Item
db $06 ; Link direction
;-----------------------------
db $34 ; Entrance
db $2E ; Room layout / Floor
db $42 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE00A, $0162) ; Room $45 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pot Hammerdash", "nmg", "thieves", "pot_hammerdash")
dw $0045 ; Screen ID
dw $0A78, $082C ; Link Coords
dw $0A00, $0800 ; Camera HV
db $04 ; Item
db $00 ; Link direction
;-----------------------------
db $34 ; Entrance
db $0E ; Room layout / Floor
db $40 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE008, $0080) ; Room $44 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Blind", "nmg", "thieves", "blind")
dw $00BC ; Screen ID
dw $1978, $1619 ; Link Coords
dw $1900, $1600 ; Camera HV
db $04 ; Item
db $00 ; Link direction
;-----------------------------
db $34 ; Entrance
db $5F ; Room layout / Floor
db $41 ; Door / Peg state / Layer
dw $0002 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; SKULL WOODS
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_nmg_skull:
%menu_header("Skull Woods", 12)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Thieves'", "nmg", "skull", "outside_thieves")
dw $0058 ; Screen ID
dw $01F8, $07C8 ; Link Coords
dw $0176, $076A ; Camera HV
db $04 ; Item
db $02 ; Link direction
;-----------------------------
dw $0203, $07D7 ; Scroll X,Y
dw $0B2E ; Tilemap position
;dw $FFF6 ; Scroll mod Y
;dw $FFFA ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Cursed Dwarf", "nmg", "skull", "cursed_dwarf")
dw $0058 ; Screen ID
dw $0350, $09E3 ; Link Coords
dw $02CE, $091E ; Camera HV
db $01 ; Item
db $02 ; Link direction
;-----------------------------
dw $035B, $098B ; Scroll X,Y
dw $1858 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $FFF2 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Getting Tempered", "nmg", "skull", "getting_tempered")
dw $0058 ; Screen ID
dw $03E1, $091A ; Link Coords
dw $0300, $08B6 ; Camera HV
db $14 ; Item
db $06 ; Link direction
;-----------------------------
dw $038D, $0925 ; Scroll X,Y
dw $1560 ; Tilemap position
;dw $0008 ; Scroll mod Y
;dw $0000 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Fencedash", "nmg", "skull", "fence_dash")
dw $0062 ; Screen ID
dw $0408, $0909 ; Link Coords
dw $0400, $08A6 ; Camera HV
db $14 ; Item
db $04 ; Link direction
;-----------------------------
dw $047D, $0915 ; Scroll X,Y
dw $0400 ; Tilemap position
;dw $FFF8 ; Scroll mod Y
;dw $0000 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Dash to Skull Woods", "nmg", "skull", "dash_to_sw")
dw $0058 ; Screen ID
dw $0348, $0608 ; Link Coords
dw $02CA, $0600 ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
dw $034F, $066F ; Scroll X,Y
dw $005A ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $0006 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Mummy Room", "nmg", "skull", "mummy_room")
dw $0040 ; Screen ID
dw $0248, $0250 ; Link Coords
dw $01CA, $01F0 ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
dw $024F, $025F ; Scroll X,Y
dw $0EBA ; Tilemap position
;dw $FFFE ; Scroll mod Y
;dw $0006 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Bomb Jump", "nmg", "skull", "bomb_jump")
dw $0040 ; Screen ID
dw $02E8, $025B ; Link Coords
dw $0266, $01FD ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
dw $02F3, $026A ; Scroll X,Y
dw $0F4E ; Tilemap position
;dw $0003 ; Scroll mod Y
;dw $000A ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Key Pot", "nmg", "skull", "key_pot")
dw $0056 ; Screen ID
dw $0D1A, $0B78 ; Link Coords
dw $0D00, $0B0C ; Camera HV
db $01 ; Item
db $04 ; Link direction
;-----------------------------
db $29 ; Entrance
db $7F ; Room layout / Floor
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Skull Entrance", "nmg", "skull", "skull_entrance")
dw $0040 ; Screen ID
dw $0098, $00CA ; Link Coords
dw $0012, $0066 ; Camera HV
db $05 ; Item
db $00 ; Link direction
;-----------------------------
dw $009F, $00D5 ; Scroll X,Y
dw $0282 ; Tilemap position
;dw $000A ; Scroll mod Y
;dw $FFFE ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mummy Hellway", "nmg", "skull", "mummy_hellway")
dw $0049 ; Screen ID
dw $12DC, $0978 ; Link Coords
dw $1200, $090B ; Camera HV
db $05 ; Item
db $06 ; Link direction
;-----------------------------
db $2B ; Entrance
db $2F ; Room layout / Floor
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE032, $0003) ; Room $59 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mummy Key", "nmg", "skull", "mummy_key")
dw $0049 ; Screen ID
dw $1278, $0815 ; Link Coords
dw $1200, $0800 ; Camera HV
db $05 ; Item
db $00 ; Link direction
;-----------------------------
db $2B ; Entrance
db $0F ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0801 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mothula", "nmg", "skull", "mothula")
dw $0039 ; Screen ID
dw $12D0, $0778 ; Link Coords
dw $1200, $070B ; Camera HV
db $05 ; Item
db $06 ; Link direction
;-----------------------------
db $2B ; Entrance
db $2F ; Room layout / Floor
db $02 ; Door / Peg state / Layer
dw $0002 ; Dead sprites
;-----------------------------
%write_7F()
%write8($7F2BDC, $00) ; Bastard door
%write8($7F2BE3, $00)
%write8($7F2C9C, $00)
%write8($7F2CA3, $00)
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; ICE PALACE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_nmg_ice:
%menu_header("Ice Palace", 16)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Skull", "nmg", "ice", "outside_skull")
dw $0040 ; Screen ID
dw $0098, $00CB ; Link Coords
dw $0016, $0069 ; Camera HV
db $14 ; Item
db $02 ; Link direction
;-----------------------------
dw $00A3, $00D6 ; Scroll X,Y
dw $0282 ; Tilemap position
;dw $0007 ; Scroll mod Y
;dw $FFFA ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Bridge Warp", "nmg", "ice", "bridge_warp")
dw $002C ; Screen ID
dw $0898, $0A0C ; Link Coords
dw $0820, $0A00 ; Camera HV
db $08 ; Item
db $00 ; Link direction
;-----------------------------
dw $089F, $0A6D ; Scroll X,Y
dw $0004 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $0000 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Lottery", "nmg", "ice", "lottery")
dw $0055 ; Screen ID
dw $0BE1, $0587 ; Link Coords
dw $0B00, $051E ; Camera HV
db $08 ; Item
db $06 ; Link direction
;-----------------------------
dw $0B7D, $058D ; Scroll X,Y
dw $0920 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $0000 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Catfish", "nmg", "ice", "medallion")
dw $0057 ; Screen ID
dw $0F70, $040C ; Link Coords
dw $0EFE, $0400 ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
dw $0F7B, $046F ; Scroll X,Y
dw $009E ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $FFF2 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Zora's Domain", "nmg", "ice", "zoras_domain")
dw $000F ; Screen ID
dw $0F40, $0215 ; Link Coords
dw $0ECD, $0200 ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
dw $0F4A, $026F ; Scroll X,Y
dw $0098 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $FFF3 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Tiny Warp Dik", "nmg", "ice", "tiny_warp")
dw $000F ; Screen ID
dw $0F40, $0221 ; Link Coords
dw $0ECD, $0200 ; Camera HV
db $14 ; Item
db $02 ; Link direction
;-----------------------------
dw $0F4A, $026F ; Scroll X,Y
dw $0098 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $FFF3 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "nmg", "ice", "ice_entrance")
dw $0075 ; Screen ID
dw $0CB8, $0DCB ; Link Coords
dw $0C32, $0D69 ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
dw $0CBF, $0DD6 ; Scroll X,Y
dw $0BC6 ; Tilemap position
;dw $0007 ; Scroll mod Y
;dw $FFFE ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Ice 2", "nmg", "ice", "ice2")
dw $000E ; Screen ID
dw $1D1E, $0178 ; Link Coords
dw $1D00, $010C ; Camera HV
db $05 ; Item
db $04 ; Link direction
;-----------------------------
db $2D ; Entrance
db $30 ; Room layout / Floor
db $02 ; Door / Peg state / Layer
dw $0001 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Penguin Switch Room", "nmg", "ice", "penguin_switch_room")
dw $001E ; Screen ID
dw $1DD8, $0378 ; Link Coords
dw $1D00, $030B ; Camera HV
db $05 ; Item
db $06 ; Link direction
;-----------------------------
db $2D ; Entrance
db $3F ; Room layout / Floor
db $82 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FDF9C, $000B) ; Room $0E sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Bombable Floor", "nmg", "ice", "bombable_floor")
dw $001E ; Screen ID
dw $1D78, $0314 ; Link Coords
dw $1D00, $0300 ; Camera HV
db $05 ; Item
db $00 ; Link direction
;-----------------------------
db $2D ; Entrance
db $3F ; Room layout / Floor
db $81 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FDFBE, $0071) ; Room $1F sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Conveyor Room", "nmg", "ice", "conveyor_room")
dw $003E ; Screen ID
dw $1D78, $06D0 ; Link Coords
dw $1D00, $0610 ; Camera HV
db $01 ; Item
db $02 ; Link direction
;-----------------------------
db $2D ; Entrance
db $1E ; Room layout / Floor
db $C1 ; Door / Peg state / Layer
dw $0006 ; Dead sprites
;-----------------------------
%write8_enable()
%write8($7E0B2F, $01)
%write8($7E0B37, $A8)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("IPBJ", "nmg", "ice", "ipbj")
dw $003E ; Screen ID
dw $1C78, $07D3 ; Link Coords
dw $1C00, $0710 ; Camera HV
db $01 ; Item
db $02 ; Link direction
;-----------------------------
db $2D ; Entrance
db $AE ; Room layout / Floor
db $41 ; Door / Peg state / Layer
dw $0306 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Penguin Lineup Room", "nmg", "ice", "penguin_room")
dw $004E ; Screen ID
dw $1DB8, $0862 ; Link Coords
dw $1D00, $0800 ; Camera HV
db $04 ; Item
db $00 ; Link direction
;-----------------------------
db $2D ; Entrance
db $1E ; Room layout / Floor
db $40 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Lonely Firebar", "nmg", "ice", "lonely_firebar")
dw $005E ; Screen ID
dw $1D10, $0B78 ; Link Coords
dw $1D00, $0B0B ; Camera HV
db $04 ; Item
db $04 ; Link direction
;-----------------------------
db $2D ; Entrance
db $3D ; Room layout / Floor
db $42 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE05C, $001F) ; Room $6E sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Last Two Screens", "nmg", "ice", "last_two_screens")
dw $009E ; Screen ID
dw $1D50, $1378 ; Link Coords
dw $1D00, $130B ; Camera HV
db $04 ; Item
db $06 ; Link direction
;-----------------------------
db $2D ; Entrance
db $3B ; Room layout / Floor
db $40 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Kholdstare", "nmg", "ice", "kholdstare")
dw $00CE ; Screen ID
dw $1D40, $18AA ; Link Coords
dw $1D00, $1810 ; Camera HV
db $04 ; Item
db $02 ; Link direction
;-----------------------------
db $2D ; Entrance
db $1A ; Room layout / Floor
db $40 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; SWAMP PALACE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_nmg_swamp:
%menu_header("Swamp Palace", 18)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Ice", "nmg", "swamp", "outside_ice")
dw $0075 ; Screen ID
dw $0CB8, $0DCB ; Link Coords
dw $0C3E, $0D6D ; Camera HV
db $14 ; Item
db $02 ; Link direction
;-----------------------------
dw $0CC3, $0DDA ; Scroll X,Y
dw $0BC6 ; Tilemap position
;dw $0003 ; Scroll mod Y
;dw $FFF2 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Link's House", "nmg", "swamp", "links_house")
dw $002C ; Screen ID
dw $08B8, $0B23 ; Link Coords
dw $0840, $0AC5 ; Camera HV
db $08 ; Item
db $02 ; Link direction
;-----------------------------
dw $08BF, $0B32 ; Scroll X,Y
dw $0608 ; Tilemap position
;dw $FFFB ; Scroll mod Y
;dw $0000 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Swamp Overworld", "nmg", "swamp", "swamp_overworld")
dw $0073 ; Screen ID
dw $07AF, $0DD9 ; Link Coords
dw $0700, $0D1E ; Camera HV
db $04 ; Item
db $02 ; Link direction
;-----------------------------
dw $0785, $0D93 ; Scroll X,Y
dw $08A0 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $0000 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Dam", "nmg", "swamp", "dam")
dw $003B ; Screen ID
dw $0778, $0EF0 ; Link Coords
dw $06FA, $0E91 ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
dw $077F, $0EFE ; Scroll X,Y
dw $0520 ; Tilemap position
;dw $000F ; Scroll mod Y
;dw $0006 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "nmg", "swamp", "entrance")
dw $007B ; Screen ID
dw $0778, $0EEF ; Link Coords
dw $06FA, $0E91 ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
dw $077F, $0EFE ; Scroll X,Y
dw $0520 ; Tilemap position
;dw $000F ; Scroll mod Y
;dw $0006 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("First Key Pot", "nmg", "swamp", "first_key_pot")
dw $0028 ; Screen ID
dw $1078, $0426 ; Link Coords
dw $1000, $0400 ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $25 ; Entrance
db $C0 ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $000E ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Tiny Hallway Key", "nmg", "swamp", "hallway_key_1")
dw $0037 ; Screen ID
dw $0EF8, $0728 ; Link Coords
dw $0E80, $0700 ; Camera HV
db $04 ; Item
db $00 ; Link direction
;-----------------------------
db $25 ; Entrance
db $AF ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Water Lever 1", "nmg", "swamp", "water_lever_1")
dw $0037 ; Screen ID
dw $0E78, $071D ; Link Coords
dw $0E00, $0700 ; Camera HV
db $04 ; Item
db $00 ; Link direction
;-----------------------------
db $25 ; Entrance
db $AF ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Main Hub", "nmg", "swamp", "main_hub")
dw $0037 ; Screen ID
dw $0E18, $0778 ; Link Coords
dw $0E00, $070B ; Camera HV
db $04 ; Item
db $04 ; Link direction
;-----------------------------
db $25 ; Entrance
db $AF ; Room layout / Floor
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Water Lever 2", "nmg", "swamp", "water_lever_2")
dw $0036 ; Screen ID
dw $0C17, $0678 ; Link Coords
dw $0C00, $060B ; Camera HV
db $04 ; Item
db $04 ; Link direction
;-----------------------------
db $25 ; Entrance
db $CF ; Room layout / Floor
db $02 ; Door / Peg state / Layer
dw $0031 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FDFEA, $0240) ; Room $35 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Sociable Firebar", "nmg", "swamp", "sociable_firebar")
dw $0034 ; Screen ID
dw $0878, $072C ; Link Coords
dw $0800, $06BF ; Camera HV
db $04 ; Item
db $00 ; Link direction
;-----------------------------
db $25 ; Entrance
db $EF ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FDFEA, $0240) ; Room $35 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Backtracking", "nmg", "swamp", "backtracking")
dw $0035 ; Screen ID
dw $0A19, $0678 ; Link Coords
dw $0A00, $060B ; Camera HV
db $04 ; Item
db $04 ; Link direction
;-----------------------------
db $25 ; Entrance
db $8F ; Room layout / Floor
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FDFEA, $0240) ; Room $35 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Hookshot", "nmg", "swamp", "hookshot")
dw $0035 ; Screen ID
dw $0BDA, $0778 ; Link Coords
dw $0B00, $070B ; Camera HV
db $04 ; Item
db $06 ; Link direction
;-----------------------------
db $25 ; Entrance
db $BF ; Room layout / Floor
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FDFE8, $0001) ; Room $34 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Hookdash", "nmg", "swamp", "hookdash")
dw $0036 ; Screen ID
dw $0CF8, $062C ; Link Coords
dw $0C80, $0600 ; Camera HV
db $0E ; Item
db $00 ; Link direction
;-----------------------------
db $25 ; Entrance
db $CF ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Water Lever 3", "nmg", "swamp", "water_lever_3")
dw $0026 ; Screen ID
dw $0DA8, $0426 ; Link Coords
dw $0D00, $0400 ; Camera HV
db $0E ; Item
db $00 ; Link direction
;-----------------------------
db $25 ; Entrance
db $1F ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0400 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Restock Room", "nmg", "swamp", "restock")
dw $0066 ; Screen ID
dw $0D78, $0D2A ; Link Coords
dw $0D00, $0D00 ; Camera HV
db $0E ; Item
db $00 ; Link direction
;-----------------------------
db $25 ; Entrance
db $BE ; Room layout / Floor
db $0D ; Door / Peg state / Layer
dw $0080 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE06C, $0002) ; Room $76 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Phelps Way", "nmg", "swamp", "phelps_way")
dw $0016 ; Screen ID
dw $0D78, $02D8 ; Link Coords
dw $0D00, $0210 ; Camera HV
db $0E ; Item
db $02 ; Link direction
;-----------------------------
db $25 ; Entrance
db $9F ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Arrghus", "nmg", "swamp", "arrghus")
dw $0016 ; Screen ID
dw $0C78, $0212 ; Link Coords
dw $0C00, $0200 ; Camera HV
db $0E ; Item
db $00 ; Link direction
;-----------------------------
db $25 ; Entrance
db $8F ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0004 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; MISERY MIRE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_nmg_mire:
%menu_header("Misery Mire", 19)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Swamp", "nmg", "mire", "outside_swamp")
dw $007B ; Screen ID
dw $0778, $0EEB ; Link Coords
dw $06F2, $0E8D ; Camera HV
db $05 ; Item
db $02 ; Link direction
;-----------------------------
dw $077F, $0EFA ; Scroll X,Y
dw $049E ; Tilemap position
;dw $FFF4 ; Scroll mod Y
;dw $FFFC ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Death Mountain", "nmg", "mire", "dm")
dw $0003 ; Screen ID
dw $067B, $0328 ; Link Coords
dw $060D, $02CA ; Camera HV
db $0E ; Item
db $06 ; Link direction
;-----------------------------
dw $0682, $0337 ; Scroll X,Y
dw $1600 ; Tilemap position
;dw $FFF6 ; Scroll mod Y
;dw $FFF3 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Free Flutedash", "nmg", "mire", "free_flutedash")
dw $0003 ; Screen ID
dw $06C1, $004B ; Link Coords
dw $0653, $0000 ; Camera HV
db $0C ; Item
db $06 ; Link direction
;-----------------------------
dw $06C8, $006D ; Scroll X,Y
dw $000A ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $FFFD ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Mire Portal", "nmg", "mire", "darkworld_warp")
dw $0030 ; Screen ID
dw $008E, $0FA8 ; Link Coords
dw $000C, $0F1E ; Camera HV
db $08 ; Item
db $06 ; Link direction
;-----------------------------
dw $0099, $0F8D ; Scroll X,Y
dw $1880 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $FFF4 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Mire Entrance", "nmg", "mire", "entrance")
dw $0070 ; Screen ID
dw $0128, $0CE6 ; Link Coords
dw $00A6, $0C82 ; Camera HV
db $10 ; Item
db $00 ; Link direction
;-----------------------------
dw $0133, $0CF1 ; Scroll X,Y
dw $0414 ; Tilemap position
;dw $000C ; Scroll mod Y
;dw $FFFA ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mire 2", "nmg", "mire", "mire2")
dw $0098 ; Screen ID
dw $1188, $132A ; Link Coords
dw $1100, $1300 ; Camera HV
db $05 ; Item
db $00 ; Link direction
;-----------------------------
db $27 ; Entrance
db $B0 ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Main Hub", "nmg", "mire", "main_hub")
dw $00D2 ; Screen ID
dw $0578, $1A1C ; Link Coords
dw $0500, $1A00 ; Camera HV
db $05 ; Item
db $00 ; Link direction
;-----------------------------
db $27 ; Entrance
db $DF ; Room layout / Floor
db $81 ; Door / Peg state / Layer
dw $03EF ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Beat the Fireball", "nmg", "mire", "beat_the_fireball")
dw $00B2 ; Screen ID
dw $0578, $17E2 ; Link Coords
dw $0500, $1710 ; Camera HV
db $05 ; Item
db $02 ; Link direction
;-----------------------------
db $27 ; Entrance
db $3F ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Bari Key", "nmg", "mire", "bari_key")
dw $00C2 ; Screen ID
dw $0415, $1978 ; Link Coords
dw $0400, $190B ; Camera HV
db $05 ; Item
db $04 ; Link direction
;-----------------------------
db $27 ; Entrance
db $EF ; Room layout / Floor
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Sluggulas", "nmg", "mire", "sluggulas")
dw $00C1 ; Screen ID
dw $0278, $19CF ; Link Coords
dw $0200, $1910 ; Camera HV
db $05 ; Item
db $02 ; Link direction
;-----------------------------
db $27 ; Entrance
db $2F ; Room layout / Floor
db $41 ; Door / Peg state / Layer
dw $0200 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Torches", "nmg", "mire", "torches")
dw $00D1 ; Screen ID
dw $02A8, $1A28 ; Link Coords
dw $0200, $1A00 ; Camera HV
db $05 ; Item
db $00 ; Link direction
;-----------------------------
db $27 ; Entrance
db $0F ; Room layout / Floor
db $40 ; Door / Peg state / Layer
dw $0040 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spark Gamble", "nmg", "mire", "spark_gamble")
dw $00C1 ; Screen ID
dw $03D6, $1878 ; Link Coords
dw $0300, $180B ; Camera HV
db $05 ; Item
db $06 ; Link direction
;-----------------------------
db $27 ; Entrance
db $1F ; Room layout / Floor
db $42 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Big Chest Room", "nmg", "mire", "big_chest_room")
dw $00C3 ; Screen ID
dw $06D8, $1978 ; Link Coords
dw $0600, $190B ; Camera HV
db $0E ; Item
db $06 ; Link direction
;-----------------------------
db $27 ; Entrance
db $6F ; Room layout / Floor
db $42 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spike Key", "nmg", "mire", "spike_key")
dw $00C3 ; Screen ID
dw $0678, $1814 ; Link Coords
dw $0600, $1800 ; Camera HV
db $0E ; Item
db $00 ; Link direction
;-----------------------------
db $27 ; Entrance
db $4F ; Room layout / Floor
db $41 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Wizzrobe", "nmg", "mire", "wizzrobe")
dw $00B3 ; Screen ID
dw $0624, $1678 ; Link Coords
dw $0600, $160B ; Camera HV
db $0E ; Item
db $04 ; Link direction
;-----------------------------
db $27 ; Entrance
db $0F ; Room layout / Floor
db $4E ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Basement", "nmg", "mire", "basement")
dw $00A2 ; Screen ID
dw $04F8, $1444 ; Link Coords
dw $0480, $1400 ; Camera HV
db $0E ; Item
db $00 ; Link direction
;-----------------------------
db $27 ; Entrance
db $CF ; Room layout / Floor
db $4C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE0E4, $0001) ; Room $B2 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spooky Action 1", "nmg", "mire", "spooky_action_1")
dw $0093 ; Screen ID
dw $0612, $1378 ; Link Coords
dw $0600, $130B ; Camera HV
db $05 ; Item
db $04 ; Link direction
;-----------------------------
db $27 ; Entrance
db $2E ; Room layout / Floor
db $42 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spooky Action 2", "nmg", "mire", "spooky_action_2")
dw $0092 ; Screen ID
dw $0515, $1378 ; Link Coords
dw $0500, $130B ; Camera HV
db $05 ; Item
db $04 ; Link direction
;-----------------------------
db $27 ; Entrance
db $7E ; Room layout / Floor
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Vitreous", "nmg", "mire", "vitty")
dw $00A0 ; Screen ID
dw $0078, $1428 ; Link Coords
dw $0000, $1400 ; Camera HV
db $03 ; Item
db $00 ; Link direction
;-----------------------------
db $27 ; Entrance
db $CF ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE0A4, $0200) ; Room $92 sprite deaths
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; TURTLE ROCK
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_nmg_trock:
%menu_header("Turtle Rock", 17)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Mire", "nmg", "trock", "outside_mire")
dw $0070 ; Screen ID
dw $0128, $0CDA ; Link Coords
dw $00A6, $0C7C ; Camera HV
db $14 ; Item
db $02 ; Link direction
;-----------------------------
dw $0133, $0CE9 ; Scroll X,Y
dw $0414 ; Tilemap position
;dw $0004 ; Scroll mod Y
;dw $FFFA ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Ice Rod Overworld", "nmg", "trock", "icerod_overworld")
dw $003F ; Screen ID
dw $0F70, $0E07 ; Link Coords
dw $0EF6, $0E00 ; Camera HV
db $08 ; Item
db $00 ; Link direction
;-----------------------------
dw $0F7B, $0E6D ; Scroll X,Y
dw $001E ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $FFFA ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Death Mountain", "nmg", "trock", "dm")
dw $0003 ; Screen ID
dw $067B, $0328 ; Link Coords
dw $060D, $02CA ; Camera HV
db $08 ; Item
db $06 ; Link direction
;-----------------------------
dw $0682, $0337 ; Scroll X,Y
dw $1600 ; Tilemap position
;dw $FFF6 ; Scroll mod Y
;dw $FFF3 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Squirrels", "nmg", "trock", "squirrels")
dw $00DF ; Screen ID
dw $1EF8, $1BD9 ; Link Coords
dw $1E80, $1B10 ; Camera HV
db $0E ; Item
db $02 ; Link direction
;-----------------------------
db $1F ; Entrance
db $A1 ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0003 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Peg Puzzle", "nmg", "trock", "peg_puzzle")
dw $0005 ; Screen ID
dw $0DE1, $0077 ; Link Coords
dw $0D00, $0013 ; Camera HV
db $0E ; Item
db $06 ; Link direction
;-----------------------------
dw $0D7D, $0082 ; Scroll X,Y
dw $0060 ; Tilemap position
;dw $000B ; Scroll mod Y
;dw $0000 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "nmg", "trock", "entrance")
dw $0047 ; Screen ID
dw $0F08, $013D ; Link Coords
dw $0E96, $00DB ; Camera HV
db $12 ; Item
db $00 ; Link direction
;-----------------------------
dw $0F13, $014A ; Scroll X,Y
dw $0614 ; Tilemap position
;dw $0003 ; Scroll mod Y
;dw $000A ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Torches", "nmg", "trock", "torches")
dw $00C6 ; Screen ID
dw $0DCD, $1878 ; Link Coords
dw $0D00, $180B ; Camera HV
db $12 ; Item
db $06 ; Link direction
;-----------------------------
db $35 ; Entrance
db $D0 ; Room layout / Floor
db $02 ; Door / Peg state / Layer
dw $0028 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Roller Room", "nmg", "trock", "roller_room")
dw $00C7 ; Screen ID
dw $0E78, $1820 ; Link Coords
dw $0E00, $1800 ; Camera HV
db $0E ; Item
db $00 ; Link direction
;-----------------------------
db $35 ; Entrance
db $C0 ; Room layout / Floor
db $81 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pokey 0", "nmg", "trock", "pokey_0")
dw $00C6 ; Screen ID
dw $0C78, $182B ; Link Coords
dw $0C00, $1800 ; Camera HV
db $12 ; Item
db $00 ; Link direction
;-----------------------------
db $35 ; Entrance
db $C0 ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Chomps", "nmg", "trock", "chomps")
dw $00B6 ; Screen ID
dw $0C78, $1718 ; Link Coords
dw $0C00, $1700 ; Camera HV
db $12 ; Item
db $00 ; Link direction
;-----------------------------
db $35 ; Entrance
db $20 ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0020 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pokey 1", "nmg", "trock", "pokey_1")
dw $0014 ; Screen ID
dw $0819, $0278 ; Link Coords
dw $0800, $020B ; Camera HV
db $12 ; Item
db $04 ; Link direction
;-----------------------------
db $35 ; Entrance
db $CF ; Room layout / Floor
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pokeys 2", "nmg", "trock", "pokeys_2")
dw $0014 ; Screen ID
dw $0878, $03C4 ; Link Coords
dw $0800, $0310 ; Camera HV
db $12 ; Item
db $02 ; Link direction
;-----------------------------
db $35 ; Entrance
db $EF ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FDFA6, $0040) ; Room $13 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Crystaroller", "nmg", "trock", "crystaroller")
dw $0014 ; Screen ID
dw $0878, $022B ; Link Coords
dw $0800, $0200 ; Camera HV
db $12 ; Item
db $00 ; Link direction
;-----------------------------
db $35 ; Entrance
db $CF ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FDFC8, $0028) ; Room $24 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Dark Maze", "nmg", "trock", "dark_maze")
dw $0004 ; Screen ID
dw $0878, $0025 ; Link Coords
dw $0800, $0000 ; Camera HV
db $12 ; Item
db $00 ; Link direction
;-----------------------------
db $35 ; Entrance
db $0F ; Room layout / Floor
db $40 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Laser Skip", "nmg", "trock", "laser_skip")
dw $00C5 ; Screen ID
dw $0A78, $19DE ; Link Coords
dw $0A00, $1910 ; Camera HV
db $12 ; Item
db $02 ; Link direction
;-----------------------------
db $35 ; Entrance
db $6E ; Room layout / Floor
db $41 ; Door / Peg state / Layer
dw $0040 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Switch Room", "nmg", "trock", "switch_room")
dw $00C5 ; Screen ID
dw $0A18, $1978 ; Link Coords
dw $0A00, $190B ; Camera HV
db $12 ; Item
db $04 ; Link direction
;-----------------------------
db $35 ; Entrance
db $6E ; Room layout / Floor
db $42 ; Door / Peg state / Layer
dw $0040 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE12A, $0010) ; Room $D5 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Trinexx", "nmg", "trock", "trinexx")
dw $00B4 ; Screen ID
dw $0878, $161D ; Link Coords
dw $0800, $1600 ; Camera HV
db $12 ; Item
db $00 ; Link direction
;-----------------------------
db $35 ; Entrance
db $CD ; Room layout / Floor
db $41 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; GANON'S TOWER
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_nmg_gtower:
%menu_header("Ganon's Tower", 21)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Turtle Rock", "nmg", "gtower", "outside_trock")
dw $0047 ; Screen ID
dw $0F08, $013E ; Link Coords
dw $0E96, $00E0 ; Camera HV
db $0E ; Item
db $02 ; Link direction
;-----------------------------
dw $0F13, $014D ; Scroll X,Y
dw $0712 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $FFFA ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "nmg", "gtower", "entrance")
dw $0043 ; Screen ID
dw $08F8, $003A ; Link Coords
dw $087A, $0000 ; Camera HV
db $0E ; Item
db $00 ; Link direction
;-----------------------------
dw $08FF, $006F ; Scroll X,Y
dw $0050 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $0006 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spike Skip", "nmg", "gtower", "spike_skip")
dw $008B ; Screen ID
dw $1715, $1078 ; Link Coords
dw $1700, $100C ; Camera HV
db $04 ; Item
db $04 ; Link direction
;-----------------------------
db $37 ; Entrance
db $10 ; Room layout / Floor
db $82 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pre Firesnakes Room", "nmg", "gtower", "pre_firesnakes_room")
dw $009B ; Screen ID
dw $16D4, $1278 ; Link Coords
dw $1600, $120B ; Camera HV
db $02 ; Item
db $06 ; Link direction
;-----------------------------
db $37 ; Entrance
db $00 ; Room layout / Floor
db $42 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F()
%write8($7F23DC, $00) ; Bastard door
%write8($7F23E3, $00)
%write8($7F249C, $00)
%write8($7F24A3, $00)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Bombable Floor", "nmg", "gtower", "bombable_floor")
dw $009C ; Screen ID
dw $1978, $1224 ; Link Coords
dw $1900, $1200 ; Camera HV
db $01 ; Item
db $00 ; Link direction
;-----------------------------
db $37 ; Entrance
db $D0 ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0002 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Ice Armos", "nmg", "gtower", "ice_armos")
dw $001C ; Screen ID
dw $199F, $03A8 ; Link Coords
dw $1900, $0310 ; Camera HV
db $05 ; Item
db $02 ; Link direction
;-----------------------------
db $37 ; Entrance
db $3F ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Floor 3", "nmg", "gtower", "floor_3")
dw $000C ; Screen ID
dw $18F8, $0026 ; Link Coords
dw $1880, $0000 ; Camera HV
db $03 ; Item
db $00 ; Link direction
;-----------------------------
db $37 ; Entrance
db $C1 ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mimics 1", "nmg", "gtower", "mimics1")
dw $006B ; Screen ID
dw $1678, $0CD8 ; Link Coords
dw $1600, $0C10 ; Camera HV
db $03 ; Item
db $02 ; Link direction
;-----------------------------
db $37 ; Entrance
db $82 ; Room layout / Floor
db $C1 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mimics 2", "nmg", "gtower", "mimics2")
dw $006B ; Screen ID
dw $16D8, $0D78 ; Link Coords
dw $1600, $0D0B ; Camera HV
db $03 ; Item
db $06 ; Link direction
;-----------------------------
db $37 ; Entrance
db $22 ; Room layout / Floor
db $C2 ; Door / Peg state / Layer
dw $0240 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spike Room", "nmg", "gtower", "spike_room")
dw $006B ; Screen ID
dw $1778, $0C1C ; Link Coords
dw $1700, $0C00 ; Camera HV
db $03 ; Item
db $00 ; Link direction
;-----------------------------
db $37 ; Entrance
db $92 ; Room layout / Floor
db $41 ; Door / Peg state / Layer
dw $2640 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Gauntlet 1", "nmg", "gtower", "gauntlet")
dw $005C ; Screen ID
dw $1978, $0A23 ; Link Coords
dw $1900, $0A00 ; Camera HV
db $03 ; Item
db $00 ; Link direction
;-----------------------------
db $37 ; Entrance
db $92 ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Gauntlet 3", "nmg", "gtower", "gauntlet3")
dw $005D ; Screen ID
dw $1A78, $0AE0 ; Link Coords
dw $1A00, $0A10 ; Camera HV
db $03 ; Item
db $02 ; Link direction
;-----------------------------
db $37 ; Entrance
db $03 ; Room layout / Floor
db $81 ; Door / Peg state / Layer
dw $00FD ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Lanmola 2", "nmg", "gtower", "lanmola2")
dw $006C ; Screen ID
dw $19D5, $0D78 ; Link Coords
dw $1900, $0D0B ; Camera HV
db $05 ; Item
db $04 ; Link direction
;-----------------------------
db $37 ; Entrance
db $33 ; Room layout / Floor
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE03A, $0EFD) ; Room $5D sprite deaths
%write16($7FE05A, $00C9) ; Room $6D sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Wizzrobes 1", "nmg", "gtower", "wizz1")
dw $006C ; Screen ID
dw $1878, $0C26 ; Link Coords
dw $1800, $0C00 ; Camera HV
db $05 ; Item
db $00 ; Link direction
;-----------------------------
db $37 ; Entrance
db $03 ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Wizzrobes 2", "nmg", "gtower", "wizz2")
dw $00A5 ; Screen ID
dw $0B78, $1524 ; Link Coords
dw $0B00, $1500 ; Camera HV
db $12 ; Item
db $00 ; Link direction
;-----------------------------
db $37 ; Entrance
db $B4 ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $008C ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Torches 1", "nmg", "gtower", "torches1")
dw $0095 ; Screen ID
dw $0BD3, $1278 ; Link Coords
dw $0B00, $120B ; Camera HV
db $09 ; Item
db $06 ; Link direction
;-----------------------------
db $37 ; Entrance
db $54 ; Room layout / Floor
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE0CA, $00EF) ; Room $A5 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Torches 2", "nmg", "gtower", "torches2")
dw $0096 ; Screen ID
dw $0D78, $13A2 ; Link Coords
dw $0D00, $1310 ; Camera HV
db $05 ; Item
db $00 ; Link direction
;-----------------------------
db $37 ; Entrance
db $34 ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Helma Key", "nmg", "gtower", "helma_key")
dw $003D ; Screen ID
dw $1B78, $0718 ; Link Coords
dw $1B00, $0700 ; Camera HV
db $05 ; Item
db $00 ; Link direction
;-----------------------------
db $37 ; Entrance
db $35 ; Room layout / Floor
db $81 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write8_enable()
%write8($7E045A, $04) ; torches
%write8($7E04F0, $AF)
%write8($7E04F1, $B7)
%write8($7E04F2, $98)
%write8($7E04F3, $82)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Bombable Wall", "nmg", "gtower", "bombable_wall")
dw $003D ; Screen ID
dw $1B16, $0678 ; Link Coords
dw $1B00, $060B ; Camera HV
db $01 ; Item
db $04 ; Link direction
;-----------------------------
db $37 ; Entrance
db $15 ; Room layout / Floor
db $02 ; Door / Peg state / Layer
dw $000C ; Dead sprites
;-----------------------------
%write8_enable()
%write8($7E045A, $04) ; torches
%write8($7E04F0, $98)
%write8($7E04F1, $A0)
%write8($7E04F2, $7A)
%write8($7E04F3, $64)
%write_7F()
%write8($7F23DC, $00) ; Bastard door
%write8($7F23E3, $00)
%write8($7F249C, $00)
%write8($7F24A3, $00)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Moldorm 2", "nmg", "gtower", "moldorm_2")
dw $003D ; Screen ID
dw $1A78, $07D0 ; Link Coords
dw $1A00, $0710 ; Camera HV
db $05 ; Item
db $02 ; Link direction
;-----------------------------
db $37 ; Entrance
db $25 ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Agahnim 2", "nmg", "gtower", "agahnim_2")
dw $001D ; Screen ID
dw $1A78, $0226 ; Link Coords
dw $1A00, $0200 ; Camera HV
db $0E ; Item
db $00 ; Link direction
;-----------------------------
db $37 ; Entrance
db $86 ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; GANON
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_nmg_ganon:
%menu_header("Ganon", 2)

;---------------------------------------------------------------------------------------------------
%preset_OW("Ganon", "nmg", "ganon", "pyramid")
dw $005B ; Screen ID
dw $07F0, $0668 ; Link Coords
dw $0778, $060A ; Camera HV
db $0E ; Item
db $02 ; Link direction
;-----------------------------
dw $07F7, $0677 ; Scroll X,Y
dw $002E ; Tilemap position
;dw $FFF6 ; Scroll mod Y
;dw $FFF8 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Ganon (Full Magic)", "nmg", "ganon", "pyramid_magic")
dw $005B ; Screen ID
dw $07F0, $0669 ; Link Coords
dw $0778, $060B ; Camera HV
db $0E ; Item
db $02 ; Link direction
;-----------------------------
dw $07F7, $0678 ; Scroll X,Y
dw $002E ; Tilemap position
;dw $FFF5 ; Scroll mod Y
;dw $FFF8 ; Scroll mod X
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; BOSSES
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_nmg_boss:
%menu_header("Bosses", 14)
%existing_preset("nmg", "eastern", "armos")
%existing_preset("nmg", "desert", "lanmolas")
%existing_preset("nmg", "hera", "moldorm")
%existing_preset("nmg", "aga", "agahnim")
%existing_preset("nmg", "pod", "helma")
%existing_preset("nmg", "thieves", "blind")
%existing_preset("nmg", "skull", "mothula")
%existing_preset("nmg", "ice", "kholdstare")
%existing_preset("nmg", "swamp", "arrghus")
%existing_preset("nmg", "mire", "vitty")
%existing_preset("nmg", "trock", "trinexx")
%existing_preset("nmg", "gtower", "agahnim_2")
%existing_preset("nmg", "ganon", "pyramid")
%existing_preset("nmg", "ganon", "pyramid_magic")

;===================================================================================================
presetpersistent_nmg:

;===================================================================================================
presetpersistent_nmg_escape:
;-----------------------------
.bed
%write_sq()
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
%write8($7E0FC7, $01) ; Prize pack index
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
.into_sanctuary
..end

;===================================================================================================
presetpersistent_nmg_eastern:
;-----------------------------
.before_cutscene
%write8($7E0FC8, $02) ; Prize pack index
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
%write8($7E0FC8, $03) ; Prize pack index
..end
;-----------------------------
.stalfos_room
..end
;-----------------------------
.big_chest_room_1
%write8($7E0FCC, $01) ; Prize pack index
..end
;-----------------------------
.dark_key_room
..end
;-----------------------------
.big_key_dmg_boost
%write8($7E0FC8, $05) ; Prize pack index
..end
;-----------------------------
.big_chest_room_2
..end
;-----------------------------
.gwg
..end
;-----------------------------
.pot_room
%write8($7E0FC8, $00) ; Prize pack index
..end
;-----------------------------
.zeldagamer_room
..end
;-----------------------------
.double_reddies
..end
;-----------------------------
.armos
%write8($7E0FC8, $02) ; Prize pack index
..end

;===================================================================================================
presetpersistent_nmg_desert:
;-----------------------------
.outside_eastern_palace
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
%write8($7E0FC8, $03) ; Prize pack index
..end
;-----------------------------
.desert2_spinspeed
..end
;-----------------------------
.popo_genocide_room
..end
;-----------------------------
.torches
%write8($7E0FC8, $04) ; Prize pack index
..end
;-----------------------------
.lanmolas
..end

;===================================================================================================
presetpersistent_nmg_hera:
;-----------------------------
.outside_desert_palace
..end
;-----------------------------
.fake_flippers
..end
;-----------------------------
.dm
%write8($7E0FC9, $01) ; Prize pack index
..end
;-----------------------------
.after_mirror
..end
;-----------------------------
.quickhop
%write_mirror($1C, $08, $38, $01)
..end
;-----------------------------
.entrance
..end
;-----------------------------
.tile_room
..end
;-----------------------------
.torches
..end
;-----------------------------
.beetles
..end
;-----------------------------
.petting_zoo
%write8($7E0FCC, $02) ; Prize pack index
..end
;-----------------------------
.bumper_skip
..end
;-----------------------------
.moldorm
%write8($7E0FC8, $05) ; Prize pack index
..end

;===================================================================================================
presetpersistent_nmg_aga:
;-----------------------------
.outside_hera
%write8($7E0CFB, $04) ; Rupee pull kills
%write8($7E0CFC, $01) ; Rupee pull hits
..end
;-----------------------------
.first_rupee_tree
..end
;-----------------------------
.lost_woods
%write8($7E0CFB, $01) ; Rupee pull kills
%write8($7E0CFC, $00) ; Rupee pull hits
..end
;-----------------------------
.after_grove
%write8($7E0CFB, $03) ; Rupee pull kills
%write8($7E0CFC, $00) ; Rupee pull hits
..end
;-----------------------------
.after_lost_woods
%write8($7E0CFB, $01) ; Rupee pull kills
%write8($7E0CFC, $00) ; Rupee pull hits
..end
;-----------------------------
.castle_screen
..end
;-----------------------------
.entrance
..end
;-----------------------------
.prize_pack_guards
%write8($7E0FC8, $07) ; Prize pack index
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
%write8($7E0FC7, $02) ; Prize pack index
..end
;-----------------------------
.catwalk
..end
;-----------------------------
.agahnim
..end

;===================================================================================================
presetpersistent_nmg_pod:
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
..end
;-----------------------------
.main_hub_hammeryump
..end
;-----------------------------
.hammeryump
..end
;-----------------------------
.before_sexy_statue
%write8($7E0FCD, $01) ; Prize pack index
..end
;-----------------------------
.sexy_statue_room
..end
;-----------------------------
.mimics
..end
;-----------------------------
.statue
%write8($7E0FCB, $02) ; Prize pack index
..end
;-----------------------------
.basement
..end
;-----------------------------
.turtle_room
..end
;-----------------------------
.helma
%write8($7E0FC8, $01) ; Prize pack index
..end

;===================================================================================================
presetpersistent_nmg_thieves:
;-----------------------------
.outside_pod
..end
;-----------------------------
.ow_hammerdash
..end
;-----------------------------
.grove
..end
;-----------------------------
.usain_bolt
%write_mirror($9D, $04, $9C, $0A)
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
.after_mitts
..end
;-----------------------------
.pot_hammerdash
..end
;-----------------------------
.blind
..end

;===================================================================================================
presetpersistent_nmg_skull:
;-----------------------------
.outside_thieves
..end
;-----------------------------
.cursed_dwarf
..end
;-----------------------------
.getting_tempered
..end
;-----------------------------
.fence_dash
%write_mirror($D8, $04, $78, $08)
..end
;-----------------------------
.dash_to_sw
..end
;-----------------------------
.mummy_room
..end
;-----------------------------
.bomb_jump
%write8($7E0FCC, $04) ; Prize pack index
..end
;-----------------------------
.key_pot
%write8($7E02A2, $00) ; slot 4 altitude
..end
;-----------------------------
.skull_entrance
..end
;-----------------------------
.mummy_hellway
..end
;-----------------------------
.mummy_key
..end
;-----------------------------
.mothula
..end

;===================================================================================================
presetpersistent_nmg_ice:
;-----------------------------
.outside_skull
..end
;-----------------------------
.bridge_warp
%write8($7E02A2, $00) ; slot 4 altitude
%write_mirror($98, $00, $CB, $00)
..end
;-----------------------------
.lottery
%write8($7E0FC8, $02) ; Prize pack index
..end
;-----------------------------
.medallion
..end
;-----------------------------
.zoras_domain
%write_mirror($9D, $0E, $A6, $02)
..end
;-----------------------------
.tiny_warp
..end
;-----------------------------
.ice_entrance
..end
;-----------------------------
.ice2
..end
;-----------------------------
.penguin_switch_room
%write8($7E0FCC, $05) ; Prize pack index
..end
;-----------------------------
.bombable_floor
%write8($7E0FC9, $02) ; Prize pack index
..end
;-----------------------------
.conveyor_room
%write8($7E0FCA, $02) ; Prize pack index
..end
;-----------------------------
.ipbj
..end
;-----------------------------
.penguin_room
..end
;-----------------------------
.lonely_firebar
%write8($7E0FC9, $06) ; Prize pack index
..end
;-----------------------------
.last_two_screens
..end
;-----------------------------
.kholdstare
..end

;===================================================================================================
presetpersistent_nmg_swamp:
;-----------------------------
.outside_ice
..end
;-----------------------------
.links_house
%write_mirror($B8, $0C, $CB, $0D)
..end
;-----------------------------
.swamp_overworld
%write8($7E02A2, $A8) ; slot 4 altitude
..end
;-----------------------------
.dam
%write_mirror($7C, $07, $07, $0F)
..end
;-----------------------------
.entrance
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
..end
;-----------------------------
.sociable_firebar
..end
;-----------------------------
.backtracking
..end
;-----------------------------
.hookshot
%write8($7E0FC8, $03) ; Prize pack index
..end
;-----------------------------
.hookdash
..end
;-----------------------------
.water_lever_3
..end
;-----------------------------
.restock
..end
;-----------------------------
.phelps_way
..end
;-----------------------------
.arrghus
..end

;===================================================================================================
presetpersistent_nmg_mire:
;-----------------------------
.outside_swamp
%write8($7E02A2, $00) ; slot 4 altitude
..end
;-----------------------------
.dm
%write8($7E02A2, $FE) ; slot 4 altitude
%write_mirror($7C, $07, $FD, $0E)
..end
;-----------------------------
.free_flutedash
%write8($7E02A2, $0F) ; slot 4 altitude
%write_mirror($1C, $08, $3D, $01)
..end
;-----------------------------
.darkworld_warp
%write8($7E02A2, $8B) ; slot 4 altitude
..end
;-----------------------------
.entrance
..end
;-----------------------------
.mire2
..end
;-----------------------------
.main_hub
%write8($7E0FC8, $04) ; Prize pack index
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
%write8($7E0FCA, $03) ; Prize pack index
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
..end
;-----------------------------
.spooky_action_2
..end
;-----------------------------
.vitty
..end

;===================================================================================================
presetpersistent_nmg_trock:
;-----------------------------
.outside_mire
..end
;-----------------------------
.icerod_overworld
%write_mirror($28, $01, $DA, $0C)
..end
;-----------------------------
.dm
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
%write8($7E02A2, $00) ; slot 4 altitude
%write8($7E0FCC, $06) ; Prize pack index
..end
;-----------------------------
.roller_room
..end
;-----------------------------
.pokey_0
..end
;-----------------------------
.chomps
%write8($7E0FCD, $02) ; Prize pack index
..end
;-----------------------------
.pokey_1
..end
;-----------------------------
.pokeys_2
%write8($7E0FCD, $04) ; Prize pack index
..end
;-----------------------------
.crystaroller
%write8($7E0FCD, $06) ; Prize pack index
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
..end

;===================================================================================================
presetpersistent_nmg_gtower:
;-----------------------------
.outside_trock
..end
;-----------------------------
.entrance
..end
;-----------------------------
.spike_skip
..end
;-----------------------------
.pre_firesnakes_room
..end
;-----------------------------
.bombable_floor
..end
;-----------------------------
.ice_armos
%write8($7E02A2, $00) ; slot 4 altitude
..end
;-----------------------------
.floor_3
%write8($7E0B08, $40) ; Arc variable
%write8($7E0B09, $00) ; Arc variable
..end
;-----------------------------
.mimics1
..end
;-----------------------------
.mimics2
%write8($7E0FCB, $04) ; Prize pack index
..end
;-----------------------------
.spike_room
%write8($7E0FCB, $05) ; Prize pack index
..end
;-----------------------------
.gauntlet
..end
;-----------------------------
.gauntlet3
%write8($7E0FCC, $02) ; Prize pack index
..end
;-----------------------------
.lanmola2
%write8($7E0FCC, $04) ; Prize pack index
..end
;-----------------------------
.wizz1
..end
;-----------------------------
.wizz2
%write8($7E0FC7, $04) ; Prize pack index
..end
;-----------------------------
.torches1
%write8($7E0FC7, $06) ; Prize pack index
..end
;-----------------------------
.torches2
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
presetpersistent_nmg_ganon:
;-----------------------------
.pyramid
%write8($7E0B08, $40) ; ganon bats
%write8($7E0B09, $00) ; ganon bats
..end
;-----------------------------
.pyramid_magic
..end

;===================================================================================================
presetSRAM_nmg:
;-----------------------------
.escape
;-----------------------------
..bed
%write8($7EF36F, $FF) ; Keys
%writeroom($104, $0002)
...end
;-----------------------------
..courtyard
%write8($7EF3C8, $03) ; Spawn point
%write8($7EF359, $01) ; Sword
%write8($7EF35A, $01) ; Shield
%write8($7EF3C5, $01) ; Game state
%write8($7EF3C6, $11) ; Game flags A
%writeroom($055, $000F)
...end
;-----------------------------
..entrance
...end
;-----------------------------
..1st_keyguard
%write8($7EF36F, $00) ; Keys
%writeroom($050, $0005)
%writeroom($060, $0005)
%writeroom($001, $000C)
%writeroom($061, $000F)
...end
;-----------------------------
..stealth_room
%writeroom($072, $840F)
%writeroom($082, $000F)
...end
;-----------------------------
..2nd_keyguard
%writeroom($071, $0002)
%writeroom($081, $000F)
...end
;-----------------------------
..ball_n_chains
%write8($7EF341, $01) ; Boomerang
%writeroom($070, $0008)
%writeroom($071, $841B)
...end
;-----------------------------
..backtracking
%write8($7EF3C8, $02) ; Spawn point
%write8($7EF3CC, $01) ; Follower
%write8($7EF34A, $01) ; Lamp
%write16sram($7EF366, $4000) ; Big keys
%writeroom($080, $043C)
...end
;-----------------------------
..keyguard_revisited
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
..water_rooms
%writeroom($032, $801F)
%writeroom($042, $000C)
...end
;-----------------------------
..keyrat
%writeroom($022, $8003)
%writeroom($021, $0003)
...end
;-----------------------------
..into_sanctuary
%writeroom($011, $2005)
%writeroom($021, $840F)
...end
;-----------------------------
.eastern
;-----------------------------
..before_cutscene
%writeroom($002, $000F)
...end
;-----------------------------
..after_cutscene
%write8($7EF29B, $20) ; Overworld 1B overlay
%write8($7EF3C7, $01) ; Map marker
%write8($7EF3C8, $01) ; Spawn point
%write8($7EF3CC, $00) ; Follower
%write8($7EF3C5, $02) ; Game state
%write8($7EF3C6, $15) ; Game flags A
%writeroom($012, $000F)
...end
;-----------------------------
..octorok
...end
;-----------------------------
..outside_palace
...end
;-----------------------------
..entrance
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
%write8($7EF36E, $10) ; Magic
%writeroom($0A8, $000F)
...end
;-----------------------------
..dark_key_room
%write8($7EF377, $05) ; Arrows
%writeroom($0AA, $000A)
%writeroom($0BA, $0008)
...end
;-----------------------------
..big_key_dmg_boost
%write16sram($7EF360, $15) ; Rupees
%writeroom($0BA, $840C)
%writeroom($0B9, $800F)
...end
;-----------------------------
..big_chest_room_2
%write8($7EF36D, $0C) ; Health
%write16sram($7EF366, $6000) ; Big keys
%writeroom($0A8, $200F)
%writeroom($0B8, $8015)
...end
;-----------------------------
..gwg
%write8($7EF377, $0F) ; Arrows
%write8($7EF340, $02) ; Bow
%writeroom($0A9, $201F)
...end
;-----------------------------
..pot_room
%write8($7EF377, $0E) ; Arrows
%write16sram($7EF360, $1B) ; Rupees
%write8($7EF36E, $20) ; Magic
%writeroom($099, $C403)
...end
;-----------------------------
..zeldagamer_room
%write8($7EF377, $18) ; Arrows
%writeroom($0DA, $0002)
%writeroom($0D9, $0003)
...end
;-----------------------------
..double_reddies
%write8($7EF377, $1A) ; Arrows
%writeroom($0D8, $0001)
...end
;-----------------------------
..armos
%write8($7EF34F, $00) ; Bottles
%write8($7EF377, $16) ; Arrows
%write16sram($7EF360, $1C) ; Rupees
%writeroom($0D8, $0005)
...end
;-----------------------------
.desert
;-----------------------------
..outside_eastern_palace
%write8($7EF377, $04) ; Arrows
%write8($7EF340, $01) ; Bow
%write8($7EF36C, $20) ; Max HP
%write8($7EF374, $04) ; Pendants
%write8($7EF36D, $20) ; Health
%write8($7EF36E, $80) ; Magic
%writeroom($0C8, $0801)
...end
;-----------------------------
..ep_spinspeed
%write8($7EF36F, $FF) ; Keys
%write8($7EF3C7, $03) ; Map marker
%write8($7EF355, $01) ; Boots
%write8($7EF379, $FC) ; Ability
%writeroom($105, $0002)
...end
;-----------------------------
..bridge_screen
...end
;-----------------------------
..unholy_spinspeed
...end
;-----------------------------
..water_dash
%write8($7EF34E, $01) ; Book of Mudora
%writeroom($107, $F002)
...end
;-----------------------------
..outside_desert_palace
...end
;-----------------------------
..desert_entrance
...end
;-----------------------------
..keybonk
%write8($7EF36F, $00) ; Keys
%write8($7EF377, $09) ; Arrows
%write8($7EF340, $02) ; Bow
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
%write8($7EF377, $0E) ; Arrows
%write16sram($7EF366, $7000) ; Big keys
%writeroom($075, $0017)
%writeroom($085, $400E)
...end
;-----------------------------
..desert2_spinspeed
%write8($7EF377, $18) ; Arrows
%write8($7EF354, $01) ; Gloves
%writeroom($073, $041F)
%writeroom($083, $0007)
...end
;-----------------------------
..popo_genocide_room
%write8($7EF37F, $00) ; Key for dungeon $03
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
.hera
;-----------------------------
..outside_desert_palace
%write8($7EF377, $0C) ; Arrows
%write8($7EF36C, $28) ; Max HP
%write8($7EF374, $06) ; Pendants
%write8($7EF36D, $28) ; Health
%write8($7EF36E, $80) ; Magic
%writeroom($033, $0802)
...end
;-----------------------------
..fake_flippers
...end
;-----------------------------
..dm
%write8($7EF36F, $FF) ; Keys
%write8($7EF377, $0B) ; Arrows
%write8($7EF3C8, $05) ; Spawn point
%write8($7EF3CC, $04) ; Follower
%writeroom($0F0, $000F)
%writeroom($0F1, $000F)
...end
;-----------------------------
..after_mirror
%write8($7EF353, $02) ; Magic Mirror
%write8($7EF3C8, $01) ; Spawn point
%write8($7EF3CC, $00) ; Follower
...end
;-----------------------------
..quickhop
...end
;-----------------------------
..entrance
...end
;-----------------------------
..tile_room
%write8($7EF36F, $00) ; Keys
%write8($7EF386, $00) ; Key for dungeon $0A
%writeroom($077, $800F)
%writeroom($087, $0402)
...end
;-----------------------------
..torches
%writeroom($087, $040E)
...end
;-----------------------------
..beetles
%write16sram($7EF366, $7020) ; Big keys
%write8($7EF36E, $70) ; Magic
%write8($7EF386, $00) ; Key for dungeon $0A
%writeroom($087, $041F)
...end
;-----------------------------
..petting_zoo
%write8($7EF343, $01) ; Bombs
%writeroom($031, $800F)
...end
;-----------------------------
..bumper_skip
%write8($7EF357, $01) ; Moon Pearl
%write8($7EF36D, $20) ; Health
%writeroom($027, $001F) ; Room $0027
...end
;-----------------------------
..moldorm
%writeroom($017, $000F)
...end
;-----------------------------
.aga
;-----------------------------
..outside_hera
%write8($7EF3C7, $04) ; Map marker
%write8($7EF36C, $30) ; Max HP
%write8($7EF374, $07) ; Pendants
%write8($7EF36D, $30) ; Health
%write8($7EF36E, $80) ; Magic
%writeroom($007, $080F)
...end
;-----------------------------
..first_rupee_tree
%write8($7EF36F, $FF) ; Keys
%writeroom($0E6, $000F)
%writeroom($0E7, $000F)
...end
;-----------------------------
..lost_woods
%write8($7EF377, $0A) ; Arrows
%write16sram($7EF360, $26) ; Rupees
...end
;-----------------------------
..after_grove
%write8($7EF3C7, $05) ; Map marker
%write8($7EF300, $40) ; Overworld $80: Unknown (..?.....)
%write8($7EF359, $02) ; Sword
...end
;-----------------------------
..after_lost_woods
%write8($7EF3C7, $05) ; Map marker
%write8($7EF300, $40) ; Overworld $80: Unknown (..?.....)
%write16sram($7EF360, $76) ; Rupees
...end
;-----------------------------
..castle_screen
...end
;-----------------------------
..entrance
%write8($7EF29B, $60) ; Overworld $1B: Unknown (..??....)
...end
;-----------------------------
..prize_pack_guards
%write8($7EF36F, $00) ; Keys
%write8($7EF377, $08) ; Arrows
%writeroom($0E0, $000A)
...end
;-----------------------------
..dark_room_of_despair
%writeroom($0D0, $0004)
%writeroom($0E0, $201E)
...end
;-----------------------------
..dark_room_of_melancholy
%writeroom($0C0, $0001)
%writeroom($0D0, $801F)
...end
;-----------------------------
..spear_guards
%writeroom($0C0, $240F)
...end
;-----------------------------
..circle_of_pots
%write8($7EF377, $03) ; Arrows
%writeroom($0B0, $000C)
...end
;-----------------------------
..catwalk
%write8($7EF377, $07) ; Arrows
%write16sram($7EF360, $77) ; Rupees
%writeroom($040, $0001)
%writeroom($0B0, $240F)
...end
;-----------------------------
..agahnim
%writeroom($030, $840A)
%writeroom($040, $000B)
...end
;-----------------------------
.pod
;-----------------------------
..pyramid
%write8($7EF3C7, $06) ; Map marker
%write8($7EF3C5, $03) ; Game state
%write8($7EF282, $20) ; Overworld 02 overlay
%write8($7EF3CA, $40) ; LW/DW
%writeroom($020, $0802)
...end
;-----------------------------
..pod_overworld
...end
;-----------------------------
..entrance
%write8($7EF2DE, $20) ; Overworld 5E overlay
%write16sram($7EF360, $09) ; Rupees
...end
;-----------------------------
..main_hub_small_key
%write8($7EF343, $03) ; Bombs
%write8($7EF36F, $00) ; Keys
%write8($7EF382, $00) ; Key for dungeon $06
%writeroom($009, $0018)
%writeroom($04A, $200F)
...end
;-----------------------------
..main_hub_bk
%write8($7EF343, $04) ; Bombs
%write8($7EF36F, $01) ; Keys
%writeroom($00A, $001F)
%writeroom($03A, $800F)
...end
;-----------------------------
..main_hub_hammeryump
%write8($7EF36F, $00) ; Keys
%write16sram($7EF366, $7220) ; Big keys
%write8($7EF382, $00) ; Key for dungeon $06
%writeroom($00A, $801F)
%writeroom($03A, $801F)
...end
;-----------------------------
..hammeryump
%writeroom($02A, $402F)
...end
;-----------------------------
..before_sexy_statue
%write8($7EF34B, $01) ; Hammer
%write8($7EF36F, $01) ; Keys
%write8($7EF36D, $28) ; Health
%write8($7EF382, $01) ; Key for dungeon $06
%writeroom($019, $802F)
%writeroom($01A, $301A)
...end
;-----------------------------
..sexy_statue_room
%write8($7EF377, $06) ; Arrows
...end
;-----------------------------
..mimics
%write8($7EF343, $06) ; Bombs
%write8($7EF36D, $30) ; Health
%writeroom($02B, $000A)
...end
;-----------------------------
..statue
%write8($7EF377, $07) ; Arrows
%writeroom($01B, $0002)
...end
;-----------------------------
..basement
%write8($7EF377, $06) ; Arrows
%writeroom($01B, $008E)
...end
;-----------------------------
..turtle_room
%write8($7EF36F, $00) ; Keys
%writeroom($00B, $200C)
...end
;-----------------------------
..helma
%writeroom($00B, $200F)
%writeroom($06A, $8005)
...end
;-----------------------------
.thieves
;-----------------------------
..outside_pod
%write8($7EF3C7, $07) ; Map marker
%write8($7EF36C, $38) ; Max HP
%write8($7EF36D, $38) ; Health
%write8($7EF37A, $02) ; Crystals
%write8($7EF382, $00) ; Key for dungeon $06
%writeroom($05A, $0801)
...end
;-----------------------------
..ow_hammerdash
...end
;-----------------------------
..grove
...end
;-----------------------------
..usain_bolt
%write8($7EF34C, $02) ; Flute
%write8($7EF3CA, $00) ; LW/DW
...end
;-----------------------------
..after_activating_flute
%write8($7EF298, $20) ; Overworld 18 overlay
%write8($7EF34C, $03) ; Flute
...end
;-----------------------------
..darkworld
%write8($7EF3CA, $40) ; LW/DW
...end
;-----------------------------
..entrance
%write8($7EF2D8, $20) ; Overworld 58 overlay
%write16sram($7EF360, $0A) ; Rupees
...end
;-----------------------------
..after_big_key
%write8($7EF36F, $00) ; Keys
%write16sram($7EF366, $7230) ; Big keys
%writeroom($0CC, $000F)
%writeroom($0DC, $000F)
%writeroom($0CB, $000F)
%writeroom($0DB, $002F)
...end
;-----------------------------
..blind_hallway
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
..backtracking_1
%write8($7EF343, $05) ; Bombs
%writeroom($065, $0103)
...end
;-----------------------------
..basement
%writeroom($0BC, $C40F)
%writeroom($0BB, $000F)
...end
;-----------------------------
..prison
%writeroom($045, $000A)
...end
;-----------------------------
..after_mitts
%write8($7EF354, $02) ; Gloves
%write8($7EF3CC, $06) ; Follower
%writeroom($044, $4017)
%writeroom($045, $00FF)
...end
;-----------------------------
..pot_hammerdash
%write8($7EF377, $0B) ; Arrows
...end
;-----------------------------
..blind
...end
;-----------------------------
.skull
;-----------------------------
..outside_thieves
%write8($7EF36C, $40) ; Max HP
%write8($7EF3CC, $00) ; Follower
%write8($7EF36D, $40) ; Health
%write8($7EF37A, $22) ; Crystals
%write8($7EF387, $00) ; Key for dungeon $0B
%writeroom($0AC, $0A01)
...end
;-----------------------------
..cursed_dwarf
%write8($7EF343, $04) ; Bombs
%write8($7EF2D8, $22) ; Overworld $58: Unknown (...?...?)
%write16sram($7EF360, $136) ; Rupees
%writeroom($106, $F012)
...end
;-----------------------------
..getting_tempered
%write8($7EF3CC, $07) ; Follower
...end
;-----------------------------
..fence_dash
%write8($7EF3CC, $00) ; Follower
%write8($7EF359, $03) ; Sword
%write8($7EF3C9, $20) ; Game flags B
%write16sram($7EF360, $12C) ; Rupees
%writeroom($121, $0002)
...end
;-----------------------------
..dash_to_sw
%write16sram($7EF360, $258) ; Rupees
%writeroom($11C, $0011)
...end
;-----------------------------
..mummy_room
...end
;-----------------------------
..bomb_jump
%write8($7EF377, $10) ; Arrows
%write16sram($7EF366, $72B0) ; Big keys
%writeroom($057, $001A)
...end
;-----------------------------
..key_pot
%write8($7EF343, $03) ; Bombs
%write8($7EF36F, $00) ; Keys
%write8($7EF345, $01) ; Fire Rod
%write8($7EF36D, $30) ; Health
%write8($7EF343, $04) ; Bombs
%writeroom($056, $0005)
%writeroom($058, $0012)
...end
;-----------------------------
..skull_entrance
%write8($7EF2C0, $20) ; Overworld 40 overlay
%write8($7EF384, $01) ; Key for dungeon $08
%write8($7EF36E, $70) ; Magic
%writeroom($056, $0407)
...end
;-----------------------------
..mummy_hellway
%write8($7EF36F, $00) ; Keys
%writeroom($049, $2002)
%writeroom($059, $800A)
...end
;-----------------------------
..mummy_key
%write8($7EF36E, $30) ; Magic
%writeroom($049, $A00F)
...end
;-----------------------------
..mothula
%writeroom($039, $4402)
...end
;-----------------------------
.ice
;-----------------------------
..outside_skull
%write8($7EF36C, $48) ; Max HP
%write8($7EF384, $00) ; Key for dungeon $08
%write8($7EF36D, $48) ; Health
%write8($7EF36E, $80) ; Magic
%write8($7EF37A, $62) ; Crystals
%writeroom($029, $0801)
%writeroom($039, $4403)
...end
;-----------------------------
..bridge_warp
%write8($7EF3CA, $00) ; LW/DW
...end
;-----------------------------
..lottery
%write8($7EF3CA, $40) ; LW/DW
...end
;-----------------------------
..medallion
...end
;-----------------------------
..zoras_domain
%write8($7EF349, $01) ; Quake Medallion
%write8($7EF3CA, $00) ; LW/DW
...end
;-----------------------------
..tiny_warp
%write8($7EF379, $FE) ; Ability
%write8($7EF356, $01) ; Flippers
%write16sram($7EF360, $64) ; Rupees
...end
;-----------------------------
..ice_entrance
%write8($7EF3CA, $40) ; LW/DW
...end
;-----------------------------
..ice2
%write8($7EF36F, $00) ; Keys
%write8($7EF36E, $70) ; Magic
%writeroom($00E, $0001)
...end
;-----------------------------
..penguin_switch_room
%write8($7EF36E, $60) ; Magic
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
%write8($7EF36D, $40) ; Health
%writeroom($03E, $4407)
...end
;-----------------------------
..penguin_room
%write8($7EF343, $01) ; Bombs
%writeroom($04E, $400C)
...end
;-----------------------------
..lonely_firebar
%write8($7EF36D, $38) ; Health
%writeroom($05E, $0001)
%writeroom($06E, $0004)
...end
;-----------------------------
..last_two_screens
%writeroom($05E, $0003)
%writeroom($07E, $0002)
%writeroom($09E, $0003)
...end
;-----------------------------
..kholdstare
%write8($7EF36E, $80) ; Magic
%writeroom($0BE, $0001)
%writeroom($0CE, $0004)
...end
;-----------------------------
.swamp
;-----------------------------
..outside_ice
%write8($7EF36C, $50) ; Max HP
%write8($7EF36D, $50) ; Health
%write8($7EF385, $00) ; Key for dungeon $09
%write8($7EF37A, $66) ; Crystals
%writeroom($0DE, $0804)
...end
;-----------------------------
..links_house
%write8($7EF3CA, $00) ; LW/DW
...end
;-----------------------------
..swamp_overworld
%write8($7EF3CA, $40) ; LW/DW
...end
;-----------------------------
..dam
%write8($7EF3CA, $00) ; LW/DW
...end
;-----------------------------
..entrance
%write8($7EF2BB, $20) ; Overworld 3B overlay
%write8($7EF2FB, $20) ; Overworld 7B overlay
%write8($7EF3CA, $40) ; LW/DW
%writeroom($028, $0100)
%writeroom($10B, $008F)
...end
;-----------------------------
..first_key_pot
%write8($7EF36F, $00) ; Keys
%writeroom($028, $811F)
...end
;-----------------------------
..hallway_key_1
%write8($7EF343, $01) ; Bombs
%writeroom($037, $1003)
%writeroom($038, $440A)
...end
;-----------------------------
..water_lever_1
%writeroom($037, $340F)
...end
;-----------------------------
..main_hub
%writeroom($037, $348F)
...end
;-----------------------------
..water_lever_2
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
%write16sram($7EF366, $76B0) ; Big keys
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
..water_lever_3
%write8($7EF377, $15) ; Arrows
%writeroom($026, $8007)
...end
;-----------------------------
..restock
%writeroom($066, $0003)
%writeroom($076, $008E)
...end
;-----------------------------
..phelps_way
%write8($7EF343, $02) ; Bombs
%writeroom($016, $000C)
%writeroom($066, $000F)
...end
;-----------------------------
..arrghus
%write8($7EF36D, $48) ; Health
%writeroom($016, $440F)
...end
;-----------------------------
.mire
;-----------------------------
..outside_swamp
%write8($7EF36C, $58) ; Max HP
%write8($7EF36D, $58) ; Health
%write8($7EF381, $00) ; Key for dungeon $05
%write8($7EF37A, $76) ; Crystals
%writeroom($006, $0802)
...end
;-----------------------------
..dm
%write8($7EF2BB, $00) ; Overworld $3B
%write8($7EF2FB, $00) ; Overworld $7B
%write8($7EF3CA, $00) ; LW/DW
%writeroom($10B, $000F)
%writeroom($028, $801F)
...end
;-----------------------------
..free_flutedash
%write8($7EF348, $01) ; Ether Medallion
...end
;-----------------------------
..darkworld_warp
%write8($7EF346, $01) ; Ice Rod
...end
;-----------------------------
..entrance
%write8($7EF2F0, $20) ; Overworld 70 overlay
%write8($7EF36E, $60) ; Magic
%write8($7EF3CA, $40) ; LW/DW
...end
;-----------------------------
..mire2
%write8($7EF36F, $00) ; Keys
%writeroom($098, $0003)
...end
;-----------------------------
..main_hub
%write8($7EF36E, $50) ; Magic
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
%write16sram($7EF366, $77B0) ; Big keys
%write8($7EF36E, $40) ; Magic
%writeroom($097, $010F)
%writeroom($0B1, $0007)
%writeroom($0C1, $C407)
%writeroom($0D1, $001B)
...end
;-----------------------------
..big_chest_room
%write8($7EF36D, $50) ; Health
%writeroom($0C3, $000A)
...end
;-----------------------------
..spike_key
%write8($7EF350, $01) ; Cane of Somaria
%writeroom($0C3, $001F)
...end
;-----------------------------
..wizzrobe
%write8($7EF36D, $38) ; Health
%writeroom($0B3, $841A)
...end
;-----------------------------
..basement
%write16sram($7EF360, $65) ; Rupees
%writeroom($0A2, $800F)
%writeroom($0B2, $800D)
...end
;-----------------------------
..spooky_action_1
%write8($7EF36E, $38) ; Magic
%writeroom($093, $000E)
...end
;-----------------------------
..spooky_action_2
%write8($7EF36E, $28) ; Magic
%writeroom($092, $0005)
...end
;-----------------------------
..vitty
%write8($7EF343, $01) ; Bombs
%write8($7EF377, $14) ; Arrows
%write8($7EF36E, $8) ; Magic
%writeroom($091, $0005)
%writeroom($092, $0007)
%writeroom($0A0, $800F)
...end
;-----------------------------
.trock
;-----------------------------
..outside_mire
%write8($7EF377, $0C) ; Arrows
%write8($7EF383, $00) ; Key for dungeon $07
%write8($7EF36C, $60) ; Max HP
%write8($7EF36D, $60) ; Health
%write8($7EF36E, $80) ; Magic
%write8($7EF37A, $77) ; Crystals
%writeroom($090, $0802)
...end
;-----------------------------
..icerod_overworld
%write8($7EF3CA, $00) ; LW/DW
...end
;-----------------------------
..dm
%write8($7EF2B7, $02) ; Overworld 37 bomb wall
%write8($7EF343, $00) ; Bombs
%write8($7EF346, $01) ; Ice Rod
%writeroom($120, $001A)
...end
;-----------------------------
..squirrels
%write8($7EF36F, $FF) ; Keys
%writeroom($0DF, $0003)
%writeroom($0EF, $0003)
...end
;-----------------------------
..peg_puzzle
...end
;-----------------------------
..entrance
%write8($7EF287, $20) ; Overworld 07 overlay
%write8($7EF2C7, $20) ; Overworld 47 overlay
%write8($7EF36E, $60) ; Magic
%write8($7EF3CA, $40) ; LW/DW
...end
;-----------------------------
..torches
%write8($7EF343, $01) ; Bombs
%write8($7EF36F, $00) ; Keys
%write8($7EF36E, $70) ; Magic
%writeroom($0C6, $000F)
%writeroom($0D6, $8005)
...end
;-----------------------------
..roller_room
%write8($7EF36D, $58) ; Health
%write8($7EF36E, $38) ; Magic
%writeroom($0C7, $000F)
...end
;-----------------------------
..pokey_0
%write8($7EF36D, $40) ; Health
%write8($7EF36E, $30) ; Magic
%writeroom($0C6, $800F)
%writeroom($0B7, $002A)
...end
;-----------------------------
..chomps
%write8($7EF36D, $60) ; Health
%writeroom($0B6, $3402)
...end
;-----------------------------
..pokey_1
%write8($7EF377, $11) ; Arrows
%write8($7EF36E, $28) ; Magic
%writeroom($014, $000F)
%writeroom($015, $000F)
%writeroom($0B6, $B41A)
...end
;-----------------------------
..pokeys_2
%write16sram($7EF360, $79) ; Rupees
%write16sram($7EF366, $77B8) ; Big keys
%write8($7EF36E, $78) ; Magic
%writeroom($013, $8405)
%writeroom($014, $401F)
...end
;-----------------------------
..crystaroller
%writeroom($014, $C01F)
%writeroom($024, $800C)
...end
;-----------------------------
..dark_maze
%writeroom($004, $C01A)
...end
;-----------------------------
..laser_skip
%write8($7EF36D, $58) ; Health
%write8($7EF36E, $70) ; Magic
%writeroom($0B5, $000F)
%writeroom($0C5, $000A)
...end
;-----------------------------
..switch_room
%writeroom($0C5, $800A)
%writeroom($0D5, $008A)
...end
;-----------------------------
..trinexx
%write8($7EF36E, $60) ; Magic
%writeroom($0B4, $800F)
%writeroom($0C4, $800F)
...end
;-----------------------------
.gtower
;-----------------------------
..outside_trock
%write8($7EF3C7, $08) ; Map marker
%write8($7EF36C, $68) ; Max HP
%write8($7EF36D, $68) ; Health
%write8($7EF36E, $80) ; Magic
%write8($7EF37A, $7F) ; Crystals
%writeroom($0A4, $0802)
...end
;-----------------------------
..entrance
%write8($7EF2C3, $20) ; Overworld 43 overlay
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
%write8($7EF377, $16) ; Arrows
%write8($7EF36D, $60) ; Health
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
..floor_3
%write8($7EF377, $0E) ; Arrows
%write8($7EF389, $01) ; Key for dungeon $0D
%write16sram($7EF366, $77BC) ; Big keys
%writeroom($01C, $0035)
...end
;-----------------------------
..mimics1
%write8($7EF377, $0D) ; Arrows
%write8($7EF36D, $48) ; Health
%writeroom($06B, $000C)
...end
;-----------------------------
..mimics2
%write8($7EF377, $0E) ; Arrows
%writeroom($06B, $000E)
...end
;-----------------------------
..spike_room
%write8($7EF377, $0A) ; Arrows
%writeroom($06B, $800F)
...end
;-----------------------------
..gauntlet
%writeroom($05B, $8005)
%writeroom($05C, $000C)
...end
;-----------------------------
..gauntlet3
%write8($7EF377, $08) ; Arrows
%writeroom($05D, $000C)
...end
;-----------------------------
..lanmola2
%write8($7EF36D, $40) ; Health
%write8($7EF36E, $70) ; Magic
%writeroom($05D, $000E)
%writeroom($06C, $0001)
%writeroom($06D, $000A)
...end
;-----------------------------
..wizz1
%write8($7EF36E, $20) ; Magic
%writeroom($06C, $000B)
...end
;-----------------------------
..wizz2
%write8($7EF36D, $48) ; Health
%write8($7EF36E, $18) ; Magic
%writeroom($0A5, $000B)
...end
;-----------------------------
..torches1
%write8($7EF36E, $10) ; Magic
%writeroom($095, $0005)
%writeroom($0A5, $000F)
...end
;-----------------------------
..torches2
%write8($7EF36E, $80) ; Magic
%writeroom($096, $000B)
...end
;-----------------------------
..helma_key
%write8($7EF36E, $40) ; Magic
%writeroom($03D, $0001)
...end
;-----------------------------
..bombable_wall
%write8($7EF36D, $40) ; Health
%writeroom($03D, $4405)
...end
;-----------------------------
..moldorm_2
%write8($7EF343, $00) ; Bombs
%write8($7EF36F, $00) ; Keys
%write8($7EF36D, $38) ; Health
%writeroom($03D, $740F)
...end
;-----------------------------
..agahnim_2
%writeroom($04C, $0005)
%writeroom($01D, $800C)
%writeroom($04D, $800F)
...end
;-----------------------------
.ganon
;-----------------------------
..pyramid
%write8($7EF2DB, $20) ; Overworld 5B overlay
%write8($7EF389, $00) ; Key for dungeon $0D
%writeroom($00D, $0802)
...end
;-----------------------------
..pyramid_magic
%write8($7EF36E, $80) ; Magic
...end
;===================================================================================================
presetend_nmg:
print "nmg size: $", hex(presetend_nmg-presetheader_nmg)