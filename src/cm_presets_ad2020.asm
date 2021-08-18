;===================================================================================================
; PRESET DATA HEADER
;===================================================================================================
presetheader_ad2020:
	dw presetSRAM_ad2020 ; location of SRAM
	dw presetpersistent_ad2020 ; location of persistent data

;===================================================================================================
%menu_header("All Dungeons RMG", 16)
	%submenu("Eastern Palace", presetmenu_ad2020_eastern)
	%submenu("Palace of Darkness", presetmenu_ad2020_pod)
	%submenu("Hyrule Castle", presetmenu_ad2020_escape)
	%submenu("Early Hookshot", presetmenu_ad2020_hook)
	%submenu("Thieves' Town", presetmenu_ad2020_thieves)
	%submenu("Skull Woods", presetmenu_ad2020_skull)
	%submenu("Tower of Hera", presetmenu_ad2020_hera)
	%submenu("Misery Mire", presetmenu_ad2020_mire)
	%submenu("Desert Palace", presetmenu_ad2020_desert)
	%submenu("Turtle Rock", presetmenu_ad2020_trock)
	%submenu("Swamp Palace", presetmenu_ad2020_swamp)
	%submenu("Ice Palace", presetmenu_ad2020_ice)
	%submenu("Ganon's Tower", presetmenu_ad2020_gtower)
	%submenu("Agahnim's Tower", presetmenu_ad2020_aga)
	%submenu("Ganon", presetmenu_ad2020_ganon)
	%submenu("Bosses", presetmenu_ad2020_boss)

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; EASTERN PALACE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_ad2020_eastern:
%menu_header("Eastern Palace", 17)

;---------------------------------------------------------------------------------------------------
%preset_UW("Link's Bed", "ad2020", "eastern", "bed")
dw $0104 ; Screen ID
dw $0940, $215A ; Link Coords
dw $0900, $2110 ; Camera HV
db $00 ; Item
db $02 ; Link direction
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
%preset_UW("Courtyard 1", "ad2020", "eastern", "courtyard_1")
dw $0055 ; Screen ID
dw $0A78, $0BDB ; Link Coords
dw $0A00, $0B10 ; Camera HV
db $09 ; Item
db $02 ; Link direction
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
%preset_OW("Castle Entrance", "ad2020", "eastern", "castle_entrance")
dw $001B ; Screen ID
dw $07F8, $06FA ; Link Coords
dw $0784, $069C ; Camera HV
db $09 ; Item
db $00 ; Link direction
;-----------------------------
dw $0803, $0709 ; Scroll X,Y
dw $0530 ; Tilemap position
;dw $0004 ; Scroll mod Y
;dw $FFFA ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Courtyard 2", "ad2020", "eastern", "courtyard_2")
dw $0055 ; Screen ID
dw $0A78, $0BDB ; Link Coords
dw $0A00, $0B10 ; Camera HV
db $09 ; Item
db $02 ; Link direction
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
%preset_OW("East River FAWT", "ad2020", "eastern", "river_clip")
dw $001B ; Screen ID
dw $08AB, $09E3 ; Link Coords
dw $0831, $091E ; Camera HV
db $09 ; Item
db $02 ; Link direction
;-----------------------------
dw $08B6, $098B ; Scroll X,Y
dw $1846 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $FFFF ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Citrus Clip", "ad2020", "eastern", "outside_palace")
dw $002E ; Screen ID
dw $0C90, $0A04 ; Link Coords
dw $0C1E, $0A00 ; Camera HV
db $09 ; Item
db $00 ; Link direction
;-----------------------------
dw $0C9B, $0A6D ; Scroll X,Y
dw $0002 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $FFF2 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "ad2020", "eastern", "entrance")
dw $001E ; Screen ID
dw $0F50, $0A2A ; Link Coords
dw $0EDA, $091E ; Camera HV
db $09 ; Item
db $00 ; Link direction
;-----------------------------
dw $0F57, $098D ; Scroll X,Y
dw $185C ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $0006 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Stalfos Room", "ad2020", "eastern", "stalfos_room")
dw $00A8 ; Screen ID
dw $111C, $1578 ; Link Coords
dw $1100, $150B ; Camera HV
db $09 ; Item
db $04 ; Link direction
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
%preset_UW("Big Chest Room 1", "ad2020", "eastern", "big_chest_room_1")
dw $00A8 ; Screen ID
dw $11BD, $1478 ; Link Coords
dw $1100, $140B ; Camera HV
db $09 ; Item
db $06 ; Link direction
;-----------------------------
db $08 ; Entrance
db $41 ; Room layout
db $00 ; Floor
db $02 ; Door / Peg state
db $11 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Dark Antifairies Room", "ad2020", "eastern", "dark_antifairies_room")
dw $00AA ; Screen ID
dw $1478, $15DA ; Link Coords
dw $1400, $1510 ; Camera HV
db $09 ; Item
db $02 ; Link direction
;-----------------------------
db $08 ; Entrance
db $42 ; Room layout
db $00 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Dark Key Room", "ad2020", "eastern", "dark_key_room")
dw $00BA ; Screen ID
dw $14D4, $1678 ; Link Coords
dw $1400, $160B ; Camera HV
db $09 ; Item
db $06 ; Link direction
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
%preset_UW("Big Key Damage Boost", "ad2020", "eastern", "big_key_dmg_boost")
dw $00B9 ; Screen ID
dw $121B, $1678 ; Link Coords
dw $1200, $160B ; Camera HV
db $09 ; Item
db $04 ; Link direction
;-----------------------------
db $08 ; Entrance
db $C0 ; Room layout
db $00 ; Floor
db $02 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE0F4, $0050) ; Room $BA sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Big Chest Room 2", "ad2020", "eastern", "big_chest_room_2")
dw $00A8 ; Screen ID
dw $11BD, $1478 ; Link Coords
dw $1100, $140B ; Camera HV
db $09 ; Item
db $06 ; Link direction
;-----------------------------
db $08 ; Entrance
db $41 ; Room layout
db $00 ; Floor
db $02 ; Door / Peg state
db $11 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Gifted with Greenies", "ad2020", "eastern", "gwg")
dw $00A9 ; Screen ID
dw $12F8, $1421 ; Link Coords
dw $1280, $1400 ; Camera HV
db $03 ; Item
db $00 ; Link direction
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
%preset_UW("Pot Room", "ad2020", "eastern", "pot_room")
dw $0099 ; Screen ID
dw $1278, $1326 ; Link Coords
dw $1200, $1300 ; Camera HV
db $03 ; Item
db $00 ; Link direction
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
%preset_UW("Zeldagamer Room", "ad2020", "eastern", "zeldagamer_room")
dw $00D9 ; Screen ID
dw $1228, $1B78 ; Link Coords
dw $1200, $1B0B ; Camera HV
db $03 ; Item
db $04 ; Link direction
;-----------------------------
db $08 ; Entrance
db $02 ; Room layout
db $01 ; Floor
db $80 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Armos", "ad2020", "eastern", "armos")
dw $00D8 ; Screen ID
dw $1178, $1A24 ; Link Coords
dw $1100, $1A00 ; Camera HV
db $03 ; Item
db $00 ; Link direction
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
; PALACE OF DARKNESS
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_ad2020_pod:
%menu_header("Palace of Darkness", 17)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Eastern", "ad2020", "pod", "outside_eastern")
dw $001E ; Screen ID
dw $0F50, $062B ; Link Coords
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
%preset_UW("Eastern Spinspeed", "ad2020", "pod", "eastern_spinspeed")
dw $0105 ; Screen ID
dw $0A78, $21D8 ; Link Coords
dw $0A00, $2110 ; Camera HV
db $03 ; Item
db $02 ; Link direction
;-----------------------------
db $45 ; Entrance
db $02 ; Room layout
db $00 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write8_enable()
%write8($7EC167, $00) ; Underworld exit cache
%write8($7EC165, $20) ; Underworld exit cache
%write8($7EC166, $25) ; Underworld exit cache
%write16_enable()
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
%write16($7EC142, $0116) ; Underworld exit cache
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
%preset_OW("DMA", "ad2020", "pod", "dma")
dw $0013 ; Screen ID
dw $0607, $0577 ; Link Coords
dw $0600, $0513 ; Camera HV
db $03 ; Item
db $04 ; Link direction
;-----------------------------
dw $0685, $0582 ; Scroll X,Y
dw $0880 ; Tilemap position
;dw $FFFB ; Scroll mod Y
;dw $0000 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Death Mountain", "ad2020", "pod", "death_mountain")
dw $00F1 ; Screen ID
dw $0378, $1FBD ; Link Coords
dw $0300, $1F10 ; Camera HV
db $03 ; Item
db $02 ; Link direction
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
%preset_OW("Kiki Yeet", "ad2020", "pod", "kiki_yeet")
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

;---------------------------------------------------------------------------------------------------
%preset_OW("Kiki Skip", "ad2020", "pod", "kiki_skip")
dw $0003 ; Screen ID
dw $0748, $062F ; Link Coords
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

;---------------------------------------------------------------------------------------------------
%preset_OW("Real PoD", "ad2020", "pod", "dungeon_reload")
dw $005E ; Screen ID
dw $0F50, $063B ; Link Coords
dw $0ED6, $0600 ; Camera HV
db $01 ; Item
db $02 ; Link direction
;-----------------------------
dw $0F5B, $066D ; Scroll X,Y
dw $005A ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $FFFA ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Main Hub (Big Key)", "ad2020", "pod", "main_hub_bk")
dw $004A ; Screen ID
dw $14F8, $0824 ; Link Coords
dw $1480, $0800 ; Camera HV
db $14 ; Item
db $00 ; Link direction
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
%preset_UW("Main Hub (Hammerjump)", "ad2020", "pod", "main_hub_hammerjump")
dw $004A ; Screen ID
dw $14F8, $0825 ; Link Coords
dw $1480, $0800 ; Camera HV
db $14 ; Item
db $00 ; Link direction
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
%preset_UW("Hammerjump", "ad2020", "pod", "hammerjump")
dw $002A ; Screen ID
dw $1478, $0424 ; Link Coords
dw $1400, $0400 ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $26 ; Entrance
db $C0 ; Room layout
db $00 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FDFF4, $0010) ; Room $3A sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Archery Contest", "ad2020", "pod", "archery_contest")
dw $003A ; Screen ID
dw $1578, $0624 ; Link Coords
dw $1500, $0600 ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $26 ; Entrance
db $C1 ; Room layout
db $00 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Sexy Statue", "ad2020", "pod", "sexy_statue")
dw $002A ; Screen ID
dw $15C0, $04F8 ; Link Coords
dw $1500, $048B ; Camera HV
db $03 ; Item
db $06 ; Link direction
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
%preset_UW("Mimics", "ad2020", "pod", "mimics")
dw $002B ; Screen ID
dw $1678, $0413 ; Link Coords
dw $1600, $0400 ; Camera HV
db $03 ; Item
db $00 ; Link direction
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
%preset_UW("Statue", "ad2020", "pod", "statue")
dw $001B ; Screen ID
dw $1678, $0324 ; Link Coords
dw $1600, $0300 ; Camera HV
db $03 ; Item
db $00 ; Link direction
;-----------------------------
db $26 ; Entrance
db $02 ; Room layout
db $00 ; Floor
db $91 ; Door / Peg state
db $11 ; Layer
dw $0038 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Basement", "ad2020", "pod", "basement")
dw $001B ; Screen ID
dw $1790, $0253 ; Link Coords
dw $1700, $0200 ; Camera HV
db $01 ; Item
db $02 ; Link direction
;-----------------------------
db $26 ; Entrance
db $81 ; Room layout
db $00 ; Floor
db $00 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Turtle Room", "ad2020", "pod", "turtle_room")
dw $000B ; Screen ID
dw $1678, $00D8 ; Link Coords
dw $1600, $0010 ; Camera HV
db $04 ; Item
db $02 ; Link direction
;-----------------------------
db $26 ; Entrance
db $00 ; Room layout
db $FF ; Floor
db $91 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Helmasaur", "ad2020", "pod", "helma")
dw $006A ; Screen ID
dw $1578, $0C24 ; Link Coords
dw $1500, $0C00 ; Camera HV
db $04 ; Item
db $00 ; Link direction
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
; HYRULE CASTLE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_ad2020_escape:
%menu_header("Hyrule Castle", 8)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside PoD", "ad2020", "escape", "outside_pod")
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

