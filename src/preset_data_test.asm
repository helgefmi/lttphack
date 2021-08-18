
;===================================================================================================
; PRESET DATA HEADER
;===================================================================================================
presetheader_adold:
	dw presetSRAM_adold ; location of SRAM

;===================================================================================================
%menu_header("All dungeons RMG (old route)", 15)
	%submenu("Hyrule Castle", presetmenu_adold_escape)
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
;---------------------------------------------------------------------------------------------------
; HYRULE CASTLE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_adold_escape:
%menu_header("Hyrule Castle", 14)

;---------------------------------------------------------------------------------------------------
%preset_UW("Link's Bed", "adold", "escape", "links_bed")
dw $0104 ; Screen ID
dw $0940, $215A ; Link Coords
dw $2110, $0900 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $00 ; Room layout
db $03 ; Main GFX
db $FF ; Music
db $00 ; Floor
db $FF ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0003) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Courtyard", "adold", "escape", "courtyard")
dw $0055 ; Screen ID
dw $0A78, $0BD9 ; Link Coords
dw $0B10, $0A00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $80 ; Room layout
db $01 ; Main GFX
db $03 ; Music
db $FF ; Floor
db $FF ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0001) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "adold", "escape", "entrance")
dw $001B ; Screen ID
dw $07F8, $06F9 ; Link Coords
dw $069B, $0784 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $0803, $0708 ; Scroll X, Y
dw $0532 ; Unknown 1
dw $0005 ; Unknown 2
dw $000A ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("1st Key Guard", "adold", "escape", "1st_key_guard")
dw $0001 ; Screen ID
dw $02F8, $005A ; Link Coords
dw $0000, $0280 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%preset_UW("Stealth Room", "adold", "escape", "stealth_room")
dw $0082 ; Screen ID
dw $040B, $1178 ; Link Coords
dw $110B, $0400 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $C0 ; Room layout
db $04 ; Main GFX
db $10 ; Music
db $FF ; Floor
db $02 ; Palace No
db $00 ; Door
db $01 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0004) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("2nd Key Guard", "adold", "escape", "2nd_key_guard")
dw $0071 ; Screen ID
dw $02AD, $0F79 ; Link Coords
dw $0F0C, $0200 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $00 ; Room layout
db $04 ; Main GFX
db $10 ; Music
db $FF ; Floor
db $02 ; Palace No
db $00 ; Door
db $01 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0004) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Ball 'n Chains", "adold", "escape", "ball_n_chains")
dw $0070 ; Screen ID
dw $0050, $0E2B ; Link Coords
dw $0E00, $0000 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Backtracking", "adold", "escape", "backtracking")
dw $0080 ; Screen ID
dw $0050, $102D ; Link Coords
dw $1000, $0000 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Key Guard Revisit", "adold", "escape", "key_guard_revisit")
dw $0072 ; Screen ID
dw $04F8, $0F29 ; Link Coords
dw $0F00, $0480 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $80 ; Room layout
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
%preset_UW("Throne Room", "adold", "escape", "throne_room")
dw $0061 ; Screen ID
dw $02F8, $0C2C ; Link Coords
dw $0C00, $0280 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $C0 ; Room layout
db $04 ; Main GFX
db $10 ; Music
db $00 ; Floor
db $02 ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0004) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Snake Avoidance", "adold", "escape", "snake_avoidance")
dw $0041 ; Screen ID
dw $03A8, $082D ; Link Coords
dw $0800, $0300 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Sewer Rooms", "adold", "escape", "sewer_rooms")
dw $0032 ; Screen ID
dw $04F8, $062A ; Link Coords
dw $0600, $0480 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Keyrat", "adold", "escape", "keyrat")
dw $0021 ; Screen ID
dw $02F8, $052D ; Link Coords
dw $0500, $0280 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $80 ; Room layout
db $04 ; Main GFX
db $10 ; Music
db $FF ; Floor
db $00 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0004) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Last Two", "adold", "escape", "last_two")
dw $0011 ; Screen ID
dw $0378, $022E ; Link Coords
dw $0200, $0300 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; EASTERN PALACE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_adold_eastern:
%menu_header("Eastern Palace", 13)

;---------------------------------------------------------------------------------------------------
%preset_UW("Before Cutscene", "adold", "eastern", "before_cutscene")
dw $0002 ; Screen ID
dw $04F8, $01A8 ; Link Coords
dw $0110, $0480 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $80 ; Room layout
db $04 ; Main GFX
db $10 ; Music
db $00 ; Floor
db $00 ; Palace No
db $00 ; Door
db $01 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0004) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Link's House", "adold", "eastern", "links_house")
dw $0104 ; Screen ID
dw $0978, $2178 ; Link Coords
dw $2110, $0900 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $00 ; Room layout
db $03 ; Main GFX
db $07 ; Music
db $00 ; Floor
db $FF ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0003) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("EP Overworld", "adold", "eastern", "ep_overworld")
dw $002E ; Screen ID
dw $0C90, $0A06 ; Link Coords
dw $0A00, $0C1E ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $0C9B, $0A6D ; Scroll X, Y
dw $0002 ; Unknown 1
dw $0000 ; Unknown 2
dw $FFF2 ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Entrance", "adold", "eastern", "entrance")
dw $00C9 ; Screen ID
dw $12F8, $19D8 ; Link Coords
dw $1910, $1280 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $80 ; Room layout
db $05 ; Main GFX
db $11 ; Music
db $00 ; Floor
db $04 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0005) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Stalfos Room", "adold", "eastern", "stalfos_room")
dw $00A8 ; Screen ID
dw $1125, $1578 ; Link Coords
dw $150B, $1100 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $41 ; Room layout
db $05 ; Main GFX
db $11 ; Music
db $00 ; Floor
db $04 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0005) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Big Chest Room 1", "adold", "eastern", "big_chest_room_1")
dw $00A8 ; Screen ID
dw $11BB, $1478 ; Link Coords
dw $140B, $1100 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%preset_UW("Dark Key Room", "adold", "eastern", "dark_key_room")
dw $00BA ; Screen ID
dw $14C8, $167B ; Link Coords
dw $160E, $1400 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $00 ; Room layout
db $05 ; Main GFX
db $11 ; Music
db $00 ; Floor
db $04 ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0005) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Big Key DMG Boost", "adold", "eastern", "big_key_dmg_boost")
dw $00B9 ; Screen ID
dw $1224, $1678 ; Link Coords
dw $160B, $1200 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Big Chest Room 2", "adold", "eastern", "big_chest_room_2")
dw $00A8 ; Screen ID
dw $11B9, $1478 ; Link Coords
dw $140B, $1100 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%preset_UW("Gifted with Greenies", "adold", "eastern", "gifted_with_greenies")
dw $00A9 ; Screen ID
dw $12F8, $1423 ; Link Coords
dw $1400, $1280 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $C0 ; Room layout
db $05 ; Main GFX
db $11 ; Music
db $00 ; Floor
db $04 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0005) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pot Room", "adold", "eastern", "pot_room")
dw $0099 ; Screen ID
dw $1278, $132D ; Link Coords
dw $1300, $1200 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $80 ; Room layout
db $05 ; Main GFX
db $11 ; Music
db $00 ; Floor
db $04 ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0005) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Zeldagamer Room", "adold", "eastern", "zeldagamer_room")
dw $00D9 ; Screen ID
dw $1229, $1B79 ; Link Coords
dw $1B0C, $1200 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $00 ; Room layout
db $05 ; Main GFX
db $11 ; Music
db $01 ; Floor
db $04 ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0005) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Armos", "adold", "eastern", "armos")
dw $00D8 ; Screen ID
dw $1177, $1A30 ; Link Coords
dw $1A00, $1100 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $01 ; Room layout
db $05 ; Main GFX
db $11 ; Music
db $01 ; Floor
db $04 ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0005) ; Overworld Door
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; PALACE OF DARKNESS
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_adold_pod:
%menu_header("Palace of Darkness", 16)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside EP", "adold", "pod", "outside_ep")
dw $001E ; Screen ID
dw $0F50, $062C ; Link Coords
dw $0600, $0ED6 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $0F5B, $066D ; Scroll X, Y
dw $005A ; Unknown 1
dw $0000 ; Unknown 2
dw $FFFA ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Sanctuary", "adold", "pod", "sanctuary")
dw $0012 ; Screen ID
dw $04F8, $029A ; Link Coords
dw $022F, $0480 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $C0 ; Room layout
db $04 ; Main GFX
db $14 ; Music
db $00 ; Floor
db $00 ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0004) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("DMA", "adold", "pod", "dma")
dw $0012 ; Screen ID
dw $05E2, $0584 ; Link Coords
dw $051E, $0500 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $0585, $058B ; Scroll X, Y
dw $08A0 ; Unknown 1
dw $0000 ; Unknown 2
dw $0000 ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Death Mountain", "adold", "pod", "death_mountain")
dw $00F1 ; Screen ID
dw $0378, $1FBA ; Link Coords
dw $1F10, $0300 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $C1 ; Room layout
db $06 ; Main GFX
db $12 ; Music
db $00 ; Floor
db $FF ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0006) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("After Mirror", "adold", "pod", "after_mirror")
dw $0003 ; Screen ID
dw $0718, $03C0 ; Link Coords
dw $031E, $06A4 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $0723, $038D ; Scroll X, Y
dw $1816 ; Unknown 1
dw $0000 ; Unknown 2
dw $FFFC ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Kiki Skip", "adold", "pod", "kiki_skip")
dw $0003 ; Screen ID
dw $0748, $0635 ; Link Coords
dw $031E, $06D4 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $0753, $038D ; Scroll X, Y
dw $181C ; Unknown 1
dw $0000 ; Unknown 2
dw $FFFC ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Dungeon Reload", "adold", "pod", "dungeon_reload")
dw $004A ; Screen ID
dw $14F8, $09D8 ; Link Coords
dw $0910, $1480 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%preset_UW("Main Hub (bk)", "adold", "pod", "main_hub_bk")
dw $004A ; Screen ID
dw $14F8, $081E ; Link Coords
dw $0800, $1480 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%preset_UW("Main Hub (hammerjump)", "adold", "pod", "main_hub_hammerjump")
dw $004A ; Screen ID
dw $14F8, $0820 ; Link Coords
dw $0800, $1480 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%preset_UW("Hammerjump", "adold", "pod", "hammerjump")
dw $002A ; Screen ID
dw $1478, $041C ; Link Coords
dw $0400, $1400 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Archery Contest", "adold", "pod", "archery_contest")
dw $003A ; Screen ID
dw $1578, $0624 ; Link Coords
dw $0600, $1500 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $C1 ; Room layout
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
%preset_UW("Mimics", "adold", "pod", "mimics")
dw $002B ; Screen ID
dw $1678, $041E ; Link Coords
dw $0400, $1600 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $40 ; Room layout
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
%preset_UW("Statue", "adold", "pod", "statue")
dw $001B ; Screen ID
dw $1678, $031C ; Link Coords
dw $0300, $1600 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $00 ; Room layout
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
%preset_UW("Basement", "adold", "pod", "basement")
dw $001B ; Screen ID
dw $1790, $0251 ; Link Coords
dw $0200, $1700 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $81 ; Room layout
db $07 ; Main GFX
db $16 ; Music
db $00 ; Floor
db $0C ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0007) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Turtle Room", "adold", "pod", "turtle_room")
dw $000B ; Screen ID
dw $1678, $00D4 ; Link Coords
dw $0010, $1600 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Helma", "adold", "pod", "helma")
dw $006A ; Screen ID
dw $1578, $0C1C ; Link Coords
dw $0C00, $1500 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; HERA TOWER
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_adold_hera:
%menu_header("Hera Tower", 8)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside PoD", "adold", "hera", "outside_pod")
dw $005E ; Screen ID
dw $0F50, $063B ; Link Coords
dw $0600, $0ED6 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $0F5B, $066D ; Scroll X, Y
dw $005A ; Unknown 1
dw $0000 ; Unknown 2
dw $FFFA ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Old Man Cave", "adold", "hera", "old_man_cave")
dw $00E4 ; Screen ID
dw $0878, $1D98 ; Link Coords
dw $1D10, $0800 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $40 ; Room layout
db $14 ; Main GFX
db $12 ; Music
db $00 ; Floor
db $FF ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0014) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Entrance", "adold", "hera", "entrance")
dw $0077 ; Screen ID
dw $0EF8, $0FBF ; Link Coords
dw $0F10, $0E80 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $C0 ; Room layout
db $05 ; Main GFX
db $11 ; Music
db $01 ; Floor
db $14 ; Palace No
db $01 ; Door
db $01 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0005) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Tile Room", "adold", "hera", "tile_room")
dw $0077 ; Screen ID
dw $0E78, $0E42 ; Link Coords
dw $0E00, $0E00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%preset_UW("Torches", "adold", "hera", "torches")
dw $0087 ; Screen ID
dw $0F78, $10D4 ; Link Coords
dw $1010, $0F00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $01 ; Room layout
db $05 ; Main GFX
db $11 ; Music
db $00 ; Floor
db $14 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0005) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Beetles", "adold", "hera", "beetles")
dw $0077 ; Screen ID
dw $0F68, $0F55 ; Link Coords
dw $0EE9, $0EF0 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $C1 ; Room layout
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
%preset_UW("Petting Zoo", "adold", "hera", "petting_zoo")
dw $0031 ; Screen ID
dw $03B8, $067C ; Link Coords
dw $060F, $0300 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Moldorm", "adold", "hera", "moldorm")
dw $0017 ; Screen ID
dw $0FA8, $027D ; Link Coords
dw $0210, $0F00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $C1 ; Room layout
db $05 ; Main GFX
db $11 ; Music
db $04 ; Floor
db $14 ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0005) ; Overworld Door
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; THIEVES' TOWN
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_adold_thieves:
%menu_header("Thieves' Town", 14)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Hera", "adold", "thieves", "outside_hera")
dw $0003 ; Screen ID
dw $08F0, $007C ; Link Coords
dw $0018, $087C ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $08FB, $0087 ; Scroll X, Y
dw $0050 ; Unknown 1
dw $0006 ; Unknown 2
dw $FFF4 ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("DMD", "adold", "thieves", "dmd")
dw $0043 ; Screen ID
dw $0904, $0164 ; Link Coords
dw $0103, $0890 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $090F, $0172 ; Scroll X, Y
dw $0754 ; Unknown 1
dw $FFFB ; Unknown 2
dw $0000 ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Entrance", "adold", "thieves", "entrance")
dw $00DB ; Screen ID
dw $16F8, $1BD7 ; Link Coords
dw $1B10, $1680 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $C0 ; Room layout
db $0A ; Main GFX
db $16 ; Music
db $FF ; Floor
db $16 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000A) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("After Big Key", "adold", "thieves", "after_big_key")
dw $00DB ; Screen ID
dw $17BF, $1B68 ; Link Coords
dw $1AFB, $1700 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $C1 ; Room layout
db $0A ; Main GFX
db $16 ; Music
db $FF ; Floor
db $16 ; Palace No
db $00 ; Door
db $01 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000A) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Stalfos Hallway", "adold", "thieves", "stalfos_hallway")
dw $00CC ; Screen ID
dw $1978, $1821 ; Link Coords
dw $1800, $1900 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Conveyor Gibos", "adold", "thieves", "conveyor_gibos")
dw $00BC ; Screen ID
dw $1818, $1778 ; Link Coords
dw $170B, $1800 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $00 ; Room layout
db $0A ; Main GFX
db $16 ; Music
db $FF ; Floor
db $16 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000A) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Hellway", "adold", "thieves", "hellway")
dw $00BB ; Screen ID
dw $1717, $1778 ; Link Coords
dw $170B, $1700 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $01 ; Room layout
db $0A ; Main GFX
db $16 ; Music
db $FF ; Floor
db $16 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000A) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Bomb Floor", "adold", "thieves", "bomb_floor")
dw $0065 ; Screen ID
dw $0ADC, $0D78 ; Link Coords
dw $0D0B, $0A00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $00 ; Room layout
db $0A ; Main GFX
db $16 ; Music
db $00 ; Floor
db $16 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000A) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Backtracking", "adold", "thieves", "backtracking")
dw $0064 ; Screen ID
dw $0878, $0D2D ; Link Coords
dw $0D00, $0800 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $00 ; Room layout
db $0A ; Main GFX
db $16 ; Music
db $00 ; Floor
db $16 ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000A) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Basement", "adold", "thieves", "basement")
dw $00BC ; Screen ID
dw $1878, $162C ; Link Coords
dw $1600, $1800 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Prison", "adold", "thieves", "prison")
dw $0045 ; Screen ID
dw $0AD8, $0978 ; Link Coords
dw $090B, $0A00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $00 ; Room layout
db $0A ; Main GFX
db $16 ; Music
db $FE ; Floor
db $16 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000A) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Backtracking", "adold", "thieves", "backtracking_2")
dw $0044 ; Screen ID
dw $08DC, $0978 ; Link Coords
dw $090B, $0800 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $00 ; Room layout
db $0A ; Main GFX
db $16 ; Music
db $FE ; Floor
db $16 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000A) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pot Hammerdash", "adold", "thieves", "pot_hammerdash")
dw $0045 ; Screen ID
dw $0A78, $082D ; Link Coords
dw $0800, $0A00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Blind", "adold", "thieves", "blind")
dw $00BC ; Screen ID
dw $1978, $161C ; Link Coords
dw $1600, $1900 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $41 ; Room layout
db $0A ; Main GFX
db $16 ; Music
db $FF ; Floor
db $16 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000A) ; Overworld Door
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; SKULL WOODS
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_adold_skull:
%menu_header("Skull Woods", 12)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Thieves", "adold", "skull", "outside_thieves")
dw $0058 ; Screen ID
dw $01F8, $07BC ; Link Coords
dw $075E, $0176 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $0203, $07CB ; Scroll X, Y
dw $0B2E ; Unknown 1
dw $0002 ; Unknown 2
dw $FFFA ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Cursed Dwarf", "adold", "skull", "cursed_dwarf")
dw $0058 ; Screen ID
dw $0350, $09E2 ; Link Coords
dw $091E, $02CE ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $035B, $098B ; Scroll X, Y
dw $1858 ; Unknown 1
dw $0000 ; Unknown 2
dw $FFF2 ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Getting Tempered", "adold", "skull", "getting_tempered")
dw $0058 ; Screen ID
dw $03E6, $0918 ; Link Coords
dw $08B4, $0300 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $0385, $0923 ; Scroll X, Y
dw $1560 ; Unknown 1
dw $000A ; Unknown 2
dw $0000 ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Fencedash", "adold", "skull", "fencedash")
dw $0062 ; Screen ID
dw $0408, $0910 ; Link Coords
dw $08B0, $0400 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $047D, $091F ; Scroll X, Y
dw $0480 ; Unknown 1
dw $FFFE ; Unknown 2
dw $0000 ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Dash to Skull Woods", "adold", "skull", "dash_to_skull_woods")
dw $0058 ; Screen ID
dw $0348, $0608 ; Link Coords
dw $0600, $02CA ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $034F, $066F ; Scroll X, Y
dw $005A ; Unknown 1
dw $0000 ; Unknown 2
dw $0006 ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Mummy Room", "adold", "skull", "mummy_room")
dw $0040 ; Screen ID
dw $0248, $024C ; Link Coords
dw $01EC, $01CA ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $024F, $025B ; Scroll X, Y
dw $0EBA ; Unknown 1
dw $0002 ; Unknown 2
dw $0006 ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Bomb Jump", "adold", "skull", "bomb_jump")
dw $0040 ; Screen ID
dw $02E8, $025C ; Link Coords
dw $01FE, $0266 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $02F3, $026B ; Scroll X, Y
dw $0F4E ; Unknown 1
dw $0002 ; Unknown 2
dw $000A ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Key Pot", "adold", "skull", "key_pot")
dw $0056 ; Screen ID
dw $0D16, $0B78 ; Link Coords
dw $0B0C, $0D00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $41 ; Room layout
db $09 ; Main GFX
db $16 ; Music
db $FF ; Floor
db $10 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0009) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Skull Entrance", "adold", "skull", "skull_entrance")
dw $0040 ; Screen ID
dw $0098, $00C8 ; Link Coords
dw $0066, $0012 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $009F, $00D3 ; Scroll X, Y
dw $0282 ; Unknown 1
dw $000A ; Unknown 2
dw $FFFE ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mummy Hellway", "adold", "skull", "mummy_hellway")
dw $0049 ; Screen ID
dw $12D7, $0978 ; Link Coords
dw $090B, $1200 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $00 ; Room layout
db $09 ; Main GFX
db $16 ; Music
db $FF ; Floor
db $10 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0009) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mummy Key", "adold", "skull", "mummy_key")
dw $0049 ; Screen ID
dw $1278, $081F ; Link Coords
dw $0800, $1200 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mothula", "adold", "skull", "mothula")
dw $0039 ; Screen ID
dw $12CC, $0778 ; Link Coords
dw $070B, $1200 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $00 ; Room layout
db $09 ; Main GFX
db $16 ; Music
db $FF ; Floor
db $10 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0009) ; Overworld Door
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; DESERT PALACE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_adold_desert:
%menu_header("Desert Palace", 13)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Skull", "adold", "desert", "outside_skull")
dw $0040 ; Screen ID
dw $0098, $00CB ; Link Coords
dw $0069, $0016 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $00A3, $00D6 ; Scroll X, Y
dw $0282 ; Unknown 1
dw $0007 ; Unknown 2
dw $FFFA ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Ether", "adold", "desert", "ether")
dw $0003 ; Screen ID
dw $08F0, $007C ; Link Coords
dw $0018, $087C ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $08FB, $0087 ; Scroll X, Y
dw $0050 ; Unknown 1
dw $0006 ; Unknown 2
dw $FFF4 ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Bridge Hammerdash", "adold", "desert", "bridge_hammerdash")
dw $0003 ; Screen ID
dw $09E4, $0078 ; Link Coords
dw $0018, $0900 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $097F, $0087 ; Scroll X, Y
dw $0160 ; Unknown 1
dw $0008 ; Unknown 2
dw $0000 ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Zora DMD", "adold", "desert", "zora_dmd")
dw $0005 ; Screen ID
dw $0DE4, $0077 ; Link Coords
dw $0013, $0D00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $0D7D, $0082 ; Scroll X, Y
dw $0160 ; Unknown 1
dw $000D ; Unknown 2
dw $0000 ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Link's House", "adold", "desert", "links_house")
dw $0104 ; Screen ID
dw $0978, $2178 ; Link Coords
dw $2110, $0900 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $00 ; Room layout
db $03 ; Main GFX
db $07 ; Music
db $00 ; Floor
db $FF ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0003) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Swamp Warp", "adold", "desert", "swamp_warp")
dw $0034 ; Screen ID
dw $0808, $0C78 ; Link Coords
dw $0C1A, $0800 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $088D, $0C87 ; Scroll X, Y
dw $0080 ; Unknown 1
dw $FFF6 ; Unknown 2
dw $0000 ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Fluteless Mire", "adold", "desert", "fluteless_mire")
dw $0073 ; Screen ID
dw $060C, $0CC1 ; Link Coords
dw $0C61, $0600 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $0685, $0CCE ; Scroll X, Y
dw $0300 ; Unknown 1
dw $FFFF ; Unknown 2
dw $0000 ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Desert Entrance", "adold", "desert", "desert_entrance")
dw $0083 ; Screen ID
dw $0678, $11D6 ; Link Coords
dw $1110, $0600 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $00 ; Room layout
db $12 ; Main GFX
db $11 ; Music
db $FF ; Floor
db $06 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0012) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Torch Key", "adold", "desert", "torch_key")
dw $0073 ; Screen ID
dw $0778, $0F1F ; Link Coords
dw $0F00, $0700 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $01 ; Room layout
db $12 ; Main GFX
db $11 ; Music
db $FF ; Floor
db $06 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0012) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pre Cannonballs", "adold", "desert", "pre_cannonballs")
dw $0085 ; Screen ID
dw $0AD7, $1078 ; Link Coords
dw $100B, $0A00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Desert 2 Spinspeed", "adold", "desert", "desert_2_spinspeed")
dw $0083 ; Screen ID
dw $0678, $11E2 ; Link Coords
dw $1110, $0600 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $00 ; Room layout
db $12 ; Main GFX
db $11 ; Music
db $FF ; Floor
db $06 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0012) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Torches", "adold", "desert", "torches")
dw $0043 ; Screen ID
dw $0778, $0920 ; Link Coords
dw $0900, $0700 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $01 ; Room layout
db $12 ; Main GFX
db $11 ; Music
db $01 ; Floor
db $06 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0012) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Lanmolas", "adold", "desert", "lanmolas")
dw $0043 ; Screen ID
dw $0678, $0821 ; Link Coords
dw $0800, $0600 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $80 ; Room layout
db $12 ; Main GFX
db $11 ; Music
db $01 ; Floor
db $06 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0012) ; Overworld Door
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; MISERY MIRE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_adold_mire:
%menu_header("Misery Mire", 18)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Desert", "adold", "mire", "outside_desert")
dw $0030 ; Screen ID
dw $0128, $0C3C ; Link Coords
dw $0C00, $00A2 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $012F, $0C6D ; Scroll X, Y
dw $0016 ; Unknown 1
dw $0000 ; Unknown 2
dw $000E ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "adold", "mire", "entrance")
dw $0070 ; Screen ID
dw $0128, $0CD8 ; Link Coords
dw $0C76, $00A6 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $0133, $0CE3 ; Scroll X, Y
dw $0414 ; Unknown 1
dw $000A ; Unknown 2
dw $FFFA ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mire 2", "adold", "mire", "mire_2")
dw $0098 ; Screen ID
dw $1188, $132B ; Link Coords
dw $1300, $1100 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $81 ; Room layout
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
%preset_UW("Main Hub", "adold", "mire", "main_hub")
dw $00D2 ; Screen ID
dw $0578, $1A2F ; Link Coords
dw $1A00, $0500 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spike Key", "adold", "mire", "spike_key")
dw $00B2 ; Screen ID
dw $05D7, $1778 ; Link Coords
dw $170B, $0500 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Beat the Fireball", "adold", "mire", "beat_the_fireball")
dw $00B2 ; Screen ID
dw $0578, $17D5 ; Link Coords
dw $1710, $0500 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $01 ; Room layout
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

