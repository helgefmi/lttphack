; TODO scrape data for $7FDF80 in new presets and move them to persistent per segment

pushpc
org $02FFC7
PresetLoadArea_UW:
	SEP #$30
	LDA.b #$00
	PHA
	PLB
	JSR.w $02D854
	JMP.w $028157

LoadOverworldOverlay:
	JSR.w $02FA71
	RTL

pullpc
PRESET_SUBMENU:
	SEP #$30
	LDA.w !ram_preset_category
	ASL
	CLC
	ADC.w !ram_preset_category
	TAX

	REP #$21
	LDA.l .pointers-1, X
	AND.w #$FF00
	STA.b SA1IRAM.cm_cursor+0

	LDA.l .pointers+1, X
	STA.b SA1IRAM.cm_cursor+2

	; put bank in appropriate places
	STA.b SA1IRAM.preset_addr+1
	STA.b SA1IRAM.preset_prog+1
	STA.b SA1IRAM.preset_pert+1
	STA.b SA1IRAM.preset_reader+1
	STA.b SA1IRAM.preset_reader2+1

	LDA.b [SA1IRAM.cm_current_menu] ; save data pointer
	STA.b SA1IRAM.preset_prog

	; adjust the pointer to be in the correct spot for the menu
	LDA.b SA1IRAM.cm_current_menu
	ADC.w #$0002
	STA.b SA1IRAM.cm_current_menu
	RTL

.pointers
	dl presetheader_nmg
	;dl presetheader_hundo
	;dl presetheader_lownmg
	;dl presetheader_low
	;dl presetheader_ad2020
	;dl presetheader_ad
	;dl presetheader_anyrmg




; TODO?
; command for writing palette
!PRESET_WRITE_END   = $0000
!PRESET_WRITE_8     = $0001
!PRESET_WRITE_16    = $0002

!PRESET_WRITE_2N    = $0004
!PRESET_WRITE_2N1   = $0005

!PRESET_WRITE_7F    = $000F


macro write_end()
	dw !PRESET_WRITE_END
endmacro

macro write_7F()
	dw !PRESET_WRITE_7F
endmacro

macro write8_enable()
	dw !PRESET_WRITE_8
endmacro

macro write16_enable()
	dw !PRESET_WRITE_16
endmacro

macro write8(addr, data)
	dw <addr> : db <data>
endmacro

macro write16(addr, data)
	dw <addr> : dw <data>
endmacro

macro write_2N(addr, n)
	dw !PRESET_WRITE_2N
	dw <addr> : db <n>
endmacro

macro write_2N1(addr, n)
	dw !PRESET_WRITE_2N1
	dw <addr> : db <n>
endmacro

macro writeroom(room, n)
	dw <room>*2 : dw <n>
endmacro

macro write16sram(addr, data)
	dw <addr>&$4FFF|$4000 : dw <data>
endmacro

;===================================================================================================
; Preset format:
;	%preset_ow("Name", pointer)
;===================================================================================================
; taken care of by macros:
;	dw SRAM endpoint
;	dw Persistence Start
;	dw Persistence End
; Preset data:
;	dw Room/Screen ID
;	dw Link X
;	dw Link Y
;	dw Camera V
;	dw Camera H
;	db Item
;	db Link direction

;
;	UW ONLY
;	db Room layout
;	db Entrance
;	db Main GFX
;	db Music
;	db Floor
;	db Palace No
;	db Door
;	db Layer
;
;
;	OW ONLY
;	dw Scroll X
;	dw Scroll Y
;	dw Unknown 1
;	dw Unknown 2
;	dw Unknown 3
;
;	wram_data:
;	dw WRAM_ADDRESS : db VAL
;	startPersistence(startofdata)
;	startSRAM(endofdata)
;
; special commands:
; dw $0000 - end of data
; dw $0001 - swap to 8-bit write mode
; dw $0002 - swap to 16-bit write mode
; dw $0004 - swap to 16-bit write 2n bytes mode
; dw $0005 - swap to 16-bit write 2n+1 bytes mode

; dw $000F - swap to bank 7F (write mode becomes 8 bit)

emptybg3:
	dw $7F20


preset_load_last_preset:
	REP #$20
	LDA.w SA1IRAM.preset_addr
	BNE preset_load


