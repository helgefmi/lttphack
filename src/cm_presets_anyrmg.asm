
;===================================================================================================
; PRESET DATA HEADER
;===================================================================================================
presetheader_anyrmg:
	dw presetSRAM_anyrmg ; location of SRAM

;===================================================================================================
%menu_header("Any% RMG", 6)
	%submenu("Eastern Palace", presetmenu_anyrmg_eastern)
	%submenu("Hyrule Castle", presetmenu_anyrmg_escape)
	%submenu("Tempered Sword", presetmenu_anyrmg_tempered)
	%submenu("Ganon's Tower", presetmenu_anyrmg_gtower)
	%submenu("Ganon", presetmenu_anyrmg_ganon)
	%submenu("Bosses", presetmenu_anyrmg_boss)

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; EASTERN PALACE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_anyrmg_eastern:
%menu_header("Eastern Palace", 17)

;---------------------------------------------------------------------------------------------------
%preset_UW("Link's Bed", "anyrmg", "eastern", "bed")
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
%write16($7EC142, $0015) ; Underworld exit cache
%write16($7E0544, $17CA) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Courtyard 1", "anyrmg", "eastern", "courtyard_1")
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
%write8($7E0302, $00) ; Selected menu item
%write16_enable()
%write16($7E0696, $0001) ; Overworld Door
%write16($7E0542, $19E6) ; Object tilemap state
%write16($7E0540, $18E6) ; Object tilemap state
%write16($7E0544, $1850) ; Object tilemap state
%write_7F()
%write8($7FE0EF, $41) ; Room $B7 persistent: Turtle Rock (Map Chest / Key Chest / Roller Room)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Castle Entrance", "anyrmg", "eastern", "castle_entrance")
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
%preset_UW("Courtyard 2", "anyrmg", "eastern", "courtyard_2")
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
%preset_OW("Link's House Citrus", "anyrmg", "eastern", "links_house_citrus")
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
%preset_OW("Eastern Overworld", "anyrmg", "eastern", "outside_palace")
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
%preset_OW("Entrance", "anyrmg", "eastern", "entrance")
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
%preset_UW("Stalfos Room", "anyrmg", "eastern", "stalfos_room")
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
%write8($7E0B3E, $00) ; Arc variable
%write8($7E0B0C, $20) ; Arc variable
%write8($7E0B3C, $00) ; Arc variable
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
%preset_UW("Big Chest Room 1", "anyrmg", "eastern", "big_chest_room_1")
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
%preset_UW("Dark Antifairies Room", "anyrmg", "eastern", "dark_antifairies_room")
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
%preset_UW("Dark Key Room", "anyrmg", "eastern", "dark_key_room")
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
%preset_UW("Big Key DMG Boost", "anyrmg", "eastern", "big_key_dmg_boost")
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
%preset_UW("Big Chest Room 2", "anyrmg", "eastern", "big_chest_room_2")
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
%write16($7E0641, $0001) ; Room puzzle state (?)
%write16($7E0544, $1C8A) ; Object tilemap state
%write16($7E0548, $181E) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Gifted With Greenies", "anyrmg", "eastern", "gwg")
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
%preset_UW("Pot Room", "anyrmg", "eastern", "pot_room")
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
%preset_UW("Zeldagamer Room", "anyrmg", "eastern", "zeldagamer_room")
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
%preset_UW("Armos", "anyrmg", "eastern", "armos")
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
; HYRULE CASTLE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_anyrmg_escape:
%menu_header("Hyrule Castle", 16)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Eastern", "anyrmg", "escape", "outside_eastern")
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
%preset_UW("Eastern Spinspeed", "anyrmg", "escape", "eastern_spinspeed")
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
%write16($7E0544, $141E) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("DMA", "anyrmg", "escape", "dma")
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
%preset_UW("Death Mountain", "anyrmg", "escape", "death_mountain")
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
%preset_OW("Kiki Yeet", "anyrmg", "escape", "kiki_yeet")
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
%preset_OW("Kiki Skip", "anyrmg", "escape", "kiki_skip")
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
%preset_UW("PoD Main Hub (Big Key)", "anyrmg", "escape", "pod_main_hub_bk")
dw $004A ; Screen ID
dw $14F8, $281F ; Link Coords
dw $2800, $1480 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
db $00 ; Link direction
;-----------------------------
db $06 ; Entrance
db $80 ; Room layout
db $06 ; Main GFX
db $12 ; Music
db $01 ; Floor
db $FF ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write8($7E029F, $00) ; Arc variable
%write16_enable()
%write16($7E0696, $0006) ; Overworld Door
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
%preset_UW("PoD Main Hub (Hammerjump)", "anyrmg", "escape", "pod_main_hub_hammerjump")
dw $004A ; Screen ID
dw $14F8, $2821 ; Link Coords
dw $2800, $1480 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $01 ; Item
db $00 ; Link direction
;-----------------------------
db $21 ; Entrance
db $80 ; Room layout
db $06 ; Main GFX
db $12 ; Music
db $01 ; Floor
db $FF ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write8($7E047A, $01) ; Armed EG
%write8($7E0B3B, $00) ; Arc variable
%write8($7E0B0C, $D0) ; Arc variable
%write16_enable()
%write16($7E0696, $0006) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Hammerjump", "anyrmg", "escape", "hammerjump")
dw $002A ; Screen ID
dw $1478, $2420 ; Link Coords
dw $2400, $1400 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $01 ; Item
db $00 ; Link direction
;-----------------------------
db $21 ; Entrance
db $C0 ; Room layout
db $06 ; Main GFX
db $12 ; Music
db $01 ; Floor
db $FF ; Palace No
db $01 ; Door
db $00 ; Layer
;-----------------------------
%write8($7E047A, $00) ; Armed EG
%write16_enable()
%write16($7E0696, $0006) ; Overworld Door
%write16($7E0542, $1350) ; Object tilemap state
%write16($7E0540, $0C50) ; Object tilemap state
%write16($7E0544, $1328) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("River Clip", "anyrmg", "escape", "sanc_1")
dw $0012 ; Screen ID
dw $04F8, $03C3 ; Link Coords
dw $0310, $0480 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $01 ; Item
db $00 ; Link direction
;-----------------------------
db $21 ; Entrance
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
%preset_OW("Entrance", "anyrmg", "escape", "entrance")
dw $001B ; Screen ID
dw $08C8, $062C ; Link Coords
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
%preset_UW("1st Key Guard", "anyrmg", "escape", "1st_keyguard")
dw $0001 ; Screen ID
dw $02F8, $0053 ; Link Coords
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
%preset_UW("Not So Stealth Room", "anyrmg", "escape", "stealth_room")
dw $0082 ; Screen ID
dw $0409, $1180 ; Link Coords
dw $1110, $0400 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
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
%preset_UW("2nd Key Guard", "anyrmg", "escape", "2nd_keyguard")
dw $0071 ; Screen ID
dw $02B4, $0F78 ; Link Coords
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
%preset_UW("Zelda's Cell", "anyrmg", "escape", "zeldas_cell")
dw $0070 ; Screen ID
dw $0050, $0E24 ; Link Coords
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
%preset_UW("Sanctuary", "anyrmg", "escape", "sanc_2")
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
; TEMPERED SWORD
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_anyrmg_tempered:
%menu_header("Tempered Sword", 6)

