;===================================================================================================
; PRESET DATA HEADER
;===================================================================================================
presetheader_defeatagahnim:
	dw presetSRAM_defeatagahnim ; location of SRAM
	dw presetpersistent_defeatagahnim ; location of persistent data

;===================================================================================================
%menu_header("Defeat Agahnim", 7)

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; AGAHNIM
;---------------------------------------------------------------------------------------------------
;===================================================================================================
;---------------------------------------------------------------------------------------------------
%preset_UW("Link's Bed", "defeatagahnim", "agahnim", "links_bed")
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
%preset_UW("Courtyard", "defeatagahnim", "agahnim", "courtyard")
dw $0055 ; Screen ID
dw $0A78, $0BD8 ; Link Coords
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
%preset_OW("Castle", "defeatagahnim", "agahnim", "castle")
dw $001B ; Screen ID
dw $07F8, $06FA ; Link Coords
dw $0784, $069C ; Camera HV
db $00 ; Item
db $00 ; Direction
;-----------------------------
dw $0803, $0709 ; Scroll X,Y
dw $0532 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Stair Clip", "defeatagahnim", "agahnim", "stair_clip")
dw $0061 ; Screen ID
dw $0222, $0CF8 ; Link Coords
dw $0200, $0C8C ; Camera HV
db $00 ; Item
db $04 ; Direction
;-----------------------------
db $04 ; Entrance
db $C0 ; Room layout
db $0A ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("EG Trudge", "defeatagahnim", "agahnim", "eg_trudge")
dw $0060 ; Screen ID
dw $0160, $0D4F ; Link Coords
dw $0100, $0CE3 ; Camera HV
db $00 ; Item
db $02 ; Direction
;-----------------------------
db $04 ; Entrance
db $70 ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Catwalk", "defeatagahnim", "agahnim", "catwalk")
dw $0050 ; Screen ID
dw $0073, $0A14 ; Link Coords
dw $0073, $0A00 ; Camera HV
db $00 ; Item
db $00 ; Direction
;-----------------------------
db $04 ; Entrance
db $40 ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Agahnim", "defeatagahnim", "agahnim", "agahnim")
dw $0030 ; Screen ID
dw $0078, $0614 ; Link Coords
dw $0010, $0600 ; Camera HV
db $00 ; Item
db $00 ; Direction
;-----------------------------
db $04 ; Entrance
db $01 ; Room layout
db $01 ; Door / Peg state / Layer
dw $0001 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
presetpersistent_defeatagahnim:

;===================================================================================================
presetpersistent_defeatagahnim_agahnim:
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
.catwalk
..end
;-----------------------------
.agahnim
..end

;===================================================================================================
presetSRAM_defeatagahnim:
;-----------------------------
.agahnim
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
%writeroom($060, $0005)
...end
;-----------------------------
..catwalk
%writeroom($050, $000A)
%writeroom($060, $000F)
...end
;-----------------------------
..agahnim
%writeroom($030, $840A)
%writeroom($040, $000A)
...end
;===================================================================================================
presetend_defeatagahnim:
print "defeatagahnim size: $", hex(presetend_defeatagahnim-presetheader_defeatagahnim)