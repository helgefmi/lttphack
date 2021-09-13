;===================================================================================================
; PRESET DATA HEADER
;===================================================================================================
presetheader_adold:
	dw presetSRAM_adold ; location of SRAM
	dw presetpersistent_adold ; location of persistent data

;===================================================================================================
%menu_header("All Dungeons RMG (old)", 15)
	%submenu("Escape", presetmenu_adold_escape)
	%submenu("Eastern Palace", presetmenu_adold_eastern)
	%submenu("Palace of Darkness", presetmenu_adold_pod)
	%submenu("Hera Tower", presetmenu_adold_hera)
	%submenu("Thieves' Town", presetmenu_adold_thieves)
	%submenu("Skull Woods", presetmenu_adold_skull)
	%submenu("Desert Palace", presetmenu_adold_desert)
	%submenu("Misery Mire", presetmenu_adold_mire)
	%submenu("Swamp Palace", presetmenu_adold_swamp)
	%submenu("Ice Palace", presetmenu_adold_ice)
	%submenu("Turtle Rock", presetmenu_adold_trock)
	%submenu("Ganon's Tower", presetmenu_adold_gtower)
	%submenu("Agahnim's Tower", presetmenu_adold_aga)
	%submenu("Ganon", presetmenu_adold_ganon)
	%submenu("Bosses", presetmenu_adold_boss)

;===================================================================================================
;-------------------------------------------------------------------------------
; HYRULE CASTLE
;-------------------------------------------------------------------------------
;===================================================================================================
presetmenu_adold_escape:
%menu_header("Escape", 14)

;-------------------------------------------------------------------------------
%preset_UW("Link's Bed", "adold", "escape", "links_bed")
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

;-------------------------------------------------------------------------------
%preset_UW("Courtyard", "adold", "escape", "courtyard")
dw $0055 ; Screen ID
dw $0A78, $0BD9 ; Link Coords
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

;-------------------------------------------------------------------------------
%preset_OW("Entrance", "adold", "escape", "entrance")
dw $001B ; Screen ID
dw $07F8, $06F9 ; Link Coords
dw $0784, $069B ; Camera HV
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $0803, $0708 ; Scroll X,Y
dw $0532 ; Tilemap position
;dw $0005 ; Scroll mod Y
;dw $000A ; Scroll mod X
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("1st Key Guard", "adold", "escape", "1st_key_guard")
dw $0001 ; Screen ID
dw $02F8, $005A ; Link Coords
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

;-------------------------------------------------------------------------------
%preset_UW("Stealth Room", "adold", "escape", "stealth_room")
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

;-------------------------------------------------------------------------------
%preset_UW("2nd Key Guard", "adold", "escape", "2nd_key_guard")
dw $0071 ; Screen ID
dw $02AD, $0F79 ; Link Coords
dw $0200, $0F0C ; Camera HV
db $00 ; Item
db $06 ; Link direction
;-----------------------------
db $04 ; Entrance
db $2F ; Room layout / Floor
db $8C ; Door / Peg state / Layer
dw $0001 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Ball 'n Chains", "adold", "escape", "ball_n_chains")
dw $0070 ; Screen ID
dw $0050, $0E2B ; Link Coords
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

;-------------------------------------------------------------------------------
%preset_UW("Backtracking", "adold", "escape", "backtracking")
dw $0080 ; Screen ID
dw $0050, $102D ; Link Coords
dw $0000, $1000 ; Camera HV
db $02 ; Item
db $00 ; Link direction
;-----------------------------
db $04 ; Entrance
db $8D ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0004 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Key Guard Revisit", "adold", "escape", "key_guard_revisit")
dw $0072 ; Screen ID
dw $04F8, $0F29 ; Link Coords
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

;-------------------------------------------------------------------------------
%preset_UW("Throne Room", "adold", "escape", "throne_room")
dw $0061 ; Screen ID
dw $02F8, $0C2C ; Link Coords
dw $0280, $0C00 ; Camera HV
db $02 ; Item
db $00 ; Link direction
;-----------------------------
db $04 ; Entrance
db $C0 ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Snake Avoidance", "adold", "escape", "snake_avoidance")
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

;-------------------------------------------------------------------------------
%preset_UW("Sewer Rooms", "adold", "escape", "sewer_rooms")
dw $0032 ; Screen ID
dw $04F8, $062A ; Link Coords
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

;-------------------------------------------------------------------------------
%preset_UW("Keyrat", "adold", "escape", "keyrat")
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

;-------------------------------------------------------------------------------
%preset_UW("Into Sanctuary", "adold", "escape", "into_sanctuary")
dw $0011 ; Screen ID
dw $0378, $022E ; Link Coords
dw $0300, $0200 ; Camera HV
db $02 ; Item
db $00 ; Link direction
;-----------------------------
db $04 ; Entrance
db $5F ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0020 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FDFC2, $0001) ; Room $21 sprite deaths
%write_end()

;===================================================================================================
;-------------------------------------------------------------------------------
; EASTERN PALACE
;-------------------------------------------------------------------------------
;===================================================================================================
presetmenu_adold_eastern:
%menu_header("Eastern Palace", 13)

;-------------------------------------------------------------------------------
%preset_UW("Before Cutscene", "adold", "eastern", "before_cutscene")
dw $0002 ; Screen ID
dw $04F8, $01B8 ; Link Coords
dw $0480, $0110 ; Camera HV
db $02 ; Item
db $02 ; Link direction
;-----------------------------
db $04 ; Entrance
db $A0 ; Room layout / Floor
db $8D ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write8_enable()
%write8($7E0642, $01) ; Room puzzle state
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Link's House", "adold", "eastern", "links_house")
dw $0104 ; Screen ID
dw $0978, $2178 ; Link Coords
dw $0900, $2110 ; Camera HV
db $02 ; Item
db $02 ; Link direction
;-----------------------------
db $00 ; Entrance
db $20 ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_OW("EP Overworld", "adold", "eastern", "ep_overworld")
dw $002E ; Screen ID
dw $0C90, $0A06 ; Link Coords
dw $0C1E, $0A00 ; Camera HV
db $02 ; Item
db $06 ; Link direction
;-----------------------------
dw $0C9B, $0A6D ; Scroll X,Y
dw $0002 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $FFF2 ; Scroll mod X
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Entrance", "adold", "eastern", "entrance")
dw $00C9 ; Screen ID
dw $12F8, $19D8 ; Link Coords
dw $1280, $1910 ; Camera HV
db $02 ; Item
db $00 ; Link direction
;-----------------------------
db $08 ; Entrance
db $A0 ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Stalfos Room", "adold", "eastern", "stalfos_room")
dw $00A8 ; Screen ID
dw $1125, $1578 ; Link Coords
dw $1100, $150B ; Camera HV
db $02 ; Item
db $04 ; Link direction
;-----------------------------
db $08 ; Entrance
db $70 ; Room layout / Floor
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Big Chest Room 1", "adold", "eastern", "big_chest_room_1")
dw $00A8 ; Screen ID
dw $11BB, $1478 ; Link Coords
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

;-------------------------------------------------------------------------------
%preset_UW("Dark Key Room", "adold", "eastern", "dark_key_room")
dw $00BA ; Screen ID
dw $14C8, $167B ; Link Coords
dw $1400, $160E ; Camera HV
db $02 ; Item
db $00 ; Link direction
;-----------------------------
db $08 ; Entrance
db $00 ; Room layout / Floor
db $80 ; Door / Peg state / Layer
dw $0010 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Big Key Damage Boost", "adold", "eastern", "big_key_dmg_boost")
dw $00B9 ; Screen ID
dw $1224, $1678 ; Link Coords
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
%write16($7FE0F4, $0001) ; Room $BA sprite deaths
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Big Chest Room 2", "adold", "eastern", "big_chest_room_2")
dw $00A8 ; Screen ID
dw $11B9, $1478 ; Link Coords
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

;-------------------------------------------------------------------------------
%preset_UW("Gifted with Greenies", "adold", "eastern", "gifted_with_greenies")
dw $00A9 ; Screen ID
dw $12F8, $1423 ; Link Coords
dw $1280, $1400 ; Camera HV
db $02 ; Item
db $00 ; Link direction
;-----------------------------
db $08 ; Entrance
db $C0 ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Pot Room", "adold", "eastern", "pot_room")
dw $0099 ; Screen ID
dw $1278, $132D ; Link Coords
dw $1200, $1300 ; Camera HV
db $03 ; Item
db $00 ; Link direction
;-----------------------------
db $08 ; Entrance
db $A0 ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0008 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Zeldagamer Room", "adold", "eastern", "zeldagamer_room")
dw $00D9 ; Screen ID
dw $1228, $1B79 ; Link Coords
dw $1200, $1B0C ; Camera HV
db $03 ; Item
db $02 ; Link direction
;-----------------------------
db $08 ; Entrance
db $21 ; Room layout / Floor
db $80 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Armos", "adold", "eastern", "armos")
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
;-------------------------------------------------------------------------------
; PALACE OF DARKNESS
;-------------------------------------------------------------------------------
;===================================================================================================
presetmenu_adold_pod:
%menu_header("Palace of Darkness", 16)

;-------------------------------------------------------------------------------
%preset_OW("Outside EP", "adold", "pod", "outside_ep")
dw $001E ; Screen ID
dw $0F50, $062C ; Link Coords
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

;-------------------------------------------------------------------------------
%preset_UW("Sanctuary", "adold", "pod", "sanctuary")
dw $0012 ; Screen ID
dw $04F8, $029A ; Link Coords
dw $0480, $022F ; Camera HV
db $03 ; Item
db $00 ; Link direction
;-----------------------------
db $02 ; Entrance
db $C0 ; Room layout / Floor
db $08 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_OW("DMA", "adold", "pod", "dma")
dw $0012 ; Screen ID
dw $05E2, $0584 ; Link Coords
dw $0500, $051E ; Camera HV
db $03 ; Item
db $04 ; Link direction
;-----------------------------
dw $0585, $058B ; Scroll X,Y
dw $08A0 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $0000 ; Scroll mod X
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Death Mountain", "adold", "pod", "death_mountain")
dw $00F1 ; Screen ID
dw $0378, $1FBA ; Link Coords
dw $0300, $1F10 ; Camera HV
db $03 ; Item
db $02 ; Link direction
;-----------------------------
db $07 ; Entrance
db $F0 ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0001 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_OW("After Mirror", "adold", "pod", "after_mirror")
dw $0003 ; Screen ID
dw $0718, $03C0 ; Link Coords
dw $06A4, $031E ; Camera HV
db $03 ; Item
db $06 ; Link direction
;-----------------------------
dw $0723, $038D ; Scroll X,Y
dw $1816 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $FFFC ; Scroll mod X
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_OW("Kiki Skip", "adold", "pod", "kiki_skip")
dw $0003 ; Screen ID
dw $0748, $0635 ; Link Coords
dw $06D4, $031E ; Camera HV
db $03 ; Item
db $00 ; Link direction
;-----------------------------
dw $0753, $038D ; Scroll X,Y
dw $181C ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $FFFC ; Scroll mod X
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Dungeon Reload", "adold", "pod", "dungeon_reload")
dw $004A ; Screen ID
dw $14F8, $09D8 ; Link Coords
dw $1480, $0910 ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $26 ; Entrance
db $A0 ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Main Hub (Big Key)", "adold", "pod", "main_hub_bk")
dw $004A ; Screen ID
dw $14F8, $081E ; Link Coords
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

;-------------------------------------------------------------------------------
%preset_UW("Main Hub (Hammerjump)", "adold", "pod", "main_hub_hammerjump")
dw $004A ; Screen ID
dw $14F8, $0820 ; Link Coords
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

;-------------------------------------------------------------------------------
%preset_UW("Hammerjump", "adold", "pod", "hammerjump")
dw $002A ; Screen ID
dw $1478, $041C ; Link Coords
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

