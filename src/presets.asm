; TODO command system for killing sprites in previous rooms
; db roomid : dw list
; populates $0B80

;===================================================================================================

pushpc

org $0098AB
	db $FF, $FF, $FF, $FF, $FF ; kept here intentionally

RefreshPegs:
	JSR.w $00908B
	RTL

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

;---------------------------------------------------------------------------------------------------

org $09F253
CheckForDeathReload:
	LDA.w !config_death_reload : BEQ GameOver01

	LDX.b #$03
	LDA.b #$06

--	CMP.l $7EF35C,X
	BEQ GameOver01

	DEX
	BPL --

	JSL preset_load_last_preset
	BRA GameOver01

warnpc $09F270
org $09F272 : dw CheckForDeathReload

GameOver01 = $09F2A4

pullpc

;===================================================================================================

PRESET_SUBMENU:
	SEP #$30

	LDA.w !config_preset_category
	ASL
	CLC
	ADC.w !config_preset_category
	TAX

	REP #$21

	LDA.l .pointers-1,X
	AND.w #$FF00
	STA.b SA1IRAM.cm_cursor+0

	LDA.l .pointers+1,X
	STA.b SA1IRAM.cm_cursor+2

#SetPresetMenuArea:
	; put bank in appropriate places
	STA.b SA1IRAM.preset_addr+1
	STA.b SA1IRAM.preset_prog+1
	STA.b SA1IRAM.preset_pert+1
	STA.b SA1IRAM.preset_reader+1
	STA.b SA1IRAM.preset_reader2+1

	LDA.b [SA1IRAM.cm_current_menu] ; save data pointer
	STA.b SA1IRAM.preset_prog

	LDY.b #$02
	LDA.b [SA1IRAM.cm_current_menu],Y ; save data pointer
	STA.b SA1IRAM.preset_pert

	; adjust the pointer to be in the correct spot for the menu
	LDA.b SA1IRAM.cm_current_menu
	ADC.w #$0004
	STA.b SA1IRAM.cm_current_menu

	RTL

; PRESET LIST
.pointers
	dl presetheader_nmg
	dl presetheader_100nmg
	dl presetheader_lownmg
	dl presetheader_lowleg
	dl presetheader_ad2020
	dl presetheader_adold
	dl presetheader_anyrmg
	dl BOSSRTA_SUBMENU-4

;===================================================================================================

!PRESET_WRITE_END     = $0000
!PRESET_WRITE_8       = $0001
!PRESET_WRITE_16      = $0002

!PRESET_WRITE_DIE     = $0008

!PRESET_WRITE_7F      = $000E
!PRESET_WRITE_7F_16   = $000F

macro write_end()
	dw !PRESET_WRITE_END
endmacro

macro write_7F()
	dw !PRESET_WRITE_7F
endmacro

macro write_7F_16()
	dw !PRESET_WRITE_7F_16
endmacro

macro write8_enable()
	dw !PRESET_WRITE_8
endmacro

macro write16_enable()
	dw !PRESET_WRITE_16
endmacro

macro write_deaths_enable()
	dw !PRESET_WRITE_DIE
endmacro

macro write_deaths(r, k)
	db <r> : dw <k>
endmacro

macro write8(addr, data)
	dw <addr> : db <data>
endmacro

macro write16(addr, data)
	dw <addr> : dw <data>
endmacro

macro writeroom(room, n)
	dw <room>*2 : dw <n>
endmacro

macro write16sram(addr, data)
	dw <addr>&$0FFF|$4000 : dw <data>
endmacro

;---------------------------------------------------------------------------------------------------

!PERTWRITE_SQ       = $0000
!PERTWRITE_MIRROR   = $0001

macro write_sq()
	dw !PERTWRITE_SQ
endmacro

macro write_mirror(xl, xh, yl, yh)
	dw !PERTWRITE_MIRROR
	db <xl>, <xh>, <yl>, <yh>
endmacro

;===================================================================================================

emptybg3:
	dw $7F20