;---------------------------------------------------------------------------------------------------
%preset_UW("Old Man Cave", "anyrmg", "tempered", "old_man_cave")
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
%preset_OW("Hera Entrance", "anyrmg", "tempered", "hera_entrance")
dw $0003 ; Screen ID
dw $08FD, $0478 ; Link Coords
dw $031E, $0887 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
db $02 ; Link direction
;-----------------------------
dw $0906, $038D ; Scroll X, Y
dw $1854 ; Unknown 1
dw $0000 ; Unknown 2
dw $0009 ; Unknown 3
;-----------------------------
%write_7F()
%write8($7FDFCB, $F3) ; Overworld $25 persistent: Octorok Area
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Beetles", "anyrmg", "tempered", "hera_beetles")
dw $0077 ; Screen ID
dw $0F68, $0F4C ; Link Coords
dw $0EE0, $0EF0 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
db $04 ; Link direction
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
%preset_UW("Petting Zoo", "anyrmg", "tempered", "hera_petting_zoo")
dw $0031 ; Screen ID
dw $03B8, $0678 ; Link Coords
dw $060B, $0300 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
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
%preset_OW("Frog DMD", "anyrmg", "tempered", "frog_dmd")
dw $0043 ; Screen ID
dw $0903, $0166 ; Link Coords
dw $0103, $088D ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
db $00 ; Link direction
;-----------------------------
dw $090C, $0172 ; Scroll X, Y
dw $0754 ; Unknown 1
dw $FFFB ; Unknown 2
dw $0003 ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Getting Tempered", "anyrmg", "tempered", "getting_tempered")
dw $0029 ; Screen ID
dw $0261, $0A89 ; Link Coords
dw $0A27, $0200 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $14 ; Item
db $06 ; Link direction
;-----------------------------
dw $028D, $0A94 ; Scroll X, Y
dw $0180 ; Unknown 1
dw $0009 ; Unknown 2
dw $0000 ; Unknown 3
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; GANON'S TOWER
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_anyrmg_gtower:
%menu_header("Ganon's Tower", 20)

