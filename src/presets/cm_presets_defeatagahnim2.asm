;===================================================================================================
; PRESET DATA HEADER
;===================================================================================================
presetheader_defeatagahnim2:
	dw presetSRAM_defeatagahnim2 ; location of SRAM
	dw presetpersistent_defeatagahnim2 ; location of persistent data

;===================================================================================================
%menu_header("Defeat Agahnim 2", 15)

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; AGAHNIM 2
;---------------------------------------------------------------------------------------------------
;===================================================================================================
;---------------------------------------------------------------------------------------------------
%preset_UW("Link's Bed", "defeatagahnim2", "agahnim_2", "links_bed")
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
%preset_UW("Courtyard", "defeatagahnim2", "agahnim_2", "courtyard")
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
%preset_UW("Stair Clip", "defeatagahnim2", "agahnim_2", "stair_clip")
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
%preset_UW("Re-arm EG", "defeatagahnim2", "agahnim_2", "re_arm_eg")
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
%preset_UW("Ball 'n Chains", "defeatagahnim2", "agahnim_2", "ball_n_chains")
dw $0070 ; Screen ID
dw $0050, $0E21 ; Link Coords
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
%preset_UW("Spark Avoidance", "defeatagahnim2", "agahnim_2", "spark_avoidance")
dw $00B2 ; Screen ID
dw $0478, $17DB ; Link Coords
dw $0402, $16ED ; Camera HV
db $00 ; Item
db $02 ; Direction
;-----------------------------
db $04 ; Entrance
db $AE ; Room layout
db $8C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Somaria Bridge", "defeatagahnim2", "agahnim_2", "somaria_bridge")
dw $00C3 ; Screen ID
dw $06E8, $1978 ; Link Coords
dw $0600, $190D ; Camera HV
db $00 ; Item
db $06 ; Direction
;-----------------------------
db $04 ; Entrance
db $6E ; Room layout
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Trudge to Falling Bridge", "defeatagahnim2", "agahnim_2", "trudge_to_falling_bridge")
dw $00C3 ; Screen ID
dw $070A, $1878 ; Link Coords
dw $0700, $180D ; Camera HV
db $12 ; Item
db $04 ; Direction
;-----------------------------
db $04 ; Entrance
db $5E ; Room layout
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Low Snap to Hera", "defeatagahnim2", "agahnim_2", "low_snap_to_hera")
dw $0095 ; Screen ID
dw $0BE8, $13C0 ; Link Coords
dw $0B00, $1312 ; Camera HV
db $12 ; Item
db $06 ; Direction
;-----------------------------
db $04 ; Entrance
db $7E ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write16_enable()
%write16($7E0600, $1300) ; Camera boundaries
%write16($7E0602, $1200) ; Camera boundaries
%write16($7E0604, $1310) ; Camera boundaries
%write16($7E0606, $1310) ; Camera boundaries
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Hera Descent", "defeatagahnim2", "agahnim_2", "hera_descent")
dw $00A7 ; Screen ID
dw $0EA0, $14A8 ; Link Coords
dw $0E2A, $1410 ; Camera HV
db $12 ; Item
db $02 ; Direction
;-----------------------------
db $04 ; Entrance
db $8E ; Room layout
db $08 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("TR Climb", "defeatagahnim2", "agahnim_2", "tr_climb")
dw $0077 ; Screen ID
dw $0EF8, $0FE1 ; Link Coords
dw $0E82, $0F10 ; Camera HV
db $12 ; Item
db $02 ; Direction
;-----------------------------
db $04 ; Entrance
db $E1 ; Room layout
db $4D ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Lionel Peak", "defeatagahnim2", "agahnim_2", "lionel_peak")
dw $0043 ; Screen ID
dw $09E7, $0150 ; Link Coords
dw $0900, $00EC ; Camera HV
db $12 ; Item
db $06 ; Direction
;-----------------------------
dw $097F, $015B ; Scroll X,Y
dw $0660 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("TR Backdoor", "defeatagahnim2", "agahnim_2", "tr_backdoor")
dw $0045 ; Screen ID
dw $0D78, $0169 ; Link Coords
dw $0D00, $0105 ; Camera HV
db $12 ; Item
db $00 ; Direction
;-----------------------------
dw $0D7D, $0174 ; Scroll X,Y
dw $07E0 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pokeys 2", "defeatagahnim2", "agahnim_2", "pokeys_2")
dw $0024 ; Screen ID
dw $0878, $0514 ; Link Coords
dw $0800, $0500 ; Camera HV
db $12 ; Item
db $00 ; Direction
;-----------------------------
db $19 ; Entrance
db $2F ; Room layout
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Agahnim 2", "defeatagahnim2", "agahnim_2", "agahnim_2")
dw $0004 ; Screen ID
dw $0878, $02E1 ; Link Coords
dw $0800, $0110 ; Camera HV
db $12 ; Item
db $02 ; Direction
;-----------------------------
db $19 ; Entrance
db $2F ; Room layout
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write16_enable()
%write16($7E0600, $FF00) ; Camera boundaries
%write16($7E0602, $FE00) ; Camera boundaries
%write16($7E0604, $FF10) ; Camera boundaries
%write16($7E0606, $FF10) ; Camera boundaries
%write_end()