;---------------------------------------------------------------------------------------------------
%preset_UW("River Clip", "ad2020", "escape", "sanc_1")
dw $0012 ; Screen ID
dw $04F8, $03BE ; Link Coords
dw $0480, $0310 ; Camera HV
db $03 ; Item
db $02 ; Link direction
;-----------------------------
db $02 ; Entrance
db $C2 ; Room layout
db $00 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "ad2020", "escape", "entrance")
dw $001B ; Screen ID
dw $08C8, $062F ; Link Coords
dw $0656, $051E ; Camera HV
db $03 ; Item
db $00 ; Link direction
;-----------------------------
dw $08D3, $058B ; Scroll X,Y
dw $088A ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $FFFA ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("1st Key Guard", "ad2020", "escape", "1st_keyguard")
dw $0001 ; Screen ID
dw $02F8, $0054 ; Link Coords
dw $0280, $0000 ; Camera HV
db $04 ; Item
db $00 ; Link direction
;-----------------------------
db $05 ; Entrance
db $80 ; Room layout
db $00 ; Floor
db $00 ; Door / Peg state
db $11 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Not So Stealth Room", "ad2020", "escape", "stealth_room")
dw $0082 ; Screen ID
dw $0410, $1180 ; Link Coords
dw $0400, $1110 ; Camera HV
db $04 ; Item
db $04 ; Link direction
;-----------------------------
db $05 ; Entrance
db $C2 ; Room layout
db $FF ; Floor
db $00 ; Door / Peg state
db $11 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE064, $0001) ; Room $72 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("2nd Key Guard", "ad2020", "escape", "2nd_keyguard")
dw $0071 ; Screen ID
dw $02C0, $0F78 ; Link Coords
dw $0200, $0F0B ; Camera HV
db $04 ; Item
db $06 ; Link direction
;-----------------------------
db $05 ; Entrance
db $02 ; Room layout
db $FF ; Floor
db $02 ; Door / Peg state
db $11 ; Layer
dw $0001 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE082, $0001) ; Room $81 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Zelda's Cell", "ad2020", "escape", "zeldas_cell")
dw $0070 ; Screen ID
dw $0050, $0E23 ; Link Coords
dw $0000, $0E00 ; Camera HV
db $04 ; Item
db $00 ; Link direction
;-----------------------------
db $05 ; Entrance
db $00 ; Room layout
db $FE ; Floor
db $00 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE062, $0003) ; Room $71 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Sanctuary", "ad2020", "escape", "sanc_2")
dw $0012 ; Screen ID
dw $04F8, $03BE ; Link Coords
dw $0480, $0310 ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $05 ; Entrance
db $C2 ; Room layout
db $00 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; EARLY HOOKSHOT
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_ad2020_hook:
%menu_header("Early Hookshot", 10)

;---------------------------------------------------------------------------------------------------
%preset_UW("Old Man Cave", "ad2020", "hook", "old_man_cave")
dw $00E4 ; Screen ID
dw $0878, $1D98 ; Link Coords
dw $0800, $1D10 ; Camera HV
db $03 ; Item
db $02 ; Link direction
;-----------------------------
db $30 ; Entrance
db $42 ; Room layout
db $00 ; Floor
db $00 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Hera Entrance", "ad2020", "hook", "entrance")
dw $0003 ; Screen ID
dw $0900, $0478 ; Link Coords
dw $088A, $031E ; Camera HV
db $03 ; Item
db $06 ; Link direction
;-----------------------------
dw $0909, $038D ; Scroll X,Y
dw $1854 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $0006 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Hera to Sewers Clip", "ad2020", "hook", "hera_to_sewers_clip")
dw $0077 ; Screen ID
dw $0F68, $0F4D ; Link Coords
dw $0EF0, $0EE1 ; Camera HV
db $03 ; Item
db $00 ; Link direction
;-----------------------------
db $33 ; Entrance
db $C3 ; Room layout
db $01 ; Floor
db $00 ; Door / Peg state
db $11 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Tile room", "ad2020", "hook", "tile_room")
dw $0077 ; Screen ID
dw $0E78, $0E3C ; Link Coords
dw $0E00, $0E00 ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $33 ; Entrance
db $C0 ; Room layout
db $01 ; Floor
db $00 ; Door / Peg state
db $11 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mini Moldorm Switch", "ad2020", "hook", "minimoldorm_switch")
dw $0087 ; Screen ID
dw $0ED4, $1078 ; Link Coords
dw $0E00, $100C ; Camera HV
db $14 ; Item
db $06 ; Link direction
;-----------------------------
db $33 ; Entrance
db $00 ; Room layout
db $00 ; Floor
db $92 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write8_enable()
%write8($7E0B07, $00) ; kill tile room overlord
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Torches", "ad2020", "hook", "torches")
dw $0087 ; Screen ID
dw $0F78, $10D9 ; Link Coords
dw $0F00, $1010 ; Camera HV
db $09 ; Item
db $02 ; Link direction
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
%preset_UW("Beetles", "ad2020", "hook", "beetles")
dw $0077 ; Screen ID
dw $0F68, $0F4C ; Link Coords
dw $0EF0, $0EE0 ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $33 ; Entrance
db $C3 ; Room layout
db $01 ; Floor
db $00 ; Door / Peg state
db $11 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Petting Zoo", "ad2020", "hook", "petting_zoo")
dw $0031 ; Screen ID
dw $03B8, $0674 ; Link Coords
dw $0300, $0607 ; Camera HV
db $14 ; Item
db $00 ; Link direction
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
%preset_UW("Fake Clippers", "ad2020", "hook", "fake_clippers")
dw $0037 ; Screen ID
dw $0E80, $0630 ; Link Coords
dw $0E08, $0600 ; Camera HV
db $04 ; Item
db $04 ; Link direction
;-----------------------------
db $33 ; Entrance
db $80 ; Room layout
db $03 ; Floor
db $11 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FDFCE, $0008) ; Room $27 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Hookshot", "ad2020", "hook", "hookshot")
dw $0037 ; Screen ID
dw $0E1A, $0778 ; Link Coords
dw $0E00, $070B ; Camera HV
db $03 ; Item
db $04 ; Link direction
;-----------------------------
db $33 ; Entrance
db $82 ; Room layout
db $03 ; Floor
db $12 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; THIEVES' TOWN
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_ad2020_thieves:
%menu_header("Thieves' Town", 15)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Hera", "ad2020", "thieves", "outside_hera")
dw $0003 ; Screen ID
dw $08F0, $007B ; Link Coords
dw $087C, $0017 ; Camera HV
db $14 ; Item
db $02 ; Link direction
;-----------------------------
dw $08FB, $0086 ; Scroll X,Y
dw $0050 ; Tilemap position
;dw $0007 ; Scroll mod Y
;dw $FFF4 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("DMD", "ad2020", "thieves", "dmd")
dw $0043 ; Screen ID
dw $0902, $0164 ; Link Coords
dw $088C, $0101 ; Camera HV
db $14 ; Item
db $04 ; Link direction
;-----------------------------
dw $090B, $0170 ; Scroll X,Y
dw $0754 ; Tilemap position
;dw $FFFD ; Scroll mod Y
;dw $0004 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "ad2020", "thieves", "entrance")
dw $0058 ; Screen ID
dw $01F8, $07C0 ; Link Coords
dw $017A, $0762 ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
dw $01FF, $07CF ; Scroll X,Y
dw $0BB0 ; Tilemap position
;dw $000E ; Scroll mod Y
;dw $0006 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("After Big Key", "ad2020", "thieves", "after_big_key")
dw $00DB ; Screen ID
dw $17D5, $1B68 ; Link Coords
dw $1700, $1AF9 ; Camera HV
db $14 ; Item
db $06 ; Link direction
;-----------------------------
db $34 ; Entrance
db $C3 ; Room layout
db $FF ; Floor
db $00 ; Door / Peg state
db $11 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Stalfos Hallway", "ad2020", "thieves", "blind_hallway")
dw $00CC ; Screen ID
dw $1978, $1824 ; Link Coords
dw $1900, $1800 ; Camera HV
db $14 ; Item
db $00 ; Link direction
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
%preset_UW("Conveyor Gibos", "ad2020", "thieves", "conveyor_gibos")
dw $00BC ; Screen ID
dw $1819, $1778 ; Link Coords
dw $1800, $170B ; Camera HV
db $14 ; Item
db $04 ; Link direction
;-----------------------------
db $34 ; Entrance
db $02 ; Room layout
db $FF ; Floor
db $02 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Hellway", "ad2020", "thieves", "hellway")
dw $00BB ; Screen ID
dw $171A, $1778 ; Link Coords
dw $1700, $170B ; Camera HV
db $14 ; Item
db $04 ; Link direction
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
%preset_UW("Bombable Floor", "ad2020", "thieves", "bombable_floor")
dw $0065 ; Screen ID
dw $0AD8, $0D78 ; Link Coords
dw $0A00, $0D0B ; Camera HV
db $14 ; Item
db $06 ; Link direction
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
%preset_UW("Backtracking", "ad2020", "thieves", "backtracking_1")
dw $0064 ; Screen ID
dw $0878, $0D24 ; Link Coords
dw $0800, $0D00 ; Camera HV
db $01 ; Item
db $00 ; Link direction
;-----------------------------
db $34 ; Entrance
db $02 ; Room layout
db $00 ; Floor
db $10 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Basement", "ad2020", "thieves", "basement")
dw $00BC ; Screen ID
dw $1878, $1623 ; Link Coords
dw $1800, $1600 ; Camera HV
db $01 ; Item
db $00 ; Link direction
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
%preset_UW("Prison", "ad2020", "thieves", "prison")
dw $0045 ; Screen ID
dw $0AD9, $0978 ; Link Coords
dw $0A00, $090B ; Camera HV
db $04 ; Item
db $06 ; Link direction
;-----------------------------
db $34 ; Entrance
db $02 ; Room layout
db $FE ; Floor
db $12 ; Door / Peg state
db $00 ; Layer
dw $000E ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mitts", "ad2020", "thieves", "mitts")
dw $0044 ; Screen ID
dw $0918, $0978 ; Link Coords
dw $0900, $090B ; Camera HV
db $04 ; Item
db $04 ; Link direction
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
%preset_UW("Backtracking", "ad2020", "thieves", "backtracking_2")
dw $0044 ; Screen ID
dw $08D8, $0978 ; Link Coords
dw $0800, $090B ; Camera HV
db $04 ; Item
db $06 ; Link direction
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
%preset_UW("Pot Hammerdash", "ad2020", "thieves", "pot_hammerdash")
dw $0045 ; Screen ID
dw $0A78, $0824 ; Link Coords
dw $0A00, $0800 ; Camera HV
db $04 ; Item
db $00 ; Link direction
;-----------------------------
db $34 ; Entrance
db $00 ; Room layout
db $FE ; Floor
db $10 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE008, $0080) ; Room $44 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Blind", "ad2020", "thieves", "blind")
dw $00BC ; Screen ID
dw $1978, $1625 ; Link Coords
dw $1900, $1600 ; Camera HV
db $04 ; Item
db $00 ; Link direction
;-----------------------------
db $34 ; Entrance
db $41 ; Room layout
db $FF ; Floor
db $11 ; Door / Peg state
db $00 ; Layer
dw $0002 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; SKULL WOODS
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_ad2020_skull:
%menu_header("Skull Woods", 12)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Thieves'", "ad2020", "skull", "outside_thieves")
dw $0058 ; Screen ID
dw $01F8, $07BB ; Link Coords
dw $0176, $075D ; Camera HV
db $04 ; Item
db $02 ; Link direction
;-----------------------------
dw $0203, $07CA ; Scroll X,Y
dw $0B2E ; Tilemap position
;dw $0003 ; Scroll mod Y
;dw $FFFA ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Frogdor", "ad2020", "skull", "frogdor")
dw $0058 ; Screen ID
dw $0350, $09E1 ; Link Coords
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

