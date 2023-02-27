;===================================================================================================
; PRESET DATA HEADER
;===================================================================================================
presetheader_defeatkholdstare:
	dw presetSRAM_defeatkholdstare ; location of SRAM
	dw presetpersistent_defeatkholdstare ; location of persistent data

;===================================================================================================
%menu_header("Defeat Kholdstare", 24)

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; KHOLDSTARE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
;---------------------------------------------------------------------------------------------------
%preset_UW("Link's Bed", "defeatkholdstare", "kholdstare", "links_bed")
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
%preset_UW("Uncle Lamp", "defeatkholdstare", "kholdstare", "uncle_lamp")
dw $0055 ; Screen ID
dw $0A78, $0AE1 ; Link Coords
dw $0A00, $0A10 ; Camera HV
db $00 ; Item
db $02 ; Direction
;-----------------------------
db $7D ; Entrance
db $8F ; Room layout
db $09 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Castle", "defeatkholdstare", "kholdstare", "castle")
dw $001B ; Screen ID
dw $07F8, $06F9 ; Link Coords
dw $0784, $069B ; Camera HV
db $09 ; Item
db $00 ; Direction
;-----------------------------
dw $0803, $0708 ; Scroll X,Y
dw $0530 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Stair Clip", "defeatkholdstare", "kholdstare", "stair_clip")
dw $0061 ; Screen ID
dw $03E8, $0CF8 ; Link Coords
dw $0300, $0C8C ; Camera HV
db $09 ; Item
db $06 ; Direction
;-----------------------------
db $04 ; Entrance
db $D0 ; Room layout
db $0A ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Re-arm EG", "defeatkholdstare", "kholdstare", "re_arm_eg")
dw $0062 ; Screen ID
dw $053F, $0D2F ; Link Coords
dw $04C7, $0CC3 ; Camera HV
db $09 ; Item
db $02 ; Direction
;-----------------------------
db $04 ; Entrance
db $F0 ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Ball 'n Chains", "defeatkholdstare", "kholdstare", "ball_n_chains")
dw $0070 ; Screen ID
dw $0050, $0E20 ; Link Coords
dw $004E, $0E00 ; Camera HV
db $09 ; Item
db $00 ; Direction
;-----------------------------
db $04 ; Entrance
db $0F ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Trudge to Mire", "defeatkholdstare", "kholdstare", "trudge_to_mire")
dw $0080 ; Screen ID
dw $01E8, $108F ; Link Coords
dw $0100, $1010 ; Camera HV
db $09 ; Item
db $06 ; Direction
;-----------------------------
db $04 ; Entrance
db $9E ; Room layout
db $0C ; Door / Peg state / Layer
dw $0004 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spark Avoidance", "defeatkholdstare", "kholdstare", "spark_avoidance")
dw $00B2 ; Screen ID
dw $0478, $17DB ; Link Coords
dw $0402, $16F0 ; Camera HV
db $09 ; Item
db $02 ; Direction
;-----------------------------
db $04 ; Entrance
db $AE ; Room layout
db $8C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Somaria Bridge", "defeatkholdstare", "kholdstare", "somaria_bridge")
dw $00C3 ; Screen ID
dw $06E8, $1978 ; Link Coords
dw $0600, $190B ; Camera HV
db $09 ; Item
db $06 ; Direction
;-----------------------------
db $04 ; Entrance
db $6E ; Room layout
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Trudge to Cannonballs", "defeatkholdstare", "kholdstare", "trudge_to_cannonballs")
dw $00C3 ; Screen ID
dw $070A, $1878 ; Link Coords
dw $0700, $180B ; Camera HV
db $09 ; Item
db $04 ; Direction
;-----------------------------
db $04 ; Entrance
db $5E ; Room layout
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Cannonballs", "defeatkholdstare", "kholdstare", "cannonballs")
dw $00B8 ; Screen ID
dw $11E8, $170B ; Link Coords
dw $1100, $169E ; Camera HV
db $09 ; Item
db $06 ; Direction
;-----------------------------
db $04 ; Entrance
db $7E ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Acquire Bow", "defeatkholdstare", "kholdstare", "acquire_bow")
dw $00B9 ; Screen ID
dw $1239, $1604 ; Link Coords
dw $1200, $1600 ; Camera HV
db $12 ; Item
db $00 ; Direction
;-----------------------------
db $04 ; Entrance
db $CE ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mire to Skull Woods", "defeatkholdstare", "kholdstare", "mire_to_skull_woods")
dw $00D1 ; Screen ID
dw $02A8, $1A20 ; Link Coords
dw $0200, $1A00 ; Camera HV
db $12 ; Item
db $00 ; Direction
;-----------------------------
db $04 ; Entrance
db $0D ; Room layout
db $00 ; Door / Peg state / Layer
dw $0040 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Fire Rod STC", "defeatkholdstare", "kholdstare", "fire_rod_stc")
dw $0057 ; Screen ID
dw $0E78, $06E2 ; Link Coords
dw $0E00, $0510 ; Camera HV
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
%preset_UW("Supply Run", "defeatkholdstare", "kholdstare", "supply_run")
dw $0058 ; Screen ID
dw $1078, $03E1 ; Link Coords
dw $1000, $0376 ; Camera HV
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
%preset_OW("Well Stair Clip", "defeatkholdstare", "kholdstare", "well_stair_clip")
dw $0018 ; Screen ID
dw $00B8, $06C9 ; Link Coords
dw $0032, $0667 ; Camera HV
db $12 ; Item
db $00 ; Direction
;-----------------------------
dw $00BF, $06D4 ; Scroll X,Y
dw $0388 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Ice Backdoor", "defeatkholdstare", "kholdstare", "ice_backdoor")
dw $004F ; Screen ID
dw $1E0A, $0830 ; Link Coords
dw $1E00, $0802 ; Camera HV
db $12 ; Item
db $02 ; Direction
;-----------------------------
db $39 ; Entrance
db $0F ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Ice Entrance", "defeatkholdstare", "kholdstare", "ice_entrance")
dw $0075 ; Screen ID
dw $0CB8, $0DC9 ; Link Coords
dw $0C3E, $0D6B ; Camera HV
db $12 ; Item
db $00 ; Direction
;-----------------------------
dw $0CC3, $0DD8 ; Scroll X,Y
dw $0BC6 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Penguin Switch Room", "defeatkholdstare", "kholdstare", "penguin_switch_room")
dw $001E ; Screen ID
dw $1DE8, $0378 ; Link Coords
dw $1D00, $030B ; Camera HV
db $01 ; Item
db $06 ; Direction
;-----------------------------
db $2D ; Entrance
db $30 ; Room layout
db $C2 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Break the Ice", "defeatkholdstare", "kholdstare", "break_the_ice")
dw $001F ; Screen ID
dw $1EE8, $0378 ; Link Coords
dw $1E00, $030B ; Camera HV
db $01 ; Item
db $06 ; Direction
;-----------------------------
db $2D ; Entrance
db $20 ; Room layout
db $C2 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spike Key", "defeatkholdstare", "kholdstare", "spike_key")
dw $003F ; Screen ID
dw $1EB0, $0720 ; Link Coords
dw $1E00, $0700 ; Camera HV
db $12 ; Item
db $00 ; Direction
;-----------------------------
db $2D ; Entrance
db $2F ; Room layout
db $40 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Lonely Firebar", "defeatkholdstare", "kholdstare", "lonely_firebar")
dw $005E ; Screen ID
dw $1D0A, $0B78 ; Link Coords
dw $1D00, $0B0B ; Camera HV
db $12 ; Item
db $04 ; Direction
;-----------------------------
db $2D ; Entrance
db $3E ; Room layout
db $42 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Last Two Screens", "defeatkholdstare", "kholdstare", "last_two_screens")
dw $009E ; Screen ID
dw $1CE8, $1378 ; Link Coords
dw $1C00, $130B ; Camera HV
db $12 ; Item
db $06 ; Direction
;-----------------------------
db $2D ; Entrance
db $2C ; Room layout
db $42 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Kholdstare", "defeatkholdstare", "kholdstare", "kholdstare")
dw $00BE ; Screen ID
dw $1D78, $17E1 ; Link Coords
dw $1D00, $1710 ; Camera HV
db $12 ; Item
db $02 ; Direction
;-----------------------------
db $2D ; Entrance
db $3B ; Room layout
db $C1 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
presetpersistent_defeatkholdstare:

;===================================================================================================
presetpersistent_defeatkholdstare_kholdstare:
;-----------------------------
.links_bed
%write_sq()
%write8($7E044A, $00) ; EG strength
%write8($7E047A, $00) ; Armed EG
..end
;-----------------------------
.uncle_lamp
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
.trudge_to_mire
%write8($7E047A, $00) ; Armed EG
..end
;-----------------------------
.spark_avoidance
%write8($7E047A, $01) ; Armed EG
..end
;-----------------------------
.somaria_bridge
..end
;-----------------------------
.trudge_to_cannonballs
..end
;-----------------------------
.cannonballs
%write8($7E047A, $00) ; Armed EG
..end
;-----------------------------
.acquire_bow
..end
;-----------------------------
.mire_to_skull_woods
..end
;-----------------------------
.fire_rod_stc
%write8($7E02A2, $02) ; Slot 4 Altitude
..end
;-----------------------------
.supply_run
%write_mirror($48, $08, $09, $01)
%write8($7E02A2, $17) ; Slot 4 Altitude
..end
;-----------------------------
.well_stair_clip
..end
;-----------------------------
.ice_backdoor
..end
;-----------------------------
.ice_entrance
%write8($7E02A2, $00) ; Slot 4 Altitude
..end
;-----------------------------
.penguin_switch_room
..end
;-----------------------------
.break_the_ice
..end
;-----------------------------
.spike_key
..end
;-----------------------------
.lonely_firebar
..end
;-----------------------------
.last_two_screens
..end
;-----------------------------
.kholdstare
..end

