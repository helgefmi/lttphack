;===================================================================================================
; PRESET DATA HEADER
;===================================================================================================
presetheader_defeatvitreous:
	dw presetSRAM_defeatvitreous ; location of SRAM
	dw presetpersistent_defeatvitreous ; location of persistent data

;===================================================================================================
%menu_header("Defeat Vitreous", 16)

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; VITREOUS
;---------------------------------------------------------------------------------------------------
;===================================================================================================
;---------------------------------------------------------------------------------------------------
%preset_UW("Link's Bed", "defeatvitreous", "vitreous", "links_bed")
dw $0104 ; Screen ID
dw $0940, $215A ; Link Coords
dw $0900, $2110 ; Camera HV
db $00 ; Item
db $02 ; Direction
;-----------------------------
db $00 ; Entrance
db $20 ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Courtyard", "defeatvitreous", "vitreous", "courtyard")
dw $0055 ; Screen ID
dw $0A78, $0BE1 ; Link Coords
dw $0A00, $0B10 ; Camera HV
db $00 ; Item
db $02 ; Direction
;-----------------------------
db $7D ; Entrance
db $AF ; Room layout
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Lobby Quadrant Glitch", "defeatvitreous", "vitreous", "lobby_quadrant_glitch")
dw $001B ; Screen ID
dw $07F8, $06FA ; Link Coords
dw $0784, $069C ; Camera HV
db $00 ; Item
db $00 ; Direction
;-----------------------------
dw $0803, $0709 ; Scroll X,Y
dw $0530 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Ice Chair", "defeatvitreous", "vitreous", "ice_chair")
dw $004F ; Screen ID
dw $FFC8, $0E04 ; Link Coords
dw $FF02, $0C00 ; Camera HV
db $00 ; Item
db $00 ; Direction
;-----------------------------
db $04 ; Entrance
db $10 ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write16_enable()
%write16($7E0600, $0C00) ; Camera boundaries
%write16($7E0602, $0A00) ; Camera boundaries
%write16($7E0604, $0C10) ; Camera boundaries
%write16($7E0606, $0B10) ; Camera boundaries
%write16($7E0608, $FF00) ; Camera boundaries
%write16($7E060A, $FE00) ; Camera boundaries
%write16($7E060C, $FF00) ; Camera boundaries
%write16($7E060E, $FF00) ; Camera boundaries
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Supply Run", "defeatvitreous", "vitreous", "supply_run")
dw $002F ; Screen ID
dw $FF78, $0BE1 ; Link Coords
dw $FE98, $0910 ; Camera HV
db $00 ; Item
db $02 ; Direction
;-----------------------------
db $04 ; Entrance
db $B0 ; Room layout
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write16_enable()
%write16($7E0600, $0900) ; Camera boundaries
%write16($7E0602, $0600) ; Camera boundaries
%write16($7E0604, $0910) ; Camera boundaries
%write16($7E0606, $0710) ; Camera boundaries
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Leaving Kakariko", "defeatvitreous", "vitreous", "leaving_kakariko")
dw $0018 ; Screen ID
dw $0346, $0605 ; Link Coords
dw $02C4, $0600 ; Camera HV
db $01 ; Item
db $00 ; Direction
;-----------------------------
dw $0351, $066D ; Scroll X,Y
dw $0058 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Bridge to Witch Hut", "defeatvitreous", "vitreous", "bridge_to_witch_hut")
dw $0015 ; Screen ID
dw $0AA4, $05E2 ; Link Coords
dw $0A32, $051E ; Camera HV
db $01 ; Item
db $02 ; Direction
;-----------------------------
dw $0AAF, $058D ; Scroll X,Y
dw $0906 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Trudge to PoD", "defeatvitreous", "vitreous", "trudge_to_pod")
dw $0015 ; Screen ID
dw $0AA8, $0459 ; Link Coords
dw $0A2E, $0400 ; Camera HV
db $01 ; Item
db $00 ; Direction
;-----------------------------
dw $0AB3, $046F ; Scroll X,Y
dw $0084 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Beetle Colosseum", "defeatvitreous", "vitreous", "beetle_colosseum")
dw $002B ; Screen ID
dw $160A, $04F8 ; Link Coords
dw $1600, $048B ; Camera HV
db $00 ; Item
db $04 ; Direction
;-----------------------------
db $38 ; Entrance
db $4F ; Room layout
db $4A ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("PoD Entrance", "defeatvitreous", "vitreous", "pod_entrance")
dw $005E ; Screen ID
dw $0F50, $063B ; Link Coords
dw $0ED6, $0600 ; Camera HV
db $00 ; Item
db $02 ; Direction
;-----------------------------
dw $0F5B, $066D ; Scroll X,Y
dw $005A ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Death Hole", "defeatvitreous", "vitreous", "death_hole")
dw $004A ; Screen ID
dw $14F8, $0814 ; Link Coords
dw $1480, $0800 ; Camera HV
db $00 ; Item
db $00 ; Direction
;-----------------------------
db $26 ; Entrance
db $80 ; Room layout
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Trudge to Catwalk", "defeatvitreous", "vitreous", "trudge_to_catwalk")
dw $00FA ; Screen ID
dw $14C0, $FF30 ; Link Coords
dw $1448, $FEC5 ; Camera HV
db $01 ; Item
db $00 ; Direction
;-----------------------------
db $26 ; Entrance
db $E0 ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Sewers to Throne Room", "defeatvitreous", "vitreous", "sewers_to_throne_room")
dw $0040 ; Screen ID
dw $21E8, $060C ; Link Coords
dw $2100, $0602 ; Camera HV
db $01 ; Item
db $06 ; Direction
;-----------------------------
db $26 ; Entrance
db $50 ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Reload Enemies", "defeatvitreous", "vitreous", "reload_enemies")
dw $0051 ; Screen ID
dw $22F8, $0814 ; Link Coords
dw $2280, $0800 ; Camera HV
db $01 ; Item
db $00 ; Direction
;-----------------------------
db $26 ; Entrance
db $C0 ; Room layout
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("East Hall YBA", "defeatvitreous", "vitreous", "east_hall_yba")
dw $0001 ; Screen ID
dw $03E8, $0078 ; Link Coords
dw $0300, $000B ; Camera HV
db $01 ; Item
db $06 ; Direction
;-----------------------------
db $26 ; Entrance
db $90 ; Room layout
db $0E ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Vitreous", "defeatvitreous", "vitreous", "vitreous")
dw $F080 ; Screen ID
dw $01C8, $11DB ; Link Coords
dw $0102, $10EC ; Camera HV
db $0B ; Item
db $02 ; Direction
;-----------------------------
db $26 ; Entrance
db $B0 ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write16_enable()
%write16($7E0600, $1100) ; Camera boundaries
%write16($7E0602, $091E) ; Camera boundaries
%write16($7E0604, $1110) ; Camera boundaries
%write16($7E0606, $0F00) ; Camera boundaries
%write16($7E0608, $0100) ; Camera boundaries
%write16($7E060A, $0000) ; Camera boundaries
%write16($7E060C, $0100) ; Camera boundaries
%write16($7E060E, $0100) ; Camera boundaries
%write_end()