;-------------------------------------------------------------------------------
%preset_UW("Archery Contest", "adold", "pod", "archery_contest")
dw $003A ; Screen ID
dw $1578, $0624 ; Link Coords
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

;-------------------------------------------------------------------------------
%preset_UW("Mimics", "adold", "pod", "mimics")
dw $002B ; Screen ID
dw $1678, $041E ; Link Coords
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

;-------------------------------------------------------------------------------
%preset_UW("Statue", "adold", "pod", "statue")
dw $001B ; Screen ID
dw $1678, $031C ; Link Coords
dw $1600, $0300 ; Camera HV
db $03 ; Item
db $00 ; Link direction
;-----------------------------
db $26 ; Entrance
db $20 ; Room layout / Floor
db $C1 ; Door / Peg state / Layer
dw $0038 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Basement", "adold", "pod", "basement")
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

;-------------------------------------------------------------------------------
%preset_UW("Turtle Room", "adold", "pod", "turtle_room")
dw $000B ; Screen ID
dw $1678, $00D4 ; Link Coords
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

;-------------------------------------------------------------------------------
%preset_UW("Helmasaur", "adold", "pod", "helma")
dw $006A ; Screen ID
dw $1578, $0C1C ; Link Coords
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
;-------------------------------------------------------------------------------
; HERA TOWER
;-------------------------------------------------------------------------------
;===================================================================================================
presetmenu_adold_hera:
%menu_header("Hera Tower", 8)

;-------------------------------------------------------------------------------
%preset_OW("Outside PoD", "adold", "hera", "outside_pod")
dw $005E ; Screen ID
dw $0F50, $063B ; Link Coords
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

;-------------------------------------------------------------------------------
%preset_UW("Old Man Cave", "adold", "hera", "old_man_cave")
dw $00E4 ; Screen ID
dw $0878, $1D98 ; Link Coords
dw $0800, $1D10 ; Camera HV
db $03 ; Item
db $02 ; Link direction
;-----------------------------
db $30 ; Entrance
db $60 ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Entrance", "adold", "hera", "entrance")
dw $0077 ; Screen ID
dw $0EF8, $0FBF ; Link Coords
dw $0E80, $0F10 ; Camera HV
db $03 ; Item
db $00 ; Link direction
;-----------------------------
db $33 ; Entrance
db $E1 ; Room layout / Floor
db $0D ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Tile Room", "adold", "hera", "tile_room")
dw $0077 ; Screen ID
dw $0E78, $0E42 ; Link Coords
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

;-------------------------------------------------------------------------------
%preset_UW("Torches", "adold", "hera", "torches")
dw $0087 ; Screen ID
dw $0F78, $10D4 ; Link Coords
dw $0F00, $1010 ; Camera HV
db $09 ; Item
db $02 ; Link direction
;-----------------------------
db $33 ; Entrance
db $10 ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Beetles", "adold", "hera", "beetles")
dw $0077 ; Screen ID
dw $0F68, $0F55 ; Link Coords
dw $0EF0, $0EE9 ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $33 ; Entrance
db $F1 ; Room layout / Floor
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Petting Zoo", "adold", "hera", "petting_zoo")
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

;-------------------------------------------------------------------------------
%preset_UW("Moldorm", "adold", "hera", "moldorm")
dw $0017 ; Screen ID
dw $0FA8, $027D ; Link Coords
dw $0F00, $0210 ; Camera HV
db $04 ; Item
db $00 ; Link direction
;-----------------------------
db $33 ; Entrance
db $D4 ; Room layout / Floor
db $40 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;-------------------------------------------------------------------------------
; THIEVES' TOWN
;-------------------------------------------------------------------------------
;===================================================================================================
presetmenu_adold_thieves:
%menu_header("Thieves' Town", 14)

;-------------------------------------------------------------------------------
%preset_OW("Outside Hera", "adold", "thieves", "outside_hera")
dw $0003 ; Screen ID
dw $08F0, $007C ; Link Coords
dw $087C, $0018 ; Camera HV
db $04 ; Item
db $02 ; Link direction
;-----------------------------
dw $08FB, $0087 ; Scroll X,Y
dw $0050 ; Tilemap position
;dw $0006 ; Scroll mod Y
;dw $FFF4 ; Scroll mod X
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_OW("DMD", "adold", "thieves", "dmd")
dw $0043 ; Screen ID
dw $0904, $0164 ; Link Coords
dw $0890, $0103 ; Camera HV
db $04 ; Item
db $06 ; Link direction
;-----------------------------
dw $090F, $0172 ; Scroll X,Y
dw $0754 ; Tilemap position
;dw $FFFB ; Scroll mod Y
;dw $0000 ; Scroll mod X
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Entrance", "adold", "thieves", "entrance")
dw $00DB ; Screen ID
dw $16F8, $1BD7 ; Link Coords
dw $1680, $1B10 ; Camera HV
db $04 ; Item
db $00 ; Link direction
;-----------------------------
db $34 ; Entrance
db $EF ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("After Big Key", "adold", "thieves", "after_big_key")
dw $00DB ; Screen ID
dw $17BF, $1B68 ; Link Coords
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

;-------------------------------------------------------------------------------
%preset_UW("Stalfos Hallway", "adold", "thieves", "stalfos_hallway")
dw $00CC ; Screen ID
dw $1978, $1821 ; Link Coords
dw $1900, $1800 ; Camera HV
db $04 ; Item
db $00 ; Link direction
;-----------------------------
db $34 ; Entrance
db $DF ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Conveyor Gibos", "adold", "thieves", "conveyor_gibos")
dw $00BC ; Screen ID
dw $1818, $1778 ; Link Coords
dw $1800, $170B ; Camera HV
db $04 ; Item
db $04 ; Link direction
;-----------------------------
db $34 ; Entrance
db $2F ; Room layout / Floor
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Hellway", "adold", "thieves", "hellway")
dw $00BB ; Screen ID
dw $1717, $1778 ; Link Coords
dw $1700, $170B ; Camera HV
db $04 ; Item
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

;-------------------------------------------------------------------------------
%preset_UW("Bombable Floor", "adold", "thieves", "bomb_floor")
dw $0065 ; Screen ID
dw $0ADC, $0D78 ; Link Coords
dw $0A00, $0D0B ; Camera HV
db $04 ; Item
db $06 ; Link direction
;-----------------------------
db $34 ; Entrance
db $20 ; Room layout / Floor
db $42 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE048, $0040) ; Room $64 sprite deaths
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Backtracking", "adold", "thieves", "backtracking")
dw $0064 ; Screen ID
dw $0878, $0D2D ; Link Coords
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

;-------------------------------------------------------------------------------
%preset_UW("Basement", "adold", "thieves", "basement")
dw $00BC ; Screen ID
dw $1878, $162C ; Link Coords
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

;-------------------------------------------------------------------------------
%preset_UW("Prison", "adold", "thieves", "prison")
dw $0045 ; Screen ID
dw $0AD8, $0978 ; Link Coords
dw $0A00, $090B ; Camera HV
db $04 ; Item
db $06 ; Link direction
;-----------------------------
db $34 ; Entrance
db $2E ; Room layout / Floor
db $42 ; Door / Peg state / Layer
dw $000E ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE008, $0080) ; Room $44 sprite deaths
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Go Back Upstairs", "adold", "thieves", "backtracking_2")
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
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Pot Hammerdash", "adold", "thieves", "pot_hammerdash")
dw $0045 ; Screen ID
dw $0A78, $082D ; Link Coords
dw $0A00, $0800 ; Camera HV
db $04 ; Item
db $00 ; Link direction
;-----------------------------
db $34 ; Entrance
db $0E ; Room layout / Floor
db $40 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Blind", "adold", "thieves", "blind")
dw $00BC ; Screen ID
dw $1978, $161C ; Link Coords
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
;-------------------------------------------------------------------------------
; SKULL WOODS
;-------------------------------------------------------------------------------
;===================================================================================================
presetmenu_adold_skull:
%menu_header("Skull Woods", 12)

;-------------------------------------------------------------------------------
%preset_OW("Outside Thieves'", "adold", "skull", "outside_thieves")
dw $0058 ; Screen ID
dw $01F8, $07BC ; Link Coords
dw $0176, $075E ; Camera HV
db $04 ; Item
db $02 ; Link direction
;-----------------------------
dw $0203, $07CB ; Scroll X,Y
dw $0B2E ; Tilemap position
;dw $0002 ; Scroll mod Y
;dw $FFFA ; Scroll mod X
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_OW("Cursed Dwarf", "adold", "skull", "cursed_dwarf")
dw $0058 ; Screen ID
dw $0350, $09E3 ; Link Coords
dw $02CE, $091E ; Camera HV
db $14 ; Item
db $02 ; Link direction
;-----------------------------
dw $035B, $098B ; Scroll X,Y
dw $1858 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $FFF2 ; Scroll mod X
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_OW("Getting Tempered", "adold", "skull", "getting_tempered")
dw $0058 ; Screen ID
dw $03E6, $0918 ; Link Coords
dw $0300, $08B4 ; Camera HV
db $14 ; Item
db $06 ; Link direction
;-----------------------------
dw $0385, $0923 ; Scroll X,Y
dw $1560 ; Tilemap position
;dw $000A ; Scroll mod Y
;dw $0000 ; Scroll mod X
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_OW("Fencedash", "adold", "skull", "fencedash")
dw $0062 ; Screen ID
dw $0408, $0910 ; Link Coords
dw $0400, $08B0 ; Camera HV
db $14 ; Item
db $04 ; Link direction
;-----------------------------
dw $047D, $091F ; Scroll X,Y
dw $0480 ; Tilemap position
;dw $FFFE ; Scroll mod Y
;dw $0000 ; Scroll mod X
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_OW("Dash to Skull Woods", "adold", "skull", "dash_to_skull_woods")
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

;-------------------------------------------------------------------------------
%preset_OW("Mummy Room", "adold", "skull", "mummy_room")
dw $0040 ; Screen ID
dw $0248, $024C ; Link Coords
dw $01CA, $01EC ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
dw $024F, $025B ; Scroll X,Y
dw $0EBA ; Tilemap position
;dw $0002 ; Scroll mod Y
;dw $0006 ; Scroll mod X
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_OW("Bomb Jump", "adold", "skull", "bomb_jump")
dw $0040 ; Screen ID
dw $02E8, $025C ; Link Coords
dw $0266, $01FE ; Camera HV
db $01 ; Item
db $00 ; Link direction
;-----------------------------
dw $02F3, $026B ; Scroll X,Y
dw $0F4E ; Tilemap position
;dw $0002 ; Scroll mod Y
;dw $000A ; Scroll mod X
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Key Pot", "adold", "skull", "key_pot")
dw $0056 ; Screen ID
dw $0D16, $0B78 ; Link Coords
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

;-------------------------------------------------------------------------------
%preset_OW("Skull Entrance", "adold", "skull", "skull_entrance")
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

;-------------------------------------------------------------------------------
%preset_UW("Mummy Hellway", "adold", "skull", "mummy_hellway")
dw $0049 ; Screen ID
dw $12D7, $0978 ; Link Coords
dw $1200, $090B ; Camera HV
db $05 ; Item
db $06 ; Link direction
;-----------------------------
db $2B ; Entrance
db $2F ; Room layout / Floor
db $02 ; Door / Peg state / Layer
dw $0400 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE032, $0003) ; Room $59 sprite deaths
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Mummy Key", "adold", "skull", "mummy_key")
dw $0049 ; Screen ID
dw $1278, $081F ; Link Coords
dw $1200, $0800 ; Camera HV
db $05 ; Item
db $00 ; Link direction
;-----------------------------
db $2B ; Entrance
db $0F ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0C01 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Mothula", "adold", "skull", "mothula")
dw $0039 ; Screen ID
dw $12CC, $0778 ; Link Coords
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
;-------------------------------------------------------------------------------
; DESERT PALACE
;-------------------------------------------------------------------------------
;===================================================================================================
presetmenu_adold_desert:
%menu_header("Desert Palace", 13)