preset_load:
	SEP #$30

	; clear camera shake offsets
	REP #$20
	STZ.w $011A : STZ.w $011C

	SEP #$30
	STZ.w $0128 ; disable IRQ
	STZ.w $4200 ; disable NMI

	; big blocks of zeros clear tile map
	REP #$20
	LDA.w #$2100 : TCD
	LDX.b #$80 : STX.b $2100

	; clear text tile map
	LDY.b #$00 : STY.b $2115

	STA.w $4355
	LDA.w #$1808 : STA.w $4350
	LDA.w #$C240>>1 : STA.b $2116
	LDA.w #emptybg3+1 : STA.w $4352
	LDY.b #emptybg3>>16 : STY.w $4354
	LDA.w #$05C0/2 : STA.w $4355

	LDX.b #$20 : STX.w $420B

	LDY.b #$80 : STY.b $2115

	STA.w $4355
	LDA.w #$1908 : STA.w $4350
	LDA.w #$C240>>1 : STA.b $2116
	LDA.w #emptybg3 : STA.w $4352

	STX.w $420B

	; clear stuff for text
	LDA.w #$F800>>1 : STA.b $2116
	LDA.w #ZeroLand+1 : STA.w $4352
	LDX.b #ZeroLand>>16 : STX.w $4354
	LDA.w #$0780 : STA.w $4355
	LDA.w #$1809 : STA.w $4350

	STX.w $420B

	LDA.w #$8008 : STA.w $4350

	LDY.b #$01
	STY.b $2183 ; bank 7F to start

	; clear some sprite stuff
	LDA.w #$F800 : STA.b $2181
	LDA.w #$0020 : STA.w $4355
	STX.w $420B

	LDA.w #$DF80 : STA.b $2181
	LDA.w #$1200 : STA.w $4355
	STX.w $420B

	; clear tile map
	LDA.w #$2000 : STA.b $2181
	STA.w $4355 ; happens to be number of bytes to write too
	STX.w $420B

	STZ.b $2182 ; bank 7E now

	; clear sram mirror
	LDA.w #$F000 : STA.b $2181
	LDA.w #$0500 : STA.w $4355
	STX.w $420B

	; clear some wram
	STA.w $4355 ; 0x500 bytes again, for wram
	LDA.w #$0B00 : STA.b $2181
	STX.w $420B

	; no point in looping these
	STZ.w $029E+0
	STZ.w $029E+2
	STZ.w $029E+4
	STZ.w $029E+6
	STZ.w $029E+8
	STZ.w $03FC
	STZ.w $02EC
	STZ.w $02F0
	STZ.w $0ABD

	; start loading preset data
	LDA.w #$3000 : TCD

	SEP #$20
	LDA.b #$7E
	PHA
	PLB ; do stuff in bank 7E first

	; restore some standard SRAM stuff
	LDA.b #$18 : STA.w $7EF36C : STA.w $7EF36D ; HP
	LDA.b #$68 : STA.w $7EF379 ; Abilities

	; Chompy face player name
	REP #$20
	LDA.w #$00CE : STA.w $7EF3D9
	LDA.w #$018C : STA.w $7EF3DB : STA.w $7EF3DD : STA.w $7EF3DF

	; checksum
	LDA.w #$55AA : STA.w $7EF3E1

	SEP #$20
	; make the banks match just in case
	LDA.b SA1IRAM.preset_addr+2
	STA.b SA1IRAM.preset_prog+2
	STA.b SA1IRAM.preset_pert+2
	STA.b SA1IRAM.preset_reader+2
	STA.b SA1IRAM.preset_reader2+2

	; fill up addresses from preset header
	REP #$31
	LDA.b SA1IRAM.preset_addr
	STA.b SA1IRAM.preset_reader

	;print pc
	LDY.w #$0002 ; start getting data for the preset

	; get the persistence data location
	LDA.b [SA1IRAM.preset_addr]
	STA.b SA1IRAM.preset_pert

	LDA.b [SA1IRAM.preset_addr], Y
	STA.b SA1IRAM.preset_pert_end
	INY : INY

	LDA.b [SA1IRAM.preset_addr], Y
	STA.b SA1IRAM.preset_prog_end
	INY : INY

	; get stuff every preset has

	; Room/Screen ID
	LDA.b [SA1IRAM.preset_addr], Y : INY : INY : PHA ; save this

	; Link X and Y
	LDA.b [SA1IRAM.preset_addr], Y : INY #2 : STA.w $0022
	LDA.b [SA1IRAM.preset_addr], Y : INY #2 : STA.w $0020

	; Camera V and H
	LDA.b [SA1IRAM.preset_addr], Y : INY #2 : STA.w $00E6 : STA.w $00E8
	LDA.b [SA1IRAM.preset_addr], Y : INY #2 : STA.w $00E0 : STA.w $00E2

	SEP #$20
	; mirror portal
	LDA.b [SA1IRAM.preset_addr], Y : INY : STA.w $1ABF
	LDA.b [SA1IRAM.preset_addr], Y : INY : STA.w $1ACF
	LDA.b [SA1IRAM.preset_addr], Y : INY : STA.w $1ADF
	LDA.b [SA1IRAM.preset_addr], Y : INY : STA.w $1AEF

	; Item
	LDA.b [SA1IRAM.preset_addr], Y : INY : STA.w $0303

	; Link's direction
	LDA.b [SA1IRAM.preset_addr], Y : INY : STA.w $002F

	PHY : PHB
	JSR .writeSRAM

	JSL $00FC62

	REP #$30
	PLB : PLY

	PLA ; get ID back
	LDX.b SA1IRAM.preset_type

	PEA.w $7E80 ; push data banks we wanna use
	PLB

	JSR (.preset_types, X)

	; do the arbitrary writes first
	REP #$31
	PLB
	LDA.w #$0001
	;JSR .new_command_preload
	JSR .start_arb

	SEP #$30 ; bank 7E again
	LDA.b #$7E
	PHA
	PLB

	REP #$31 ; clear carry for the sbc on purpose

	; now do the persistent writes
	LDY.w #$0000
	LDA.b SA1IRAM.preset_pert
	SBC.b SA1IRAM.preset_pert_end
	BCC .skip_persist

	STA.b SA1IRAM.preset_pert_end
	LDA.b SA1IRAM.preset_pert
	STA.b SA1IRAM.preset_reader