;===================================================================================================
presetpersistent_defeatvitreous:

;===================================================================================================
presetpersistent_defeatvitreous_vitreous:
;-----------------------------
.links_bed
%write_sq()
%write8($7E044A, $00) ; EG strength
%write8($7E047A, $00) ; Armed EG
..end
;-----------------------------
.courtyard
%write8($7E044A, $02) ; EG strength
..end
;-----------------------------
.lobby_quadrant_glitch
..end
;-----------------------------
.ice_chair
%write8($7E044A, $01) ; EG strength
..end
;-----------------------------
.supply_run
%write8($7E047A, $01) ; Armed EG
..end
;-----------------------------
.leaving_kakariko
..end
;-----------------------------
.bridge_to_witch_hut
..end
;-----------------------------
.trudge_to_pod
..end
;-----------------------------
.beetle_colosseum
%write8($7E044A, $02) ; EG strength
%write8($7E047A, $00) ; Armed EG
..end
;-----------------------------
.pod_entrance
..end
;-----------------------------
.death_hole
..end
;-----------------------------
.trudge_to_catwalk
%write8($7E044A, $01) ; EG strength
..end
;-----------------------------
.sewers_to_throne_room
%write8($7E047A, $01) ; Armed EG
..end
;-----------------------------
.reload_enemies
..end
;-----------------------------
.east_hall_yba
%write8($7E047A, $00) ; Armed EG
..end
;-----------------------------
.vitreous
..end