;-------------------------------------------------------------------------------
%preset_OW("Outside Skull", "adold", "desert", "outside_skull")
dw $0040 ; Screen ID
dw $0098, $00CB ; Link Coords
dw $0016, $0069 ; Camera HV
db $05 ; Item
db $02 ; Link direction
;-----------------------------
dw $00A3, $00D6 ; Scroll X,Y
dw $0282 ; Tilemap position
;dw $0007 ; Scroll mod Y
;dw $FFFA ; Scroll mod X
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_OW("Ether", "adold", "desert", "ether")
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

;-------------------------------------------------------------------------------
%preset_OW("Bridge Hammerdash", "adold", "desert", "bridge_hammerdash")
dw $0003 ; Screen ID
dw $09E4, $0078 ; Link Coords
dw $0900, $0018 ; Camera HV
db $04 ; Item
db $06 ; Link direction
;-----------------------------
dw $097F, $0087 ; Scroll X,Y
dw $0160 ; Tilemap position
;dw $0008 ; Scroll mod Y
;dw $0000 ; Scroll mod X
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_OW("Zora DMD", "adold", "desert", "zora_dmd")
dw $0005 ; Screen ID
dw $0DE4, $0077 ; Link Coords
dw $0D00, $0013 ; Camera HV
db $04 ; Item
db $06 ; Link direction
;-----------------------------
dw $0D7D, $0082 ; Scroll X,Y
dw $0160 ; Tilemap position
;dw $000D ; Scroll mod Y
;dw $0000 ; Scroll mod X
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Link's House", "adold", "desert", "links_house")
dw $0104 ; Screen ID
dw $0978, $2178 ; Link Coords
dw $0900, $2110 ; Camera HV
db $03 ; Item
db $02 ; Link direction
;-----------------------------
db $00 ; Entrance
db $20 ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_OW("Swamp Warp", "adold", "desert", "swamp_warp")
dw $0034 ; Screen ID
dw $0808, $0C78 ; Link Coords
dw $0800, $0C1A ; Camera HV
db $04 ; Item
db $04 ; Link direction
;-----------------------------
dw $088D, $0C87 ; Scroll X,Y
dw $0080 ; Tilemap position
;dw $FFF6 ; Scroll mod Y
;dw $0000 ; Scroll mod X
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_OW("Fluteless Mire", "adold", "desert", "fluteless_mire")
dw $0073 ; Screen ID
dw $060C, $0CC1 ; Link Coords
dw $0600, $0C61 ; Camera HV
db $01 ; Item
db $04 ; Link direction
;-----------------------------
dw $0685, $0CCE ; Scroll X,Y
dw $0300 ; Tilemap position
;dw $FFFF ; Scroll mod Y
;dw $0000 ; Scroll mod X
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Desert Entrance", "adold", "desert", "desert_entrance")
dw $0083 ; Screen ID
dw $0678, $11D6 ; Link Coords
dw $0600, $1110 ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $0B ; Entrance
db $2F ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Torch Key", "adold", "desert", "torch_key")
dw $0073 ; Screen ID
dw $0778, $0F1F ; Link Coords
dw $0700, $0F00 ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $0B ; Entrance
db $3F ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Pre Cannonball Room", "adold", "desert", "pre_cannonball_room")
dw $0085 ; Screen ID
dw $0AD7, $1078 ; Link Coords
dw $0A00, $100B ; Camera HV
db $14 ; Item
db $06 ; Link direction
;-----------------------------
db $0B ; Entrance
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

;-------------------------------------------------------------------------------
%preset_UW("Desert 2 Spinspeed", "adold", "desert", "desert_2_spinspeed")
dw $0083 ; Screen ID
dw $0678, $11E2 ; Link Coords
dw $0600, $1110 ; Camera HV
db $14 ; Item
db $02 ; Link direction
;-----------------------------
db $0B ; Entrance
db $2F ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Torches", "adold", "desert", "torches")
dw $0043 ; Screen ID
dw $0778, $0920 ; Link Coords
dw $0700, $0900 ; Camera HV
db $05 ; Item
db $00 ; Link direction
;-----------------------------
db $0C ; Entrance
db $31 ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE026, $06E0) ; Room $53 sprite deaths
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Lanmolas", "adold", "desert", "lanmolas")
dw $0043 ; Screen ID
dw $0678, $0821 ; Link Coords
dw $0600, $0800 ; Camera HV
db $05 ; Item
db $00 ; Link direction
;-----------------------------
db $0C ; Entrance
db $81 ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;-------------------------------------------------------------------------------
; MISERY MIRE
;-------------------------------------------------------------------------------
;===================================================================================================
presetmenu_adold_mire:
%menu_header("Misery Mire", 18)

;-------------------------------------------------------------------------------
%preset_OW("Outside Desert", "adold", "mire", "outside_desert")
dw $0030 ; Screen ID
dw $0128, $0C3C ; Link Coords
dw $00A2, $0C00 ; Camera HV
db $05 ; Item
db $02 ; Link direction
;-----------------------------
dw $012F, $0C6D ; Scroll X,Y
dw $0016 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $000E ; Scroll mod X
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_OW("Entrance", "adold", "mire", "entrance")
dw $0070 ; Screen ID
dw $0128, $0CDA ; Link Coords
dw $00A6, $0C76 ; Camera HV
db $10 ; Item
db $00 ; Link direction
;-----------------------------
dw $0133, $0CE5 ; Scroll X,Y
dw $0414 ; Tilemap position
;dw $000A ; Scroll mod Y
;dw $FFFA ; Scroll mod X
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Mire 2", "adold", "mire", "mire_2")
dw $0098 ; Screen ID
dw $1188, $132B ; Link Coords
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

;-------------------------------------------------------------------------------
%preset_UW("Main Hub", "adold", "mire", "main_hub")
dw $00D2 ; Screen ID
dw $0578, $1A2F ; Link Coords
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

;-------------------------------------------------------------------------------
%preset_UW("Spike Key", "adold", "mire", "spike_key")
dw $00B2 ; Screen ID
dw $05D7, $1778 ; Link Coords
dw $0500, $170B ; Camera HV
db $05 ; Item
db $06 ; Link direction
;-----------------------------
db $27 ; Entrance
db $3F ; Room layout / Floor
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Beat the Fireball", "adold", "mire", "beat_the_fireball")
dw $00B2 ; Screen ID
dw $0578, $17D5 ; Link Coords
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

;-------------------------------------------------------------------------------
%preset_UW("Bari Switch", "adold", "mire", "bari_switch")
dw $00C2 ; Screen ID
dw $0418, $1978 ; Link Coords
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

;-------------------------------------------------------------------------------
%preset_UW("Sluggulas", "adold", "mire", "sluggulas")
dw $00C1 ; Screen ID
dw $0278, $19D2 ; Link Coords
dw $0200, $1910 ; Camera HV
db $05 ; Item
db $02 ; Link direction
;-----------------------------
db $27 ; Entrance
db $2F ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0200 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Torches", "adold", "mire", "torches")
dw $00D1 ; Screen ID
dw $02A8, $1A2D ; Link Coords
dw $0200, $1A00 ; Camera HV
db $05 ; Item
db $00 ; Link direction
;-----------------------------
db $27 ; Entrance
db $0F ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Backtracking", "adold", "mire", "backtracking")
dw $00C1 ; Screen ID
dw $03D5, $1878 ; Link Coords
dw $0300, $180B ; Camera HV
db $05 ; Item
db $06 ; Link direction
;-----------------------------
db $27 ; Entrance
db $1F ; Room layout / Floor
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Mire to Hera Clip", "adold", "mire", "mire_to_hera_clip")
dw $0097 ; Screen ID
dw $0E78, $12D4 ; Link Coords
dw $0E00, $1210 ; Camera HV
db $05 ; Item
db $02 ; Link direction
;-----------------------------
db $27 ; Entrance
db $00 ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Hera to Swamp Clip", "adold", "mire", "hera_to_swamp_clip")
dw $0017 ; Screen ID
dw $0E99, $02BA ; Link Coords
dw $0E1A, $0214 ; Camera HV
db $01 ; Item
db $02 ; Link direction
;-----------------------------
db $27 ; Entrance
db $C4 ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Mire 2 2", "adold", "mire", "mire_2_2")
dw $0098 ; Screen ID
dw $1188, $132D ; Link Coords
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

;-------------------------------------------------------------------------------
%preset_UW("Big Chest Room", "adold", "mire", "big_chest_room")
dw $00C3 ; Screen ID
dw $06D4, $1978 ; Link Coords
dw $0600, $190B ; Camera HV
db $0E ; Item
db $06 ; Link direction
;-----------------------------
db $27 ; Entrance
db $6F ; Room layout / Floor
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE124, $03EF) ; Room $D2 sprite deaths
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Main Hub (Post Cane)", "adold", "mire", "main_hub_post_cane")
dw $00C3 ; Screen ID
dw $0615, $18F8 ; Link Coords
dw $0600, $188B ; Camera HV
db $0E ; Item
db $04 ; Link direction
;-----------------------------
db $27 ; Entrance
db $4F ; Room layout / Floor
db $82 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Bridge Room", "adold", "mire", "bridge_room")
dw $00B2 ; Screen ID
dw $04F8, $1625 ; Link Coords
dw $047B, $1600 ; Camera HV
db $12 ; Item
db $00 ; Link direction
;-----------------------------
db $27 ; Entrance
db $8F ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Spooky Action", "adold", "mire", "spooky_action")
dw $0092 ; Screen ID
dw $051C, $1378 ; Link Coords
dw $0500, $130B ; Camera HV
db $12 ; Item
db $04 ; Link direction
;-----------------------------
db $27 ; Entrance
db $7E ; Room layout / Floor
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Vitreous", "adold", "mire", "vitreous")
dw $00A0 ; Screen ID
dw $0078, $141E ; Link Coords
dw $0000, $1400 ; Camera HV
db $03 ; Item
db $00 ; Link direction
;-----------------------------
db $27 ; Entrance
db $CF ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;-------------------------------------------------------------------------------
; SWAMP PALACE
;-------------------------------------------------------------------------------
;===================================================================================================
presetmenu_adold_swamp:
%menu_header("Swamp Palace", 9)

;-------------------------------------------------------------------------------
%preset_OW("Outside Mire", "adold", "swamp", "outside_mire")
dw $0070 ; Screen ID
dw $0128, $0CDC ; Link Coords
dw $00A6, $0C7E ; Camera HV
db $03 ; Item
db $02 ; Link direction
;-----------------------------
dw $0133, $0CEB ; Scroll X,Y
dw $0414 ; Tilemap position
;dw $0002 ; Scroll mod Y
;dw $FFFA ; Scroll mod X
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_OW("Dam", "adold", "swamp", "dam")
dw $003B ; Screen ID
dw $0778, $0EF0 ; Link Coords
dw $06FB, $0E89 ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
dw $0780, $0EFE ; Scroll X,Y
dw $04A0 ; Tilemap position
;dw $0007 ; Scroll mod Y
;dw $0005 ; Scroll mod X
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_OW("Entrance", "adold", "swamp", "entrance")
dw $007B ; Screen ID
dw $0778, $0EED ; Link Coords
dw $0700, $0E8E ; Camera HV
db $0E ; Item
db $00 ; Link direction
;-----------------------------
dw $077D, $0EFB ; Scroll X,Y
dw $0420 ; Tilemap position
;dw $0002 ; Scroll mod Y
;dw $0000 ; Scroll mod X
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("First Key Pot", "adold", "swamp", "first_key_pot")
dw $0028 ; Screen ID
dw $1078, $042B ; Link Coords
dw $1000, $0400 ; Camera HV
db $0E ; Item
db $00 ; Link direction
;-----------------------------
db $25 ; Entrance
db $C0 ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $000E ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Main Hub", "adold", "swamp", "main_hub")
dw $0037 ; Screen ID
dw $0E19, $0778 ; Link Coords
dw $0E00, $070C ; Camera HV
db $0E ; Item
db $04 ; Link direction
;-----------------------------
db $25 ; Entrance
db $AF ; Room layout / Floor
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FDFF0, $0002) ; Room $38 sprite deaths
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Hookdash", "adold", "swamp", "hookdash")
dw $0036 ; Screen ID
dw $0CF8, $0624 ; Link Coords
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