;---------------------------------------------------------------------------------------------------
%preset_OW("Getting Tempered", "ad2020", "skull", "getting_tempered")
dw $0058 ; Screen ID
dw $03E4, $0918 ; Link Coords
dw $0300, $08B4 ; Camera HV
db $14 ; Item
db $06 ; Link direction
;-----------------------------
dw $038D, $0923 ; Scroll X,Y
dw $1560 ; Tilemap position
;dw $000A ; Scroll mod Y
;dw $0000 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Fencedash", "ad2020", "skull", "fencedash")
dw $0062 ; Screen ID
dw $040C, $090F ; Link Coords
dw $0400, $08AF ; Camera HV
db $14 ; Item
db $04 ; Link direction
;-----------------------------
dw $047D, $091E ; Scroll X,Y
dw $0480 ; Tilemap position
;dw $FFFF ; Scroll mod Y
;dw $0000 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Dash to Skull Woods", "ad2020", "skull", "dash_to_sw")
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
%preset_OW("Mummy Room", "ad2020", "skull", "mummy_room")
dw $0040 ; Screen ID
dw $0248, $024D ; Link Coords
dw $01CA, $01ED ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
dw $024F, $025C ; Scroll X,Y
dw $0EBA ; Tilemap position
;dw $0001 ; Scroll mod Y
;dw $0006 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Bomb Jump", "ad2020", "skull", "bomb_jump")
dw $0040 ; Screen ID
dw $02E8, $025D ; Link Coords
dw $0266, $01FF ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
dw $02F3, $026C ; Scroll X,Y
dw $0F4E ; Tilemap position
;dw $0001 ; Scroll mod Y
;dw $000A ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Key Pot", "ad2020", "skull", "key_pot")
dw $0056 ; Screen ID
dw $0D18, $0B78 ; Link Coords
dw $0D00, $0B0C ; Camera HV
db $01 ; Item
db $04 ; Link direction
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
%preset_OW("Skull Entrance", "ad2020", "skull", "skull_entrance")
dw $0040 ; Screen ID
dw $0098, $00CA ; Link Coords
dw $0012, $006E ; Camera HV
db $05 ; Item
db $00 ; Link direction
;-----------------------------
dw $009F, $00D5 ; Scroll X,Y
dw $0282 ; Tilemap position
;dw $0002 ; Scroll mod Y
;dw $FFFE ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mummy Hellway", "ad2020", "skull", "mummy_hellway")
dw $0049 ; Screen ID
dw $12D7, $0978 ; Link Coords
dw $1200, $090B ; Camera HV
db $05 ; Item
db $06 ; Link direction
;-----------------------------
db $2B ; Entrance
db $02 ; Room layout
db $FF ; Floor
db $02 ; Door / Peg state
db $00 ; Layer
dw $0400 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE032, $0003) ; Room $59 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mummy Key", "ad2020", "skull", "mummy_key")
dw $0049 ; Screen ID
dw $1278, $0824 ; Link Coords
dw $1200, $0800 ; Camera HV
db $05 ; Item
db $00 ; Link direction
;-----------------------------
db $2B ; Entrance
db $00 ; Room layout
db $FF ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0C01 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mothula", "ad2020", "skull", "mothula")
dw $0039 ; Screen ID
dw $12D5, $0778 ; Link Coords
dw $1200, $070B ; Camera HV
db $05 ; Item
db $06 ; Link direction
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
; TOWER OF HERA
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_ad2020_hera:
%menu_header("Tower of Hera", 4)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Skull", "ad2020", "hera", "outside_skull")
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

;---------------------------------------------------------------------------------------------------
%preset_UW("Old Man Cave", "ad2020", "hera", "old_man_cave")
dw $00E4 ; Screen ID
dw $0878, $1D98 ; Link Coords
dw $0800, $1D10 ; Camera HV
db $03 ; Item
db $02 ; Link direction
;-----------------------------
db $30 ; Entrance
db $42 ; Room layout
db $00 ; Floor
db $00 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "ad2020", "hera", "entrance")
dw $0003 ; Screen ID
dw $0900, $0478 ; Link Coords
dw $0889, $031E ; Camera HV
db $03 ; Item
db $06 ; Link direction
;-----------------------------
dw $0908, $038D ; Scroll X,Y
dw $1854 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $0007 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Moldorm", "ad2020", "hera", "moldorm")
dw $0017 ; Screen ID
dw $0FA8, $0274 ; Link Coords
dw $0F00, $0208 ; Camera HV
db $0E ; Item
db $00 ; Link direction
;-----------------------------
db $33 ; Entrance
db $C1 ; Room layout
db $04 ; Floor
db $00 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE06E, $0001) ; Room $77 sprite deaths
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; MISERY MIRE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_ad2020_mire:
%menu_header("Misery Mire", 18)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Hera", "ad2020", "mire", "outside_hera")
dw $0003 ; Screen ID
dw $08F0, $007B ; Link Coords
dw $087C, $0017 ; Camera HV
db $0E ; Item
db $02 ; Link direction
;-----------------------------
dw $08FB, $0086 ; Scroll X,Y
dw $0050 ; Tilemap position
;dw $0007 ; Scroll mod Y
;dw $FFF4 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Swamp DMD", "ad2020", "mire", "swamp_dmd")
dw $0043 ; Screen ID
dw $0902, $0567 ; Link Coords
dw $088C, $031E ; Camera HV
db $0E ; Item
db $04 ; Link direction
;-----------------------------
dw $090B, $038D ; Scroll X,Y
dw $1854 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $0004 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Swamp of Evil", "ad2020", "mire", "overworld")
dw $007A ; Screen ID
dw $040A, $0FF0 ; Link Coords
dw $0400, $031E ; Camera HV
db $0E ; Item
db $04 ; Link direction
;-----------------------------
dw $0485, $038D ; Scroll X,Y
dw $0800 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $0000 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "ad2020", "mire", "entrance")
dw $0070 ; Screen ID
dw $0127, $0CE9 ; Link Coords
dw $00AD, $06E8 ; Camera HV
db $10 ; Item
db $00 ; Link direction
;-----------------------------
dw $0132, $0757 ; Scroll X,Y
dw $1814 ; Tilemap position
;dw $FFF6 ; Scroll mod Y
;dw $FFF3 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mire 2", "ad2020", "mire", "mire2")
dw $0098 ; Screen ID
dw $1188, $1326 ; Link Coords
dw $1100, $1300 ; Camera HV
db $05 ; Item
db $00 ; Link direction
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
%preset_UW("Main Hub", "ad2020", "mire", "main_hub")
dw $00D2 ; Screen ID
dw $0578, $1A25 ; Link Coords
dw $0500, $1A00 ; Camera HV
db $05 ; Item
db $00 ; Link direction
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
%preset_UW("Beat the Fireball", "ad2020", "mire", "beat_the_fireball")
dw $00B2 ; Screen ID
dw $0578, $17D9 ; Link Coords
dw $0500, $1710 ; Camera HV
db $05 ; Item
db $02 ; Link direction
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
%preset_UW("Bari Key", "ad2020", "mire", "bari_key")
dw $00C2 ; Screen ID
dw $0419, $1978 ; Link Coords
dw $0400, $190B ; Camera HV
db $05 ; Item
db $04 ; Link direction
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
%preset_UW("Sluggulas", "ad2020", "mire", "sluggulas")
dw $00C1 ; Screen ID
dw $0278, $19D9 ; Link Coords
dw $0200, $1910 ; Camera HV
db $05 ; Item
db $02 ; Link direction
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
%preset_UW("Torches", "ad2020", "mire", "torches")
dw $00D1 ; Screen ID
dw $02A8, $1A26 ; Link Coords
dw $0200, $1A00 ; Camera HV
db $05 ; Item
db $00 ; Link direction
;-----------------------------
db $27 ; Entrance
db $00 ; Room layout
db $FF ; Floor
db $10 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spark Gamble", "ad2020", "mire", "spark_gamble")
dw $00C1 ; Screen ID
dw $03D7, $1878 ; Link Coords
dw $0300, $180B ; Camera HV
db $05 ; Item
db $06 ; Link direction
;-----------------------------
db $27 ; Entrance
db $01 ; Room layout
db $FF ; Floor
db $12 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Big Chest Room", "ad2020", "mire", "big_chest_room")
dw $00C3 ; Screen ID
dw $06D8, $1978 ; Link Coords
dw $0600, $190B ; Camera HV
db $05 ; Item
db $06 ; Link direction
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
%preset_UW("Spike Key", "ad2020", "mire", "spike_key")
dw $00C3 ; Screen ID
dw $0678, $1824 ; Link Coords
dw $0600, $1800 ; Camera HV
db $0E ; Item
db $00 ; Link direction
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
%preset_UW("Wizzrobe", "ad2020", "mire", "wizzrobe")
dw $00B3 ; Screen ID
dw $0630, $1678 ; Link Coords
dw $0600, $160B ; Camera HV
db $0E ; Item
db $04 ; Link direction
;-----------------------------
db $27 ; Entrance
db $00 ; Room layout
db $FF ; Floor
db $12 ; Door / Peg state
db $11 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Bridge Room", "ad2020", "mire", "bridge_room")
dw $00B2 ; Screen ID
dw $04F8, $1625 ; Link Coords
dw $0480, $1600 ; Camera HV
db $0E ; Item
db $00 ; Link direction
;-----------------------------
db $27 ; Entrance
db $80 ; Room layout
db $FF ; Floor
db $11 ; Door / Peg state
db $00 ; Layer
dw $0001 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Canedash", "ad2020", "mire", "canedash")
dw $0093 ; Screen ID
dw $061B, $1378 ; Link Coords
dw $0600, $130B ; Camera HV
db $12 ; Item
db $04 ; Link direction
;-----------------------------
db $27 ; Entrance
db $02 ; Room layout
db $FE ; Floor
db $12 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spooky Action", "ad2020", "mire", "spooky_action")
dw $0092 ; Screen ID
dw $0519, $1378 ; Link Coords
dw $0500, $130B ; Camera HV
db $05 ; Item
db $04 ; Link direction
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
%preset_UW("Vitreous", "ad2020", "mire", "vitty")
dw $00A0 ; Screen ID
dw $0078, $1425 ; Link Coords
dw $0000, $1400 ; Camera HV
db $05 ; Item
db $00 ; Link direction
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
; DESERT PALACE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_ad2020_desert:
%menu_header("Desert Palace", 8)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Mire", "ad2020", "desert", "outside_mire")
dw $0070 ; Screen ID
dw $0128, $0CDA ; Link Coords
dw $00A6, $0C7C ; Camera HV
db $03 ; Item
db $02 ; Link direction
;-----------------------------
dw $0133, $0CE9 ; Scroll X,Y
dw $0414 ; Tilemap position
;dw $0004 ; Scroll mod Y
;dw $FFFA ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "ad2020", "desert", "entrance")
dw $0030 ; Screen ID
dw $0088, $0CB2 ; Link Coords
dw $0006, $0C50 ; Camera HV
db $14 ; Item
db $02 ; Link direction
;-----------------------------
dw $0093, $0CBD ; Scroll X,Y
dw $0280 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $FFFA ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Torch Key", "ad2020", "desert", "torch_key")
dw $0073 ; Screen ID
dw $0778, $0F24 ; Link Coords
dw $0700, $0F00 ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $0B ; Entrance
db $03 ; Room layout
db $FF ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pre Cannonball Room", "ad2020", "desert", "pre_cannonball_room")
dw $0085 ; Screen ID
dw $0AD6, $1078 ; Link Coords
dw $0A00, $100B ; Camera HV
db $14 ; Item
db $06 ; Link direction
;-----------------------------
db $0B ; Entrance
db $40 ; Room layout
db $FF ; Floor
db $02 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Desert 2 Spinspeed", "ad2020", "desert", "desert2_spinspeed")
dw $0083 ; Screen ID
dw $0678, $11D9 ; Link Coords
dw $0600, $1110 ; Camera HV
db $14 ; Item
db $02 ; Link direction
;-----------------------------
db $0B ; Entrance
db $02 ; Room layout
db $FF ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Popo Genocide", "ad2020", "desert", "popo_genocide_room")
dw $0053 ; Screen ID
dw $0678, $0AD8 ; Link Coords
dw $0600, $0A10 ; Camera HV
db $05 ; Item
db $02 ; Link direction
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
%preset_UW("Torches", "ad2020", "desert", "torches")
dw $0043 ; Screen ID
dw $0778, $0925 ; Link Coords
dw $0700, $0900 ; Camera HV
db $05 ; Item
db $00 ; Link direction
;-----------------------------
db $0C ; Entrance
db $03 ; Room layout
db $01 ; Floor
db $01 ; Door / Peg state
db $11 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE026, $06E0) ; Room $53 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Lanmolas", "ad2020", "desert", "lanmolas")
dw $0043 ; Screen ID
dw $0678, $0825 ; Link Coords
dw $0600, $0800 ; Camera HV
db $05 ; Item
db $00 ; Link direction
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
; TURTLE ROCK
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_ad2020_trock:
%menu_header("Turtle Rock", 9)

