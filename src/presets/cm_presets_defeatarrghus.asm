;===================================================================================================
; PRESET DATA HEADER
;===================================================================================================
presetheader_defeatarrghus:
	dw presetSRAM_defeatarrghus ; location of SRAM
	dw presetpersistent_defeatarrghus ; location of persistent data

;===================================================================================================
%menu_header("Defeat Arrghus", 19)

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; ARRGHUS
;---------------------------------------------------------------------------------------------------
;===================================================================================================
;---------------------------------------------------------------------------------------------------
%preset_UW("Uncle's Bed", "defeatarrghus", "arrghus", "uncles_bed")
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
%preset_UW("Courtyard", "defeatarrghus", "arrghus", "courtyard")
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
%preset_OW("Castle", "defeatarrghus", "arrghus", "castle")
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
%preset_UW("Stairclip", "defeatarrghus", "arrghus", "stairclip")
dw $0061 ; Screen ID
dw $03E7, $0CF8 ; Link Coords
dw $0300, $0C8C ; Camera HV
db $00 ; Item
db $06 ; Direction
;-----------------------------
db $04 ; Entrance
db $D0 ; Room layout
db $0A ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Re-arm EG", "defeatarrghus", "arrghus", "re_arm_eg")
dw $0062 ; Screen ID
dw $0505, $0DDB ; Link Coords
dw $048D, $0D10 ; Camera HV
db $00 ; Item
db $02 ; Direction
;-----------------------------
db $04 ; Entrance
db $F0 ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Ball 'n Chains", "defeatarrghus", "arrghus", "ball_n_chains")
dw $0070 ; Screen ID
dw $0050, $0E20 ; Link Coords
dw $0048, $0E00 ; Camera HV
db $00 ; Item
db $00 ; Direction
;-----------------------------
db $04 ; Entrance
db $0F ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Trudge to Sanctuary", "defeatarrghus", "arrghus", "trudge_to_sanctuary")
dw $0080 ; Screen ID
dw $0138, $1014 ; Link Coords
dw $00C0, $1000 ; Camera HV
db $09 ; Item
db $00 ; Direction
;-----------------------------
db $04 ; Entrance
db $9E ; Room layout
db $0C ; Door / Peg state / Layer
dw $0004 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Stocking Up", "defeatarrghus", "arrghus", "stocking_up")
dw $0104 ; Screen ID
dw $0978, $21E1 ; Link Coords
dw $0900, $2110 ; Camera HV
db $09 ; Item
db $02 ; Direction
;-----------------------------
db $00 ; Entrance
db $20 ; Room layout
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Mini Moldorm Cape", "defeatarrghus", "arrghus", "mini_moldorm_cape")
dw $0035 ; Screen ID
dw $0A68, $0EF9 ; Link Coords
dw $0A00, $0E97 ; Camera HV
db $01 ; Item
db $00 ; Direction
;-----------------------------
dw $0A7D, $0F04 ; Scroll X,Y
dw $1480 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Leaving Sanctuary", "defeatarrghus", "arrghus", "leaving_sanctuary")
dw $0012 ; Screen ID
dw $04F8, $03E1 ; Link Coords
dw $0480, $0310 ; Camera HV
db $09 ; Item
db $02 ; Direction
;-----------------------------
db $02 ; Entrance
db $E0 ; Room layout
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Supply Run", "defeatarrghus", "arrghus", "supply_run")
dw $0011 ; Screen ID
dw $033F, $05E2 ; Link Coords
dw $02C1, $051E ; Camera HV
db $09 ; Item
db $02 ; Direction
;-----------------------------
dw $0346, $058B ; Scroll X,Y
dw $089A ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Fairy Catching", "defeatarrghus", "arrghus", "fairy_catching")
dw $0104 ; Screen ID
dw $0978, $2178 ; Link Coords
dw $0900, $2110 ; Camera HV
db $01 ; Item
db $02 ; Direction
;-----------------------------
db $00 ; Entrance
db $20 ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Tower EG", "defeatarrghus", "arrghus", "tower_eg")
dw $0060 ; Screen ID
dw $0178, $0DE1 ; Link Coords
dw $0100, $0D10 ; Camera HV
db $13 ; Item
db $02 ; Direction
;-----------------------------
db $04 ; Entrance
db $70 ; Room layout
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Catwalk EG", "defeatarrghus", "arrghus", "catwalk_eg")
dw $0030 ; Screen ID
dw $0048, $27DB ; Link Coords
dw $0000, $26EC ; Camera HV
db $01 ; Item
db $02 ; Direction
;-----------------------------
db $24 ; Entrance
db $21 ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Sewers EG", "defeatarrghus", "arrghus", "sewers_eg")
dw $0051 ; Screen ID
dw $02F8, $2A14 ; Link Coords
dw $0282, $2A00 ; Camera HV
db $01 ; Item
db $00 ; Direction
;-----------------------------
db $24 ; Entrance
db $C1 ; Room layout
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("East Hall EG", "defeatarrghus", "arrghus", "east_hall_eg")
dw $0051 ; Screen ID
dw $03E8, $2A0C ; Link Coords
dw $0300, $2A00 ; Camera HV
db $01 ; Item
db $06 ; Direction
;-----------------------------
db $24 ; Entrance
db $D1 ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Enter Swamp", "defeatarrghus", "arrghus", "enter_swamp")
dw $0065 ; Screen ID
dw $0BE8, $0DB2 ; Link Coords
dw $0AEC, $0CCF ; Camera HV
db $01 ; Item
db $06 ; Direction
;-----------------------------
db $24 ; Entrance
db $31 ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Fairy Fake Flippers", "defeatarrghus", "arrghus", "fairy_fake_flippers")
dw $0076 ; Screen ID
dw $0CE1, $0E78 ; Link Coords
dw $0C00, $0E0B ; Camera HV
db $01 ; Item
db $06 ; Direction
;-----------------------------
db $24 ; Entrance
db $41 ; Room layout
db $02 ; Door / Peg state / Layer
dw $0002 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Arrghus", "defeatarrghus", "arrghus", "arrghus")
dw $0026 ; Screen ID
dw $0C78, $04E1 ; Link Coords
dw $0C00, $0410 ; Camera HV
db $01 ; Item
db $02 ; Direction
;-----------------------------
db $24 ; Entrance
db $02 ; Room layout
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
presetpersistent_defeatarrghus:

;===================================================================================================
presetpersistent_defeatarrghus_arrghus:
;-----------------------------
.uncles_bed
%write_sq()
%write8($7E044A, $00) ; EG strength
%write8($7E047A, $00) ; Armed EG
..end
;-----------------------------
.courtyard
%write8($7E044A, $02) ; EG strength
..end
;-----------------------------
.castle
..end
;-----------------------------
.stairclip
..end
;-----------------------------
.re_arm_eg
%write8($7E044A, $01) ; EG strength
..end
;-----------------------------
.ball_n_chains
%write8($7E047A, $01) ; Armed EG
..end
;-----------------------------
.trudge_to_sanctuary
%write8($7E047A, $00) ; Armed EG
..end
;-----------------------------
.stocking_up
..end
;-----------------------------
.mini_moldorm_cape
..end
;-----------------------------
.leaving_sanctuary
%write8($7E044A, $02) ; EG strength
..end
;-----------------------------
.supply_run
..end
;-----------------------------
.fairy_catching
%write8($7E044A, $01) ; EG strength
%write8($7E047A, $01) ; Armed EG
..end
;-----------------------------
.tower_eg
..end
;-----------------------------
.catwalk_eg
%write8($7E044A, $02) ; EG strength
%write8($7E047A, $00) ; Armed EG
..end
;-----------------------------
.sewers_eg
%write8($7E044A, $01) ; EG strength
%write8($7E047A, $01) ; Armed EG
..end
;-----------------------------
.east_hall_eg
..end
;-----------------------------
.enter_swamp
%write8($7E047A, $00) ; Armed EG
..end
;-----------------------------
.fairy_fake_flippers
%write8($7E044A, $02) ; EG strength
..end
;-----------------------------
.arrghus
..end

