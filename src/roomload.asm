LoadArbitraryRoom:
	JSR ResetBeforeLoading

	SEP #$30

	LDX.w SA1RAM.loadroomid
	LDA.l .entrance,X : JSR SetDungeonEntranceAndProperties

	SEP #$10
	LDX.w SA1RAM.loadroomid

	REP #$30
	LDA.w #$3000 : TCD

	TXA : ASL : ADC.w SA1RAM.loadroomid : TAX

	LDA.l $1F83C0,X : STA.b SA1IRAM.preset_scratch+0
	LDA.l $1F83C1,X : STA.b SA1IRAM.preset_scratch+1

	LDA.b [SA1IRAM.preset_scratch]
	CMP.b #$FFFF : BEQ .no_doors

	; Find optimal door type
	; TODO


.save_door
	SEP #$20

	; door direction
	STZ.b SA1IRAM.preset_scratch+3
	LSR : ROL.b SA1IRAM.preset_scratch+3
	LSR : ROL.b SA1IRAM.preset_scratch+3
	LSR

	SEP #$10

	LDX.b SA1IRAM.preset_scratch+3

	; door position
	REP #$30

	AND.w #$001E
	TAY

	STZ.b SA1IRAM.preset_scratch+1

	; calc link's direction
	TXA

	SEP #$20
	BIT.b #$02 : BNE ++

	EOR.b #$03 ; flip both bits; will unflip bit 1 on next op

++	EOR.b #$02

	ASL : STA.w $002F

	; find proper table to read
	REP #$30

	LDA.l .door_position_tables,X
	STA.b SA1IRAM.preset_scratch

	LDA.b [SA1IRAM.preset_scratch],Y
	PHA

	AND.w #$01FF
	ASL : ASL
	ADC.w #$0008
	STA.w $0022

	PLA
	AND.w #$0E00
	LSR : LSR : LSR : LSR
	STA.w $0020
	BRA .adjust_coords

.no_doors
	LDA.w #$0078
	STA.w $0020
	STA.w $0022

	; fix X and Y coordinates to match
.adjust_coords
	SEP #$20
	LDA.w $00A0 : AND.b #$F0 : LSR : LSR : LSR : TSB.w $0020
	LDA.b $00A0 : AND.b #$0F : ASL : TSB.w $0020

	JMP TriggerTimerAndReset

;---------------------------------------------------------------------------------------------------

.door_position_tables
	dw $00997E ; North
	dw $009996 ; South
	dw $0099AE ; West
	dw $0099C6 ; East


;---------------------------------------------------------------------------------------------------

.entrance
	fillbyte $00 : fill 256

; TODO
;%room_load($7B) ; 0000
;%room_load($82) ; 0003
;%room_load($38) ; 0008
;%room_load($37) ; 000C
;%room_load($2D) ; 000E
;%room_load($36) ; 0010
;%room_load($81) ; 0011
;%room_load($02) ; 0012
;%room_load($7C) ; 0018
;%room_load($15) ; 0023
;%room_load($19) ; 0024
;%room_load($25) ; 0028
;%room_load($3B) ; 002C
;%room_load($39) ; 002F
;%room_load($75) ; 0030
;%room_load($3A) ; 003C
;%room_load($26) ; 004A
;%room_load($74) ; 0051
;%room_load($32) ; 0055
;%room_load($28) ; 0056
;%room_load($29) ; 0057
;%room_load($2A) ; 0058
;%room_load($2B) ; 0059
;%room_load($03) ; 0060
;%room_load($04) ; 0061
;%room_load($05) ; 0062
;%room_load($0C) ; 0063
;%room_load($77) ; 0067
;%room_load($78) ; 0068
;%room_load($33) ; 0077
;%room_load($73) ; 0080
;%room_load($0B) ; 0083
;%room_load($09) ; 0084
;%room_load($0A) ; 0085
;%room_load($27) ; 0098
;%room_load($08) ; 00C9
;%room_load($18) ; 00D5
;%room_load($35) ; 00D6
;%room_load($34) ; 00DB
;%room_load($20) ; 00DF
;%room_load($24) ; 00E0
;%room_load($2C) ; 00E1
;%room_load($12) ; 00E2
;%room_load($11) ; 00E3
;%room_load($30) ; 00E4
;%room_load($31) ; 00E5
;%room_load($2E) ; 00E6
;%room_load($2F) ; 00E7
;%room_load($14) ; 00E8
;%room_load($23) ; 00EA
;%room_load($17) ; 00EB
;%room_load($1B) ; 00ED
;%room_load($1D) ; 00EE
;%room_load($1F) ; 00EF
;%room_load($06) ; 00F0
;%room_load($07) ; 00F1
;%room_load($0D) ; 00F2
;%room_load($0E) ; 00F3
;%room_load($0F) ; 00F4
;%room_load($10) ; 00F5
;%room_load($13) ; 00F8
;%room_load($21) ; 00F9
;%room_load($22) ; 00FA
;%room_load($16) ; 00FB
;%room_load($1A) ; 00FD
;%room_load($1C) ; 00FE
;%room_load($1E) ; 00FF


