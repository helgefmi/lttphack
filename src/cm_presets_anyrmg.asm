;===================================================================================================
; PRESET DATA HEADER
;===================================================================================================
presetheader_anyrmg:
	dw presetSRAM_anyrmg ; location of SRAM
	dw presetpersistent_anyrmg ; location of persistent data

;===================================================================================================
%menu_header("Any% RMG", 5)
	%submenu("Eastern Palace", presetmenu_anyrmg_eastern)
	%submenu("Escape", presetmenu_anyrmg_escape)
	%submenu("Tempered Sword", presetmenu_anyrmg_tempered)
	%submenu("Ganon's Tower", presetmenu_anyrmg_gtower)
	%submenu("Ganon", presetmenu_anyrmg_ganon)

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
%preset_UW("Courtyard 1", "anyrmg", "eastern", "courtyard_1")
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
%preset_OW("Castle Entrance", "anyrmg", "eastern", "castle_entrance")
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
%preset_UW("Courtyard 2", "anyrmg", "eastern", "courtyard_2")
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
%preset_OW("River Dance", "anyrmg", "eastern", "river_dance")
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
%preset_OW("Eastern Overworld", "anyrmg", "eastern", "outside_palace")
dw $002E ; Screen ID
dw $0C90, $0A04 ; Link Coords
dw $0C1E, $0A00 ; Camera HV
db $09 ; Item
db $06 ; Link direction
;-----------------------------
dw $0C9B, $0A6D ; Scroll X,Y
dw $0002 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $FFF2 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "anyrmg", "eastern", "entrance")
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
%preset_UW("Stalfos Room", "anyrmg", "eastern", "stalfos_room")
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
%preset_UW("Big Chest Room 1", "anyrmg", "eastern", "big_chest_room_1")
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
%preset_UW("Dark Antifairies Room", "anyrmg", "eastern", "dark_antifairies_room")
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
%preset_UW("Dark Key Room", "anyrmg", "eastern", "dark_key_room")
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
%preset_UW("Big Key Damage Boost", "anyrmg", "eastern", "big_key_dmg_boost")
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
%preset_UW("Big Chest Room 2", "anyrmg", "eastern", "big_chest_room_2")
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
%preset_UW("Gifted with Greenies", "anyrmg", "eastern", "gwg")
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
%preset_UW("Pot Room", "anyrmg", "eastern", "pot_room")
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
%preset_UW("Zeldagamer Room", "anyrmg", "eastern", "zeldagamer_room")
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
%preset_UW("Armos", "anyrmg", "eastern", "armos")
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
; HYRULE CASTLE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_anyrmg_escape:
%menu_header("Escape", 16)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Eastern", "anyrmg", "escape", "outside_eastern")
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
%preset_UW("Eastern Spinspeed", "anyrmg", "escape", "eastern_spinspeed")
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
%write8($7EC165, $20) ; Underworld exit cache
%write8($7EC166, $25) ; Underworld exit cache
%write8($7EC167, $00) ; Underworld exit cache
%write16_enable()
%write16($7EC140, $001E) ; Underworld exit cache
%write16($7EC142, $0116) ; Underworld exit cache
%write16($7EC144, $06D8) ; Underworld exit cache
%write16($7EC146, $0C76) ; Underworld exit cache
%write16($7EC148, $0738) ; Underworld exit cache
%write16($7EC14A, $0CF0) ; Underworld exit cache
%write16($7EC14C, $001E) ; Underworld exit cache
%write16($7EC14E, $0710) ; Underworld exit cache
%write16($7EC150, $0745) ; Underworld exit cache
%write16($7EC152, $0CFB) ; Underworld exit cache
%write16($7EC154, $0600) ; Underworld exit cache
%write16($7EC156, $091E) ; Underworld exit cache
%write16($7EC158, $0C00) ; Underworld exit cache
%write16($7EC15A, $0F00) ; Underworld exit cache
%write16($7EC15C, $0520) ; Underworld exit cache
%write16($7EC15E, $0A00) ; Underworld exit cache
%write16($7EC160, $0B00) ; Underworld exit cache
%write16($7EC162, $1000) ; Underworld exit cache
%write16($7EC16A, $0008) ; Underworld exit cache
%write16($7EC16C, $FFF8) ; Underworld exit cache
%write16($7EC16E, $000A) ; Underworld exit cache
%write16($7EC170, $FFF6) ; Underworld exit cache
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("DMA", "anyrmg", "escape", "dma")
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
%preset_UW("Death Mountain", "anyrmg", "escape", "death_mountain")
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
%preset_OW("Kiki Yeet", "anyrmg", "escape", "kiki_yeet")
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
%preset_OW("Kiki Skip", "anyrmg", "escape", "kiki_skip")
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
%preset_UW("PoD Main Hub (Big Key)", "anyrmg", "escape", "pod_main_hub_bk")
dw $004A ; Screen ID
dw $14F8, $281F ; Link Coords
dw $1480, $2800 ; Camera HV
db $01 ; Item
db $00 ; Link direction
;-----------------------------
db $21 ; Entrance
db $80 ; Room layout
db $01 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("PoD Main Hub (Hammerjump)", "anyrmg", "escape", "pod_main_hub_hammerjump")
dw $004A ; Screen ID
dw $14F8, $2821 ; Link Coords
dw $1480, $2800 ; Camera HV
db $01 ; Item
db $00 ; Link direction
;-----------------------------
db $21 ; Entrance
db $80 ; Room layout
db $01 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Hammerjump", "anyrmg", "escape", "hammerjump")
dw $002A ; Screen ID
dw $1478, $2420 ; Link Coords
dw $1400, $2400 ; Camera HV
db $01 ; Item
db $00 ; Link direction
;-----------------------------
db $21 ; Entrance
db $C0 ; Room layout
db $01 ; Floor
db $01 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("River Clip", "anyrmg", "escape", "sanc_1")
dw $0012 ; Screen ID
dw $04F8, $03C3 ; Link Coords
dw $0480, $0310 ; Camera HV
db $03 ; Item
db $02 ; Link direction
;-----------------------------
db $02 ; Entrance
db $C2 ; Room layout
db $00 ; Floor
db $01 ; Door / Peg state
db $10 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "anyrmg", "escape", "entrance")
dw $001B ; Screen ID
dw $08C8, $062C ; Link Coords
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
%preset_UW("1st Key Guard", "anyrmg", "escape", "1st_keyguard")
dw $0001 ; Screen ID
dw $02F8, $0053 ; Link Coords
dw $0280, $0000 ; Camera HV
db $03 ; Item
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
%preset_UW("Not So Stealth Room", "anyrmg", "escape", "stealth_room")
dw $0082 ; Screen ID
dw $0409, $1180 ; Link Coords
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
%preset_UW("2nd Key Guard", "anyrmg", "escape", "2nd_keyguard")
dw $0071 ; Screen ID
dw $02B4, $0F78 ; Link Coords
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
%preset_UW("Zelda's Cell", "anyrmg", "escape", "zeldas_cell")
dw $0070 ; Screen ID
dw $0050, $0E24 ; Link Coords
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
%preset_UW("Sanctuary", "anyrmg", "escape", "sanc_2")
dw $0012 ; Screen ID
dw $04F8, $03BE ; Link Coords
dw $0480, $0310 ; Camera HV
db $14 ; Item
db $00 ; Link direction
;-----------------------------
db $02 ; Entrance
db $C2 ; Room layout
db $00 ; Floor
db $01 ; Door / Peg state
db $10 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
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
%preset_OW("Hera Entrance", "anyrmg", "tempered", "hera_entrance")
dw $0003 ; Screen ID
dw $08FD, $0478 ; Link Coords
dw $0887, $031E ; Camera HV
db $03 ; Item
db $04 ; Link direction
;-----------------------------
dw $0906, $038D ; Scroll X,Y
dw $1854 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $0009 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Beetles", "anyrmg", "tempered", "hera_beetles")
dw $0077 ; Screen ID
dw $0F68, $0F4C ; Link Coords
dw $0EF0, $0EE0 ; Camera HV
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
%preset_UW("Petting Zoo", "anyrmg", "tempered", "hera_petting_zoo")
dw $0031 ; Screen ID
dw $03B8, $0678 ; Link Coords
dw $0300, $060B ; Camera HV
db $03 ; Item
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
%preset_OW("Frog DMD", "anyrmg", "tempered", "frog_dmd")
dw $0043 ; Screen ID
dw $0903, $0166 ; Link Coords
dw $088D, $0103 ; Camera HV
db $14 ; Item
db $06 ; Link direction
;-----------------------------
dw $090C, $0172 ; Scroll X,Y
dw $0754 ; Tilemap position
;dw $FFFB ; Scroll mod Y
;dw $0003 ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Getting Tempered", "anyrmg", "tempered", "getting_tempered")
dw $0029 ; Screen ID
dw $0261, $0A89 ; Link Coords
dw $0200, $0A27 ; Camera HV
db $14 ; Item
db $06 ; Link direction
;-----------------------------
dw $028D, $0A94 ; Scroll X,Y
dw $0180 ; Tilemap position
;dw $0009 ; Scroll mod Y
;dw $0000 ; Scroll mod X
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
%preset_OW("Entrance", "anyrmg", "gtower", "entrance")
dw $0043 ; Screen ID
dw $08F8, $083E ; Link Coords
dw $0881, $031E ; Camera HV
db $04 ; Item
db $00 ; Link direction
;-----------------------------
dw $0900, $038D ; Scroll X,Y
dw $1854 ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $000F ; Scroll mod X
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spike Skip", "anyrmg", "gtower", "spike_skip")
dw $008B ; Screen ID
dw $171A, $1078 ; Link Coords
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
%preset_UW("Pre Firesnakes Room", "anyrmg", "gtower", "pre_firesnakes_room")
dw $009B ; Screen ID
dw $16D5, $1278 ; Link Coords
dw $1600, $120B ; Camera HV
db $02 ; Item
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
%preset_UW("Ice Armos Bombable Floor", "anyrmg", "gtower", "bombable_floor")
dw $009C ; Screen ID
dw $1978, $1220 ; Link Coords
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
%preset_UW("Floor 3", "anyrmg", "gtower", "floor_3")
dw $000C ; Screen ID
dw $18F8, $0022 ; Link Coords
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
%preset_UW("Mimics 1", "anyrmg", "gtower", "mimics1")
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
%preset_UW("Mimics 2", "anyrmg", "gtower", "mimics2")
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
%preset_UW("Spike Pit", "anyrmg", "gtower", "spike_room")
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
%preset_UW("Gauntlet 1", "anyrmg", "gtower", "gauntlet")
dw $005C ; Screen ID
dw $1978, $0A20 ; Link Coords
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
%preset_UW("Gauntlet 3", "anyrmg", "gtower", "gauntlet3")
dw $005D ; Screen ID
dw $1A78, $0AD8 ; Link Coords
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
%preset_UW("Lanmola 2", "anyrmg", "gtower", "lanmola2")
dw $006D ; Screen ID
dw $1A18, $0D78 ; Link Coords
dw $1A00, $0D0B ; Camera HV
db $03 ; Item
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
%preset_UW("Wizzrobes 1", "anyrmg", "gtower", "wizz1")
dw $006C ; Screen ID
dw $1878, $0C28 ; Link Coords
dw $1800, $0C00 ; Camera HV
db $03 ; Item
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
%preset_UW("Wizzrobes 2", "anyrmg", "gtower", "wizz2")
dw $00A5 ; Screen ID
dw $0B78, $1528 ; Link Coords
dw $0B00, $1500 ; Camera HV
db $03 ; Item
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
%preset_UW("Torches 1", "anyrmg", "gtower", "torches1")
dw $0095 ; Screen ID
dw $0BD4, $1278 ; Link Coords
dw $0B00, $120B ; Camera HV
db $03 ; Item
db $06 ; Link direction
;-----------------------------
db $37 ; Entrance
db $41 ; Room layout
db $04 ; Floor
db $02 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_7F_16()
%write16($7FE0CA, $08EF) ; Room $A5 sprite deaths
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Torches 2", "anyrmg", "gtower", "torches2")
dw $0096 ; Screen ID
dw $0D78, $13A5 ; Link Coords
dw $0D00, $1310 ; Camera HV
db $09 ; Item
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
%preset_UW("Helma Key", "anyrmg", "gtower", "helma_key")
dw $003D ; Screen ID
dw $1B78, $0718 ; Link Coords
dw $1B00, $0700 ; Camera HV
db $09 ; Item
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
%preset_UW("Bombable Wall", "anyrmg", "gtower", "bombable_wall")
dw $003D ; Screen ID
dw $1B1B, $0678 ; Link Coords
dw $1B00, $060B ; Camera HV
db $01 ; Item
db $04 ; Link direction
;-----------------------------
db $37 ; Entrance
db $01 ; Room layout
db $05 ; Floor
db $02 ; Door / Peg state
db $00 ; Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Moldorm 2", "anyrmg", "gtower", "moldorm_2")
dw $003D ; Screen ID
dw $1A78, $07D9 ; Link Coords
dw $1A00, $0710 ; Camera HV
db $09 ; Item
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
%preset_UW("Agahnim 2", "anyrmg", "gtower", "agahnim_2")
dw $001D ; Screen ID
dw $1A78, $0223 ; Link Coords
dw $1A00, $0200 ; Camera HV
db $09 ; Item
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
; GANON
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_anyrmg_ganon:
%menu_header("Ganon", 1)

