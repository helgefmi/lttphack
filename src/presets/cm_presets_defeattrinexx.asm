;===================================================================================================
; PRESET DATA HEADER
;===================================================================================================
presetheader_defeattrinexx:
	dw presetSRAM_defeattrinexx ; location of SRAM
	dw presetpersistent_defeattrinexx ; location of persistent data

;===================================================================================================
%menu_header("Defeat Trinexx", 24)

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; TRINEXX
;---------------------------------------------------------------------------------------------------
;===================================================================================================
;---------------------------------------------------------------------------------------------------
%preset_UW("Link's Bed", "defeattrinexx", "trinexx", "links_bed")
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
%preset_UW("Courtyard", "defeattrinexx", "trinexx", "courtyard")
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
%preset_UW("Stair Clip", "defeattrinexx", "trinexx", "stair_clip")
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
%preset_UW("Re-arm EG", "defeattrinexx", "trinexx", "re_arm_eg")
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
%preset_UW("Ball 'n Chains", "defeattrinexx", "trinexx", "ball_n_chains")
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
%preset_UW("Spark Avoidance", "defeattrinexx", "trinexx", "spark_avoidance")
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
%preset_UW("Somaria Bridge", "defeattrinexx", "trinexx", "somaria_bridge")
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
%preset_UW("Trudge to Torches", "defeattrinexx", "trinexx", "trudge_to_torches")
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
%preset_UW("Mire to Skull Woods", "defeattrinexx", "trinexx", "mire_to_skull_woods")
dw $0097 ; Screen ID
dw $0EA8, $1220 ; Link Coords
dw $0E00, $1200 ; Camera HV
db $12 ; Item
db $00 ; Direction
;-----------------------------
db $04 ; Entrance
db $0E ; Room layout
db $08 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Fire Rod STC", "defeattrinexx", "trinexx", "fire_rod_stc")
dw $0057 ; Screen ID
dw $0E78, $06E3 ; Link Coords
dw $0E00, $050E ; Camera HV
db $12 ; Item
db $02 ; Direction
;-----------------------------
db $04 ; Entrance
db $2E ; Room layout
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write16_enable()
%write16($7E0600, $FF00) ; Camera boundaries
%write16($7E0602, $FE00) ; Camera boundaries
%write16($7E0604, $FF10) ; Camera boundaries
%write16($7E0606, $FF10) ; Camera boundaries
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pit Stop", "defeattrinexx", "trinexx", "pit_stop")
dw $0058 ; Screen ID
dw $1078, $03E1 ; Link Coords
dw $1000, $0374 ; Camera HV
db $05 ; Item
db $02 ; Direction
;-----------------------------
db $04 ; Entrance
db $2E ; Room layout
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write16_enable()
%write16($7E0600, $FB00) ; Camera boundaries
%write16($7E0602, $FC00) ; Camera boundaries
%write16($7E0604, $FB10) ; Camera boundaries
%write16($7E0606, $FD10) ; Camera boundaries
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Skull to Swamp", "defeattrinexx", "trinexx", "skull_to_swamp")
dw $0057 ; Screen ID
dw $0F78, $0BE1 ; Link Coords
dw $0F00, $0B10 ; Camera HV
db $12 ; Item
db $02 ; Direction
;-----------------------------
db $77 ; Entrance
db $3F ; Room layout
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Mini Moldorm Supplies", "defeattrinexx", "trinexx", "mini_moldorm_supplies")
dw $0035 ; Screen ID
dw $0A68, $0EF9 ; Link Coords
dw $0A00, $0E99 ; Camera HV
db $01 ; Item
db $00 ; Direction
;-----------------------------
dw $0A7D, $0F06 ; Scroll X,Y
dw $1500 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Ice Rod Overworld", "defeattrinexx", "trinexx", "ice_rod_overworld")
dw $003F ; Screen ID
dw $0F60, $0E05 ; Link Coords
dw $0EEE, $0E00 ; Camera HV
db $01 ; Item
db $00 ; Direction
;-----------------------------
dw $0F6B, $0E6D ; Scroll X,Y
dw $001E ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Lobby Quadrant Glitch 1", "defeattrinexx", "trinexx", "lobby_quadrant_glitch_1")
dw $001B ; Screen ID
dw $07F8, $06FA ; Link Coords
dw $0784, $069C ; Camera HV
db $01 ; Item
db $00 ; Direction
;-----------------------------
dw $0803, $0709 ; Scroll X,Y
dw $0532 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Ice Chair 1", "defeattrinexx", "trinexx", "ice_chair_1")
dw $004F ; Screen ID
dw $FFC8, $0E14 ; Link Coords
dw $FF02, $0C00 ; Camera HV
db $01 ; Item
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
%preset_UW("Kakariko Well to Hammer", "defeattrinexx", "trinexx", "kakariko_well_to_hammer")
dw $002F ; Screen ID
dw $FF78, $0BE1 ; Link Coords
dw $FE9A, $0910 ; Camera HV
db $01 ; Item
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
%preset_OW("Lobby Quadrant Glitch 2", "defeattrinexx", "trinexx", "lobby_quadrant_glitch_2")
dw $001B ; Screen ID
dw $07F8, $06FA ; Link Coords
dw $0784, $069C ; Camera HV
db $01 ; Item
db $00 ; Direction
;-----------------------------
dw $0803, $0709 ; Scroll X,Y
dw $0530 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Ice Chair 2", "defeattrinexx", "trinexx", "ice_chair_2")
dw $004F ; Screen ID
dw $FFC8, $0E06 ; Link Coords
dw $FF02, $0C00 ; Camera HV
db $01 ; Item
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
%preset_UW("Supply Run", "defeattrinexx", "trinexx", "supply_run")
dw $002F ; Screen ID
dw $FF78, $0BE1 ; Link Coords
dw $FE94, $0910 ; Camera HV
db $01 ; Item
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
%preset_UW("Somaria YBA", "defeattrinexx", "trinexx", "somaria_yba")
dw $00D3 ; Screen ID
dw $062D, $1A15 ; Link Coords
dw $0600, $1A15 ; Camera HV
db $01 ; Item
db $00 ; Direction
;-----------------------------
db $11 ; Entrance
db $0F ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Leaving TR", "defeattrinexx", "trinexx", "leaving_tr")
dw $00B4 ; Screen ID
dw $08F8, $17CF ; Link Coords
dw $0880, $1710 ; Camera HV
db $12 ; Item
db $02 ; Direction
;-----------------------------
db $11 ; Entrance
db $EE ; Room layout
db $40 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("TR Entrance", "defeattrinexx", "trinexx", "tr_entrance")
dw $0045 ; Screen ID
dw $0D18, $01C9 ; Link Coords
dw $0CA6, $0165 ; Camera HV
db $01 ; Item
db $00 ; Direction
;-----------------------------
dw $0D23, $01D4 ; Scroll X,Y
dw $0AD4 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Trinexx", "defeattrinexx", "trinexx", "trinexx")
dw $00B4 ; Screen ID
dw $0878, $1614 ; Link Coords
dw $0800, $1600 ; Camera HV
db $12 ; Item
db $00 ; Direction
;-----------------------------
db $18 ; Entrance
db $CD ; Room layout
db $41 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
presetpersistent_defeattrinexx:

;===================================================================================================
presetpersistent_defeattrinexx_trinexx:
;-----------------------------
.links_bed
%write_sq()
%write8($7E02A1, $00) ; Slot 3 Altitude
%write8($7E02A2, $00) ; Slot 4 Altitude
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
.trudge_to_torches
..end
;-----------------------------
.mire_to_skull_woods
%write8($7E047A, $00) ; Armed EG
..end
;-----------------------------
.fire_rod_stc
..end
;-----------------------------
.pit_stop
%write_mirror($48, $08, $09, $01)
..end
;-----------------------------
.skull_to_swamp
..end
;-----------------------------
.mini_moldorm_supplies
%write8($7E02A2, $00) ; Slot 4 Altitude
%write8($7E044A, $02) ; EG strength
..end
;-----------------------------
.ice_rod_overworld
..end
;-----------------------------
.lobby_quadrant_glitch_1
%write_sq()
..end
;-----------------------------
.ice_chair_1
%write8($7E044A, $01) ; EG strength
..end
;-----------------------------
.kakariko_well_to_hammer
%write8($7E047A, $01) ; Armed EG
..end
;-----------------------------
.lobby_quadrant_glitch_2
%write8($7E044A, $02) ; EG strength
%write8($7E047A, $00) ; Armed EG
..end
;-----------------------------
.ice_chair_2
%write8($7E044A, $01) ; EG strength
..end
;-----------------------------
.supply_run
%write8($7E047A, $01) ; Armed EG
..end
;-----------------------------
.somaria_yba
%write8($7E047A, $00) ; Armed EG
..end
;-----------------------------
.leaving_tr
..end
;-----------------------------
.tr_entrance
..end
;-----------------------------
.trinexx
..end