;---------------------------------------------------------------------------------------------------
%preset_OW("Ice Rod Map Wrap", "ad2020", "trock", "outside_desert")
dw $0030 ; Screen ID
dw $0128, $0C3B ; Link Coords
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

;---------------------------------------------------------------------------------------------------
%preset_UW("Old Man Cave", "ad2020", "trock", "old_man_cave")
dw $00E4 ; Screen ID
dw $0878, $1D98 ; Link Coords
dw $0800, $1D10 ; Camera HV
db $03 ; Item
db $02 ; Link direction
;-----------------------------
db $30 ; Entrance
db $42 ; Room layout
db $00 ; Floor
db $00 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("TR Climb", "ad2020", "trock", "tr_climb")
dw $0043 ; Screen ID
dw $0902, $0168 ; Link Coords
dw $088C, $0105 ; Camera HV
db $03 ; Item
db $04 ; Link direction
;-----------------------------
dw $090B, $0174 ; Scroll X,Y
dw $0754 ; Tilemap position
;dw $FFF9 ; Scroll mod Y
;dw $0004 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Laser Entrance", "ad2020", "trock", "laser_entrance")
dw $0045 ; Screen ID
dw $0D18, $01CD ; Link Coords
dw $0DFE, $0169 ; Camera HV
db $01 ; Item
db $00 ; Link direction
;-----------------------------
dw $0D7B, $01D8 ; Scroll X,Y
dw $0B60 ; Tilemap position
;dw $0005 ; Scroll mod Y
;dw $0002 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Crystal Roller", "ad2020", "trock", "crystal_roller")
dw $00B5 ; Screen ID
dw $0A78, $1625 ; Link Coords
dw $0A00, $1600 ; Camera HV
db $12 ; Item
db $00 ; Link direction
;-----------------------------
db $18 ; Entrance
db $C0 ; Room layout
db $FE ; Floor
db $00 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE10A, $0040) ; Room $C5 sprite deaths
%write16($7FE12A, $0010) ; Room $D5 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pokey 1", "ad2020", "trock", "pokey_1")
dw $0014 ; Screen ID
dw $081C, $0278 ; Link Coords
dw $0800, $020B ; Camera HV
db $14 ; Item
db $04 ; Link direction
;-----------------------------
db $18 ; Entrance
db $C0 ; Room layout
db $FF ; Floor
db $02 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Laser Entrance 2", "ad2020", "trock", "laser_entrance_2")
dw $00D5 ; Screen ID
dw $0A78, $1BD8 ; Link Coords
dw $0A00, $1B10 ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $18 ; Entrance
db $42 ; Room layout
db $FE ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Switch Maze", "ad2020", "trock", "switch_maze")
dw $00C5 ; Screen ID
dw $0A18, $1978 ; Link Coords
dw $0A00, $190B ; Camera HV
db $12 ; Item
db $04 ; Link direction
;-----------------------------
db $18 ; Entrance
db $42 ; Room layout
db $FE ; Floor
db $02 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Trinexx", "ad2020", "trock", "trinexx")
dw $00B4 ; Screen ID
dw $0878, $1624 ; Link Coords
dw $0800, $1600 ; Camera HV
db $12 ; Item
db $00 ; Link direction
;-----------------------------
db $18 ; Entrance
db $C0 ; Room layout
db $FD ; Floor
db $11 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; SWAMP PALACE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_ad2020_swamp:
%menu_header("Swamp Palace", 12)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Turtle Rock", "ad2020", "swamp", "outside_trock")
dw $0047 ; Screen ID
dw $0F08, $013B ; Link Coords
dw $0E96, $00DD ; Camera HV
db $14 ; Item
db $02 ; Link direction
;-----------------------------
dw $0F13, $014A ; Scroll X,Y
dw $0712 ; Tilemap position
;dw $0003 ; Scroll mod Y
;dw $FFFA ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Zora's Domain", "ad2020", "swamp", "zoras_domain")
dw $000F ; Screen ID
dw $0F37, $0208 ; Link Coords
dw $0EC5, $0200 ; Camera HV
db $14 ; Item
db $06 ; Link direction
;-----------------------------
dw $0F42, $0275 ; Scroll X,Y
dw $0018 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $FFFB ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Link's House", "ad2020", "swamp", "links_house")
dw $0104 ; Screen ID
dw $0978, $2178 ; Link Coords
dw $0900, $2110 ; Camera HV
db $03 ; Item
db $02 ; Link direction
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
%preset_OW("Swamp Overworld", "ad2020", "swamp", "swamp_overworld")
dw $0073 ; Screen ID
dw $07B0, $0DDF ; Link Coords
dw $0700, $0D1E ; Camera HV
db $04 ; Item
db $02 ; Link direction
;-----------------------------
dw $0785, $0D8B ; Scroll X,Y
dw $08A0 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $0000 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Dam", "ad2020", "swamp", "dam")
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

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "ad2020", "swamp", "entrance")
dw $007B ; Screen ID
dw $0778, $0EEF ; Link Coords
dw $06FA, $0E89 ; Camera HV
db $0E ; Item
db $00 ; Link direction
;-----------------------------
dw $077F, $0EFE ; Scroll X,Y
dw $04A0 ; Tilemap position
;dw $0007 ; Scroll mod Y
;dw $0006 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("First Key Pot", "ad2020", "swamp", "first_key_pot")
dw $0028 ; Screen ID
dw $1078, $0426 ; Link Coords
dw $1000, $0400 ; Camera HV
db $0E ; Item
db $00 ; Link direction
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
%preset_UW("Main Hub", "ad2020", "swamp", "main_hub")
dw $0037 ; Screen ID
dw $0E18, $0778 ; Link Coords
dw $0E00, $070C ; Camera HV
db $0E ; Item
db $04 ; Link direction
;-----------------------------
db $25 ; Entrance
db $82 ; Room layout
db $FF ; Floor
db $02 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FDFF0, $0002) ; Room $38 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Diver Down", "ad2020", "swamp", "diver_down")
dw $0026 ; Screen ID
dw $0DB8, $0524 ; Link Coords
dw $0D00, $0500 ; Camera HV
db $0E ; Item
db $00 ; Link direction
;-----------------------------
db $25 ; Entrance
db $83 ; Room layout
db $FF ; Floor
db $00 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FDFEC, $0020) ; Room $36 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Restock Room", "ad2020", "swamp", "restock")
dw $0066 ; Screen ID
dw $0D78, $0D32 ; Link Coords
dw $0D00, $0D00 ; Camera HV
db $0E ; Item
db $00 ; Link direction
;-----------------------------
db $25 ; Entrance
db $83 ; Room layout
db $FE ; Floor
db $01 ; Door / Peg state
db $11 ; Layer
dw $0180 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE06C, $002A) ; Room $76 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Phelps Way", "ad2020", "swamp", "phelps_way")
dw $0016 ; Screen ID
dw $0D78, $02D8 ; Link Coords
dw $0D00, $0210 ; Camera HV
db $0E ; Item
db $02 ; Link direction
;-----------------------------
db $25 ; Entrance
db $81 ; Room layout
db $FF ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Arrghus", "ad2020", "swamp", "arrghus")
dw $0016 ; Screen ID
dw $0C78, $0225 ; Link Coords
dw $0C00, $0200 ; Camera HV
db $0E ; Item
db $00 ; Link direction
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
; ICE PALACE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_ad2020_ice:
%menu_header("Ice Palace", 8)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Swamp", "ad2020", "ice", "outside_swamp")
dw $007B ; Screen ID
dw $0778, $0EEB ; Link Coords
dw $06F2, $0E8D ; Camera HV
db $0E ; Item
db $02 ; Link direction
;-----------------------------
dw $077F, $0EFA ; Scroll X,Y
dw $049E ; Tilemap position
;dw $0003 ; Scroll mod Y
;dw $FFFE ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "ad2020", "ice", "ice_entrance")
dw $0075 ; Screen ID
dw $0CB8, $0DCC ; Link Coords
dw $0DA4, $0D7F ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
dw $0D21, $0DEC ; Scroll X,Y
dw $0E56 ; Tilemap position
;dw $0001 ; Scroll mod Y
;dw $000C ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Penguin Switch Room", "ad2020", "ice", "penguin_switch_room")
dw $001E ; Screen ID
dw $1DD8, $0378 ; Link Coords
dw $1D00, $030B ; Camera HV
db $12 ; Item
db $06 ; Link direction
;-----------------------------
db $2D ; Entrance
db $03 ; Room layout
db $00 ; Floor
db $92 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Break the Ice", "ad2020", "ice", "get_ready_to_break_the_ice")
dw $001F ; Screen ID
dw $1ED4, $0378 ; Link Coords
dw $1E00, $030B ; Camera HV
db $12 ; Item
db $06 ; Link direction
;-----------------------------
db $2D ; Entrance
db $02 ; Room layout
db $00 ; Floor
db $92 ; Door / Peg state
db $00 ; Layer
dw $0030 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spike Key", "ad2020", "ice", "spike_key")
dw $003F ; Screen ID
dw $1EB0, $0725 ; Link Coords
dw $1E00, $0700 ; Camera HV
db $04 ; Item
db $00 ; Link direction
;-----------------------------
db $2D ; Entrance
db $02 ; Room layout
db $FF ; Floor
db $10 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Lonely Firebar", "ad2020", "ice", "lonely_firebar")
dw $005E ; Screen ID
dw $1D17, $0B78 ; Link Coords
dw $1D00, $0B0B ; Camera HV
db $04 ; Item
db $04 ; Link direction
;-----------------------------
db $2D ; Entrance
db $03 ; Room layout
db $FE ; Floor
db $12 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE03E, $0002) ; Room $5F sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Last Two Screens", "ad2020", "ice", "last_two_screens")
dw $009E ; Screen ID
dw $1CD6, $1378 ; Link Coords
dw $1C00, $130B ; Camera HV
db $04 ; Item
db $06 ; Link direction
;-----------------------------
db $2D ; Entrance
db $02 ; Room layout
db $FC ; Floor
db $12 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Kholdstare", "ad2020", "ice", "kholdstare")
dw $00CE ; Screen ID
dw $1D40, $18A9 ; Link Coords
dw $1D00, $1810 ; Camera HV
db $04 ; Item
db $02 ; Link direction
;-----------------------------
db $2D ; Entrance
db $01 ; Room layout
db $FB ; Floor
db $10 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; GANON'S TOWER
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_ad2020_gtower:
%menu_header("Ganon's Tower", 21)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Ice", "ad2020", "gtower", "outside_ice")
dw $0075 ; Screen ID
dw $0CB8, $0DCB ; Link Coords
dw $0C3E, $0D6D ; Camera HV
db $05 ; Item
db $02 ; Link direction
;-----------------------------
dw $0CC3, $0DDA ; Scroll X,Y
dw $0BC6 ; Tilemap position
;dw $0003 ; Scroll mod Y
;dw $FFF2 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Old Man Cave", "ad2020", "gtower", "old_man_cave")
dw $00E4 ; Screen ID
dw $0878, $1D98 ; Link Coords
dw $0800, $1D10 ; Camera HV
db $03 ; Item
db $02 ; Link direction
;-----------------------------
db $30 ; Entrance
db $42 ; Room layout
db $00 ; Floor
db $00 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "ad2020", "gtower", "entrance")
dw $0043 ; Screen ID
dw $08F8, $083C ; Link Coords
dw $0883, $031E ; Camera HV
db $0E ; Item
db $02 ; Link direction
;-----------------------------
dw $0902, $038D ; Scroll X,Y
dw $1854 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $000D ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spike Skip", "ad2020", "gtower", "spike_skip")
dw $008B ; Screen ID
dw $171C, $1078 ; Link Coords
dw $1700, $100C ; Camera HV
db $04 ; Item
db $04 ; Link direction
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
%preset_UW("Pre Firesnakes Room", "ad2020", "gtower", "pre_firesnakes_room")
dw $009B ; Screen ID
dw $16D7, $1278 ; Link Coords
dw $1600, $120B ; Camera HV
db $0E ; Item
db $06 ; Link direction
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
%preset_UW("Bombable Floor", "ad2020", "gtower", "bombable_floor")
dw $009C ; Screen ID
dw $1978, $1225 ; Link Coords
dw $1900, $1200 ; Camera HV
db $01 ; Item
db $00 ; Link direction
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
%preset_UW("Floor 2", "ad2020", "gtower", "floor_2")
dw $000C ; Screen ID
dw $18F8, $0025 ; Link Coords
dw $1880, $0000 ; Camera HV
db $03 ; Item
db $00 ; Link direction
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
%preset_UW("Mimics 1", "ad2020", "gtower", "mimics1")
dw $006B ; Screen ID
dw $1678, $0CD8 ; Link Coords
dw $1600, $0C10 ; Camera HV
db $03 ; Item
db $02 ; Link direction
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
%preset_UW("Mimics 2", "ad2020", "gtower", "mimics2")
dw $006B ; Screen ID
dw $16D8, $0D78 ; Link Coords
dw $1600, $0D0B ; Camera HV
db $03 ; Item
db $06 ; Link direction
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
%preset_UW("Spike Pit", "ad2020", "gtower", "spike_room")
dw $006B ; Screen ID
dw $1778, $0C24 ; Link Coords
dw $1700, $0C00 ; Camera HV
db $03 ; Item
db $00 ; Link direction
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
%preset_UW("Gauntlet 1", "ad2020", "gtower", "gauntlet")
dw $005C ; Screen ID
dw $1978, $0A24 ; Link Coords
dw $1900, $0A00 ; Camera HV
db $03 ; Item
db $00 ; Link direction
;-----------------------------
db $37 ; Entrance
db $81 ; Room layout
db $02 ; Floor
db $00 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE036, $0008) ; Room $5B sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Gauntlet 3", "ad2020", "gtower", "gauntlet3")
dw $005D ; Screen ID
dw $1A78, $0ADA ; Link Coords
dw $1A00, $0A10 ; Camera HV
db $03 ; Item
db $02 ; Link direction
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
%preset_UW("Lanmola 2", "ad2020", "gtower", "lanmola2")
dw $006D ; Screen ID
dw $1A18, $0D78 ; Link Coords
dw $1A00, $0D0B ; Camera HV
db $05 ; Item
db $04 ; Link direction
;-----------------------------
db $37 ; Entrance
db $02 ; Room layout
db $03 ; Floor
db $82 ; Door / Peg state
db $00 ; Layer
dw $00C9 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE03A, $0EFD) ; Room $5D sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Wizzrobes 1", "ad2020", "gtower", "wizz1")
dw $006C ; Screen ID
dw $1878, $0C23 ; Link Coords
dw $1800, $0C00 ; Camera HV
db $05 ; Item
db $00 ; Link direction
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
%preset_UW("Wizzrobes 2", "ad2020", "gtower", "wizz2")
dw $00A5 ; Screen ID
dw $0B78, $1524 ; Link Coords
dw $0B00, $1500 ; Camera HV
db $12 ; Item
db $00 ; Link direction
;-----------------------------
db $37 ; Entrance
db $83 ; Room layout
db $04 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $088C ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Torches 1", "ad2020", "gtower", "torches1")
dw $0095 ; Screen ID
dw $0BD4, $1278 ; Link Coords
dw $0B00, $120B ; Camera HV
db $09 ; Item
db $06 ; Link direction
;-----------------------------
db $37 ; Entrance
db $41 ; Room layout
db $04 ; Floor
db $02 ; Door / Peg state
db $00 ; Layer
dw $0004 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE0CA, $08EF) ; Room $A5 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Torches 2", "ad2020", "gtower", "torches2")
dw $0096 ; Screen ID
dw $0D78, $13A0 ; Link Coords
dw $0D00, $1310 ; Camera HV
db $05 ; Item
db $00 ; Link direction
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
%preset_UW("Helma Key", "ad2020", "gtower", "helma_key")
dw $003D ; Screen ID
dw $1B78, $0718 ; Link Coords
dw $1B00, $0700 ; Camera HV
db $05 ; Item
db $00 ; Link direction
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
%preset_UW("Bombable Wall", "ad2020", "gtower", "bombable_wall")
dw $003D ; Screen ID
dw $1B1C, $0678 ; Link Coords
dw $1B00, $060B ; Camera HV
db $01 ; Item
db $04 ; Link direction
;-----------------------------
db $37 ; Entrance
db $01 ; Room layout
db $05 ; Floor
db $02 ; Door / Peg state
db $00 ; Layer
dw $000C ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Moldorm 2", "ad2020", "gtower", "moldorm_2")
dw $003D ; Screen ID
dw $1A78, $07D8 ; Link Coords
dw $1A00, $0710 ; Camera HV
db $0E ; Item
db $02 ; Link direction
;-----------------------------
db $37 ; Entrance
db $02 ; Room layout
db $05 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Agahnim 2", "ad2020", "gtower", "agahnim_2")
dw $001D ; Screen ID
dw $1A78, $0224 ; Link Coords
dw $1A00, $0200 ; Camera HV
db $0E ; Item
db $00 ; Link direction
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
; AGAHNIM'S TOWER
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_ad2020_aga:
%menu_header("Agahnim's Tower", 8)

