;===================================================================================================
; PRESET DATA HEADER
;===================================================================================================
presetheader_defeatmothula:
	dw presetSRAM_defeatmothula ; location of SRAM
	dw presetpersistent_defeatmothula ; location of persistent data

;===================================================================================================
%menu_header("Defeat Mothula", 12)

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; MOTHULA
;---------------------------------------------------------------------------------------------------
;===================================================================================================
;---------------------------------------------------------------------------------------------------
%preset_UW("Link's Bed", "defeatmothula", "mothula", "links_bed")
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
%preset_UW("Courtyard", "defeatmothula", "mothula", "courtyard")
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
%preset_OW("Castle", "defeatmothula", "mothula", "castle")
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
%preset_UW("Stair Clip", "defeatmothula", "mothula", "stair_clip")
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
%preset_UW("EG Trudge", "defeatmothula", "mothula", "eg_trudge")
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
%preset_UW("Don't Softlock", "defeatmothula", "mothula", "dont_softlock")
dw $0086 ; Screen ID
dw $0DE8, $100C ; Link Coords
dw $0D00, $1002 ; Camera HV
db $00 ; Item
db $06 ; Direction
;-----------------------------
db $04 ; Entrance
db $10 ; Room layout
db $8C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Bunny DMD", "defeatmothula", "mothula", "bunny_dmd")
dw $0043 ; Screen ID
dw $0903, $0169 ; Link Coords
dw $088D, $0103 ; Camera HV
db $00 ; Item
db $02 ; Direction
;-----------------------------
dw $090C, $0172 ; Scroll X,Y
dw $0754 ; Tilemap position
;-----------------------------
%write8_enable()
%write8($7E005D, $17)
%write8($7E0056, $01)
%write8($7E02E0, $01)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Short Hop to Skull Woods", "defeatmothula", "mothula", "short_hop_to_skull_woods")
dw $0053 ; Screen ID
dw $0608, $0558 ; Link Coords
dw $0600, $0499 ; Camera HV
db $00 ; Item
db $04 ; Direction
;-----------------------------
dw $067F, $051E ; Scroll X,Y
dw $0482 ; Tilemap position
;-----------------------------
%write8_enable()
%write8($7E005D, $17)
%write8($7E0056, $01)
%write8($7E02E0, $01)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Skull Woods", "defeatmothula", "mothula", "skull_woods")
dw $0051 ; Screen ID
dw $0388, $0405 ; Link Coords
dw $0300, $0400 ; Camera HV
db $00 ; Item
db $00 ; Direction
;-----------------------------
dw $0385, $0485 ; Scroll X,Y
dw $0020 ; Tilemap position
;-----------------------------
%write8_enable()
%write8($7E005D, $17)
%write8($7E0056, $01)
%write8($7E02E0, $01)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Unbunny", "defeatmothula", "mothula", "unbunny")
dw $0040 ; Screen ID
dw $02E8, $0259 ; Link Coords
dw $026A, $01F5 ; Camera HV
db $00 ; Item
db $00 ; Direction
;-----------------------------
dw $02EF, $0264 ; Scroll X,Y
dw $0F4E ; Tilemap position
;-----------------------------
%write8_enable()
%write8($7E005D, $17)
%write8($7E0056, $01)
%write8($7E02E0, $01)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pumping", "defeatmothula", "mothula", "pumping")
dw $0058 ; Screen ID
dw $1078, $0BD8 ; Link Coords
dw $1000, $0B10 ; Camera HV
db $00 ; Item
db $00 ; Direction
;-----------------------------
db $2A ; Entrance
db $2F ; Room layout
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mothula", "defeatmothula", "mothula", "mothula")
dw $0039 ; Screen ID
dw $137E, $0604 ; Link Coords
dw $1300, $0603 ; Camera HV
db $00 ; Item
db $00 ; Direction
;-----------------------------
db $2A ; Entrance
db $1F ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
presetpersistent_defeatmothula:

;===================================================================================================
presetpersistent_defeatmothula_mothula:
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
.eg_trudge
%write8($7E044A, $01) ; EG strength
..end
;-----------------------------
.dont_softlock
%write8($7E047A, $01) ; Armed EG
..end
;-----------------------------
.bunny_dmd
..end
;-----------------------------
.short_hop_to_skull_woods
..end
;-----------------------------
.skull_woods
..end
;-----------------------------
.unbunny
..end
;-----------------------------
.pumping
..end
;-----------------------------
.mothula
%write8($7E047A, $00) ; Armed EG
..end

;===================================================================================================
presetSRAM_defeatmothula:
;-----------------------------
.mothula
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
..eg_trudge
%writeroom($062, $000F)
...end
;-----------------------------
..dont_softlock
%write8($7EF36D, $10) ; Health
%writeroom($063, $0002)
%writeroom($072, $000C)
%writeroom($073, $000D)
%writeroom($074, $0003)
%writeroom($084, $000F)
%writeroom($085, $000F)
%writeroom($086, $000C)
...end
;-----------------------------
..bunny_dmd
%write8($7EF36F, $FF) ; Keys
%write8($7EF3CA, $40) ; LW/DW
%writeroom($077, $000F)
%writeroom($087, $0008)
...end
;-----------------------------
..short_hop_to_skull_woods
...end
;-----------------------------
..skull_woods
...end
;-----------------------------
..unbunny
...end
;-----------------------------
..pumping
%write8($7EF36D, $18) ; Health
%write8($7EF36F, $00) ; Keys
%write8($7EF3CA, $00) ; LW/DW
%writeroom($058, $0002)
...end
;-----------------------------
..mothula
%write8($7EF36D, $10) ; Health
%writeroom($038, $0005)
%writeroom($039, $000E)
%writeroom($048, $0005)
%writeroom($058, $000E)
...end
;===================================================================================================
presetend_defeatmothula:
print "defeatmothula size: $", hex(presetend_defeatmothula-presetheader_defeatmothula)