;===================================================================================================
; Preset format:
;	%preset_ow("Name", pointer)
;===================================================================================================
; taken care of by macros:
;	dw SRAM endpoint
;	dw Persistence End
;
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
;	db $00 ; Entrance
;	db $00 ; Room layout
;		aa.. ..bb ; TODO document
;	db $00 ; Floor
;	db $02 ; Door / Peg state
;		s..p..dd
;		  s - shutter state ($0468)
;		  p - peg state ($7EC172)
;		  d - door ($6C)
;	db $00 ; Layer
;	dw $0000 ; Dead sprites
preset_load_last_preset:
	REP #$20

	LDA.w SA1IRAM.preset_addr
	BMI preset_load

	SEP #$20
	RTL

preset_load:
	JSR ResetBeforeLoading

	; clear sram mirror
	LDA.w #$F000 : STA.b $2181
	LDA.w #$0500 : STA.w $4355
	STX.w $420B

	; start loading preset data
	LDA.w #$3000 : TCD

	SEP #$20
	LDA.b #$7E
	PHA
	PLB ; do stuff in bank 7E first

	; restore some standard SRAM stuff
	LDA.b #$18 : STA.w $7EF36C : STA.w $7EF36D ; HP
	LDA.b #$F8 : STA.w $7EF379 ; Abilities

	; Chompy face player name
	REP #$20
	LDA.w #$00CE : STA.w $7EF3D9
	LDA.w #$018C : STA.w $7EF3DB : STA.w $7EF3DD : STA.w $7EF3DF

	; checksum
	LDA.w #$55AA : STA.w $7EF3E1

	LDA.w #$FFFF : STA.l $7EF401
	LDA.w #$F000 : STA.l $7EF20C : STA.l $7EF20E

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

	LDY.w #$0002 ; start getting data for the preset

	LDA.b [SA1IRAM.preset_addr]
	STA.b SA1IRAM.preset_pert_end

	LDA.b [SA1IRAM.preset_addr],Y
	STA.b SA1IRAM.preset_prog_end
	INY : INY

	; get stuff every preset has

	; Room/Screen ID
	LDA.b [SA1IRAM.preset_addr],Y : INY : INY : PHA ; save this

	; Link X and Y
	LDA.b [SA1IRAM.preset_addr],Y : INY #2 : STA.w $0022
	LDA.b [SA1IRAM.preset_addr],Y : INY #2 : STA.w $0020

	; Camera H and V
	LDA.b [SA1IRAM.preset_addr],Y : INY #2
	STA.w $00E0 : STA.w $0120 : STA.w $00E2 : STA.w $011E

	LDA.b [SA1IRAM.preset_addr],Y : INY #2
	STA.w $00E6 : STA.w $0124 : STA.w $00E8 : STA.w $0122

	SEP #$20

	; Item
	LDA.b [SA1IRAM.preset_addr],Y : INY : STA.w $0303

	; Link's direction
	LDA.b [SA1IRAM.preset_addr],Y : INY : STA.w $002F

	PHY : PHB

	JSR presetload_write_sram

	LDA.l !config_use_custom_load : BEQ .no_loadout

	JSR LoadCustomLoadOut
	BRA .done_loadout

.no_loadout
	JSR presetload_safeties

.done_loadout
	JSL $00FC62

	; prevent NMI from flashing screen
	SEP #$20

	LDA.b #$80 : STA.w $0013

	REP #$30

	PLB : PLY

	LDA.b SA1IRAM.preset_type
	AND.w #$00FF
	TAX
	PLA ; get ID back

	PEA.w $7E80 ; push data banks we wanna use
	PLB

	JSR (.preset_types,X)

	; prevent NMI again
	SEP #$20

	LDA.b #$01 : STA.w $4200

	; do the arbitrary writes
	REP #$31

	PLB
	JSR .start_arb

	JSR presetload_write_persist

	; time for some fixers
	PHK
	PLB

	; do hud items from the items we have
	JSL SetHUDItemGraphics

	; make rupees match
	REP #$20
	LDA.l $7EF360 : STA.l $7EF362

	LDA.w #$0000
	TCD

	SEP #$30

	PHA
	PLB

	; reset stuff before preset goes

	; Reload graphics and palette for sword, shield and armor
	JSL DecompSwordGfx
	JSL Palette_Sword
	JSL DecompShieldGfx
	JSL Palette_Shield
	JSL Palette_Armor

	JSR ApplyAfterLoading

	SEP #$30

	LDA.w SA1RAM.ganon_bats
	BEQ ++

	JSL GetRandomInt : STA.w $0B08
	JSL GetRandomInt : STA.w $0B09