;-------------------------------------------------------------------------------
%preset_UW("Restock Room", "adold", "swamp", "restock_room")
dw $0066 ; Screen ID
dw $0D78, $0D2A ; Link Coords
dw $0D00, $0D00 ; Camera HV
db $0E ; Item
db $00 ; Link direction
;-----------------------------
db $25 ; Entrance
db $BE ; Room layout / Floor
db $0D ; Door / Peg state / Layer
dw $0100 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Phelps Way", "adold", "swamp", "phelps_way")
dw $0016 ; Screen ID
dw $0D78, $02D5 ; Link Coords
dw $0D00, $0210 ; Camera HV
db $0E ; Item
db $02 ; Link direction
;-----------------------------
db $25 ; Entrance
db $9F ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0004 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Arrghus", "adold", "swamp", "arrghus")
dw $0016 ; Screen ID
dw $0C78, $0218 ; Link Coords
dw $0C00, $0200 ; Camera HV
db $0E ; Item
db $00 ; Link direction
;-----------------------------
db $25 ; Entrance
db $8F ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;-------------------------------------------------------------------------------
; ICE PALACE
;-------------------------------------------------------------------------------
;===================================================================================================
presetmenu_adold_ice:
%menu_header("Ice Palace", 8)

;-------------------------------------------------------------------------------
%preset_OW("Outside Swamp", "adold", "ice", "outside_swamp")
dw $007B ; Screen ID
dw $0778, $0EEB ; Link Coords
dw $06F2, $0E8D ; Camera HV
db $0E ; Item
db $02 ; Link direction
;-----------------------------
dw $077F, $0EFA ; Scroll X,Y
dw $049E ; Tilemap position
;dw $0002 ; Scroll mod Y
;dw $FFFE ; Scroll mod X
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Entrance", "adold", "ice", "entrance")
dw $000E ; Screen ID
dw $1D78, $01D6 ; Link Coords
dw $1D00, $0110 ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $2D ; Entrance
db $30 ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Ice Conveyor", "adold", "ice", "ice_conveyor")
dw $003E ; Screen ID
dw $1D78, $06C4 ; Link Coords
dw $1D00, $0610 ; Camera HV
db $01 ; Item
db $02 ; Link direction
;-----------------------------
db $2D ; Entrance
db $1F ; Room layout / Floor
db $C1 ; Door / Peg state / Layer
dw $0006 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("IPBJ", "adold", "ice", "ipbj")
dw $003E ; Screen ID
dw $1C78, $07D3 ; Link Coords
dw $1C00, $0710 ; Camera HV
db $01 ; Item
db $02 ; Link direction
;-----------------------------
db $2D ; Entrance
db $AF ; Room layout / Floor
db $41 ; Door / Peg state / Layer
dw $0366 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Penguin Lineup Room", "adold", "ice", "penguin_lineup_room")
dw $004E ; Screen ID
dw $1DB8, $086A ; Link Coords
dw $1D00, $0800 ; Camera HV
db $0E ; Item
db $00 ; Link direction
;-----------------------------
db $2D ; Entrance
db $1F ; Room layout / Floor
db $40 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Lonely Firebar", "adold", "ice", "lonely_firebar")
dw $005E ; Screen ID
dw $1D1C, $0B78 ; Link Coords
dw $1D00, $0B0B ; Camera HV
db $0E ; Item
db $04 ; Link direction
;-----------------------------
db $2D ; Entrance
db $3E ; Room layout / Floor
db $42 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE05C, $001F) ; Room $6E sprite deaths
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Last Two Screens", "adold", "ice", "last_two_screens")
dw $009E ; Screen ID
dw $1D50, $1378 ; Link Coords
dw $1D00, $130B ; Camera HV
db $0E ; Item
db $06 ; Link direction
;-----------------------------
db $2D ; Entrance
db $3C ; Room layout / Floor
db $40 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Kholdstare", "adold", "ice", "kholdstare")
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
;-------------------------------------------------------------------------------
; TURTLE ROCK
;-------------------------------------------------------------------------------
;===================================================================================================
presetmenu_adold_trock:
%menu_header("Turtle Rock", 9)

;-------------------------------------------------------------------------------
%preset_OW("Outside Ice", "adold", "trock", "outside_ice")
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

;-------------------------------------------------------------------------------
%preset_UW("Old Man Cave", "adold", "trock", "old_man_cave")
dw $00E4 ; Screen ID
dw $0878, $1D99 ; Link Coords
dw $0800, $1D10 ; Camera HV
db $03 ; Item
db $02 ; Link direction
;-----------------------------
db $30 ; Entrance
db $60 ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_OW("TR Climb", "adold", "trock", "tr_climb")
dw $0043 ; Screen ID
dw $0903, $0164 ; Link Coords
dw $088F, $0103 ; Camera HV
db $03 ; Item
db $06 ; Link direction
;-----------------------------
dw $090E, $0172 ; Scroll X,Y
dw $0754 ; Tilemap position
;dw $FFFB ; Scroll mod Y
;dw $0001 ; Scroll mod X
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_OW("Laser Entrance", "adold", "trock", "laser_entrance")
dw $0045 ; Screen ID
dw $0D18, $01D5 ; Link Coords
dw $0DFE, $0171 ; Camera HV
db $03 ; Item
db $00 ; Link direction
;-----------------------------
dw $0D7B, $01E0 ; Scroll X,Y
dw $0B60 ; Tilemap position
;dw $FFFD ; Scroll mod Y
;dw $0002 ; Scroll mod X
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Crystaroller", "adold", "trock", "crystaroller")
dw $00B5 ; Screen ID
dw $0A78, $162C ; Link Coords
dw $0A00, $1600 ; Camera HV
db $12 ; Item
db $00 ; Link direction
;-----------------------------
db $18 ; Entrance
db $CE ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE12A, $0010) ; Room $D5 sprite deaths
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Pokey 1", "adold", "trock", "pokey_1")
dw $0014 ; Screen ID
dw $0818, $0278 ; Link Coords
dw $0800, $020B ; Camera HV
db $14 ; Item
db $04 ; Link direction
;-----------------------------
db $18 ; Entrance
db $CF ; Room layout / Floor
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Laser Entrance 2", "adold", "trock", "laser_entrance_2")
dw $00D5 ; Screen ID
dw $0A78, $1BD6 ; Link Coords
dw $0A00, $1B10 ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $18 ; Entrance
db $6E ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Switch Maze", "adold", "trock", "switch_maze")
dw $00C5 ; Screen ID
dw $0A10, $1978 ; Link Coords
dw $0A00, $190B ; Camera HV
db $12 ; Item
db $04 ; Link direction
;-----------------------------
db $18 ; Entrance
db $6E ; Room layout / Floor
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Trinexx", "adold", "trock", "trinexx")
dw $00B4 ; Screen ID
dw $0878, $1624 ; Link Coords
dw $0800, $1600 ; Camera HV
db $12 ; Item
db $00 ; Link direction
;-----------------------------
db $18 ; Entrance
db $CD ; Room layout / Floor
db $41 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;-------------------------------------------------------------------------------
; GANON'S TOWER
;-------------------------------------------------------------------------------
;===================================================================================================
presetmenu_adold_gtower:
%menu_header("Ganon's Tower", 19)

;-------------------------------------------------------------------------------
%preset_OW("Outside Turtle Rock", "adold", "gtower", "outside_turtle_rock")
dw $0047 ; Screen ID
dw $0F08, $013B ; Link Coords
dw $0E96, $00DD ; Camera HV
db $05 ; Item
db $02 ; Link direction
;-----------------------------
dw $0F13, $014A ; Scroll X,Y
dw $0712 ; Tilemap position
;dw $0003 ; Scroll mod Y
;dw $FFFA ; Scroll mod X
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Old Man Cave", "adold", "gtower", "old_man_cave")
dw $00E4 ; Screen ID
dw $0878, $1D99 ; Link Coords
dw $0800, $1D10 ; Camera HV
db $03 ; Item
db $02 ; Link direction
;-----------------------------
db $30 ; Entrance
db $60 ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Entrance", "adold", "gtower", "entrance")
dw $000C ; Screen ID
dw $18F8, $01D7 ; Link Coords
dw $1880, $0110 ; Camera HV
db $0E ; Item
db $00 ; Link direction
;-----------------------------
db $37 ; Entrance
db $E1 ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Spike Skip", "adold", "gtower", "spike_skip")
dw $008B ; Screen ID
dw $1716, $1078 ; Link Coords
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

;-------------------------------------------------------------------------------
%preset_UW("Pre Firesnakes Room", "adold", "gtower", "pre_firesnakes_room")
dw $009B ; Screen ID
dw $16D7, $1278 ; Link Coords
dw $1600, $120B ; Camera HV
db $0E ; Item
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

;-------------------------------------------------------------------------------
%preset_UW("Bombable Floor", "adold", "gtower", "bombable_floor")
dw $009C ; Screen ID
dw $1978, $121E ; Link Coords
dw $1900, $1200 ; Camera HV
db $01 ; Item
db $00 ; Link direction
;-----------------------------
db $37 ; Entrance
db $D0 ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0012 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Floor 3", "adold", "gtower", "floor_3")
dw $000C ; Screen ID
dw $18F8, $002A ; Link Coords
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

;-------------------------------------------------------------------------------
%preset_UW("Mimics 1", "adold", "gtower", "mimics1")
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

;-------------------------------------------------------------------------------
%preset_UW("Spike Pit", "adold", "gtower", "spike_pit")
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

;-------------------------------------------------------------------------------
%preset_UW("Gauntlet 1", "adold", "gtower", "gauntlet_1")
dw $005C ; Screen ID
dw $1978, $0A24 ; Link Coords
dw $1900, $0A00 ; Camera HV
db $03 ; Item
db $00 ; Link direction
;-----------------------------
db $37 ; Entrance
db $92 ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE036, $0008) ; Room $5B sprite deaths
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Lanmola 2", "adold", "gtower", "lanmola_2")
dw $006C ; Screen ID
dw $1917, $0D78 ; Link Coords
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

;-------------------------------------------------------------------------------
%preset_UW("Wizzrobes 1", "adold", "gtower", "wizzrobes_1")
dw $006C ; Screen ID
dw $1878, $0C27 ; Link Coords
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

;-------------------------------------------------------------------------------
%preset_UW("Wizzrobes 2", "adold", "gtower", "wizzrobes_2")
dw $00A5 ; Screen ID
dw $0B78, $1527 ; Link Coords
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

;-------------------------------------------------------------------------------
%preset_UW("Torches 1", "adold", "gtower", "torches_1")
dw $0095 ; Screen ID
dw $0BD7, $1278 ; Link Coords
dw $0B00, $120B ; Camera HV
db $12 ; Item
db $06 ; Link direction
;-----------------------------
db $37 ; Entrance
db $54 ; Room layout / Floor
db $02 ; Door / Peg state / Layer
dw $000C ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE0CA, $00EF) ; Room $A5 sprite deaths
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Torches 2", "adold", "gtower", "torches_2")
dw $0096 ; Screen ID
dw $0D78, $139F ; Link Coords
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

