
;===================================================================================================
; PRESET DATA HEADER
;===================================================================================================
presetheader_ad2020:
	dw presetSRAM_ad2020 ; location of SRAM

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
%preset_UW("Courtyard 1", "ad2020", "eastern", "courtyard_1")
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
%preset_OW("Castle Entrance", "ad2020", "eastern", "castle_entrance")
dw $001B ; Screen ID
dw $07F8, $06FA ; Link Coords
dw $069C, $0784 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $02 ; Link direction
;-----------------------------
dw $0803, $0709 ; Scroll X, Y
dw $0530 ; Unknown 1
dw $0004 ; Unknown 2
dw $FFFA ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Courtyard 2", "ad2020", "eastern", "courtyard_2")
dw $0055 ; Screen ID
dw $0A78, $0BDB ; Link Coords
dw $0B10, $0A00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $00 ; Link direction
;-----------------------------
db $7D ; Entrance
db $82 ; Room layout
db $01 ; Main GFX
db $03 ; Music
db $FF ; Floor
db $FF ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write8($7E047A, $01) ; Armed EG
%write8($7E0ABD, $00) ; Palette swap
%write16_enable()
%write16($7E0696, $0001) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("East River FAWT", "ad2020", "eastern", "river_clip")
dw $001B ; Screen ID
dw $08AB, $09E3 ; Link Coords
dw $091E, $0831 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $02 ; Link direction
;-----------------------------
dw $08B6, $098B ; Scroll X, Y
dw $1846 ; Unknown 1
dw $0000 ; Unknown 2
dw $FFFF ; Unknown 3
;-----------------------------
%write8($7E047A, $00) ; Armed EG
%write16_enable()
%write16($7E0542, $044C) ; Object tilemap state
%write16($7E0540, $0470) ; Object tilemap state
%write_7F()
%write8($7FE0EF, $41) ; Overworld $B7 persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Eastern Overworld", "ad2020", "eastern", "outside_palace")
dw $002E ; Screen ID
dw $0C90, $0A04 ; Link Coords
dw $0A00, $0C1E ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $02 ; Link direction
;-----------------------------
dw $0C9B, $0A6D ; Scroll X, Y
dw $0002 ; Unknown 1
dw $0000 ; Unknown 2
dw $FFF2 ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "ad2020", "eastern", "entrance")
dw $001E ; Screen ID
dw $0F50, $0A2A ; Link Coords
dw $091E, $0EDA ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $06 ; Link direction
;-----------------------------
dw $0F57, $098D ; Scroll X, Y
dw $185C ; Unknown 1
dw $0000 ; Unknown 2
dw $0006 ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Stalfos Room", "ad2020", "eastern", "stalfos_room")
dw $00A8 ; Screen ID
dw $111C, $1578 ; Link Coords
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
%write8($7E0B3D, $00) ; Arc variable
%write8($7E0B3F, $00) ; Arc variable
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
%preset_UW("Big Chest Room 1", "ad2020", "eastern", "big_chest_room_1")
dw $00A8 ; Screen ID
dw $11BD, $1478 ; Link Coords
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
%preset_UW("Dark Antifairies Room", "ad2020", "eastern", "dark_antifairies_room")
dw $00AA ; Screen ID
dw $1478, $15DA ; Link Coords
dw $1510, $1400 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $06 ; Link direction
;-----------------------------
db $08 ; Entrance
db $42 ; Room layout
db $05 ; Main GFX
db $11 ; Music
db $00 ; Floor
db $04 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0005) ; Overworld Door
%write16($7E0542, $05E8) ; Object tilemap state
%write16($7E0546, $0AE8) ; Object tilemap state
%write16($7E054A, $376C) ; Object tilemap state
%write16($7E054E, $396C) ; Object tilemap state
%write16($7E0540, $05D4) ; Object tilemap state
%write16($7E0544, $0AD4) ; Object tilemap state
%write16($7E0548, $085E) ; Object tilemap state
%write16($7E054C, $386C) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Dark Key Room", "ad2020", "eastern", "dark_key_room")
dw $00BA ; Screen ID
dw $14D4, $1678 ; Link Coords
dw $160B, $1400 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $02 ; Link direction
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
%write_7F()
%write16_enable()
%write16($7FE0F4, $0010) ; Room $BA persistent: Eastern Palace (Dark Antifairy / Key Pot Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Big Key DMG Boost", "ad2020", "eastern", "big_key_dmg_boost")
dw $00B9 ; Screen ID
dw $121B, $1678 ; Link Coords
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
%write16($7FE0F4, $0050) ; Room $BA persistent: Eastern Palace (Dark Antifairy / Key Pot Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Big Chest Room 2", "ad2020", "eastern", "big_chest_room_2")
dw $00A8 ; Screen ID
dw $11BD, $1478 ; Link Coords
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
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Gifted With Greenies", "ad2020", "eastern", "gwg")
dw $00A9 ; Screen ID
dw $12F8, $1421 ; Link Coords
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
%preset_UW("Pot Room", "ad2020", "eastern", "pot_room")
dw $0099 ; Screen ID
dw $1278, $1326 ; Link Coords
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
%preset_UW("Zeldagamer Room", "ad2020", "eastern", "zeldagamer_room")
dw $00D9 ; Screen ID
dw $121B, $1B78 ; Link Coords
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
%write8($7E0468, $00) ; Trap door state
%write16_enable()
%write16($7E0696, $0005) ; Overworld Door
%write16($7E0542, $1C5C) ; Object tilemap state
%write16($7E0540, $145C) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Armos", "ad2020", "eastern", "armos")
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
; PALACE OF DARKNESS
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_ad2020_pod:
%menu_header("Palace of Darkness", 17)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Eastern", "ad2020", "pod", "outside_eastern")
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
%write8($7E0B09, $00) ; Arc variable
%write8($7E02A1, $17) ; Arc variable
%write8($7E0B08, $40) ; Arc variable
%write8($7E0B10, $31) ; Overlord X coordinate high byte
%write8($7E0B20, $11) ; Overlord Y coordinate high byte
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Eastern Spinspeed", "ad2020", "pod", "eastern_spinspeed")
dw $0105 ; Screen ID
dw $0A78, $21D8 ; Link Coords
dw $2110, $0A00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
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
%write8($7EC167, $00) ; Underworld exit cache
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
dw $0513, $0600 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
db $02 ; Link direction
;-----------------------------
dw $0685, $0582 ; Scroll X, Y
dw $0880 ; Unknown 1
dw $FFFB ; Unknown 2
dw $0000 ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Death Mountain", "ad2020", "pod", "death_mountain")
dw $00F1 ; Screen ID
dw $0378, $1FBD ; Link Coords
dw $1F10, $0300 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
db $04 ; Link direction
;-----------------------------
db $45 ; Entrance
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
%preset_OW("Kiki Yeet", "ad2020", "pod", "kiki_yeet")
dw $0003 ; Screen ID
dw $0718, $03C0 ; Link Coords
dw $031E, $06A4 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
db $02 ; Link direction
;-----------------------------
dw $0723, $038D ; Scroll X, Y
dw $1816 ; Unknown 1
dw $0000 ; Unknown 2
dw $FFFC ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Kiki Skip", "ad2020", "pod", "kiki_skip")
dw $0003 ; Screen ID
dw $0748, $062F ; Link Coords
dw $031E, $06D4 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
db $06 ; Link direction
;-----------------------------
dw $0753, $038D ; Scroll X, Y
dw $181C ; Unknown 1
dw $0000 ; Unknown 2
dw $FFFC ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Dungeon Reload", "ad2020", "pod", "dungeon_reload")
dw $005E ; Screen ID
dw $0F50, $063B ; Link Coords
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
%write8($7E029F, $00) ; Arc variable
%write16_enable()
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
%write_7F()
%write8($7FE103, $52) ; Overworld $C1 persistent: UNKNOWN
%write8($7FE06E, $52) ; Overworld $77 persistent: Black Ice Cave
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Main Hub (Big Key)", "ad2020", "pod", "main_hub_bk")
dw $004A ; Screen ID
dw $14F8, $0824 ; Link Coords
dw $0800, $1480 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $01 ; Item
db $02 ; Link direction
;-----------------------------
db $21 ; Entrance
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
%preset_UW("Main Hub (Hammerjump)", "ad2020", "pod", "main_hub_hammerjump")
dw $004A ; Screen ID
dw $14F8, $0825 ; Link Coords
dw $0800, $1480 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%write8($7E047A, $01) ; Armed EG
%write8($7E0B3B, $00) ; Arc variable
%write8($7E0B0C, $D0) ; Arc variable
%write16_enable()
%write16($7E0696, $0007) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Hammerjump", "ad2020", "pod", "hammerjump")
dw $002A ; Screen ID
dw $1478, $0424 ; Link Coords
dw $0400, $1400 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%write8($7E047A, $00) ; Armed EG
%write16_enable()
%write16($7E0696, $0007) ; Overworld Door
%write16($7E0542, $1350) ; Object tilemap state
%write16($7E0540, $0C50) ; Object tilemap state
%write16($7E0544, $1328) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FDFF4, $0010) ; Room $3A persistent: Palace of Darkness (Bombable Floor Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Archery Contest", "ad2020", "pod", "archery_contest")
dw $003A ; Screen ID
dw $1578, $0624 ; Link Coords
dw $0600, $1500 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%preset_UW("Sexy Statue", "ad2020", "pod", "sexy_statue")
dw $002A ; Screen ID
dw $15C0, $04F8 ; Link Coords
dw $048B, $1500 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%preset_UW("Mimics", "ad2020", "pod", "mimics")
dw $002B ; Screen ID
dw $1678, $0413 ; Link Coords
dw $0400, $1600 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%preset_UW("Statue", "ad2020", "pod", "statue")
dw $001B ; Screen ID
dw $1678, $0324 ; Link Coords
dw $0300, $1600 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%preset_UW("Basement", "ad2020", "pod", "basement")
dw $001B ; Screen ID
dw $1790, $0253 ; Link Coords
dw $0200, $1700 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%write8($7E0468, $01) ; Trap door state
%write16_enable()
%write16($7E0696, $0007) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Turtle Room", "ad2020", "pod", "turtle_room")
dw $000B ; Screen ID
dw $1678, $00D8 ; Link Coords
dw $0010, $1600 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $01 ; Item
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
%preset_UW("Helma", "ad2020", "pod", "helma")
dw $006A ; Screen ID
dw $1578, $0C24 ; Link Coords
dw $0C00, $1500 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
; HYRULE CASTLE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_ad2020_escape:
%menu_header("Hyrule Castle", 8)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside PoD", "ad2020", "escape", "outside_pod")
dw $005E ; Screen ID
dw $0F50, $063B ; Link Coords
dw $0600, $0ED6 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $04 ; Item
db $00 ; Link direction
;-----------------------------
dw $0F5B, $066D ; Scroll X, Y
dw $005A ; Unknown 1
dw $0000 ; Unknown 2
dw $FFFA ; Unknown 3
;-----------------------------
%write8($7E02A1, $0B) ; Arc variable
%write8($7E0B08, $08) ; Arc variable
%write8($7E0B0C, $8E) ; Arc variable
%write_7F()
%write8($7FE103, $52) ; Overworld $C1 persistent: UNKNOWN
%write8($7FE06E, $52) ; Overworld $77 persistent: Black Ice Cave
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("River Clip", "ad2020", "escape", "sanc_1")
dw $0012 ; Screen ID
dw $04F8, $03BE ; Link Coords
dw $0310, $0480 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $04 ; Item
db $02 ; Link direction
;-----------------------------
db $26 ; Entrance
db $C2 ; Room layout
db $04 ; Main GFX
db $14 ; Music
db $00 ; Floor
db $00 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0004) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "ad2020", "escape", "entrance")
dw $001B ; Screen ID
dw $08C8, $062F ; Link Coords
dw $051E, $0656 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
db $02 ; Link direction
;-----------------------------
dw $08D3, $058B ; Scroll X, Y
dw $088A ; Unknown 1
dw $0000 ; Unknown 2
dw $FFFA ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FE0EF, $41) ; Overworld $B7 persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("1st Key Guard", "ad2020", "escape", "1st_keyguard")
dw $0001 ; Screen ID
dw $02F8, $0054 ; Link Coords
dw $0000, $0280 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
db $00 ; Link direction
;-----------------------------
db $02 ; Entrance
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
%preset_UW("Not So Stealth Room", "ad2020", "escape", "stealth_room")
dw $0082 ; Screen ID
dw $0410, $1180 ; Link Coords
dw $1110, $0400 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $04 ; Item
db $00 ; Link direction
;-----------------------------
db $05 ; Entrance
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
%preset_UW("2nd Key Guard", "ad2020", "escape", "2nd_keyguard")
dw $0071 ; Screen ID
dw $02C0, $0F78 ; Link Coords
dw $0F0B, $0200 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $04 ; Item
db $04 ; Link direction
;-----------------------------
db $05 ; Entrance
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
%write16($7FE082, $0001) ; Room $81 persistent: Hyrule Castle
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Zelda's Cell", "ad2020", "escape", "zeldas_cell")
dw $0070 ; Screen ID
dw $0050, $0E23 ; Link Coords
dw $0E00, $0000 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $04 ; Item
db $06 ; Link direction
;-----------------------------
db $05 ; Entrance
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
%preset_UW("Sanctuary", "ad2020", "escape", "sanc_2")
dw $0012 ; Screen ID
dw $04F8, $03BE ; Link Coords
dw $0310, $0480 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $04 ; Item
db $00 ; Link direction
;-----------------------------
db $05 ; Entrance
db $C2 ; Room layout
db $04 ; Main GFX
db $14 ; Music
db $00 ; Floor
db $00 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0004) ; Overworld Door
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
dw $1D10, $0800 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $02 ; Entrance
db $42 ; Room layout
db $14 ; Main GFX
db $12 ; Music
db $00 ; Floor
db $FF ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0014) ; Overworld Door
%write16($7E0542, $0A70) ; Object tilemap state
%write16($7E0540, $0920) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Hera Entrance", "ad2020", "hook", "entrance")
dw $0003 ; Screen ID
dw $0900, $0478 ; Link Coords
dw $031E, $088A ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
db $02 ; Link direction
;-----------------------------
dw $0909, $038D ; Scroll X, Y
dw $1854 ; Unknown 1
dw $0000 ; Unknown 2
dw $0006 ; Unknown 3
;-----------------------------
%write8($7E0B3F, $00) ; Arc variable
%write_7F()
%write8($7FDFCB, $F3) ; Overworld $25 persistent: Octorok Area
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Hera to Sewers Clip", "ad2020", "hook", "hera_to_sewers_clip")
dw $0077 ; Screen ID
dw $0F68, $0F4D ; Link Coords
dw $0EE1, $0EF0 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
db $06 ; Link direction
;-----------------------------
db $30 ; Entrance
db $C3 ; Room layout
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
%preset_UW("Tile room", "ad2020", "hook", "tile_room")
dw $0077 ; Screen ID
dw $0E78, $0E3C ; Link Coords
dw $0E00, $0E00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
db $00 ; Link direction
;-----------------------------
db $33 ; Entrance
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
%preset_UW("Mini Moldorm Switch", "ad2020", "hook", "minimoldorm_switch")
dw $0087 ; Screen ID
dw $0ED4, $1078 ; Link Coords
dw $100C, $0E00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%preset_UW("Torches", "ad2020", "hook", "torches")
dw $0087 ; Screen ID
dw $0F78, $10D9 ; Link Coords
dw $1010, $0F00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%write8($7E0468, $01) ; Trap door state
%write16_enable()
%write16($7E0696, $0005) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Beetles", "ad2020", "hook", "beetles")
dw $0077 ; Screen ID
dw $0F68, $0F4C ; Link Coords
dw $0EE0, $0EF0 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
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
%write8($7E02A1, $00) ; Arc variable
%write8($7E03C4, $0A) ; Ancilla Search Index
%write16_enable()
%write16($7E0696, $0005) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Petting Zoo", "ad2020", "hook", "petting_zoo")
dw $0031 ; Screen ID
dw $03B8, $0674 ; Link Coords
dw $0607, $0300 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%preset_UW("Fake Clippers", "ad2020", "hook", "fake_clippers")
dw $0037 ; Screen ID
dw $0E80, $0630 ; Link Coords
dw $0600, $0E08 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $33 ; Entrance
db $80 ; Room layout
db $05 ; Main GFX
db $11 ; Music
db $03 ; Floor
db $14 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write8($7E029F, $11) ; Arc variable
%write16_enable()
%write16($7E0696, $0005) ; Overworld Door
%write16($7E0542, $0520) ; Object tilemap state
%write16($7E0546, $1430) ; Object tilemap state
%write16($7E0540, $0420) ; Object tilemap state
%write16($7E0544, $0620) ; Object tilemap state
%write16($7E0548, $063C) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FDFCE, $0008) ; Room $27 persistent: Tower of Hera (Big Chest)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Hookshot", "ad2020", "hook", "hookshot")
dw $0037 ; Screen ID
dw $0E1A, $0778 ; Link Coords
dw $070B, $0E00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $04 ; Item
db $04 ; Link direction
;-----------------------------
db $33 ; Entrance
db $82 ; Room layout
db $05 ; Main GFX
db $11 ; Music
db $03 ; Floor
db $14 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write8($7E029F, $00) ; Arc variable
%write8($7E03C4, $00) ; Ancilla Search Index
%write16_enable()
%write16($7E0696, $0005) ; Overworld Door
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
dw $0017, $087C ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
db $04 ; Link direction
;-----------------------------
dw $08FB, $0086 ; Scroll X, Y
dw $0050 ; Unknown 1
dw $0007 ; Unknown 2
dw $FFF4 ; Unknown 3
;-----------------------------
%write8($7E0B0C, $A0) ; Arc variable
%write_7F()
%write8($7FDFCB, $F3) ; Overworld $25 persistent: Octorok Area
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("DMD", "ad2020", "thieves", "dmd")
dw $0043 ; Screen ID
dw $0902, $0164 ; Link Coords
dw $0101, $088C ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $14 ; Item
db $02 ; Link direction
;-----------------------------
dw $090B, $0170 ; Scroll X, Y
dw $0754 ; Unknown 1
dw $FFFD ; Unknown 2
dw $0004 ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "ad2020", "thieves", "entrance")
dw $0058 ; Screen ID
dw $01F8, $07C0 ; Link Coords
dw $0762, $017A ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $14 ; Item
db $04 ; Link direction
;-----------------------------
dw $01FF, $07CF ; Scroll X, Y
dw $0BB0 ; Unknown 1
dw $000E ; Unknown 2
dw $0006 ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FE0E3, $13) ; Overworld $B1 persistent: UNKNOWN
%write8($7FE148, $26) ; Overworld $E4 persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("After Big Key", "ad2020", "thieves", "after_big_key")
dw $00DB ; Screen ID
dw $17D5, $1B68 ; Link Coords
dw $1AF9, $1700 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $33 ; Entrance
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
%preset_UW("Stalfos Hallway", "ad2020", "thieves", "blind_hallway")
dw $00CC ; Screen ID
dw $1978, $1824 ; Link Coords
dw $1800, $1900 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $14 ; Item
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
%preset_UW("Conveyor Gibos", "ad2020", "thieves", "conveyor_gibos")
dw $00BC ; Screen ID
dw $1819, $1778 ; Link Coords
dw $170B, $1800 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $14 ; Item
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
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Hellway", "ad2020", "thieves", "hellway")
dw $00BB ; Screen ID
dw $171A, $1778 ; Link Coords
dw $170B, $1700 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $14 ; Item
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
%write8($7E0ABD, $01) ; Palette swap
%write16_enable()
%write16($7E0696, $000A) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Bombable Floor", "ad2020", "thieves", "bombable_floor")
dw $0065 ; Screen ID
dw $0AD8, $0D78 ; Link Coords
dw $0D0B, $0A00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $14 ; Item
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
%write8($7E0ABD, $00) ; Palette swap
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
%preset_UW("Backtracking", "ad2020", "thieves", "backtracking_1")
dw $0064 ; Screen ID
dw $0878, $0D24 ; Link Coords
dw $0D00, $0800 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $14 ; Item
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
%preset_UW("Basement", "ad2020", "thieves", "basement")
dw $00BC ; Screen ID
dw $1878, $1623 ; Link Coords
dw $1600, $1800 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%preset_UW("Prison", "ad2020", "thieves", "prison")
dw $0045 ; Screen ID
dw $0AD9, $0978 ; Link Coords
dw $090B, $0A00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%write8($7E029F, $0B) ; Arc variable
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
%write16($7FE00A, $000E) ; Room $45 persistent: Thieves Town (Jail Cells Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mitts", "ad2020", "thieves", "mitts")
dw $0044 ; Screen ID
dw $0918, $0978 ; Link Coords
dw $090B, $0900 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Backtracking", "ad2020", "thieves", "backtracking_2")
dw $0044 ; Screen ID
dw $08D8, $0978 ; Link Coords
dw $090B, $0800 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%write8($7E0B3F, $01) ; Arc variable
%write16_enable()
%write16($7E0696, $000A) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pot Hammerdash", "ad2020", "thieves", "pot_hammerdash")
dw $0045 ; Screen ID
dw $0A78, $0824 ; Link Coords
dw $0800, $0A00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%write16($7E0468, $0000) ; Trap door state
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
%preset_UW("Blind", "ad2020", "thieves", "blind")
dw $00BC ; Screen ID
dw $1978, $1625 ; Link Coords
dw $1600, $1900 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%write8($7E0468, $01) ; Trap door state
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
presetmenu_ad2020_skull:
%menu_header("Skull Woods", 12)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Thieves", "ad2020", "skull", "outside_thieves")
dw $0058 ; Screen ID
dw $01F8, $07BB ; Link Coords
dw $075D, $0176 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $04 ; Item
db $00 ; Link direction
;-----------------------------
dw $0203, $07CA ; Scroll X, Y
dw $0B2E ; Unknown 1
dw $0003 ; Unknown 2
dw $FFFA ; Unknown 3
;-----------------------------
%write8($7E02A1, $0E) ; Arc variable
%write_7F()
%write8($7FE0E3, $13) ; Overworld $B1 persistent: UNKNOWN
%write8($7FE148, $26) ; Overworld $E4 persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Frogdor", "ad2020", "skull", "frogdor")
dw $0058 ; Screen ID
dw $0350, $09E1 ; Link Coords
dw $091E, $02CE ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $04 ; Item
db $02 ; Link direction
;-----------------------------
dw $035B, $098B ; Scroll X, Y
dw $1858 ; Unknown 1
dw $0000 ; Unknown 2
dw $FFF2 ; Unknown 3
;-----------------------------
%write8($7E029F, $16) ; Arc variable
%write16_enable()
%write16($7E0540, $1B6C) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Getting Tempered", "ad2020", "skull", "getting_tempered")
dw $0058 ; Screen ID
dw $03E4, $0918 ; Link Coords
dw $08B4, $0300 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $14 ; Item
db $02 ; Link direction
;-----------------------------
dw $038D, $0923 ; Scroll X, Y
dw $1560 ; Unknown 1
dw $000A ; Unknown 2
dw $0000 ; Unknown 3
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
%preset_OW("Fencedash", "ad2020", "skull", "fencedash")
dw $0062 ; Screen ID
dw $040C, $090F ; Link Coords
dw $08AF, $0400 ; Camera VH
db $70, $02, $70, $0A ; Mirror portal
db $14 ; Item
db $06 ; Link direction
;-----------------------------
dw $047D, $091E ; Scroll X, Y
dw $0480 ; Unknown 1
dw $FFFF ; Unknown 2
dw $0000 ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FDFDD, $B5) ; Overworld $2E persistent: South of Eastern Palace
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Dash to Skull Woods", "ad2020", "skull", "dash_to_sw")
dw $0058 ; Screen ID
dw $0348, $0608 ; Link Coords
dw $0600, $02CA ; Camera VH
db $10, $04, $15, $09 ; Mirror portal
db $14 ; Item
db $04 ; Link direction
;-----------------------------
dw $034F, $066F ; Scroll X, Y
dw $005A ; Unknown 1
dw $0000 ; Unknown 2
dw $0006 ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FE0E3, $13) ; Overworld $B1 persistent: UNKNOWN
%write8($7FE148, $26) ; Overworld $E4 persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Mummy Room", "ad2020", "skull", "mummy_room")
dw $0040 ; Screen ID
dw $0248, $024D ; Link Coords
dw $01ED, $01CA ; Camera VH
db $10, $04, $15, $09 ; Mirror portal
db $14 ; Item
db $00 ; Link direction
;-----------------------------
dw $024F, $025C ; Scroll X, Y
dw $0EBA ; Unknown 1
dw $0001 ; Unknown 2
dw $0006 ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FE0FA, $23) ; Overworld $BD persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Bomb Jump", "ad2020", "skull", "bomb_jump")
dw $0040 ; Screen ID
dw $02E8, $025D ; Link Coords
dw $01FF, $0266 ; Camera VH
db $10, $04, $15, $09 ; Mirror portal
db $14 ; Item
db $00 ; Link direction
;-----------------------------
dw $02F3, $026C ; Scroll X, Y
dw $0F4E ; Unknown 1
dw $0001 ; Unknown 2
dw $000A ; Unknown 3
;-----------------------------
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
%preset_UW("Key Pot", "ad2020", "skull", "key_pot")
dw $0056 ; Screen ID
dw $0D18, $0B78 ; Link Coords
dw $0B0C, $0D00 ; Camera VH
db $10, $04, $15, $09 ; Mirror portal
db $14 ; Item
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
%preset_OW("Skull Entrance", "ad2020", "skull", "skull_entrance")
dw $0040 ; Screen ID
dw $0098, $00D0 ; Link Coords
dw $006E, $0012 ; Camera VH
db $10, $04, $15, $09 ; Mirror portal
db $01 ; Item
db $04 ; Link direction
;-----------------------------
dw $009F, $00DB ; Scroll X, Y
dw $0282 ; Unknown 1
dw $0002 ; Unknown 2
dw $FFFE ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FE0FA, $23) ; Overworld $BD persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mummy Hellway", "ad2020", "skull", "mummy_hellway")
dw $0049 ; Screen ID
dw $12D7, $0978 ; Link Coords
dw $090B, $1200 ; Camera VH
db $10, $04, $15, $09 ; Mirror portal
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
%preset_UW("Mummy Key", "ad2020", "skull", "mummy_key")
dw $0049 ; Screen ID
dw $1278, $0824 ; Link Coords
dw $0800, $1200 ; Camera VH
db $10, $04, $15, $09 ; Mirror portal
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
%preset_UW("Mothula", "ad2020", "skull", "mothula")
dw $0039 ; Screen ID
dw $12D5, $0778 ; Link Coords
dw $070B, $1200 ; Camera VH
db $10, $04, $15, $09 ; Mirror portal
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
; TOWER OF HERA
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_ad2020_hera:
%menu_header("Tower of Hera", 4)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Skull", "ad2020", "hera", "outside_skull")
dw $0040 ; Screen ID
dw $0098, $00CB ; Link Coords
dw $0069, $0016 ; Camera VH
db $10, $04, $15, $09 ; Mirror portal
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
%preset_UW("Old Man Cave", "ad2020", "hera", "old_man_cave")
dw $00E4 ; Screen ID
dw $0878, $1D98 ; Link Coords
dw $1D10, $0800 ; Camera VH
db $10, $04, $15, $09 ; Mirror portal
db $05 ; Item
db $02 ; Link direction
;-----------------------------
db $2B ; Entrance
db $42 ; Room layout
db $14 ; Main GFX
db $12 ; Music
db $00 ; Floor
db $FF ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0014) ; Overworld Door
%write16($7E0542, $0A70) ; Object tilemap state
%write16($7E0540, $0920) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "ad2020", "hera", "entrance")
dw $0003 ; Screen ID
dw $0900, $0478 ; Link Coords
dw $031E, $0889 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
db $02 ; Link direction
;-----------------------------
dw $0908, $038D ; Scroll X, Y
dw $1854 ; Unknown 1
dw $0000 ; Unknown 2
dw $0007 ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FDFCB, $F3) ; Overworld $25 persistent: Octorok Area
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Moldorm", "ad2020", "hera", "moldorm")
dw $0017 ; Screen ID
dw $0FA8, $0274 ; Link Coords
dw $0208, $0F00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
db $06 ; Link direction
;-----------------------------
db $30 ; Entrance
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
%write16($7FE06E, $0001) ; Room $77 persistent: Tower of Hera (Entrance Room)
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
dw $0017, $087C ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $0E ; Item
db $00 ; Link direction
;-----------------------------
dw $08FB, $0086 ; Scroll X, Y
dw $0050 ; Unknown 1
dw $0007 ; Unknown 2
dw $FFF4 ; Unknown 3
;-----------------------------
%write8($7E02A1, $17) ; Arc variable
%write_7F()
%write8($7FDFCB, $F3) ; Overworld $25 persistent: Octorok Area
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Swamp DMD", "ad2020", "mire", "swamp_dmd")
dw $0043 ; Screen ID
dw $0902, $0567 ; Link Coords
dw $031E, $088C ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $0E ; Item
db $02 ; Link direction
;-----------------------------
dw $090B, $038D ; Scroll X, Y
dw $1854 ; Unknown 1
dw $0000 ; Unknown 2
dw $0004 ; Unknown 3
;-----------------------------
%write8($7E02A2, $12) ; Arc variable
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Swamp of Evil", "ad2020", "mire", "overworld")
dw $007A ; Screen ID
dw $040A, $0FF0 ; Link Coords
dw $031E, $0400 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $0E ; Item
db $04 ; Link direction
;-----------------------------
dw $0485, $038D ; Scroll X, Y
dw $0800 ; Unknown 1
dw $0000 ; Unknown 2
dw $0000 ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FDFF6, $12) ; Overworld $3B persistent: Great Swamp South
%write8($7FE116, $23) ; Overworld $CB persistent: UNKNOWN
%write8($7FE134, $23) ; Overworld $DA persistent: UNKNOWN
%write8($7FE136, $23) ; Overworld $DB persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "ad2020", "mire", "entrance")
dw $0070 ; Screen ID
dw $0127, $0CE9 ; Link Coords
dw $06E8, $00AD ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $0E ; Item
db $04 ; Link direction
;-----------------------------
dw $0132, $0757 ; Scroll X, Y
dw $1814 ; Unknown 1
dw $FFF6 ; Unknown 2
dw $FFF3 ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mire 2", "ad2020", "mire", "mire2")
dw $0098 ; Screen ID
dw $1188, $1326 ; Link Coords
dw $1300, $1100 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $10 ; Item
db $00 ; Link direction
;-----------------------------
db $33 ; Entrance
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
%preset_UW("Main Hub", "ad2020", "mire", "main_hub")
dw $00D2 ; Screen ID
dw $0578, $1A25 ; Link Coords
dw $1A00, $0500 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%preset_UW("Beat the Fireball", "ad2020", "mire", "beat_the_fireball")
dw $00B2 ; Screen ID
dw $0578, $17D9 ; Link Coords
dw $1710, $0500 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%write16($7E0468, $0001) ; Trap door state
%write16($7E0540, $2830) ; Object tilemap state
%write16($7E0544, $2A30) ; Object tilemap state
%write16($7E0548, $294C) ; Object tilemap state
%write16($7E054C, $175E) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Bari Key", "ad2020", "mire", "bari_key")
dw $00C2 ; Screen ID
dw $0419, $1978 ; Link Coords
dw $190B, $0400 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%write16_enable()
%write16($7E0696, $000C) ; Overworld Door
%write16($7E0542, $3044) ; Object tilemap state
%write16($7E0546, $07B4) ; Object tilemap state
%write16($7E0540, $2E64) ; Object tilemap state
%write16($7E0544, $3440) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Sluggulas", "ad2020", "mire", "sluggulas")
dw $00C1 ; Screen ID
dw $0278, $19D9 ; Link Coords
dw $1910, $0200 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%preset_UW("Torches", "ad2020", "mire", "torches")
dw $00D1 ; Screen ID
dw $02A8, $1A26 ; Link Coords
dw $1A00, $0200 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%preset_UW("Spark Gamble", "ad2020", "mire", "spark_gamble")
dw $00C1 ; Screen ID
dw $03D7, $1878 ; Link Coords
dw $180B, $0300 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%preset_UW("Big Chest Room", "ad2020", "mire", "big_chest_room")
dw $00C3 ; Screen ID
dw $06D8, $1978 ; Link Coords
dw $190B, $0600 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%preset_UW("Spike Key", "ad2020", "mire", "spike_key")
dw $00C3 ; Screen ID
dw $0678, $1824 ; Link Coords
dw $1800, $0600 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $05 ; Item
db $06 ; Link direction
;-----------------------------
db $27 ; Entrance
db $40 ; Room layout
db $0C ; Main GFX
db $16 ; Music
db $FF ; Floor
db $0E ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write8($7E0B3F, $01) ; Arc variable
%write16_enable()
%write16($7E0696, $000C) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Wizzrobe", "ad2020", "mire", "wizzrobe")
dw $00B3 ; Screen ID
dw $0630, $1678 ; Link Coords
dw $160B, $0600 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $0E ; Item
db $00 ; Link direction
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
%write16_enable()
%write16($7E0696, $000C) ; Overworld Door
%write16($7E0542, $1430) ; Object tilemap state
%write16($7E0540, $140C) ; Object tilemap state
%write16($7E0544, $1C30) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Bridge Room", "ad2020", "mire", "bridge_room")
dw $00B2 ; Screen ID
dw $04F8, $1625 ; Link Coords
dw $1600, $0480 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $0E ; Item
db $04 ; Link direction
;-----------------------------
db $27 ; Entrance
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
%write16($7E0542, $2930) ; Object tilemap state
%write16($7E0546, $284C) ; Object tilemap state
%write16($7E054A, $2A4C) ; Object tilemap state
%write16($7E0540, $2830) ; Object tilemap state
%write16($7E0544, $2A30) ; Object tilemap state
%write16($7E0548, $294C) ; Object tilemap state
%write16($7E054C, $175E) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FE0E4, $0001) ; Room $B2 persistent: Misery Mire (Slug Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Canedash", "ad2020", "mire", "canedash")
dw $0093 ; Screen ID
dw $061B, $1378 ; Link Coords
dw $130B, $0600 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $0E ; Item
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
%write8($7E02A1, $00) ; Arc variable
%write8($7E02A2, $FF) ; Arc variable
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
%preset_UW("Spooky Action", "ad2020", "mire", "spooky_action")
dw $0092 ; Screen ID
dw $0519, $1378 ; Link Coords
dw $130B, $0500 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%write8($7E0B3F, $00) ; Arc variable
%write16_enable()
%write16($7E0696, $000C) ; Overworld Door
%write16($7E0542, $175C) ; Object tilemap state
%write16($7E0546, $1768) ; Object tilemap state
%write16($7E0540, $1756) ; Object tilemap state
%write16($7E0544, $1762) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Vitreous", "ad2020", "mire", "vitty")
dw $00A0 ; Screen ID
dw $0078, $1425 ; Link Coords
dw $1400, $0000 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
; DESERT PALACE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_ad2020_desert:
%menu_header("Desert Palace", 8)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Mire", "ad2020", "desert", "outside_mire")
dw $0070 ; Screen ID
dw $0128, $0CDA ; Link Coords
dw $0C7C, $00A6 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $05 ; Item
db $00 ; Link direction
;-----------------------------
dw $0133, $0CE9 ; Scroll X, Y
dw $0414 ; Unknown 1
dw $0004 ; Unknown 2
dw $FFFA ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "ad2020", "desert", "entrance")
dw $0030 ; Screen ID
dw $0088, $0CB2 ; Link Coords
dw $0C50, $0006 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
db $02 ; Link direction
;-----------------------------
dw $0093, $0CBD ; Scroll X, Y
dw $0280 ; Unknown 1
dw $0000 ; Unknown 2
dw $FFFA ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Torch Key", "ad2020", "desert", "torch_key")
dw $0073 ; Screen ID
dw $0778, $0F24 ; Link Coords
dw $0F00, $0700 ; Camera VH
db $75, $00, $13, $0D ; Mirror portal
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $27 ; Entrance
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
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pre Cannonball Room", "ad2020", "desert", "pre_cannonball_room")
dw $0085 ; Screen ID
dw $0AD6, $1078 ; Link Coords
dw $100B, $0A00 ; Camera VH
db $75, $00, $13, $0D ; Mirror portal
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $0B ; Entrance
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
%preset_UW("Desert 2 Spinspeed", "ad2020", "desert", "desert2_spinspeed")
dw $0083 ; Screen ID
dw $0678, $11D9 ; Link Coords
dw $1110, $0600 ; Camera VH
db $75, $00, $13, $0D ; Mirror portal
db $14 ; Item
db $06 ; Link direction
;-----------------------------
db $0B ; Entrance
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
%preset_UW("Popo Genocide", "ad2020", "desert", "popo_genocide_room")
dw $0053 ; Screen ID
dw $0678, $0AD8 ; Link Coords
dw $0A10, $0600 ; Camera VH
db $75, $00, $13, $0D ; Mirror portal
db $14 ; Item
db $02 ; Link direction
;-----------------------------
db $0B ; Entrance
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
%preset_UW("Torches", "ad2020", "desert", "torches")
dw $0043 ; Screen ID
dw $0778, $0925 ; Link Coords
dw $0900, $0700 ; Camera VH
db $75, $00, $13, $0D ; Mirror portal
db $05 ; Item
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
%preset_UW("Lanmolas", "ad2020", "desert", "lanmolas")
dw $0043 ; Screen ID
dw $0678, $0825 ; Link Coords
dw $0800, $0600 ; Camera VH
db $75, $00, $13, $0D ; Mirror portal
db $05 ; Item
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
%write16_enable()
%write16($7E0696, $0012) ; Overworld Door
%write16($7E0552, $83B6) ; Object tilemap state
%write16($7E0556, $89B6) ; Object tilemap state
%write16($7E0550, $83AA) ; Object tilemap state
%write16($7E0554, $89AA) ; Object tilemap state
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; TURTLE ROCK
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_ad2020_trock:
%menu_header("Turtle Rock", 9)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Desert", "ad2020", "trock", "outside_desert")
dw $0030 ; Screen ID
dw $0128, $0C3B ; Link Coords
dw $0C00, $00A2 ; Camera VH
db $75, $00, $13, $0D ; Mirror portal
db $05 ; Item
db $00 ; Link direction
;-----------------------------
dw $012F, $0C6D ; Scroll X, Y
dw $0016 ; Unknown 1
dw $0000 ; Unknown 2
dw $000E ; Unknown 3
;-----------------------------
%write8($7E02A1, $17) ; Arc variable
%write16_enable()
%write16($7E0468, $0000) ; Trap door state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Old Man Cave", "ad2020", "trock", "old_man_cave")
dw $00E4 ; Screen ID
dw $0878, $1D98 ; Link Coords
dw $1D10, $0800 ; Camera VH
db $75, $00, $13, $0D ; Mirror portal
db $05 ; Item
db $02 ; Link direction
;-----------------------------
db $0C ; Entrance
db $42 ; Room layout
db $14 ; Main GFX
db $12 ; Music
db $00 ; Floor
db $FF ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write8($7E029F, $03) ; Arc variable
%write16_enable()
%write16($7E0696, $0014) ; Overworld Door
%write16($7E0542, $0A70) ; Object tilemap state
%write16($7E0468, $0001) ; Trap door state
%write16($7E0540, $0920) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("TR Climb", "ad2020", "trock", "tr_climb")
dw $0043 ; Screen ID
dw $0902, $0168 ; Link Coords
dw $0105, $088C ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
db $02 ; Link direction
;-----------------------------
dw $090B, $0174 ; Scroll X, Y
dw $0754 ; Unknown 1
dw $FFF9 ; Unknown 2
dw $0004 ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Laser Entrance", "ad2020", "trock", "laser_entrance")
dw $0045 ; Screen ID
dw $0D18, $01CD ; Link Coords
dw $0169, $0DFE ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
db $04 ; Link direction
;-----------------------------
dw $0D7B, $01D8 ; Scroll X, Y
dw $0B60 ; Unknown 1
dw $0005 ; Unknown 2
dw $0002 ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FE16D, $D1) ; Overworld $F6 persistent: UNKNOWN
%write8($7FE046, $D1) ; Overworld $63 persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Crystal Roller", "ad2020", "trock", "crystal_roller")
dw $00B5 ; Screen ID
dw $0A78, $1625 ; Link Coords
dw $1600, $0A00 ; Camera VH
db $07, $0A, $98, $01 ; Mirror portal
db $01 ; Item
db $00 ; Link direction
;-----------------------------
db $33 ; Entrance
db $C0 ; Room layout
db $0D ; Main GFX
db $16 ; Music
db $FE ; Floor
db $18 ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write8($7E029F, $00) ; Arc variable
%write8($7E02A2, $00) ; Arc variable
%write16_enable()
%write16($7E0696, $000D) ; Overworld Door
%write16($7E0542, $104C) ; Object tilemap state
%write16($7E0546, $1070) ; Object tilemap state
%write16($7E054A, $1C70) ; Object tilemap state
%write16($7E0540, $0470) ; Object tilemap state
%write16($7E0544, $0F70) ; Object tilemap state
%write16($7E0548, $1170) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FE10A, $0040) ; Room $C5 persistent: Turtle Rock (Laser Bridge)
%write16($7FE12A, $0010) ; Room $D5 persistent: Turtle Rock (Laser Key Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pokey 1", "ad2020", "trock", "pokey_1")
dw $0014 ; Screen ID
dw $081C, $0278 ; Link Coords
dw $020B, $0800 ; Camera VH
db $07, $0A, $98, $01 ; Mirror portal
db $12 ; Item
db $00 ; Link direction
;-----------------------------
db $18 ; Entrance
db $C0 ; Room layout
db $0D ; Main GFX
db $16 ; Music
db $FF ; Floor
db $18 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write8($7E0B0C, $A0) ; Arc variable
%write16_enable()
%write16($7E0696, $000D) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Laser Entrance 2", "ad2020", "trock", "laser_entrance_2")
dw $00D5 ; Screen ID
dw $0A78, $1BD8 ; Link Coords
dw $1B10, $0A00 ; Camera VH
db $07, $0A, $98, $01 ; Mirror portal
db $14 ; Item
db $04 ; Link direction
;-----------------------------
db $18 ; Entrance
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
%preset_UW("Switch Maze", "ad2020", "trock", "switch_maze")
dw $00C5 ; Screen ID
dw $0A18, $1978 ; Link Coords
dw $190B, $0A00 ; Camera VH
db $07, $0A, $98, $01 ; Mirror portal
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $18 ; Entrance
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
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Trinexx", "ad2020", "trock", "trinexx")
dw $00B4 ; Screen ID
dw $0878, $1624 ; Link Coords
dw $1600, $0800 ; Camera VH
db $07, $0A, $98, $01 ; Mirror portal
db $12 ; Item
db $04 ; Link direction
;-----------------------------
db $18 ; Entrance
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
; SWAMP PALACE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_ad2020_swamp:
%menu_header("Swamp Palace", 12)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Turtle Rock", "ad2020", "swamp", "outside_trock")
dw $0047 ; Screen ID
dw $0F08, $013B ; Link Coords
dw $00DD, $0E96 ; Camera VH
db $07, $0A, $98, $01 ; Mirror portal
db $06 ; Item
db $00 ; Link direction
;-----------------------------
dw $0F13, $014A ; Scroll X, Y
dw $0712 ; Unknown 1
dw $0003 ; Unknown 2
dw $FFFA ; Unknown 3
;-----------------------------
%write8($7E0B09, $80) ; Arc variable
%write8($7E02A1, $0B) ; Arc variable
%write8($7E0B08, $60) ; Arc variable
%write8($7E0B0C, $60) ; Arc variable
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Zora's Domain", "ad2020", "swamp", "zoras_domain")
dw $000F ; Screen ID
dw $0F37, $0208 ; Link Coords
dw $0200, $0EC5 ; Camera VH
db $07, $0A, $98, $01 ; Mirror portal
db $14 ; Item
db $02 ; Link direction
;-----------------------------
dw $0F42, $0275 ; Scroll X, Y
dw $0018 ; Unknown 1
dw $0000 ; Unknown 2
dw $FFFB ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FE05D, $59) ; Overworld $6E persistent: Outside Hedge Maze
%write8($7FDFA6, $38) ; Overworld $13 persistent: Sanctuary
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Link's House", "ad2020", "swamp", "links_house")
dw $0104 ; Screen ID
dw $0978, $2178 ; Link Coords
dw $2110, $0900 ; Camera VH
db $08, $0F, $38, $01 ; Mirror portal
db $14 ; Item
db $06 ; Link direction
;-----------------------------
db $18 ; Entrance
db $02 ; Room layout
db $03 ; Main GFX
db $07 ; Music
db $00 ; Floor
db $FF ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write8($7EC167, $7D) ; Underworld exit cache
%write8($7EC165, $23) ; Underworld exit cache
%write8($7EC166, $51) ; Underworld exit cache
%write16_enable()
%write16($7E0696, $0003) ; Overworld Door
%write16($7E0542, $16CA) ; Object tilemap state
%write16($7EC140, $0081) ; Underworld exit cache
%write16($7EC144, $0000) ; Underworld exit cache
%write16($7EC148, $0000) ; Underworld exit cache
%write16($7EC14C, $0000) ; Underworld exit cache
%write16($7EC150, $007D) ; Underworld exit cache
%write16($7EC154, $0000) ; Underworld exit cache
%write16($7EC158, $0200) ; Underworld exit cache
%write16($7EC15C, $FF20) ; Underworld exit cache
%write16($7EC160, $0300) ; Underworld exit cache
%write16($7EC16C, $0000) ; Underworld exit cache
%write16($7EC170, $0000) ; Underworld exit cache
%write16($7E0540, $15CA) ; Object tilemap state
%write16($7E0544, $17CA) ; Object tilemap state
%write16($7EC142, $0004) ; Underworld exit cache
%write16($7EC146, $0000) ; Underworld exit cache
%write16($7EC14A, $0000) ; Underworld exit cache
%write16($7EC14E, $0000) ; Underworld exit cache
%write16($7EC152, $0583) ; Underworld exit cache
%write16($7EC156, $0320) ; Underworld exit cache
%write16($7EC15A, $0500) ; Underworld exit cache
%write16($7EC15E, $FF20) ; Underworld exit cache
%write16($7EC162, $0300) ; Underworld exit cache
%write16($7EC16A, $0000) ; Underworld exit cache
%write16($7EC16E, $0000) ; Underworld exit cache
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Swamp Overworld", "ad2020", "swamp", "swamp_overworld")
dw $0073 ; Screen ID
dw $07B0, $0DDF ; Link Coords
dw $0D1E, $0700 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
db $02 ; Link direction
;-----------------------------
dw $0785, $0D8B ; Scroll X, Y
dw $08A0 ; Unknown 1
dw $0000 ; Unknown 2
dw $0000 ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FE147, $AB) ; Overworld $E3 persistent: UNKNOWN
%write8($7FE164, $A9) ; Overworld $F2 persistent: UNKNOWN
%write8($7FE059, $13) ; Overworld $6C persistent: Dark Link's House
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Antifairy Room", "ad2020", "swamp", "antifairy_room")
dw $003B ; Screen ID
dw $0778, $0EF0 ; Link Coords
dw $0E89, $06FB ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $04 ; Item
db $02 ; Link direction
;-----------------------------
dw $0780, $0EFE ; Scroll X, Y
dw $04A0 ; Unknown 1
dw $0007 ; Unknown 2
dw $0005 ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FE153, $D3) ; Overworld $E9 persistent: UNKNOWN
%write8($7FE02C, $47) ; Overworld $56 persistent: Dark Witch's Hut
%write8($7FE038, $01) ; Overworld $5C persistent: UNKNOWN
%write8($7FE164, $EC) ; Overworld $F2 persistent: UNKNOWN
%write8($7FE0E3, $48) ; Overworld $B1 persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "ad2020", "swamp", "entrance")
dw $007B ; Screen ID
dw $0778, $0EEF ; Link Coords
dw $0E89, $06FA ; Camera VH
db $7B, $07, $06, $0F ; Mirror portal
db $14 ; Item
db $00 ; Link direction
;-----------------------------
dw $077F, $0EFE ; Scroll X, Y
dw $04A0 ; Unknown 1
dw $0007 ; Unknown 2
dw $0006 ; Unknown 3
;-----------------------------
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
%preset_UW("First Key Pot", "ad2020", "swamp", "first_key_pot")
dw $0028 ; Screen ID
dw $1078, $0426 ; Link Coords
dw $0400, $1000 ; Camera VH
db $7B, $07, $06, $0F ; Mirror portal
db $0E ; Item
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
%preset_UW("Main Hub", "ad2020", "swamp", "main_hub")
dw $0037 ; Screen ID
dw $0E18, $0778 ; Link Coords
dw $070C, $0E00 ; Camera VH
db $7B, $07, $06, $0F ; Mirror portal
db $0E ; Item
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
%preset_UW("Diver Down", "ad2020", "swamp", "diver_down")
dw $0026 ; Screen ID
dw $0DB8, $0524 ; Link Coords
dw $0500, $0D00 ; Camera VH
db $7B, $07, $06, $0F ; Mirror portal
db $0E ; Item
db $04 ; Link direction
;-----------------------------
db $25 ; Entrance
db $83 ; Room layout
db $08 ; Main GFX
db $16 ; Music
db $FF ; Floor
db $0A ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write8($7E0B0C, $A0) ; Arc variable
%write16_enable()
%write16($7E0696, $0008) ; Overworld Door
%write16($7E0542, $041C) ; Object tilemap state
%write16($7E0546, $1A16) ; Object tilemap state
%write16($7E0540, $080C) ; Object tilemap state
%write16($7E0544, $1396) ; Object tilemap state
%write16($7E0548, $1ADC) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FDFEC, $0020) ; Room $36 persistent: Swamp Palace (Big Chest Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Restock Room", "ad2020", "swamp", "restock")
dw $0066 ; Screen ID
dw $0D78, $0D32 ; Link Coords
dw $0D00, $0D00 ; Camera VH
db $7B, $07, $06, $0F ; Mirror portal
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
%write16($7FE04C, $0180) ; Room $66 persistent: Swamp Palace (Hidden Chest / Hidden Door Room)
%write16($7FE06C, $002A) ; Room $76 persistent: Swamp Palace (Water Drain Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Phelps Way", "ad2020", "swamp", "phelps_way")
dw $0016 ; Screen ID
dw $0D78, $02D8 ; Link Coords
dw $0210, $0D00 ; Camera VH
db $7B, $07, $06, $0F ; Mirror portal
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
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Arrghus", "ad2020", "swamp", "arrghus")
dw $0016 ; Screen ID
dw $0C78, $0225 ; Link Coords
dw $0200, $0C00 ; Camera VH
db $7B, $07, $06, $0F ; Mirror portal
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
%write_7F()
%write16_enable()
%write16($7FDFAC, $0004) ; Room $16 persistent: Swamp Palace (Swimming Treadmill)
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
dw $0E8D, $06F2 ; Camera VH
db $7B, $07, $06, $0F ; Mirror portal
db $0E ; Item
db $00 ; Link direction
;-----------------------------
dw $077F, $0EFA ; Scroll X, Y
dw $049E ; Unknown 1
dw $0003 ; Unknown 2
dw $FFFE ; Unknown 3
;-----------------------------
%write8($7E0B09, $84) ; Arc variable
%write8($7E0B39, $2C) ; Arc variable
%write8($7E0B3A, $33) ; Arc variable
%write8($7E02A1, $00) ; Arc variable
%write8($7E0B3B, $39) ; Arc variable
%write8($7E0B08, $D0) ; Arc variable
%write8($7E0B0C, $01) ; Arc variable
%write8($7E0B38, $2C) ; Arc variable
%write8($7E0B3C, $33) ; Arc variable
%write_7F()
%write8($7FE07D, $13) ; Overworld $7E persistent: UNKNOWN
%write8($7FE126, $AB) ; Overworld $D3 persistent: UNKNOWN
%write8($7FE0E2, $AA) ; Overworld $B1 persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "ad2020", "ice", "ice_entrance")
dw $0075 ; Screen ID
dw $0CB8, $0DCC ; Link Coords
dw $0D7F, $0DA4 ; Camera VH
db $7B, $07, $06, $0F ; Mirror portal
db $0E ; Item
db $02 ; Link direction
;-----------------------------
dw $0D21, $0DEC ; Scroll X, Y
dw $0E56 ; Unknown 1
dw $0001 ; Unknown 2
dw $000C ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FDFF9, $42) ; Overworld $3C persistent: Great Swamp SE
%write8($7FDFDA, $D4) ; Overworld $2D persistent: Bridge to Hyrule Castle
%write8($7FE01B, $42) ; Overworld $4D persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Penguin Switch Room", "ad2020", "ice", "penguin_switch_room")
dw $001E ; Screen ID
dw $1DD8, $0378 ; Link Coords
dw $030B, $1D00 ; Camera VH
db $07, $0A, $42, $0E ; Mirror portal
db $14 ; Item
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
%write8($7E0468, $00) ; Trap door state
%write8($7E02A2, $22) ; Arc variable
%write16_enable()
%write16($7E0696, $000B) ; Overworld Door
%write16($7E0542, $0760) ; Object tilemap state
%write16($7E0546, $0860) ; Object tilemap state
%write16($7E054A, $595E) ; Object tilemap state
%write16($7E0540, $075C) ; Object tilemap state
%write16($7E0544, $085C) ; Object tilemap state
%write16($7E0548, $0954) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Break the Ice", "ad2020", "ice", "get_ready_to_break_the_ice")
dw $001F ; Screen ID
dw $1ED4, $0378 ; Link Coords
dw $030B, $1E00 ; Camera VH
db $07, $0A, $42, $0E ; Mirror portal
db $12 ; Item
db $06 ; Link direction
;-----------------------------
db $2D ; Entrance
db $02 ; Room layout
db $0B ; Main GFX
db $16 ; Music
db $00 ; Floor
db $12 ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $000B) ; Overworld Door
%write16($7E0542, $191C) ; Object tilemap state
%write16($7E0546, $1B56) ; Object tilemap state
%write16($7E054A, $5A52) ; Object tilemap state
%write16($7E0540, $171C) ; Object tilemap state
%write16($7E0544, $1A56) ; Object tilemap state
%write16($7E0548, $5B52) ; Object tilemap state
%write_7F()
%write16_enable()
%write16($7FDFBE, $0030) ; Room $1F persistent: Ice Palace (Pengator / Big Key Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spike Key", "ad2020", "ice", "spike_key")
dw $003F ; Screen ID
dw $1EB0, $0725 ; Link Coords
dw $0700, $1E00 ; Camera VH
db $07, $0A, $42, $0E ; Mirror portal
db $12 ; Item
db $06 ; Link direction
;-----------------------------
db $2D ; Entrance
db $02 ; Room layout
db $0B ; Main GFX
db $16 ; Music
db $FF ; Floor
db $12 ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write8($7E0468, $01) ; Trap door state
%write8($7E02A2, $00) ; Arc variable
%write16_enable()
%write16($7E0696, $000B) ; Overworld Door
%write16($7E0542, $1A0C) ; Object tilemap state
%write16($7E0546, $1914) ; Object tilemap state
%write16($7E054A, $1B14) ; Object tilemap state
%write16($7E054E, $1818) ; Object tilemap state
%write16($7E0552, $1824) ; Object tilemap state
%write16($7E0556, $1720) ; Object tilemap state
%write16($7E055A, $1820) ; Object tilemap state
%write16($7E0540, $190C) ; Object tilemap state
%write16($7E0544, $1B0C) ; Object tilemap state
%write16($7E0548, $1A14) ; Object tilemap state
%write16($7E054C, $1718) ; Object tilemap state
%write16($7E0550, $1724) ; Object tilemap state
%write16($7E0554, $171C) ; Object tilemap state
%write16($7E0558, $181C) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Lonely Firebar", "ad2020", "ice", "lonely_firebar")
dw $005E ; Screen ID
dw $1D17, $0B78 ; Link Coords
dw $0B0B, $1D00 ; Camera VH
db $07, $0A, $42, $0E ; Mirror portal
db $04 ; Item
db $00 ; Link direction
;-----------------------------
db $2D ; Entrance
db $03 ; Room layout
db $0B ; Main GFX
db $16 ; Music
db $FE ; Floor
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
%write16($7FE03E, $0002) ; Room $5F persistent: Ice Palace (Hidden Chest / Spike Floor Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Last Two Screens", "ad2020", "ice", "last_two_screens")
dw $009E ; Screen ID
dw $1CD6, $1378 ; Link Coords
dw $130B, $1C00 ; Camera VH
db $07, $0A, $42, $0E ; Mirror portal
db $04 ; Item
db $04 ; Link direction
;-----------------------------
db $2D ; Entrance
db $02 ; Room layout
db $0B ; Main GFX
db $16 ; Music
db $FC ; Floor
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
%preset_UW("Kholdstare", "ad2020", "ice", "kholdstare")
dw $00CE ; Screen ID
dw $1D40, $18A9 ; Link Coords
dw $1810, $1D00 ; Camera VH
db $07, $0A, $42, $0E ; Mirror portal
db $04 ; Item
db $06 ; Link direction
;-----------------------------
db $2D ; Entrance
db $01 ; Room layout
db $0B ; Main GFX
db $16 ; Music
db $FB ; Floor
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
; GANON'S TOWER
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_ad2020_gtower:
%menu_header("Ganon's Tower", 21)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Ice", "ad2020", "gtower", "outside_ice")
dw $0075 ; Screen ID
dw $0CB8, $0DCB ; Link Coords
dw $0D6D, $0C3E ; Camera VH
db $07, $0A, $42, $0E ; Mirror portal
db $04 ; Item
db $02 ; Link direction
;-----------------------------
dw $0CC3, $0DDA ; Scroll X, Y
dw $0BC6 ; Unknown 1
dw $0003 ; Unknown 2
dw $FFF2 ; Unknown 3
;-----------------------------
%write8($7E02A1, $0E) ; Arc variable
%write_7F()
%write8($7FDFF9, $42) ; Overworld $3C persistent: Great Swamp SE
%write8($7FDFDA, $D4) ; Overworld $2D persistent: Bridge to Hyrule Castle
%write8($7FE01B, $42) ; Overworld $4D persistent: UNKNOWN
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Old Man Cave", "ad2020", "gtower", "old_man_cave")
dw $00E4 ; Screen ID
dw $0878, $1D98 ; Link Coords
dw $1D10, $0800 ; Camera VH
db $07, $0A, $42, $0E ; Mirror portal
db $05 ; Item
db $02 ; Link direction
;-----------------------------
db $2D ; Entrance
db $42 ; Room layout
db $14 ; Main GFX
db $12 ; Music
db $00 ; Floor
db $FF ; Palace No
db $00 ; Door
db $00 ; Layer
;-----------------------------
%write16_enable()
%write16($7E0696, $0014) ; Overworld Door
%write16($7E0542, $0A70) ; Object tilemap state
%write16($7E0540, $0920) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "ad2020", "gtower", "entrance")
dw $0043 ; Screen ID
dw $08F8, $083C ; Link Coords
dw $031E, $0883 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
db $02 ; Link direction
;-----------------------------
dw $0902, $038D ; Scroll X, Y
dw $1854 ; Unknown 1
dw $0000 ; Unknown 2
dw $000D ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spike Skip", "ad2020", "gtower", "spike_skip")
dw $008B ; Screen ID
dw $171C, $1078 ; Link Coords
dw $100C, $1700 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $0E ; Item
db $02 ; Link direction
;-----------------------------
db $30 ; Entrance
db $01 ; Room layout
db $0E ; Main GFX
db $16 ; Music
db $00 ; Floor
db $1A ; Palace No
db $02 ; Door
db $00 ; Layer
;-----------------------------
%write8($7E0468, $00) ; Trap door state
%write8($7E0B3B, $00) ; Arc variable
%write8($7E0B0C, $50) ; Arc variable
%write8($7E0B3C, $00) ; Arc variable
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write16($7E0542, $171C) ; Object tilemap state
%write16($7E0546, $0864) ; Object tilemap state
%write16($7E054A, $085C) ; Object tilemap state
%write16($7E054E, $0C4C) ; Object tilemap state
%write16($7E0552, $144C) ; Object tilemap state
%write16($7E0556, $0864) ; Object tilemap state
%write16($7E0544, $1720) ; Object tilemap state
%write16($7E0548, $0760) ; Object tilemap state
%write16($7E054C, $0960) ; Object tilemap state
%write16($7E0550, $0C70) ; Object tilemap state
%write16($7E0554, $1C4C) ; Object tilemap state
%write16($7E0641, $0001) ; Room puzzle state (?)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pre Firesnakes Room", "ad2020", "gtower", "pre_firesnakes_room")
dw $009B ; Screen ID
dw $16D7, $1278 ; Link Coords
dw $120B, $1600 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%write8($7E0641, $00) ; Room puzzle state (?)
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write16($7E0542, $0C30) ; Object tilemap state
%write16($7E0546, $1820) ; Object tilemap state
%write16($7E0468, $0001) ; Trap door state
%write16($7E0540, $0430) ; Object tilemap state
%write16($7E0544, $181C) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Bombable Floor", "ad2020", "gtower", "bombable_floor")
dw $009C ; Screen ID
dw $1978, $1225 ; Link Coords
dw $1200, $1900 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%write16($7FE0B8, $0032) ; Room $9C persistent: Ganon's Tower (Invisible Floor Maze Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Floor 2", "ad2020", "gtower", "floor_2")
dw $000C ; Screen ID
dw $18F8, $0025 ; Link Coords
dw $0000, $1880 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $01 ; Item
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
%write8($7E0B09, $00) ; Arc variable
%write8($7E0B08, $40) ; Arc variable
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mimics 1", "ad2020", "gtower", "mimics1")
dw $006B ; Screen ID
dw $1678, $0CD9 ; Link Coords
dw $0C10, $1600 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
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
%write16($7E0550, $050C) ; Object tilemap state
%write16($7E0641, $0001) ; Room puzzle state (?)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mimics 2", "ad2020", "gtower", "mimics2")
dw $006B ; Screen ID
dw $16D8, $0D78 ; Link Coords
dw $0D0B, $1600 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%write8($7E0641, $00) ; Room puzzle state (?)
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write_7F()
%write16_enable()
%write16($7FE056, $0240) ; Room $6B persistent: Ganon's Tower (Mimics Rooms)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spike Pit", "ad2020", "gtower", "spike_room")
dw $006B ; Screen ID
dw $1778, $0C24 ; Link Coords
dw $0C00, $1700 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%write8($7E0468, $01) ; Trap door state
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write_7F()
%write16_enable()
%write16($7FE056, $2640) ; Room $6B persistent: Ganon's Tower (Mimics Rooms)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Gauntlet 1", "ad2020", "gtower", "gauntlet")
dw $005C ; Screen ID
dw $1978, $0A24 ; Link Coords
dw $0A00, $1900 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%write_7F()
%write16_enable()
%write16($7FE036, $0008) ; Room $5B persistent: Ganon's Tower (Spike Pit Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Gauntlet 3", "ad2020", "gtower", "gauntlet_3")
dw $005D ; Screen ID
dw $1A78, $0ADA ; Link Coords
dw $0A10, $1A00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%preset_UW("Lanmola 2", "ad2020", "gtower", "lanmola2")
dw $006D ; Screen ID
dw $1A18, $0D78 ; Link Coords
dw $0D0B, $1A00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%preset_UW("Wizzrobes 1", "ad2020", "gtower", "wizz1")
dw $006C ; Screen ID
dw $1878, $0C23 ; Link Coords
dw $0C00, $1800 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%write8($7E0468, $01) ; Trap door state
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write16($7E0542, $0628) ; Object tilemap state
%write16($7E0546, $0A28) ; Object tilemap state
%write16($7E0540, $0614) ; Object tilemap state
%write16($7E0544, $0A14) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Wizzrobes 2", "ad2020", "gtower", "wizz2")
dw $00A5 ; Screen ID
dw $0B78, $1524 ; Link Coords
dw $1500, $0B00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%write16($7FE0CA, $088C) ; Room $A5 persistent: Ganon's Tower (Wizzrobes Rooms)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Torches 1", "ad2020", "gtower", "torches1")
dw $0095 ; Screen ID
dw $0BD4, $1278 ; Link Coords
dw $120B, $0B00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%write8($7E0B3F, $01) ; Arc variable
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write_7F()
%write16_enable()
%write16($7FE0AA, $0004) ; Room $95 persistent: Ganon's Tower (Final Collapsing Bridge Room)
%write16($7FE0CA, $08EF) ; Room $A5 persistent: Ganon's Tower (Wizzrobes Rooms)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Torches 2", "ad2020", "gtower", "torches2")
dw $0096 ; Screen ID
dw $0D78, $13A0 ; Link Coords
dw $1310, $0D00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%preset_UW("Helma Key", "ad2020", "gtower", "helma_key")
dw $003D ; Screen ID
dw $1B78, $0724 ; Link Coords
dw $0700, $1B00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%preset_UW("Bombable Wall", "ad2020", "gtower", "bombable_wall")
dw $003D ; Screen ID
dw $1B1C, $0678 ; Link Coords
dw $060B, $1B00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%write_7F()
%write16_enable()
%write16($7FDFFA, $000C) ; Room $3D persistent: Ganon's Tower (Torch Room 2)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Moldorm 2", "ad2020", "gtower", "moldorm_2")
dw $003D ; Screen ID
dw $1A78, $07D8 ; Link Coords
dw $0710, $1A00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
%preset_UW("Agahnim 2", "ad2020", "gtower", "agahnim_2")
dw $001D ; Screen ID
dw $1A78, $0224 ; Link Coords
dw $0200, $1A00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
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
; AGAHNIM'S TOWER
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_ad2020_aga:
%menu_header("Agahnim's Tower", 8)

;---------------------------------------------------------------------------------------------------
%preset_OW("Pyramid", "ad2020", "aga", "pyramid")
dw $005B ; Screen ID
dw $07F0, $065C ; Link Coords
dw $0600, $0778 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $0E ; Item
db $00 ; Link direction
;-----------------------------
dw $07F7, $066D ; Scroll X, Y
dw $002E ; Unknown 1
dw $0000 ; Unknown 2
dw $FFF8 ; Unknown 3
;-----------------------------
%write8($7E02A2, $FE) ; Arc variable
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Gold Knights", "ad2020", "aga", "gold_knights")
dw $00E0 ; Screen ID
dw $0078, $1D24 ; Link Coords
dw $1D00, $0000 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $0E ; Item
db $02 ; Link direction
;-----------------------------
db $37 ; Entrance
db $02 ; Room layout
db $04 ; Main GFX
db $10 ; Music
db $01 ; Floor
db $08 ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write8($7E02A2, $F4) ; Arc variable
%write16_enable()
%write16($7E0696, $0004) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Dark Room of Despair", "ad2020", "aga", "dark_room_of_despair")
dw $00D0 ; Screen ID
dw $011B, $1A78 ; Link Coords
dw $1A0B, $0100 ; Camera VH
db $EE, $07, $6C, $06 ; Mirror portal
db $05 ; Item
db $00 ; Link direction
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
%preset_UW("Dark Room of Melancholy", "ad2020", "aga", "dark_room_of_melancholy")
dw $00C0 ; Screen ID
dw $011C, $1978 ; Link Coords
dw $190B, $0100 ; Camera VH
db $EE, $07, $6C, $06 ; Mirror portal
db $05 ; Item
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
%preset_UW("Spear Guards", "ad2020", "aga", "spear_guards")
dw $00C0 ; Screen ID
dw $0178, $1824 ; Link Coords
dw $1800, $0100 ; Camera VH
db $EE, $07, $6C, $06 ; Mirror portal
db $05 ; Item
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
%write16($7FE100, $001C) ; Room $C0 persistent: Agahnim's Tower (Dark Bridge Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Circle of Pots", "ad2020", "aga", "circle_of_pots")
dw $00B0 ; Screen ID
dw $0078, $16D9 ; Link Coords
dw $1610, $0000 ; Camera VH
db $EE, $07, $6C, $06 ; Mirror portal
db $05 ; Item
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
%preset_UW("Catwalk", "ad2020", "aga", "catwalk")
dw $0040 ; Screen ID
dw $0130, $0978 ; Link Coords
dw $090B, $0100 ; Camera VH
db $EE, $07, $6C, $06 ; Mirror portal
db $05 ; Item
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
%write16($7FE0E0, $0D3F) ; Room $B0 persistent: Agahnim's Tower (Circle of Pots)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Agahnim", "ad2020", "aga", "agahnim")
dw $0030 ; Screen ID
dw $0078, $0624 ; Link Coords
dw $0600, $0000 ; Camera VH
db $EE, $07, $6C, $06 ; Mirror portal
db $05 ; Item
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
; GANON
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_ad2020_ganon:
%menu_header("Ganon", 1)

;---------------------------------------------------------------------------------------------------
%preset_OW("Pyramid", "ad2020", "ganon", "pyramid")
dw $005B ; Screen ID
dw $07F0, $065C ; Link Coords
dw $0600, $0778 ; Camera VH
db $EE, $07, $6C, $06 ; Mirror portal
db $05 ; Item
db $00 ; Link direction
;-----------------------------
dw $07F7, $066D ; Scroll X, Y
dw $002E ; Unknown 1
dw $0000 ; Unknown 2
dw $FFF8 ; Unknown 3
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; BOSSES
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_ad2020_boss:
%menu_header("Bosses", 0)
;===================================================================================================

;===================================================================================================
presetpersistent_ad2020_eastern:
;-----------------------------
.bed
..end
;-----------------------------
.courtyard_1
..end
;-----------------------------
.castle_entrance
..end
;-----------------------------
.courtyard_2
..end
;-----------------------------
.river_clip
..end
;-----------------------------
.outside_palace
..end
;-----------------------------
.entrance
..end
;-----------------------------
.stalfos_room
%write8_enable()
%write8($7E0B35, $00) ; Arc variable
%write8($7E0B37, $00) ; Arc variable
%write_end()
..end
;-----------------------------
.big_chest_room_1
%write8_enable()
%write8($7E0FCC, $01) ; Prize pack index
%write_end()
..end
;-----------------------------
.dark_antifairies_room
..end
;-----------------------------
.dark_key_room
%write8_enable()
%write8($7E0FC8, $01) ; Prize pack index
%write_end()
..end
;-----------------------------
.big_key_dmg_boost
%write8_enable()
%write8($7E0FC8, $02) ; Prize pack index
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
%write8($7E0FC8, $06) ; Prize pack index
%write8($7E0FCC, $03) ; Prize pack index
%write8($7E0FCB, $01) ; Prize pack index
%write_end()
..end

;===================================================================================================
presetpersistent_ad2020_pod:
;-----------------------------
.outside_eastern
%write8_enable()
%write8($7E0B31, $30) ; Arc variable
%write8($7E0B35, $30) ; Arc variable
%write8($7E0B32, $30) ; Arc variable
%write8($7E0B33, $30) ; Arc variable
%write8($7E0B37, $C7) ; Arc variable
%write8($7E0B30, $30) ; Arc variable
%write8($7E0B34, $30) ; Arc variable
%write_end()
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
%write8_enable()
%write8($7E0B35, $00) ; Arc variable
%write8($7E0B33, $00) ; Arc variable
%write8($7E0B37, $00) ; Arc variable
%write8($7E0B34, $00) ; Arc variable
%write_end()
..end
;-----------------------------
.hammerjump
..end
;-----------------------------
.archery_contest
%write8_enable()
%write8($7E0FCD, $01) ; Prize pack index
%write8($7E0B37, $0A) ; Arc variable
%write_end()
..end
;-----------------------------
.sexy_statue
..end
;-----------------------------
.mimics
..end
;-----------------------------
.statue
%write8_enable()
%write8($7E0FCB, $02) ; Prize pack index
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
%write8($7E0FC8, $01) ; Prize pack index
%write_end()
..end

;===================================================================================================
presetpersistent_ad2020_escape:
;-----------------------------
.outside_pod
%write8_enable()
%write8($7E0B31, $B0) ; Arc variable
%write8($7E0B32, $FF) ; Arc variable
%write8($7E0B33, $0F) ; Arc variable
%write8($7E0B30, $0A) ; Arc variable
%write_end()
..end
;-----------------------------
.sanc_1
%write16_enable()
%write16($7E0FC8, $0000) ; Prize pack index
%write16($7E0FCC, $0000) ; Prize pack index
%write_end()
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
..end

;===================================================================================================
presetpersistent_ad2020_hook:
;-----------------------------
.old_man_cave
..end
;-----------------------------
.entrance
%write8_enable()
%write8($7E0B37, $00) ; Arc variable
%write_end()
..end
;-----------------------------
.hera_to_sewers_clip
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
%write8($7E0FCC, $02) ; Prize pack index
%write_end()
..end
;-----------------------------
.fake_clippers
..end
;-----------------------------
.hookshot
..end

;===================================================================================================
presetpersistent_ad2020_thieves:
;-----------------------------
.outside_hera
%write8_enable()
%write8($7E0B35, $F8) ; Arc variable
%write8($7E0B36, $FC) ; Arc variable
%write8($7E0B33, $03) ; Arc variable
%write8($7E0B37, $FF) ; Arc variable
%write8($7E0B34, $FD) ; Arc variable
%write_end()
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
%write8_enable()
%write8($7E0B35, $00) ; Arc variable
%write8($7E0B32, $00) ; Arc variable
%write8($7E0B36, $00) ; Arc variable
%write8($7E0B33, $00) ; Arc variable
%write8($7E0B37, $00) ; Arc variable
%write8($7E0B34, $00) ; Arc variable
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
%write8_enable()
%write8($7E0FCC, $03) ; Prize pack index
%write8($7E0B37, $A0) ; Arc variable
%write_end()
..end
;-----------------------------
.mitts
..end
;-----------------------------
.backtracking_2
%write8_enable()
%write8($7E0B37, $04) ; Arc variable
%write_end()
..end
;-----------------------------
.pot_hammerdash
%write8_enable()
%write8($7E0B37, $0B) ; Arc variable
%write_end()
..end
;-----------------------------
.blind
..end

;===================================================================================================
presetpersistent_ad2020_skull:
;-----------------------------
.outside_thieves
..end
;-----------------------------
.frogdor
..end
;-----------------------------
.getting_tempered
..end
;-----------------------------
.fencedash
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
%write8($7E0B37, $FB) ; Arc variable
%write_end()
..end
;-----------------------------
.key_pot
%write8_enable()
%write8($7E0B36, $D8) ; Arc variable
%write8($7E0B37, $A0) ; Arc variable
%write_end()
..end
;-----------------------------
.skull_entrance
%write8_enable()
%write8($7E0B36, $47) ; Arc variable
%write_end()
..end
;-----------------------------
.mummy_hellway
%write8_enable()
%write8($7E0B37, $AD) ; Arc variable
%write_end()
..end
;-----------------------------
.mummy_key
%write8_enable()
%write8($7E0FC9, $01) ; Prize pack index
%write8($7E0B37, $9D) ; Arc variable
%write_end()
..end
;-----------------------------
.mothula
%write8_enable()
%write8($7E0B37, $88) ; Arc variable
%write_end()
..end

;===================================================================================================
presetpersistent_ad2020_hera:
;-----------------------------
.outside_skull
%write8_enable()
%write8($7E0B37, $85) ; Arc variable
%write_end()
..end
;-----------------------------
.old_man_cave
%write16_enable()
%write16($7E0FCC, $0000) ; Prize pack index
%write_end()
..end
;-----------------------------
.entrance
%write8_enable()
%write8($7E0B37, $00) ; Arc variable
%write_end()
..end
;-----------------------------
.moldorm
%write8_enable()
%write8($7E0FC8, $01) ; Prize pack index
%write_end()
..end

;===================================================================================================
presetpersistent_ad2020_mire:
;-----------------------------
.outside_hera
..end
;-----------------------------
.swamp_dmd
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
%write8_enable()
%write8($7E0FC8, $03) ; Prize pack index
%write8($7E0FC7, $01) ; Prize pack index
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
%write8($7E0B37, $8E) ; Arc variable
%write_end()
..end
;-----------------------------
.spark_gamble
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
.spike_key
%write8_enable()
%write8($7E0B37, $06) ; Arc variable
%write_end()
..end
;-----------------------------
.wizzrobe
%write8_enable()
%write8($7E0B37, $02) ; Arc variable
%write_end()
..end
;-----------------------------
.bridge_room
..end
;-----------------------------
.canedash
..end
;-----------------------------
.spooky_action
%write8_enable()
%write8($7E0B37, $E3) ; Arc variable
%write_end()
..end
;-----------------------------
.vitty
%write8_enable()
%write8($7E0B37, $08) ; Arc variable
%write_end()
..end

;===================================================================================================
presetpersistent_ad2020_desert:
;-----------------------------
.outside_mire
..end
;-----------------------------
.entrance
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
%write8_enable()
%write8($7E0B37, $94) ; Arc variable
%write_end()
..end
;-----------------------------
.torches
%write8_enable()
%write8($7E0FC8, $05) ; Prize pack index
%write8($7E0B37, $97) ; Arc variable
%write_end()
..end
;-----------------------------
.lanmolas
%write8_enable()
%write8($7E0B37, $8A) ; Arc variable
%write_end()
..end

;===================================================================================================
presetpersistent_ad2020_trock:
;-----------------------------
.outside_desert
..end
;-----------------------------
.old_man_cave
%write16_enable()
%write16($7E0FC8, $0000) ; Prize pack index
%write_end()
..end
;-----------------------------
.tr_climb
%write8_enable()
%write8($7E0B37, $00) ; Arc variable
%write_end()
..end
;-----------------------------
.laser_entrance
..end
;-----------------------------
.crystal_roller
..end
;-----------------------------
.pokey_1
%write8_enable()
%write8($7E0B36, $00) ; Arc variable
%write8($7E0B37, $47) ; Arc variable
%write_end()
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
..end
;-----------------------------
.zoras_domain
..end
;-----------------------------
.links_house
..end
;-----------------------------
.swamp_overworld
..end
;-----------------------------
.antifairy_room
..end
;-----------------------------
.entrance
%write8_enable()
%write8($7E0B37, $00) ; Arc variable
%write_end()
..end
;-----------------------------
.first_key_pot
..end
;-----------------------------
.main_hub
..end
;-----------------------------
.diver_down
%write8_enable()
%write8($7E0B35, $94) ; Arc variable
%write8($7E0B36, $64) ; Arc variable
%write8($7E0B33, $5C) ; Arc variable
%write8($7E0B37, $8D) ; Arc variable
%write8($7E0B34, $6D) ; Arc variable
%write_end()
..end
;-----------------------------
.restock
%write8_enable()
%write8($7E0B35, $31) ; Arc variable
%write8($7E0B36, $14) ; Arc variable
%write8($7E0B37, $16) ; Arc variable
%write_end()
..end
;-----------------------------
.phelps_way
%write8_enable()
%write8($7E0B35, $84) ; Arc variable
%write8($7E0B36, $51) ; Arc variable
%write8($7E0B37, $4F) ; Arc variable
%write_end()
..end
;-----------------------------
.arrghus
..end

;===================================================================================================
presetpersistent_ad2020_ice:
;-----------------------------
.outside_swamp
%write8_enable()
%write8($7E0B31, $1E) ; Arc variable
%write8($7E0B35, $42) ; Arc variable
%write8($7E0B32, $26) ; Arc variable
%write8($7E0B36, $3A) ; Arc variable
%write8($7E0B33, $35) ; Arc variable
%write8($7E0B37, $2E) ; Arc variable
%write8($7E0B30, $22) ; Arc variable
%write8($7E0B34, $40) ; Arc variable
%write_end()
..end
;-----------------------------
.ice_entrance
..end
;-----------------------------
.penguin_switch_room
..end
;-----------------------------
.get_ready_to_break_the_ice
..end
;-----------------------------
.spike_key
..end
;-----------------------------
.lonely_firebar
%write8_enable()
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
presetpersistent_ad2020_gtower:
;-----------------------------
.outside_ice
..end
;-----------------------------
.old_man_cave
..end
;-----------------------------
.entrance
%write8_enable()
%write8($7E0B37, $00) ; Arc variable
%write_end()
..end
;-----------------------------
.spike_skip
%write8_enable()
%write8($7E0B35, $00) ; Arc variable
%write8($7E0B36, $00) ; Arc variable
%write8($7E0B33, $00) ; Arc variable
%write8($7E0B34, $00) ; Arc variable
%write_end()
..end
;-----------------------------
.pre_firesnakes_room
..end
;-----------------------------
.bombable_floor
..end
;-----------------------------
.floor_2
%write8_enable()
%write8($7E0B31, $30) ; Arc variable
%write8($7E0B35, $30) ; Arc variable
%write8($7E0B32, $30) ; Arc variable
%write8($7E0B33, $30) ; Arc variable
%write8($7E0B37, $DF) ; Arc variable
%write8($7E0B30, $30) ; Arc variable
%write8($7E0B34, $30) ; Arc variable
%write_end()
..end
;-----------------------------
.mimics1
..end
;-----------------------------
.mimics2
..end
;-----------------------------
.spike_room
%write8_enable()
%write8($7E0FCB, $03) ; Prize pack index
%write_end()
..end
;-----------------------------
.gauntlet
..end
;-----------------------------
.gauntlet_3
%write8_enable()
%write8($7E0FCC, $02) ; Prize pack index
%write_end()
..end
;-----------------------------
.lanmola2
%write8_enable()
%write8($7E0FCC, $04) ; Prize pack index
%write_end()
..end
;-----------------------------
.wizz1
..end
;-----------------------------
.wizz2
..end
;-----------------------------
.torches1
%write8_enable()
%write8($7E0B37, $02) ; Arc variable
%write8($7E0FC7, $03) ; Prize pack index
%write_end()
..end
;-----------------------------
.torches2
%write8_enable()
%write8($7E0B37, $05) ; Arc variable
%write_end()
..end
;-----------------------------
.helma_key
%write8_enable()
%write8($7E0B37, $08) ; Arc variable
%write_end()
..end
;-----------------------------
.bombable_wall
%write8_enable()
%write8($7E0B37, $0D) ; Arc variable
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
presetpersistent_ad2020_aga:
;-----------------------------
.pyramid
..end
;-----------------------------
.gold_knights
..end
;-----------------------------
.dark_room_of_despair
%write8_enable()
%write8($7E0FC8, $01) ; Prize pack index
%write_end()
..end
;-----------------------------
.dark_room_of_melancholy
..end
;-----------------------------
.spear_guards
%write8_enable()
%write8($7E0FC7, $04) ; Prize pack index
%write_end()
..end
;-----------------------------
.circle_of_pots
%write8_enable()
%write8($7E0FC7, $05) ; Prize pack index
%write_end()
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
..end

;===================================================================================================
presetpersistent_ad2020_boss:
;===================================================================================================
presetSRAM_ad2020:
;---------------------------------------------------------------------------------------------------
.eastern
;---------------------------------------------------------------------------------------------------
..bed
%write8($7EF36F, $FF) ; Keys
%write8($7EF36C, $1818) ; Health (goal)
%write8($7EF377, $F8) ; abilities
%write16sram($7EF401, $FFFF) ; Deaths
%write8($7EF402, $FF) ; Deaths
%writeroom($104, $0002) ; Room $0104: Unknown (...............q)
%writeroom($106, $F000) ; Room $0106: Unknown (.dddb...........)
%writeroom($107, $F000) ; Room $0107: Unknown (.dddb...........)
...end
;---------------------------------------------------------------------------------------------------
..courtyard_1
%write8($7EF2BB, $00) ; Overworld $3B: Unknown (........)
%write8($7EF2FB, $00) ; Overworld $7B: Unknown (........)
%write8($7EF3C8, $03) ; Entrances Phase
%write8($7EF359, $01) ; Sword
%write8($7EF3C5, $01) ; Game Phase 1
%write8($7EF34A, $01) ; Torch
%write8($7EF35A, $01) ; Shield
%write8($7EF3C6, $11) ; Game Phase 2
%writeroom($104, $0012) ; Room $0104: Unknown (............q..q)
%writeroom($055, $000F) ; Room $0055: Castle Secret Entrance / Uncle Death Room (.............qqq)
%writeroom($028, $0000) ; Room $0028: Swamp Palace (Entrance Room) (................)
...end
;---------------------------------------------------------------------------------------------------
..castle_entrance
...end
;---------------------------------------------------------------------------------------------------
..courtyard_2
%write8($7EF3FF, $01) ; Deaths
%write8($7EF359, $01) ; 
%write8($7EF3C4, $100) ; 
%write8($7EF36D, $18) ; Health (actual)
%write8($7EF3FE, $100) ; Deaths
%write8($7EF4FE, $CAA4) ; Inverse checksum
%writeroom($061, $000F) ; Room $0061: Hyrule Castle (Main Entrance Room) (.............qqq)
...end
;---------------------------------------------------------------------------------------------------
..river_clip
%write8($7EF36D, $12) ; Health (actual)
%writeroom($060, $000F) ; Room $0060: Hyrule Castle (West Entrance Room) (.............qqq)
...end
;---------------------------------------------------------------------------------------------------
..outside_palace
...end
;---------------------------------------------------------------------------------------------------
..entrance
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
..dark_antifairies_room
%write8($7EF377, $05) ; Arrows
%writeroom($0AA, $000A) ; Room $00AA: Eastern Palace (Map Chest Room) (.............q.q)
...end
;---------------------------------------------------------------------------------------------------
..dark_key_room
%writeroom($0BA, $0008) ; Room $00BA: Eastern Palace (Dark Antifairy / Key Pot Room) (.............q..)
...end
;---------------------------------------------------------------------------------------------------
..big_key_dmg_boost
%write16sram($7EF360, $05) ; Rupees (actual)
%writeroom($0BA, $840C) ; Room $00BA: Eastern Palace (Dark Antifairy / Key Pot Room) (.d....K......qq.)
%writeroom($0B9, $800F) ; Room $00B9: Eastern Palace (Lobby Cannonballs Room) (.d...........qqq)
...end
;---------------------------------------------------------------------------------------------------
..big_chest_room_2
%write8($7EF36D, $0C) ; Health (actual)
%write16sram($7EF366, $2000) ; BigKey1
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
%write8($7EF373, $00) ; Magic filler
%write8($7EF377, $0E) ; Arrows
%write8($7EF36E, $10) ; Magic Power
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
%write8($7EF377, $1B) ; Arrows
%write16sram($7EF360, $0B) ; Rupees (actual)
%writeroom($0D8, $0005) ; Room $00D8: Eastern Palace (Zeldagamer Room / Pre-Armos Knights Room) (..............q.)
...end
;---------------------------------------------------------------------------------------------------
.pod
;---------------------------------------------------------------------------------------------------
..outside_eastern
%write8($7EF36F, $FF) ; Keys
%write8($7EF377, $09) ; Arrows
%write8($7EF3E7, $01) ; Deaths
%write8($7EF3FF, $00) ; Deaths
%write8($7EF36C, $20) ; Health (goal)
%write8($7EF374, $04) ; Pendants
%write8($7EF36D, $20) ; Health (actual)
%write8($7EF36E, $80) ; Magic Power
%writeroom($0C8, $0801) ; Room $00C8: Eastern Palace (Armos Knights[Boss]) (.....k..........)
...end
;---------------------------------------------------------------------------------------------------
..eastern_spinspeed
%write8($7EF343, $03) ; Bombs
%write8($7EF3C7, $03) ; Map Phase
%write8($7EF355, $01) ; Boots
%write8($7EF375, $00) ; Bomb filler
%write8($7EF379, $FC) ; Ability Flags
%writeroom($105, $802A) ; Room $0105: Unknown (.d.........c.q.q)
...end
;---------------------------------------------------------------------------------------------------
..dma
...end
;---------------------------------------------------------------------------------------------------
..death_mountain
%write8($7EF3D3, $00) ; Super Bomb Boom
%write8($7EF3C8, $05) ; Entrances Phase
%write8($7EF3CC, $04) ; Tagalong
%writeroom($0F0, $000F) ; Room $00F0: Cave (Lost Old Man Starting Cave) (.............qqq)
%writeroom($0F1, $000F) ; Room $00F1: Cave (Lost Old Man Starting Cave) (.............qqq)
...end
;---------------------------------------------------------------------------------------------------
..kiki_yeet
%write8($7EF353, $02) ; Magic Mirror
%write8($7EF3C8, $01) ; Entrances Phase
%write8($7EF3CC, $00) ; Tagalong
...end
;---------------------------------------------------------------------------------------------------
..kiki_skip
...end
;---------------------------------------------------------------------------------------------------
..dungeon_reload
%write8($7EF343, $04) ; Bombs
%write8($7EF36D, $18) ; Health (actual)
%writeroom($04A, $200F) ; Room $004A: Palace of Darkness (Entrance Room) (...d.........qqq)
%writeroom($009, $0008) ; Room $0009: Palace of Darkness (.............q..)
%writeroom($0F9, $000F) ; Room $00F9: Cave (.............qqq)
...end
;---------------------------------------------------------------------------------------------------
..main_hub_bk
%write8($7EF343, $06) ; Bombs
%write8($7EF36F, $01) ; Keys
%write8($7EF382, $01) ; Key for dungeon $06
%writeroom($009, $0018) ; Room $0009: Palace of Darkness (............qq..)
...end
;---------------------------------------------------------------------------------------------------
..main_hub_hammerjump
%write16sram($7EF366, $2200) ; BigKey1
%writeroom($00A, $801F) ; Room $000A: Palace of Darkness (Stalfos Trap Room) (.d..........qqqq)
%writeroom($03A, $801F) ; Room $003A: Palace of Darkness (Bombable Floor Room) (.d..........qqqq)
...end
;---------------------------------------------------------------------------------------------------
..hammerjump
%write8($7EF36F, $00) ; Keys
%writeroom($02A, $400F) ; Room $002A: Palace of Darkness (Big Hub Room) (..d..........qqq)
...end
;---------------------------------------------------------------------------------------------------
..archery_contest
%write8($7EF343, $07) ; Bombs
%write8($7EF34B, $01) ; Hammer
%write8($7EF382, $00) ; Key for dungeon $06
%writeroom($01A, $101A) ; Room $001A: Palace of Darkness (Big Chest Room) (....b.......qq.q)
...end
;---------------------------------------------------------------------------------------------------
..sexy_statue
%write8($7EF36F, $01) ; Keys
%write8($7EF377, $08) ; Arrows
%writeroom($02A, $402F) ; Room $002A: Palace of Darkness (Big Hub Room) (..d........c.qqq)
...end
;---------------------------------------------------------------------------------------------------
..mimics
%write8($7EF343, $09) ; Bombs
%writeroom($02B, $000A) ; Room $002B: Palace of Darkness (Map Chest / Fairy Room) (.............q.q)
...end
;---------------------------------------------------------------------------------------------------
..statue
%write8($7EF377, $0E) ; Arrows
%writeroom($01B, $0002) ; Room $001B: Palace of Darkness (Mimics / Moving Wall Room) (...............q)
...end
;---------------------------------------------------------------------------------------------------
..basement
%write8($7EF377, $0C) ; Arrows
%writeroom($01B, $008E) ; Room $001B: Palace of Darkness (Mimics / Moving Wall Room) (.........c...qqq)
...end
;---------------------------------------------------------------------------------------------------
..turtle_room
%write8($7EF343, $08) ; Bombs
%write8($7EF36F, $00) ; Keys
%writeroom($00B, $200C) ; Room $000B: Palace of Darkness (Turtle Room) (...d.........qq.)
...end
;---------------------------------------------------------------------------------------------------
..helma
%writeroom($06A, $8005) ; Room $006A: Palace of Darkness (Rupee Room) (.d............q.)
%writeroom($00B, $200F) ; Room $000B: Palace of Darkness (Turtle Room) (...d.........qqq)
...end
;---------------------------------------------------------------------------------------------------
.escape
;---------------------------------------------------------------------------------------------------
..outside_pod
%write8($7EF36F, $FF) ; Keys
%write8($7EF3C7, $07) ; Map Phase
%write8($7EF3EF, $00) ; Deaths
%write8($7EF36C, $28) ; Health (goal)
%write8($7EF36D, $28) ; Health (actual)
%write8($7EF37A, $02) ; Crystals
%writeroom($05A, $0801) ; Room $005A: Palace of Darkness (Helmasaur King[Boss]) (.....k..........)
...end
;---------------------------------------------------------------------------------------------------
..sanc_1
%write8($7EF36F, $00) ; Keys
%write8($7EF3FF, $01) ; Deaths
%write8($7EF354, $100) ; Gloves
%write8($7EF36C, $2028) ; Health (goal)
%write8($7EF377, $FC) ; abilities
%write8($7EF36D, $20) ; Health (actual)
%write8($7EF342, $800) ; Hookshot
%write8($7EF34A, $101) ; Torch
%write8($7EF352, $200) ; Magic Cape
%write8($7EF36E, $FF80) ; Magic Power
%write8($7EF376, $C00) ; Arrow filler
%write8($7EF3C6, $711) ; Game Phase 2
%write8($7EF3E6, $100) ; 
%write8($7EF4FE, $52B2) ; Inverse checksum
%writeroom($012, $000F) ; Room $0012: Sanctuary (.............qqq)
...end
;---------------------------------------------------------------------------------------------------
..entrance
%write8($7EF36F, $FF) ; Keys
...end
;---------------------------------------------------------------------------------------------------
..1st_keyguard
%write8($7EF36F, $00) ; Keys
%writeroom($052, $000F) ; Room $0052: Hyrule Castle (East Corridor) (.............qqq)
%writeroom($062, $000F) ; Room $0062: Hyrule Castle (East Entrance Room) (.............qqq)
%writeroom($001, $000C) ; Room $0001: Hyrule Castle (North Corridor) (.............qq.)
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
..zeldas_cell
%write8($7EF341, $01) ; Boomerang
%writeroom($070, $0008) ; Room $0070: Hyrule Castle (Small Corridor to Jail Cells) (.............q..)
%writeroom($071, $841B) ; Room $0071: Hyrule Castle (Boomerang Chest Room) (.d....K.....qq.q)
...end
;---------------------------------------------------------------------------------------------------
..sanc_2
%write8($7EF29B, $20) ; Overworld $1B: Unknown (...?....)
%write8($7EF3C8, $02) ; Entrances Phase
%write8($7EF3CC, $01) ; Tagalong
%write8($7EF3E4, $100) ; Player name
%write8($7EF3E5, $01) ; Validity (checksum)
%write16sram($7EF366, $6200) ; BigKey1
%write8($7EF36E, $80) ; Magic Power
%write8($7EF3C6, $15) ; Game Phase 2
%write8($7EF4FE, $2FB) ; Inverse checksum
%writeroom($080, $042C) ; Room $0080: Hyrule Castle (Jail Cell Room) (......K....c.qq.)
...end
;---------------------------------------------------------------------------------------------------
.hook
;---------------------------------------------------------------------------------------------------
..old_man_cave
%write8($7EF36F, $FF) ; Keys
%write8($7EF3C7, $01) ; Map Phase
%write8($7EF3E3, $01) ; Player name
%write8($7EF36C, $2030) ; Health (goal)
%write8($7EF3C4, $200) ; 
%write8($7EF3C8, $01) ; Entrances Phase
%write8($7EF3CC, $00) ; Tagalong
%write8($7EF3C5, $02) ; Game Phase 1
%write8($7EF29A, $2000) ; Overworld $1A: Unknown (........)
%write8($7EF3C6, $115) ; Game Phase 2
%write8($7EF3E2, $155) ; Player name
%write8($7EF4FE, $E6E1) ; Inverse checksum
%writeroom($012, $001F) ; Room $0012: Sanctuary (............qqqq)
%writeroom($0E4, $000A) ; Room $00E4: Cave (Lost Old Man Final Cave) (.............q.q)
...end
;---------------------------------------------------------------------------------------------------
..entrance
...end
;---------------------------------------------------------------------------------------------------
..hera_to_sewers_clip
%write8($7EF36F, $00) ; Keys
%writeroom($077, $000F) ; Room $0077: Tower of Hera (Entrance Room) (.............qqq)
...end
;---------------------------------------------------------------------------------------------------
..tile_room
%write8($7EF343, $07) ; Bombs
%write8($7EF36F, $01) ; Keys
%write8($7EF36D, $18) ; Health (actual)
%write8($7EF386, $02) ; Key for dungeon $0A
%writeroom($032, $001F) ; Room $0032: Hyrule Castle (Sewer Key Chest Room) (............qqqq)
%writeroom($042, $000C) ; Room $0042: Hyrule Castle (6 Ropes Room) (.............qq.)
%writeroom($031, $0001) ; Room $0031: Tower of Hera (Hardhat Beetles Room) (................)
%writeroom($041, $000F) ; Room $0041: Hyrule Castle (First Dark Room) (.............qqq)
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
%write16sram($7EF366, $6220) ; BigKey1
%write8($7EF36E, $64) ; Magic Power
%write8($7EF386, $01) ; Key for dungeon $0A
%writeroom($087, $041F) ; Room $0087: Tower of Hera (Tile Room) (......K.....qqqq)
...end
;---------------------------------------------------------------------------------------------------
..petting_zoo
%write8($7EF343, $08) ; Bombs
%writeroom($031, $800F) ; Room $0031: Tower of Hera (Hardhat Beetles Room) (.d...........qqq)
...end
;---------------------------------------------------------------------------------------------------
..fake_clippers
%write8($7EF343, $07) ; Bombs
%write8($7EF357, $01) ; Moon Pearl
%write8($7EF36F, $01) ; Keys
%write8($7EF36D, $10) ; Health (actual)
%writeroom($027, $001F) ; Room $0027: Tower of Hera (Big Chest) (............qqqq)
...end
;---------------------------------------------------------------------------------------------------
..hookshot
%write8($7EF343, $05) ; Bombs
%write8($7EF377, $06) ; Arrows
%writeroom($037, $208F) ; Room $0037: Swamp Palace (Map Chest / Water Fill Room) (...d.....c...qqq)
...end
;---------------------------------------------------------------------------------------------------
.thieves
;---------------------------------------------------------------------------------------------------
..outside_hera
%write8($7EF36F, $FF) ; Keys
%write8($7EF342, $01) ; Hookshot
%write8($7EF386, $00) ; Key for dungeon $0A
%writeroom($036, $001F) ; Room $0036: Swamp Palace (Big Chest Room) (............qqqq)
...end
;---------------------------------------------------------------------------------------------------
..dmd
%write8($7EF3CA, $40) ; LW/DW
...end
;---------------------------------------------------------------------------------------------------
..entrance
%write8($7EF2D8, $20) ; Overworld $58: Unknown (...?....)
...end
;---------------------------------------------------------------------------------------------------
..after_big_key
%write8($7EF36F, $00) ; Keys
%write16sram($7EF366, $6230) ; BigKey1
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
%write8($7EF36D, $18) ; Health (actual)
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
%write8($7EF343, $05) ; Bombs
%writeroom($0BC, $C40F) ; Room $00BC: Thieves Town (Conveyor Toilet) (.dd...K......qqq)
%writeroom($0BB, $000F) ; Room $00BB: Thieves Town (Hellway) (.............qqq)
...end
;---------------------------------------------------------------------------------------------------
..prison
%write8($7EF343, $04) ; Bombs
%writeroom($044, $0005) ; Room $0044: Thieves Town (Big Chest Room) (..............q.)
%writeroom($045, $000A) ; Room $0045: Thieves Town (Jail Cells Room) (.............q.q)
...end
;---------------------------------------------------------------------------------------------------
..mitts
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
%write8($7EF377, $0B) ; Arrows
%write8($7EF376, $00) ; Arrow filler
...end
;---------------------------------------------------------------------------------------------------
..blind
...end
;---------------------------------------------------------------------------------------------------
.skull
;---------------------------------------------------------------------------------------------------
..outside_thieves
%write8($7EF36F, $FF) ; Keys
%write8($7EF3FF, $00) ; Deaths
%write8($7EF36C, $38) ; Health (goal)
%write8($7EF3CC, $00) ; Tagalong
%write8($7EF36D, $38) ; Health (actual)
%write8($7EF3F9, $01) ; Deaths
%write8($7EF36E, $80) ; Magic Power
%write8($7EF37A, $22) ; Crystals
%write8($7EF387, $00) ; Key for dungeon $0B
%writeroom($0AC, $0A01) ; Room $00AC: Thieves Town (Blind The Thief[Boss]) (.....k.R........)
...end
;---------------------------------------------------------------------------------------------------
..frogdor
%write8($7EF343, $03) ; Bombs
%write8($7EF2D8, $22) ; Overworld $58: Unknown (...?...?)
%write16sram($7EF360, $137) ; Rupees (actual)
%writeroom($106, $F012) ; Room $0106: Unknown (.dddb.......q..q)
...end
;---------------------------------------------------------------------------------------------------
..getting_tempered
%write8($7EF3CC, $07) ; Tagalong
%write8($7EF34E, $01) ; Book of Mudora
%writeroom($107, $F002) ; Room $0107: Unknown (.dddb..........q)
...end
;---------------------------------------------------------------------------------------------------
..fencedash
%write8($7EF3CC, $00) ; Tagalong
%write8($7EF359, $03) ; Sword
%write8($7EF3C9, $20) ; Game Phase 3
%write16sram($7EF360, $12D) ; Rupees (actual)
%writeroom($121, $0002) ; Room $0121: Unknown (...............q)
...end
;---------------------------------------------------------------------------------------------------
..dash_to_sw
%write16sram($7EF360, $259) ; Rupees (actual)
%writeroom($11C, $0011) ; Room $011C: Unknown (............q...)
...end
;---------------------------------------------------------------------------------------------------
..mummy_room
...end
;---------------------------------------------------------------------------------------------------
..bomb_jump
%write16sram($7EF366, $62B0) ; BigKey1
%writeroom($057, $001A) ; Room $0057: Skull Woods (Big Key Room) (............qq.q)
...end
;---------------------------------------------------------------------------------------------------
..key_pot
%write8($7EF343, $02) ; Bombs
%write8($7EF36F, $00) ; Keys
%write8($7EF345, $01) ; Fire Rod
%write8($7EF36D, $28) ; Health (actual)
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
%writeroom($039, $4402) ; Room $0039: Skull Woods (Gibdo Key / Mothula Hole Room) (..d...K........q)
...end
;---------------------------------------------------------------------------------------------------
.hera
;---------------------------------------------------------------------------------------------------
..outside_skull
%write8($7EF36F, $FF) ; Keys
%write8($7EF3F3, $00) ; Deaths
%write8($7EF36C, $40) ; Health (goal)
%write8($7EF384, $00) ; Key for dungeon $08
%write8($7EF36D, $40) ; Health (actual)
%write8($7EF36E, $80) ; Magic Power
%write8($7EF37A, $62) ; Crystals
%writeroom($029, $0801) ; Room $0029: Skull Woods (Mothula[Boss]) (.....k..........)
%writeroom($039, $4403) ; Room $0039: Skull Woods (Gibdo Key / Mothula Hole Room) (..d...K........q)
...end
;---------------------------------------------------------------------------------------------------
..old_man_cave
%write8($7EF3FF, $01) ; Deaths
%write8($7EF344, $100) ; Mushroom
%write8($7EF354, $102) ; Gloves
%write8($7EF359, $03) ; 
%write8($7EF36C, $2840) ; Health (goal)
%write8($7EF3F8, $100) ; Deaths
%write8($7EF36D, $28) ; Health (actual)
%write8($7EF342, $201) ; Hookshot
%write8($7EF356, $100) ; Flippers
%write8($7EF36E, $FF80) ; Magic Power
%write8($7EF376, $B00) ; Arrow filler
%write8($7EF3CA, $00) ; LW/DW
%write8($7EF4FE, $1181) ; Inverse checksum
...end
;---------------------------------------------------------------------------------------------------
..entrance
...end
;---------------------------------------------------------------------------------------------------
..moldorm
%write8($7EF36F, $00) ; Keys
%writeroom($017, $000F) ; Room $0017: Tower of Hera (Moldorm Fall Room) (.............qqq)
%writeroom($0A7, $000C) ; Room $00A7: Tower of Hera (Fairy Room) (.............qq.)
...end
;---------------------------------------------------------------------------------------------------
.mire
;---------------------------------------------------------------------------------------------------
..outside_hera
%write8($7EF36F, $FF) ; Keys
%write8($7EF3F7, $01) ; Deaths
%write8($7EF3FF, $00) ; Deaths
%write8($7EF36C, $48) ; Health (goal)
%write8($7EF374, $05) ; Pendants
%write8($7EF36D, $48) ; Health (actual)
%writeroom($007, $080F) ; Room $0007: Tower of Hera (Moldorm[Boss]) (.....k.......qqq)
...end
;---------------------------------------------------------------------------------------------------
..swamp_dmd
%write8($7EF348, $01) ; Ether Medallion
%write8($7EF3CA, $40) ; LW/DW
...end
;---------------------------------------------------------------------------------------------------
..overworld
...end
;---------------------------------------------------------------------------------------------------
..entrance
%write8($7EF2F0, $20) ; Overworld $70: Unknown (...?....)
%write8($7EF36E, $60) ; Magic Power
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
%writeroom($0B2, $0001) ; Room $00B2: Misery Mire (Slug Room) (................)
%writeroom($0C2, $000F) ; Room $00C2: Misery Mire (Big Hub Room) (.............qqq)
%writeroom($0B3, $0402) ; Room $00B3: Misery Mire (Spike Key Chest Room) (......K........q)
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
%write8($7EF36E, $67) ; Magic Power
%writeroom($0D1, $0008) ; Room $00D1: Misery Mire (Conveyor Slug / Big Key Room) (.............q..)
...end
;---------------------------------------------------------------------------------------------------
..spark_gamble
%write8($7EF373, $00) ; Magic filler
%write16sram($7EF366, $63B0) ; BigKey1
%write8($7EF36E, $40) ; Magic Power
%writeroom($097, $010F) ; Room $0097: Misery Mire (Torch Puzzle / Moving Wall Room) (........c....qqq)
%writeroom($0B1, $0007) ; Room $00B1: Misery Mire (Hourglass Room) (..............qq)
%writeroom($0C1, $C407) ; Room $00C1: Misery Mire (Compass Chest / Tile Room) (.dd...K.......qq)
%writeroom($0D1, $001B) ; Room $00D1: Misery Mire (Conveyor Slug / Big Key Room) (............qq.q)
...end
;---------------------------------------------------------------------------------------------------
..big_chest_room
%write8($7EF36D, $40) ; Health (actual)
%writeroom($0C3, $000A) ; Room $00C3: Misery Mire (Big Chest Room) (.............q.q)
...end
;---------------------------------------------------------------------------------------------------
..spike_key
%write8($7EF350, $01) ; Cane of Somaria
%writeroom($0C3, $001F) ; Room $00C3: Misery Mire (Big Chest Room) (............qqqq)
...end
;---------------------------------------------------------------------------------------------------
..wizzrobe
%write8($7EF36D, $28) ; Health (actual)
%writeroom($0B3, $841A) ; Room $00B3: Misery Mire (Spike Key Chest Room) (.d....K.....qq.q)
...end
;---------------------------------------------------------------------------------------------------
..bridge_room
%write16sram($7EF360, $25A) ; Rupees (actual)
%writeroom($0B2, $800D) ; Room $00B2: Misery Mire (Slug Room) (.d...........qq.)
...end
;---------------------------------------------------------------------------------------------------
..canedash
%write8($7EF36E, $30) ; Magic Power
%writeroom($0A2, $800F) ; Room $00A2: Misery Mire (Bridge Key Chest Room) (.d...........qqq)
%writeroom($093, $000E) ; Room $0093: Misery Mire (Dark Cane Floor Switch Puzzle Room) (.............qqq)
...end
;---------------------------------------------------------------------------------------------------
..spooky_action
%write8($7EF36E, $28) ; Magic Power
%writeroom($092, $0005) ; Room $0092: Misery Mire (Dark Bomb Wall / Switches Room) (..............q.)
...end
;---------------------------------------------------------------------------------------------------
..vitty
%writeroom($092, $0007) ; Room $0092: Misery Mire (Dark Bomb Wall / Switches Room) (..............qq)
%writeroom($0A0, $800F) ; Room $00A0: Misery Mire (Pre-Vitreous Room) (.d...........qqq)
%writeroom($091, $0005) ; Room $0091: Misery Mire (Final Switch Room) (..............q.)
...end
;---------------------------------------------------------------------------------------------------
.desert
;---------------------------------------------------------------------------------------------------
..outside_mire
%write8($7EF36F, $FF) ; Keys
%write8($7EF377, $03) ; Arrows
%write8($7EF383, $00) ; Key for dungeon $07
%write8($7EF36C, $50) ; Health (goal)
%write8($7EF36D, $50) ; Health (actual)
%write8($7EF3F1, $00) ; Deaths
%write8($7EF36E, $80) ; Magic Power
%write8($7EF37A, $63) ; Crystals
%writeroom($090, $0802) ; Room $0090: Misery Mire (Vitreous[Boss]) (.....k.........q)
...end
;---------------------------------------------------------------------------------------------------
..entrance
%write8($7EF3CA, $00) ; LW/DW
...end
;---------------------------------------------------------------------------------------------------
..torch_key
%write8($7EF36F, $00) ; Keys
%writeroom($073, $0001) ; Room $0073: Desert Palace (Big Chest Room) (................)
%writeroom($083, $0007) ; Room $0083: Desert Palace (West Entrance Room) (..............qq)
...end
;---------------------------------------------------------------------------------------------------
..pre_cannonball_room
%writeroom($074, $0003) ; Room $0074: Desert Palace (Map Chest Room) (...............q)
%writeroom($073, $0405) ; Room $0073: Desert Palace (Big Chest Room) (......K.......q.)
%writeroom($075, $0002) ; Room $0075: Desert Palace (Big Key Chest Room) (...............q)
%writeroom($085, $400A) ; Room $0085: Desert Palace (East Entrance Room) (..d..........q.q)
...end
;---------------------------------------------------------------------------------------------------
..desert2_spinspeed
%write8($7EF37F, $00) ; Key for dungeon $03
%write16sram($7EF366, $73B0) ; BigKey1
%writeroom($075, $0017) ; Room $0075: Desert Palace (Big Key Chest Room) (............q.qq)
%writeroom($085, $400E) ; Room $0085: Desert Palace (East Entrance Room) (..d..........qqq)
...end
;---------------------------------------------------------------------------------------------------
..popo_genocide_room
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
%write8($7EF377, $08) ; Arrows
%write8($7EF36E, $50) ; Magic Power
%write8($7EF376, $00) ; Arrow filler
%writeroom($043, $E48D) ; Room $0043: Desert Palace (Torch Puzzle / Moving Wall Room) (.ddd..K..c...qq.)
...end
;---------------------------------------------------------------------------------------------------
.trock
;---------------------------------------------------------------------------------------------------
..outside_desert
%write8($7EF36F, $FF) ; Keys
%write8($7EF3C7, $04) ; Map Phase
%write8($7EF36C, $58) ; Health (goal)
%write8($7EF374, $07) ; Pendants
%write8($7EF36D, $58) ; Health (actual)
%write8($7EF3E9, $00) ; Deaths
%write8($7EF36E, $80) ; Magic Power
%writeroom($033, $0802) ; Room $0033: Desert Palace (Lanmolas[Boss]) (.....k.........q)
...end
;---------------------------------------------------------------------------------------------------
..old_man_cave
%write8($7EF2B7, $02) ; Overworld $37: Unknown (.......?)
%write8($7EF343, $01) ; Bombs
%write8($7EF3FF, $01) ; Deaths
%write8($7EF36C, $3858) ; Health (goal)
%write8($7EF36D, $38) ; Health (actual)
%write8($7EF2B6, $200) ; Overworld $36: Unknown (........)
%write8($7EF342, $101) ; Hookshot
%write8($7EF346, $01) ; Ice Rod
%write8($7EF36E, $FF80) ; Magic Power
%write8($7EF376, $800) ; Arrow filler
%write8($7EF3C6, $415) ; Game Phase 2
%write8($7EF3F6, $100) ; Deaths
%write8($7EF4FE, $FB47) ; Inverse checksum
%writeroom($120, $001A) ; Room $0120: Unknown (............qq.q)
...end
;---------------------------------------------------------------------------------------------------
..tr_climb
%write8($7EF3CA, $40) ; LW/DW
...end
;---------------------------------------------------------------------------------------------------
..laser_entrance
...end
;---------------------------------------------------------------------------------------------------
..crystal_roller
%write8($7EF343, $00) ; Bombs
%write8($7EF36F, $01) ; Keys
%write8($7EF36D, $28) ; Health (actual)
%write8($7EF36E, $78) ; Magic Power
%writeroom($0B5, $000F) ; Room $00B5: Turtle Rock (Dark Maze) (.............qqq)
%writeroom($0C5, $000A) ; Room $00C5: Turtle Rock (Laser Bridge) (.............q.q)
%writeroom($0D5, $808A) ; Room $00D5: Turtle Rock (Laser Key Room) (.d.......c...q.q)
...end
;---------------------------------------------------------------------------------------------------
..pokey_1
%write8($7EF36E, $70) ; Magic Power
%writeroom($004, $401A) ; Room $0004: Turtle Rock (Crysta-roller Room) (..d.........qq.q)
%writeroom($014, $800F) ; Room $0014: Turtle Rock (Big Key Room) (.d...........qqq)
%writeroom($024, $800C) ; Room $0024: Turtle Rock (Double Hokku-Bokku / Big chest Room) (.d...........qq.)
...end
;---------------------------------------------------------------------------------------------------
..laser_entrance_2
%write8($7EF388, $01) ; Key for dungeon $0C
%write16sram($7EF366, $73B8) ; BigKey1
%writeroom($014, $C01F) ; Room $0014: Turtle Rock (Big Key Room) (.dd.........qqqq)
%writeroom($013, $8405) ; Room $0013: Turtle Rock (Hokku-Bokku Key Room 2) (.d....K.......q.)
...end
;---------------------------------------------------------------------------------------------------
..switch_maze
%write8($7EF36F, $00) ; Keys
%writeroom($0C5, $800A) ; Room $00C5: Turtle Rock (Laser Bridge) (.d...........q.q)
...end
;---------------------------------------------------------------------------------------------------
..trinexx
%write8($7EF36E, $60) ; Magic Power
%writeroom($0B4, $800F) ; Room $00B4: Turtle Rock (Pre-Trinexx Room) (.d...........qqq)
%writeroom($0C4, $800F) ; Room $00C4: Turtle Rock (Final Crystal Switch Puzzle Room) (.d...........qqq)
...end
;---------------------------------------------------------------------------------------------------
.swamp
;---------------------------------------------------------------------------------------------------
..outside_trock
%write8($7EF36F, $FF) ; Keys
%write8($7EF3FB, $01) ; Deaths
%write8($7EF3FF, $00) ; Deaths
%write8($7EF36C, $60) ; Health (goal)
%write8($7EF388, $00) ; Key for dungeon $0C
%write8($7EF36D, $60) ; Health (actual)
%write8($7EF36E, $80) ; Magic Power
%write8($7EF37A, $6B) ; Crystals
%writeroom($0A4, $0802) ; Room $00A4: Turtle Rock (Trinexx[Boss]) (.....k.........q)
...end
;---------------------------------------------------------------------------------------------------
..zoras_domain
%write8($7EF3CA, $00) ; LW/DW
...end
;---------------------------------------------------------------------------------------------------
..links_house
%write8($7EF3FF, $01) ; Deaths
%write8($7EF304, $0F) ; 
%write8($7EF36C, $3860) ; Health (goal)
%write8($7EF377, $FE) ; abilities
%write8($7EF36D, $38) ; Health (actual)
%write8($7EF379, $FE) ; Ability Flags
%write8($7EF342, $01) ; Hookshot
%write8($7EF356, $101) ; Flippers
%write16sram($7EF360, $CF) ; Rupees (actual)
%write8($7EF36E, $FF80) ; Magic Power
%write8($7EF3FA, $100) ; Deaths
%write8($7EF4FE, $EF7E) ; Inverse checksum
...end
;---------------------------------------------------------------------------------------------------
..swamp_overworld
%write16sram($7EF360, $66) ; Rupees (actual)
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
..main_hub
%write8($7EF343, $01) ; Bombs
%writeroom($038, $440A) ; Room $0038: Swamp Palace (Key Pot Room) (..d...K......q.q)
%writeroom($037, $308F) ; Room $0037: Swamp Palace (Map Chest / Water Fill Room) (...db....c...qqq)
...end
;---------------------------------------------------------------------------------------------------
..diver_down
%writeroom($026, $8003) ; Room $0026: Swamp Palace (Statue Room) (.d.............q)
%writeroom($036, $441F) ; Room $0036: Swamp Palace (Big Chest Room) (..d...K.....qqqq)
...end
;---------------------------------------------------------------------------------------------------
..restock
%write8($7EF36E, $78) ; Magic Power
%writeroom($066, $0003) ; Room $0066: Swamp Palace (Hidden Chest / Hidden Door Room) (...............q)
%writeroom($076, $000B) ; Room $0076: Swamp Palace (Water Drain Room) (.............q.q)
...end
;---------------------------------------------------------------------------------------------------
..phelps_way
%write8($7EF343, $02) ; Bombs
%write8($7EF377, $0D) ; Arrows
%write8($7EF376, $00) ; Arrow filler
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
%write8($7EF3FF, $00) ; Deaths
%write8($7EF36C, $68) ; Health (goal)
%write8($7EF36D, $68) ; Health (actual)
%write8($7EF381, $00) ; Key for dungeon $05
%write8($7EF3ED, $01) ; Deaths
%write8($7EF36E, $80) ; Magic Power
%write8($7EF37A, $7B) ; Crystals
%writeroom($006, $0802) ; Room $0006: Swamp Palace (Arrghus[Boss]) (.....k.........q)
...end
;---------------------------------------------------------------------------------------------------
..ice_entrance
%write8($7EF2BB, $00) ; Overworld $3B: Unknown (........)
%write8($7EF2FB, $00) ; Overworld $7B: Unknown (........)
%write16sram($7EF360, $67) ; Rupees (actual)
%writeroom($10B, $000F) ; Room $010B: Unknown (.............qqq)
%writeroom($028, $0080) ; Room $0028: Swamp Palace (Entrance Room) (.........c......)
...end
;---------------------------------------------------------------------------------------------------
..penguin_switch_room
%write8($7EF343, $01) ; Bombs
%write8($7EF36F, $00) ; Keys
%write8($7EF36D, $60) ; Health (actual)
%write8($7EF36E, $78) ; Magic Power
%writeroom($00E, $0001) ; Room $000E: Ice Palace (Entrance Room) (................)
%writeroom($01E, $0005) ; Room $001E: Ice Palace (Bomb Floor / Bari Room) (..............q.)
...end
;---------------------------------------------------------------------------------------------------
..get_ready_to_break_the_ice
%writeroom($01F, $0002) ; Room $001F: Ice Palace (Pengator / Big Key Room) (...............q)
...end
;---------------------------------------------------------------------------------------------------
..spike_key
%write8($7EF36E, $70) ; Magic Power
%writeroom($01F, $0003) ; Room $001F: Ice Palace (Pengator / Big Key Room) (...............q)
%writeroom($03F, $0003) ; Room $003F: Ice Palace (Map Chest Room) (...............q)
...end
;---------------------------------------------------------------------------------------------------
..lonely_firebar
%write8($7EF36D, $58) ; Health (actual)
%writeroom($05E, $8001) ; Room $005E: Ice Palace (Lonely Firebar) (.d..............)
%writeroom($05F, $8012) ; Room $005F: Ice Palace (Hidden Chest / Spike Floor Room) (.d..........q..q)
...end
;---------------------------------------------------------------------------------------------------
..last_two_screens
%writeroom($05E, $8003) ; Room $005E: Ice Palace (Lonely Firebar) (.d.............q)
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
.gtower
;---------------------------------------------------------------------------------------------------
..outside_ice
%write8($7EF36F, $FF) ; Keys
%write8($7EF3C7, $08) ; Map Phase
%write8($7EF36C, $70) ; Health (goal)
%write8($7EF36D, $70) ; Health (actual)
%write8($7EF385, $00) ; Key for dungeon $09
%write8($7EF3F5, $00) ; Deaths
%write8($7EF37A, $7F) ; Crystals
%writeroom($0DE, $0804) ; Room $00DE: Ice Palace (Kholdstare[Boss]) (.....k........q.)
...end
;---------------------------------------------------------------------------------------------------
..old_man_cave
%write8($7EF3FF, $01) ; Deaths
%write8($7EF36C, $4070) ; Health (goal)
%write8($7EF3EC, $100) ; Deaths
%write8($7EF36D, $40) ; Health (actual)
%write8($7EF342, $101) ; Hookshot
%write8($7EF36E, $FF80) ; Magic Power
%write8($7EF376, $D00) ; Arrow filler
%write8($7EF3C6, $815) ; Game Phase 2
%write8($7EF3CA, $00) ; LW/DW
%write8($7EF4FE, $F03F) ; Inverse checksum
%writeroom($028, $801F) ; Room $0028: Swamp Palace (Entrance Room) (.d..........qqqq)
...end
;---------------------------------------------------------------------------------------------------
..entrance
%write8($7EF3CA, $40) ; LW/DW
...end
;---------------------------------------------------------------------------------------------------
..spike_skip
%write8($7EF36F, $02) ; Keys
%writeroom($00C, $000F) ; Room $000C: Ganon's Tower (Entrance Room) (.............qqq)
%writeroom($08C, $0408) ; Room $008C: Ganon's Tower (East and West Downstairs / Big Chest Room) (......K......q..)
%writeroom($08B, $0404) ; Room $008B: Ganon's Tower (Block Puzzle / Spike Skip / Map Chest Room) (......K.......q.)
...end
;---------------------------------------------------------------------------------------------------
..pre_firesnakes_room
%writeroom($08B, $040E) ; Room $008B: Ganon's Tower (Block Puzzle / Spike Skip / Map Chest Room) (......K......qqq)
%writeroom($09B, $8408) ; Room $009B: Ganon's Tower (Many Spikes / Warp Maze Room) (.d....K......q..)
...end
;---------------------------------------------------------------------------------------------------
..bombable_floor
%write8($7EF377, $12) ; Arrows
%write8($7EF376, $00) ; Arrow filler
%writeroom($09C, $000F) ; Room $009C: Ganon's Tower (Invisible Floor Maze Room) (.............qqq)
%writeroom($07D, $201E) ; Room $007D: Ganon's Tower (Winder / Warp Maze Room) (...d........qqqq)
%writeroom($09B, $840F) ; Room $009B: Ganon's Tower (Many Spikes / Warp Maze Room) (.d....K......qqq)
...end
;---------------------------------------------------------------------------------------------------
..floor_2
%write8($7EF377, $0A) ; Arrows
%write8($7EF389, $02) ; Key for dungeon $0D
%write16sram($7EF366, $73BC) ; BigKey1
%writeroom($01C, $0035) ; Room $001C: Ganon's Tower (Ice Armos) (...........cq.q.)
%writeroom($08C, $0409) ; Room $008C: Ganon's Tower (East and West Downstairs / Big Chest Room) (......K......q..)
...end
;---------------------------------------------------------------------------------------------------
..mimics1
%write8($7EF377, $09) ; Arrows
%writeroom($06B, $000C) ; Room $006B: Ganon's Tower (Mimics Rooms) (.............qq.)
...end
;---------------------------------------------------------------------------------------------------
..mimics2
%write8($7EF377, $0A) ; Arrows
%writeroom($06B, $000E) ; Room $006B: Ganon's Tower (Mimics Rooms) (.............qqq)
...end
;---------------------------------------------------------------------------------------------------
..spike_room
%write8($7EF377, $06) ; Arrows
%writeroom($06B, $800F) ; Room $006B: Ganon's Tower (Mimics Rooms) (.d...........qqq)
...end
;---------------------------------------------------------------------------------------------------
..gauntlet
%writeroom($05C, $000C) ; Room $005C: Ganon's Tower (Ganon-Ball Z) (.............qq.)
%writeroom($05B, $8005) ; Room $005B: Ganon's Tower (Spike Pit Room) (.d............q.)
...end
;---------------------------------------------------------------------------------------------------
..gauntlet_3
%write8($7EF377, $04) ; Arrows
%writeroom($05D, $000C) ; Room $005D: Ganon's Tower (Gauntlet 1/2/3) (.............qq.)
...end
;---------------------------------------------------------------------------------------------------
..lanmola2
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
%write8($7EF373, $1B) ; Magic filler
%write8($7EF36E, $69) ; Magic Power
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
%write8($7EF36D, $38) ; Health (actual)
%writeroom($03D, $4405) ; Room $003D: Ganon's Tower (Torch Room 2) (..d...K.......q.)
...end
;---------------------------------------------------------------------------------------------------
..moldorm_2
%write8($7EF343, $00) ; Bombs
%write8($7EF36F, $01) ; Keys
%write8($7EF36D, $30) ; Health (actual)
%writeroom($03D, $740F) ; Room $003D: Ganon's Tower (Torch Room 2) (..ddb.K......qqq)
...end
;---------------------------------------------------------------------------------------------------
..agahnim_2
%writeroom($04C, $0005) ; Room $004C: Ganon's Tower (Mini-Helmasaur Conveyor Room) (..............q.)
%writeroom($01D, $800C) ; Room $001D: Ganon's Tower (Final Hallway) (.d...........qq.)
%writeroom($04D, $800F) ; Room $004D: Ganon's Tower (Moldorm Room) (.d...........qqq)
...end
;---------------------------------------------------------------------------------------------------
.aga
;---------------------------------------------------------------------------------------------------
..pyramid
%write8($7EF2DB, $20) ; Overworld $5B: Unknown (...?....)
%write8($7EF36F, $FF) ; Keys
%write8($7EF3FF, $00) ; Deaths
%write8($7EF389, $01) ; Key for dungeon $0D
%write8($7EF3FD, $01) ; Deaths
%writeroom($00D, $0802) ; Room $000D: Ganon's Tower (Agahnim2[Boss]) (.....k.........q)
...end
;---------------------------------------------------------------------------------------------------
..gold_knights
%write8($7EF29B, $60) ; Overworld $1B: Unknown (..??....)
%write8($7EF36F, $00) ; Keys
%write8($7EF3CA, $00) ; LW/DW
%writeroom($0E0, $0002) ; Room $00E0: Agahnim's Tower (Entrance Room) (...............q)
...end
;---------------------------------------------------------------------------------------------------
..dark_room_of_despair
%write8($7EF36E, $30) ; Magic Power
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
%write8($7EF36D, $38) ; Health (actual)
%writeroom($0C0, $240F) ; Room $00C0: Agahnim's Tower (Dark Bridge Room) (...d..K......qqq)
...end
;---------------------------------------------------------------------------------------------------
..circle_of_pots
%write8($7EF36E, $00) ; Magic Power
%writeroom($0B0, $000C) ; Room $00B0: Agahnim's Tower (Circle of Pots) (.............qq.)
...end
;---------------------------------------------------------------------------------------------------
..catwalk
%write16sram($7EF360, $6D) ; Rupees (actual)
%writeroom($040, $0001) ; Room $0040: Agahnim's Tower (Final Bridge Room) (................)
%writeroom($0B0, $240F) ; Room $00B0: Agahnim's Tower (Circle of Pots) (...d..K......qqq)
...end
;---------------------------------------------------------------------------------------------------
..agahnim
%writeroom($030, $840A) ; Room $0030: Agahnim's Tower (Maiden Sacrifice Chamber) (.d....K......q.q)
%writeroom($040, $000B) ; Room $0040: Agahnim's Tower (Final Bridge Room) (.............q.q)
...end
;---------------------------------------------------------------------------------------------------
.ganon
;---------------------------------------------------------------------------------------------------
..pyramid
%write8($7EF36F, $FF) ; Keys
%write8($7EF3C7, $06) ; Map Phase
%write8($7EF3EB, $00) ; Deaths
%write8($7EF36D, $70) ; Health (actual)
%write8($7EF3C5, $03) ; Game Phase 1
%write8($7EF282, $20) ; Overworld $02: Unknown (...?....)
%write8($7EF36E, $80) ; Magic Power
%write8($7EF3CA, $40) ; LW/DW
%writeroom($020, $0802) ; Room $0020: Agahnim's Tower (Agahnim[Boss]) (.....k.........q)
...end
;---------------------------------------------------------------------------------------------------
.boss
;===================================================================================================
presetend_ad2020:
print "ad2020 size: $", hex(presetend_ad2020-presetheader_ad2020)