;---------------------------------------------------------------------------------------------------
%preset_OW("Pyramid", "ad2020", "aga", "pyramid")
dw $005B ; Screen ID
dw $07F0, $065C ; Link Coords
dw $0778, $0600 ; Camera HV
db $0E ; Item
db $02 ; Link direction
;-----------------------------
dw $07F7, $066D ; Scroll X,Y
dw $002E ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $FFF8 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Gold Knights", "ad2020", "aga", "gold_knights")
dw $00E0 ; Screen ID
dw $0078, $1D24 ; Link Coords
dw $0000, $1D00 ; Camera HV
db $05 ; Item
db $00 ; Link direction
;-----------------------------
db $24 ; Entrance
db $02 ; Room layout
db $01 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Dark Room of Despair", "ad2020", "aga", "dark_room_of_despair")
dw $00D0 ; Screen ID
dw $010A, $1A78 ; Link Coords
dw $0100, $1A0B ; Camera HV
db $05 ; Item
db $04 ; Link direction
;-----------------------------
db $24 ; Entrance
db $01 ; Room layout
db $02 ; Floor
db $02 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE140, $000F) ; Room $E0 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Dark Room of Melancholy", "ad2020", "aga", "dark_room_of_melancholy")
dw $00C0 ; Screen ID
dw $011C, $1978 ; Link Coords
dw $0100, $190B ; Camera HV
db $05 ; Item
db $04 ; Link direction
;-----------------------------
db $24 ; Entrance
db $03 ; Room layout
db $03 ; Floor
db $02 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE120, $0030) ; Room $D0 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spear Guards", "ad2020", "aga", "spear_guards")
dw $00C0 ; Screen ID
dw $0178, $1824 ; Link Coords
dw $0100, $1800 ; Camera HV
db $05 ; Item
db $00 ; Link direction
;-----------------------------
db $24 ; Entrance
db $01 ; Room layout
db $03 ; Floor
db $00 ; Door / Peg state
db $00 ; Layer
dw $001C ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Circle of Pots", "ad2020", "aga", "circle_of_pots")
dw $00B0 ; Screen ID
dw $0078, $16D9 ; Link Coords
dw $0000, $1610 ; Camera HV
db $05 ; Item
db $02 ; Link direction
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
%preset_UW("Catwalk", "ad2020", "aga", "catwalk")
dw $0040 ; Screen ID
dw $0130, $0978 ; Link Coords
dw $0100, $090B ; Camera HV
db $05 ; Item
db $04 ; Link direction
;-----------------------------
db $24 ; Entrance
db $03 ; Room layout
db $05 ; Floor
db $02 ; Door / Peg state
db $11 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE0E0, $0D3F) ; Room $B0 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Agahnim", "ad2020", "aga", "agahnim")
dw $0030 ; Screen ID
dw $0078, $0624 ; Link Coords
dw $0000, $0600 ; Camera HV
db $05 ; Item
db $00 ; Link direction
;-----------------------------
db $24 ; Entrance
db $00 ; Room layout
db $06 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0001 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE000, $0002) ; Room $40 sprite deaths
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; GANON
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_ad2020_ganon:
%menu_header("Ganon", 1)

;---------------------------------------------------------------------------------------------------
%preset_OW("Pyramid", "ad2020", "ganon", "pyramid")
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
;---------------------------------------------------------------------------------------------------
; BOSSES
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_ad2020_boss:
%menu_header("Bosses", 13)
%existing_preset("ad2020", "eastern", "armos")
%existing_preset("ad2020", "pod", "helma")
%existing_preset("ad2020", "thieves", "blind")
%existing_preset("ad2020", "skull", "mothula")
%existing_preset("ad2020", "hera", "moldorm")
%existing_preset("ad2020", "mire", "vitty")
%existing_preset("ad2020", "desert", "lanmolas")
%existing_preset("ad2020", "trock", "trinexx")
%existing_preset("ad2020", "swamp", "arrghus")
%existing_preset("ad2020", "ice", "kholdstare")
%existing_preset("ad2020", "gtower", "agahnim_2")
%existing_preset("ad2020", "aga", "agahnim")
%existing_preset("ad2020", "ganon", "pyramid")