++	JSL Rerandomize

	JMP TriggerTimerAndReset

;---------------------------------------------------------------------------------------------------

.preset_types
	dw preset_abort_fast
	dw presetload_dungeon
	dw presetload_overworld

;===================================================================================================

.write8bit
	INY
	INY

	SEP #$20
	LDA.b [SA1IRAM.preset_reader],Y
	STA.b (SA1IRAM.preset_writer)
	REP #$20

	INY
	LDA.b [SA1IRAM.preset_reader],Y
	CMP.w #$0010
	BCC .new_command

.start_8bit
	STA.b SA1IRAM.preset_writer
	BRA .write8bit

.write16bit
	INY
	INY

	LDA.b [SA1IRAM.preset_reader],Y
	STA.b (SA1IRAM.preset_writer)

	INY
	INY
	LDA.b [SA1IRAM.preset_reader],Y
	CMP.w #$0010
	BCC .new_command

.start_16bit
	STA.b SA1IRAM.preset_writer
	BRA .write16bit

.toBank7F
	SEP #$20

	LDA.b #$7F
	PHA
	PLB

	REP #$20

	LDA.b [SA1IRAM.preset_reader],Y
	CMP.w #$0010
	BCC .new_command

	CPX.w #!PRESET_WRITE_7F*2
	BEQ .start_8bit
	BRA .start_16bit

.start_arb
	LDA.b [SA1IRAM.preset_reader],Y

.new_command
	INY
	INY

	ASL
	TAX
	LDA.b [SA1IRAM.preset_reader],Y
	STA.b SA1IRAM.preset_writer

	JMP (.commands,X)

.write_deaths
	SEP #$20

	LDA.b #$7E
	PHA
	PLB

	REP #$20

	LDX.w #$FFFE

..next
	LDA.b [SA1IRAM.preset_reader],Y
	CMP.w #$0010 : BCC .new_command

	; can only kill 4 rooms worth of sprites
	INX : INX : CPX.w #$0008
	INY

	BCS ..skip

	PHX

	AND.w #$00FF
	STA.w $0B80,X

	ASL : TAX

	LDA.b [SA1IRAM.preset_reader],Y

	STA.l $7FFD80,X

	PLX

..skip
	INY : INY

	BRA ..next

.done_arb

#preset_abort_fast:
	RTS

.commands
	dw .done_arb
	dw .write8bit
	dw .write16bit
	dw .done_arb

	dw .done_arb
	dw .done_arb
	dw .done_arb
	dw .done_arb

	dw .write_deaths
	dw .done_arb
	dw .done_arb
	dw .done_arb

	dw .done_arb
	dw .done_arb
	dw .toBank7F
	dw .toBank7F

;---------------------------------------------------------------------------------------------------

presetload_write_sram:
	SEP #$21

	LDA.b #$7E
	PHA
	PLB

	REP #$20

	LDA.b SA1IRAM.preset_prog_end
	SBC.b SA1IRAM.preset_prog
	STA.b SA1IRAM.preset_writer

	LDY.w #$0000
	BRA .start

.next_from_room
	INY

.next
	INY

.start
	LDA.b [SA1IRAM.preset_prog],Y

	INY
	INY
	CPY.b SA1IRAM.preset_writer
	BCS .done

	TAX
	BPL .write_16

	SEP #$20
	LDA.b [SA1IRAM.preset_prog],Y
	STA.w $7E0000,X
	REP #$20
	BRA .next