;---------------------------------------------------------------------------------------------------
%preset_UW("Bari Switch", "adold", "mire", "bari_switch")
dw $00C2 ; Screen ID
dw $0418, $1978 ; Link Coords
dw $190B, $0400 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $C0 ; Room layout
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
%preset_UW("Sluggulas", "adold", "mire", "sluggulas")
dw $00C1 ; Screen ID
dw $0278, $19D2 ; Link Coords
dw $1910, $0200 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $00 ; Room layout
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

;---------------------------------------------------------------------------------------------------
%preset_UW("Torches", "adold", "mire", "torches")
dw $00D1 ; Screen ID
dw $02A8, $1A2D ; Link Coords
dw $1A00, $0200 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Backtracking", "adold", "mire", "backtracking")
dw $00C1 ; Screen ID
dw $03D5, $1878 ; Link Coords
dw $180B, $0300 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mire to Hera Clip", "adold", "mire", "mire_to_hera_clip")
dw $0097 ; Screen ID
dw $0E78, $12D4 ; Link Coords
dw $1210, $0E00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $00 ; Room layout
db $0C ; Main GFX
db $16 ; Music
db $00 ; Floor
db $0E ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000C) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Hera to Swamp Clip", "adold", "mire", "hera_to_swamp_clip")
dw $0017 ; Screen ID
dw $0E99, $02BA ; Link Coords
dw $0214, $0E1A ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $C0 ; Room layout
db $0C ; Main GFX
db $16 ; Music
db $04 ; Floor
db $0E ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000C) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mire 2-2", "adold", "mire", "mire_2_2")
dw $0098 ; Screen ID
dw $1188, $132D ; Link Coords
dw $1300, $1100 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $81 ; Room layout
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
%preset_UW("Big Chest Room", "adold", "mire", "big_chest_room")
dw $00C3 ; Screen ID
dw $06D4, $1978 ; Link Coords
dw $190B, $0600 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $40 ; Room layout
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
%preset_UW("Main Hub (post Cane)", "adold", "mire", "main_hub_post_cane")
dw $00C3 ; Screen ID
dw $0615, $18F8 ; Link Coords
dw $188B, $0600 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $40 ; Room layout
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
%preset_UW("Bridge Room", "adold", "mire", "bridge_room")
dw $00B2 ; Screen ID
dw $04F8, $1625 ; Link Coords
dw $1600, $047B ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $80 ; Room layout
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

;---------------------------------------------------------------------------------------------------
%preset_UW("Spooky Action", "adold", "mire", "spooky_action")
dw $0092 ; Screen ID
dw $051C, $1378 ; Link Coords
dw $130B, $0500 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $41 ; Room layout
db $0C ; Main GFX
db $16 ; Music
db $FE ; Floor
db $0E ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000C) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Vitreous", "adold", "mire", "vitreous")
dw $00A0 ; Screen ID
dw $0078, $141E ; Link Coords
dw $1400, $0000 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
presetmenu_adold_swamp:
%menu_header("Swamp Palace", 9)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Mire", "adold", "swamp", "outside_mire")
dw $0070 ; Screen ID
dw $0128, $0CDC ; Link Coords
dw $0C7E, $00A6 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $0133, $0CEB ; Scroll X, Y
dw $0414 ; Unknown 1
dw $0002 ; Unknown 2
dw $FFFA ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Antifairy Room", "adold", "swamp", "antifairy_room")
dw $010B ; Screen ID
dw $16F8, $2121 ; Link Coords
dw $2100, $1680 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $80 ; Room layout
db $08 ; Main GFX
db $18 ; Music
db $00 ; Floor
db $FF ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0008) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "adold", "swamp", "entrance")
dw $007B ; Screen ID
dw $0778, $0EED ; Link Coords
dw $0E8E, $0700 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $077D, $0EFB ; Scroll X, Y
dw $0420 ; Unknown 1
dw $0002 ; Unknown 2
dw $0000 ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("First Key Pot", "adold", "swamp", "first_key_pot")
dw $0028 ; Screen ID
dw $1078, $042B ; Link Coords
dw $0400, $1000 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Main Hub", "adold", "swamp", "main_hub")
dw $0037 ; Screen ID
dw $0E19, $0778 ; Link Coords
dw $070C, $0E00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Hookdash", "adold", "swamp", "hookdash")
dw $0036 ; Screen ID
dw $0CF8, $0624 ; Link Coords
dw $0600, $0C80 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Restock Room", "adold", "swamp", "restock_room")
dw $0066 ; Screen ID
dw $0D78, $0D2A ; Link Coords
dw $0D00, $0D00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $81 ; Room layout
db $08 ; Main GFX
db $16 ; Music
db $FE ; Floor
db $0A ; Palace No
db $01 ; Door
db $01 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0008) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Phelps Way", "adold", "swamp", "phelps_way")
dw $0016 ; Screen ID
dw $0D78, $02D5 ; Link Coords
dw $0210, $0D00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Arrghus", "adold", "swamp", "arrghus")
dw $0016 ; Screen ID
dw $0C78, $0218 ; Link Coords
dw $0200, $0C00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
presetmenu_adold_ice:
%menu_header("Ice Palace", 8)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Swamp", "adold", "ice", "outside_swamp")
dw $007B ; Screen ID
dw $0778, $0EEC ; Link Coords
dw $0E8E, $06F2 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $077F, $0EFB ; Scroll X, Y
dw $049E ; Unknown 1
dw $0002 ; Unknown 2
dw $FFFE ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Entrance", "adold", "ice", "entrance")
dw $000E ; Screen ID
dw $1D78, $01D6 ; Link Coords
dw $0110, $1D00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $01 ; Room layout
db $0B ; Main GFX
db $16 ; Music
db $00 ; Floor
db $12 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000B) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Ice Conveyor", "adold", "ice", "ice_conveyor")
dw $003E ; Screen ID
dw $1D78, $06C4 ; Link Coords
dw $0610, $1D00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $01 ; Room layout
db $0B ; Main GFX
db $16 ; Music
db $FF ; Floor
db $12 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000B) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("IPBJ", "adold", "ice", "ipbj")
dw $003E ; Screen ID
dw $1C78, $07D3 ; Link Coords
dw $0710, $1C00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $80 ; Room layout
db $0B ; Main GFX
db $16 ; Music
db $FF ; Floor
db $12 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000B) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Penguin Lineup Room", "adold", "ice", "penguin_lineup_room")
dw $004E ; Screen ID
dw $1DB8, $086A ; Link Coords
dw $0800, $1D00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $01 ; Room layout
db $0B ; Main GFX
db $16 ; Music
db $FF ; Floor
db $12 ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000B) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Lonely Firebar", "adold", "ice", "lonely_firebar")
dw $005E ; Screen ID
dw $1D1C, $0B78 ; Link Coords
dw $0B0B, $1D00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $01 ; Room layout
db $0B ; Main GFX
db $16 ; Music
db $FE ; Floor
db $12 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000B) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Last Two Screens", "adold", "ice", "last_two_screens")
dw $009E ; Screen ID
dw $1D50, $1378 ; Link Coords
dw $130B, $1D00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $01 ; Room layout
db $0B ; Main GFX
db $16 ; Music
db $FC ; Floor
db $12 ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000B) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Kholdstare", "adold", "ice", "kholdstare")
dw $00CE ; Screen ID
dw $1D40, $18AA ; Link Coords
dw $1810, $1D00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; TURTLE ROCK
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_adold_trock:
%menu_header("Turtle Rock", 9)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Ice", "adold", "trock", "outside_ice")
dw $0075 ; Screen ID
dw $0CB8, $0DCB ; Link Coords
dw $0D6D, $0C3E ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $0CC3, $0DDA ; Scroll X, Y
dw $0BC6 ; Unknown 1
dw $0003 ; Unknown 2
dw $FFF2 ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Old Man Cave", "adold", "trock", "old_man_cave")
dw $00E4 ; Screen ID
dw $0878, $1D99 ; Link Coords
dw $1D10, $0800 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $40 ; Room layout
db $14 ; Main GFX
db $12 ; Music
db $00 ; Floor
db $FF ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0014) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("TR Climb", "adold", "trock", "tr_climb")
dw $0043 ; Screen ID
dw $0903, $0164 ; Link Coords
dw $0103, $088F ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $090E, $0172 ; Scroll X, Y
dw $0754 ; Unknown 1
dw $FFFB ; Unknown 2
dw $0001 ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Laser Entrance", "adold", "trock", "laser_entrance")
dw $0045 ; Screen ID
dw $0D18, $01D5 ; Link Coords
dw $0171, $0DFE ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $0D7B, $01E0 ; Scroll X, Y
dw $0B60 ; Unknown 1
dw $FFFD ; Unknown 2
dw $0002 ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Crystal Roller", "adold", "trock", "crystal_roller")
dw $00B5 ; Screen ID
dw $0A78, $162C ; Link Coords
dw $1600, $0A00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $C0 ; Room layout
db $0D ; Main GFX
db $16 ; Music
db $FE ; Floor
db $18 ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000D) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pokey 1", "adold", "trock", "pokey_1")
dw $0014 ; Screen ID
dw $0818, $0278 ; Link Coords
dw $020B, $0800 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%preset_UW("Laser Entrance 2", "adold", "trock", "laser_entrance_2")
dw $00D5 ; Screen ID
dw $0A78, $1BD6 ; Link Coords
dw $1B10, $0A00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $40 ; Room layout
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
%preset_UW("Switch Maze", "adold", "trock", "switch_maze")
dw $00C5 ; Screen ID
dw $0A10, $1978 ; Link Coords
dw $190B, $0A00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $40 ; Room layout
db $0D ; Main GFX
db $16 ; Music
db $FE ; Floor
db $18 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000D) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Trinexx", "adold", "trock", "trinexx")
dw $00B4 ; Screen ID
dw $0878, $1624 ; Link Coords
dw $1600, $0800 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; GANON'S TOWER
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_adold_gtower:
%menu_header("Ganon's Tower", 19)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Turtle Rock", "adold", "gtower", "outside_turtle_rock")
dw $0047 ; Screen ID
dw $0F08, $013B ; Link Coords
dw $00DD, $0E96 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $0F13, $014A ; Scroll X, Y
dw $0712 ; Unknown 1
dw $0003 ; Unknown 2
dw $FFFA ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Old Man Cave", "adold", "gtower", "old_man_cave")
dw $00E4 ; Screen ID
dw $0878, $1D99 ; Link Coords
dw $1D10, $0800 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $40 ; Room layout
db $14 ; Main GFX
db $12 ; Music
db $00 ; Floor
db $FF ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0014) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Entrance", "adold", "gtower", "entrance")
dw $000C ; Screen ID
dw $18F8, $01D7 ; Link Coords
dw $0110, $1880 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $C0 ; Room layout
db $0E ; Main GFX
db $16 ; Music
db $01 ; Floor
db $1A ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spike Skip", "adold", "gtower", "spike_skip")
dw $008B ; Screen ID
dw $1716, $1078 ; Link Coords
dw $100C, $1700 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $01 ; Room layout
db $0E ; Main GFX
db $16 ; Music
db $00 ; Floor
db $1A ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pre Firesnakes Room", "adold", "gtower", "pre_firesnakes_room")
dw $009B ; Screen ID
dw $16D7, $1278 ; Link Coords
dw $120B, $1600 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $00 ; Room layout
db $0E ; Main GFX
db $16 ; Music
db $00 ; Floor
db $1A ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Bombable Floor", "adold", "gtower", "bombable_floor")
dw $009C ; Screen ID
dw $1978, $121E ; Link Coords
dw $1200, $1900 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Floor 2", "adold", "gtower", "floor_2")
dw $000C ; Screen ID
dw $18F8, $002A ; Link Coords
dw $0000, $1880 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $C0 ; Room layout
db $0E ; Main GFX
db $16 ; Music
db $01 ; Floor
db $1A ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mimics 1", "adold", "gtower", "mimics_1")
dw $006B ; Screen ID
dw $1678, $0CCF ; Link Coords
dw $0C10, $1600 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $80 ; Room layout
db $0E ; Main GFX
db $16 ; Music
db $02 ; Floor
db $1A ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spike Pit", "adold", "gtower", "spike_pit")
dw $006B ; Screen ID
dw $1778, $0C1C ; Link Coords
dw $0C00, $1700 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $81 ; Room layout
db $0E ; Main GFX
db $16 ; Music
db $02 ; Floor
db $1A ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Gauntlet 1", "adold", "gtower", "gauntlet_1")
dw $005C ; Screen ID
dw $1978, $0A24 ; Link Coords
dw $0A00, $1900 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Lanmola 2", "adold", "gtower", "lanmola_2")
dw $006C ; Screen ID
dw $1917, $0D78 ; Link Coords
dw $0D0B, $1900 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $01 ; Room layout
db $0E ; Main GFX
db $16 ; Music
db $03 ; Floor
db $1A ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Wizzrobes 1", "adold", "gtower", "wizzrobes_1")
dw $006C ; Screen ID
dw $1878, $0C27 ; Link Coords
dw $0C00, $1800 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $00 ; Room layout
db $0E ; Main GFX
db $16 ; Music
db $03 ; Floor
db $1A ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Wizzrobes 2", "adold", "gtower", "wizzrobes_2")
dw $00A5 ; Screen ID
dw $0B78, $1527 ; Link Coords
dw $1500, $0B00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $81 ; Room layout
db $0E ; Main GFX
db $16 ; Music
db $04 ; Floor
db $1A ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Torches 1", "adold", "gtower", "torches_1")
dw $0095 ; Screen ID
dw $0BD7, $1278 ; Link Coords
dw $120B, $0B00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $41 ; Room layout
db $0E ; Main GFX
db $16 ; Music
db $04 ; Floor
db $1A ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Torches 2", "adold", "gtower", "torches_2")
dw $0096 ; Screen ID
dw $0D78, $139F ; Link Coords
dw $1310, $0D00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $01 ; Room layout
db $0E ; Main GFX
db $16 ; Music
db $04 ; Floor
db $1A ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Helma Key", "adold", "gtower", "helma_key")
dw $003D ; Screen ID
dw $1B78, $0721 ; Link Coords
dw $0700, $1B00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $01 ; Room layout
db $0E ; Main GFX
db $16 ; Music
db $05 ; Floor
db $1A ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Bombable Wall", "adold", "gtower", "bombable_wall")
dw $003D ; Screen ID
dw $1B17, $0678 ; Link Coords
dw $060B, $1B00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%preset_UW("Moldorm 2", "adold", "gtower", "moldorm_2")
dw $003D ; Screen ID
dw $1A78, $07D3 ; Link Coords
dw $0710, $1A00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $00 ; Room layout
db $0E ; Main GFX
db $16 ; Music
db $05 ; Floor
db $1A ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Agahnim 2", "adold", "gtower", "agahnim_2")
dw $001D ; Screen ID
dw $1A78, $0222 ; Link Coords
dw $0200, $1A00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
; AGAHNIM'S TOWER
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_adold_aga:
%menu_header("Agahnim's Tower", 8)