;---------------------------------------------------------------------------------------------------
%preset_UW("Old Man Cave", "anyrmg", "gtower", "old_man_cave")
dw $00E4 ; Screen ID
dw $0878, $1D98 ; Link Coords
dw $1D10, $0800 ; Camera VH
db $60, $02, $88, $0A ; Mirror portal
db $14 ; Item
db $06 ; Link direction
;-----------------------------
db $10 ; Entrance
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
%preset_OW("Entrance", "anyrmg", "gtower", "entrance")
dw $0043 ; Screen ID
dw $08F8, $083E ; Link Coords
dw $031E, $0881 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
db $02 ; Link direction
;-----------------------------
dw $0900, $038D ; Scroll X, Y
dw $1854 ; Unknown 1
dw $0000 ; Unknown 2
dw $000F ; Unknown 3
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spike Skip", "anyrmg", "gtower", "spike_skip")
dw $008B ; Screen ID
dw $171A, $1078 ; Link Coords
dw $100C, $1700 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $04 ; Item
db $00 ; Link direction
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
%write8($7E0B0C, $50) ; Arc variable
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write16($7E0542, $171C) ; Object tilemap state
%write16($7E0546, $0864) ; Object tilemap state
%write16($7E054A, $085C) ; Object tilemap state
%write16($7E054E, $0C4C) ; Object tilemap state
%write16($7E0552, $144C) ; Object tilemap state
%write16($7E0556, $0864) ; Object tilemap state
%write16($7E0641, $0001) ; Room puzzle state (?)
%write16($7E0544, $1720) ; Object tilemap state
%write16($7E0548, $0760) ; Object tilemap state
%write16($7E054C, $0960) ; Object tilemap state
%write16($7E0550, $0C70) ; Object tilemap state
%write16($7E0554, $1C4C) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pre Firesnakes Room", "anyrmg", "gtower", "pre_firesnakes_room")
dw $009B ; Screen ID
dw $16D5, $1278 ; Link Coords
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
%write8($7E02A2, $00) ; Arc variable
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write16($7E0542, $0C30) ; Object tilemap state
%write16($7E0546, $1820) ; Object tilemap state
%write16($7E0468, $0001) ; Trap door state
%write16($7E0540, $0430) ; Object tilemap state
%write16($7E0544, $181C) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Ice Armos Bombable Floor", "anyrmg", "gtower", "bombable_floor")
dw $009C ; Screen ID
dw $1978, $1220 ; Link Coords
dw $1200, $1900 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $02 ; Item
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
%preset_UW("Floor 2", "anyrmg", "gtower", "floor_2")
dw $000C ; Screen ID
dw $18F8, $0022 ; Link Coords
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
%write16_enable()
%write16($7E0696, $000E) ; Overworld Door
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mimics 1", "anyrmg", "gtower", "mimics1")
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
%write16($7E0641, $0001) ; Room puzzle state (?)
%write16($7E0544, $081C) ; Object tilemap state
%write16($7E0548, $0B1C) ; Object tilemap state
%write16($7E054C, $195A) ; Object tilemap state
%write16($7E0550, $050C) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mimics 2", "anyrmg", "gtower", "mimics2")
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
%preset_UW("Spike Pit", "anyrmg", "gtower", "spike_room")
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
%preset_UW("Gauntlet 1", "anyrmg", "gtower", "gauntlet")
dw $005C ; Screen ID
dw $1978, $0A20 ; Link Coords
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
%preset_UW("Gauntlet 3", "anyrmg", "gtower", "gauntlet_3")
dw $005D ; Screen ID
dw $1A78, $0AD8 ; Link Coords
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
%preset_UW("Lanmola 2", "anyrmg", "gtower", "lanmola2")
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
%preset_UW("Wizzrobes 1", "anyrmg", "gtower", "wizz1")
dw $006C ; Screen ID
dw $1878, $0C28 ; Link Coords
dw $0C00, $1800 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
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
%preset_UW("Wizzrobes 2", "anyrmg", "gtower", "wizz2")
dw $00A5 ; Screen ID
dw $0B78, $1528 ; Link Coords
dw $1500, $0B00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
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
%preset_UW("Torches 1", "anyrmg", "gtower", "torches1")
dw $0095 ; Screen ID
dw $0BD4, $1278 ; Link Coords
dw $120B, $0B00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
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
%write16($7FE0CA, $08EF) ; Room $A5 persistent: Ganon's Tower (Wizzrobes Rooms)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Torches 2", "anyrmg", "gtower", "torches2")
dw $0096 ; Screen ID
dw $0D78, $13A5 ; Link Coords
dw $1310, $0D00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $03 ; Item
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
%preset_UW("Helma Key", "anyrmg", "gtower", "helma_key")
dw $003D ; Screen ID
dw $1B78, $0722 ; Link Coords
dw $0700, $1B00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
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
%preset_UW("Bombable Wall", "anyrmg", "gtower", "bombable_wall")
dw $003D ; Screen ID
dw $1B1B, $0678 ; Link Coords
dw $060B, $1B00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
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
%preset_UW("Moldorm 2", "anyrmg", "gtower", "moldorm_2")
dw $003D ; Screen ID
dw $1A78, $07D9 ; Link Coords
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
%write16($7E0552, $1C50) ; Object tilemap state
%write16($7E0468, $0001) ; Trap door state
%write16($7E0554, $1C6C) ; Object tilemap state
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Agahnim 2", "anyrmg", "gtower", "agahnim_2")
dw $001D ; Screen ID
dw $1A78, $0223 ; Link Coords
dw $0200, $1A00 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
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
presetmenu_anyrmg_ganon:
%menu_header("Ganon", 1)