.persist
	JSR .start_arb
	CPY.b SA1IRAM.preset_pert_end
	BCC .persist

.skip_persist
	; time for some fixers
	PHK
	PLB

	; do hud items from the items we have
	SEP #$30
	LDA.b #$7E : STA.b SA1IRAM.preset_reader+2

	LDY.w $0303
	LDA.w .item_to_menu, Y
	STA.w $0202

	CPY.b #$00
	REP #$30
	BEQ .no_item

.have_item
	TYA
	ASL : ASL ; get offset for this
	TAY

	LDX.w .item_HUD-4, Y ; bank0D offset
	STX.b SA1IRAM.preset_reader2

	LDA.w .item_HUD-2, Y ; bank7E SRAM val
	STA.b SA1IRAM.preset_reader+0

	LDA.b [SA1IRAM.preset_reader]
	AND.w #$00FF

	CPY.w #$0001*4 : BEQ .bombs_adjust
	CPY.w #$000B*4 : BNE .normal_item

.bottle_adjust
	TAX
	LDA.l $7EF35C-1, X
	AND.w #$00FF

.normal_item
	ASL
	ASL
	ASL
	ADC.b SA1IRAM.preset_reader2
	TAX
	BRA .draw_item

.bombs_adjust
	CMP.w #$0001
	BCS .draw_item

.no_item
	LDX.w #$FEE7 ; value happens to have $207F x4

.draw_item
	LDA.l $0D0000, X : STA.w SA1RAM.HUD+$04A
	LDA.l $0D0002, X : STA.w SA1RAM.HUD+$04C
	LDA.l $0D0004, X : STA.w SA1RAM.HUD+$08A
	LDA.l $0D0006, X : STA.w SA1RAM.HUD+$08C

	; make rupees match
	LDA.l $7EF360 : STA.l $7EF362

	; these are hardcoded
	; DISGUSTING

	; add sanc heart for nmg
	LDA.w !ram_preset_category
	AND.w #$00FF
	BNE .notNMG

	; add powder for nmg
	LDA.b SA1IRAM.preset_addr
	CMP.w #presetmenu_nmg_eastern_octorok
	BCC .noitembonus

	LDA.w !ram_nmg_sanctuary_heart
	AND.w #$00FF
	BEQ .nosanc

	LDA.l $7EF36C : CLC : ADC.w #$0807 ; carry is set here
	STA.l $7EF36C

	LDA.b SA1IRAM.preset_addr