;-------------------------------------------------------------------------------
%preset_UW("Helma Key", "adold", "gtower", "helma_key")
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

;-------------------------------------------------------------------------------
%preset_UW("Bombable Wall", "adold", "gtower", "bombable_wall")
dw $003D ; Screen ID
dw $1B17, $0678 ; Link Coords
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

;-------------------------------------------------------------------------------
%preset_UW("Moldorm 2", "adold", "gtower", "moldorm_2")
dw $003D ; Screen ID
dw $1A78, $07D3 ; Link Coords
dw $1A00, $0710 ; Camera HV
db $0E ; Item
db $02 ; Link direction
;-----------------------------
db $37 ; Entrance
db $25 ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Agahnim 2", "adold", "gtower", "agahnim_2")
dw $001D ; Screen ID
dw $1A78, $0222 ; Link Coords
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
;-------------------------------------------------------------------------------
; AGAHNIM'S TOWER
;-------------------------------------------------------------------------------
;===================================================================================================
presetmenu_adold_aga:
%menu_header("Agahnim's Tower", 8)

;-------------------------------------------------------------------------------
%preset_OW("Pyramid", "adold", "aga", "pyramid")
dw $005B ; Screen ID
dw $07F1, $065C ; Link Coords
dw $0779, $0600 ; Camera HV
db $0E ; Item
db $02 ; Link direction
;-----------------------------
dw $07F8, $066D ; Scroll X,Y
dw $002E ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $FFF7 ; Scroll mod X
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Gold Knights", "adold", "aga", "gold_knights")
dw $00E0 ; Screen ID
dw $0078, $1D1E ; Link Coords
dw $0000, $1D00 ; Camera HV
db $05 ; Item
db $00 ; Link direction
;-----------------------------
db $24 ; Entrance
db $21 ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Dark Room of Despair", "adold", "aga", "dark_room_of_despair")
dw $00D0 ; Screen ID
dw $010A, $1A78 ; Link Coords
dw $0100, $1A0B ; Camera HV
db $05 ; Item
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

;-------------------------------------------------------------------------------
%preset_UW("Dark Room of Melancholy", "adold", "aga", "dark_room_of_melancholy")
dw $00C0 ; Screen ID
dw $011A, $1978 ; Link Coords
dw $0100, $190B ; Camera HV
db $05 ; Item
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

;-------------------------------------------------------------------------------
%preset_UW("Spear Guards", "adold", "aga", "spear_guards")
dw $00C0 ; Screen ID
dw $0178, $182D ; Link Coords
dw $0100, $1800 ; Camera HV
db $05 ; Item
db $00 ; Link direction
;-----------------------------
db $24 ; Entrance
db $13 ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $001C ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Circle of Pots", "adold", "aga", "circle_of_pots")
dw $00B0 ; Screen ID
dw $0078, $16DC ; Link Coords
dw $0000, $1610 ; Camera HV
db $05 ; Item
db $02 ; Link direction
;-----------------------------
db $24 ; Entrance
db $04 ; Room layout / Floor
db $81 ; Door / Peg state / Layer
dw $003D ; Dead sprites
;-----------------------------
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Catwalk", "adold", "aga", "catwalk")
dw $0040 ; Screen ID
dw $012C, $0978 ; Link Coords
dw $0100, $090B ; Camera HV
db $05 ; Item
db $04 ; Link direction
;-----------------------------
db $24 ; Entrance
db $35 ; Room layout / Floor
db $0E ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE0E0, $0D3D) ; Room $B0 sprite deaths
%write_end()

;-------------------------------------------------------------------------------
%preset_UW("Agahnim", "adold", "aga", "agahnim")
dw $0030 ; Screen ID
dw $0078, $0624 ; Link Coords
dw $0000, $0600 ; Camera HV
db $05 ; Item
db $00 ; Link direction
;-----------------------------
db $24 ; Entrance
db $06 ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0001 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE000, $0002) ; Room $40 sprite deaths
%write_end()

;===================================================================================================
;-------------------------------------------------------------------------------
; GANON
;-------------------------------------------------------------------------------
;===================================================================================================
presetmenu_adold_ganon:
%menu_header("Ganon", 1)

;-------------------------------------------------------------------------------
%preset_OW("Pyramid", "adold", "ganon", "pyramid")
dw $005B ; Screen ID
dw $07F0, $065C ; Link Coords
dw $0778, $0600 ; Camera HV
db $05 ; Item
db $02 ; Link direction
;-----------------------------
dw $07F7, $066D ; Scroll X,Y
dw $002E ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $FFF8 ; Scroll mod X
;-----------------------------
%write_end()

;===================================================================================================
;-------------------------------------------------------------------------------
; BOSSES
;-------------------------------------------------------------------------------
;===================================================================================================
presetmenu_adold_boss:
%menu_header("Bosses", 13)
%existing_preset("adold", "eastern", "armos")
%existing_preset("adold", "pod", "helma")
%existing_preset("adold", "hera", "moldorm")
%existing_preset("adold", "thieves", "blind")
%existing_preset("adold", "skull", "mothula")
%existing_preset("adold", "desert", "lanmolas")
%existing_preset("adold", "mire", "vitreous")
%existing_preset("adold", "swamp", "arrghus")
%existing_preset("adold", "ice", "kholdstare")
%existing_preset("adold", "trock", "trinexx")
%existing_preset("adold", "gtower", "agahnim_2")
%existing_preset("adold", "aga", "agahnim")
%existing_preset("adold", "ganon", "pyramid")

;===================================================================================================
presetpersistent_adold:
;===================================================================================================
presetpersistent_adold_escape:
;-----------------------------
.links_bed
%write_sq()
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
%write8($7E02A2, $00) ; slot 4 altitude
..end
;-----------------------------
.backtracking
..end
;-----------------------------
.key_guard_revisit
..end
;-----------------------------
.throne_room
..end
;-----------------------------
.snake_avoidance
..end
;-----------------------------
.sewer_rooms
..end
;-----------------------------
.keyrat
..end
;-----------------------------
.into_sanctuary
..end

;===================================================================================================
presetpersistent_adold_eastern:
;-----------------------------
.before_cutscene
..end
;-----------------------------
.links_house
..end
;-----------------------------
.ep_overworld
..end
;-----------------------------
.entrance
%write8($7E0FC8, $01) ; Prize pack index
..end
;-----------------------------
.stalfos_room
..end
;-----------------------------
.big_chest_room_1
%write8($7E0FCC, $02) ; Prize pack index
..end
;-----------------------------
.dark_key_room
..end
;-----------------------------
.big_key_dmg_boost
%write8($7E0FCC, $03) ; Prize pack index
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
%write8($7E0FC8, $03) ; Prize pack index
..end

;===================================================================================================
presetpersistent_adold_pod:
;-----------------------------
.outside_ep
%write8($7E02A1, $17) ; ancilla altitude
..end
;-----------------------------
.sanctuary
%write_sq()
..end
;-----------------------------
.dma
..end
;-----------------------------
.death_mountain
..end
;-----------------------------
.after_mirror
..end
;-----------------------------
.kiki_skip
..end
;-----------------------------
.dungeon_reload
..end
;-----------------------------
.main_hub_bk
..end
;-----------------------------
.main_hub_hammerjump
..end
;-----------------------------
.hammerjump
..end
;-----------------------------
.archery_contest
%write8($7E0FCD, $01) ; Prize pack index
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
%write8($7E0FC8, $05) ; Prize pack index
..end

;===================================================================================================
presetpersistent_adold_hera:
;-----------------------------
.outside_pod
%write8($7E02A1, $08) ; ancilla altitude
..end
;-----------------------------
.old_man_cave
%write_sq()
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
%write8($7E02A1, $00) ; ancilla altitude
..end
;-----------------------------
.petting_zoo
%write8($7E0FCC, $02) ; Prize pack index
..end
;-----------------------------
.moldorm
..end

;===================================================================================================
presetpersistent_adold_thieves:
;-----------------------------
.outside_hera
%write8($7E02A1, $17) ; ancilla altitude
..end
;-----------------------------
.dmd
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
.bomb_floor
%write8($7E0FC8, $01) ; Prize pack index
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
.backtracking_2
..end
;-----------------------------
.pot_hammerdash
..end
;-----------------------------
.blind
..end

;===================================================================================================
presetpersistent_adold_skull:
;-----------------------------
.outside_thieves
%write8($7E02A1, $0E) ; ancilla altitude
..end
;-----------------------------
.cursed_dwarf
..end
;-----------------------------
.getting_tempered
%write_mirror($90, $02, $88, $0A)
..end
;-----------------------------
.fencedash
%write_mirror($10, $04, $18, $09)
..end
;-----------------------------
.dash_to_skull_woods
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
..end
;-----------------------------
.skull_entrance
..end
;-----------------------------
.mummy_hellway
%write8($7E0FCC, $05) ; Prize pack index
..end
;-----------------------------
.mummy_key
..end
;-----------------------------
.mothula
..end

;===================================================================================================
presetpersistent_adold_desert:
;-----------------------------
.outside_skull
%write8($7E02A1, $0B) ; ancilla altitude
..end
;-----------------------------
.ether
%write_sq()
..end
;-----------------------------
.bridge_hammerdash
%write8($7E02A2, $0F) ; slot 4 altitude
..end
;-----------------------------
.zora_dmd
..end
;-----------------------------
.links_house
..end
;-----------------------------
.swamp_warp
..end
;-----------------------------
.fluteless_mire
..end
;-----------------------------
.desert_entrance
%write_mirror($E4, $00, $61, $0C)
..end
;-----------------------------
.torch_key
..end
;-----------------------------
.pre_cannonball_room
..end
;-----------------------------
.desert_2_spinspeed
..end
;-----------------------------
.torches
..end
;-----------------------------
.lanmolas
..end

;===================================================================================================
presetpersistent_adold_mire:
;-----------------------------
.outside_desert
%write8($7E02A1, $17) ; ancilla altitude
..end
;-----------------------------
.entrance
..end
;-----------------------------
.mire_2
..end
;-----------------------------
.main_hub
..end
;-----------------------------
.spike_key
..end
;-----------------------------
.beat_the_fireball
..end
;-----------------------------
.bari_switch
..end
;-----------------------------
.sluggulas
..end
;-----------------------------
.torches
..end
;-----------------------------
.backtracking
..end
;-----------------------------
.mire_to_hera_clip
..end
;-----------------------------
.hera_to_swamp_clip
..end
;-----------------------------
.mire_2_2
%write8($7E0FCC, $01) ; Prize pack index
..end
;-----------------------------
.big_chest_room
%write8($7E0FC8, $02) ; Prize pack index
..end
;-----------------------------
.main_hub_post_cane
..end
;-----------------------------
.bridge_room
..end
;-----------------------------
.spooky_action
%write8($7E02A1, $00) ; ancilla altitude
%write8($7E02A2, $FF) ; slot 4 altitude
..end
;-----------------------------
.vitreous
..end

;===================================================================================================
presetpersistent_adold_swamp:
;-----------------------------
.outside_mire
%write8($7E02A1, $0E) ; ancilla altitude
%write8($7E02A2, $00) ; slot 4 altitude
..end
;-----------------------------
.dam
%write_mirror($70, $07, $07, $0F)
..end
;-----------------------------
.entrance
..end
;-----------------------------
.first_key_pot
..end
;-----------------------------
.main_hub
..end
;-----------------------------
.hookdash
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
presetpersistent_adold_ice:
;-----------------------------
.outside_swamp
..end
;-----------------------------
.entrance
%write_mirror($07, $0A, $41, $0E)
..end
;-----------------------------
.ice_conveyor
%write8($7E0FCA, $02) ; Prize pack index
..end
;-----------------------------
.ipbj
..end
;-----------------------------
.penguin_lineup_room
..end
;-----------------------------
.lonely_firebar
%write8($7E0FC9, $03) ; Prize pack index
..end
;-----------------------------
.last_two_screens
..end
;-----------------------------
.kholdstare
..end