;===================================================================================================
presetSRAM_defeatvitreous:
;-----------------------------
.vitreous
;-----------------------------
..links_bed
%write8($7EF36F, $FF) ; Keys
%writeroom($104, $0002)
...end
;-----------------------------
..courtyard
%write8($7EF359, $01) ; Sword
%write8($7EF35A, $01) ; Shield
%write8($7EF3C5, $01) ; Game state
%write8($7EF3C6, $11) ; Game flags A
%write8($7EF3C8, $03) ; Spawn point
%writeroom($055, $000F)
...end
;-----------------------------
..lobby_quadrant_glitch
...end
;-----------------------------
..ice_chair
%write8($7EF36F, $00) ; Keys
%writeroom($04F, $0004)
%writeroom($050, $000F)
%writeroom($060, $0005)
%writeroom($061, $000F)
...end
;-----------------------------
..supply_run
%write8($7EF36D, $10) ; Health
%writeroom($02F, $0003)
%writeroom($03F, $0005)
%writeroom($040, $000F)
...end
;-----------------------------
..leaving_kakariko
%write8($7EF343, $01) ; Bombs
%write8($7EF35C, $02) ; Bottle 1
%write8($7EF36F, $FF) ; Keys
%write16sram($7EF360, $003C) ; Rupees
%writeroom($103, $001A)
%writeroom($119, $0003)
%writeroom($11D, $01A3)
...end
;-----------------------------
..bridge_to_witch_hut
...end
;-----------------------------
..trudge_to_pod
%write8($7EF35C, $04) ; Bottle 1
%write16sram($7EF360, $0000) ; Rupees
%writeroom($109, $0002)
...end
;-----------------------------
..beetle_colosseum
%write8($7EF343, $02) ; Bombs
%write8($7EF36D, $08) ; Health
%writeroom($008, $0001)
%writeroom($009, $0003)
%writeroom($00A, $000F)
%writeroom($01A, $000F)
%writeroom($01B, $0002)
%writeroom($02B, $000A)
...end
;-----------------------------
..pod_entrance
%write8($7EF343, $04) ; Bombs
%writeroom($02A, $000F)
%writeroom($03A, $800F)
%writeroom($04A, $200F)
...end
;-----------------------------
..death_hole
%write8($7EF343, $06) ; Bombs
%write8($7EF36F, $00) ; Keys
...end
;-----------------------------
..trudge_to_catwalk
%write8($7EF343, $04) ; Bombs
%write8($7EF34F, $01) ; Bottles
%write8($7EF36D, $18) ; Health
%writeroom($00A, $800F)
%writeroom($0FA, $000F)
...end
;-----------------------------
..sewers_to_throne_room
%write8($7EF36D, $10) ; Health
%writeroom($00F, $0004)
%writeroom($010, $000A)
%writeroom($020, $000A)
%writeroom($030, $000A)
%writeroom($0FB, $000F)
%writeroom($0FC, $000C)
%writeroom($0FD, $000F)
%writeroom($0FE, $000F)
%writeroom($0FF, $000B)
...end
;-----------------------------
..reload_enemies
%writeroom($041, $000F)
%writeroom($051, $000F)
...end
;-----------------------------
..east_hall_yba
%write8($7EF343, $03) ; Bombs
%write8($7EF36D, $08) ; Health
%writeroom($001, $000C)
%writeroom($052, $000F)
...end
;-----------------------------
..vitreous
%write8($7EF35C, $02) ; Bottle 1
%write8($7EF36D, $10) ; Health
%writeroom($062, $000F)
%writeroom($063, $0002)
%writeroom($070, $0005)
%writeroom($071, $000C)
%writeroom($072, $000C)
%writeroom($073, $0008)
%writeroom($080, $000F)
...end
;===================================================================================================
presetend_defeatvitreous:
print "defeatvitreous size: $", hex(presetend_defeatvitreous-presetheader_defeatvitreous)