;===================================================================================================

ResetBeforeLoading:
	SEP #$30

	LDA.b #$80
	STA.w $2100
	STZ.w $4200
	STZ.w $420C

	REP #$20

	LDA.w #$0000 : TCD

	STZ.w $011A : STZ.w $011C

	STZ.b $1E
	STZ.b $95
	STZ.b $97
	STZ.b $EA
	STZ.w $012C
	STZ.w $012E

	SEP #$30

	STA.l $7EC011

	JSL $07F18C

	LDA.b #$F0 : STA.b $2140
	LDA.b #$05 : STA.b $2143

	STZ.w $0112
	STZ.w $0126
	STZ.w $0128
	STZ.w $0133
	STZ.w $0216
	STZ.w $02E4
	STZ.w $02EC
	STZ.w $02F0
	STZ.w $0322
	STZ.w $0345
	STZ.w $03F3
	STZ.w $03FC
	STZ.w $046C
	STZ.w $0710
	STZ.w $0ABD

	STZ.b $57
	STZ.b $5D
	STZ.b $EF
	STZ.b $9B

	STZ.w SA1IRAM.LanmoCycles+0
	STZ.w SA1IRAM.LanmoCycles+1
	STZ.w SA1IRAM.LanmoCycles+2

	STZ.w $0128 ; disable IRQ
	; big blocks of zeros clear tile map

	REP #$20

	LDA.w #$2100 : TCD

	; disable sound effects now
	LDX.b #$05 : STX.b $2141
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

	; clear some wram
	LDA.w #$0500 : STA.w $4355
	LDA.w #$0B00 : STA.b $2181
	STX.w $420B

	RTS

;===================================================================================================

ApplyAfterLoading:
	PEA.w $0000
	PLD

	; run palettes
	SEP #$30

	; check translucency
	LDA.w $0ABD : BEQ ++

	JSL $02FD04

++	REP #$10

	LDA.b #$80 : STA.w $2100

	STZ.w $2121
	LDY.w #$2200 : STY.w $4350
	LDY.w #$C500 : STY.w $4352
	LDY.w #$0200 : STY.w $4355
	LDA.b #$7E : STA.w $4354
	LDA.b #$20 : STA.w $420B

	; fix camera
	SEP #$30

	LDA.w $0120 : STA.w $210D
	LDA.w $0121 : STA.w $210D

	LDA.w $0124 : STA.w $210E
	LDA.w $0125 : STA.w $210E

	LDA.w $011E : STA.w $210F
	LDA.w $011F : STA.w $210F

	LDA.w $0122 : STA.w $2110
	LDA.w $0123 : STA.w $2110

	LDA.l $7EF3CC : PHP ; remember if no follower
	CMP.b #$0D : BNE .superbomb

	LDA.b #$FE : STA.w $04B4

.superbomb
	PLP : BEQ .no_follower

	JSL $00D463

.no_follower
	RTS

;===================================================================================================