;===================================================================================================
presetpersistent_adold_trock:
;-----------------------------
.outside_ice
%write8($7E02A1, $08) ; ancilla altitude
..end
;-----------------------------
.old_man_cave
%write_sq()
..end
;-----------------------------
.tr_climb
..end
;-----------------------------
.laser_entrance
%write_mirror($07, $0A, $98, $01)
..end
;-----------------------------
.crystaroller
..end
;-----------------------------
.pokey_1
..end
;-----------------------------
.laser_entrance_2
..end
;-----------------------------
.switch_maze
..end
;-----------------------------
.trinexx
%write8($7E02A1, $00) ; ancilla altitude
..end

;===================================================================================================
presetpersistent_adold_gtower:
;-----------------------------
.outside_turtle_rock
%write8($7E02A1, $05) ; ancilla altitude
..end
;-----------------------------
.old_man_cave
%write_sq()
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
.floor_3
%write8($7E0B08, $40) ; Arc variable
%write8($7E0B09, $00) ; Arc variable
..end
;-----------------------------
.mimics1
..end
;-----------------------------
.spike_pit
..end
;-----------------------------
.gauntlet_1
..end
;-----------------------------
.lanmola_2
%write8($7E0FCC, $07) ; Prize pack index
..end
;-----------------------------
.wizzrobes_1
..end
;-----------------------------
.wizzrobes_2
..end
;-----------------------------
.torches_1
%write8($7E0FC7, $01) ; Prize pack index
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
presetpersistent_adold_aga:
;-----------------------------
.pyramid
%write8($7E02A2, $FE) ; slot 4 altitude
..end
;-----------------------------
.gold_knights
%write8($7E02A2, $E3) ; slot 4 altitude
%write_mirror($06, $08, $78, $06)
..end
;-----------------------------
.dark_room_of_despair
%write8($7E0FCD, $02) ; Prize pack index
..end
;-----------------------------
.dark_room_of_melancholy
..end
;-----------------------------
.spear_guards
..end
;-----------------------------
.circle_of_pots
%write8($7E0FC7, $03) ; Prize pack index
..end
;-----------------------------
.catwalk
..end
;-----------------------------
.agahnim
..end

;===================================================================================================
presetpersistent_adold_ganon:
;-----------------------------
.pyramid
%write8($7E0B08, $40) ; Arc variable
%write8($7E0B09, $00) ; Arc variable
..end