;---------------------------------------------------------------------------------------------------
%preset_OW("Pyramid", "adold", "aga", "pyramid")
dw $005B ; Screen ID
dw $07F1, $065C ; Link Coords
dw $0600, $0779 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $07F8, $066D ; Scroll X, Y
dw $002E ; Unknown 1
dw $0000 ; Unknown 2
dw $FFF7 ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Gold Knights", "adold", "aga", "gold_knights")
dw $00E0 ; Screen ID
dw $0078, $1D1E ; Link Coords
dw $1D00, $0000 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $00 ; Room layout
db $04 ; Main GFX
db $10 ; Music
db $01 ; Floor
db $08 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0004) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Dark Room of Despair", "adold", "aga", "dark_room_of_despair")
dw $00D0 ; Screen ID
dw $0117, $1A78 ; Link Coords
dw $1A0B, $0100 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Dark Room of Melancholy", "adold", "aga", "dark_room_of_melancholy")
dw $00C0 ; Screen ID
dw $011A, $1978 ; Link Coords
dw $190B, $0100 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $01 ; Room layout
db $04 ; Main GFX
db $10 ; Music
db $03 ; Floor
db $08 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0004) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spear Guards", "adold", "aga", "spear_guards")
dw $00C0 ; Screen ID
dw $0178, $182D ; Link Coords
dw $1800, $0100 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Circle of Pots", "adold", "aga", "circle_of_pots")
dw $00B0 ; Screen ID
dw $0078, $16DC ; Link Coords
dw $1610, $0000 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pit Room", "adold", "aga", "pit_room")
dw $0040 ; Screen ID
dw $012C, $0978 ; Link Coords
dw $090B, $0100 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
db $01 ; Room layout
db $04 ; Main GFX
db $10 ; Music
db $05 ; Floor
db $08 ; Palace No
db $02 ; Door
db $01 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0004) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Agahnim", "adold", "aga", "agahnim")
dw $0030 ; Screen ID
dw $0078, $0624 ; Link Coords
dw $0600, $0000 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
db $00 ; Entrance
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
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; GANON
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_adold_ganon:
%menu_header("Ganon", 1)