;---------------------------------------------------------------------------------------------------
%preset_OW("Pyramid", "anyrmg", "ganon", "pyramid")
dw $005B ; Screen ID
dw $07F0, $065C ; Link Coords
dw $0600, $0778 ; Camera VH
db $00, $00, $00, $00 ; Mirror portal
db $09 ; Item
db $00 ; Link direction
;-----------------------------
dw $07F7, $066D ; Scroll X, Y
dw $002E ; Unknown 1
dw $0000 ; Unknown 2
dw $FFF8 ; Unknown 3
;-----------------------------
%write8($7E02A2, $FE) ; Arc variable
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; BOSSES
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_anyrmg_boss:
%menu_header("Bosses", 0)
;===================================================================================================

;===================================================================================================
presetpersistent_anyrmg_eastern:
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
.links_house_citrus
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
%write8($7E0B36, $00) ; Arc variable
%write8($7E0B34, $00) ; Arc variable
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
presetpersistent_anyrmg_escape:
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
.pod_main_hub_bk
..end
;-----------------------------
.pod_main_hub_hammerjump
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
.sanc_1
%write8_enable()
%write8($7E0B37, $A0) ; Arc variable
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
presetpersistent_anyrmg_tempered:
;-----------------------------
.old_man_cave
..end
;-----------------------------
.hera_entrance
%write8_enable()
%write8($7E0B37, $00) ; Arc variable
%write_end()
..end
;-----------------------------
.hera_beetles
..end
;-----------------------------
.hera_petting_zoo
..end
;-----------------------------
.frog_dmd
..end
;-----------------------------
.getting_tempered
..end