;===================================================================================================
presetSRAM_defeattrinexx:
;-----------------------------
.trinexx
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
%write16sram($7EF360, $0001) ; Rupees
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
..trudge_to_torches
%write8($7EF350, $01) ; Somaria
%writeroom($0C3, $001F)
...end
;-----------------------------
..mire_to_skull_woods
%write8($7EF36D, $04) ; Health
%writeroom($095, $000F)
%writeroom($096, $000F)
%writeroom($097, $0008)
%writeroom($0A4, $0007)
%writeroom($0A5, $0008)
%writeroom($0B3, $0007)
%writeroom($0B4, $000F)
...end
;-----------------------------
..fire_rod_stc
%write8($7EF343, $01) ; Bombs
%write8($7EF36E, $68) ; Magic
%write16sram($7EF360, $0002) ; Rupees
%writeroom($057, $0002)
%writeroom($067, $000A)
%writeroom($077, $000A)
%writeroom($087, $000A)
%writeroom($097, $000A)
%writeroom($0D1, $0008)
...end
;-----------------------------
..pit_stop
%write8($7EF343, $00) ; Bombs
%write8($7EF345, $01) ; Fire Rod
%write8($7EF36E, $60) ; Magic
%writeroom($057, $000F)
%writeroom($058, $001A)
%writeroom($067, $000F)
...end
;-----------------------------
..skull_to_swamp
%write8($7EF36F, $01) ; Keys
%writeroom($057, $002F)
...end
;-----------------------------
..mini_moldorm_supplies
%write8($7EF343, $01) ; Bombs
%write8($7EF36E, $58) ; Magic
%write8($7EF36F, $FF) ; Keys
%write8($7EF2B5, $02) ; OW screen $35
%writeroom($028, $000F)
%writeroom($037, $1003)
%writeroom($038, $400A)
%writeroom($047, $000F)
%writeroom($057, $000F)
...end
;-----------------------------
..ice_rod_overworld
%write8($7EF343, $04) ; Bombs
%write8($7EF36E, $48) ; Magic
%write16sram($7EF360, $0133) ; Rupees
%writeroom($123, $041A)
...end
;-----------------------------
..lobby_quadrant_glitch_1
%write8($7EF343, $03) ; Bombs
%write8($7EF346, $01) ; Ice Rod
%write8($7EF36D, $18) ; Health
%write8($7EF2B7, $02) ; OW screen $37
%writeroom($120, $001A)
...end
;-----------------------------
..ice_chair_1
%write8($7EF36F, $00) ; Keys
%writeroom($04F, $0004)
%writeroom($050, $000F)
%writeroom($060, $0005)
...end
;-----------------------------
..kakariko_well_to_hammer
%write8($7EF36D, $10) ; Health
%writeroom($02F, $0003)
%writeroom($03F, $0005)
%writeroom($040, $000F)
...end
;-----------------------------
..lobby_quadrant_glitch_2
%write8($7EF343, $04) ; Bombs
%write8($7EF34B, $01) ; Hammer
%write8($7EF36D, $18) ; Health
%write8($7EF36F, $FF) ; Keys
%writeroom($019, $800F)
%writeroom($01A, $201A)
%writeroom($029, $0004)
%writeroom($02A, $000F)
%writeroom($02B, $000C)
%writeroom($02C, $000B)
%writeroom($02D, $0003)
%writeroom($02E, $0003)
%writeroom($02F, $0103)
...end
;-----------------------------
..ice_chair_2
%write8($7EF36F, $00) ; Keys
...end
;-----------------------------
..supply_run
%write8($7EF36D, $10) ; Health
...end
;-----------------------------
..somaria_yba
%write8($7EF343, $09) ; Bombs
%write8($7EF35C, $03) ; Bottle 1
%write8($7EF36F, $FF) ; Keys
%write16sram($7EF360, $0061) ; Rupees
%writeroom($0D3, $000A)
%writeroom($0E3, $000A)
%writeroom($103, $001A)
%writeroom($11F, $0001)
...end
;-----------------------------
..leaving_tr
%write8($7EF34F, $01) ; Bottles
%write8($7EF35C, $02) ; Bottle 1
%write8($7EF36D, $18) ; Health
%write8($7EF36E, $80) ; Magic
%writeroom($0C4, $000F)
...end
;-----------------------------
..tr_entrance
%write8($7EF343, $08) ; Bombs
%write8($7EF36E, $68) ; Magic
%writeroom($0B4, $800F)
%writeroom($0C4, $800F)
%writeroom($0C5, $800A)
%writeroom($0D5, $800A)
...end
;-----------------------------
..trinexx
%write8($7EF36E, $80) ; Magic
%write8($7EF36F, $00) ; Keys
%write16sram($7EF360, $0066) ; Rupees
...end
;===================================================================================================
presetend_defeattrinexx:
print "defeattrinexx size: $", hex(presetend_defeattrinexx-presetheader_defeattrinexx)