;---------------------------------------------------------------------------------------------------
%preset_OW("Pyramid", "adold", "ganon", "pyramid")
dw $005B ; Screen ID
dw $07F0, $065C ; Link Coords
dw $0600, $0778 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $00 ; Item
db $00 ; Link direction
;-----------------------------
dw $07F7, $066D ; Scroll X, Y
dw $002E ; Unknown 1
dw $0000 ; Unknown 2
dw $FFF8 ; Unknown 3
;-----------------------------
%write8_enable()
%write8($7EC167, $7D) ; Underworld exit cache
%write8($7EC165, $23) ; Underworld exit cache
%write8($7EC166, $51) ; Underworld exit cache
%write8($7E02A2, $00) ; Arc variable
%write8($7E0642, $01) ; Room puzzle state (?)
%write8($7E0B09, $B0) ; Arc variable
%write8($7E0B39, $00) ; Arc variable
%write8($7E0B3D, $00) ; Arc variable
%write8($7E0B3A, $00) ; Arc variable
%write8($7E0B3B, $00) ; Arc variable
%write8($7E0B3F, $00) ; Arc variable
%write8($7E0B3E, $00) ; Arc variable
%write8($7E0B0C, $A0) ; Arc variable
%write8($7E0B3C, $00) ; Arc variable
%write8($7E0642, $00) ; Room puzzle state (?)
%write8($7E0ABD, $00) ; Palette swap
%write8($7E0B0C, $20) ; Arc variable
%write8($7E0468, $00) ; Trap door state
%write8($7E0641, $00) ; Room puzzle state (?)
%write8($7E0468, $00) ; Trap door state
%write8($7E0B09, $00) ; Arc variable
%write8($7E02A1, $17) ; Arc variable
%write8($7E0B08, $40) ; Arc variable
%write8($7E029F, $00) ; Arc variable
%write8($7E0B0C, $D0) ; Arc variable
%write8($7E0B3F, $01) ; Arc variable
%write8($7E0642, $01) ; Room puzzle state (?)
%write8($7E0642, $00) ; Room puzzle state (?)
%write8($7E0468, $01) ; Trap door state
%write8($7E0B09, $08) ; Arc variable
%write8($7E02A1, $08) ; Arc variable
%write8($7E0B08, $02) ; Arc variable
%write8($7E0B0C, $6E) ; Arc variable
%write8($7E0B3F, $00) ; Arc variable
%write8($7E02A1, $00) ; Arc variable
%write8($7E02A1, $17) ; Arc variable
%write8($7E0ABD, $01) ; Palette swap
%write8($7E0ABD, $00) ; Palette swap
%write8($7E0B0C, $B0) ; Arc variable
%write8($7E029F, $01) ; Arc variable
%write8($7E029F, $00) ; Arc variable
%write8($7E0B3F, $01) ; Arc variable
%write8($7E0468, $01) ; Trap door state
%write8($7E02A1, $0E) ; Arc variable
%write8($7E029F, $11) ; Arc variable
%write8($7E0B3F, $00) ; Arc variable
%write8($7E029F, $00) ; Arc variable
%write8($7E0468, $01) ; Trap door state
%write8($7E02A1, $0B) ; Arc variable
%write8($7E02A2, $0F) ; Arc variable
%write8($7E02A1, $17) ; Arc variable
%write8($7E0B0C, $A0) ; Arc variable
%write8($7E0B3F, $01) ; Arc variable
%write8($7E0B3F, $00) ; Arc variable
%write8($7E02A1, $00) ; Arc variable
%write8($7E02A2, $FF) ; Arc variable
%write8($7E02A1, $0E) ; Arc variable
%write8($7E02A2, $00) ; Arc variable
%write8($7EC167, $04) ; Underworld exit cache
%write8($7EC165, $20) ; Underworld exit cache
%write8($7EC166, $27) ; Underworld exit cache
%write8($7E0B0C, $F0) ; Arc variable
%write8($7E0B0C, $A0) ; Arc variable
%write8($7E0B09, $0C) ; Arc variable
%write8($7E0B39, $28) ; Arc variable
%write8($7E0B3A, $2B) ; Arc variable
%write8($7E0B3B, $36) ; Arc variable
%write8($7E0B08, $83) ; Arc variable
%write8($7E0B0C, $01) ; Arc variable
%write8($7E0B38, $30) ; Arc variable
%write8($7E0B3C, $3A) ; Arc variable
%write8($7E0468, $01) ; Trap door state
%write8($7E02A1, $08) ; Arc variable
%write8($7E029F, $16) ; Arc variable
%write8($7E029F, $00) ; Arc variable
%write8($7E0B3B, $00) ; Arc variable
%write8($7E0B0C, $A0) ; Arc variable
%write8($7E0B3C, $00) ; Arc variable
%write8($7E02A1, $00) ; Arc variable
%write8($7E0B09, $60) ; Arc variable
%write8($7E02A1, $05) ; Arc variable
%write8($7E0B08, $78) ; Arc variable
%write8($7E0B0C, $44) ; Arc variable
%write8($7E0468, $00) ; Trap door state
%write8($7E0B0C, $50) ; Arc variable
%write8($7E0641, $00) ; Room puzzle state (?)
%write8($7E0B09, $00) ; Arc variable
%write8($7E0B08, $40) ; Arc variable
%write8($7E0468, $00) ; Trap door state
%write8($7E0468, $01) ; Trap door state
%write8($7E0641, $00) ; Room puzzle state (?)
%write8($7E0B3F, $01) ; Arc variable
%write8($7E02A2, $FE) ; Arc variable
%write8($7E02A2, $E3) ; Arc variable
%write8($7E0468, $00) ; Trap door state
%write16_enable()
%write16($7E0542, $16CA) ; Object tilemap state
%write16($7E0468, $0001) ; Trap door state
%write16($7E0540, $15CA) ; Object tilemap state
%write16($7E0544, $17CA) ; Object tilemap state
%write16($7EC142, $0015) ; Underworld exit cache
%write16($7E0542, $19E6) ; Object tilemap state
%write16($7E0540, $18E6) ; Object tilemap state
%write16($7E0544, $1850) ; Object tilemap state
%write16($7E0542, $2532) ; Object tilemap state
%write16($7E0540, $324C) ; Object tilemap state
%write16($7E0544, $2A32) ; Object tilemap state
%write16($7E0468, $0000) ; Trap door state
%write16($7E0468, $0001) ; Trap door state
%write16($7E0542, $0434) ; Object tilemap state
%write16($7E0540, $0430) ; Object tilemap state
%write16($7E0544, $0438) ; Object tilemap state
%write16($7E0542, $0F34) ; Object tilemap state
%write16($7E0546, $1694) ; Object tilemap state
%write16($7E054A, $0E70) ; Object tilemap state
%write16($7E0540, $0A64) ; Object tilemap state
%write16($7E0544, $1034) ; Object tilemap state
%write16($7E0548, $053E) ; Object tilemap state
%write16($7E054C, $1590) ; Object tilemap state
%write16($7E0542, $0B8A) ; Object tilemap state
%write16($7E0546, $0FF2) ; Object tilemap state
%write16($7E0540, $0D1C) ; Object tilemap state
%write16($7E0544, $0BF2) ; Object tilemap state
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
%write16($7E0542, $0F98) ; Object tilemap state
%write16($7E0546, $1390) ; Object tilemap state
%write16($7E054A, $13A0) ; Object tilemap state
%write16($7E0540, $0F90) ; Object tilemap state
%write16($7E0544, $0FA0) ; Object tilemap state
%write16($7E0548, $1398) ; Object tilemap state
%write16($7E054C, $455E) ; Object tilemap state
%write16($7E0542, $2850) ; Object tilemap state
%write16($7E0546, $2A2C) ; Object tilemap state
%write16($7E0468, $0000) ; Trap door state
%write16($7E0540, $2650) ; Object tilemap state
%write16($7E0544, $282C) ; Object tilemap state
%write16($7E0542, $16CA) ; Object tilemap state
%write16($7EC140, $001B) ; Underworld exit cache
%write16($7EC150, $0078) ; Underworld exit cache
%write16($7EC154, $0200) ; Underworld exit cache
%write16($7EC158, $0210) ; Underworld exit cache
%write16($7EC16C, $FFFA) ; Underworld exit cache
%write16($7EC170, $FFF6) ; Underworld exit cache
%write16($7E0468, $0001) ; Trap door state
%write16($7E0540, $15CA) ; Object tilemap state
%write16($7E0544, $17CA) ; Object tilemap state
%write16($7EC142, $0004) ; Underworld exit cache
%write16($7EC152, $00FF) ; Underworld exit cache
%write16($7EC156, $0200) ; Underworld exit cache
%write16($7EC15A, $0310) ; Underworld exit cache
%write16($7EC15E, $0110) ; Underworld exit cache
%write16($7EC162, $0100) ; Underworld exit cache
%write16($7EC16A, $0006) ; Underworld exit cache
%write16($7EC16E, $000A) ; Underworld exit cache
%write16($7E0542, $163C) ; Object tilemap state
%write16($7E0540, $161E) ; Object tilemap state
%write16($7E0544, $165E) ; Object tilemap state
%write16($7E0542, $13B2) ; Object tilemap state
%write16($7E0546, $1CB2) ; Object tilemap state
%write16($7E054A, $36E0) ; Object tilemap state
%write16($7E0540, $138A) ; Object tilemap state
%write16($7E0544, $1C8A) ; Object tilemap state
%write16($7E0548, $181E) ; Object tilemap state
%write16($7E0542, $0A4C) ; Object tilemap state
%write16($7E0546, $045E) ; Object tilemap state
%write16($7E054A, $0864) ; Object tilemap state
%write16($7E054E, $0A70) ; Object tilemap state
%write16($7E0540, $064C) ; Object tilemap state
%write16($7E0544, $0858) ; Object tilemap state
%write16($7E0548, $0C5E) ; Object tilemap state
%write16($7E054C, $0670) ; Object tilemap state
%write16($7E0542, $1260) ; Object tilemap state
%write16($7E0546, $126C) ; Object tilemap state
%write16($7E0468, $0001) ; Trap door state
%write16($7E0540, $125C) ; Object tilemap state
%write16($7E0544, $1268) ; Object tilemap state
%write16($7E0542, $13B2) ; Object tilemap state
%write16($7E0546, $1CB2) ; Object tilemap state
%write16($7E054A, $35E0) ; Object tilemap state
%write16($7E0540, $138A) ; Object tilemap state
%write16($7E0544, $1C8A) ; Object tilemap state
%write16($7E0548, $181E) ; Object tilemap state
%write16($7E0641, $0001) ; Room puzzle state (?)
%write16($7E0542, $1370) ; Object tilemap state
%write16($7E0546, $1410) ; Object tilemap state
%write16($7E054A, $2C90) ; Object tilemap state
%write16($7E054E, $2CEC) ; Object tilemap state
%write16($7E0540, $146C) ; Object tilemap state
%write16($7E0544, $130C) ; Object tilemap state
%write16($7E0548, $2B90) ; Object tilemap state
%write16($7E054C, $2BEC) ; Object tilemap state
%write16($7E0542, $1454) ; Object tilemap state
%write16($7E0546, $1CAA) ; Object tilemap state
%write16($7E0540, $1428) ; Object tilemap state
%write16($7E0544, $13BE) ; Object tilemap state
%write16($7E0548, $1CD2) ; Object tilemap state
%write16($7E0542, $1C5C) ; Object tilemap state
%write16($7E0540, $145C) ; Object tilemap state
%write16($7E0542, $0ACA) ; Object tilemap state
%write16($7E0546, $0AF2) ; Object tilemap state
%write16($7E054A, $08F2) ; Object tilemap state
%write16($7E054E, $1860) ; Object tilemap state
%write16($7E0540, $08CA) ; Object tilemap state
%write16($7E0544, $0CCA) ; Object tilemap state
%write16($7E0548, $0CF2) ; Object tilemap state
%write16($7E054C, $185C) ; Object tilemap state
%write16($7E0468, $0001) ; Trap door state
%write16($7E0540, $0540) ; Object tilemap state
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
%write16($7E0542, $1350) ; Object tilemap state
%write16($7E0540, $0C50) ; Object tilemap state
%write16($7E0544, $1328) ; Object tilemap state
%write16($7E0542, $0B20) ; Object tilemap state
%write16($7E0546, $0C20) ; Object tilemap state
%write16($7E0540, $0B1C) ; Object tilemap state
%write16($7E0544, $0C1C) ; Object tilemap state
%write16($7E0548, $4E64) ; Object tilemap state
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
%write16($7E0542, $1728) ; Object tilemap state
%write16($7E0540, $1714) ; Object tilemap state
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
%write16($7E0542, $03F2) ; Object tilemap state
%write16($7E0540, $03CA) ; Object tilemap state
%write16($7E0542, $0A70) ; Object tilemap state
%write16($7E0540, $0920) ; Object tilemap state
%write16($7E0542, $0B10) ; Object tilemap state
%write16($7E0546, $0C18) ; Object tilemap state
%write16($7E054A, $0C28) ; Object tilemap state
%write16($7E054E, $1470) ; Object tilemap state
%write16($7E0552, $186C) ; Object tilemap state
%write16($7E0556, $1B6C) ; Object tilemap state
%write16($7E0540, $0B0C) ; Object tilemap state
%write16($7E0544, $0C10) ; Object tilemap state
%write16($7E0548, $0C20) ; Object tilemap state
%write16($7E054C, $144C) ; Object tilemap state
%write16($7E0550, $1850) ; Object tilemap state
%write16($7E0554, $1B50) ; Object tilemap state
%write16($7E0542, $1C60) ; Object tilemap state
%write16($7E0540, $1C5C) ; Object tilemap state
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
%write16($7E0542, $0470) ; Object tilemap state
%write16($7E0546, $333E) ; Object tilemap state
%write16($7E0540, $040C) ; Object tilemap state
%write16($7E0544, $1058) ; Object tilemap state
%write16($7E0542, $0424) ; Object tilemap state
%write16($7E0546, $1C70) ; Object tilemap state
%write16($7E0540, $0470) ; Object tilemap state
%write16($7E0544, $1C24) ; Object tilemap state
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
%write16($7E0542, $1560) ; Object tilemap state
%write16($7E0546, $1660) ; Object tilemap state
%write16($7E054A, $1C68) ; Object tilemap state
%write16($7E0540, $155C) ; Object tilemap state
%write16($7E0544, $165C) ; Object tilemap state
%write16($7E0548, $1C64) ; Object tilemap state
%write16($7E0542, $1610) ; Object tilemap state
%write16($7E0546, $1C24) ; Object tilemap state
%write16($7E054A, $1C2C) ; Object tilemap state
%write16($7E0540, $160C) ; Object tilemap state
%write16($7E0544, $1614) ; Object tilemap state
%write16($7E0548, $1C28) ; Object tilemap state
%write16($7E054C, $1C30) ; Object tilemap state
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
%write16($7E0542, $07A0) ; Object tilemap state
%write16($7E0546, $08A0) ; Object tilemap state
%write16($7E054A, $0C30) ; Object tilemap state
%write16($7E054E, $0B6C) ; Object tilemap state
%write16($7E0552, $10EC) ; Object tilemap state
%write16($7E0468, $0000) ; Trap door state
%write16($7E0540, $079C) ; Object tilemap state
%write16($7E0544, $089C) ; Object tilemap state
%write16($7E0548, $040C) ; Object tilemap state
%write16($7E054C, $0B5C) ; Object tilemap state
%write16($7E0550, $10DC) ; Object tilemap state
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
%write16($7E0540, $1B6C) ; Object tilemap state
%write16($7E0542, $17DE) ; Object tilemap state
%write16($7E0546, $19D6) ; Object tilemap state
%write16($7E054A, $19E6) ; Object tilemap state
%write16($7E054E, $1BE6) ; Object tilemap state
%write16($7E0540, $17D6) ; Object tilemap state
%write16($7E0544, $17E6) ; Object tilemap state
%write16($7E0548, $19DE) ; Object tilemap state
%write16($7E054C, $1BD6) ; Object tilemap state
%write16($7E0542, $0420) ; Object tilemap state
%write16($7E0546, $161E) ; Object tilemap state
%write16($7E054A, $1B4C) ; Object tilemap state
%write16($7E054E, $175C) ; Object tilemap state
%write16($7E0540, $075C) ; Object tilemap state
%write16($7E0544, $140C) ; Object tilemap state
%write16($7E0548, $1430) ; Object tilemap state
%write16($7E054C, $1954) ; Object tilemap state
%write16($7E0550, $1764) ; Object tilemap state
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
%write16($7E0556, $855C) ; Object tilemap state
%write16($7E055A, $8FEE) ; Object tilemap state
%write16($7E0468, $0000) ; Trap door state
%write16($7E0558, $8FCE) ; Object tilemap state
%write16($7E055C, $9870) ; Object tilemap state
%write16($7E0542, $1C30) ; Object tilemap state
%write16($7E0546, $1A64) ; Object tilemap state
%write16($7E0540, $140C) ; Object tilemap state
%write16($7E0544, $1664) ; Object tilemap state
%write16($7E0542, $16CA) ; Object tilemap state
%write16($7EC140, $0081) ; Underworld exit cache
%write16($7EC150, $007D) ; Underworld exit cache
%write16($7EC154, $0000) ; Underworld exit cache
%write16($7EC158, $0200) ; Underworld exit cache
%write16($7EC15C, $FF20) ; Underworld exit cache
%write16($7EC160, $0300) ; Underworld exit cache
%write16($7EC16C, $0000) ; Underworld exit cache
%write16($7EC170, $0000) ; Underworld exit cache
%write16($7E0540, $15CA) ; Object tilemap state
%write16($7E0544, $17CA) ; Object tilemap state
%write16($7EC152, $0583) ; Underworld exit cache
%write16($7EC156, $0320) ; Underworld exit cache
%write16($7EC15A, $0500) ; Underworld exit cache
%write16($7EC15E, $FF20) ; Underworld exit cache
%write16($7EC162, $0300) ; Underworld exit cache
%write16($7EC16A, $0000) ; Underworld exit cache
%write16($7EC16E, $0000) ; Underworld exit cache
%write16($7E0542, $0450) ; Object tilemap state
%write16($7E0546, $1C50) ; Object tilemap state
%write16($7E054A, $1914) ; Object tilemap state
%write16($7E054E, $1928) ; Object tilemap state
%write16($7E0540, $044C) ; Object tilemap state
%write16($7E0544, $1C4C) ; Object tilemap state
%write16($7E0548, $1514) ; Object tilemap state
%write16($7E054C, $191E) ; Object tilemap state
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
%write16($7E0542, $1C30) ; Object tilemap state
%write16($7E0540, $1C2C) ; Object tilemap state
%write16($7E0542, $0450) ; Object tilemap state
%write16($7E0546, $1C50) ; Object tilemap state
%write16($7E054A, $1914) ; Object tilemap state
%write16($7E054E, $1928) ; Object tilemap state
%write16($7E0540, $044C) ; Object tilemap state
%write16($7E0544, $1C4C) ; Object tilemap state
%write16($7E0548, $1514) ; Object tilemap state
%write16($7E054C, $191E) ; Object tilemap state
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
%write16($7E0552, $83B6) ; Object tilemap state
%write16($7E0556, $89B6) ; Object tilemap state
%write16($7E0550, $83AA) ; Object tilemap state
%write16($7E0554, $89AA) ; Object tilemap state
%write16($7E0468, $0000) ; Trap door state
%write16($7E0468, $0001) ; Trap door state
%write16($7E0468, $0000) ; Trap door state
%write16($7E0542, $2930) ; Object tilemap state
%write16($7E0546, $284C) ; Object tilemap state
%write16($7E054A, $2A4C) ; Object tilemap state
%write16($7E0468, $0001) ; Trap door state
%write16($7E0540, $2830) ; Object tilemap state
%write16($7E0544, $2A30) ; Object tilemap state
%write16($7E0548, $294C) ; Object tilemap state
%write16($7E054C, $175E) ; Object tilemap state
%write16($7E0542, $3044) ; Object tilemap state
%write16($7E0546, $07B4) ; Object tilemap state
%write16($7E0540, $2E64) ; Object tilemap state
%write16($7E0544, $3440) ; Object tilemap state
%write16($7E0542, $1430) ; Object tilemap state
%write16($7E0546, $1C30) ; Object tilemap state
%write16($7E0540, $140C) ; Object tilemap state
%write16($7E0544, $1C0C) ; Object tilemap state
%write16($7E0542, $0430) ; Object tilemap state
%write16($7E0546, $0C70) ; Object tilemap state
%write16($7E054A, $0470) ; Object tilemap state
%write16($7E0540, $07A8) ; Object tilemap state
%write16($7E0544, $0C4C) ; Object tilemap state
%write16($7E0548, $044C) ; Object tilemap state
%write16($7E0542, $1430) ; Object tilemap state
%write16($7E0546, $1C30) ; Object tilemap state
%write16($7E0540, $140C) ; Object tilemap state
%write16($7E0544, $1C0C) ; Object tilemap state
%write16($7E0542, $5424) ; Object tilemap state
%write16($7E0546, $4A24) ; Object tilemap state
%write16($7E054A, $4B24) ; Object tilemap state
%write16($7E054E, $4C24) ; Object tilemap state
%write16($7E0552, $5524) ; Object tilemap state
%write16($7E0556, $5624) ; Object tilemap state
%write16($7E055A, $0C30) ; Object tilemap state
%write16($7E055E, $1430) ; Object tilemap state
%write16($7E0540, $5418) ; Object tilemap state
%write16($7E0544, $4A18) ; Object tilemap state
%write16($7E0548, $4B18) ; Object tilemap state
%write16($7E054C, $4C18) ; Object tilemap state
%write16($7E0550, $5518) ; Object tilemap state
%write16($7E0554, $5618) ; Object tilemap state
%write16($7E0558, $0C0C) ; Object tilemap state
%write16($7E055C, $140C) ; Object tilemap state
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
%write16($7E0542, $2930) ; Object tilemap state
%write16($7E0546, $284C) ; Object tilemap state
%write16($7E054A, $2A4C) ; Object tilemap state
%write16($7E0540, $2830) ; Object tilemap state
%write16($7E0544, $2A30) ; Object tilemap state
%write16($7E0548, $294C) ; Object tilemap state
%write16($7E054C, $175E) ; Object tilemap state
%write16($7E0542, $175C) ; Object tilemap state
%write16($7E0546, $1768) ; Object tilemap state
%write16($7E0540, $1756) ; Object tilemap state
%write16($7E0544, $1762) ; Object tilemap state
%write16($7E0542, $193E) ; Object tilemap state
%write16($7EC140, $003B) ; Underworld exit cache
%write16($7EC144, $0E86) ; Underworld exit cache
%write16($7EC148, $0EE7) ; Underworld exit cache
%write16($7EC14C, $003B) ; Underworld exit cache
%write16($7EC150, $0EF3) ; Underworld exit cache
%write16($7EC154, $0E00) ; Underworld exit cache
%write16($7EC158, $0600) ; Underworld exit cache
%write16($7EC15C, $0D20) ; Underworld exit cache
%write16($7EC160, $0500) ; Underworld exit cache
%write16($7EC16C, $FFF6) ; Underworld exit cache
%write16($7E0540, $193A) ; Object tilemap state
%write16($7E0544, $1842) ; Object tilemap state
%write16($7EC142, $0016) ; Underworld exit cache
%write16($7EC146, $0700) ; Underworld exit cache
%write16($7EC14A, $0778) ; Underworld exit cache
%write16($7EC14E, $0420) ; Underworld exit cache
%write16($7EC152, $077D) ; Underworld exit cache
%write16($7EC156, $0F1E) ; Underworld exit cache
%write16($7EC15A, $0700) ; Underworld exit cache
%write16($7EC15E, $1000) ; Underworld exit cache
%write16($7EC162, $0800) ; Underworld exit cache
%write16($7EC16A, $000A) ; Underworld exit cache
%write16($7E0542, $0520) ; Object tilemap state
%write16($7E0546, $1430) ; Object tilemap state
%write16($7E0540, $0420) ; Object tilemap state
%write16($7E0544, $0620) ; Object tilemap state
%write16($7E0548, $063C) ; Object tilemap state
%write16($7E0542, $0F9A) ; Object tilemap state
%write16($7E0546, $05C0) ; Object tilemap state
%write16($7E054A, $0470) ; Object tilemap state
%write16($7E054E, $1072) ; Object tilemap state
%write16($7E0540, $100A) ; Object tilemap state
%write16($7E0544, $05BC) ; Object tilemap state
%write16($7E0548, $046C) ; Object tilemap state
%write16($7E054C, $0FDE) ; Object tilemap state
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
%write16($7E0542, $03C0) ; Object tilemap state
%write16($7E0546, $04C0) ; Object tilemap state
%write16($7E054A, $05C0) ; Object tilemap state
%write16($7E054E, $06C0) ; Object tilemap state
%write16($7E0540, $03BC) ; Object tilemap state
%write16($7E0544, $04BC) ; Object tilemap state
%write16($7E0548, $05BC) ; Object tilemap state
%write16($7E054C, $06BC) ; Object tilemap state
%write16($7E0550, $13F0) ; Object tilemap state
%write16($7E0542, $0664) ; Object tilemap state
%write16($7E0546, $0A5C) ; Object tilemap state
%write16($7E0468, $0000) ; Trap door state
%write16($7E0540, $0660) ; Object tilemap state
%write16($7E0544, $0A58) ; Object tilemap state
%write16($7E0542, $0B8C) ; Object tilemap state
%write16($7E0546, $0A30) ; Object tilemap state
%write16($7E0540, $078C) ; Object tilemap state
%write16($7E0544, $0C1C) ; Object tilemap state
%write16($7E0548, $0C70) ; Object tilemap state
%write16($7E0542, $0460) ; Object tilemap state
%write16($7E0546, $0870) ; Object tilemap state
%write16($7E0540, $045C) ; Object tilemap state
%write16($7E0544, $084C) ; Object tilemap state
%write16($7E0542, $1858) ; Object tilemap state
%write16($7E0546, $1CA4) ; Object tilemap state
%write16($7E0540, $13A4) ; Object tilemap state
%write16($7E0544, $179C) ; Object tilemap state
%write16($7E0548, $5764) ; Object tilemap state
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
%write16($7E0542, $0A70) ; Object tilemap state
%write16($7E0540, $0920) ; Object tilemap state
%write16($7E0542, $104C) ; Object tilemap state
%write16($7E0546, $1070) ; Object tilemap state
%write16($7E054A, $1C70) ; Object tilemap state
%write16($7E0540, $0470) ; Object tilemap state
%write16($7E0544, $0F70) ; Object tilemap state
%write16($7E0548, $1170) ; Object tilemap state
%write16($7E0542, $1C30) ; Object tilemap state
%write16($7E0540, $1C2C) ; Object tilemap state
%write16($7E0542, $0A70) ; Object tilemap state
%write16($7E0540, $0920) ; Object tilemap state
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
%write16($7E0542, $0C30) ; Object tilemap state
%write16($7E0546, $1820) ; Object tilemap state
%write16($7E0468, $0001) ; Trap door state
%write16($7E0540, $0430) ; Object tilemap state
%write16($7E0544, $181C) ; Object tilemap state
%write16($7E0542, $0938) ; Object tilemap state
%write16($7E0540, $0838) ; Object tilemap state
%write16($7E0544, $0550) ; Object tilemap state
%write16($7E0542, $052C) ; Object tilemap state
%write16($7E0546, $082C) ; Object tilemap state
%write16($7E054A, $0B2C) ; Object tilemap state
%write16($7E054E, $1962) ; Object tilemap state
%write16($7E0540, $051C) ; Object tilemap state
%write16($7E0544, $081C) ; Object tilemap state
%write16($7E0548, $0B1C) ; Object tilemap state
%write16($7E054C, $195A) ; Object tilemap state
%write16($7E0550, $050C) ; Object tilemap state
%write16($7E0641, $0001) ; Room puzzle state (?)
%write16($7E0542, $16D8) ; Object tilemap state
%write16($7E0546, $19D8) ; Object tilemap state
%write16($7E054A, $19E4) ; Object tilemap state
%write16($7E054E, $16E4) ; Object tilemap state
%write16($7E0540, $165E) ; Object tilemap state
%write16($7E0544, $1854) ; Object tilemap state
%write16($7E0548, $1A5E) ; Object tilemap state
%write16($7E054C, $1868) ; Object tilemap state
%write16($7E0542, $0628) ; Object tilemap state
%write16($7E0546, $0A28) ; Object tilemap state
%write16($7E0540, $0614) ; Object tilemap state
%write16($7E0544, $0A14) ; Object tilemap state
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
%write16($7E0468, $0001) ; Trap door state
%write16($7E0554, $1C6C) ; Object tilemap state
%write16($7E0542, $0B8C) ; Object tilemap state
%write16($7E0546, $1030) ; Object tilemap state
%write16($7E054A, $1792) ; Object tilemap state
%write16($7E054E, $1C16) ; Object tilemap state
%write16($7E0552, $0D24) ; Object tilemap state
%write16($7E0540, $059E) ; Object tilemap state
%write16($7E0544, $0D2A) ; Object tilemap state
%write16($7E0548, $14B0) ; Object tilemap state
%write16($7E054C, $1C0C) ; Object tilemap state
%write16($7E0550, $0A1E) ; Object tilemap state
%write16($7E0554, $1012) ; Object tilemap state
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
%write16($7E0542, $151C) ; Object tilemap state
%write16($7E0546, $1528) ; Object tilemap state
%write16($7E054A, $1910) ; Object tilemap state
%write16($7E054E, $1824) ; Object tilemap state
%write16($7E0552, $1B1C) ; Object tilemap state
%write16($7E0556, $1B28) ; Object tilemap state
%write16($7E055A, $172C) ; Object tilemap state
%write16($7E0540, $1514) ; Object tilemap state
%write16($7E0544, $1520) ; Object tilemap state
%write16($7E0548, $1710) ; Object tilemap state
%write16($7E054C, $1818) ; Object tilemap state
%write16($7E0550, $1B14) ; Object tilemap state
%write16($7E0554, $1B20) ; Object tilemap state
%write16($7E0558, $192C) ; Object tilemap state
%write16($7E0468, $0001) ; Trap door state
%write_7F()
%write8($7FE0EF, $41) ; Room $B7 persistent: Turtle Rock (Map Chest / Key Chest / Roller Room)
%write8($7FE167, $42) ; Overworld $F3 persistent: UNKNOWN
%write8($7FE04E, $42) ; Overworld $67 persistent: UNKNOWN
%write8($7FE103, $52) ; Overworld $C1 persistent: UNKNOWN
%write8($7FE06E, $52) ; Overworld $77 persistent: Black Ice Cave
%write8($7FE165, $43) ; Overworld $F2 persistent: UNKNOWN
%write8($7FDFCB, $F3) ; Overworld $25 persistent: Octorok Area
%write8($7FDFCD, $23) ; Overworld $26 persistent: UNKNOWN
%write8($7FDFCB, $F3) ; Overworld $25 persistent: Octorok Area
%write8($7FE0E3, $13) ; Overworld $B1 persistent: UNKNOWN
%write8($7FE148, $26) ; Overworld $E4 persistent: UNKNOWN
%write8($7FDFDD, $B5) ; Overworld $2E persistent: South of Eastern Palace
%write8($7FE0E3, $13) ; Overworld $B1 persistent: UNKNOWN
%write8($7FE148, $26) ; Overworld $E4 persistent: UNKNOWN
%write8($7FE0FA, $23) ; Overworld $BD persistent: UNKNOWN
%write8($7FE0FA, $23) ; Overworld $BD persistent: UNKNOWN
%write8($7FE0FA, $23) ; Overworld $BD persistent: UNKNOWN
%write8($7FDFCB, $F3) ; Overworld $25 persistent: Octorok Area
%write8($7FE17F, $CA) ; Overworld $FF persistent: UNKNOWN
%write8($7FE1BF, $EC) ; Overworld $11F persistent: UNKNOWN
%write8($7FE16E, $28) ; Overworld $F7 persistent: UNKNOWN
%write8($7FE05B, $47) ; Overworld $6D persistent: Peg Bridge
%write8($7FE147, $AB) ; Overworld $E3 persistent: UNKNOWN
%write8($7FE164, $A9) ; Overworld $F2 persistent: UNKNOWN
%write8($7FE059, $13) ; Overworld $6C persistent: Dark Link's House
%write8($7FE07D, $13) ; Overworld $7E persistent: UNKNOWN
%write8($7FE0E2, $AA) ; Overworld $B1 persistent: UNKNOWN
%write8($7FE126, $AB) ; Overworld $D3 persistent: UNKNOWN
%write8($7FE07D, $13) ; Overworld $7E persistent: UNKNOWN
%write8($7FE0E2, $AA) ; Overworld $B1 persistent: UNKNOWN
%write8($7FE126, $AB) ; Overworld $D3 persistent: UNKNOWN
%write8($7FDFF9, $42) ; Overworld $3C persistent: Great Swamp SE
%write8($7FDFDA, $D4) ; Overworld $2D persistent: Bridge to Hyrule Castle
%write8($7FE01B, $42) ; Overworld $4D persistent: UNKNOWN
%write8($7FE16D, $D1) ; Overworld $F6 persistent: UNKNOWN
%write8($7FE046, $D1) ; Overworld $63 persistent: UNKNOWN
%write16_enable()
%write16($7FE064, $0001) ; Room $72 persistent: Hyrule Castle (Map Chest Room)
%write16($7FE062, $0001) ; Room $71 persistent: Hyrule Castle (Boomerang Chest Room)
%write16($7FE062, $0003) ; Room $71 persistent: Hyrule Castle (Boomerang Chest Room)
%write16($7FE080, $0004) ; Room $80 persistent: Hyrule Castle (Jail Cell Room)
%write16($7FDFA2, $0020) ; Room $11 persistent: Hyrule Castle (Bombable Stock Room)
%write16($7FDFC2, $0001) ; Room $21 persistent: Hyrule Castle (Key-rat Room)
%write16($7FE0F4, $0001) ; Room $BA persistent: Eastern Palace (Dark Antifairy / Key Pot Room)
%write16($7FE0B2, $0008) ; Room $99 persistent: Eastern Palace (Eyegore Key Room)
%write16($7FE130, $07FF) ; Room $D8 persistent: Eastern Palace (Zeldagamer Room / Pre-Armos Knights Room)
%write16($7FE162, $0001) ; Room $F1 persistent: Cave (Lost Old Man Starting Cave)
%write16($7FDFB6, $0038) ; Room $1B persistent: Palace of Darkness (Mimics / Moving Wall Room)
%write16($7FE054, $0010) ; Room $6A persistent: Palace of Darkness (Rupee Room)
%write16($7FDF96, $03F0) ; Room $B persistent: Palace of Darkness (Turtle Room)
%write16($7FDFE2, $0580) ; Room $31 persistent: Tower of Hera (Hardhat Beetles Room)
%write16($7FE048, $0040) ; Room $64 persistent: Thieves Town (West Attic Room)
%write16($7FE008, $0080) ; Room $44 persistent: Thieves Town (Big Chest Room)
%write16($7FE00A, $000E) ; Room $45 persistent: Thieves Town (Jail Cells Room)
%write16($7FE0F8, $0002) ; Room $BC persistent: Thieves Town (Conveyor Toilet)
%write16($7FE012, $0400) ; Room $49 persistent: Skull Woods (Gibdo Torch Puzzle Room)
%write16($7FE032, $0003) ; Room $59 persistent: Skull Woods (Final Section Entrance Room)
%write16($7FE012, $0C01) ; Room $49 persistent: Skull Woods (Gibdo Torch Puzzle Room)
%write16($7FDFF2, $0002) ; Room $39 persistent: Skull Woods (Gibdo Key / Mothula Hole Room)
%write16($7FE026, $06E0) ; Room $53 persistent: Desert Palace (Popos 2 / Beamos Hellway Room)
%write16($7FE124, $03EF) ; Room $D2 persistent: Misery Mire (Mire02 / Wizzrobes Room)
%write16($7FE102, $0200) ; Room $C1 persistent: Misery Mire (Compass Chest / Tile Room)
%write16($7FE124, $03EF) ; Room $D2 persistent: Misery Mire (Mire02 / Wizzrobes Room)
%write16($7FDFD0, $000E) ; Room $28 persistent: Swamp Palace (Entrance Room)
%write16($7FDFF0, $0002) ; Room $38 persistent: Swamp Palace (Key Pot Room)
%write16($7FE04C, $0100) ; Room $66 persistent: Swamp Palace (Hidden Chest / Hidden Door Room)
%write16($7FDFAC, $0004) ; Room $16 persistent: Swamp Palace (Swimming Treadmill)
%write16($7FDFFC, $0006) ; Room $3E persistent: Ice Palace (Stalfos Knights / Conveyor Hellway)
%write16($7FDFFC, $0366) ; Room $3E persistent: Ice Palace (Stalfos Knights / Conveyor Hellway)
%write16($7FE05C, $001F) ; Room $6E persistent: Ice Palace (Pengators Room)
%write16($7FE12A, $0010) ; Room $D5 persistent: Turtle Rock (Laser Key Room)
%write16($7FE0B8, $0012) ; Room $9C persistent: Ganon's Tower (Invisible Floor Maze Room)
%write16($7FE056, $2640) ; Room $6B persistent: Ganon's Tower (Mimics Rooms)
%write16($7FE036, $0008) ; Room $5B persistent: Ganon's Tower (Spike Pit Room)
%write16($7FE03A, $0EFD) ; Room $5D persistent: Ganon's Tower (Gauntlet 1/2/3)
%write16($7FE05A, $00C9) ; Room $6D persistent: Ganon's Tower (Gauntlet 4/5)
%write16($7FE0CA, $008C) ; Room $A5 persistent: Ganon's Tower (Wizzrobes Rooms)
%write16($7FE0AA, $000C) ; Room $95 persistent: Ganon's Tower (Final Collapsing Bridge Room)
%write16($7FE0CA, $00EF) ; Room $A5 persistent: Ganon's Tower (Wizzrobes Rooms)
%write16($7FDFFA, $000C) ; Room $3D persistent: Ganon's Tower (Torch Room 2)
%write16($7FE140, $000F) ; Room $E0 persistent: Agahnim's Tower (Entrance Room)
%write16($7FE120, $0020) ; Room $D0 persistent: Agahnim's Tower (Dark Maze)
%write16($7FE100, $001C) ; Room $C0 persistent: Agahnim's Tower (Dark Bridge Room)
%write16($7FE0E0, $003D) ; Room $B0 persistent: Agahnim's Tower (Circle of Pots)
%write16($7FE0E0, $0D3D) ; Room $B0 persistent: Agahnim's Tower (Circle of Pots)
%write16($7FDFE0, $0001) ; Room $30 persistent: Agahnim's Tower (Maiden Sacrifice Chamber)
%write16($7FE000, $0002) ; Room $40 persistent: Agahnim's Tower (Final Bridge Room)
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; BOSSES
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_adold_boss:
%menu_header("Bosses", 0)
;===================================================================================================