.write_16
	BIT.w #$4000
	BNE .not_room
	LDA.b [SA1IRAM.preset_prog],Y
	STA.w $7EF000,X
	BRA .next_from_room

.not_room
	LDA.b [SA1IRAM.preset_prog],Y
	STA.w $7EB000,X
	BRA .next_from_room

.done
	RTS

;---------------------------------------------------------------------------------------------------

presetload_write_persist:
	SEP #$21
	REP #$10

	LDA.b #$7E
	PHA
	PLB

	REP #$20

	LDA.b SA1IRAM.preset_pert_end
	SBC.b SA1IRAM.preset_pert
	STA.b SA1IRAM.preset_writer

	LDY.w #$0000

.next
	REP #$20

	LDA.b [SA1IRAM.preset_pert],Y

	INY
	INY

	CMP.w #$0010
	BCC .command

	CPY.b SA1IRAM.preset_writer
	BCS .done

	TAX

	SEP #$20

	LDA.b [SA1IRAM.preset_pert],Y
	STA.w $7E0000,X

	INY
	BRA .next

.done
	RTS

.command
	ASL
	TAX

	JMP (.vectors,X)

.write_mirror
	SEP #$20

	LDA.b [SA1IRAM.preset_pert],Y : INY : STA.w $7E1ABF
	LDA.b [SA1IRAM.preset_pert],Y : INY : STA.w $7E1ACF
	LDA.b [SA1IRAM.preset_pert],Y : INY : STA.w $7E1ADF
	LDA.b [SA1IRAM.preset_pert],Y : INY : STA.w $7E1AEF

	BRA .next

.vectors
	dw .save_and_quit
	dw .write_mirror
	dw .nothing
	dw .nothing

	dw .nothing
	dw .nothing
	dw .nothing
	dw .nothing

	dw .nothing
	dw .nothing
	dw .nothing
	dw .nothing

	dw .nothing
	dw .nothing
	dw .nothing
	dw .nothing

	; clear things that may be important that are cleared during save and quit
.save_and_quit
	; prize packs
	STZ.w $0FC7
	STZ.w $0FC9
	STZ.w $0FCB
	STZ.w $0FCD

	; mirror portal
	STZ.w $1ABF
	STZ.w $1ACF
	STZ.w $1ADF
	STZ.w $1AEF

.nothing
	JMP .next

;===================================================================================================

presetload_safeties:
	PHB
	PHK
	PLB

	LDA.w !config_preset_category
	AND.w #$00FF
	ASL
	TAX

	SEP #$20

	LDY.b SA1IRAM.preset_addr

	JSR.w (.vectors,X)

	PLB
	RTS

; PRESET LIST
.vectors
	dw .nmg
	dw .hundo
	dw .lownmg
	dw .lowleg
	dw .ad2020
	dw .adold
	dw .anyrmg
	dw .bossrta

; No safeties
.bossrta
.lownmg
.lowleg
-- RTS

;---------------------------------------------------------------------------------------------------

.nmg
	; sanc heart
	CPY.w #presetmenu_nmg_eastern_octorok : BCC --

	LDA.w !config_safeties_nmg_sanc_heart : BEQ ..no_sanc

	REP #$21

	LDA.l $7EF36C : ADC.w #$0808 : STA.l $7EF36C

	; flag sanc chest
	LDA.l $7EF000+($12*2) : ORA.w #$0010 : STA.l $7EF000+($12*2)

	SEP #$20

..no_sanc
	; mushroom / powder / half magic
	LDA.w !config_safeties_nmg_powder
	BEQ ..no_powder

	CPY.w #presetmenu_nmg_aga_after_lost_woods : BCC ..no_powder

	CMP.b #$02 : BCC ..mushroom_only

	CPY.w #presetmenu_nmg_thieves_after_activating_flute : BCC ..mushroom_only

	CMP.b #$03

	LDA.b #$01
	BCC ..no_half_magic

	CPY.w #presetmenu_nmg_skull_fence_dash : BCC ..no_half_magic

	; flag bat
	REP #$20
	LDA.w #$0007 : STA.l $7EF000+($E3*2)
	SEP #$20

	LDA.b #$01
	STA.l $7EF37B

