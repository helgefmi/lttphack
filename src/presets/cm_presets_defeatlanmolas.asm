;===================================================================================================
; PRESET DATA HEADER
;===================================================================================================
presetheader_defeatlanmolas:
	dw presetSRAM_defeatlanmolas ; location of SRAM
	dw presetpersistent_defeatlanmolas ; location of persistent data

;===================================================================================================
%menu_header("Defeat Lanmolas", 15)

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; ESCAPE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
;---------------------------------------------------------------------------------------------------
%preset_UW("Link's bed", "defeatlanmolas", "escape", "links_bed")
dw $0104 ; Screen ID
dw $0940, $215A ; Link Coords
dw $0900, $2110 ; Camera HV
db $00 ; Item
db $02 ; Direction
;-----------------------------
db $00 ; Entrance
db $20 ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Lamp", "defeatlanmolas", "escape", "lamp")
dw $0104 ; Screen ID
dw $0940, $2157 ; Link Coords
dw $0900, $2110 ; Camera HV
db $00 ; Item
db $02 ; Direction
;-----------------------------
db $00 ; Entrance
db $20 ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write8_enable()
%write8($7E005D, $16) ; sit up in bed
%write8($7E037C, $01)
%write8($7E037D, $01)
%write8($7E0BFA, $62) ; blanket
%write8($7E0C04, $38)
%write8($7E0C0E, $21)
%write8($7E0C18, $09)
%write8($7E0C4A, $20)
%write16_enable()
%write16($7E02CD, $0DF3)
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside", "defeatlanmolas", "escape", "outside")
dw $002C ; Screen ID
dw $08B8, $0AFB ; Link Coords
dw $0832, $0A9D ; Camera HV
db $09 ; Item
db $02 ; Direction
;-----------------------------
dw $08BF, $0B0A ; Scroll X,Y
dw $0506 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Uncle", "defeatlanmolas", "escape", "uncle")
dw $0055 ; Screen ID
dw $0B9F, $0A96 ; Link Coords
dw $0B00, $0A10 ; Camera HV
db $09 ; Item
db $00 ; Direction
;-----------------------------
db $7D ; Entrance
db $9F ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Courtyard", "defeatlanmolas", "escape", "courtyard")
dw $0055 ; Screen ID
dw $0A78, $0BDF ; Link Coords
dw $0A00, $0B10 ; Camera HV
db $09 ; Item
db $02 ; Direction
;-----------------------------
db $7D ; Entrance
db $AF ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "defeatlanmolas", "escape", "entrance")
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
%preset_UW("Stair Clip", "defeatlanmolas", "escape", "stair_clip")
dw $0062 ; Screen ID
dw $0518, $0C60 ; Link Coords
dw $04A0, $0C00 ; Camera HV
db $09 ; Item
db $00 ; Direction
;-----------------------------
db $04 ; Entrance
db $D0 ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Arm EG", "defeatlanmolas", "escape", "arm_eg")
dw $0072 ; Screen ID
dw $055A, $0E0C ; Link Coords
dw $04E2, $0E00 ; Camera HV
db $09 ; Item
db $02 ; Direction
;-----------------------------
db $04 ; Entrance
db $90 ; Room layout / Floor
db $04 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; DESERT
;---------------------------------------------------------------------------------------------------
;===================================================================================================

;---------------------------------------------------------------------------------------------------
%preset_UW("Tile room", "defeatlanmolas", "desert", "tile_room")
dw $0043 ; Screen ID
dw $0751, $09C0 ; Link Coords
dw $0662, $0912 ; Camera HV
db $09 ; Item
db $00 ; Direction
;-----------------------------
db $04 ; Entrance
db $30 ; Room layout / Floor
db $04 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write16_enable()
%write16($7E0600, $0900) ; Camera boundaries
%write16($7E0602, $0800) ; Camera boundaries
%write16($7E0604, $0910) ; Camera boundaries
%write16($7E0606, $0910) ; Camera boundaries
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Backtracking", "defeatlanmolas", "desert", "backtracking")
dw $0053 ; Screen ID
dw $0778, $0A20 ; Link Coords
dw $06DC, $0A00 ; Camera HV
db $09 ; Item
db $02 ; Direction
;-----------------------------
db $04 ; Entrance
db $50 ; Room layout / Floor
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Reverse Genocide", "defeatlanmolas", "desert", "reverse_genocide")
dw $0053 ; Screen ID
dw $0712, $0B78 ; Link Coords
dw $0700, $0B0B ; Camera HV
db $09 ; Item
db $04 ; Direction
;-----------------------------
db $04 ; Entrance
db $70 ; Room layout / Floor
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Tile Room 2", "defeatlanmolas", "desert", "tile_room_2")
dw $0053 ; Screen ID
dw $0678, $0A22 ; Link Coords
dw $0600, $0A00 ; Camera HV
db $09 ; Item
db $00 ; Direction
;-----------------------------
db $04 ; Entrance
db $00 ; Room layout / Floor
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Dungeon Reload", "defeatlanmolas", "desert", "dungeon_reload")
dw $0030 ; Screen ID
dw $0128, $0C3B ; Link Coords
dw $00A2, $0C00 ; Camera HV
db $09 ; Item
db $02 ; Direction
;-----------------------------
dw $012F, $0C6D ; Scroll X,Y
dw $0016 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Dark Room", "defeatlanmolas", "desert", "dark_room")
dw $0052 ; Screen ID
dw $05E4, $0A0E ; Link Coords
dw $0500, $0A00 ; Camera HV
db $09 ; Item
db $00 ; Direction
;-----------------------------
db $0C ; Entrance
db $D0 ; Room layout / Floor
db $04 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Lanmolas", "defeatlanmolas", "desert", "lanmolas")
dw $0043 ; Screen ID
dw $0628, $0805 ; Link Coords
dw $0600, $0805 ; Camera HV
db $09 ; Item
db $06 ; Direction
;-----------------------------
db $0C ; Entrance
db $80 ; Room layout / Floor
db $04 ; Door / Peg state / Layer
dw $0606 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
presetpersistent_defeatlanmolas:

;===================================================================================================
presetpersistent_defeatlanmolas_escape:
;-----------------------------
.links_bed
%write_sq()
%write8($7E047A, $00) ; Armed EG
%write8($7E044A, $00) ; EG strength
..end
;-----------------------------
.lamp
..end
;-----------------------------
.outside
..end
;-----------------------------
.uncle
%write8($7E044A, $02) ; EG strength
..end
;-----------------------------
.courtyard
..end
;-----------------------------
.entrance
..end
;-----------------------------
.stair_clip
%write8($7E044A, $01) ; EG strength
..end
;-----------------------------
.arm_eg
..end

;===================================================================================================
presetpersistent_defeatlanmolas_desert:
;-----------------------------
.tile_room
%write8($7E047A, $01) ; Armed EG
..end
;-----------------------------
.backtracking
..end
;-----------------------------
.reverse_genocide
..end
;-----------------------------
.tile_room_2
..end
;-----------------------------
.dungeon_reload
..end
;-----------------------------
.dark_room
%write8($7E047A, $00) ; Armed EG
..end
;-----------------------------
.lanmolas
..end

;===================================================================================================
presetSRAM_defeatlanmolas:
;-----------------------------
.escape
;-----------------------------
..links_bed
%write8($7EF36F, $FF) ; Keys
%writeroom($104, $0002)
...end
;-----------------------------
..lamp
%write8($7EF3C6, $10) ; Game flags A
%write8($7EF3CC, $05) ; Follower
...end
;-----------------------------
..outside
%write8($7EF34A, $01) ; Lamp
%writeroom($104, $0012)
...end
;-----------------------------
..uncle
%writeroom($055, $000C)
...end
;-----------------------------
..courtyard
%write8($7EF359, $01) ; Sword
%write8($7EF35A, $01) ; Shield
%write8($7EF3C5, $01) ; Game state
%write8($7EF3C6, $11) ; Game flags A
%write8($7EF3C8, $03) ; Spawn point
%write8($7EF3CC, $00) ; Follower
%writeroom($055, $000F)
...end
;-----------------------------
..entrance
...end
;-----------------------------
..stair_clip
%write8($7EF36F, $00) ; Keys
%writeroom($061, $000F)
%writeroom($062, $000F)
...end
;-----------------------------
..arm_eg
%writeroom($072, $000C)
...end
;-----------------------------
.desert
;-----------------------------
..tile_room
%write8($7EF36D, $10) ; Health
%writeroom($043, $0001)
%writeroom($052, $000F)
%writeroom($053, $000E)
...end
;-----------------------------
..backtracking
%writeroom($043, $2401)
%writeroom($053, $000F)
...end
;-----------------------------
..reverse_genocide
%write8($7EF36D, $18) ; Health
...end
;-----------------------------
..tile_room_2
%writeroom($053, $200F)
...end
;-----------------------------
..dungeon_reload
%writeroom($063, $000A)
...end
;-----------------------------
..dark_room
%write8($7EF36D, $10) ; Health
%write8($7EF36F, $00) ; Keys
...end
;-----------------------------
..lanmolas
%writeroom($042, $000F) ; Room $0042
%writeroom($043, $240D) ; Room $0043
...end
;===================================================================================================
presetend_defeatlanmolas:
print "defeatlanmolas size: $", hex(presetend_defeatlanmolas-presetheader_defeatlanmolas)