;---------------------------------------------------------------------------------------------------
%preset_OW("Pyramid", "anyrmg", "ganon", "pyramid")
dw $005B ; Screen ID
dw $07F0, $065C ; Link Coords
dw $0778, $0600 ; Camera HV
db $09 ; Item
db $02 ; Link direction
;-----------------------------
dw $07F7, $066D ; Scroll X,Y
dw $002E ; Tilemap position
;dw $0000 ; Scroll mod Y
;dw $FFF8 ; Scroll mod X
;-----------------------------
%write_end()

;===================================================================================================
presetpersistent_anyrmg:

;===================================================================================================
presetpersistent_anyrmg_eastern:
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
.river_dance
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
..end
;-----------------------------
.dark_antifairies_room
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
..end
;===================================================================================================
presetpersistent_anyrmg_escape:
;-----------------------------
.outside_eastern
%write8($7E0B10, $31) ; Overlord X coordinate high byte
%write8($7E0B20, $11) ; Overlord Y coordinate high byte
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
%write8($7E047A, $01) ; Armed EG
..end
;-----------------------------
.hammerjump
%write8($7E047A, $00) ; Armed EG
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
presetpersistent_anyrmg_tempered:
;-----------------------------
.old_man_cave
%write_sq()
..end
;-----------------------------
.hera_entrance
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
%write_mirror($60, $02, $88, $0A)
..end