.nosanc
	CMP.w #presetmenu_nmg_aga_after_lost_woods
	BCC .noitembonus

	SEP #$10
	LDX.w !ram_nmg_powder

	; if nothing or shroom, just add it in as is
	CPX.b #$02 : BCC .set_powder

	LDX.b #$01 ; to set to shroom

	; If we should have powder, we should have it after lottery
	CMP.w #presetmenu_nmg_ice_medallion
	BCC .set_powder

	INX ; 2 for powder

.set_powder
	SEP #$20
	TXA
	STA.l $7EF344
	REP #$30

.noitembonus



.notNMG


.done
	SEP #$30
	LDA.b #$41 : STA.b SA1IRAM.TIMER_FLAG

	LDA.b #$00
	PHA
	PLB

	PEA.w $0000
	PLD

	; reset stuff before preset goes

	; Reload graphics and palette for sword, shield and armor
	JSL DecompSwordGfx
	JSL Palette_Sword
	JSL DecompShieldGfx
	JSL Palette_Shield
	JSL Palette_Armor

	LDA.b $1B : BEQ .overworld

	JSL UpdateBarrierTileChr

	LDA.b $11 : PHA
	LDA.b #$07 : STA.w $0690
	JSL Dungeon_AnimateTrapDoors
	PLA : STA.b $11

.overworld
	LDA.l $7EF3CC : PHP ; remember if no follower
	CMP.b #$0D : BNE .superbomb

	LDA.b #$FE : STA.w $04B4

.superbomb
	PLP : BEQ .no_tagalong
	JSL Tagalong_LoadGfx

.no_tagalong
	SEP #$30
	JSL Player_ResetState

	STZ.w $02E4
	STZ.w $0112
	STZ.w $0345
	STZ.w $0216
	STZ.w $03F3
	STZ.w $0322

	STZ.b $57
	STZ.b $5D
	STZ.b $EF

	STZ.w SA1IRAM.LanmoCycles+0
	STZ.w SA1IRAM.LanmoCycles+1
	STZ.w SA1IRAM.LanmoCycles+2

	JSL SNES_DISABLE_CUSTOM_NMI

	;REP #$20
	;LDX.w SA1IRAM.preset_type
	;JSR (.after_func, X)

	REP #$30
	LDA.w #$01FF
	TCS

	SEP #$30
	LDA.b #$81
	STA.w $4200

	STZ.b $12
	JML $008034

;---------------------------------------------------------------------------------------------------

.preset_types
	dw preset_abort_fast
	dw presetload_dungeon
	dw presetload_overworld

; $0303 -> $0202
.item_to_menu
	db $00 ; $00 - Nothing
	db $04 ; $01 - Bombs
	db $02 ; $02 - Boomerang
	db $01 ; $03 - Bow
	db $0C ; $04 - Hammer
	db $06 ; $05 - Fire Rod
	db $07 ; $06 - Ice Rod
	db $0E ; $07 - Bug catching net
	db $0D ; $08 - Flute
	db $0B ; $09 - Lamp
	db $05 ; $0A - Magic Powder
	db $10 ; $0B - Bottle
	db $0F ; $0C - Book of Mudora
	db $12 ; $0D - Cane of Byrna
	db $03 ; $0E - Hookshot
	db $08 ; $0F - Bombos Medallion
	db $09 ; $10 - Ether Medallion
	db $0A ; $11 - Quake Medallion
	db $11 ; $12 - Cane of Somaria
	db $13 ; $13 - Cape
	db $14 ; $14 - Magic Mirror