..no_half_magic
	; add ether if powder
	STA.l $7EF348

	; flag witch's hut
	REP #$20
	LDA.w #$0082 : STA.l $7EF000+($109*2)
	SEP #$20

	LDA.b #$02

..mushroom_only
	STA.l $7EF344

..no_powder
	; bottles
	LDA.w !config_safeties_nmg_bottles : BEQ ..no_bottles

	CMP.b #$01 : BEQ ..early

..late
	CPY.w #presetmenu_nmg_thieves_after_activating_flute : BCC ..no_bottles
	BRA ..set_bottles

..early
	CPY.w #presetmenu_nmg_desert_water_dash : BCC ..no_bottles

..set_bottles
	LDA.b #$02 : STA.l $7EF34F ; select 2nd bottle
	DEC : STA.l $7EF34D ; bug net
	LDA.b #$06 : STA.l $7EF35C : STA.l $7EF35D ; fairy bottles

..no_bottles
	; red mail
	LDA.w !config_safeties_nmg_red_mail : BEQ ..no_red_mail
	CPY.w #presetmenu_nmg_gtower_floor_3 : BCC ..no_red_mail

	LDA.b #$02 : STA.l $7EF35B

	; flag gt big chest
	REP #$20
	LDA.l $7EF000+($8C*2) : ORA.w #$0012 : STA.l $7EF000+($8C*2)
	SEP #$20

..no_red_mail
	; gold/silvers
	CPY.w #presetmenu_nmg_trock_icerod_overworld : BCC ..no_gs
	LDA.w !config_safeties_nmg_gs : BEQ ..no_gs
	CMP.b #$01 : BEQ ..silvers_only

..gold_sword
	LDA.b #$04 : STA.l $7EF359

..silvers_only
	LDA.b #$03 : STA.l $7EF340

	; flag fairy visits
	REP #$20
	LDA.l $7EF000+($116*2) : ORA.w #$0001 : STA.l $7EF000+($116*2)

	SEP #$20
	LDA.l $7EF2DB : ORA.b #$02 : STA.l $7EF2DB

..no_gs
	RTS

;---------------------------------------------------------------------------------------------------

.ad2020
	CPY.w #presetmenu_ad2020_pod_kiki_skip : BCC ..no
	LDA.w !config_safeties_ad2020_silvers : BEQ ..no

	LDA.b #$03 : STA.l $7EF340

	; flag fairy visits
	REP #$20
	LDA.l $7EF000+($116*2) : ORA.w #$0001 : STA.l $7EF000+($116*2)
	SEP #$20

..no
	RTS

;---------------------------------------------------------------------------------------------------

.adold
	CPY.w #presetmenu_adold_pod_kiki_skip : BCC ..no
	LDA.w !config_safeties_adold_silvers : BEQ ..no

	LDA.b #$03 : STA.l $7EF340

	; flag fairy visits
	REP #$20
	LDA.l $7EF000+($116*2) : ORA.w #$0001 : STA.l $7EF000+($116*2)
	SEP #$20

..no
	RTS

;---------------------------------------------------------------------------------------------------

.anyrmg
	CPY.w #presetmenu_anyrmg_tempered_frog_dmd : BCC ..no
	LDA.w !config_safeties_anyrmg_hook : BEQ ..no

	LDA.b #$01 : STA.l $7EF342

	; flag hook shot stuff
	REP #$20
	LDA.w #$248F : STA.l $7EF000+($037*2)
	LDA.w #$001F : STA.l $7EF000+($036*2)
	SEP #$20
..no
	RTS

;---------------------------------------------------------------------------------------------------

