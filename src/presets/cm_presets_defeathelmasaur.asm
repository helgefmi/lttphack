;===================================================================================================
; PRESET DATA HEADER
;===================================================================================================
presetheader_defeathelmasaur:
	dw presetSRAM_defeathelmasaur ; location of SRAM
	dw presetpersistent_defeathelmasaur ; location of persistent data

;===================================================================================================
%menu_header("Defeat Helmasaur", 10)

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; HELMASAUR
;---------------------------------------------------------------------------------------------------
;===================================================================================================
;---------------------------------------------------------------------------------------------------
%preset_UW("Link's Bed", "defeathelmasaur", "helmasaur", "links_bed")
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
%preset_UW("Courtyard", "defeathelmasaur", "helmasaur", "courtyard")
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
%preset_OW("Lobby Quadrant Glitch", "defeathelmasaur", "helmasaur", "lobby_quadrant_glitch")
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
%preset_UW("Ice Chair", "defeathelmasaur", "helmasaur", "ice_chair")
dw $004F ; Screen ID
dw $FFD9, $0E15 ; Link Coords
dw $FF13, $0C00 ; Camera HV
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
%preset_OW("Back to Kak", "defeathelmasaur", "helmasaur", "back_to_kak")
dw $0018 ; Screen ID
dw $0058, $067F ; Link Coords
dw $0000, $061D ; Camera HV
db $00 ; Item
db $02 ; Direction
;-----------------------------
dw $008D, $068A ; Scroll X,Y
dw $0100 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Reverse Sexy Statue", "defeathelmasaur", "helmasaur", "reverse_sexy_statue")
dw $001B ; Screen ID
dw $1678, $03E1 ; Link Coords
dw $1673, $0310 ; Camera HV
db $01 ; Item
db $02 ; Direction
;-----------------------------
db $80 ; Entrance
db $2F ; Room layout
db $09 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Beetle Colosseum", "defeathelmasaur", "helmasaur", "beetle_colosseum")
dw $002B ; Screen ID
dw $160B, $04F8 ; Link Coords
dw $1600, $048B ; Camera HV
db $01 ; Item
db $04 ; Direction
;-----------------------------
db $80 ; Entrance
db $4F ; Room layout
db $4A ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Arm Statue Drag", "defeathelmasaur", "helmasaur", "arm_statue_drag")
dw $003A ; Screen ID
dw $14F8, $07E1 ; Link Coords
dw $1480, $0710 ; Camera HV
db $01 ; Item
db $02 ; Direction
;-----------------------------
db $80 ; Entrance
db $EF ; Room layout
db $41 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Statue Drag", "defeathelmasaur", "helmasaur", "statue_drag")
dw $005E ; Screen ID
dw $0F50, $063B ; Link Coords
dw $0ED6, $0600 ; Camera HV
db $01 ; Item
db $02 ; Direction
;-----------------------------
dw $0F5B, $066D ; Scroll X,Y
dw $005A ; Tilemap position
;-----------------------------
%write8_enable()
%write8($7E02FA, $01)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Helmasaur", "defeathelmasaur", "helmasaur", "helmasaur")
dw $004A ; Screen ID
dw $1578, $0AE1 ; Link Coords
dw $1500, $0900 ; Camera HV
db $01 ; Item
db $02 ; Direction
;-----------------------------
db $26 ; Entrance
db $B0 ; Room layout
db $81 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
presetpersistent_defeathelmasaur:

;===================================================================================================
presetpersistent_defeathelmasaur_helmasaur:
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
.back_to_kak
%write8($7E047A, $01) ; Armed EG
..end
;-----------------------------
.reverse_sexy_statue
%write8($7E044A, $02) ; EG strength
%write8($7E047A, $00) ; Armed EG
..end
;-----------------------------
.beetle_colosseum
..end
;-----------------------------
.arm_statue_drag
..end
;-----------------------------
.statue_drag
..end
;-----------------------------
.helmasaur
..end

;===================================================================================================
presetSRAM_defeathelmasaur:
;-----------------------------
.helmasaur
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
%writeroom($050, $000A)
%writeroom($060, $000F)
%writeroom($061, $000F)
...end
;-----------------------------
..back_to_kak
%write8($7EF36D, $10) ; Health
%write8($7EF36F, $FF) ; Keys
%writeroom($02F, $0003)
%writeroom($03F, $0005)
%writeroom($040, $000F)
...end
;-----------------------------
..reverse_sexy_statue
%write8($7EF343, $02) ; Bombs
%write8($7EF36D, $08) ; Health
%writeroom($01B, $0002)
%writeroom($02B, $000C)
%writeroom($02C, $000B)
%writeroom($02D, $0003)
%writeroom($02E, $0003)
%writeroom($02F, $0103)
...end
;-----------------------------
..beetle_colosseum
%write8($7EF343, $04) ; Bombs
%write8($7EF36D, $18) ; Health
%writeroom($02B, $000E)
...end
;-----------------------------
..arm_statue_drag
%write8($7EF36F, $FE) ; Keys
%writeroom($02A, $000F)
%writeroom($03A, $800F)
...end
;-----------------------------
..statue_drag
%write8($7EF343, $07) ; Bombs
%write8($7EF36F, $FF) ; Keys
%writeroom($009, $0004)
%writeroom($04A, $200F)
...end
;-----------------------------
..helmasaur
%write8($7EF36D, $10) ; Health
%write8($7EF36F, $00) ; Keys
...end
;===================================================================================================
presetend_defeathelmasaur:
print "defeathelmasaur size: $", hex(presetend_defeathelmasaur-presetheader_defeathelmasaur)