; dw bank0D address, SRAM address
.item_HUD
	dw $0DF699, $7EF343 ; $01 - Bombs
	dw $0DF671, $7EF341 ; $02 - Boomerang
	dw $0DF649, $7EF340 ; $03 - Bow
	dw $0DF721, $7EF34B ; $04 - Hammer
	dw $0DF6C1, $7EF345 ; $05 - Fire Rod
	dw $0DF6D1, $7EF346 ; $06 - Ice Rod
	dw $0DF751, $7EF34D ; $07 - Bug catching net
	dw $0DF731, $7EF34C ; $08 - Flute
	dw $0DF711, $7EF34A ; $09 - Lamp
	dw $0DF6A9, $7EF344 ; $0A - Magic Powder
	dw $0DF771, $7EF34F ; $0B - Bottle
	dw $0DF761, $7EF34E ; $0C - Book of Mudora
	dw $0DF7C9, $7EF351 ; $0D - Cane of Byrna
	dw $0DF689, $7EF342 ; $0E - Hookshot
	dw $0DF6E1, $7EF347 ; $0F - Bombos Medallion
	dw $0DF701, $7EF348 ; $10 - Ether Medallion
	dw $0DF6F1, $7EF349 ; $11 - Quake Medallion
	dw $0DF7B9, $7EF350 ; $12 - Cane of Somaria
	dw $0DF7D9, $7EF352 ; $13 - Cape
	dw $0DF7E9, $7EF353 ; $14 - Magic Mirror



;===================================================================================================

.write8bit
	INY
	INY

	SEP #$20
	LDA.b [SA1IRAM.preset_reader], Y
	STA.b (SA1IRAM.preset_writer)
	REP #$20

	INY
	LDA.b [SA1IRAM.preset_reader], Y
	CMP.w #$0010
	BCC .new_command

.start_8bit
	STA.b SA1IRAM.preset_writer
	BRA .write8bit

.write16bit
	INY
	INY

	LDA.b [SA1IRAM.preset_reader], Y
	STA.b (SA1IRAM.preset_writer)

	INY
	INY
	LDA.b [SA1IRAM.preset_reader], Y
	CMP.w #$0010
	BCC .new_command

	STA.b SA1IRAM.preset_writer
	BRA .write16bit

.toBank7F
	SEP #$20
	LDA.b #$7F
	PHA
	PLB
	REP #$20
	INY
	INY
	LDA.b [SA1IRAM.preset_reader], Y
	CMP.w #$0010
	BCS .start_8bit
	BRA .new_command


.start_arb_no_comm
	LDA.b [SA1IRAM.preset_reader], Y
	BRA .new_command_preload

.start_arb
	LDA.b [SA1IRAM.preset_reader], Y

.new_command
	INY
	INY

.new_command_preload
	ASL
	TAX
	LDA.b [SA1IRAM.preset_reader], Y
	STA.b SA1IRAM.preset_writer

	JMP (.commands, X)

.write2N
	INY
	INY

	JSR .setupAndDo2N

	PLY
	LDA.b [SA1IRAM.preset_reader], Y
	CMP.w #$0010
	BCC .new_command

	STA.b SA1IRAM.preset_writer
	BRA .write2N

.write2Nplus1
	INY
	INY

	JSR .setupAndDo2N

	; one last byte
	SEP #$20
	LDA.b [SA1IRAM.preset_reader2], Y
	STA.b (SA1IRAM.preset_writer), Y
	REP #$20

	PLY
	INY ; account for the last byte
	LDA.b [SA1IRAM.preset_reader], Y
	CMP.w #$0010
	BCC .new_command

	STA.b SA1IRAM.preset_writer
	BRA .write2Nplus1

.setupAndDo2N
	LDA.b [SA1IRAM.preset_reader], Y
	AND.b #$00FF
	STA.b SA1IRAM.preset_scratch+0

	PLX ; recover return address

	SEC ; since we also want to add 1
	TYA ; let's move Y to the end of this data block
	ADC.b SA1IRAM.preset_scratch+0
	PHA ; push new location of Y
	PHX ; push return address

	LDX.b SA1IRAM.preset_scratch+0 ; get size of transfer

	; get first byte of the data so we can do Y=0 to start both
	SEC ; again, we want to add 1, to account for the size byte
	TYA
	ADC.b SA1IRAM.preset_reader+0 ; address to read from
	STA.b SA1IRAM.preset_reader2+0
	TAY

..next
	LDA.b [SA1IRAM.preset_reader2], Y
	STA.b (SA1IRAM.preset_writer), Y
	INY
	INY
	DEX
	BNE ..next

#preset_abort_fast:
	RTS

