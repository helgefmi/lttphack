;===================================================================================================
; PRESET DATA HEADER
;===================================================================================================
presetheader_defeatblind:
	dw presetSRAM_defeatblind ; location of SRAM
	dw presetpersistent_defeatblind ; location of persistent data

;===================================================================================================
%menu_header("Defeat Blind", 22)

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; BLIND
;---------------------------------------------------------------------------------------------------
;===================================================================================================

;---------------------------------------------------------------------------------------------------
%preset_UW("Link's Bed", "defeatblind", "blind", "links_bed")
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
%preset_UW("Courtyard", "defeatblind", "blind", "courtyard")
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
%preset_OW("Castle", "defeatblind", "blind", "castle")
dw $001B ; Screen ID
dw $07F8, $06F9 ; Link Coords
dw $0784, $069B ; Camera HV
db $00 ; Item
db $00 ; Direction
;-----------------------------
dw $0803, $0708 ; Scroll X,Y
dw $0530 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Stair Clip", "defeatblind", "blind", "stair_clip")
dw $0061 ; Screen ID
dw $03E8, $0CF8 ; Link Coords
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
%preset_UW("Re-arm EG", "defeatblind", "blind", "re_arm_eg")
dw $0062 ; Screen ID
dw $0540, $0D2F ; Link Coords
dw $04C8, $0CC3 ; Camera HV
db $00 ; Item
db $02 ; Direction
;-----------------------------
db $04 ; Entrance
db $F0 ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Ball 'n Chains", "defeatblind", "blind", "ball_n_chains")
dw $0070 ; Screen ID
dw $0050, $0E20 ; Link Coords
dw $004B, $0E00 ; Camera HV
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
%preset_UW("Trudge to Sanctuary", "defeatblind", "blind", "trudge_to_sanctuary")
dw $0080 ; Screen ID
dw $01E8, $103D ; Link Coords
dw $0100, $1000 ; Camera HV
db $00 ; Item
db $06 ; Direction
;-----------------------------
db $04 ; Entrance
db $9E ; Room layout
db $0C ; Door / Peg state / Layer
dw $0004 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Trudge to Thieves' Town", "defeatblind", "blind", "trudge_to_thieves_town")
dw $0012 ; Screen ID
dw $0428, $0204 ; Link Coords
dw $0400, $0200 ; Camera HV
db $00 ; Item
db $00 ; Direction
;-----------------------------
db $04 ; Entrance
db $CE ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "defeatblind", "blind", "entrance")
dw $0058 ; Screen ID
dw $01F8, $07B9 ; Link Coords
dw $0176, $075B ; Camera HV
db $00 ; Item
db $00 ; Direction
;-----------------------------
dw $0203, $07C8 ; Scroll X,Y
dw $0B2E ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Stalfos Hallway", "defeatblind", "blind", "stalfos_hallway")
dw $00CC ; Screen ID
dw $1978, $1814 ; Link Coords
dw $1900, $1800 ; Camera HV
db $00 ; Item
db $00 ; Direction
;-----------------------------
db $34 ; Entrance
db $DF ; Room layout
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Snakes and Lizards", "defeatblind", "blind", "snakes_and_lizards")
dw $00BC ; Screen ID
dw $190A, $1778 ; Link Coords
dw $1900, $170B ; Camera HV
db $00 ; Item
db $04 ; Direction
;-----------------------------
db $34 ; Entrance
db $7F ; Room layout
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Conveyor Gibos", "defeatblind", "blind", "conveyor_gibos")
dw $00BC ; Screen ID
dw $180A, $1778 ; Link Coords
dw $1800, $170B ; Camera HV
db $00 ; Item
db $04 ; Direction
;-----------------------------
db $34 ; Entrance
db $2F ; Room layout
db $02 ; Door / Peg state / Layer
dw $0200 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Actual Hellway", "defeatblind", "blind", "actual_hellway")
dw $00BB ; Screen ID
dw $170A, $1778 ; Link Coords
dw $1700, $170B ; Camera HV
db $00 ; Item
db $04 ; Direction
;-----------------------------
db $34 ; Entrance
db $3F ; Room layout
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write8_enable()
%write8($7E0ABD, $01) ; Palette swap
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Attic", "defeatblind", "blind", "attic")
dw $00AB ; Screen ID
dw $1678, $1520 ; Link Coords
dw $1600, $1500 ; Camera HV
db $00 ; Item
db $00 ; Direction
;-----------------------------
db $34 ; Entrance
db $2F ; Room layout
db $40 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Bombable Floor", "defeatblind", "blind", "bombable_floor")
dw $0065 ; Screen ID
dw $0AE8, $0D78 ; Link Coords
dw $0A00, $0D0B ; Camera HV
db $00 ; Item
db $06 ; Direction
;-----------------------------
db $34 ; Entrance
db $20 ; Room layout
db $42 ; Door / Peg state / Layer
dw $0004 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Backtracking", "defeatblind", "blind", "backtracking")
dw $0064 ; Screen ID
dw $0878, $0D20 ; Link Coords
dw $0800, $0D00 ; Camera HV
db $01 ; Item
db $00 ; Direction
;-----------------------------
db $34 ; Entrance
db $20 ; Room layout
db $40 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Basement", "defeatblind", "blind", "basement")
dw $00BC ; Screen ID
dw $1878, $1620 ; Link Coords
dw $1800, $1600 ; Camera HV
db $01 ; Item
db $00 ; Direction
;-----------------------------
db $34 ; Entrance
db $0F ; Room layout
db $40 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Conveyor Down", "defeatblind", "blind", "conveyor_down")
dw $0045 ; Screen ID
dw $0A0A, $0878 ; Link Coords
dw $0A00, $080B ; Camera HV
db $00 ; Item
db $04 ; Direction
;-----------------------------
db $34 ; Entrance
db $0E ; Room layout
db $C2 ; Door / Peg state / Layer
dw $000E ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Prison", "defeatblind", "blind", "prison")
dw $0045 ; Screen ID
dw $0AE8, $0978 ; Link Coords
dw $0A00, $090B ; Camera HV
db $00 ; Item
db $06 ; Direction
;-----------------------------
db $34 ; Entrance
db $2E ; Room layout
db $42 ; Door / Peg state / Layer
dw $000E ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Conveyor Up", "defeatblind", "blind", "conveyor_up")
dw $0045 ; Screen ID
dw $0A0A, $0978 ; Link Coords
dw $0A00, $090B ; Camera HV
db $00 ; Item
db $04 ; Direction
;-----------------------------
db $34 ; Entrance
db $2E ; Room layout
db $42 ; Door / Peg state / Layer
dw $000E ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Toilet Switch", "defeatblind", "blind", "toilet_switch")
dw $0045 ; Screen ID
dw $0A78, $0820 ; Link Coords
dw $0A00, $0800 ; Camera HV
db $00 ; Item
db $00 ; Direction
;-----------------------------
db $34 ; Entrance
db $0E ; Room layout
db $C0 ; Door / Peg state / Layer
dw $000E ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Blind", "defeatblind", "blind", "blind")
dw $00BC ; Screen ID
dw $1978, $1614 ; Link Coords
dw $1900, $1600 ; Camera HV
db $00 ; Item
db $00 ; Direction
;-----------------------------
db $34 ; Entrance
db $5F ; Room layout
db $41 ; Door / Peg state / Layer
dw $0002 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
presetpersistent_defeatblind:

;===================================================================================================
presetpersistent_defeatblind_blind:
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
.castle
..end
;-----------------------------
.stair_clip
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
.trudge_to_thieves_town
..end
;-----------------------------
.entrance
..end
;-----------------------------
.stalfos_hallway
..end
;-----------------------------
.snakes_and_lizards
..end
;-----------------------------
.conveyor_gibos
..end
;-----------------------------
.actual_hellway
..end
;-----------------------------
.attic
..end
;-----------------------------
.bombable_floor
..end
;-----------------------------
.backtracking
..end
;-----------------------------
.basement
..end
;-----------------------------
.conveyor_down
..end
;-----------------------------
.prison
..end
;-----------------------------
.conveyor_up
..end
;-----------------------------
.toilet_switch
..end
;-----------------------------
.blind
..end

;===================================================================================================
presetSRAM_defeatblind:
;-----------------------------
.blind
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
..castle
...end
;-----------------------------
..stair_clip
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
%write8($7EF36D, $0C) ; Health
%write8($7EF3C8, $02) ; Spawn point
%write8($7EF3CC, $01) ; Follower
%write16sram($7EF366, $4000) ; Big keys
%writeroom($080, $042C)
...end
;-----------------------------
..trudge_to_thieves_town
%write8($7EF3C5, $02) ; Game state
%write8($7EF3C6, $15) ; Game flags A
%write8($7EF3C7, $01) ; Map marker
%write8($7EF3C8, $01) ; Spawn point
%write8($7EF3CC, $00) ; Follower
%write8($7EF29B, $20) ; OW screen $1B
%writeroom($012, $000F)
%writeroom($021, $0003)
%writeroom($022, $000F)
%writeroom($031, $0007)
%writeroom($041, $000F)
%writeroom($051, $000F)
%writeroom($071, $000E)
%writeroom($081, $000F)
...end
;-----------------------------
..entrance
%write8($7EF36F, $FF) ; Keys
%write8($7EF2D8, $20) ; OW screen $58
%writeroom($002, $000F)
%writeroom($0DB, $000F)
%writeroom($0DC, $000F)
%writeroom($0DD, $0002)
%writeroom($0ED, $000F)
%writeroom($0EE, $000F)
%writeroom($0EF, $0003)
%writeroom($0F0, $000F)
%writeroom($0F1, $000F)
%writeroom($0F2, $0002)
...end
;-----------------------------
..stalfos_hallway
%write8($7EF36F, $00) ; Keys
%write16sram($7EF360, $0005) ; Rupees
%write16sram($7EF366, $4010) ; Big keys
%writeroom($0CC, $800F)
%writeroom($0DB, $002F)
...end
;-----------------------------
..snakes_and_lizards
%writeroom($0BC, $C405)
...end
;-----------------------------
..conveyor_gibos
%writeroom($0BC, $C407)
...end
;-----------------------------
..actual_hellway
%writeroom($0BB, $0001)
...end
;-----------------------------
..attic
%writeroom($0AB, $8402)
%writeroom($0BB, $000B)
...end
;-----------------------------
..bombable_floor
%writeroom($064, $0003)
%writeroom($065, $0002)
...end
;-----------------------------
..backtracking
%write8($7EF343, $01) ; Bombs
%writeroom($065, $0103)
...end
;-----------------------------
..basement
%writeroom($0BB, $000F)
%writeroom($0BC, $C40F)
...end
;-----------------------------
..conveyor_down
%write8($7EF343, $00) ; Bombs
%writeroom($045, $0008)
...end
;-----------------------------
..prison
%writeroom($044, $0005)
%writeroom($045, $000A)
...end
;-----------------------------
..conveyor_up
%write8($7EF36D, $14) ; Health
%write8($7EF3CC, $06) ; Follower
%writeroom($045, $00EF)
...end
;-----------------------------
..toilet_switch
...end
;-----------------------------
..blind
...end
;===================================================================================================
presetend_defeatblind:
print "defeatblind size: $", hex(presetend_defeatblind-presetheader_defeatblind)