.hundo
	LDA.w !config_safeties_100nmg_trinexx_boom : BEQ ..no

	; flag boom chest
	REP #$20
	LDA.l $7EF000+($71*2) : ORA.w #$0010 : STA.l $7EF000+($71*2)
	SEP #$20

	LDA.b #$01
	CPY.w #presetmenu_100nmg_escape_ball_n_chains : BCC ..no

	CPY.w #presetmenu_100nmg_ice_palace_zoras_domain : BCC ..set_boom

	INC

..set_boom
	STA.l $7EF341

..no
	RTS

;===================================================================================================

presetload_overworld:
	; preloaded with screen ID
	STA.w $008A : STA.w $040A

	LDA.b [SA1IRAM.preset_addr],Y : INY #2
	STA.w $061C : DEC : DEC : STA.w $061E

	LDA.b [SA1IRAM.preset_addr],Y : INY #2
	STA.w $0618 : DEC : DEC : STA.w $061A

	LDA.b [SA1IRAM.preset_addr],Y : INY #2 : STA.w $0084
	SEC : SBC.w #$0400 : AND.w #$0F80 : ASL : XBA : STA.w $0088
	LDA.w $0084 : SEC : SBC.w #$0010 : AND.w #$003E : LSR : STA.w $0086

	; TODO setting these to 0 seems perfectly fine
	;LDA.b [SA1IRAM.preset_addr],Y : INY #2 : STA.w $0624
	;EOR.w #$FFFF : INC : STA.w $0626

	;LDA.b [SA1IRAM.preset_addr],Y : INY #2 : STA.w $0628
	;EOR.w #$FFFF : INC : STA.w $062A

	STZ.w $0624
	STZ.w $0626
	STZ.w $0628
	STZ.w $062A

	SEP #$30

	STZ.w $00EE ; layer
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

	SEP #$30

	LDA.b #$FF : STA.l $7EF36F ; no keys
	STA.w $040C ; no dungeon

	; load overworld music
	SEI

	STA.w $2140
	LDA.b #$01 : STA.w $4200
	STZ.w $0136

	JSL $008913

	JSL SetOverworldMusic

	JSR PullALot

	LDA.w #$0009 : STA.w $0010

	SEP #$20
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

SetOverworldMusic:
	SEP #$30

	LDY.b $8A

	; DM
	LDX.b #$02
	CPY.b #$40 : BCS .dark_world

	; kakariko
	CPY.b #$18 : BNE .not_kak
	LDA.l $7EF3C5 : CMP.b #$03 : BCS .continue
	LDX.b #$07 : BRA .save

.not_kak
	CMP.b #$00 : BNE .continue

	LDA.l $7EF300 : AND.b #$40 : BEQ .continue
	LDX.b #$05 : BRA .continue

.dark_world
	LDA.l $7EF3CA : BEQ .continue

	LDX.b #$09
	LDA.l $7EF357 : BNE .pearl

	LDX.b #$04 : BRA .save

.pearl
	CPY.b #$40 : BEQ .sw
	CPY.b #$43 : BEQ .sw
	CPY.b #$45 : BEQ .sw
	CPY.b #$47 : BNE .save

.sw
	LDX.b #$0D : BRA .save

.continue
	LDA.l $7EF3C5 : CMP.b #$02 : BCS .save

	LDX.b #$03

.save
	STX.w $012C
	STX.w $2140

	RTL

;===================================================================================================