;===================================================================================================
presetpersistent_ad2020:

;===================================================================================================
presetpersistent_ad2020_eastern:
;-----------------------------
.bed
%write_sq()
..end
;-----------------------------
.courtyard_1
..end
;-----------------------------
.castle_entrance
..end
;-----------------------------
.courtyard_2
%write8($7E047A, $01) ; Armed EG
..end
;-----------------------------
.river_clip
%write8($7E047A, $00) ; Armed EG
..end
;-----------------------------
.outside_palace
..end
;-----------------------------
.entrance
..end
;-----------------------------
.stalfos_room
..end
;-----------------------------
.big_chest_room_1
%write8($7E0FCC, $01) ; Prize pack index
..end
;-----------------------------
.dark_antifairies_room
..end
;-----------------------------
.dark_key_room
%write8($7E0FC8, $01) ; Prize pack index
..end
;-----------------------------
.big_key_dmg_boost
%write8($7E0FC8, $02) ; Prize pack index
..end
;-----------------------------
.big_chest_room_2
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
%write8($7E0FC8, $06) ; Prize pack index
%write8($7E0FCC, $03) ; Prize pack index
%write8($7E0FCB, $01) ; Prize pack index
..end

;===================================================================================================
presetpersistent_ad2020_pod:
;-----------------------------
.outside_eastern
%write8($7E02A1, $17) ; ancilla altitude
%write8($7E0B08, $40) ; Arc variable
%write8($7E0B09, $00) ; Arc variable
..end
;-----------------------------
.eastern_spinspeed
..end
;-----------------------------
.dma
..end
;-----------------------------
.death_mountain
..end
;-----------------------------
.kiki_yeet
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
%write8($7E047A, $01) ; Armed EG
..end
;-----------------------------
.hammerjump
%write8($7E047A, $00) ; Armed EG
..end
;-----------------------------
.archery_contest
%write8($7E0FCD, $01) ; Prize pack index
..end
;-----------------------------
.sexy_statue
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
presetpersistent_ad2020_escape:
;-----------------------------
.outside_pod
%write8($7E02A1, $0B) ; ancilla altitude
%write8($7E0B10, $31) ; Overlord X coordinate high byte
%write8($7E0B20, $11) ; Overlord Y coordinate high byte
..end
;-----------------------------
.sanc_1
%write_sq()
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
.zeldas_cell
..end
;-----------------------------
.sanc_2
%write_sq()
..end

;===================================================================================================
presetpersistent_ad2020_hook:
;-----------------------------
.old_man_cave
..end
;-----------------------------
.entrance
..end
;-----------------------------
.hera_to_sewers_clip
..end
;-----------------------------
.tile_room
..end
;-----------------------------
.minimoldorm_switch
..end
;-----------------------------
.torches
..end
;-----------------------------
.beetles
%write8($7E02A1, $00) ; ancilla altitude
%write8($7E03C4, $0A) ; Ancilla Search Index
..end
;-----------------------------
.petting_zoo
%write8($7E0FCC, $02) ; Prize pack index
..end
;-----------------------------
.fake_clippers
..end
;-----------------------------
.hookshot
%write8($7E03C4, $00) ; Ancilla Search Index
..end

;===================================================================================================
presetpersistent_ad2020_thieves:
;-----------------------------
.outside_hera
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
%write8($7E0FCC, $03) ; Prize pack index
..end
;-----------------------------
.mitts
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
presetpersistent_ad2020_skull:
;-----------------------------
.outside_thieves
%write8($7E02A1, $0E) ; ancilla altitude
..end
;-----------------------------
.frogdor
..end
;-----------------------------
.getting_tempered
%write_mirror($70, $02, $70, $0A)
..end
;-----------------------------
.fencedash
%write_mirror($10, $04, $15, $09)
..end
;-----------------------------
.dash_to_sw
..end
;-----------------------------
.mummy_room
..end
;-----------------------------
.bomb_jump
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
%write8($7E0FC9, $01) ; Prize pack index
..end
;-----------------------------
.mothula
..end

;===================================================================================================
presetpersistent_ad2020_hera:
;-----------------------------
.outside_skull
..end
;-----------------------------
.old_man_cave
%write_sq()
..end
;-----------------------------
.entrance
..end
;-----------------------------
.moldorm
%write8($7E0FC8, $01) ; Prize pack index
..end

;===================================================================================================
presetpersistent_ad2020_mire:
;-----------------------------
.outside_hera
%write8($7E02A1, $17) ; ancilla altitude
..end
;-----------------------------
.swamp_dmd
%write8($7E02A2, $12) ; slot 4 altitude
..end
;-----------------------------
.overworld
..end
;-----------------------------
.entrance
..end
;-----------------------------
.mire2
..end
;-----------------------------
.main_hub
%write8($7E0FC8, $03) ; Prize pack index
%write8($7E0FC7, $01) ; Prize pack index
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
.bridge_room
..end
;-----------------------------
.canedash
%write8($7E02A1, $00) ; ancilla altitude
%write8($7E02A2, $FF) ; slot 4 altitude
..end
;-----------------------------
.spooky_action
..end
;-----------------------------
.vitty
..end

;===================================================================================================
presetpersistent_ad2020_desert:
;-----------------------------
.outside_mire
..end
;-----------------------------
.entrance
%write_mirror($75, $00, $13, $0D)
..end
;-----------------------------
.torch_key
..end
;-----------------------------
.pre_cannonball_room
..end
;-----------------------------
.desert2_spinspeed
..end
;-----------------------------
.popo_genocide_room
..end
;-----------------------------
.torches
%write8($7E0FC8, $05) ; Prize pack index
..end
;-----------------------------
.lanmolas
..end

;===================================================================================================
presetpersistent_ad2020_trock:
;-----------------------------
.outside_desert
%write8($7E02A1, $17) ; ancilla altitude
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
.crystal_roller
%write8($7E02A2, $00) ; slot 4 altitude
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
..end

;===================================================================================================
presetpersistent_ad2020_swamp:
;-----------------------------
.outside_trock
%write8($7E02A1, $0B) ; ancilla altitude
..end
;-----------------------------
.zoras_domain
%write_mirror($08, $0F, $38, $01)
..end
;-----------------------------
.links_house
%write_sq()
..end
;-----------------------------
.swamp_overworld
..end
;-----------------------------
.dam
%write_mirror($7B, $07, $06, $0F)
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
.diver_down
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
presetpersistent_ad2020_ice:
;-----------------------------
.outside_swamp
%write8($7E02A1, $00) ; ancilla altitude
..end
;-----------------------------
.ice_entrance
%write_mirror($07, $0A, $42, $0E)
..end
;-----------------------------
.penguin_switch_room
%write8($7E02A2, $22) ; slot 4 altitude
..end
;-----------------------------
.get_ready_to_break_the_ice
..end
;-----------------------------
.spike_key
%write8($7E02A2, $00) ; slot 4 altitude
..end
;-----------------------------
.lonely_firebar
..end
;-----------------------------
.last_two_screens
..end
;-----------------------------
.kholdstare
..end

;===================================================================================================
presetpersistent_ad2020_gtower:
;-----------------------------
.outside_ice
%write8($7E02A1, $0E) ; ancilla altitude
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
.floor_2
%write8($7E0B08, $40) ; Arc variable
%write8($7E0B09, $00) ; Arc variable
..end
;-----------------------------
.mimics1
..end
;-----------------------------
.mimics2
..end
;-----------------------------
.spike_room
%write8($7E0FCB, $03) ; Prize pack index
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
..end
;-----------------------------
.torches1
%write8($7E0FC7, $03) ; Prize pack index
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
presetpersistent_ad2020_aga:
;-----------------------------
.pyramid
%write8($7E02A2, $FE) ; slot 4 altitude
..end
;-----------------------------
.gold_knights
%write8($7E02A2, $F4) ; slot 4 altitude
%write_mirror($EE, $07, $6C, $06)
..end
;-----------------------------
.dark_room_of_despair
%write8($7E0FC8, $01) ; Prize pack index
..end
;-----------------------------
.dark_room_of_melancholy
..end
;-----------------------------
.spear_guards
%write8($7E0FC7, $04) ; Prize pack index
..end
;-----------------------------
.circle_of_pots
%write8($7E0FC7, $05) ; Prize pack index
..end
;-----------------------------
.catwalk
..end
;-----------------------------
.agahnim
..end

;===================================================================================================
presetpersistent_ad2020_ganon:
;-----------------------------
.pyramid
%write8($7E0B08, $40) ; Arc variable
%write8($7E0B09, $00) ; Arc variable
..end

;===================================================================================================