;===================================================================================================
presetpersistent_defeatagahnim2:

;===================================================================================================
presetpersistent_defeatagahnim2_agahnim_2:
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
.spark_avoidance
..end
;-----------------------------
.somaria_bridge
..end
;-----------------------------
.trudge_to_falling_bridge
..end
;-----------------------------
.low_snap_to_hera
%write8($7E047A, $00) ; Armed EG
..end
;-----------------------------
.hera_descent
..end
;-----------------------------
.tr_climb
..end
;-----------------------------
.lionel_peak
..end
;-----------------------------
.tr_backdoor
..end
;-----------------------------
.pokeys_2
..end
;-----------------------------
.agahnim_2
%write_mirror($01, $08, $4C, $0C)
..end

;===================================================================================================
presetSRAM_defeatagahnim2:
;-----------------------------
.agahnim_2
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
..spark_avoidance
%write8($7EF36D, $0C) ; Health
%write16sram($7EF366, $4000) ; Big keys
%writeroom($080, $040F)
%writeroom($081, $000F)
%writeroom($091, $000F)
%writeroom($0A1, $000F)
%writeroom($0A2, $000F)
%writeroom($0B2, $000F)
...end
;-----------------------------
..somaria_bridge
%writeroom($0C2, $000F)
%writeroom($0C3, $000A)
...end
;-----------------------------
..trudge_to_falling_bridge
%write8($7EF350, $01) ; Somaria
%writeroom($0C3, $001F)
...end
;-----------------------------
..low_snap_to_hera
%write8($7EF36D, $04) ; Health
%writeroom($095, $0005)
%writeroom($0A4, $0001)
%writeroom($0A5, $000F)
%writeroom($0B3, $0007)
%writeroom($0B4, $000F)
...end
;-----------------------------
..hera_descent
%write8($7EF36D, $18) ; Health
%writeroom($096, $000F)
%writeroom($097, $0002)
%writeroom($0A7, $000C)
...end
;-----------------------------
..tr_climb
%write8($7EF343, $01) ; Bombs
%write8($7EF357, $01) ; Pearl
%writeroom($017, $000F)
%writeroom($027, $001F)
%writeroom($031, $000C)
%writeroom($077, $000F)
...end
;-----------------------------
..lionel_peak
%write8($7EF36F, $FF) ; Keys
%write8($7EF3CA, $40) ; LW/DW
...end
;-----------------------------
..tr_backdoor
...end
;-----------------------------
..pokeys_2
%write8($7EF36D, $10) ; Health
%write8($7EF36F, $00) ; Keys
%writeroom($023, $0001)
%writeroom($024, $0003)
...end
;-----------------------------
..agahnim_2
%write8($7EF343, $00) ; Bombs
%write8($7EF36D, $18) ; Health
%write8($7EF36E, $08) ; Magic
%writeroom($004, $4002)
%writeroom($014, $000F)
%writeroom($024, $000B)
...end
;===================================================================================================
presetend_defeatagahnim2:
print "defeatagahnim2 size: $", hex(presetend_defeatagahnim2-presetheader_defeatagahnim2)