presetload_dungeon:
	; we come preloaded with room ID
	JSR SetLoadedRoomID

	; entrance
	SEP #$20
	LDA.b [SA1IRAM.preset_addr],Y : INY

	JSR SetDungeonEntranceAndProperties

	SEP #$20
	; quadrants

	; ab.. ..cd
	; a bit that goes in $A6
	; b bit that goes in $A7
	; c bit that goes in $A9
	; d bit that goes in $AA
	LDA.b [SA1IRAM.preset_addr],Y
	INY
	STA.b SA1IRAM.preset_writer

	ASL : ROL.w $00A6 : ASL.w $00A6
	ASL : ROL.w $00A7 : ASL.w $00A7
	LDA.b SA1IRAM.preset_writer : AND.b #$01 : STA.w $00A9
	LDA.b SA1IRAM.preset_writer : AND.b #$02 : STA.w $00AA

	; Floor
	LDA.b [SA1IRAM.preset_addr],Y : INY : STA.w $00A4

	; Door
	LDA.b [SA1IRAM.preset_addr],Y : INY
	PHA ; save for shutter and peg state later
	AND.b #$03 : STA.w $006C

	; Layer
	LDA.b [SA1IRAM.preset_addr],Y : AND.b #$0F : STA.w $00EE
	LDA.b [SA1IRAM.preset_addr],Y : LSR : LSR : LSR : LSR : STA.w $0476

	INY

	JSR ConfigureCameraToCoordinates

;---------------------------------------------------------------------------------------------------

	SEP #$20

	LDA.l $7EF36F : PHA

	JSR SaveALot

	JSL PresetLoadArea_UW

	SEP #$20

	LDA.b #$01 : STA.w $4200
	; get shutter door state
	LDA 10,S : AND.b #$80 : EOR.b #$80 : ASL : ROL

	JSR HandleOpenShutters

	SEP #$20
	; get crystal switch state
	LDA 10,S : AND.b #$10
	LSR : LSR : LSR : LSR

	JSR HandlePegState

	JSR PullALot

;---------------------------------------------------------------------------------------------------

	LDA.w #$0007 : STA.w $0010

	; kill sprites that shouldn't be alive
	LDA.b [SA1IRAM.preset_addr],Y : INY : INY

	JSR KillSpritesInRoom

	SEP #$20
	; get keys
	PLA : STA.l $7EF36F

	; remove door properties
	PLA

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

;===================================================================================================

OpenShutterDoors:
	REP #$30

	PHB

	LDY.w #$0000

	PHY
	PLB
	PLB

--	LDA.w $19A0,Y
	BEQ ++

	PHY
	JSR .open
	PLY

++	INY
	INY
	CPY.w #$0020
	BCC --

	PLB
--	RTS

.open
	LDA.w $1980,Y
	AND.w #$00FE
	TAX

	CMP.w #$0018
	BEQ .shutter

	CMP.w #$0044
	BNE --

.shutter
	LDA.l $009A52,X
	STA.b $00

	LDA.l $009A02,X
	STA.b $02

	LDA.w $19C0,Y
	AND.w #$0003
	ASL
	TAX

	LDA.l .vectors,X
	PHA

	LDA.w $19A0,Y
	STA.b $04

	RTS

.vectors
	dw .north-1
	dw .south-1
	dw .west-1
	dw .east-1


.north
	LSR
	AND.w #$783F
	TAX

	LDA.b $00
	STA.l $7F2001,X
	STA.l $7F2041,X
	STA.l $7F2081,X
	STA.l $7F20C1,X
	STA.l $7F2101,X
	STA.l $7F2141,X
	STA.l $7F2181,X

	LDA.w #$0000
	STA.l $7F21C1,X

	LDX.b $02
	LDA.l $00CD9E,X
	TAY

	LDX.b $04

	LDA.w #$0004
	STA.b $0E

--	TXA
	JSR .toVRAMAddr

	LDA.w $009B52+0,Y
	STA.l $7E2000,X
	STA.w $2118

	TXA
	CLC
	ADC.w #$0080
	JSR .toVRAMAddr

	LDA.w $009B52+2,Y
	STA.l $7E2080,X
	STA.w $2118

	TXA
	CLC
	ADC.w #$0100
	JSR .toVRAMAddr

	LDA.w $009B52+4,Y
	STA.l $7E2100,X
	STA.w $2118


	TYA
	CLC
	ADC.w #$0006
	TAY

	INX
	INX

	DEC.b $0E
	BNE --

	RTS