presetSRAM_ad2020:
;-----------------------------
.eastern
;-----------------------------
..bed
%write8($7EF36F, $FF) ; Keys
%writeroom($104, $0002)
...end
;-----------------------------
..courtyard_1
%write8($7EF2BB, $00) ; Overworld $3B
%write8($7EF2FB, $00) ; Overworld $7B
%write8($7EF3C8, $03) ; Spawn point
%write8($7EF359, $01) ; Sword
%write8($7EF3C5, $01) ; Game state
%write8($7EF34A, $01) ; Lamp
%write8($7EF35A, $01) ; Shield
%write8($7EF3C6, $11) ; Game flags A
%writeroom($104, $0012)
%writeroom($055, $000F)
%writeroom($028, $0000)
...end
;-----------------------------
..castle_entrance
...end
;-----------------------------
..courtyard_2
%write8($7EF36D, $18) ; Health
%writeroom($061, $000F)
...end
;-----------------------------
..river_clip
%write8($7EF36D, $12) ; Health
%writeroom($060, $000F)
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
%write8($7EF36D, $18) ; Health
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
..dark_antifairies_room
%write8($7EF377, $05) ; Arrows
%writeroom($0AA, $000A)
...end
;-----------------------------
..dark_key_room
%writeroom($0BA, $0008)
...end
;-----------------------------
..big_key_dmg_boost
%write16sram($7EF360, $05) ; Rupees
%writeroom($0BA, $840C)
%writeroom($0B9, $800F)
...end
;-----------------------------
..big_chest_room_2
%write8($7EF36D, $0C) ; Health
%write16sram($7EF366, $2000) ; Big keys
%writeroom($0A8, $200F)
%writeroom($0B8, $8015)
...end
;-----------------------------
..gwg
%write8($7EF34F, $00) ; Bottles
%write8($7EF377, $0F) ; Arrows
%write8($7EF340, $02) ; Bow
%writeroom($0A9, $201F)
...end
;-----------------------------
..pot_room
%write8($7EF377, $0E) ; Arrows
%write8($7EF36E, $10) ; Magic
%writeroom($099, $C403)
...end
;-----------------------------
..zeldagamer_room
%write8($7EF377, $18) ; Arrows
%writeroom($0DA, $0002)
%writeroom($0D9, $0003)
...end
;-----------------------------
..armos
%write8($7EF377, $1B) ; Arrows
%write16sram($7EF360, $0B) ; Rupees
%writeroom($0D8, $0005)
...end
;-----------------------------
.pod
;-----------------------------
..outside_eastern
%write8($7EF377, $09) ; Arrows
%write8($7EF36C, $20) ; Max HP
%write8($7EF374, $04) ; Pendants
%write8($7EF36D, $20) ; Health
%write8($7EF36E, $80) ; Magic
%writeroom($0C8, $0801)
...end
;-----------------------------
..eastern_spinspeed
%write8($7EF36F, $FF) ; Keys
%write8($7EF343, $03) ; Bombs
%write8($7EF3C7, $03) ; Map marker
%write8($7EF355, $01) ; Boots
%write8($7EF379, $FC) ; Ability
%writeroom($105, $802A)
...end
;-----------------------------
..dma
...end
;-----------------------------
..death_mountain
%write8($7EF3D3, $00) ; Super Bomb Boom
%write8($7EF3C8, $05) ; Spawn point
%write8($7EF3CC, $04) ; Follower
%writeroom($0F0, $000F)
%writeroom($0F1, $000F)
...end
;-----------------------------
..kiki_yeet
%write8($7EF353, $02) ; Magic Mirror
%write8($7EF3C8, $01) ; Spawn point
%write8($7EF3CC, $00) ; Follower
...end
;-----------------------------
..kiki_skip
...end
;-----------------------------
..dungeon_reload
%write8($7EF343, $04) ; Bombs
%write8($7EF36D, $18) ; Health
%writeroom($04A, $200F)
%writeroom($009, $0008)
%writeroom($0F9, $000F)
...end
;-----------------------------
..main_hub_bk
%write8($7EF343, $06) ; Bombs
%write8($7EF36F, $01) ; Keys
%write8($7EF382, $01) ; Key for dungeon $06
%writeroom($009, $0018)
...end
;-----------------------------
..main_hub_hammerjump
%write16sram($7EF366, $2200) ; Big keys
%writeroom($00A, $801F)
%writeroom($03A, $801F)
...end
;-----------------------------
..hammerjump
%write8($7EF36F, $00) ; Keys
%writeroom($02A, $400F)
...end
;-----------------------------
..archery_contest
%write8($7EF343, $07) ; Bombs
%write8($7EF34B, $01) ; Hammer
%write8($7EF382, $00) ; Key for dungeon $06
%writeroom($01A, $101A)
...end
;-----------------------------
..sexy_statue
%write8($7EF36F, $01) ; Keys
%write8($7EF377, $08) ; Arrows
%writeroom($02A, $402F)
...end
;-----------------------------
..mimics
%write8($7EF343, $09) ; Bombs
%writeroom($02B, $000A)
...end
;-----------------------------
..statue
%write8($7EF377, $0E) ; Arrows
%writeroom($01B, $0002)
...end
;-----------------------------
..basement
%write8($7EF377, $0C) ; Arrows
%writeroom($01B, $008E)
...end
;-----------------------------
..turtle_room
%write8($7EF343, $08) ; Bombs
%write8($7EF36F, $00) ; Keys
%writeroom($00B, $200C)
...end
;-----------------------------
..helma
%writeroom($06A, $8005)
%writeroom($00B, $200F)
...end
;-----------------------------
.escape
;-----------------------------
..outside_pod
%write8($7EF36F, $FF) ; Keys
%write8($7EF3C7, $07) ; Map marker
%write8($7EF36C, $28) ; Max HP
%write8($7EF36D, $28) ; Health
%write8($7EF37A, $02) ; Crystals
%writeroom($05A, $0801)
...end
;-----------------------------
..sanc_1
%write8($7EF36F, $00) ; Keys
%write8($7EF355, $01) ; Boots
%write8($7EF36D, $20) ; Health
%write8($7EF343, $08) ; Hookshot
%write8($7EF353, $02) ; Mirror
%write8($7EF377, $0C) ; Arrows
%writeroom($012, $000F)
...end
;-----------------------------
..entrance
...end
;-----------------------------
..1st_keyguard
%writeroom($052, $000F)
%writeroom($062, $000F)
%writeroom($001, $000C)
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
..zeldas_cell
%write8($7EF341, $01) ; Boomerang
%writeroom($070, $0008)
%writeroom($071, $841B)
...end
;-----------------------------
..sanc_2
%write8($7EF29B, $20) ; Overworld 1B overlay
%write8($7EF3C8, $02) ; Spawn point
%write8($7EF3CC, $01) ; Follower
%write16sram($7EF366, $6200) ; Big keys
%write8($7EF3C6, $15) ; Game flags A
%writeroom($080, $042C)
...end
;-----------------------------
.hook
;-----------------------------
..old_man_cave
%write8($7EF36F, $FF) ; Keys
%write8($7EF3C7, $01) ; Map marker
%write8($7EF36C, $30) ; Max HP
%write8($7EF36D, $20) ; Health
%write8($7EF3C8, $01) ; Spawn point
%write8($7EF3CC, $00) ; Follower
%write8($7EF3C5, $02) ; Game state
%writeroom($012, $001F)
%writeroom($0E4, $000A)
...end
;-----------------------------
..entrance
...end
;-----------------------------
..hera_to_sewers_clip
%write8($7EF36F, $00) ; Keys
%writeroom($077, $000F)
...end
;-----------------------------
..tile_room
%write8($7EF343, $07) ; Bombs
%write8($7EF36F, $01) ; Keys
%write8($7EF36D, $18) ; Health
%write8($7EF386, $02) ; Key for dungeon $0A
%writeroom($032, $001F)
%writeroom($042, $000C)
%writeroom($031, $0001)
%writeroom($041, $000F)
%writeroom($077, $800F)
%writeroom($087, $0402)
...end
;-----------------------------
..minimoldorm_switch
%writeroom($087, $040A)
...end
;-----------------------------
..torches
%writeroom($087, $040E)
...end
;-----------------------------
..beetles
%write16sram($7EF366, $6220) ; Big keys
%write8($7EF36E, $64) ; Magic
%write8($7EF386, $01) ; Key for dungeon $0A
%writeroom($087, $041F)
...end
;-----------------------------
..petting_zoo
%write8($7EF343, $08) ; Bombs
%writeroom($031, $800F)
...end
;-----------------------------
..fake_clippers
%write8($7EF343, $07) ; Bombs
%write8($7EF357, $01) ; Moon Pearl
%write8($7EF36F, $01) ; Keys
%write8($7EF36D, $10) ; Health
%writeroom($027, $001F)
...end
;-----------------------------
..hookshot
%write8($7EF343, $05) ; Bombs
%write8($7EF377, $06) ; Arrows
%writeroom($037, $208F)
...end
;-----------------------------
.thieves
;-----------------------------
..outside_hera
%write8($7EF342, $01) ; Hookshot
%write8($7EF386, $00) ; Key for dungeon $0A
%writeroom($036, $001F)
...end
;-----------------------------
..dmd
%write8($7EF3CA, $40) ; LW/DW
...end
;-----------------------------
..entrance
%write8($7EF2D8, $20) ; Overworld 58 overlay
...end
;-----------------------------
..after_big_key
%write8($7EF36F, $00) ; Keys
%write16sram($7EF366, $6230) ; Big keys
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
%write8($7EF36D, $18) ; Health
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
%write8($7EF343, $04) ; Bombs
%writeroom($065, $0103)
...end
;-----------------------------
..basement
%write8($7EF343, $05) ; Bombs
%writeroom($0BC, $C40F)
%writeroom($0BB, $000F)
...end
;-----------------------------
..prison
%write8($7EF343, $04) ; Bombs
%writeroom($044, $0005)
%writeroom($045, $000A)
...end
;-----------------------------
..mitts
%write8($7EF3CC, $06) ; Follower
%writeroom($044, $4005)
%writeroom($045, $00FF)
...end
;-----------------------------
..backtracking_2
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
.skull
;-----------------------------
..outside_thieves
%write8($7EF36C, $38) ; Max HP
%write8($7EF3CC, $00) ; Follower
%write8($7EF36D, $38) ; Health
%write8($7EF36E, $80) ; Magic
%write8($7EF37A, $22) ; Crystals
%write8($7EF387, $00) ; Key for dungeon $0B
%writeroom($0AC, $0A01)
...end
;-----------------------------
..frogdor
%write8($7EF343, $03) ; Bombs
%write8($7EF2D8, $22) ; Overworld $58: Unknown (...?...?)
%write16sram($7EF360, $137) ; Rupees
%writeroom($106, $F012)
...end
;-----------------------------
..getting_tempered
%write8($7EF3CC, $07) ; Follower
%write8($7EF34E, $01) ; Book of Mudora
%writeroom($107, $F002)
...end
;-----------------------------
..fencedash
%write8($7EF3CC, $00) ; Follower
%write8($7EF359, $03) ; Sword
%write8($7EF3C9, $20) ; Game flags B
%write16sram($7EF360, $12D) ; Rupees
%writeroom($121, $0002)
...end
;-----------------------------
..dash_to_sw
%write16sram($7EF360, $259) ; Rupees
%writeroom($11C, $0011)
...end
;-----------------------------
..mummy_room
...end
;-----------------------------
..bomb_jump
%write16sram($7EF366, $62B0) ; Big keys
%writeroom($057, $001A)
...end
;-----------------------------
..key_pot
%write8($7EF343, $02) ; Bombs
%write8($7EF36F, $00) ; Keys
%write8($7EF345, $01) ; Fire Rod
%write8($7EF36D, $28) ; Health
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
%write8($7EF36E, $20) ; Magic
%writeroom($049, $A00F)
...end
;-----------------------------
..mothula
%writeroom($039, $4402)
...end
;-----------------------------
.hera
;-----------------------------
..outside_skull
%write8($7EF36C, $40) ; Max HP
%write8($7EF384, $00) ; Key for dungeon $08
%write8($7EF36D, $40) ; Health
%write8($7EF36E, $80) ; Magic
%write8($7EF37A, $62) ; Crystals
%writeroom($029, $0801)
%writeroom($039, $4403)
...end
;-----------------------------
..old_man_cave
%write8($7EF36D, $28) ; Health
%write8($7EF36F, $FF) ; Keys
%write8($7EF377, $0B) ; Arrows
%write8($7EF3CA, $00) ; LW/DW
...end
;-----------------------------
..entrance
...end
;-----------------------------
..moldorm
%write8($7EF36F, $00) ; Keys
%writeroom($017, $000F)
%writeroom($0A7, $000C)
...end
;-----------------------------
.mire
;-----------------------------
..outside_hera
%write8($7EF36C, $48) ; Max HP
%write8($7EF374, $05) ; Pendants
%write8($7EF36D, $48) ; Health
%writeroom($007, $080F)
...end
;-----------------------------
..swamp_dmd
%write8($7EF348, $01) ; Ether Medallion
%write8($7EF3CA, $40) ; LW/DW
...end
;-----------------------------
..overworld
...end
;-----------------------------
..entrance
%write8($7EF2F0, $20) ; Overworld 70 overlay
%write8($7EF36E, $60) ; Magic
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
%writeroom($0C2, $000F)
%writeroom($0B3, $0402)
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
%write16sram($7EF366, $63B0) ; Big keys
%write8($7EF36E, $40) ; Magic
%writeroom($097, $010F)
%writeroom($0B1, $0007)
%writeroom($0C1, $C407)
%writeroom($0D1, $001B)
...end
;-----------------------------
..big_chest_room
%write8($7EF36D, $40) ; Health
%writeroom($0C3, $000A)
...end
;-----------------------------
..spike_key
%write8($7EF350, $01) ; Cane of Somaria
%writeroom($0C3, $001F)
...end
;-----------------------------
..wizzrobe
%write8($7EF36D, $28) ; Health
%writeroom($0B3, $841A)
...end
;-----------------------------
..bridge_room
%write16sram($7EF360, $25A) ; Rupees
%writeroom($0B2, $800D)
...end
;-----------------------------
..canedash
%write8($7EF36E, $30) ; Magic
%writeroom($0A2, $800F)
%writeroom($093, $000E)
...end
;-----------------------------
..spooky_action
%write8($7EF36E, $28) ; Magic
%writeroom($092, $0005)
...end
;-----------------------------
..vitty
%writeroom($092, $0007)
%writeroom($0A0, $800F)
%writeroom($091, $0005)
...end
;-----------------------------
.desert
;-----------------------------
..outside_mire
%write8($7EF377, $03) ; Arrows
%write8($7EF383, $00) ; Key for dungeon $07
%write8($7EF36C, $50) ; Max HP
%write8($7EF36D, $50) ; Health
%write8($7EF36E, $80) ; Magic
%write8($7EF37A, $63) ; Crystals
%writeroom($090, $0802)
...end
;-----------------------------
..entrance
%write8($7EF3CA, $00) ; LW/DW
...end
;-----------------------------
..torch_key
%write8($7EF36F, $00) ; Keys
%writeroom($073, $0001)
%writeroom($083, $0007)
...end
;-----------------------------
..pre_cannonball_room
%writeroom($074, $0003)
%writeroom($073, $0405)
%writeroom($075, $0002)
%writeroom($085, $400A)
...end
;-----------------------------
..desert2_spinspeed
%write8($7EF37F, $00) ; Key for dungeon $03
%write16sram($7EF366, $73B0) ; Big keys
%writeroom($075, $0017)
%writeroom($085, $400E)
...end
;-----------------------------
..popo_genocide_room
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
%write8($7EF377, $08) ; Arrows
%write8($7EF36E, $50) ; Magic
%writeroom($043, $E48D)
...end
;-----------------------------
.trock
;-----------------------------
..outside_desert
%write8($7EF3C7, $04) ; Map marker
%write8($7EF36C, $58) ; Max HP
%write8($7EF374, $07) ; Pendants
%write8($7EF36D, $58) ; Health
%write8($7EF36E, $80) ; Magic
%writeroom($033, $0802)
...end
;-----------------------------
..old_man_cave
%write8($7EF2B7, $02) ; Overworld 37 bomb wall
%write8($7EF343, $01) ; Bombs
%write8($7EF36D, $38) ; Health
%write8($7EF342, $01) ; Hookshot
%write8($7EF346, $01) ; Ice Rod
%write8($7EF36F, $FF) ; Keys
%write8($7EF377, $08) ; Arrows
%writeroom($120, $001A)
...end
;-----------------------------
..tr_climb
%write8($7EF3CA, $40) ; LW/DW
...end
;-----------------------------
..laser_entrance
...end
;-----------------------------
..crystal_roller
%write8($7EF343, $00) ; Bombs
%write8($7EF36F, $01) ; Keys
%write8($7EF36D, $28) ; Health
%write8($7EF36E, $78) ; Magic
%writeroom($0B5, $000F)
%writeroom($0C5, $000A)
%writeroom($0D5, $808A)
...end
;-----------------------------
..pokey_1
%write8($7EF36E, $70) ; Magic
%writeroom($004, $401A)
%writeroom($014, $800F)
%writeroom($024, $800C)
...end
;-----------------------------
..laser_entrance_2
%write8($7EF388, $01) ; Key for dungeon $0C
%write16sram($7EF366, $73B8) ; Big keys
%writeroom($014, $C01F)
%writeroom($013, $8405)
...end
;-----------------------------
..switch_maze
%write8($7EF36F, $00) ; Keys
%writeroom($0C5, $800A)
...end
;-----------------------------
..trinexx
%write8($7EF36E, $60) ; Magic
%writeroom($0B4, $800F)
%writeroom($0C4, $800F)
...end
;-----------------------------
.swamp
;-----------------------------
..outside_trock
%write8($7EF36C, $60) ; Max HP
%write8($7EF388, $00) ; Key for dungeon $0C
%write8($7EF36D, $60) ; Health
%write8($7EF36E, $80) ; Magic
%write8($7EF37A, $6B) ; Crystals
%writeroom($0A4, $0802)
...end
;-----------------------------
..zoras_domain
%write8($7EF3CA, $00) ; LW/DW
...end
;-----------------------------
..links_house
%write8($7EF36D, $38) ; Health
%write8($7EF379, $FE) ; Ability
%write8($7EF342, $01) ; Hookshot
%write8($7EF356, $01) ; Flippers
%write16sram($7EF360, $CF) ; Rupees
%write8($7EF36F, $FF) ; Keys
...end
;-----------------------------
..swamp_overworld
%write16sram($7EF360, $66) ; Rupees
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
%writeroom($10B, $008F)
%writeroom($028, $0001)
...end
;-----------------------------
..first_key_pot
%write8($7EF36F, $00) ; Keys
%writeroom($028, $811F)
...end
;-----------------------------
..main_hub
%write8($7EF343, $01) ; Bombs
%writeroom($038, $440A)
%writeroom($037, $308F)
...end
;-----------------------------
..diver_down
%writeroom($026, $8003)
%writeroom($036, $441F)
...end
;-----------------------------
..restock
%write8($7EF36E, $78) ; Magic
%writeroom($066, $0003)
%writeroom($076, $000B)
...end
;-----------------------------
..phelps_way
%write8($7EF343, $02) ; Bombs
%write8($7EF377, $0D) ; Arrows
%writeroom($016, $000C)
%writeroom($066, $000F)
...end
;-----------------------------
..arrghus
%writeroom($016, $440F)
...end
;-----------------------------
.ice
;-----------------------------
..outside_swamp
%write8($7EF36C, $68) ; Max HP
%write8($7EF36D, $68) ; Health
%write8($7EF381, $00) ; Key for dungeon $05
%write8($7EF36E, $80) ; Magic
%write8($7EF37A, $7B) ; Crystals
%writeroom($006, $0802)
...end
;-----------------------------
..ice_entrance
%write8($7EF2BB, $00) ; Overworld $3B
%write8($7EF2FB, $00) ; Overworld $7B
%write16sram($7EF360, $67) ; Rupees
%writeroom($10B, $000F)
%writeroom($028, $0080)
...end
;-----------------------------
..penguin_switch_room
%write8($7EF343, $01) ; Bombs
%write8($7EF36F, $00) ; Keys
%write8($7EF36D, $60) ; Health
%write8($7EF36E, $78) ; Magic
%writeroom($00E, $0001)
%writeroom($01E, $0005)
...end
;-----------------------------
..get_ready_to_break_the_ice
%writeroom($01F, $0002)
...end
;-----------------------------
..spike_key
%write8($7EF36E, $70) ; Magic
%writeroom($01F, $0003)
%writeroom($03F, $0003)
...end
;-----------------------------
..lonely_firebar
%write8($7EF36D, $58) ; Health
%writeroom($05E, $8001)
%writeroom($05F, $8012)
...end
;-----------------------------
..last_two_screens
%writeroom($05E, $8003)
%writeroom($07E, $0002)
%writeroom($09E, $0002)
...end
;-----------------------------
..kholdstare
%write8($7EF36E, $80) ; Magic
%writeroom($09E, $0003)
%writeroom($0BE, $0001)
%writeroom($0CE, $0004)
...end
;-----------------------------
.gtower
;-----------------------------
..outside_ice
%write8($7EF3C7, $08) ; Map marker
%write8($7EF36C, $70) ; Max HP
%write8($7EF36D, $70) ; Health
%write8($7EF36E, $80) ; Magic
%write8($7EF385, $00) ; Key for dungeon $09
%write8($7EF37A, $7F) ; Crystals
%writeroom($0DE, $0804)
...end
;-----------------------------
..old_man_cave
%write8($7EF36D, $40) ; Health
%write8($7EF36F, $FF) ; Keys
%write8($7EF377, $0D) ; Arrows
%write8($7EF3CA, $00) ; LW/DW
%writeroom($028, $801F)
...end
;-----------------------------
..entrance
%write8($7EF3CA, $40) ; LW/DW
...end
;-----------------------------
..spike_skip
%write8($7EF36F, $02) ; Keys
%writeroom($00C, $000F)
%writeroom($08C, $0408)
%writeroom($08B, $0404)
...end
;-----------------------------
..pre_firesnakes_room
%writeroom($08B, $040E)
%writeroom($09B, $8408)
...end
;-----------------------------
..bombable_floor
%write8($7EF377, $12) ; Arrows
%writeroom($09C, $000F)
%writeroom($07D, $201E)
%writeroom($09B, $840F)
...end
;-----------------------------
..floor_2
%write8($7EF377, $0A) ; Arrows
%write8($7EF389, $02) ; Key for dungeon $0D
%write16sram($7EF366, $73BC) ; Big keys
%writeroom($01C, $0035)
%writeroom($08C, $0409)
...end
;-----------------------------
..mimics1
%write8($7EF377, $09) ; Arrows
%writeroom($06B, $000C)
...end
;-----------------------------
..mimics2
%write8($7EF377, $0A) ; Arrows
%writeroom($06B, $000E)
...end
;-----------------------------
..spike_room
%write8($7EF377, $06) ; Arrows
%writeroom($06B, $800F)
...end
;-----------------------------
..gauntlet
%writeroom($05C, $000C)
%writeroom($05B, $8005)
...end
;-----------------------------
..gauntlet3
%write8($7EF377, $04) ; Arrows
%writeroom($05D, $000C)
...end
;-----------------------------
..lanmola2
%write8($7EF36E, $70) ; Magic
%writeroom($05D, $000E)
%writeroom($06D, $000A)
...end
;-----------------------------
..wizz1
%write8($7EF36E, $20) ; Magic
%writeroom($06C, $000B)
...end
;-----------------------------
..wizz2
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
%write8($7EF36D, $38) ; Health
%writeroom($03D, $4405)
...end
;-----------------------------
..moldorm_2
%write8($7EF343, $00) ; Bombs
%write8($7EF36F, $01) ; Keys
%write8($7EF36D, $30) ; Health
%writeroom($03D, $740F)
...end
;-----------------------------
..agahnim_2
%writeroom($04C, $0005)
%writeroom($01D, $800C)
%writeroom($04D, $800F)
...end
;-----------------------------
.aga
;-----------------------------
..pyramid
%write8($7EF2DB, $20) ; Overworld 5B overlay
%write8($7EF389, $01) ; Key for dungeon $0D
%writeroom($00D, $0802)
...end
;-----------------------------
..gold_knights
%write8($7EF29B, $60) ; Overworld $1B: Unknown (..??....)
%write8($7EF36F, $00) ; Keys
%write8($7EF3CA, $00) ; LW/DW
%writeroom($0E0, $0002)
...end
;-----------------------------
..dark_room_of_despair
%write8($7EF36E, $30) ; Magic
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
%write8($7EF36D, $38) ; Health
%writeroom($0C0, $240F)
...end
;-----------------------------
..circle_of_pots
%write8($7EF36E, $00) ; Magic
%writeroom($0B0, $000C)
...end
;-----------------------------
..catwalk
%write16sram($7EF360, $6D) ; Rupees
%writeroom($040, $0001)
%writeroom($0B0, $240F)
...end
;-----------------------------
..agahnim
%writeroom($030, $840A)
%writeroom($040, $000B)
...end
;-----------------------------
.ganon
;-----------------------------
..pyramid
%write8($7EF3C7, $06) ; Map marker
%write8($7EF36D, $70) ; Health
%write8($7EF3C5, $03) ; Game state
%write8($7EF282, $20) ; Overworld 02 overlay
%write8($7EF36E, $80) ; Magic
%write8($7EF3CA, $40) ; LW/DW
%writeroom($020, $0802)
...end
;===================================================================================================
presetend_ad2020:
print "ad2020 size: $", hex(presetend_ad2020-presetheader_ad2020)