;===================================================================================================
presetpersistent_adold_escape:
;-----------------------------
.links_bed
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
.last_two
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
..end
;-----------------------------
.stalfos_room
..end
;-----------------------------
.big_chest_room_1
..end
;-----------------------------
.dark_key_room
..end
;-----------------------------
.big_key_dmg_boost
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
..end

;===================================================================================================
presetpersistent_adold_pod:
;-----------------------------
.outside_ep
..end
;-----------------------------
.sanctuary
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
..end
;-----------------------------
.mimics
..end
;-----------------------------
.statue
..end
;-----------------------------
.basement
..end
;-----------------------------
.turtle_room
..end
;-----------------------------
.helma
..end

;===================================================================================================
presetpersistent_adold_hera:
;-----------------------------
.outside_pod
..end
;-----------------------------
.old_man_cave
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
..end
;-----------------------------
.moldorm
..end

;===================================================================================================
presetpersistent_adold_thieves:
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
..end
;-----------------------------
.cursed_dwarf
..end
;-----------------------------
.getting_tempered
..end
;-----------------------------
.fencedash
..end
;-----------------------------
.dash_to_skull_woods
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
..end
;-----------------------------
.mothula
..end

;===================================================================================================
presetpersistent_adold_desert:
;-----------------------------
.outside_skull
..end
;-----------------------------
.ether
..end
;-----------------------------
.bridge_hammerdash
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
..end
;-----------------------------
.torch_key
..end
;-----------------------------
.pre_cannonballs
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
..end
;-----------------------------
.big_chest_room
..end
;-----------------------------
.main_hub_post_cane
..end
;-----------------------------
.bridge_room
..end
;-----------------------------
.spooky_action
..end
;-----------------------------
.vitreous
..end

;===================================================================================================
presetpersistent_adold_swamp:
;-----------------------------
.outside_mire
..end
;-----------------------------
.antifairy_room
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
..end
;-----------------------------
.ice_conveyor
..end
;-----------------------------
.ipbj
..end
;-----------------------------
.penguin_lineup_room
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
presetpersistent_adold_trock:
;-----------------------------
.outside_ice
..end
;-----------------------------
.old_man_cave
..end
;-----------------------------
.tr_climb
..end
;-----------------------------
.laser_entrance
..end
;-----------------------------
.crystal_roller
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
presetpersistent_adold_gtower:
;-----------------------------
.outside_turtle_rock
..end
;-----------------------------
.old_man_cave
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
..end
;-----------------------------
.mimics_1
..end
;-----------------------------
.spike_pit
..end
;-----------------------------
.gauntlet_1
..end
;-----------------------------
.lanmola_2
..end
;-----------------------------
.wizzrobes_1
..end
;-----------------------------
.wizzrobes_2
..end
;-----------------------------
.torches_1
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
..end
;-----------------------------
.gold_knights
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
.pit_room
..end
;-----------------------------
.agahnim
..end

;===================================================================================================
presetpersistent_adold_ganon:
;-----------------------------
.pyramid
%write8_enable()
%write8($7E0B31, $00) ; Arc variable
%write8($7E0B35, $00) ; Arc variable
%write8($7E0B32, $00) ; Arc variable
%write8($7E0B33, $00) ; Arc variable
%write8($7E0B37, $00) ; Arc variable
%write8($7E0B36, $00) ; Arc variable
%write8($7E0B34, $00) ; Arc variable
%write8($7E0FC8, $01) ; Prize pack index
%write8($7E0FCC, $02) ; Prize pack index
%write8($7E0FCC, $03) ; Prize pack index
%write8($7E0B37, $FF) ; Arc variable
%write8($7E0B37, $00) ; Arc variable
%write8($7E0FC8, $03) ; Prize pack index
%write8($7E0B31, $30) ; Arc variable
%write8($7E0B35, $30) ; Arc variable
%write8($7E0B32, $30) ; Arc variable
%write8($7E0B33, $30) ; Arc variable
%write8($7E0B37, $91) ; Arc variable
%write8($7E0B30, $30) ; Arc variable
%write8($7E0B34, $30) ; Arc variable
%write8($7E0B37, $00) ; Arc variable
%write8($7E0B35, $00) ; Arc variable
%write8($7E0B33, $00) ; Arc variable
%write8($7E0B34, $00) ; Arc variable
%write8($7E0FCD, $01) ; Prize pack index
%write8($7E0B37, $02) ; Arc variable
%write8($7E0FCB, $02) ; Prize pack index
%write8($7E0FC8, $05) ; Prize pack index
%write8($7E0B31, $00) ; Arc variable
%write8($7E0B32, $00) ; Arc variable
%write8($7E0B33, $0F) ; Arc variable
%write8($7E0B30, $0D) ; Arc variable
%write8($7E0B37, $00) ; Arc variable
%write8($7E0B37, $80) ; Arc variable
%write8($7E0FCC, $02) ; Prize pack index
%write8($7E0FC8, $01) ; Prize pack index
%write8($7E0B33, $00) ; Arc variable
%write8($7E0B37, $00) ; Arc variable
%write8($7E0B37, $A0) ; Arc variable
%write8($7E0B37, $09) ; Arc variable
%write8($7E0B37, $01) ; Arc variable
%write8($7E0FCC, $04) ; Prize pack index
%write8($7E0B37, $FB) ; Arc variable
%write8($7E0B37, $A0) ; Arc variable
%write8($7E0B36, $D6) ; Arc variable
%write8($7E0B36, $43) ; Arc variable
%write8($7E0FCC, $05) ; Prize pack index
%write8($7E0B37, $A9) ; Arc variable
%write8($7E0B37, $9C) ; Arc variable
%write8($7E0B37, $7E) ; Arc variable
%write8($7E0B37, $12) ; Arc variable
%write8($7E0B37, $00) ; Arc variable
%write8($7E0B37, $8D) ; Arc variable
%write8($7E0B37, $84) ; Arc variable
%write8($7E0B37, $9B) ; Arc variable
%write8($7E0B37, $90) ; Arc variable
%write8($7E0B37, $00) ; Arc variable
%write8($7E0B37, $CC) ; Arc variable
%write8($7E0B37, $1E) ; Arc variable
%write8($7E0B35, $C3) ; Arc variable
%write8($7E0FCC, $01) ; Prize pack index
%write8($7E0B33, $BE) ; Arc variable
%write8($7E0B37, $BE) ; Arc variable
%write8($7E0B36, $D6) ; Arc variable
%write8($7E0B34, $D0) ; Arc variable
%write8($7E0FC8, $02) ; Prize pack index
%write8($7E0B37, $A0) ; Arc variable
%write8($7E0B37, $0A) ; Arc variable
%write8($7E0B37, $00) ; Arc variable
%write8($7E0B37, $49) ; Arc variable
%write8($7E0B37, $0C) ; Arc variable
%write8($7E0B35, $00) ; Arc variable
%write8($7E0B37, $00) ; Arc variable
%write8($7E0B36, $00) ; Arc variable
%write8($7E0B34, $00) ; Arc variable
%write8($7E0B35, $82) ; Arc variable
%write8($7E0B33, $8D) ; Arc variable
%write8($7E0B37, $81) ; Arc variable
%write8($7E0B36, $84) ; Arc variable
%write8($7E0B34, $8C) ; Arc variable
%write8($7E0B35, $0F) ; Arc variable
%write8($7E0B33, $82) ; Arc variable
%write8($7E0B37, $2C) ; Arc variable
%write8($7E0B36, $1E) ; Arc variable
%write8($7E0B34, $81) ; Arc variable
%write8($7E0B35, $B5) ; Arc variable
%write8($7E0B37, $D2) ; Arc variable
%write8($7E0B36, $C4) ; Arc variable
%write8($7E0B31, $22) ; Arc variable
%write8($7E0B35, $3B) ; Arc variable
%write8($7E0B32, $1E) ; Arc variable
%write8($7E0B33, $24) ; Arc variable
%write8($7E0B37, $3A) ; Arc variable
%write8($7E0B36, $3E) ; Arc variable
%write8($7E0B30, $2F) ; Arc variable
%write8($7E0B34, $31) ; Arc variable
%write8($7E0FCA, $02) ; Prize pack index
%write8($7E0B37, $49) ; Arc variable
%write8($7E0B37, $9B) ; Arc variable
%write8($7E0B37, $91) ; Arc variable
%write8($7E0FC9, $03) ; Prize pack index
%write8($7E0B37, $A0) ; Arc variable
%write8($7E0B37, $00) ; Arc variable
%write8($7E0B35, $00) ; Arc variable
%write8($7E0B33, $00) ; Arc variable
%write8($7E0B37, $3C) ; Arc variable
%write8($7E0B36, $00) ; Arc variable
%write8($7E0B34, $00) ; Arc variable
%write8($7E0B37, $00) ; Arc variable
%write8($7E0B31, $BD) ; Arc variable
%write8($7E0B35, $70) ; Arc variable
%write8($7E0B32, $90) ; Arc variable
%write8($7E0B33, $52) ; Arc variable
%write8($7E0B37, $02) ; Arc variable
%write8($7E0B30, $AD) ; Arc variable
%write8($7E0B34, $42) ; Arc variable
%write8($7E0FCC, $07) ; Prize pack index
%write8($7E0B37, $08) ; Arc variable
%write8($7E0FC7, $01) ; Prize pack index
%write8($7E0B37, $0D) ; Arc variable
%write8($7E0B37, $0F) ; Arc variable
%write8($7E0B37, $02) ; Arc variable
%write8($7E0B37, $10) ; Arc variable
%write8($7E0FCD, $02) ; Prize pack index
%write8($7E0FC7, $03) ; Prize pack index
%write16_enable()
%write16($7E0FC8, $0000) ; Prize pack index
%write16($7E0FCC, $0000) ; Prize pack index
%write16($7E0FC8, $0000) ; Prize pack index
%write16($7E0FC8, $0000) ; Prize pack index
%write16($7E0FCC, $0000) ; Prize pack index
%write16($7E0FC8, $0000) ; Prize pack index
%write16($7E0FCC, $0000) ; Prize pack index
%write16($7E0FCA, $0000) ; Prize pack index
%write_end()
..end