;===================================================================================================
presetSRAM_defeatarrghus:
;-----------------------------
.arrghus
;-----------------------------
..uncles_bed
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
%write16sram($7EF360, $0001) ; Rupees
%writeroom($055, $000F)
...end
;-----------------------------
..castle
...end
;-----------------------------
..stairclip
%write8($7EF36F, $00) ; Keys
%writeroom($061, $000F)
...end
;-----------------------------
..re_arm_eg
%writeroom($062, $000F)
...end
;-----------------------------
..ball_n_chains
%write8($7EF36D, $10) ; Health
%writeroom($070, $0008)
%writeroom($071, $000C)
%writeroom($072, $000C)
...end
;-----------------------------
..trudge_to_sanctuary
%write8($7EF34A, $01) ; Lamp
%write8($7EF36D, $0C) ; Health
%write8($7EF3C8, $02) ; Spawn point
%write8($7EF3CC, $01) ; Follower
%write16sram($7EF366, $4000) ; Big keys
%writeroom($080, $043C)
...end
;-----------------------------
..stocking_up
%write8($7EF36D, $18) ; Health
%write8($7EF36F, $FF) ; Keys
%write8($7EF3C5, $02) ; Game state
%write8($7EF3C6, $15) ; Game flags A
%write8($7EF3C7, $01) ; Map marker
%write8($7EF3C8, $01) ; Spawn point
%write8($7EF3CC, $00) ; Follower
%write8($7EF29B, $20) ; OW screen $1B
%writeroom($010, $0005)
%writeroom($011, $000F)
%writeroom($012, $000F)
%writeroom($020, $0005)
%writeroom($030, $0005)
%writeroom($040, $0005)
%writeroom($050, $0005)
%writeroom($060, $0005)
%writeroom($070, $000D)
...end
;-----------------------------
..mini_moldorm_cape
%write8($7EF343, $02) ; Bombs
%write8($7EF36E, $10) ; Magic
%write8($7EF2B5, $02) ; OW screen $35
%writeroom($10B, $0013)
...end
;-----------------------------
..leaving_sanctuary
%write8($7EF343, $00) ; Bombs
%write8($7EF352, $01) ; Cape
%write8($7EF36C, $20) ; Max HP
%write8($7EF36D, $20) ; Health
%write8($7EF36F, $00) ; Keys
%write16sram($7EF360, $012D) ; Rupees
%writeroom($012, $001F)
%writeroom($113, $001A)
%writeroom($123, $040A)
...end
;-----------------------------
..supply_run
%write8($7EF36F, $FF) ; Keys
...end
;-----------------------------
..fairy_catching
%write8($7EF343, $0A) ; Bombs
%write8($7EF34D, $01) ; Net
%write8($7EF35C, $03) ; Bottle 1
%write8($7EF35D, $02) ; Bottle 2
%write8($7EF36D, $18) ; Health
%write8($7EF3C9, $02) ; Game flags B
%write16sram($7EF360, $0001) ; Rupees
%writeroom($02F, $0003)
%writeroom($102, $0002)
%writeroom($103, $001A)
%writeroom($11F, $0001)
...end
;-----------------------------
..tower_eg
%write8($7EF34F, $01) ; Bottles
%write8($7EF35D, $06) ; Bottle 2
%write8($7EF36D, $20) ; Health
%write8($7EF36F, $00) ; Keys
%write16sram($7EF360, $0002) ; Rupees
...end
;-----------------------------
..catwalk_eg
%write8($7EF343, $09) ; Bombs
%write8($7EF36D, $18) ; Health
%write8($7EF36E, $01) ; Magic
%writeroom($000, $000A)
%writeroom($010, $000F)
%writeroom($020, $000F)
%writeroom($030, $000F)
%writeroom($0E0, $0002)
%writeroom($0F0, $000F)
...end
;-----------------------------
..sewers_eg
%write8($7EF36D, $10) ; Health
%writeroom($040, $000F)
%writeroom($041, $000F)
%writeroom($051, $000F)
...end
;-----------------------------
..east_hall_eg
%write8($7EF343, $08) ; Bombs
%write8($7EF36D, $08) ; Health
...end
;-----------------------------
..enter_swamp
%write8($7EF343, $07) ; Bombs
%writeroom($001, $000C)
%writeroom($052, $000F)
%writeroom($053, $0002)
%writeroom($063, $000D)
%writeroom($064, $0003)
%writeroom($065, $0003)
...end
;-----------------------------
..fairy_fake_flippers
%writeroom($066, $0003)
%writeroom($076, $000A)
...end
;-----------------------------
..arrghus
%write8($7EF343, $06) ; Bombs
%write8($7EF35D, $02) ; Bottle 2
%write8($7EF36D, $1C) ; Health
%writeroom($026, $000C)
%writeroom($076, $000E)
...end
;===================================================================================================
presetend_defeatarrghus:
print "defeatarrghus size: $", hex(presetend_defeatarrghus-presetheader_defeatarrghus)