;===================================================================================================
presetSRAM_defeatkholdstare:
;-----------------------------
.kholdstare
;-----------------------------
..links_bed
%write8($7EF36F, $FF) ; Keys
%writeroom($104, $0002)
...end
;-----------------------------
..uncle_lamp
%write8($7EF359, $01) ; Sword
%write8($7EF35A, $01) ; Shield
%write8($7EF3C5, $01) ; Game state
%write8($7EF3C6, $11) ; Game flags A
%write8($7EF3C8, $03) ; Spawn point
%writeroom($055, $000C)
...end
;-----------------------------
..castle
%write8($7EF34A, $01) ; Lamp
%write8($7EF36E, $10) ; Magic
%writeroom($055, $001F)
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
..trudge_to_mire
%write8($7EF36D, $14) ; Health
%write16sram($7EF366, $4000) ; Big keys
%writeroom($080, $040C)
...end
;-----------------------------
..spark_avoidance
%write8($7EF36D, $0C) ; Health
%writeroom($081, $000F)
%writeroom($091, $000F)
%writeroom($0A1, $000F)
%writeroom($0A2, $000F)
%writeroom($0B2, $000F)
...end
;-----------------------------
..somaria_bridge
%write16sram($7EF360, $0001) ; Rupees
%writeroom($0C2, $000F)
%writeroom($0C3, $000A)
...end
;-----------------------------
..trudge_to_cannonballs
%write8($7EF350, $01) ; Somaria
%writeroom($0C3, $001F)
...end
;-----------------------------
..cannonballs
%write8($7EF36D, $04) ; Health
%writeroom($0B6, $0003)
%writeroom($0B7, $000F)
%writeroom($0B8, $000F)
%writeroom($0C4, $000F)
%writeroom($0C5, $000F)
%writeroom($0C6, $000F)
...end
;-----------------------------
..acquire_bow
%write8($7EF36E, $08) ; Magic
%write16sram($7EF360, $006A) ; Rupees
%writeroom($0B9, $001F)
...end
;-----------------------------
..mire_to_skull_woods
%write8($7EF340, $02) ; Bow
%write8($7EF343, $01) ; Bombs
%write8($7EF36E, $5F) ; Magic
%write8($7EF377, $0A) ; Arrows
%write16sram($7EF360, $006B) ; Rupees
%writeroom($097, $000A)
%writeroom($0A7, $000C)
%writeroom($0A8, $000F)
%writeroom($0A9, $001F)
%writeroom($0D1, $0008)
...end
;-----------------------------
..fire_rod_stc
%write8($7EF36E, $68) ; Magic
%writeroom($057, $0002)
%writeroom($067, $000A)
%writeroom($077, $000A)
%writeroom($087, $000A)
...end
;-----------------------------
..supply_run
%write8($7EF343, $00) ; Bombs
%write8($7EF345, $01) ; Fire Rod
%write8($7EF36E, $70) ; Magic
%writeroom($057, $000F)
%writeroom($058, $001A)
%writeroom($067, $000F)
...end
;-----------------------------
..well_stair_clip
%write8($7EF343, $03) ; Bombs
%write8($7EF35C, $03) ; Bottle 1
%write8($7EF36D, $14) ; Health
%write8($7EF36F, $FF) ; Keys
%write16sram($7EF360, $0002) ; Rupees
%writeroom($02F, $0163)
%writeroom($103, $001A)
%writeroom($11F, $0001)
...end
;-----------------------------
..ice_backdoor
%writeroom($03F, $000F)
%writeroom($04F, $0008)
...end
;-----------------------------
..ice_entrance
%write8($7EF36E, $68) ; Magic
%writeroom($00E, $0003)
%writeroom($01E, $0002)
%writeroom($02E, $400C)
%writeroom($03E, $400C)
%writeroom($04E, $400C)
...end
;-----------------------------
..penguin_switch_room
%write8($7EF34F, $01) ; Bottles
%write8($7EF36F, $00) ; Keys
%writeroom($01E, $0007)
...end
;-----------------------------
..break_the_ice
%writeroom($01F, $0002)
...end
;-----------------------------
..spike_key
%write8($7EF36E, $60) ; Magic
%writeroom($01F, $0003)
...end
;-----------------------------
..lonely_firebar
%write8($7EF36D, $0C) ; Health
%writeroom($05E, $8001)
%writeroom($05F, $8012)
...end
;-----------------------------
..last_two_screens
%writeroom($05E, $8003)
%writeroom($07E, $0002)
%writeroom($09E, $0002)
...end
;-----------------------------
..kholdstare
%writeroom($09E, $0003)
%writeroom($0BE, $0001)
...end
;===================================================================================================
presetend_defeatkholdstare:
print "defeatkholdstare size: $", hex(presetend_defeatkholdstare-presetheader_defeatkholdstare)