;===================================================================================================
presetSRAM_adold:
;-------------------------------------------------------------------------------
.escape
;-------------------------------------------------------------------------------
..links_bed
%write8($7EF36F, $FF) ; Keys
%writeroom($104, $0002)
...end
;-------------------------------------------------------------------------------
..courtyard
%write8($7EF2BB, $00) ; Overworld $3B: Unknown (........)
%write8($7EF2FB, $00) ; Overworld $7B: Unknown (........)
%write8($7EF3C8, $03) ; Spawn point
%write8($7EF359, $01) ; Sword
%write8($7EF3C5, $01) ; Game state
%write8($7EF35A, $01) ; Shield
%write16sram($7EF360, $01) ; Rupees
%write8($7EF3C6, $11) ; Game flags A
%writeroom($055, $000F)
...end
;-------------------------------------------------------------------------------
..entrance
...end
;-------------------------------------------------------------------------------
..1st_key_guard
%write8($7EF36F, $00) ; Keys
%writeroom($050, $0005)
%writeroom($060, $0005)
%writeroom($001, $000C)
%writeroom($061, $000F)
...end
;-------------------------------------------------------------------------------
..stealth_room
%writeroom($072, $840F)
%writeroom($082, $000F)
...end
;-------------------------------------------------------------------------------
..2nd_key_guard
%writeroom($071, $0002)
%writeroom($081, $000F)
...end
;-------------------------------------------------------------------------------
..ball_n_chains
%write8($7EF341, $01) ; Boomerang
%writeroom($070, $0008)
%writeroom($071, $841B)
...end
;-------------------------------------------------------------------------------
..backtracking
%write8($7EF3C8, $02) ; Spawn point
%write8($7EF3CC, $01) ; Follower
%write8($7EF34A, $01) ; Lamp
%write16sram($7EF366, $4000) ; Big keys
%writeroom($080, $043C)
...end
;-------------------------------------------------------------------------------
..key_guard_revisit
...end
;-------------------------------------------------------------------------------
..throne_room
...end
;-------------------------------------------------------------------------------
..snake_avoidance
%write8($7EF3C8, $04) ; Spawn point
%writeroom($041, $000F)
%writeroom($051, $000F)
...end
;-------------------------------------------------------------------------------
..sewer_rooms
%writeroom($032, $801F)
%writeroom($042, $000C)
...end
;-------------------------------------------------------------------------------
..keyrat
%writeroom($022, $8003)
%writeroom($021, $0003)
...end
;-------------------------------------------------------------------------------
..into_sanctuary
%writeroom($011, $2005)
%writeroom($021, $840F)
...end
;-------------------------------------------------------------------------------
.eastern
;-------------------------------------------------------------------------------
..before_cutscene
%writeroom($002, $000F)
...end
;-------------------------------------------------------------------------------
..links_house
%write8($7EF29B, $20) ; Overworld 1B overlay
%write8($7EF36F, $FF) ; Keys
%write8($7EF3C7, $01) ; Map marker
%write8($7EF341, $01) ; boom
%write8($7EF3C8, $01) ; Spawn point
%write8($7EF3CC, $00) ; Follower
%write8($7EF36D, $18) ; Health
%write8($7EF3C5, $02) ; Game state
%writeroom($012, $000F)
...end
;-------------------------------------------------------------------------------
..ep_overworld
...end
;-------------------------------------------------------------------------------
..entrance
%write8($7EF36F, $00) ; Keys
%writeroom($0C9, $0003)
...end
;-------------------------------------------------------------------------------
..stalfos_room
%writeroom($0A8, $0005)
%writeroom($0A9, $000F)
%writeroom($0B9, $000F)
%writeroom($0C9, $000F)
...end
;-------------------------------------------------------------------------------
..big_chest_room_1
%writeroom($0A8, $000F)
...end
;-------------------------------------------------------------------------------
..dark_key_room
%write8($7EF377, $05) ; Arrows
%writeroom($0AA, $000A)
%writeroom($0BA, $0008)
...end
;-------------------------------------------------------------------------------
..big_key_dmg_boost
%writeroom($0BA, $840C)
%writeroom($0B9, $800F)
...end
;-------------------------------------------------------------------------------
..big_chest_room_2
%write8($7EF36D, $0C) ; Health
%write16sram($7EF366, $6000) ; Big keys
%writeroom($0A8, $200F)
%writeroom($0B8, $8015)
...end
;-------------------------------------------------------------------------------
..gifted_with_greenies
%write8($7EF377, $0F) ; Arrows
%write8($7EF340, $02) ; Bow
%writeroom($0A9, $201F)
...end
;-------------------------------------------------------------------------------
..pot_room
%write8($7EF34F, $00) ; Bottles
%write8($7EF377, $0E) ; Arrows
%write8($7EF36E, $10) ; Magic
%writeroom($099, $C403)
...end
;-------------------------------------------------------------------------------
..zeldagamer_room
%write8($7EF377, $18) ; Arrows
%writeroom($0DA, $0002)
%writeroom($0D9, $0003)
...end
;-------------------------------------------------------------------------------
..armos
%write8($7EF377, $16) ; Arrows
%writeroom($0D8, $0005)
...end
;-------------------------------------------------------------------------------
.pod
;-------------------------------------------------------------------------------
..outside_ep
%write8($7EF377, $04) ; Arrows
%write8($7EF36C, $20) ; Max HP
%write8($7EF374, $04) ; Pendants
%write8($7EF36D, $20) ; Health
%write8($7EF36E, $80) ; Magic
%writeroom($0C8, $0801)
...end
;-------------------------------------------------------------------------------
..sanctuary
%write8($7EF343, $03) ; Bombs
%write8($7EF36F, $00) ; Keys
%write8($7EF3C7, $03) ; Map marker
%write8($7EF355, $01) ; Boots
%write8($7EF36D, $18) ; Health
%write8($7EF379, $FC) ; Ability
%write8($7EF377, $04) ; Arrows
%writeroom($105, $802A)
...end
;-------------------------------------------------------------------------------
..dma
%write8($7EF36C, $28) ; Max HP
%write8($7EF36D, $28) ; Health
%writeroom($012, $001F)
...end
;-------------------------------------------------------------------------------
..death_mountain
%write8($7EF36F, $FF) ; Keys
%write8($7EF3C8, $05) ; Spawn point
%write8($7EF3CC, $04) ; Follower
%writeroom($0F0, $000F)
%writeroom($0F1, $000F)
...end
;-------------------------------------------------------------------------------
..after_mirror
%write8($7EF353, $02) ; Magic Mirror
%write8($7EF3C8, $01) ; Spawn point
%write8($7EF3CC, $00) ; Follower
...end
;-------------------------------------------------------------------------------
..kiki_skip
...end
;-------------------------------------------------------------------------------
..dungeon_reload
%write8($7EF343, $04) ; Bombs
%write8($7EF36F, $00) ; Keys
%write8($7EF36D, $20) ; Health
%writeroom($04A, $200F)
%writeroom($009, $0008)
%writeroom($0F9, $000F)
...end
;-------------------------------------------------------------------------------
..main_hub_bk
%write8($7EF343, $05) ; Bombs
%write8($7EF36F, $01) ; Keys
%write8($7EF382, $01) ; Key for dungeon $06
%writeroom($009, $0018)
...end
;-------------------------------------------------------------------------------
..main_hub_hammerjump
%write16sram($7EF366, $6200) ; Big keys
%writeroom($00A, $801F)
%writeroom($03A, $801F)
...end
;-------------------------------------------------------------------------------
..hammerjump
%write8($7EF36F, $00) ; Keys
%writeroom($02A, $400F)
...end
;-------------------------------------------------------------------------------
..archery_contest
%write8($7EF343, $07) ; Bombs
%write8($7EF34B, $01) ; Hammer
%write8($7EF36D, $18) ; Health
%write8($7EF382, $00) ; Key for dungeon $06
%writeroom($01A, $101A)
...end
;-------------------------------------------------------------------------------
..mimics
%write8($7EF343, $09) ; Bombs
%write8($7EF36F, $01) ; Keys
%write8($7EF377, $03) ; Arrows
%writeroom($02A, $402F)
%writeroom($02B, $000A)
...end
;-------------------------------------------------------------------------------
..statue
%write8($7EF377, $04) ; Arrows
%writeroom($01B, $0002)
...end
;-------------------------------------------------------------------------------
..basement
%write8($7EF377, $02) ; Arrows
%writeroom($01B, $008E)
...end
;-------------------------------------------------------------------------------
..turtle_room
%write8($7EF36F, $00) ; Keys
%writeroom($00B, $200C)
...end
;-------------------------------------------------------------------------------
..helma
%write16sram($7EF360, $02) ; Rupees
%writeroom($06A, $8005)
%writeroom($00B, $200F)
...end
;-------------------------------------------------------------------------------
.hera
;-------------------------------------------------------------------------------
..outside_pod
%write8($7EF36F, $FF) ; Keys
%write8($7EF3C7, $07) ; Map marker
%write8($7EF36C, $30) ; Max HP
%write8($7EF36D, $30) ; Health
%write8($7EF37A, $02) ; Crystals
%writeroom($05A, $0801)
...end
;-------------------------------------------------------------------------------
..old_man_cave
%write8($7EF36D, $20) ; Health
%write8($7EF377, $02) ; Arrows
%writeroom($0E4, $000A)
...end
;-------------------------------------------------------------------------------
..entrance
%write8($7EF36F, $00) ; Keys
%writeroom($077, $000F)
...end
;-------------------------------------------------------------------------------
..tile_room
%writeroom($077, $800F)
%writeroom($087, $0402)
...end
;-------------------------------------------------------------------------------
..torches
%writeroom($087, $040E)
...end
;-------------------------------------------------------------------------------
..beetles
%write16sram($7EF366, $6220) ; Big keys
%write8($7EF36E, $70) ; Magic
%writeroom($087, $041F)
...end
;-------------------------------------------------------------------------------
..petting_zoo
%write8($7EF343, $0A) ; Bombs
%writeroom($031, $800F)
...end
;-------------------------------------------------------------------------------
..moldorm
%write8($7EF357, $01) ; Moon Pearl
%write8($7EF36D, $18) ; Health
%writeroom($017, $000F)
%writeroom($027, $001F)
...end
;-------------------------------------------------------------------------------
.thieves
;-------------------------------------------------------------------------------
..outside_hera
%write8($7EF36F, $FF) ; Keys
%write8($7EF36C, $38) ; Max HP
%write8($7EF374, $05) ; Pendants
%write8($7EF36D, $38) ; Health
%write8($7EF36E, $80) ; Magic
%writeroom($007, $080F)
...end
;-------------------------------------------------------------------------------
..dmd
%write8($7EF3CA, $40) ; LW/DW
...end
;-------------------------------------------------------------------------------
..entrance
%write8($7EF36F, $00) ; Keys
%write8($7EF2D8, $20) ; Overworld 58 overlay
%writeroom($0DB, $000F)
...end
;-------------------------------------------------------------------------------
..after_big_key
%write16sram($7EF366, $6230) ; Big keys
%writeroom($0CC, $000F)
%writeroom($0DC, $000F)
%writeroom($0CB, $000F)
%writeroom($0DB, $002F)
...end
;-------------------------------------------------------------------------------
..stalfos_hallway
%writeroom($0CC, $800F)
...end
;-------------------------------------------------------------------------------
..conveyor_gibos
%writeroom($0BC, $C407)
...end
;-------------------------------------------------------------------------------
..hellway
%writeroom($0BB, $0001)
...end
;-------------------------------------------------------------------------------
..bomb_floor
%writeroom($064, $0003)
%writeroom($065, $0002)
%writeroom($0AB, $8402)
%writeroom($0BB, $000B)
...end
;-------------------------------------------------------------------------------
..backtracking
%write8($7EF343, $09) ; Bombs
%writeroom($065, $0103)
...end
;-------------------------------------------------------------------------------
..basement
%write8($7EF343, $0A) ; Bombs
%writeroom($0BC, $C40F)
%writeroom($0BB, $000F)
...end
;-------------------------------------------------------------------------------
..prison
%write8($7EF343, $09) ; Bombs
%writeroom($044, $0005)
%writeroom($045, $000A)
...end
;-------------------------------------------------------------------------------
..backtracking_2
%write8($7EF354, $02) ; Gloves
%write8($7EF3CC, $06) ; Follower
%writeroom($044, $4017)
%writeroom($045, $00FF)
...end
;-------------------------------------------------------------------------------
..pot_hammerdash
%write8($7EF377, $07) ; Arrows
...end
;-------------------------------------------------------------------------------
..blind
...end
;-------------------------------------------------------------------------------
.skull
;-------------------------------------------------------------------------------
..outside_thieves
%write8($7EF36F, $FF) ; Keys
%write8($7EF36C, $40) ; Max HP
%write8($7EF3CC, $00) ; Follower
%write8($7EF36D, $40) ; Health
%write8($7EF37A, $22) ; Crystals
%write8($7EF387, $00) ; Key for dungeon $0B
%writeroom($0AC, $0A01)
...end
;-------------------------------------------------------------------------------
..cursed_dwarf
%write8($7EF343, $08) ; Bombs
%write8($7EF2D8, $22) ; Overworld 58 bomb wall and overlay
%write16sram($7EF360, $12E) ; Rupees
%writeroom($106, $F012)
...end
;-------------------------------------------------------------------------------
..getting_tempered
%write8($7EF3CC, $07) ; Follower
%write8($7EF34E, $01) ; Book of Mudora
%writeroom($107, $F002)
...end
;-------------------------------------------------------------------------------
..fencedash
%write8($7EF3CC, $00) ; Follower
%write8($7EF359, $03) ; Sword
%write8($7EF3C9, $20) ; Game flags B
%write16sram($7EF360, $124) ; Rupees
%writeroom($121, $0002)
...end
;-------------------------------------------------------------------------------
..dash_to_skull_woods
%write16sram($7EF360, $250) ; Rupees
%writeroom($11C, $0011)
...end
;-------------------------------------------------------------------------------
..mummy_room
...end
;-------------------------------------------------------------------------------
..bomb_jump
%write8($7EF377, $0C) ; Arrows
%write16sram($7EF366, $62B0) ; Big keys
%writeroom($057, $001A)
...end
;-------------------------------------------------------------------------------
..key_pot
%write8($7EF343, $07) ; Bombs
%write8($7EF36F, $00) ; Keys
%write8($7EF345, $01) ; Fire Rod
%write8($7EF36D, $30) ; Health
%writeroom($056, $0005)
%writeroom($058, $0012)
...end
;-------------------------------------------------------------------------------
..skull_entrance
%write8($7EF2C0, $20) ; Overworld 40 overlay
%write8($7EF384, $01) ; Key for dungeon $08
%write8($7EF36E, $70) ; Magic
%writeroom($056, $0407)
...end
;-------------------------------------------------------------------------------
..mummy_hellway
%write8($7EF36F, $00) ; Keys
%writeroom($049, $2002)
%writeroom($059, $800A)
...end
;-------------------------------------------------------------------------------
..mummy_key
%write8($7EF36E, $30) ; Magic
%writeroom($049, $A00F)
...end
;-------------------------------------------------------------------------------
..mothula
%writeroom($039, $4402)
...end
;-------------------------------------------------------------------------------
.desert
;-------------------------------------------------------------------------------
..outside_skull
%write8($7EF36C, $48) ; Max HP
%write8($7EF384, $00) ; Key for dungeon $08
%write8($7EF36D, $48) ; Health
%write8($7EF36E, $80) ; Magic
%write8($7EF37A, $62) ; Crystals
%writeroom($029, $0801)
%writeroom($039, $4403)
...end
;-------------------------------------------------------------------------------
..ether
%write8($7EF36D, $30) ; Health
%write8($7EF36F, $FF) ; Keys
%write8($7EF377, $0C) ; Arrows
%write8($7EF3CA, $00) ; LW/DW
...end
;-------------------------------------------------------------------------------
..bridge_hammerdash
%write8($7EF348, $01) ; Ether Medallion
...end
;-------------------------------------------------------------------------------
..zora_dmd
...end
;-------------------------------------------------------------------------------
..links_house
%write8($7EF379, $FE) ; Ability
%write8($7EF356, $01) ; Flippers
%write16sram($7EF360, $A1) ; Rupees
...end
;-------------------------------------------------------------------------------
..swamp_warp
%write16sram($7EF360, $5C) ; Rupees
...end
;-------------------------------------------------------------------------------
..fluteless_mire
%write8($7EF343, $06) ; Bombs
%write8($7EF36D, $28) ; Health
%write8($7EF3CA, $40) ; LW/DW
...end
;-------------------------------------------------------------------------------
..desert_entrance
%write8($7EF36F, $00) ; Keys
%write8($7EF3CA, $00) ; LW/DW
%writeroom($083, $0002)
...end
;-------------------------------------------------------------------------------
..torch_key
%writeroom($073, $0001)
%writeroom($083, $0007)
...end
;-------------------------------------------------------------------------------
..pre_cannonball_room
%write8($7EF377, $11) ; Arrows
%writeroom($074, $0003)
%writeroom($073, $0405)
%writeroom($075, $0002)
%writeroom($085, $400A)
...end
;-------------------------------------------------------------------------------
..desert_2_spinspeed
%write8($7EF37F, $00) ; Key for dungeon $03
%write16sram($7EF366, $72B0) ; Big keys
%writeroom($075, $0017)
%writeroom($085, $400E)
...end
;-------------------------------------------------------------------------------
..torches
%writeroom($043, $6401)
%writeroom($053, $240F)
%writeroom($063, $840A)
...end
;-------------------------------------------------------------------------------
..lanmolas
%write8($7EF377, $16) ; Arrows
%write8($7EF36E, $50) ; Magic
%writeroom($043, $E48D)
...end
;-------------------------------------------------------------------------------
.mire
;-------------------------------------------------------------------------------
..outside_desert
%write8($7EF3C7, $04) ; Map marker
%write8($7EF36C, $50) ; Max HP
%write8($7EF374, $07) ; Pendants
%write8($7EF36D, $50) ; Health
%write8($7EF36E, $80) ; Magic
%writeroom($033, $0802)
...end
;-------------------------------------------------------------------------------
..entrance
%write8($7EF2F0, $20) ; Overworld 70 overlay
%write8($7EF36E, $60) ; Magic
%write8($7EF3CA, $40) ; LW/DW
...end
;-------------------------------------------------------------------------------
..mire_2
%write8($7EF36F, $00) ; Keys
%writeroom($098, $0003)
...end
;-------------------------------------------------------------------------------
..main_hub
%write8($7EF36E, $50) ; Magic
%writeroom($0D2, $000F)
...end
;-------------------------------------------------------------------------------
..spike_key
%writeroom($0B2, $0001)
%writeroom($0C2, $000F)
...end
;-------------------------------------------------------------------------------
..beat_the_fireball
%write8($7EF36F, $02) ; Keys
%write8($7EF36D, $38) ; Health
%writeroom($0B3, $0412)
...end
;-------------------------------------------------------------------------------
..bari_switch
%write8($7EF36F, $01) ; Keys
%writeroom($0C2, $400F)
...end
;-------------------------------------------------------------------------------
..sluggulas
%writeroom($0C1, $C403)
...end
;-------------------------------------------------------------------------------
..torches
%writeroom($0D1, $0008)
...end
;-------------------------------------------------------------------------------
..backtracking
%write16sram($7EF366, $73B0) ; Big keys
%write8($7EF36E, $10) ; Magic
%writeroom($097, $010F)
%writeroom($0B1, $0007)
%writeroom($0C1, $C407)
%writeroom($0D1, $001B)
...end
;-------------------------------------------------------------------------------
..mire_to_hera_clip
%write8($7EF36E, $80) ; Magic
...end
;-------------------------------------------------------------------------------
..hera_to_swamp_clip
%write8($7EF343, $05) ; Bombs
%write8($7EF36D, $50) ; Health
%writeroom($0A7, $000C)
...end
;-------------------------------------------------------------------------------
..mire_2_2
%write8($7EF36F, $00) ; Keys
%write8($7EF383, $00) ; Key for dungeon $07
%write8($7EF36D, $48) ; Health
%write8($7EF342, $01) ; Hookshot
%writeroom($036, $001F)
%writeroom($037, $208F)
...end
;-------------------------------------------------------------------------------
..big_chest_room
%write8($7EF36E, $60) ; Magic
%writeroom($0C3, $000A)
...end
;-------------------------------------------------------------------------------
..main_hub_post_cane
%write8($7EF350, $01) ; Cane of Somaria
%write8($7EF36D, $40) ; Health
%writeroom($0C3, $001F)
...end
;-------------------------------------------------------------------------------
..bridge_room
%write16sram($7EF360, $5D) ; Rupees
%writeroom($0B2, $800D)
%writeroom($0B1, $800F)
...end
;-------------------------------------------------------------------------------
..spooky_action
%write8($7EF36E, $50) ; Magic
%writeroom($092, $0005)
%writeroom($0A2, $800F)
%writeroom($093, $000E)
...end
;-------------------------------------------------------------------------------
..vitreous
%writeroom($092, $0007)
%writeroom($0A0, $800F)
%writeroom($091, $0005)
...end
;-------------------------------------------------------------------------------
.swamp
;-------------------------------------------------------------------------------
..outside_mire
%write8($7EF377, $0E) ; Arrows
%write8($7EF36C, $58) ; Max HP
%write8($7EF36D, $58) ; Health
%write8($7EF36E, $80) ; Magic
%write8($7EF37A, $63) ; Crystals
%writeroom($090, $0802)
...end
;-------------------------------------------------------------------------------
..dam
%write8($7EF3CA, $00) ; LW/DW
%writeroom($10B, $0003)
...end
;-------------------------------------------------------------------------------
..entrance
%write8($7EF2BB, $20) ; Overworld 3B overlay
%write8($7EF2FB, $20) ; Overworld 7B overlay
%write8($7EF3CA, $40) ; LW/DW
%writeroom($10B, $008F)
%writeroom($028, $0100)
...end
;-------------------------------------------------------------------------------
..first_key_pot
%write8($7EF36F, $00) ; Keys
%writeroom($028, $811F)
...end
;-------------------------------------------------------------------------------
..main_hub
%write8($7EF343, $06) ; Bombs
%writeroom($038, $440A)
%writeroom($037, $308F)
...end
;-------------------------------------------------------------------------------
..hookdash
%writeroom($036, $441F)
...end
;-------------------------------------------------------------------------------
..restock_room
%writeroom($026, $8007)
%writeroom($066, $0003)
%writeroom($076, $008E)
...end
;-------------------------------------------------------------------------------
..phelps_way
%writeroom($016, $000C)
%writeroom($066, $000F)
...end
;-------------------------------------------------------------------------------
..arrghus
%write8($7EF36D, $50) ; Health
%writeroom($016, $440F)
...end
;-------------------------------------------------------------------------------
.ice
;-------------------------------------------------------------------------------
..outside_swamp
%write8($7EF36C, $60) ; Max HP
%write8($7EF36D, $60) ; Health
%write8($7EF381, $00) ; Key for dungeon $05
%write8($7EF37A, $73) ; Crystals
%writeroom($006, $0802)
...end
;-------------------------------------------------------------------------------
..entrance
%write8($7EF2BB, $00) ; Overworld $3B
%write8($7EF2FB, $00) ; Overworld $7B
%write8($7EF36F, $00) ; Keys
%writeroom($00E, $0001)
%writeroom($10B, $000F)
%writeroom($028, $801F)
...end
;-------------------------------------------------------------------------------
..ice_conveyor
%write8($7EF343, $04) ; Bombs
%writeroom($01E, $0004)
%writeroom($03E, $0004)
...end
;-------------------------------------------------------------------------------
..ipbj
%write8($7EF36D, $58) ; Health
%writeroom($03E, $4407)
...end
;-------------------------------------------------------------------------------
..penguin_lineup_room
%write8($7EF343, $03) ; Bombs
%write8($7EF36D, $50) ; Health
%writeroom($04E, $400C)
...end
;-------------------------------------------------------------------------------
..lonely_firebar
%writeroom($05E, $0001)
%writeroom($06E, $0004)
...end
;-------------------------------------------------------------------------------
..last_two_screens
%writeroom($05E, $0003)
%writeroom($07E, $0002)
%writeroom($09E, $0003)
...end
;-------------------------------------------------------------------------------
..kholdstare
%writeroom($0BE, $0001)
%writeroom($0CE, $0004)
...end
;-------------------------------------------------------------------------------
.trock
;-------------------------------------------------------------------------------
..outside_ice
%write8($7EF36C, $68) ; Max HP
%write8($7EF36D, $68) ; Health
%write8($7EF36E, $80) ; Magic
%write8($7EF385, $00) ; Key for dungeon $09
%write8($7EF37A, $77) ; Crystals
%writeroom($0DE, $0804)
...end
;-------------------------------------------------------------------------------
..old_man_cave
%write8($7EF2B7, $02) ; Overworld 37 bomb wall
%write8($7EF343, $02) ; Bombs
%write8($7EF36D, $38) ; Health
%write8($7EF346, $01) ; Ice Rod
%write8($7EF36F, $FF) ; Keys
%write8($7EF377, $0E) ; Arrows
%write8($7EF3CA, $00) ; LW/DW
%writeroom($120, $001A)
...end
;-------------------------------------------------------------------------------
..tr_climb
%write8($7EF3CA, $40) ; LW/DW
...end
;-------------------------------------------------------------------------------
..laser_entrance
...end
;-------------------------------------------------------------------------------
..crystaroller
%write8($7EF343, $01) ; Bombs
%write8($7EF36F, $01) ; Keys
%write8($7EF36D, $28) ; Health
%write8($7EF36E, $78) ; Magic
%writeroom($0B5, $000F)
%writeroom($0C5, $000A)
%writeroom($0D5, $808A)
...end
;-------------------------------------------------------------------------------
..pokey_1
%write8($7EF36E, $70) ; Magic
%writeroom($004, $401A)
%writeroom($014, $800F)
%writeroom($024, $800C)
...end
;-------------------------------------------------------------------------------
..laser_entrance_2
%write8($7EF388, $01) ; Key for dungeon $0C
%write16sram($7EF366, $73B8) ; Big keys
%writeroom($014, $C01F)
%writeroom($013, $8405)
...end
;-------------------------------------------------------------------------------
..switch_maze
%write8($7EF36F, $00) ; Keys
%writeroom($0C5, $800A)
...end
;-------------------------------------------------------------------------------
..trinexx
%write8($7EF36E, $60) ; Magic
%writeroom($0B4, $800F)
%writeroom($0C4, $800F)
...end
;-------------------------------------------------------------------------------
.gtower
;-------------------------------------------------------------------------------
..outside_turtle_rock
%write8($7EF3C7, $08) ; Map marker
%write8($7EF36C, $70) ; Max HP
%write8($7EF36D, $70) ; Health
%write8($7EF388, $00) ; Key for dungeon $0C
%write8($7EF36E, $80) ; Magic
%write8($7EF37A, $7F) ; Crystals
%writeroom($0A4, $0802)
...end
;-------------------------------------------------------------------------------
..old_man_cave
%write8($7EF36D, $40) ; Health
%write8($7EF36F, $FF) ; Keys
%write8($7EF3CA, $00) ; LW/DW
...end
;-------------------------------------------------------------------------------
..entrance
%write8($7EF36F, $00) ; Keys
%write8($7EF3CA, $40) ; LW/DW
%writeroom($00C, $000F)
...end
;-------------------------------------------------------------------------------
..spike_skip
%write8($7EF36F, $01) ; Keys
%writeroom($08C, $0008)
%writeroom($08B, $0404)
...end
;-------------------------------------------------------------------------------
..pre_firesnakes_room
%writeroom($08B, $040E)
%writeroom($09B, $8408)
...end
;-------------------------------------------------------------------------------
..bombable_floor
%write8($7EF377, $13) ; Arrows
%writeroom($09C, $000F)
%writeroom($07D, $201E)
%writeroom($09B, $840F)
...end
;-------------------------------------------------------------------------------
..floor_3
%write8($7EF377, $0B) ; Arrows
%write8($7EF389, $01) ; Key for dungeon $0D
%write16sram($7EF366, $73BC) ; Big keys
%writeroom($01C, $0035)
%writeroom($08C, $0009)
...end
;-------------------------------------------------------------------------------
..mimics1
%write8($7EF377, $0A) ; Arrows
%write8($7EF36D, $28) ; Health
%writeroom($06B, $000C)
...end
;-------------------------------------------------------------------------------
..spike_pit
%write8($7EF377, $02) ; Arrows
%writeroom($06B, $800F)
...end
;-------------------------------------------------------------------------------
..gauntlet_1
%writeroom($05C, $000C)
%writeroom($05B, $8005)
...end
;-------------------------------------------------------------------------------
..lanmola_2
%write8($7EF377, $01) ; Arrows
%write8($7EF36D, $20) ; Health
%write8($7EF36E, $70) ; Magic
%writeroom($06C, $0001)
%writeroom($05D, $000E)
%writeroom($06D, $000A)
...end
;-------------------------------------------------------------------------------
..wizzrobes_1
%write8($7EF36E, $20) ; Magic
%writeroom($06C, $000B)
...end
;-------------------------------------------------------------------------------
..wizzrobes_2
%write8($7EF36E, $18) ; Magic
%writeroom($0A5, $000B)
...end
;-------------------------------------------------------------------------------
..torches_1
%write8($7EF36E, $10) ; Magic
%writeroom($095, $0005)
%writeroom($0A5, $000F)
...end
;-------------------------------------------------------------------------------
..torches_2
%write8($7EF36E, $80) ; Magic
%writeroom($096, $000B)
...end
;-------------------------------------------------------------------------------
..helma_key
%write8($7EF36E, $40) ; Magic
%writeroom($03D, $0001)
...end
;-------------------------------------------------------------------------------
..bombable_wall
%write8($7EF36D, $18) ; Health
%writeroom($03D, $4405)
...end
;-------------------------------------------------------------------------------
..moldorm_2
%write8($7EF343, $00) ; Bombs
%write8($7EF36F, $00) ; Keys
%write8($7EF36D, $10) ; Health
%writeroom($03D, $740F)
...end
;-------------------------------------------------------------------------------
..agahnim_2
%writeroom($04C, $0005)
%writeroom($01D, $800C)
%writeroom($04D, $800F)
...end
;-------------------------------------------------------------------------------
.aga
;-------------------------------------------------------------------------------
..pyramid
%write8($7EF2DB, $20) ; Overworld 5B overlay
%write8($7EF389, $00) ; Key for dungeon $0D
%writeroom($00D, $0802)
...end
;-------------------------------------------------------------------------------
..gold_knights
%write8($7EF29B, $60) ; Overworld $1B: Unknown (..??....)
%write8($7EF36F, $00) ; Keys
%write8($7EF3CA, $00) ; LW/DW
%writeroom($0E0, $0002)
...end
;-------------------------------------------------------------------------------
..dark_room_of_despair
%write8($7EF36D, $48) ; Health
%write8($7EF36E, $30) ; Magic
%writeroom($0D0, $0004)
%writeroom($0E0, $201E)
...end
;-------------------------------------------------------------------------------
..dark_room_of_melancholy
%writeroom($0C0, $0001)
%writeroom($0D0, $801F)
...end
;-------------------------------------------------------------------------------
..spear_guards
%writeroom($0C0, $240F)
...end
;-------------------------------------------------------------------------------
..circle_of_pots
%write8($7EF36E, $00) ; Magic
%writeroom($0B0, $000C)
...end
;-------------------------------------------------------------------------------
..catwalk
%write16sram($7EF360, $63) ; Rupees
%writeroom($040, $0001)
%writeroom($0B0, $240F)
...end
;-------------------------------------------------------------------------------
..agahnim
%writeroom($030, $840A)
%writeroom($040, $000B)
...end
;-------------------------------------------------------------------------------
.ganon
;-------------------------------------------------------------------------------
..pyramid
%write8($7EF3C7, $06) ; Map marker
%write8($7EF36D, $70) ; Health
%write8($7EF3C5, $03) ; Game state
%write8($7EF282, $20) ; Overworld 02 overlay
%write8($7EF36E, $80) ; Magic
%write8($7EF3CA, $40) ; LW/DW
%writeroom($020, $0802)
...end
;-------------------------------------------------------------------------------
.boss
;===================================================================================================
presetend_adold:
print "adold size: $", hex(presetend_adold-presetheader_adold)