.commands
	dw .done_arb
	dw .write8bit
	dw .write16bit
	dw .done

	dw .write2N
	dw .write2Nplus1
	dw .done
	dw .done

	dw .done_arb
	dw .done_arb
	dw .done_arb
	dw .done_arb

	dw .done_arb
	dw .done_arb
	dw .done_arb
	dw .toBank7F

;---------------------------------------------------------------------------------------------------

.writeSRAM
	SEP #$21
	LDA.b #$7E
	PHA
	PLB
	REP #$20

	LDA.b SA1IRAM.preset_prog_end
	SBC.b SA1IRAM.preset_prog
	STA.b SA1IRAM.preset_writer

	LDY.w #$0000
	BRA ..start

..next_from_room
	INY

..next
	INY

..start
	LDA.b [SA1IRAM.preset_prog], Y

	INY
	INY
	CPY.b SA1IRAM.preset_writer
	BCS ..done

	TAX
	BPL ..write_16

	SEP #$20
	LDA.b [SA1IRAM.preset_prog], Y
	STA.w $7E0000, X
	REP #$20
	BRA ..next

..write_16
	BIT.w #$4000
	BNE ..not_room
	LDA.b [SA1IRAM.preset_prog], Y
	STA.w $7EF000, X
	BRA ..next_from_room

..not_room
	LDA.b [SA1IRAM.preset_prog], Y
	STA.w $7EB000, X
	BRA ..next_from_room

..done
.done_arb
	RTS

;===================================================================================================

presetload_overworld:
	; preloaded with screen ID
	STA.w $008A : STA.w $040A

	LDA.b [SA1IRAM.preset_addr], Y : INY #2
	STA.w $061C : DEC : DEC : STA.w $061E

	LDA.b [SA1IRAM.preset_addr], Y : INY #2
	STA.w $0618 : DEC : DEC : STA.w $061A

	LDA.b [SA1IRAM.preset_addr], Y : INY #2 : STA.w $0084
	SEC : SBC.w #$0400 : AND.w #$0F80 : ASL : XBA : STA.w $0088
	LDA.w $0084 : SEC : SBC.w #$0010 : AND.w #$003E : LSR : STA.w $0086

	LDA.b [SA1IRAM.preset_addr], Y : INY #2 : STA.w $0624
	EOR.w #$FFFF : INC : STA.w $0626

	LDA.b [SA1IRAM.preset_addr], Y : INY #2 : STA.w $0628
	EOR.w #$FFFF : INC : STA.w $062A

	SEP #$30
	STZ.w $001B ; outdoors

	BIT.w $008A ; do mirror portal?
	BVS .darkworld

	LDA.b #$6C ; add portal to sprite list
	STA.w $0E2F

	LDA.b #$08
	STA.w $0DDF

.darkworld
	JSR SaveALot

	REP #$20
	LDA.w #$0009 : STA.w $0010
	LDA.w #$FFF8 : STA.w $00EC
	STZ.w $0696 : STZ.w $0698
	STZ.w $2116
	
	REP #$20
	JSL $02EA30
	SEP #$20

	JSL $0AB911

	JSL $02B116 : JSR OWToVRAM

	LDA.w $0410 : PHA
	LDA.w $0416 : PHA
	LDA.w $0418 : PHA
	PEI.b ($84)
	PEI.b ($86)
	PEI.b ($88)
	PEI.b ($8A)

	LDA.b $8C : STA.b $8A
	LDA.w #$0390 : STA.b $84
	LDA.w #$001F : STA.b $88
	STZ.b $86

	STZ.w $0410
	STZ.w $0416
	STZ.w $0418

	JSL LoadOverworldOverlay : JSR OWToVRAM

	PLA : STA.b $008A
	PLA : STA.b $0088
	PLA : STA.b $0086
	PLA : STA.b $0084
	PLA : STA.w $0418
	PLA : STA.w $0416
	PLA : STA.w $0410

	SEP #$30
	JSL $09C499

	JSR PullALot

	LDA.w #$0009 : STA.w $0010
	SEP #$20
	LDA.b #$0F : STA.w $0013
	STZ.w $0200 : STZ.w $00B0

	RTS
;---------------------------------------------------------------------------------------------------