;===================================================================================================
presetpersistent_anyrmg_gtower:
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
%write8($7E0B09, $00) ; Arc variable
%write8($7E0B08, $40) ; Arc variable
..end
;-----------------------------
.mimics1
..end
;-----------------------------
.mimics2
..end
;-----------------------------
.spike_room
..end
;-----------------------------
.gauntlet
..end
;-----------------------------
.gauntlet3
..end
;-----------------------------
.lanmola2
..end
;-----------------------------
.wizz1
..end
;-----------------------------
.wizz2
..end
;-----------------------------
.torches1
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
presetpersistent_anyrmg_ganon:
;-----------------------------
.pyramid
..end

;===================================================================================================

presetSRAM_anyrmg:
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
..river_dance
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
.escape
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
..pod_main_hub_bk
%write8($7EF36F, $FE) ; Keys
%write8($7EF36D, $18) ; Health
%writeroom($04A, $200F)
%writeroom($009, $0008)
%writeroom($0F9, $000F)
...end
;-----------------------------
..pod_main_hub_hammerjump
%write8($7EF343, $02) ; Bombs
%write8($7EF36F, $FD) ; Keys
%write8($7EF36D, $20) ; Health
%write16sram($7EF366, $F020) ; Big keys
%writeroom($00A, $800F)
%writeroom($03A, $801F)
%writeroom($009, $000C)
...end
;-----------------------------
..hammerjump
%write8($7EF36F, $FC) ; Keys
%writeroom($02A, $400F)
...end
;-----------------------------
..sanc_1
%write8($7EF34B, $01) ; Hammer
%write8($7EF36F, $00) ; Keys
%write8($7EF36D, $18) ; Health
%write8($7EF377, $09) ; Arrows
%writeroom($012, $000F)
%writeroom($01A, $101A)
...end
;-----------------------------
..entrance
...end
;-----------------------------
..1st_keyguard
%write8($7EF36F, $00) ; Keys
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
%write8($7EF3C6, $15) ; Game flags A
%writeroom($080, $002C)
...end
;-----------------------------
.tempered
;-----------------------------
..old_man_cave
%write8($7EF36F, $FF) ; Keys
%write8($7EF3C7, $01) ; Map marker
%write8($7EF36C, $28) ; Max HP
%write8($7EF36D, $20) ; Health
%write8($7EF3C8, $01) ; Spawn point
%write8($7EF3CC, $00) ; Follower
%write8($7EF3C5, $02) ; Game state
%writeroom($012, $001F)
%writeroom($0E4, $000A)
...end
;-----------------------------
..hera_entrance
...end
;-----------------------------
..hera_beetles
%write8($7EF36F, $00) ; Keys
%writeroom($077, $000F)
...end
;-----------------------------
..hera_petting_zoo
%write8($7EF343, $03) ; Bombs
%writeroom($031, $800F)
...end
;-----------------------------
..frog_dmd
%write8($7EF343, $02) ; Bombs
%write8($7EF357, $01) ; Moon Pearl
%write8($7EF36D, $18) ; Health
%write8($7EF3CA, $40) ; LW/DW
%writeroom($027, $001F)
...end
;-----------------------------
..getting_tempered
%write8($7EF3CC, $08) ; Follower
%write8($7EF3CA, $00) ; LW/DW
%writeroom($0F5, $0002)
...end
;-----------------------------
.gtower
;-----------------------------
..old_man_cave
%write8($7EF3CC, $00) ; Follower
%write8($7EF359, $03) ; Sword
%write8($7EF36D, $20) ; Health
%write8($7EF3C9, $20) ; Game flags B
%write16sram($7EF360, $01) ; Rupees
%write8($7EF36F, $FF) ; Keys
%writeroom($121, $0002)
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
%write8($7EF343, $01) ; Bombs
%write8($7EF377, $0E) ; Arrows
%write8($7EF36D, $18) ; Health
%writeroom($09C, $000F)
%writeroom($07D, $201E)
%writeroom($09B, $840F)
...end
;-----------------------------
..floor_3
%write8($7EF377, $10) ; Arrows
%write8($7EF389, $02) ; Key for dungeon $0D
%write16sram($7EF366, $F024) ; Big keys
%writeroom($01C, $0035)
%writeroom($08C, $0489)
...end
;-----------------------------
..mimics1
%write8($7EF377, $0F) ; Arrows
%writeroom($06B, $000C)
...end
;-----------------------------
..mimics2
%write8($7EF377, $0B) ; Arrows
%writeroom($06B, $000E)
...end
;-----------------------------
..spike_room
%write8($7EF377, $07) ; Arrows
%writeroom($06B, $800F)
...end
;-----------------------------
..gauntlet
%writeroom($05C, $000C)
%writeroom($05B, $8005)
...end
;-----------------------------
..gauntlet3
%write8($7EF377, $0A) ; Arrows
%writeroom($05D, $000C)
...end
;-----------------------------
..lanmola2
%write8($7EF377, $08) ; Arrows
%writeroom($05D, $000E)
%writeroom($06D, $000A)
...end
;-----------------------------
..wizz1
%writeroom($06C, $000B)
...end
;-----------------------------
..wizz2
%write8($7EF377, $06) ; Arrows
%writeroom($0A5, $000B)
...end
;-----------------------------
..torches1
%write8($7EF377, $04) ; Arrows
%writeroom($095, $0005)
%writeroom($0A5, $000F)
...end
;-----------------------------
..torches2
%write8($7EF36D, $10) ; Health
%write8($7EF36E, $70) ; Magic
%writeroom($096, $000B)
...end
;-----------------------------
..helma_key
%write8($7EF36E, $60) ; Magic
%writeroom($03D, $0001)
...end
;-----------------------------
..bombable_wall
%write8($7EF36F, $01) ; Keys
%writeroom($03D, $4005)
...end
;-----------------------------
..moldorm_2
%write8($7EF343, $00) ; Bombs
%write8($7EF36F, $00) ; Keys
%writeroom($03D, $700F)
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
;===================================================================================================
presetend_anyrmg:
print "anyrmg size: $", hex(presetend_anyrmg-presetheader_anyrmg)