;===================================================================================================
presetpersistent_adold_boss:
;===================================================================================================
presetSRAM_adold:
;---------------------------------------------------------------------------------------------------
.escape
;---------------------------------------------------------------------------------------------------
..links_bed
...end
;---------------------------------------------------------------------------------------------------
..courtyard
...end
;---------------------------------------------------------------------------------------------------
..entrance
...end
;---------------------------------------------------------------------------------------------------
..1st_key_guard
...end
;---------------------------------------------------------------------------------------------------
..stealth_room
...end
;---------------------------------------------------------------------------------------------------
..2nd_key_guard
...end
;---------------------------------------------------------------------------------------------------
..ball_n_chains
...end
;---------------------------------------------------------------------------------------------------
..backtracking
...end
;---------------------------------------------------------------------------------------------------
..key_guard_revisit
...end
;---------------------------------------------------------------------------------------------------
..throne_room
...end
;---------------------------------------------------------------------------------------------------
..snake_avoidance
...end
;---------------------------------------------------------------------------------------------------
..sewer_rooms
...end
;---------------------------------------------------------------------------------------------------
..keyrat
...end
;---------------------------------------------------------------------------------------------------
..last_two
...end
;---------------------------------------------------------------------------------------------------
.eastern
;---------------------------------------------------------------------------------------------------
..before_cutscene
...end
;---------------------------------------------------------------------------------------------------
..links_house
...end
;---------------------------------------------------------------------------------------------------
..ep_overworld
...end
;---------------------------------------------------------------------------------------------------
..entrance
...end
;---------------------------------------------------------------------------------------------------
..stalfos_room
...end
;---------------------------------------------------------------------------------------------------
..big_chest_room_1
...end
;---------------------------------------------------------------------------------------------------
..dark_key_room
...end
;---------------------------------------------------------------------------------------------------
..big_key_dmg_boost
...end
;---------------------------------------------------------------------------------------------------
..big_chest_room_2
...end
;---------------------------------------------------------------------------------------------------
..gifted_with_greenies
...end
;---------------------------------------------------------------------------------------------------
..pot_room
...end
;---------------------------------------------------------------------------------------------------
..zeldagamer_room
...end
;---------------------------------------------------------------------------------------------------
..armos
...end
;---------------------------------------------------------------------------------------------------
.pod
;---------------------------------------------------------------------------------------------------
..outside_ep
...end
;---------------------------------------------------------------------------------------------------
..sanctuary
...end
;---------------------------------------------------------------------------------------------------
..dma
...end
;---------------------------------------------------------------------------------------------------
..death_mountain
...end
;---------------------------------------------------------------------------------------------------
..after_mirror
...end
;---------------------------------------------------------------------------------------------------
..kiki_skip
...end
;---------------------------------------------------------------------------------------------------
..dungeon_reload
...end
;---------------------------------------------------------------------------------------------------
..main_hub_bk
...end
;---------------------------------------------------------------------------------------------------
..main_hub_hammerjump
...end
;---------------------------------------------------------------------------------------------------
..hammerjump
...end
;---------------------------------------------------------------------------------------------------
..archery_contest
...end
;---------------------------------------------------------------------------------------------------
..mimics
...end
;---------------------------------------------------------------------------------------------------
..statue
...end
;---------------------------------------------------------------------------------------------------
..basement
...end
;---------------------------------------------------------------------------------------------------
..turtle_room
...end
;---------------------------------------------------------------------------------------------------
..helma
...end
;---------------------------------------------------------------------------------------------------
.hera
;---------------------------------------------------------------------------------------------------
..outside_pod
...end
;---------------------------------------------------------------------------------------------------
..old_man_cave
...end
;---------------------------------------------------------------------------------------------------
..entrance
...end
;---------------------------------------------------------------------------------------------------
..tile_room
...end
;---------------------------------------------------------------------------------------------------
..torches
...end
;---------------------------------------------------------------------------------------------------
..beetles
...end
;---------------------------------------------------------------------------------------------------
..petting_zoo
...end
;---------------------------------------------------------------------------------------------------
..moldorm
...end
;---------------------------------------------------------------------------------------------------
.thieves
;---------------------------------------------------------------------------------------------------
..outside_hera
...end
;---------------------------------------------------------------------------------------------------
..dmd
...end
;---------------------------------------------------------------------------------------------------
..entrance
...end
;---------------------------------------------------------------------------------------------------
..after_big_key
...end
;---------------------------------------------------------------------------------------------------
..stalfos_hallway
...end
;---------------------------------------------------------------------------------------------------
..conveyor_gibos
...end
;---------------------------------------------------------------------------------------------------
..hellway
...end
;---------------------------------------------------------------------------------------------------
..bomb_floor
...end
;---------------------------------------------------------------------------------------------------
..backtracking
...end
;---------------------------------------------------------------------------------------------------
..basement
...end
;---------------------------------------------------------------------------------------------------
..prison
...end
;---------------------------------------------------------------------------------------------------
..backtracking_2
...end
;---------------------------------------------------------------------------------------------------
..pot_hammerdash
...end
;---------------------------------------------------------------------------------------------------
..blind
...end
;---------------------------------------------------------------------------------------------------
.skull
;---------------------------------------------------------------------------------------------------
..outside_thieves
...end
;---------------------------------------------------------------------------------------------------
..cursed_dwarf
...end
;---------------------------------------------------------------------------------------------------
..getting_tempered
...end
;---------------------------------------------------------------------------------------------------
..fencedash
...end
;---------------------------------------------------------------------------------------------------
..dash_to_skull_woods
...end
;---------------------------------------------------------------------------------------------------
..mummy_room
...end
;---------------------------------------------------------------------------------------------------
..bomb_jump
...end
;---------------------------------------------------------------------------------------------------
..key_pot
...end
;---------------------------------------------------------------------------------------------------
..skull_entrance
...end
;---------------------------------------------------------------------------------------------------
..mummy_hellway
...end
;---------------------------------------------------------------------------------------------------
..mummy_key
...end
;---------------------------------------------------------------------------------------------------
..mothula
...end
;---------------------------------------------------------------------------------------------------
.desert
;---------------------------------------------------------------------------------------------------
..outside_skull
...end
;---------------------------------------------------------------------------------------------------
..ether
...end
;---------------------------------------------------------------------------------------------------
..bridge_hammerdash
...end
;---------------------------------------------------------------------------------------------------
..zora_dmd
...end
;---------------------------------------------------------------------------------------------------
..links_house
...end
;---------------------------------------------------------------------------------------------------
..swamp_warp
...end
;---------------------------------------------------------------------------------------------------
..fluteless_mire
...end
;---------------------------------------------------------------------------------------------------
..desert_entrance
...end
;---------------------------------------------------------------------------------------------------
..torch_key
...end
;---------------------------------------------------------------------------------------------------
..pre_cannonballs
...end
;---------------------------------------------------------------------------------------------------
..desert_2_spinspeed
...end
;---------------------------------------------------------------------------------------------------
..torches
...end
;---------------------------------------------------------------------------------------------------
..lanmolas
...end
;---------------------------------------------------------------------------------------------------
.mire
;---------------------------------------------------------------------------------------------------
..outside_desert
...end
;---------------------------------------------------------------------------------------------------
..entrance
...end
;---------------------------------------------------------------------------------------------------
..mire_2
...end
;---------------------------------------------------------------------------------------------------
..main_hub
...end
;---------------------------------------------------------------------------------------------------
..spike_key
...end
;---------------------------------------------------------------------------------------------------
..beat_the_fireball
...end
;---------------------------------------------------------------------------------------------------
..bari_switch
...end
;---------------------------------------------------------------------------------------------------
..sluggulas
...end
;---------------------------------------------------------------------------------------------------
..torches
...end
;---------------------------------------------------------------------------------------------------
..backtracking
...end
;---------------------------------------------------------------------------------------------------
..mire_to_hera_clip
...end
;---------------------------------------------------------------------------------------------------
..hera_to_swamp_clip
...end
;---------------------------------------------------------------------------------------------------
..mire_2_2
...end
;---------------------------------------------------------------------------------------------------
..big_chest_room
...end
;---------------------------------------------------------------------------------------------------
..main_hub_post_cane
...end
;---------------------------------------------------------------------------------------------------
..bridge_room
...end
;---------------------------------------------------------------------------------------------------
..spooky_action
...end
;---------------------------------------------------------------------------------------------------
..vitreous
...end
;---------------------------------------------------------------------------------------------------
.swamp
;---------------------------------------------------------------------------------------------------
..outside_mire
...end
;---------------------------------------------------------------------------------------------------
..antifairy_room
...end
;---------------------------------------------------------------------------------------------------
..entrance
...end
;---------------------------------------------------------------------------------------------------
..first_key_pot
...end
;---------------------------------------------------------------------------------------------------
..main_hub
...end
;---------------------------------------------------------------------------------------------------
..hookdash
...end
;---------------------------------------------------------------------------------------------------
..restock_room
...end
;---------------------------------------------------------------------------------------------------
..phelps_way
...end
;---------------------------------------------------------------------------------------------------
..arrghus
...end
;---------------------------------------------------------------------------------------------------
.ice
;---------------------------------------------------------------------------------------------------
..outside_swamp
...end
;---------------------------------------------------------------------------------------------------
..entrance
...end
;---------------------------------------------------------------------------------------------------
..ice_conveyor
...end
;---------------------------------------------------------------------------------------------------
..ipbj
...end
;---------------------------------------------------------------------------------------------------
..penguin_lineup_room
...end
;---------------------------------------------------------------------------------------------------
..lonely_firebar
...end
;---------------------------------------------------------------------------------------------------
..last_two_screens
...end
;---------------------------------------------------------------------------------------------------
..kholdstare
...end
;---------------------------------------------------------------------------------------------------
.trock
;---------------------------------------------------------------------------------------------------
..outside_ice
...end
;---------------------------------------------------------------------------------------------------
..old_man_cave
...end
;---------------------------------------------------------------------------------------------------
..tr_climb
...end
;---------------------------------------------------------------------------------------------------
..laser_entrance
...end
;---------------------------------------------------------------------------------------------------
..crystal_roller
...end
;---------------------------------------------------------------------------------------------------
..pokey_1
...end
;---------------------------------------------------------------------------------------------------
..laser_entrance_2
...end
;---------------------------------------------------------------------------------------------------
..switch_maze
...end
;---------------------------------------------------------------------------------------------------
..trinexx
...end
;---------------------------------------------------------------------------------------------------
.gtower
;---------------------------------------------------------------------------------------------------
..outside_turtle_rock
...end
;---------------------------------------------------------------------------------------------------
..old_man_cave
...end
;---------------------------------------------------------------------------------------------------
..entrance
...end
;---------------------------------------------------------------------------------------------------
..spike_skip
...end
;---------------------------------------------------------------------------------------------------
..pre_firesnakes_room
...end
;---------------------------------------------------------------------------------------------------
..bombable_floor
...end
;---------------------------------------------------------------------------------------------------
..floor_2
...end
;---------------------------------------------------------------------------------------------------
..mimics_1
...end
;---------------------------------------------------------------------------------------------------
..spike_pit
...end
;---------------------------------------------------------------------------------------------------
..gauntlet_1
...end
;---------------------------------------------------------------------------------------------------
..lanmola_2
...end
;---------------------------------------------------------------------------------------------------
..wizzrobes_1
...end
;---------------------------------------------------------------------------------------------------
..wizzrobes_2
...end
;---------------------------------------------------------------------------------------------------
..torches_1
...end
;---------------------------------------------------------------------------------------------------
..torches_2
...end
;---------------------------------------------------------------------------------------------------
..helma_key
...end
;---------------------------------------------------------------------------------------------------
..bombable_wall
...end
;---------------------------------------------------------------------------------------------------
..moldorm_2
...end
;---------------------------------------------------------------------------------------------------
..agahnim_2
...end
;---------------------------------------------------------------------------------------------------
.aga
;---------------------------------------------------------------------------------------------------
..pyramid
...end
;---------------------------------------------------------------------------------------------------
..gold_knights
...end
;---------------------------------------------------------------------------------------------------
..dark_room_of_despair
...end
;---------------------------------------------------------------------------------------------------
..dark_room_of_melancholy
...end
;---------------------------------------------------------------------------------------------------
..spear_guards
...end
;---------------------------------------------------------------------------------------------------
..circle_of_pots
...end
;---------------------------------------------------------------------------------------------------
..pit_room
...end
;---------------------------------------------------------------------------------------------------
..agahnim
...end
;---------------------------------------------------------------------------------------------------
.ganon
;---------------------------------------------------------------------------------------------------
..pyramid
%write8($7EF36F, $FF) ; Keys
%write8($7EF36C, $1818) ; Health (goal)
%write8($7EF377, $F8) ; abilities
%write8($7EF3DC, $8C01) ; Player name
%write8($7EF3E0, $AA01) ; Player name
%write16sram($7EF401, $FFFF) ; Deaths
%write8($7EF3DA, $8C01) ; Player name
%write8($7EF3DE, $8C01) ; Player name
%write8($7EF3E2, $55) ; Player name
%write8($7EF402, $FF) ; Deaths
%write8($7EF4FE, $F1EA) ; Inverse checksum
%write8($7EF2BB, $00) ; Overworld $3B: Unknown (........)
%write8($7EF2FB, $00) ; Overworld $7B: Unknown (........)
%write8($7EF3C8, $03) ; Entrances Phase
%write8($7EF359, $01) ; Sword
%write8($7EF3C5, $01) ; Game Phase 1
%write8($7EF35A, $01) ; Shield
%write16sram($7EF360, $01) ; Rupees (actual)
%write8($7EF3C6, $11) ; Game Phase 2
%write8($7EF36F, $00) ; Keys
%write8($7EF341, $01) ; Boomerang
%write8($7EF3D3, $00) ; Super Bomb Boom
%write8($7EF3FF, $00) ; Deaths
%write8($7EF3C8, $02) ; Entrances Phase
%write8($7EF3CC, $01) ; Tagalong
%write8($7EF3E5, $00) ; Validity (checksum)
%write8($7EF34A, $01) ; Torch
%write16sram($7EF366, $4000) ; BigKey1
%write8($7EF3C8, $04) ; Entrances Phase
%write8($7EF29B, $20) ; Overworld $1B: Unknown (...?....)
%write8($7EF36F, $FF) ; Keys
%write8($7EF3C7, $01) ; Map Phase
%write8($7EF3E3, $00) ; Player name
%write8($7EF3FF, $01) ; Deaths
%write8($7EF340, $100) ; Bow
%write8($7EF3C8, $01) ; Entrances Phase
%write8($7EF3CC, $00) ; Tagalong
%write8($7EF36D, $18) ; Health (actual)
%write8($7EF3C5, $02) ; Game Phase 1
%write8($7EF29A, $2000) ; Overworld $1A: Unknown (........)
%write8($7EF3C6, $115) ; Game Phase 2
%write8($7EF3FE, $100) ; Deaths
%write8($7EF4FE, $DA90) ; Inverse checksum
%write8($7EF36F, $00) ; Keys
%write8($7EF377, $05) ; Arrows
%write8($7EF36D, $0C) ; Health (actual)
%write16sram($7EF366, $6000) ; BigKey1
%write8($7EF377, $0F) ; Arrows
%write8($7EF340, $02) ; Bow
%write8($7EF34F, $00) ; Bottles
%write8($7EF373, $00) ; Magic filler
%write8($7EF377, $0E) ; Arrows
%write8($7EF36E, $10) ; Magic Power
%write8($7EF377, $18) ; Arrows
%write8($7EF377, $16) ; Arrows
%write8($7EF36F, $FF) ; Keys
%write8($7EF377, $04) ; Arrows
%write8($7EF3E7, $01) ; Deaths
%write8($7EF3FF, $00) ; Deaths
%write8($7EF36C, $20) ; Health (goal)
%write8($7EF374, $04) ; Pendants
%write8($7EF36D, $20) ; Health (actual)
%write8($7EF36E, $80) ; Magic Power
%write8($7EF343, $03) ; Bombs
%write8($7EF36F, $00) ; Keys
%write8($7EF3C7, $03) ; Map Phase
%write8($7EF3FF, $01) ; Deaths
%write8($7EF354, $100) ; Gloves
%write8($7EF36C, $1820) ; Health (goal)
%write8($7EF377, $FC) ; abilities
%write8($7EF355, $01) ; Boots
%write8($7EF36D, $18) ; Health (actual)
%write8($7EF375, $00) ; Bomb filler
%write8($7EF379, $FC) ; Ability Flags
%write8($7EF342, $300) ; Hookshot
%write8($7EF36E, $FF80) ; Magic Power
%write8($7EF376, $400) ; Arrow filler
%write8($7EF3C6, $315) ; Game Phase 2
%write8($7EF4FE, $9B53) ; Inverse checksum
%write8($7EF36F, $FF) ; Keys
%write8($7EF36C, $28) ; Health (goal)
%write8($7EF36D, $28) ; Health (actual)
%write8($7EF3C8, $05) ; Entrances Phase
%write8($7EF3CC, $04) ; Tagalong
%write8($7EF353, $02) ; Magic Mirror
%write8($7EF3C8, $01) ; Entrances Phase
%write8($7EF3CC, $00) ; Tagalong
%write8($7EF343, $04) ; Bombs
%write8($7EF36F, $00) ; Keys
%write8($7EF36D, $20) ; Health (actual)
%write8($7EF343, $05) ; Bombs
%write8($7EF36F, $01) ; Keys
%write8($7EF382, $01) ; Key for dungeon $06
%write16sram($7EF366, $6200) ; BigKey1
%write8($7EF36F, $00) ; Keys
%write8($7EF343, $07) ; Bombs
%write8($7EF34B, $01) ; Hammer
%write8($7EF36D, $18) ; Health (actual)
%write8($7EF382, $00) ; Key for dungeon $06
%write8($7EF343, $09) ; Bombs
%write8($7EF36F, $01) ; Keys
%write8($7EF377, $03) ; Arrows
%write8($7EF377, $04) ; Arrows
%write8($7EF376, $00) ; Arrow filler
%write8($7EF377, $02) ; Arrows
%write8($7EF36F, $00) ; Keys
%write16sram($7EF360, $02) ; Rupees (actual)
%write8($7EF36F, $FF) ; Keys
%write8($7EF3C7, $07) ; Map Phase
%write8($7EF3EF, $01) ; Deaths
%write8($7EF3FF, $00) ; Deaths
%write8($7EF36C, $30) ; Health (goal)
%write8($7EF36D, $30) ; Health (actual)
%write8($7EF37A, $02) ; Crystals
%write8($7EF3FF, $01) ; Deaths
%write8($7EF36C, $2030) ; Health (goal)
%write8($7EF36D, $20) ; Health (actual)
%write8($7EF342, $900) ; Hookshot
%write8($7EF34A, $101) ; Torch
%write8($7EF352, $200) ; Magic Cape
%write8($7EF376, $200) ; Arrow filler
%write8($7EF3C6, $715) ; Game Phase 2
%write8($7EF3EE, $100) ; Deaths
%write8($7EF4FE, $6BA7) ; Inverse checksum
%write8($7EF36F, $00) ; Keys
%write16sram($7EF366, $6220) ; BigKey1
%write8($7EF36E, $70) ; Magic Power
%write8($7EF343, $0A) ; Bombs
%write8($7EF357, $01) ; Moon Pearl
%write8($7EF36D, $18) ; Health (actual)
%write8($7EF36F, $FF) ; Keys
%write8($7EF3F7, $01) ; Deaths
%write8($7EF3FF, $00) ; Deaths
%write8($7EF36C, $38) ; Health (goal)
%write8($7EF374, $05) ; Pendants
%write8($7EF36D, $38) ; Health (actual)
%write8($7EF36E, $80) ; Magic Power
%write8($7EF3CA, $40) ; LW/DW
%write8($7EF36F, $00) ; Keys
%write8($7EF2D8, $20) ; Overworld $58: Unknown (...?....)
%write16sram($7EF366, $6230) ; BigKey1
%write8($7EF343, $09) ; Bombs
%write8($7EF343, $0A) ; Bombs
%write8($7EF343, $09) ; Bombs
%write8($7EF354, $02) ; Gloves
%write8($7EF3CC, $06) ; Tagalong
%write8($7EF377, $07) ; Arrows
%write8($7EF376, $00) ; Arrow filler
%write8($7EF36F, $FF) ; Keys
%write8($7EF36C, $40) ; Health (goal)
%write8($7EF3CC, $00) ; Tagalong
%write8($7EF36D, $40) ; Health (actual)
%write8($7EF3F9, $00) ; Deaths
%write8($7EF37A, $22) ; Crystals
%write8($7EF387, $00) ; Key for dungeon $0B
%write8($7EF343, $08) ; Bombs
%write8($7EF2D8, $22) ; Overworld $58: Unknown (...?...?)
%write16sram($7EF360, $12E) ; Rupees (actual)
%write8($7EF3CC, $07) ; Tagalong
%write8($7EF34E, $01) ; Book of Mudora
%write8($7EF3CC, $00) ; Tagalong
%write8($7EF359, $03) ; Sword
%write8($7EF3C9, $20) ; Game Phase 3
%write16sram($7EF360, $124) ; Rupees (actual)
%write16sram($7EF360, $250) ; Rupees (actual)
%write8($7EF377, $0C) ; Arrows
%write16sram($7EF366, $62B0) ; BigKey1
%write8($7EF343, $07) ; Bombs
%write8($7EF36F, $00) ; Keys
%write8($7EF345, $01) ; Fire Rod
%write8($7EF36D, $30) ; Health (actual)
%write8($7EF36F, $FF) ; Keys
%write8($7EF2C0, $20) ; Overworld $40: Unknown (...?....)
%write8($7EF384, $01) ; Key for dungeon $08
%write8($7EF36E, $70) ; Magic Power
%write8($7EF36F, $00) ; Keys
%write8($7EF36E, $30) ; Magic Power
%write8($7EF36F, $FF) ; Keys
%write8($7EF3F3, $00) ; Deaths
%write8($7EF36C, $48) ; Health (goal)
%write8($7EF384, $00) ; Key for dungeon $08
%write8($7EF36D, $48) ; Health (actual)
%write8($7EF36E, $80) ; Magic Power
%write8($7EF37A, $62) ; Crystals
%write8($7EF3FF, $01) ; Deaths
%write8($7EF344, $100) ; Mushroom
%write8($7EF354, $102) ; Gloves
%write8($7EF36C, $3048) ; Health (goal)
%write8($7EF36D, $30) ; Health (actual)
%write8($7EF342, $700) ; Hookshot
%write8($7EF356, $100) ; Flippers
%write8($7EF36E, $FF80) ; Magic Power
%write8($7EF376, $C00) ; Arrow filler
%write8($7EF3CA, $00) ; LW/DW
%write8($7EF3F6, $100) ; Deaths
%write8($7EF4FE, $9709) ; Inverse checksum
%write8($7EF348, $01) ; Ether Medallion
%write8($7EF3FF, $02) ; Deaths
%write8($7EF377, $FE) ; abilities
%write8($7EF379, $FE) ; Ability Flags
%write8($7EF356, $101) ; Flippers
%write16sram($7EF360, $A1) ; Rupees (actual)
%write8($7EF3FE, $200) ; Deaths
%write8($7EF4FE, $9797) ; Inverse checksum
%write16sram($7EF360, $5C) ; Rupees (actual)
%write8($7EF343, $06) ; Bombs
%write8($7EF36D, $28) ; Health (actual)
%write8($7EF3CA, $40) ; LW/DW
%write8($7EF36F, $00) ; Keys
%write8($7EF3CA, $00) ; LW/DW
%write8($7EF377, $11) ; Arrows
%write8($7EF376, $00) ; Arrow filler
%write8($7EF37F, $00) ; Key for dungeon $03
%write16sram($7EF366, $72B0) ; BigKey1
%write8($7EF377, $16) ; Arrows
%write8($7EF36E, $50) ; Magic Power
%write8($7EF36F, $FF) ; Keys
%write8($7EF3C7, $04) ; Map Phase
%write8($7EF3FF, $00) ; Deaths
%write8($7EF36C, $50) ; Health (goal)
%write8($7EF374, $07) ; Pendants
%write8($7EF36D, $50) ; Health (actual)
%write8($7EF3E9, $02) ; Deaths
%write8($7EF36E, $80) ; Magic Power
%write8($7EF2F0, $20) ; Overworld $70: Unknown (...?....)
%write8($7EF36E, $60) ; Magic Power
%write8($7EF3CA, $40) ; LW/DW
%write8($7EF36F, $00) ; Keys
%write8($7EF36E, $50) ; Magic Power
%write8($7EF36F, $02) ; Keys
%write8($7EF36D, $38) ; Health (actual)
%write8($7EF36F, $01) ; Keys
%write16sram($7EF366, $73B0) ; BigKey1
%write8($7EF36E, $10) ; Magic Power
%write8($7EF36E, $80) ; Magic Power
%write8($7EF343, $05) ; Bombs
%write8($7EF36D, $50) ; Health (actual)
%write8($7EF36F, $00) ; Keys
%write8($7EF383, $00) ; Key for dungeon $07
%write8($7EF36D, $48) ; Health (actual)
%write8($7EF342, $01) ; Hookshot
%write8($7EF36E, $60) ; Magic Power
%write8($7EF350, $01) ; Cane of Somaria
%write8($7EF36D, $40) ; Health (actual)
%write16sram($7EF360, $5D) ; Rupees (actual)
%write8($7EF36E, $50) ; Magic Power
%write8($7EF36F, $FF) ; Keys
%write8($7EF377, $0E) ; Arrows
%write8($7EF36C, $58) ; Health (goal)
%write8($7EF36D, $58) ; Health (actual)
%write8($7EF3F1, $00) ; Deaths
%write8($7EF36E, $80) ; Magic Power
%write8($7EF37A, $63) ; Crystals
%write8($7EF3CA, $00) ; LW/DW
%write8($7EF2BB, $20) ; Overworld $3B: Unknown (...?....)
%write8($7EF2FB, $20) ; Overworld $7B: Unknown (...?....)
%write8($7EF3CA, $40) ; LW/DW
%write8($7EF36F, $00) ; Keys
%write8($7EF343, $06) ; Bombs
%write8($7EF36D, $50) ; Health (actual)
%write8($7EF36F, $FF) ; Keys
%write8($7EF36C, $60) ; Health (goal)
%write8($7EF36D, $60) ; Health (actual)
%write8($7EF381, $00) ; Key for dungeon $05
%write8($7EF3ED, $00) ; Deaths
%write8($7EF37A, $73) ; Crystals
%write8($7EF2BB, $00) ; Overworld $3B: Unknown (........)
%write8($7EF2FB, $00) ; Overworld $7B: Unknown (........)
%write8($7EF36F, $00) ; Keys
%write8($7EF343, $04) ; Bombs
%write8($7EF36D, $58) ; Health (actual)
%write8($7EF343, $03) ; Bombs
%write8($7EF36D, $50) ; Health (actual)
%write8($7EF36F, $FF) ; Keys
%write8($7EF36C, $68) ; Health (goal)
%write8($7EF36D, $68) ; Health (actual)
%write8($7EF385, $00) ; Key for dungeon $09
%write8($7EF3F5, $00) ; Deaths
%write8($7EF37A, $77) ; Crystals
%write8($7EF2B7, $02) ; Overworld $37: Unknown (.......?)
%write8($7EF343, $02) ; Bombs
%write8($7EF3FF, $01) ; Deaths
%write8($7EF36C, $3868) ; Health (goal)
%write8($7EF3E8, $200) ; Deaths
%write8($7EF36D, $38) ; Health (actual)
%write8($7EF2B6, $200) ; Overworld $36: Unknown (........)
%write8($7EF342, $201) ; Hookshot
%write8($7EF346, $01) ; Ice Rod
%write8($7EF36E, $FF80) ; Magic Power
%write8($7EF376, $E00) ; Arrow filler
%write8($7EF3C6, $415) ; Game Phase 2
%write8($7EF3CA, $00) ; LW/DW
%write8($7EF3FE, $100) ; Deaths
%write8($7EF4FE, $4F0) ; Inverse checksum
%write8($7EF3CA, $40) ; LW/DW
%write8($7EF343, $01) ; Bombs
%write8($7EF36F, $01) ; Keys
%write8($7EF36D, $28) ; Health (actual)
%write8($7EF36E, $78) ; Magic Power
%write8($7EF36E, $70) ; Magic Power
%write8($7EF388, $01) ; Key for dungeon $0C
%write16sram($7EF366, $73B8) ; BigKey1
%write8($7EF36F, $00) ; Keys
%write8($7EF36E, $60) ; Magic Power
%write8($7EF36F, $FF) ; Keys
%write8($7EF3C7, $08) ; Map Phase
%write8($7EF3FB, $01) ; Deaths
%write8($7EF3FF, $00) ; Deaths
%write8($7EF36C, $70) ; Health (goal)
%write8($7EF388, $00) ; Key for dungeon $0C
%write8($7EF36D, $70) ; Health (actual)
%write8($7EF36E, $80) ; Magic Power
%write8($7EF37A, $7F) ; Crystals
%write8($7EF3FF, $01) ; Deaths
%write8($7EF36C, $4070) ; Health (goal)
%write8($7EF36D, $40) ; Health (actual)
%write8($7EF342, $101) ; Hookshot
%write8($7EF36E, $FF80) ; Magic Power
%write8($7EF3C6, $815) ; Game Phase 2
%write8($7EF3CA, $00) ; LW/DW
%write8($7EF3FA, $100) ; Deaths
%write8($7EF4FE, $EBCB) ; Inverse checksum
%write8($7EF36F, $00) ; Keys
%write8($7EF3CA, $40) ; LW/DW
%write8($7EF36F, $01) ; Keys
%write8($7EF377, $13) ; Arrows
%write8($7EF376, $00) ; Arrow filler
%write8($7EF377, $0B) ; Arrows
%write8($7EF389, $01) ; Key for dungeon $0D
%write16sram($7EF366, $73BC) ; BigKey1
%write8($7EF377, $0A) ; Arrows
%write8($7EF36D, $28) ; Health (actual)
%write8($7EF377, $02) ; Arrows
%write8($7EF377, $01) ; Arrows
%write8($7EF36D, $20) ; Health (actual)
%write8($7EF36E, $70) ; Magic Power
%write8($7EF36E, $20) ; Magic Power
%write8($7EF36E, $18) ; Magic Power
%write8($7EF36E, $10) ; Magic Power
%write8($7EF373, $21) ; Magic filler
%write8($7EF36E, $63) ; Magic Power
%write8($7EF373, $00) ; Magic filler
%write8($7EF36E, $40) ; Magic Power
%write8($7EF36D, $18) ; Health (actual)
%write8($7EF343, $00) ; Bombs
%write8($7EF36F, $00) ; Keys
%write8($7EF36D, $10) ; Health (actual)
%write8($7EF2DB, $20) ; Overworld $5B: Unknown (...?....)
%write8($7EF36F, $FF) ; Keys
%write8($7EF3FF, $00) ; Deaths
%write8($7EF389, $00) ; Key for dungeon $0D
%write8($7EF3FD, $01) ; Deaths
%write8($7EF29B, $60) ; Overworld $1B: Unknown (..??....)
%write8($7EF36F, $00) ; Keys
%write8($7EF3CA, $00) ; LW/DW
%write8($7EF36D, $48) ; Health (actual)
%write8($7EF36E, $30) ; Magic Power
%write8($7EF36E, $00) ; Magic Power
%write16sram($7EF360, $63) ; Rupees (actual)
%write8($7EF36F, $FF) ; Keys
%write8($7EF3C7, $06) ; Map Phase
%write8($7EF3EB, $00) ; Deaths
%write8($7EF36D, $70) ; Health (actual)
%write8($7EF3C5, $03) ; Game Phase 1
%write8($7EF282, $20) ; Overworld $02: Unknown (...?....)
%write8($7EF36E, $80) ; Magic Power
%write8($7EF3CA, $40) ; LW/DW
%writeroom($104, $0002) ; Room $0104: Unknown (...............q)
%writeroom($106, $F000) ; Room $0106: Unknown (.dddb...........)
%writeroom($107, $F000) ; Room $0107: Unknown (.dddb...........)
%writeroom($055, $000F) ; Room $0055: Castle Secret Entrance / Uncle Death Room (.............qqq)
%writeroom($028, $0000) ; Room $0028: Swamp Palace (Entrance Room) (................)
%writeroom($050, $0005) ; Room $0050: Hyrule Castle (West Corridor) (..............q.)
%writeroom($060, $0005) ; Room $0060: Hyrule Castle (West Entrance Room) (..............q.)
%writeroom($001, $000C) ; Room $0001: Hyrule Castle (North Corridor) (.............qq.)
%writeroom($061, $000F) ; Room $0061: Hyrule Castle (Main Entrance Room) (.............qqq)
%writeroom($072, $840F) ; Room $0072: Hyrule Castle (Map Chest Room) (.d....K......qqq)
%writeroom($082, $000F) ; Room $0082: Hyrule Castle (Basement Chasm Room) (.............qqq)
%writeroom($071, $0002) ; Room $0071: Hyrule Castle (Boomerang Chest Room) (...............q)
%writeroom($081, $000F) ; Room $0081: Hyrule Castle (.............qqq)
%writeroom($070, $0008) ; Room $0070: Hyrule Castle (Small Corridor to Jail Cells) (.............q..)
%writeroom($071, $841B) ; Room $0071: Hyrule Castle (Boomerang Chest Room) (.d....K.....qq.q)
%writeroom($080, $043C) ; Room $0080: Hyrule Castle (Jail Cell Room) (......K....cqqq.)
%writeroom($041, $000F) ; Room $0041: Hyrule Castle (First Dark Room) (.............qqq)
%writeroom($051, $000F) ; Room $0051: Hyrule Castle (Throne Room) (.............qqq)
%writeroom($032, $801F) ; Room $0032: Hyrule Castle (Sewer Key Chest Room) (.d..........qqqq)
%writeroom($042, $000C) ; Room $0042: Hyrule Castle (6 Ropes Room) (.............qq.)
%writeroom($022, $8003) ; Room $0022: Hyrule Castle (Sewer Text Trigger Room) (.d.............q)
%writeroom($021, $0003) ; Room $0021: Hyrule Castle (Key-rat Room) (...............q)
%writeroom($011, $2005) ; Room $0011: Hyrule Castle (Bombable Stock Room) (...d..........q.)
%writeroom($021, $840F) ; Room $0021: Hyrule Castle (Key-rat Room) (.d....K......qqq)
%writeroom($002, $000F) ; Room $0002: Hyrule Castle (Switch Room) (.............qqq)
%writeroom($012, $000F) ; Room $0012: Sanctuary (.............qqq)
%writeroom($0C9, $0003) ; Room $00C9: Eastern Palace (Entrance Room) (...............q)
%writeroom($0A8, $0005) ; Room $00A8: Eastern Palace (Stalfos Spawn Room) (..............q.)
%writeroom($0A9, $000F) ; Room $00A9: Eastern Palace (Big Chest Room) (.............qqq)
%writeroom($0B9, $000F) ; Room $00B9: Eastern Palace (Lobby Cannonballs Room) (.............qqq)
%writeroom($0C9, $000F) ; Room $00C9: Eastern Palace (Entrance Room) (.............qqq)
%writeroom($0A8, $000F) ; Room $00A8: Eastern Palace (Stalfos Spawn Room) (.............qqq)
%writeroom($0AA, $000A) ; Room $00AA: Eastern Palace (Map Chest Room) (.............q.q)
%writeroom($0BA, $0008) ; Room $00BA: Eastern Palace (Dark Antifairy / Key Pot Room) (.............q..)
%writeroom($0BA, $840C) ; Room $00BA: Eastern Palace (Dark Antifairy / Key Pot Room) (.d....K......qq.)
%writeroom($0B9, $800F) ; Room $00B9: Eastern Palace (Lobby Cannonballs Room) (.d...........qqq)
%writeroom($0A8, $200F) ; Room $00A8: Eastern Palace (Stalfos Spawn Room) (...d.........qqq)
%writeroom($0B8, $8015) ; Room $00B8: Eastern Palace (Big Key Room) (.d..........q.q.)
%writeroom($0A9, $201F) ; Room $00A9: Eastern Palace (Big Chest Room) (...d........qqqq)
%writeroom($099, $C403) ; Room $0099: Eastern Palace (Eyegore Key Room) (.dd...K........q)
%writeroom($0DA, $0002) ; Room $00DA: Eastern Palace (...............q)
%writeroom($0D9, $0003) ; Room $00D9: Eastern Palace (Canonball Room) (...............q)
%writeroom($0D8, $0005) ; Room $00D8: Eastern Palace (Zeldagamer Room / Pre-Armos Knights Room) (..............q.)
%writeroom($0C8, $0801) ; Room $00C8: Eastern Palace (Armos Knights[Boss]) (.....k..........)
%writeroom($105, $802A) ; Room $0105: Unknown (.d.........c.q.q)
%writeroom($012, $001F) ; Room $0012: Sanctuary (............qqqq)
%writeroom($0F0, $000F) ; Room $00F0: Cave (Lost Old Man Starting Cave) (.............qqq)
%writeroom($0F1, $000F) ; Room $00F1: Cave (Lost Old Man Starting Cave) (.............qqq)
%writeroom($04A, $200F) ; Room $004A: Palace of Darkness (Entrance Room) (...d.........qqq)
%writeroom($009, $0008) ; Room $0009: Palace of Darkness (.............q..)
%writeroom($0F9, $000F) ; Room $00F9: Cave (.............qqq)
%writeroom($009, $0018) ; Room $0009: Palace of Darkness (............qq..)
%writeroom($00A, $801F) ; Room $000A: Palace of Darkness (Stalfos Trap Room) (.d..........qqqq)
%writeroom($03A, $801F) ; Room $003A: Palace of Darkness (Bombable Floor Room) (.d..........qqqq)
%writeroom($02A, $400F) ; Room $002A: Palace of Darkness (Big Hub Room) (..d..........qqq)
%writeroom($01A, $101A) ; Room $001A: Palace of Darkness (Big Chest Room) (....b.......qq.q)
%writeroom($02A, $402F) ; Room $002A: Palace of Darkness (Big Hub Room) (..d........c.qqq)
%writeroom($02B, $000A) ; Room $002B: Palace of Darkness (Map Chest / Fairy Room) (.............q.q)
%writeroom($01B, $0002) ; Room $001B: Palace of Darkness (Mimics / Moving Wall Room) (...............q)
%writeroom($01B, $008E) ; Room $001B: Palace of Darkness (Mimics / Moving Wall Room) (.........c...qqq)
%writeroom($00B, $200C) ; Room $000B: Palace of Darkness (Turtle Room) (...d.........qq.)
%writeroom($06A, $8005) ; Room $006A: Palace of Darkness (Rupee Room) (.d............q.)
%writeroom($00B, $200F) ; Room $000B: Palace of Darkness (Turtle Room) (...d.........qqq)
%writeroom($05A, $0801) ; Room $005A: Palace of Darkness (Helmasaur King[Boss]) (.....k..........)
%writeroom($0E4, $000A) ; Room $00E4: Cave (Lost Old Man Final Cave) (.............q.q)
%writeroom($077, $000F) ; Room $0077: Tower of Hera (Entrance Room) (.............qqq)
%writeroom($077, $800F) ; Room $0077: Tower of Hera (Entrance Room) (.d...........qqq)
%writeroom($087, $0402) ; Room $0087: Tower of Hera (Tile Room) (......K........q)
%writeroom($087, $040E) ; Room $0087: Tower of Hera (Tile Room) (......K......qqq)
%writeroom($087, $041F) ; Room $0087: Tower of Hera (Tile Room) (......K.....qqqq)
%writeroom($031, $800F) ; Room $0031: Tower of Hera (Hardhat Beetles Room) (.d...........qqq)
%writeroom($017, $000F) ; Room $0017: Tower of Hera (Moldorm Fall Room) (.............qqq)
%writeroom($027, $001F) ; Room $0027: Tower of Hera (Big Chest) (............qqqq)
%writeroom($007, $080F) ; Room $0007: Tower of Hera (Moldorm[Boss]) (.....k.......qqq)
%writeroom($0DB, $000F) ; Room $00DB: Thieves Town (Main (South West) Entrance Room) (.............qqq)
%writeroom($0CC, $000F) ; Room $00CC: Thieves Town (North East Entrance Room) (.............qqq)
%writeroom($0DC, $000F) ; Room $00DC: Thieves Town (South East Entrance Room) (.............qqq)
%writeroom($0CB, $000F) ; Room $00CB: Thieves Town (North West Entrance Room) (.............qqq)
%writeroom($0DB, $002F) ; Room $00DB: Thieves Town (Main (South West) Entrance Room) (...........c.qqq)
%writeroom($0CC, $800F) ; Room $00CC: Thieves Town (North East Entrance Room) (.d...........qqq)
%writeroom($0BC, $C407) ; Room $00BC: Thieves Town (Conveyor Toilet) (.dd...K.......qq)
%writeroom($0BB, $0001) ; Room $00BB: Thieves Town (Hellway) (................)
%writeroom($064, $0003) ; Room $0064: Thieves Town (West Attic Room) (...............q)
%writeroom($065, $0002) ; Room $0065: Thieves Town (East Attic Room) (...............q)
%writeroom($0AB, $8402) ; Room $00AB: Thieves Town (Moving Spikes / Key Pot Room) (.d....K........q)
%writeroom($0BB, $000B) ; Room $00BB: Thieves Town (Hellway) (.............q.q)
%writeroom($065, $0103) ; Room $0065: Thieves Town (East Attic Room) (........c......q)
%writeroom($0BC, $C40F) ; Room $00BC: Thieves Town (Conveyor Toilet) (.dd...K......qqq)
%writeroom($0BB, $000F) ; Room $00BB: Thieves Town (Hellway) (.............qqq)
%writeroom($044, $0005) ; Room $0044: Thieves Town (Big Chest Room) (..............q.)
%writeroom($045, $000A) ; Room $0045: Thieves Town (Jail Cells Room) (.............q.q)
%writeroom($044, $4017) ; Room $0044: Thieves Town (Big Chest Room) (..d.........q.qq)
%writeroom($045, $00FF) ; Room $0045: Thieves Town (Jail Cells Room) (.........cccqqqq)
%writeroom($0AC, $0A01) ; Room $00AC: Thieves Town (Blind The Thief[Boss]) (.....k.R........)
%writeroom($106, $F012) ; Room $0106: Unknown (.dddb.......q..q)
%writeroom($107, $F002) ; Room $0107: Unknown (.dddb..........q)
%writeroom($121, $0002) ; Room $0121: Unknown (...............q)
%writeroom($11C, $0011) ; Room $011C: Unknown (............q...)
%writeroom($057, $001A) ; Room $0057: Skull Woods (Big Key Room) (............qq.q)
%writeroom($056, $0005) ; Room $0056: Skull Woods (Key Pot / Trap Room) (..............q.)
%writeroom($058, $0012) ; Room $0058: Skull Woods (Big Chest Room) (............q..q)
%writeroom($056, $0407) ; Room $0056: Skull Woods (Key Pot / Trap Room) (......K.......qq)
%writeroom($049, $2002) ; Room $0049: Skull Woods (Gibdo Torch Puzzle Room) (...d...........q)
%writeroom($059, $800A) ; Room $0059: Skull Woods (Final Section Entrance Room) (.d...........q.q)
%writeroom($049, $A00F) ; Room $0049: Skull Woods (Gibdo Torch Puzzle Room) (.d.d.........qqq)
%writeroom($039, $4402) ; Room $0039: Skull Woods (Gibdo Key / Mothula Hole Room) (..d...K........q)
%writeroom($029, $0801) ; Room $0029: Skull Woods (Mothula[Boss]) (.....k..........)
%writeroom($039, $4403) ; Room $0039: Skull Woods (Gibdo Key / Mothula Hole Room) (..d...K........q)
%writeroom($083, $0002) ; Room $0083: Desert Palace (West Entrance Room) (...............q)
%writeroom($073, $0001) ; Room $0073: Desert Palace (Big Chest Room) (................)
%writeroom($083, $0007) ; Room $0083: Desert Palace (West Entrance Room) (..............qq)
%writeroom($074, $0003) ; Room $0074: Desert Palace (Map Chest Room) (...............q)
%writeroom($073, $0405) ; Room $0073: Desert Palace (Big Chest Room) (......K.......q.)
%writeroom($075, $0002) ; Room $0075: Desert Palace (Big Key Chest Room) (...............q)
%writeroom($085, $400A) ; Room $0085: Desert Palace (East Entrance Room) (..d..........q.q)
%writeroom($075, $0017) ; Room $0075: Desert Palace (Big Key Chest Room) (............q.qq)
%writeroom($085, $400E) ; Room $0085: Desert Palace (East Entrance Room) (..d..........qqq)
%writeroom($043, $6401) ; Room $0043: Desert Palace (Torch Puzzle / Moving Wall Room) (..dd..K.........)
%writeroom($053, $240F) ; Room $0053: Desert Palace (Popos 2 / Beamos Hellway Room) (...d..K......qqq)
%writeroom($063, $840A) ; Room $0063: Desert Palace (Final Section Entrance Room) (.d....K......q.q)
%writeroom($043, $E48D) ; Room $0043: Desert Palace (Torch Puzzle / Moving Wall Room) (.ddd..K..c...qq.)
%writeroom($033, $0802) ; Room $0033: Desert Palace (Lanmolas[Boss]) (.....k.........q)
%writeroom($098, $0003) ; Room $0098: Misery Mire (Entrance Room) (...............q)
%writeroom($0D2, $000F) ; Room $00D2: Misery Mire (Mire02 / Wizzrobes Room) (.............qqq)
%writeroom($0B2, $0001) ; Room $00B2: Misery Mire (Slug Room) (................)
%writeroom($0C2, $000F) ; Room $00C2: Misery Mire (Big Hub Room) (.............qqq)
%writeroom($0B3, $0412) ; Room $00B3: Misery Mire (Spike Key Chest Room) (......K.....q..q)
%writeroom($0C2, $400F) ; Room $00C2: Misery Mire (Big Hub Room) (..d..........qqq)
%writeroom($0C1, $C403) ; Room $00C1: Misery Mire (Compass Chest / Tile Room) (.dd...K........q)
%writeroom($0D1, $0008) ; Room $00D1: Misery Mire (Conveyor Slug / Big Key Room) (.............q..)
%writeroom($097, $010F) ; Room $0097: Misery Mire (Torch Puzzle / Moving Wall Room) (........c....qqq)
%writeroom($0B1, $0007) ; Room $00B1: Misery Mire (Hourglass Room) (..............qq)
%writeroom($0C1, $C407) ; Room $00C1: Misery Mire (Compass Chest / Tile Room) (.dd...K.......qq)
%writeroom($0D1, $001B) ; Room $00D1: Misery Mire (Conveyor Slug / Big Key Room) (............qq.q)
%writeroom($0A7, $000C) ; Room $00A7: Tower of Hera (Fairy Room) (.............qq.)
%writeroom($036, $001F) ; Room $0036: Swamp Palace (Big Chest Room) (............qqqq)
%writeroom($037, $208F) ; Room $0037: Swamp Palace (Map Chest / Water Fill Room) (...d.....c...qqq)
%writeroom($0C3, $000A) ; Room $00C3: Misery Mire (Big Chest Room) (.............q.q)
%writeroom($0C3, $001F) ; Room $00C3: Misery Mire (Big Chest Room) (............qqqq)
%writeroom($0B2, $800D) ; Room $00B2: Misery Mire (Slug Room) (.d...........qq.)
%writeroom($0B1, $800F) ; Room $00B1: Misery Mire (Hourglass Room) (.d...........qqq)
%writeroom($092, $0005) ; Room $0092: Misery Mire (Dark Bomb Wall / Switches Room) (..............q.)
%writeroom($0A2, $800F) ; Room $00A2: Misery Mire (Bridge Key Chest Room) (.d...........qqq)
%writeroom($093, $000E) ; Room $0093: Misery Mire (Dark Cane Floor Switch Puzzle Room) (.............qqq)
%writeroom($092, $0007) ; Room $0092: Misery Mire (Dark Bomb Wall / Switches Room) (..............qq)
%writeroom($0A0, $800F) ; Room $00A0: Misery Mire (Pre-Vitreous Room) (.d...........qqq)
%writeroom($091, $0005) ; Room $0091: Misery Mire (Final Switch Room) (..............q.)
%writeroom($090, $0802) ; Room $0090: Misery Mire (Vitreous[Boss]) (.....k.........q)
%writeroom($10B, $0003) ; Room $010B: Unknown (...............q)
%writeroom($10B, $008F) ; Room $010B: Unknown (.........c...qqq)
%writeroom($028, $0001) ; Room $0028: Swamp Palace (Entrance Room) (................)
%writeroom($028, $811F) ; Room $0028: Swamp Palace (Entrance Room) (.d......c...qqqq)
%writeroom($038, $440A) ; Room $0038: Swamp Palace (Key Pot Room) (..d...K......q.q)
%writeroom($037, $308F) ; Room $0037: Swamp Palace (Map Chest / Water Fill Room) (...db....c...qqq)
%writeroom($036, $441F) ; Room $0036: Swamp Palace (Big Chest Room) (..d...K.....qqqq)
%writeroom($026, $8007) ; Room $0026: Swamp Palace (Statue Room) (.d............qq)
%writeroom($066, $0003) ; Room $0066: Swamp Palace (Hidden Chest / Hidden Door Room) (...............q)
%writeroom($076, $008E) ; Room $0076: Swamp Palace (Water Drain Room) (.........c...qqq)
%writeroom($016, $000C) ; Room $0016: Swamp Palace (Swimming Treadmill) (.............qq.)
%writeroom($066, $000F) ; Room $0066: Swamp Palace (Hidden Chest / Hidden Door Room) (.............qqq)
%writeroom($016, $440F) ; Room $0016: Swamp Palace (Swimming Treadmill) (..d...K......qqq)
%writeroom($006, $0802) ; Room $0006: Swamp Palace (Arrghus[Boss]) (.....k.........q)
%writeroom($00E, $0001) ; Room $000E: Ice Palace (Entrance Room) (................)
%writeroom($10B, $000F) ; Room $010B: Unknown (.............qqq)
%writeroom($028, $0080) ; Room $0028: Swamp Palace (Entrance Room) (.........c......)
%writeroom($01E, $0004) ; Room $001E: Ice Palace (Bomb Floor / Bari Room) (..............q.)
%writeroom($03E, $0004) ; Room $003E: Ice Palace (Stalfos Knights / Conveyor Hellway) (..............q.)
%writeroom($03E, $4407) ; Room $003E: Ice Palace (Stalfos Knights / Conveyor Hellway) (..d...K.......qq)
%writeroom($04E, $400C) ; Room $004E: Ice Palace (Bomb-Jump Room) (..d..........qq.)
%writeroom($05E, $0001) ; Room $005E: Ice Palace (Lonely Firebar) (................)
%writeroom($06E, $0004) ; Room $006E: Ice Palace (Pengators Room) (..............q.)
%writeroom($05E, $0003) ; Room $005E: Ice Palace (Lonely Firebar) (...............q)
%writeroom($07E, $0002) ; Room $007E: Ice Palace (Hidden Chest / Bombable Floor Room) (...............q)
%writeroom($09E, $0003) ; Room $009E: Ice Palace (Big Chest Room) (...............q)
%writeroom($0BE, $0001) ; Room $00BE: Ice Palace (Block Puzzle Room) (................)
%writeroom($0CE, $0004) ; Room $00CE: Ice Palace (Hole to Kholdstare Room) (..............q.)
%writeroom($0DE, $0804) ; Room $00DE: Ice Palace (Kholdstare[Boss]) (.....k........q.)
%writeroom($028, $801F) ; Room $0028: Swamp Palace (Entrance Room) (.d..........qqqq)
%writeroom($120, $001A) ; Room $0120: Unknown (............qq.q)
%writeroom($0B5, $000F) ; Room $00B5: Turtle Rock (Dark Maze) (.............qqq)
%writeroom($0C5, $000A) ; Room $00C5: Turtle Rock (Laser Bridge) (.............q.q)
%writeroom($0D5, $808A) ; Room $00D5: Turtle Rock (Laser Key Room) (.d.......c...q.q)
%writeroom($004, $401A) ; Room $0004: Turtle Rock (Crysta-roller Room) (..d.........qq.q)
%writeroom($014, $800F) ; Room $0014: Turtle Rock (Big Key Room) (.d...........qqq)
%writeroom($024, $800C) ; Room $0024: Turtle Rock (Double Hokku-Bokku / Big chest Room) (.d...........qq.)
%writeroom($014, $C01F) ; Room $0014: Turtle Rock (Big Key Room) (.dd.........qqqq)
%writeroom($013, $8405) ; Room $0013: Turtle Rock (Hokku-Bokku Key Room 2) (.d....K.......q.)
%writeroom($0C5, $800A) ; Room $00C5: Turtle Rock (Laser Bridge) (.d...........q.q)
%writeroom($0B4, $800F) ; Room $00B4: Turtle Rock (Pre-Trinexx Room) (.d...........qqq)
%writeroom($0C4, $800F) ; Room $00C4: Turtle Rock (Final Crystal Switch Puzzle Room) (.d...........qqq)
%writeroom($0A4, $0802) ; Room $00A4: Turtle Rock (Trinexx[Boss]) (.....k.........q)
%writeroom($00C, $000F) ; Room $000C: Ganon's Tower (Entrance Room) (.............qqq)
%writeroom($08C, $0008) ; Room $008C: Ganon's Tower (East and West Downstairs / Big Chest Room) (.............q..)
%writeroom($08B, $0404) ; Room $008B: Ganon's Tower (Block Puzzle / Spike Skip / Map Chest Room) (......K.......q.)
%writeroom($08B, $040E) ; Room $008B: Ganon's Tower (Block Puzzle / Spike Skip / Map Chest Room) (......K......qqq)
%writeroom($09B, $8408) ; Room $009B: Ganon's Tower (Many Spikes / Warp Maze Room) (.d....K......q..)
%writeroom($09C, $000F) ; Room $009C: Ganon's Tower (Invisible Floor Maze Room) (.............qqq)
%writeroom($07D, $201E) ; Room $007D: Ganon's Tower (Winder / Warp Maze Room) (...d........qqqq)
%writeroom($09B, $840F) ; Room $009B: Ganon's Tower (Many Spikes / Warp Maze Room) (.d....K......qqq)
%writeroom($01C, $0035) ; Room $001C: Ganon's Tower (Ice Armos) (...........cq.q.)
%writeroom($08C, $0009) ; Room $008C: Ganon's Tower (East and West Downstairs / Big Chest Room) (.............q..)
%writeroom($06B, $000C) ; Room $006B: Ganon's Tower (Mimics Rooms) (.............qq.)
%writeroom($06B, $800F) ; Room $006B: Ganon's Tower (Mimics Rooms) (.d...........qqq)
%writeroom($05C, $000C) ; Room $005C: Ganon's Tower (Ganon-Ball Z) (.............qq.)
%writeroom($05B, $8005) ; Room $005B: Ganon's Tower (Spike Pit Room) (.d............q.)
%writeroom($06C, $0001) ; Room $006C: Ganon's Tower (Lanmolas Room) (................)
%writeroom($05D, $000E) ; Room $005D: Ganon's Tower (Gauntlet 1/2/3) (.............qqq)
%writeroom($06D, $000A) ; Room $006D: Ganon's Tower (Gauntlet 4/5) (.............q.q)
%writeroom($06C, $000B) ; Room $006C: Ganon's Tower (Lanmolas Room) (.............q.q)
%writeroom($0A5, $000B) ; Room $00A5: Ganon's Tower (Wizzrobes Rooms) (.............q.q)
%writeroom($095, $0005) ; Room $0095: Ganon's Tower (Final Collapsing Bridge Room) (..............q.)
%writeroom($0A5, $000F) ; Room $00A5: Ganon's Tower (Wizzrobes Rooms) (.............qqq)
%writeroom($096, $000B) ; Room $0096: Ganon's Tower (Torches 1 Room) (.............q.q)
%writeroom($03D, $0001) ; Room $003D: Ganon's Tower (Torch Room 2) (................)
%writeroom($03D, $4405) ; Room $003D: Ganon's Tower (Torch Room 2) (..d...K.......q.)
%writeroom($03D, $740F) ; Room $003D: Ganon's Tower (Torch Room 2) (..ddb.K......qqq)
%writeroom($04C, $0005) ; Room $004C: Ganon's Tower (Mini-Helmasaur Conveyor Room) (..............q.)
%writeroom($01D, $800C) ; Room $001D: Ganon's Tower (Final Hallway) (.d...........qq.)
%writeroom($04D, $800F) ; Room $004D: Ganon's Tower (Moldorm Room) (.d...........qqq)
%writeroom($00D, $0802) ; Room $000D: Ganon's Tower (Agahnim2[Boss]) (.....k.........q)
%writeroom($0E0, $0002) ; Room $00E0: Agahnim's Tower (Entrance Room) (...............q)
%writeroom($0D0, $0004) ; Room $00D0: Agahnim's Tower (Dark Maze) (..............q.)
%writeroom($0E0, $201E) ; Room $00E0: Agahnim's Tower (Entrance Room) (...d........qqqq)
%writeroom($0C0, $0001) ; Room $00C0: Agahnim's Tower (Dark Bridge Room) (................)
%writeroom($0D0, $801F) ; Room $00D0: Agahnim's Tower (Dark Maze) (.d..........qqqq)
%writeroom($0C0, $240F) ; Room $00C0: Agahnim's Tower (Dark Bridge Room) (...d..K......qqq)
%writeroom($0B0, $000C) ; Room $00B0: Agahnim's Tower (Circle of Pots) (.............qq.)
%writeroom($040, $0001) ; Room $0040: Agahnim's Tower (Final Bridge Room) (................)
%writeroom($0B0, $240F) ; Room $00B0: Agahnim's Tower (Circle of Pots) (...d..K......qqq)
%writeroom($030, $840A) ; Room $0030: Agahnim's Tower (Maiden Sacrifice Chamber) (.d....K......q.q)
%writeroom($040, $000B) ; Room $0040: Agahnim's Tower (Final Bridge Room) (.............q.q)
%writeroom($020, $0802) ; Room $0020: Agahnim's Tower (Agahnim[Boss]) (.....k.........q)
...end
;---------------------------------------------------------------------------------------------------
.boss
;===================================================================================================
presetend_adold:
print "adold size: $", hex(presetend_adold-presetheader_adold)