OWToVRAM:
	SEP #$30
	STZ.b $17 : STZ.w $0710

	LDA.b #$7F : STA.w $4304
	LDA.b #$80 : STA.w $2115

	REP #$31

	LDA.w #$2000 : STA.w $4302
	LDY.w #$0080 : LDX.w #$0000
	LDA.w #$1801 : STA.w $4300

.next_chunk
	LDA.l $7F4000,X : STA.w $2116 : STY.w $4305 : LDA.w #$0001 : STA.w $420B
	LDA.l $7F4002,X : STA.w $2116 : STY.w $4305 : LDA.w #$0001 : STA.w $420B
	LDA.l $7F4004,X : STA.w $2116 : STY.w $4305 : LDA.w #$0001 : STA.w $420B
	LDA.l $7F4006,X : STA.w $2116 : STY.w $4305 : LDA.w #$0001 : STA.w $420B

	TXA : ADC.w #$0008 : TAX

	CPX.w #$0080
	BCC .next_chunk

	RTS

;===================================================================================================

presetload_dungeon:
	; we come preloaded with dungeon ID
	STA.w $00A0 : STA.w $048E

	STZ.w $00A6

	; entrance
	SEP #$20
	LDA.b [SA1IRAM.preset_addr], Y : INY
	STA.w $010E

	LDA.b #$01 : STA.w $001B
	; quadrants

	; ab....cd
	; a bit that goes in $A6
	; b bit that goes in $A7
	; c bit that goes in $A9
	; d bit that goes in $AA
	SEP #$20
	LDA.b [SA1IRAM.preset_addr], Y
	INY

	STA.b SA1IRAM.preset_writer
	ASL : ROL.w $00A6 : ASL.w $00A6
	ASL : ROL.w $00A7 : ASL.w $00A7
	LDA.b SA1IRAM.preset_writer : AND.b #$01 : STA.w $00A9
	LDA.b SA1IRAM.preset_writer : AND.b #$02 : STA.w $00AA

	; graphics
	LDA.b [SA1IRAM.preset_addr], Y : INY : STA.w $0AA1

	; Music
	LDA.b [SA1IRAM.preset_addr], Y : INY : STA.w $0132
	CMP.b #$03 : BNE .notbeginning

	LDA.l $7EF3C5 : CMP.b #$02 : BCC .nozelda

	LDA.b #$12

.nozelda
	STA.w $0132

.notbeginning

	; Floor
	LDA.b [SA1IRAM.preset_addr], Y : INY : STA.w $00A4

	; Dungeon ID
	LDA.b [SA1IRAM.preset_addr], Y : INY : STA.w $040C

	; Door
	LDA.b [SA1IRAM.preset_addr], Y : INY : STA.w $006C

	; Layer
	LDA.b [SA1IRAM.preset_addr], Y : INY : STA.w $00EE
	AND.b #$0F : STA.w $0476

	REP #$20

	; configure camera based on coordinates
	LDA.w $0020
	AND.w #$FF00 : STA.w $0600
	ORA.w #$0010 : STA.w $0604
	AND.w #$FE00 : STA.w $0602
	ORA.w #$0110 : STA.w $0606

	LDA.w $0022
	AND.w #$FF00 : STA.w $0608 : STA.w $060C
	AND.w #$FE00 : STA.w $060A
	ORA.w #$0100 : STA.w $060E

	LDA.w $00E8 : SEC : SBC.w #$0186 : AND.w #$01FF
	STA.w $061A : DEC : DEC : STA.w $0618

	LDA.w $00E2 : SEC : SBC.w #$017F : AND.w #$01FF
	STA.w $061E : DEC : DEC : STA.w $061C

	; other stuff to set
	STZ.w $0698
	LDA.w #$01F8 : STA.w $00EC

	REP #$30
	LDA.w #$000F : STA.w $0010

	JSR SaveALot
	JSL PresetLoadArea_UW
	JSL $09C114
	JSR PullALot

	LDA.w #$0007 : STA.w $0010

	RTS

;===================================================================================================

SaveALot:
	REP #$30
	PLA

	PHP
	PHD
	PHY
	PHX
	PHB

	PHA
	LDA.w #$0000
	TCD
	SEP #$30

	RTS

PullALot:
	REP #$30
	PLA

	PLB
	PLX
	PLY
	PLD
	PLP

	PHA
	RTS