TriggerTimerAndReset:
	SEP #$30

	LDA.b #$41 : STA.w SA1IRAM.TIMER_FLAG

	LDA.b #$0F
	STA.b $13

	STZ.b $14
	STZ.b $15
	STZ.b $17
	STZ.b $18
	STZ.w $0710

	JML ResetGameStack

;===================================================================================================

SetLoadedRoomID:
	STA.w $00A0 : STA.w $048E
	STZ.w $00A4 ; clear previous room to prevent weirdness
	STZ.w $008A ; clear DW to prevent palette weirdness

	STZ.w $00A6 ; quadrants, which get manipulated shortly

	RTS

;===================================================================================================

SetDungeonEntranceAndProperties:
	REP #$30

	AND.w #$00FF
	STA.w $010E
	PHA
	ASL : TAX

	LDA.w #$01F8 : STA.w $00EC

	SEP #$20

	LDA.b #$01 : STA.w $001B

	REP #$30

	; overworld door
	LDA.l $02D488,X : STA.w $0696

	PLX

	SEP #$20

	; graphics
	LDA.l $02D0E5,X : STA.w $0AA1

	; dungeon ID
	LDA.l $02D1EF,X : STA.w $040C

	; Song
	LDA.l $02D592,X

	; dumb hardcoded stuff for Sanc and Link's house
	REP #$20
	AND.w #$00FF : TAX

	LDA.w $00A0
	CMP.w #$0012 : BEQ .sanc_music

	SEP #$20

	CPX.w #$0014 : BEQ .verify_sanc
	CPX.w #$00FF : BEQ .links_bed
	CPX.w #$00F2 : BEQ .fading

	; check for rain state theme
	CPX.w #$0003 : BNE .set_both
	LDA.l $7EF3C5 : CMP.b #$02 : BCC .set_both
	LDX.w #$0012 : BRA .set_both

.links_bed
	LDA.b #$03 : STA.w $0132
	LDA.b #$F0 : BRA .set_queue

.fading
	LDX.w #$0007 ; kak music

	LDA.l $7EF3C5 : CMP.b #$03
	BCC .dont_override_kak

	LDX.w #$0002 ; normal theme

.dont_override_kak
	LDA.w $010E
	CMP.b #$0F : BEQ .lw_theme ; argue bros
	CMP.b #$10 : BEQ .lw_theme ; argue bros
	CMP.b #$48 : BEQ .dw_theme ; red boom chest
	CMP.b #$49 : BEQ .lw_theme ; library

	; kak rooms
	CMP.b #$4C : BCC .set_fade ; kak rooms below witch hut
	CMP.b #$61 : BEQ .set_fade ; blind's hut

	LDX.w #$0002 ; LW theme
	CMP.b #$53 : BEQ .dw_theme ; bomb shop/c house
	CMP.b #$54 : BEQ .dw_theme ; bomb shop/c house

	; everything else is LW theme

.set_fade
	TXA
	STA.w $0132

	LDA.b #$F2
	BRA .set_queue

.sanc_music
	LDX.w #$0014 : BRA .set_both

.dw_theme
	LDX.w #$0009 : BRA .set_fade

.lw_theme
	LDX.w #$0009 : BRA .set_fade

.verify_sanc
	CMP.w #$0012 : BNE .set_both

	LDX.w #$0010 : BRA .set_both ; HC music

.set_both
	TXA
	STA.w $0132

.set_queue
	STA.w $012C

.done_music
	RTS

;===================================================================================================

ConfigureCameraToCoordinates:
	REP #$20

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

--	RTS

;===================================================================================================

HandleOpenShutters:
	STA.l $7E0468
	EOR.b #$01 : STA.l $0641
	BEQ --

	JMP OpenShutterDoors

;===================================================================================================

HandlePegState:
	STA.l $7EC172
	BEQ ++

	JSL $01C22A
	JSL $0296AD
	JSL RefreshPegs

++	RTS

;===================================================================================================

KillSpritesInRoom:
	PHA

	LDA.w $00A0 : ASL : TAX

	PLA
	STA.l $7FDF80,X

	LDX.w #$000F

--	ASL
	BCC ++

	SEP #$20
	STZ.w $0DD0,X
	REP #$20

++	DEX
	BPL --

	RTS