;===================================================================================================
presetpersistent_anyrmg_gtower:
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
%write8_enable()
%write8($7E0B35, $30) ; Arc variable
%write8($7E0B33, $30) ; Arc variable
%write8($7E0B37, $CF) ; Arc variable
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
%write8($7E0FCB, $02) ; Prize pack index
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
%write8($7E0B37, $09) ; Arc variable
%write8($7E0FC7, $03) ; Prize pack index
%write_end()
..end
;-----------------------------
.torches2
%write8_enable()
%write8($7E0B37, $0B) ; Arc variable
%write_end()
..end
;-----------------------------
.helma_key
%write8_enable()
%write8($7E0B37, $06) ; Arc variable
%write_end()
..end
;-----------------------------
.bombable_wall
%write8_enable()
%write8($7E0B37, $03) ; Arc variable
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
presetpersistent_anyrmg_ganon:
;-----------------------------
.pyramid
..end

;===================================================================================================
presetpersistent_anyrmg_boss:
;===================================================================================================
presetSRAM_anyrmg:
;---------------------------------------------------------------------------------------------------
.eastern
;---------------------------------------------------------------------------------------------------
..bed
%write8($7EF36F, $FF) ; Keys
%write8($7EF36C, $1818) ; Health (goal)
%write8($7EF378, $F800) ; ????
%write8($7EF3D8, $4E00) ; 
%write8($7EF3DC, $8C01) ; Player name
%write8($7EF3E0, $AA01) ; Player name
%write8($7EF400, $FF00) ; Deaths
%write8($7EF3DA, $8C01) ; Player name
%write8($7EF3DE, $8C01) ; Player name
%write8($7EF3E2, $55) ; Player name
%write8($7EF402, $FF) ; Deaths
%write8($7EF4FE, $CDEA) ; Inverse checksum
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
%write8($7EF358, $100) ; 
%write8($7EF3C4, $100) ; 
%write8($7EF36D, $18) ; Health (actual)
%write8($7EF3FE, $100) ; Deaths
%write8($7EF4FE, $CAA4) ; Inverse checksum
%writeroom($061, $000F) ; Room $0061: Hyrule Castle (Main Entrance Room) (.............qqq)
...end
;---------------------------------------------------------------------------------------------------
..links_house_citrus
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
%write8($7EF362, $05) ; Rupees (actual)
%writeroom($0BA, $840C) ; Room $00BA: Eastern Palace (Dark Antifairy / Key Pot Room) (.d....K......qq.)
%writeroom($0B9, $800F) ; Room $00B9: Eastern Palace (Lobby Cannonballs Room) (.d...........qqq)
...end
;---------------------------------------------------------------------------------------------------
..big_chest_room_2
%write8($7EF36D, $0C) ; Health (actual)
%write8($7EF366, $2000) ; BigKey1
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
%write8($7EF362, $0B) ; Rupees (actual)
%writeroom($0D8, $0005) ; Room $00D8: Eastern Palace (Zeldagamer Room / Pre-Armos Knights Room) (..............q.)
...end
;---------------------------------------------------------------------------------------------------
.escape
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
..pod_main_hub_bk
%write8($7EF36F, $FE) ; Keys
%write8($7EF36D, $18) ; Health (actual)
%writeroom($04A, $200F) ; Room $004A: Palace of Darkness (Entrance Room) (...d.........qqq)
%writeroom($009, $0008) ; Room $0009: Palace of Darkness (.............q..)
%writeroom($0F9, $000F) ; Room $00F9: Cave (.............qqq)
...end
;---------------------------------------------------------------------------------------------------
..pod_main_hub_hammerjump
%write8($7EF343, $02) ; Bombs
%write8($7EF36F, $FD) ; Keys
%write8($7EF36D, $20) ; Health (actual)
%write8($7EF366, $F020) ; BigKey1
%writeroom($00A, $800F) ; Room $000A: Palace of Darkness (Stalfos Trap Room) (.d...........qqq)
%writeroom($03A, $801F) ; Room $003A: Palace of Darkness (Bombable Floor Room) (.d..........qqqq)
%writeroom($009, $000C) ; Room $0009: Palace of Darkness (.............qq.)
...end
;---------------------------------------------------------------------------------------------------
..hammerjump
%write8($7EF36F, $FC) ; Keys
%writeroom($02A, $400F) ; Room $002A: Palace of Darkness (Big Hub Room) (..d..........qqq)
...end
;---------------------------------------------------------------------------------------------------
..sanc_1
%write8($7EF34B, $01) ; Hammer
%write8($7EF36F, $00) ; Keys
%write8($7EF3FF, $01) ; Deaths
%write8($7EF354, $100) ; Gloves
%write8($7EF36C, $1820) ; Health (goal)
%write8($7EF378, $FC00) ; ????
%write8($7EF36D, $18) ; Health (actual)
%write8($7EF342, $200) ; Hookshot
%write8($7EF34A, $101) ; Torch
%write8($7EF352, $200) ; Magic Cape
%write8($7EF36E, $FC80) ; Magic Power
%write8($7EF376, $900) ; Arrow filler
%write8($7EF3C6, $311) ; Game Phase 2
%write8($7EF3E6, $100) ; 
%write8($7EF4FE, $4585) ; Inverse checksum
%writeroom($012, $000F) ; Room $0012: Sanctuary (.............qqq)
%writeroom($01A, $101A) ; Room $001A: Palace of Darkness (Big Chest Room) (....b.......qq.q)
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
%write8($7EF36E, $80) ; Magic Power
%write8($7EF3C6, $15) ; Game Phase 2
%write8($7EF4FE, $36CE) ; Inverse checksum
%writeroom($080, $002C) ; Room $0080: Hyrule Castle (Jail Cell Room) (...........c.qq.)
...end
;---------------------------------------------------------------------------------------------------
.tempered
;---------------------------------------------------------------------------------------------------
..old_man_cave
%write8($7EF36F, $FF) ; Keys
%write8($7EF3C7, $01) ; Map Phase
%write8($7EF3E3, $01) ; Player name
%write8($7EF36C, $2028) ; Health (goal)
%write8($7EF3C4, $200) ; 
%write8($7EF3C8, $01) ; Entrances Phase
%write8($7EF3CC, $00) ; Tagalong
%write8($7EF36D, $20) ; Health (actual)
%write8($7EF3C5, $02) ; Game Phase 1
%write8($7EF29A, $2000) ; Overworld $1A: Unknown (........)
%write8($7EF3C6, $115) ; Game Phase 2
%write8($7EF3E2, $155) ; Player name
%write8($7EF4FE, $EB4) ; Inverse checksum
%writeroom($012, $001F) ; Room $0012: Sanctuary (............qqqq)
%writeroom($0E4, $000A) ; Room $00E4: Cave (Lost Old Man Final Cave) (.............q.q)
...end
;---------------------------------------------------------------------------------------------------
..hera_entrance
...end
;---------------------------------------------------------------------------------------------------
..hera_beetles
%write8($7EF36F, $00) ; Keys
%writeroom($077, $000F) ; Room $0077: Tower of Hera (Entrance Room) (.............qqq)
...end
;---------------------------------------------------------------------------------------------------
..hera_petting_zoo
%write8($7EF343, $03) ; Bombs
%writeroom($031, $800F) ; Room $0031: Tower of Hera (Hardhat Beetles Room) (.d...........qqq)
...end
;---------------------------------------------------------------------------------------------------
..frog_dmd
%write8($7EF343, $02) ; Bombs
%write8($7EF357, $01) ; Moon Pearl
%write8($7EF36F, $FF) ; Keys
%write8($7EF36D, $18) ; Health (actual)
%write8($7EF3CA, $40) ; LW/DW
%writeroom($027, $001F) ; Room $0027: Tower of Hera (Big Chest) (............qqqq)
...end
;---------------------------------------------------------------------------------------------------
..getting_tempered
%write8($7EF3CC, $08) ; Tagalong
%write8($7EF3CA, $00) ; LW/DW
%writeroom($0F5, $0002) ; Room $00F5: House (Angry Brothers) (...............q)
...end
;---------------------------------------------------------------------------------------------------
.gtower
;---------------------------------------------------------------------------------------------------
..old_man_cave
%write8($7EF3FF, $02) ; Deaths
%write8($7EF358, $300) ; 
%write8($7EF3CC, $00) ; Tagalong
%write8($7EF359, $03) ; Sword
%write8($7EF36D, $20) ; Health (actual)
%write8($7EF3C9, $20) ; Game Phase 3
%write8($7EF356, $100) ; Flippers
%write8($7EF362, $01) ; Rupees (actual)
%write8($7EF36E, $FF80) ; Magic Power
%write8($7EF3FE, $200) ; Deaths
%write8($7EF4FE, $6B7D) ; Inverse checksum
%writeroom($121, $0002) ; Room $0121: Unknown (...............q)
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
%write8($7EF343, $01) ; Bombs
%write8($7EF377, $0E) ; Arrows
%write8($7EF36D, $18) ; Health (actual)
%write8($7EF376, $00) ; Arrow filler
%writeroom($09C, $000F) ; Room $009C: Ganon's Tower (Invisible Floor Maze Room) (.............qqq)
%writeroom($07D, $201E) ; Room $007D: Ganon's Tower (Winder / Warp Maze Room) (...d........qqqq)
%writeroom($09B, $840F) ; Room $009B: Ganon's Tower (Many Spikes / Warp Maze Room) (.d....K......qqq)
...end
;---------------------------------------------------------------------------------------------------
..floor_2
%write8($7EF377, $10) ; Arrows
%write8($7EF389, $02) ; Key for dungeon $0D
%write8($7EF366, $F024) ; BigKey1
%writeroom($01C, $0035) ; Room $001C: Ganon's Tower (Ice Armos) (...........cq.q.)
%writeroom($08C, $0489) ; Room $008C: Ganon's Tower (East and West Downstairs / Big Chest Room) (......K..c...q..)
...end
;---------------------------------------------------------------------------------------------------
..mimics1
%write8($7EF377, $0F) ; Arrows
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
%write8($7EF377, $0A) ; Arrows
%writeroom($05D, $000C) ; Room $005D: Ganon's Tower (Gauntlet 1/2/3) (.............qq.)
...end
;---------------------------------------------------------------------------------------------------
..lanmola2
%write8($7EF377, $08) ; Arrows
%writeroom($05D, $000E) ; Room $005D: Ganon's Tower (Gauntlet 1/2/3) (.............qqq)
%writeroom($06D, $000A) ; Room $006D: Ganon's Tower (Gauntlet 4/5) (.............q.q)
...end
;---------------------------------------------------------------------------------------------------
..wizz1
%writeroom($06C, $000B) ; Room $006C: Ganon's Tower (Lanmolas Room) (.............q.q)
...end
;---------------------------------------------------------------------------------------------------
..wizz2
%write8($7EF377, $06) ; Arrows
%writeroom($0A5, $000B) ; Room $00A5: Ganon's Tower (Wizzrobes Rooms) (.............q.q)
...end
;---------------------------------------------------------------------------------------------------
..torches1
%write8($7EF377, $04) ; Arrows
%writeroom($095, $0005) ; Room $0095: Ganon's Tower (Final Collapsing Bridge Room) (..............q.)
%writeroom($0A5, $000F) ; Room $00A5: Ganon's Tower (Wizzrobes Rooms) (.............qqq)
...end
;---------------------------------------------------------------------------------------------------
..torches2
%write8($7EF36D, $10) ; Health (actual)
%write8($7EF36E, $70) ; Magic Power
%writeroom($096, $000B) ; Room $0096: Ganon's Tower (Torches 1 Room) (.............q.q)
...end
;---------------------------------------------------------------------------------------------------
..helma_key
%write8($7EF36E, $60) ; Magic Power
%writeroom($03D, $0001) ; Room $003D: Ganon's Tower (Torch Room 2) (................)
...end
;---------------------------------------------------------------------------------------------------
..bombable_wall
%write8($7EF36F, $01) ; Keys
%writeroom($03D, $4005) ; Room $003D: Ganon's Tower (Torch Room 2) (..d...........q.)
...end
;---------------------------------------------------------------------------------------------------
..moldorm_2
%write8($7EF343, $00) ; Bombs
%write8($7EF36F, $00) ; Keys
%writeroom($03D, $700F) ; Room $003D: Ganon's Tower (Torch Room 2) (..ddb........qqq)
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
%write8($7EF3FF, $00) ; Deaths
%write8($7EF389, $00) ; Key for dungeon $0D
%write8($7EF3FD, $02) ; Deaths
%writeroom($00D, $0802) ; Room $000D: Ganon's Tower (Agahnim2[Boss]) (.....k.........q)
...end
;---------------------------------------------------------------------------------------------------
.boss
;===================================================================================================
presetend_anyrmg:
print "anyrmg size: $", hex(presetend_anyrmg-presetheader_anyrmg)