.south
	LSR
	TAX

	LDA.b $00
	STA.l $7F2041,X
	STA.l $7F2081,X
	STA.l $7F20C1,X
	STA.l $7F2101,X
	STA.l $7F2141,X

	LDX.b $02
	LDA.l $00CE06,X
	TAY

	LDX.b $04

	LDA.w #$0004
	STA.b $0E

--	TXA
	CLC
	ADC.w #$0080
	JSR .toVRAMAddr

	LDA.w $009B52+0,Y
	STA.l $7E2080,X
	STA.w $2118

	TXA
	CLC
	ADC.w #$0100
	JSR .toVRAMAddr

	LDA.w $009B52+2,Y
	STA.l $7E2100,X
	STA.w $2118

	TXA
	CLC
	ADC.w #$0180
	JSR .toVRAMAddr

	LDA.w $009B52+4,Y
	STA.l $7E2180,X
	STA.w $2118


	TYA
	CLC
	ADC.w #$0006
	TAY

	INX
	INX

	DEC.b $0E
	BNE --


	RTS

.west
	LSR
	AND.w #$FFE0
	TAX

	LDA.b $00
	CLC
	ADC.w #$0101
	STA.l $7F2040,X
	STA.l $7F2042,X
	STA.l $7F2080,X
	STA.l $7F2082,X

	AND.w #$00FF
	STA.l $7F2044,X
	STA.l $7F2084,X

	LDX.b $02
	LDA.l $00CE66,X
	TAY

	LDX.b $04

	LDA.w #$0003
	STA.b $0E

--	TXA
	CLC
	ADC.w #$0000
	JSR .toVRAMAddr

	LDA.w $009B52+0,Y
	STA.l $7E2000,X
	STA.w $2118

	TXA
	CLC
	ADC.w #$0080
	JSR .toVRAMAddr

	LDA.w $009B52+2,Y
	STA.l $7E2080,X
	STA.w $2118

	TXA
	CLC
	ADC.w #$0100
	JSR .toVRAMAddr

	LDA.w $009B52+4,Y
	STA.l $7E2100,X
	STA.w $2118

	TXA
	CLC
	ADC.w #$0180
	JSR .toVRAMAddr

	LDA.w $009B52+6,Y
	STA.l $7E2180,X
	STA.w $2118

	TYA
	CLC
	ADC.w #$0008
	TAY

	INX
	INX

	DEC.b $0E
	BNE --

	RTS

.east
	LSR
	TAX

	LDA.b $00
	CLC
	ADC.w #$0101
	STA.l $7F2042,X
	STA.l $7F2044,X
	STA.l $7F2082,X
	STA.l $7F2084,X

	AND.w #$FF00
	STA.l $7F2040,X
	STA.l $7F2080,X

	LDX.b $02
	LDA.l $00CEC6,X

	TAY

	LDX.b $04

	LDA.w #$0003
	STA.b $0E

--	TXA
	CLC
	ADC.w #$0002
	JSR .toVRAMAddr

	LDA.w $009B52+0,Y
	STA.l $7E2002,X
	STA.w $2118

	TXA
	CLC
	ADC.w #$0082
	JSR .toVRAMAddr

	LDA.w $009B52+2,Y
	STA.l $7E2082,X
	STA.w $2118

	TXA
	CLC
	ADC.w #$0102
	JSR .toVRAMAddr

	LDA.w $009B52+4,Y
	STA.l $7E2102,X
	STA.w $2118

	TXA
	CLC
	ADC.w #$0182
	JSR .toVRAMAddr

	LDA.w $009B52+6,Y
	STA.l $7E2182,X
	STA.w $2118

	TYA
	CLC
	ADC.w #$0008
	TAY

	INX
	INX

	DEC.b $0E
	BNE --

	RTS

.toVRAMAddr
	STA.b $08
	AND.w #$0040
	LSR : LSR : LSR : LSR
	XBA
	STA.b $0A

	LDA.b $08
	AND.w #$303F
	LSR
	TSB.b $0A

	LDA.b $08
	AND.w #$0F80
	LSR : LSR
	ORA.b $0A

	STA.w $2116

	RTS
