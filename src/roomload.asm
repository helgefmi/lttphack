pushpc

org $02C23A
CacheRoomEntryPropertiesLong:
	JSR.w $028C83
	RTL

org $01B53C
LoadSingleDoorTileAttribute:
	JSR.w $01D51D
	RTL

warnpc $01B55F

pullpc

;===================================================================================================

LoadArbitraryRoom:
	PHK
	PLB

	JSL ResetBeforeLoading

	PEA.w $0000 : PLD

	SEP #$30

	LDA.b #$00 : STA.b $13

	LDA.b $1B : BEQ ++

	JSL $02A0BE
	JSL $02B87B

++	REP #$20

	LDA.w SA1RAM.loadroomid : JSR SetLoadedRoomID

	SEP #$30
	TAX

	LDA.w $044A : STA.w SA1RAM.loadroomeg

	STZ.w $044A

	LDY.w .layerfloor,X

	LDA.w SA1RAM.loadroomworldset : BEQ .default_world
	CMP.b #$02 : BEQ .light_world
	BCC .set_floor

.dark_world
	LDA.b #$40 : BRA .set_world

.light_world
	LDA.b #$00 : BRA .set_world

.default_world
	TYA
	AND.b #$40

.set_world
	STA.l $7EF3CA

.set_floor
	TYA : AND.b #$0F : BEQ +
	BIT.b #$08 : BEQ ++

	ORA.b #$F0
	BRA +

++	DEC ; 0 = floor 1, but it's easier to do it this way (also can use 0 to mean nothing)
+	STA.b $A4

	LDA.w $040C : PHA

	LDA.w .entrance,X : JSL SetDungeonEntranceAndProperties

	SEP #$30

	PLA

	LDX.w SA1RAM.loadroomdungeonset : BEQ .done_dungeon_id
	CPX.w #$01 : BEQ .use_old_dungeon_id

	LDA.w DungeonID-2,X

.use_old_dungeon_id
	STA.w $040C

.done_dungeon_id
	LDA.w SA1RAM.loadroompegset : CMP.b #$02 : BCC .explicit_pegs

	; since this address is reused, make sure it takes on a valid value
	LDA.l $7EC172 : CMP.b #$02 : BCC .explicit_pegs

	LDA.b #$00

.explicit_pegs
	STA.w SA1RAM.loadroompegstate

	LDA.w SA1RAM.loadroomequip : BEQ .equipment_done
	CMP.b #$01 : BEQ .loadout

	JSL Shortcut_FillEverything
	BRA .equipment_done

.loadout
	JSR LoadCustomLoadOut

.equipment_done
	JSL SetHUDItemGraphics

	SEP #$30

	LDA.l $7EF3C5 : BNE ++

	INC : STA.l $7EF3C5

++	JSL PresetLoadArea_UW

	SEP #$30

	LDA.w SA1RAM.loadroompegstate
	JSL HandlePegState

	SEP #$30

	LDA.w SA1RAM.loadroomshutters : AND.b #$01 : EOR.b #$01
	JSL HandleOpenShutters

	LDX.w SA1RAM.loadroomid

	PHK
	PLB

	REP #$30
	LDA.w #$3000 : TCD

	TXA
	ASL : ADC.w SA1RAM.loadroomid : TAX

	LDA.l $1F83C0,X : STA.b SA1IRAM.preset_scratch+0
	LDA.l $1F83C1,X : STA.b SA1IRAM.preset_scratch+1

	; need a very special exception for this duplicated room
	LDA.w $00A0 : CMP.w #$004F : BEQ .no_doors

	LDA.b [SA1IRAM.preset_scratch]
	CMP.w #$FFFF : BEQ .no_doors

	JSR FindOptimalDoorType

	STA.b SA1IRAM.preset_scratch+2

	SEP #$30

	PHA

	AND.b #$03 : TAX
	LDY.w .dir,X : STY.w $002F

	ASL : TAX

	LDA.b #$01

	CPY.b #$03

	ADC.b #$00 : STA.w $006C
	AND.b #$02 : STA.w $0062

	PLA
	LSR : LSR : LSR

	STZ.b SA1IRAM.preset_scratch+2

	; door position
	REP #$30

	AND.w #$001E
	TAY

	LDA.w .door_position_tables,X
	STA.b SA1IRAM.preset_scratch

	LDA.b [SA1IRAM.preset_scratch],Y

	PEA.w $0000
	PLD

	JSR ConfigureCoordinatesToTilemap

	JMP .adjust_coords

	; use entrance if room of entrance matches
.no_doors
	LDA.w #$0000 : TCD

	; check entrance for matching room ID
	LDA.w $010E : ASL : TAX
	LDA.l $02C577,X : CMP.b $A0 : BNE .not_entrance

	LDA.l $02CCBD,X : STA.b $20
	LDA.l $02CDC7,X : STA.b $22

	SEP #$20

	LDA.l $02D274,X : STA.b $6C

	LDA.l $02D2F9,X : LSR : LSR : LSR : LSR : STA.b $EE
	LDA.l $02D2F9,X : AND.b #$0F : STA.w $0476

	REP #$20
	BRA .adjust_coords

.not_entrance
	; check for interroom stairs
	LDA.w $06B0 : BEQ .no_stairs

	ASL

	JSR ConfigureCoordinatesToTilemap

	BRA .adjust_coords

;---------------------------------------------------------------------------------------------------

.no_stairs
	; hardcoded positionings
	LDA.b $A0
	CMP.w #$0029 : BEQ .mothula
	CMP.w #$004F : BEQ .ip_fairies
	CMP.w #$00DE : BEQ .kholdstare
	CMP.w #$00CA : BEQ .dumb_block_room
	CMP.w #$0089 : BEQ .ep_fairies

	; anything else just goes to center of top left
	; hera fairies are fine to use the default
	LDA.w #$0078

.force_y_x
	STA.b $20

.force_x
	STA.b $22
	BRA .adjust_coords

.dumb_block_room
	LDA.w #$0178 : STA.b $20
	LDA.w #$0078 : BRA .force_x

.mothula
	LDA.w #$0178 : BRA .force_y_x

.kholdstare
.ip_fairies
	LDA.w #$0078 : STA.b $20
	LDA.w #$0178 : BRA .force_x

.ep_fairies
	LDA.w #$0078 : STA.b $20
	LDA.w #$00F8 : BRA .force_x

;---------------------------------------------------------------------------------------------------

	; fix X and Y coordinates to match
.adjust_coords
	LDA.w #$0007 : STA.b $10

	SEP #$20

	LDA.b $A0 : AND.b #$F0 : LSR : LSR : LSR : TSB.b $21
	LDA.b $A0 : AND.b #$0F : ASL : TSB.b $23

	SEP #$30

	; control layer, based on door we're on
	STZ.w $0476 : STZ.b $EE

	LDA.w SA1IRAM.preset_scratch+3
	LDX.b #.lower_layer_doors_end-.lower_layer_doors-1

--	CMP.w .lower_layer_doors,X
	BEQ .lower_layer
	DEX
	BPL --

	BRA .upper_layer

.lower_layer
	REP #$20

	LDA.b $A0
	CMP.w #$0012 : BEQ .set_10
	CMP.w #$0082 : BEQ .set_11

	SEP #$20
	LDA.w $044A : BNE .dont_refresh_eg

	PHA
	LDA.w SA1RAM.loadroomeg : STA.w $044A
	PLA

.dont_refresh_eg
	CMP.b #$02 : BEQ .set_10

.set_11
	SEP #$20

	LDA.b #$01 : STA.b $EE
	STA.w $0476

	BRA .done_layer

.set_10
	SEP #$20

	STZ.b $EE
	LDA.b #$01 : STA.w $0476

.done_layer
.upper_layer
	REP #$30

	LDA.w #$0007 : STA.b $10

	SEP #$30

	LDA.b $23 : LSR
	LDA.b #$00 : ROL : STA.b $A9

	LDA.b $21 : LSR
	LDA.b #$00 : ROL : ASL : STA.b $AA

	LDA.w $040E : LSR : TAX
	ORA.b $AA : ORA.b $A9
	STA.b $A8

	JSR (.bound_setters,X)

	JSR ConfigureCameraToCoordinates
	JSR SetCameraToCoordinates
	JSL CacheRoomEntryPropertiesLong

	LDA.w SA1RAM.loadroomkill : BEQ ++

	REP #$30

	LDA.w #$FFFF : JSL KillSpritesInRoom

++	JSL ApplyAfterLoading

	JMP TriggerTimerAndReset

;---------------------------------------------------------------------------------------------------

.dir
	db $02, $00, $06, $04

.door_position_tables
	dw $00997E ; North
	dw $009996 ; South
	dw $0099AE ; West
	dw $0099C6 ; East

.lower_layer_doors
	db $02, $04, $06, $0C, $10, $40, $44, $46, $48, $4A
..end

.bound_setters
	dw .layout00
	dw .layout01
	dw .layout02
	dw .layout03
	dw .layout04
	dw .layout05
	dw .layout06
	dw .layout07

.layout00
	STZ.b $A6 : STZ.b $A7
	RTS

.layout01
	LDA.b #$02 : STA.b $A7
	STZ.b $A6
	RTS

.layout02
	LDA.b $A9 : ASL : STA.b $A7
	STZ.b $A6
	RTS

.layout03
	LDA.b $A9 : EOR.b #$01 : ASL : STA.b $A7
	STZ.b $A6
	RTS

.layout04
	LDA.b #$02 : STA.b $A6
	STZ.b $A7
	RTS

.layout05
	LDA.b $AA : STA.b $A6
	STZ.b $A7
	RTS

.layout06
	LDA.b $AA : EOR.b #$02 : STA.b $A6
	STZ.b $A7
	RTS

.layout07
	LDA.b #$02
	STA.b $A6 : STA.b $A7
	RTS

;---------------------------------------------------------------------------------------------------

.entrance
	fillbyte $00 : fill 256

.layerfloor
	fillbyte $00 : fill 256

;    .w.. ffff
;    w = world
;    ffff = $A4 & 0x0F - sign extended after read
!ROOM_ID = 0
macro room_load(e, w, f)
	pushpc
	org .entrance+!ROOM_ID : db <e>
	org .layerfloor+!ROOM_ID : db (<f>&$F)|((<w>&$01)<<6)

	pullpc
	!ROOM_ID #= !ROOM_ID+1
endmacro

%room_load($7B, 1, 2) ; 0000
%room_load($04, 0, 1) ; 0001
%room_load($81, 0, 1) ; 0002
%room_load($82, 0, -1) ; 0003
%room_load($19, 1, -1) ; 0004
%room_load($25, 1, 0) ; 0005
%room_load($25, 1, -1) ; 0006
%room_load($33, 0, 6) ; 0007
%room_load($38, 0, -1) ; 0008
%room_load($26, 1, -1) ; 0009
%room_load($26, 1, -1) ; 000A
%room_load($26, 1, -1) ; 000B
%room_load($37, 1, 2) ; 000C
%room_load($37, 1, 7) ; 000D
%room_load($2D, 1, 1) ; 000E
%room_load($7B, 0, 0) ; 000F
%room_load($36, 1, 1) ; 0010
%room_load($81, 0, -1) ; 0011
%room_load($02, 0, 1) ; 0012
%room_load($19, 1, -1) ; 0013
%room_load($19, 1, -1) ; 0014
%room_load($19, 1, -1) ; 0015
%room_load($25, 1, -1) ; 0016
%room_load($33, 0, 5) ; 0017
%room_load($7C, 0, -1) ; 0018
%room_load($26, 1, 1) ; 0019
%room_load($26, 1, 1) ; 001A
%room_load($26, 1, 1) ; 001B
%room_load($37, 1, -1) ; 001C
%room_load($37, 1, 7) ; 001D
%room_load($2D, 1, -1) ; 001E
%room_load($2D, 1, -1) ; 001F
%room_load($24, 0, 7) ; 0020
%room_load($81, 0, -1) ; 0021
%room_load($81, 0, -1) ; 0022
%room_load($15, 1, -1) ; 0023
%room_load($19, 1, -1) ; 0024
%room_load($25, 1, 0) ; 0025
%room_load($25, 1, -1) ; 0026
%room_load($33, 0, 4) ; 0027
%room_load($25, 1, 1) ; 0028
%room_load($2B, 1, -2) ; 0029
%room_load($26, 1, 1) ; 002A
%room_load($26, 1, 1) ; 002B
%room_load($3B, 1, -1) ; 002C
%room_load($2D, 1, 0) ; 002D
%room_load($2D, 1, -1) ; 002E
%room_load($39, 0, -1) ; 002F
%room_load($24, 0, 7) ; 0030
%room_load($33, 0, 3) ; 0031
%room_load($81, 0, -1) ; 0032
%room_load($0C, 0, 2) ; 0033
%room_load($25, 1, -1) ; 0034
%room_load($25, 1, -1) ; 0035
%room_load($25, 1, -1) ; 0036
%room_load($25, 1, -1) ; 0037
%room_load($25, 1, -1) ; 0038
%room_load($2B, 1, -1) ; 0039
%room_load($26, 1, 1) ; 003A
%room_load($26, 1, -1) ; 003B
%room_load($3A, 1, -1) ; 003C
%room_load($37, 1, 6) ; 003D
%room_load($2D, 1, -2) ; 003E
%room_load($2D, 1, -2) ; 003F
%room_load($24, 0, 6) ; 0040
%room_load($81, 0, 2) ; 0041
%room_load($81, 0, 1) ; 0042
%room_load($0C, 0, 2) ; 0043
%room_load($34, 1, -2) ; 0044
%room_load($34, 1, -2) ; 0045
%room_load($25, 1, -1) ; 0046
%room_load($29, 0, 0) ; 0047
%room_load($29, 0, 0) ; 0048
%room_load($2B, 1, -1) ; 0049
%room_load($26, 1, 1) ; 004A
%room_load($26, 1, -1) ; 004B
%room_load($37, 1, 6) ; 004C
%room_load($37, 1, 6) ; 004D
%room_load($2D, 1, -2) ; 004E
%room_load($2D, 1, -6) ; 004F
%room_load($03, 0, 1) ; 0050
%room_load($04, 0, 2) ; 0051
%room_load($05, 0, 1) ; 0052
%room_load($0C, 0, 2) ; 0053
%room_load($25, 1, 1) ; 0054
%room_load($32, 0, -1) ; 0055
%room_load($28, 1, -1) ; 0056
%room_load($29, 1, -1) ; 0057
%room_load($2A, 1, -1) ; 0058
%room_load($2B, 1, -1) ; 0059
%room_load($26, 1, -1) ; 005A
%room_load($37, 1, 3) ; 005B
%room_load($37, 1, 3) ; 005C
%room_load($37, 1, 4) ; 005D
%room_load($2D, 1, -3) ; 005E
%room_load($2D, 1, -3) ; 005F
%room_load($03, 0, 1) ; 0060
%room_load($04, 0, 1) ; 0061
%room_load($05, 0, 1) ; 0062
%room_load($0C, 0, 1) ; 0063
%room_load($34, 1, 1) ; 0064
%room_load($34, 1, 1) ; 0065
%room_load($25, 1, -2) ; 0066
%room_load($77, 1, -1) ; 0067
%room_load($78, 1, -1) ; 0068
%room_load($26, 1, 0) ; 0069
%room_load($26, 1, -1) ; 006A
%room_load($37, 1, 3) ; 006B
%room_load($37, 1, 4) ; 006C
%room_load($37, 1, 4) ; 006D
%room_load($2D, 1, -3) ; 006E
%room_load($2D, 1, 0) ; 006F
%room_load($04, 0, -2) ; 0070
%room_load($04, 0, -1) ; 0071
%room_load($04, 0, -1) ; 0072
%room_load($09, 0, -1) ; 0073
%room_load($09, 0, -1) ; 0074
%room_load($09, 0, -1) ; 0075
%room_load($25, 1, -2) ; 0076
%room_load($33, 0, 2) ; 0077
%room_load($37, 1, 0) ; 0078
%room_load($37, 1, 0) ; 0079
%room_load($37, 1, 0) ; 007A
%room_load($37, 1, 1) ; 007B
%room_load($37, 1, 1) ; 007C
%room_load($37, 1, 1) ; 007D
%room_load($2D, 1, -4) ; 007E
%room_load($2D, 1, -4) ; 007F
%room_load($04, 0, -3) ; 0080
%room_load($04, 0, -1) ; 0081
%room_load($04, 0, -1) ; 0082
%room_load($0B, 0, -1) ; 0083
%room_load($09, 0, -1) ; 0084
%room_load($0A, 0, -1) ; 0085
%room_load($33, 0, 0) ; 0086
%room_load($33, 0, 1) ; 0087
%room_load($27, 1, 0) ; 0088
%room_load($08, 0, 1) ; 0089
%room_load($37, 1, 0) ; 008A
%room_load($37, 1, 1) ; 008B
%room_load($37, 1, 1) ; 008C
%room_load($37, 1, 1) ; 008D
%room_load($2D, 1, -4) ; 008E
%room_load($2D, 1, 0) ; 008F
%room_load($27, 1, -1) ; 0090
%room_load($27, 1, -2) ; 0091
%room_load($27, 1, -2) ; 0092
%room_load($27, 1, -2) ; 0093
%room_load($37, 1, 0) ; 0094
%room_load($37, 1, 5) ; 0095
%room_load($37, 1, 5) ; 0096
%room_load($27, 1, 1) ; 0097
%room_load($27, 1, 1) ; 0098
%room_load($08, 0, 1) ; 0099
%room_load($37, 1, 0) ; 009A
%room_load($37, 1, 1) ; 009B
%room_load($37, 1, 1) ; 009C
%room_load($37, 1, 1) ; 009D
%room_load($2D, 1, -5) ; 009E
%room_load($2D, 1, -5) ; 009F
%room_load($27, 1, -1) ; 00A0
%room_load($27, 1, -1) ; 00A1
%room_load($27, 1, -1) ; 00A2
%room_load($27, 1, -1) ; 00A3
%room_load($18, 1, -3) ; 00A4
%room_load($37, 1, 5) ; 00A5
%room_load($37, 1, 5) ; 00A6
%room_load($33, 0, 2) ; 00A7
%room_load($08, 0, 1) ; 00A8
%room_load($08, 0, 1) ; 00A9
%room_load($08, 0, 1) ; 00AA
%room_load($34, 1, -1) ; 00AB
%room_load($34, 1, -1) ; 00AC
%room_load($2D, 1, 0) ; 00AD
%room_load($2D, 1, -5) ; 00AE
%room_load($2D, 1, -5) ; 00AF
%room_load($24, 0, 5) ; 00B0
%room_load($27, 1, -1) ; 00B1
%room_load($27, 1, -1) ; 00B2
%room_load($27, 1, -1) ; 00B3
%room_load($18, 1, -3) ; 00B4
%room_load($18, 1, -2) ; 00B5
%room_load($35, 1, 1) ; 00B6
%room_load($35, 1, 1) ; 00B7
%room_load($08, 0, 1) ; 00B8
%room_load($08, 0, 1) ; 00B9
%room_load($08, 0, 1) ; 00BA
%room_load($34, 1, -1) ; 00BB
%room_load($34, 1, -1) ; 00BC
%room_load($2D, 1, 0) ; 00BD
%room_load($2D, 1, -6) ; 00BE
%room_load($2D, 1, -6) ; 00BF
%room_load($24, 0, 4) ; 00C0
%room_load($27, 1, -1) ; 00C1
%room_load($27, 1, -1) ; 00C2
%room_load($27, 1, -1) ; 00C3
%room_load($18, 1, -2) ; 00C4
%room_load($18, 1, -2) ; 00C5
%room_load($35, 1, 1) ; 00C6
%room_load($35, 1, 1) ; 00C7
%room_load($08, 0, 2) ; 00C8
%room_load($08, 0, 1) ; 00C9
%room_load($08, 0, 0) ; 00CA
%room_load($34, 1, -1) ; 00CB
%room_load($34, 1, -1) ; 00CC
%room_load($2D, 1, 0) ; 00CD
%room_load($2D, 1, -6) ; 00CE
%room_load($2D, 1, 0) ; 00CF
%room_load($24, 0, 3) ; 00D0
%room_load($27, 1, -1) ; 00D1
%room_load($27, 1, -1) ; 00D2
%room_load($27, 1, 0) ; 00D3
%room_load($27, 1, 0) ; 00D4
%room_load($18, 1, -2) ; 00D5
%room_load($35, 1, 1) ; 00D6
%room_load($08, 0, 0) ; 00D7
%room_load($08, 0, 2) ; 00D8
%room_load($08, 0, 2) ; 00D9
%room_load($08, 0, 2) ; 00DA
%room_load($34, 1, -1) ; 00DB
%room_load($34, 1, -1) ; 00DC
%room_load($2D, 1, 0) ; 00DD
%room_load($2D, 1, -7) ; 00DE
%room_load($20, 0, 2) ; 00DF
%room_load($24, 0, 2) ; 00E0
%room_load($2C, 0, -1) ; 00E1
%room_load($12, 0, -1) ; 00E2
%room_load($11, 0, -1) ; 00E3
%room_load($30, 0, 1) ; 00E4
%room_load($31, 0, 1) ; 00E5
%room_load($2E, 0, 1) ; 00E6
%room_load($2F, 0, 1) ; 00E7
%room_load($14, 1, 2) ; 00E8
%room_load($14, 0, 0) ; 00E9
%room_load($23, 0, 2) ; 00EA
%room_load($17, 1, 2) ; 00EB
%room_load($17, 0, 0) ; 00EC
%room_load($1B, 0, 2) ; 00ED
%room_load($1D, 0, 2) ; 00EE
%room_load($1F, 0, 1) ; 00EF
%room_load($06, 0, 1) ; 00F0
%room_load($07, 0, 1) ; 00F1
%room_load($0D, 0, 1) ; 00F2
%room_load($0E, 0, 1) ; 00F3
%room_load($0F, 0, 1) ; 00F4
%room_load($10, 0, 1) ; 00F5
%room_load($13, 0, 0) ; 00F6
%room_load($13, 0, 0) ; 00F7
%room_load($13, 1, 1) ; 00F8
%room_load($21, 0, 1) ; 00F9
%room_load($22, 0, 1) ; 00FA
%room_load($16, 1, 1) ; 00FB
%room_load($16, 0, 0) ; 00FC
%room_load($1A, 0, 1) ; 00FD
%room_load($1C, 0, 1) ; 00FE
%room_load($1E, 0, -1) ; 00FF


;===================================================================================================

DungeonID:
	db $00 ; Sewers
	db $02 ; Hyrule Castle
	db $04 ; Eastern Palace
	db $06 ; Desert Palace
	db $14 ; Tower of Hera
	db $08 ; Agahnim's Tower
	db $0C ; Palace of Darkness
	db $0A ; Swamp Palace
	db $10 ; Skull Woods
	db $16 ; Thieves' Town
	db $12 ; Ice Palace
	db $0E ; Misery Mire
	db $18 ; Turtle Rock
	db $1A ; Ganon's Tower
	db $FF ; Cave
	db $FD ; Cave FD

;===================================================================================================

ResetBeforeLoading:
	SEP #$30

	LDA.b #$80
	STA.w $2100
	STZ.w $4200
	STZ.w $420C

	REP #$30

	LDA.w #$0000 : TCD

	STA.l $7EC011

	STZ.w $011A
	STZ.w $011C

	STZ.b $1E
	STZ.b $95
	STZ.b $97
	STZ.b $EA
	STZ.w $012C
	STZ.w $012E
	STZ.w $0131
	STZ.w $06B0


	LDX.w #$0CBA : JSR ClearSpriteProps ; Forced item drops
	LDX.w #$0B80 : JSR ClearOverlordProps ; Previous room
	LDX.w #$0CCA : JSR ClearOverlordProps ; Overlord room

	STZ.w $0B99

	LDA.w #$0DF3 : STA.w $02CD

	SEP #$30

	JSL $07F18C

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
	STZ.w $036B
	STZ.w $03F3
	STZ.w $03FC
	STZ.w $046C
	STZ.w $0710
	STZ.w $0ABD
	STZ.w $0B9E
	STZ.w $0F70

	STZ.b $4B
	STZ.b $57
	STZ.b $5D
	STZ.b $62
	STZ.b $6C
	STZ.b $EF
	STZ.b $9B

	STZ.w SA1IRAM.BossCycles+0
	STZ.w SA1IRAM.BossCycles+1
	STZ.w SA1IRAM.BossCycles+2

	STZ.w $0128 ; disable IRQ

	; big blocks of zero
	REP #$20

	LDA.w #$2100 : TCD

	LDX.b #$80 : STX.b $2100

	; disable sound effects now
	LDX.b #$05 : STX.b $2141
	LDX.b #$F0 : STX.b $2140

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

	RTL

;===================================================================================================

ApplyAfterLoading:
	REP #$20

	LDA.w #$0000
	TCD

	; Enable HDMA to get proper lag times
	LDA.w #$2641 : STA.w $4360 : STA.w $4370
	LDA.w #$F2F6 : STA.w $4362 : STA.w $4372

	SEP #$30

	STZ.w $4364 : STZ.w $4374
	STZ.w $4367 : STZ.w $4377

	STZ.w $0710

	LDA.b #$80 : STA.b $9B

	; palettes

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
	RTL

;===================================================================================================

ClearSpriteProps:
	STZ.w $000E,X
	STZ.w $000C,X
	STZ.w $000A,X

ClearAncillaProps:
	STZ.w $0008,X

ClearOverlordProps:
	STZ.w $0006,X
	STZ.w $0004,X
	STZ.w $0002,X
	STZ.w $0000,X

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
	STA.w $00A0
	STA.w $048E

	STZ.w $00A2 ; clear previous room to prevent weirdness
	STZ.w $008A ; clear DW to prevent palette weirdness

	STZ.w $00A6 ; quadrants, which get manipulated later
	STZ.w $00A9

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

	CPX.w #$0014 : BEQ .verify_sanc

	CMP.w #$0030 : BEQ .pre_aga

	PHX

	LDX.w #$0016

--	CMP.l $028856,X
	BEQ .boss_room
	DEX
	DEX
	BPL --

	PLX
	BRA ++

.verify_sanc
	CMP.w #$0012 : BNE .set_both

	LDX.w #$0010 : BRA .set_both ; HC music

.set_both
	TXA
	STA.w $0132

.set_queue
	STA.w $012C

.done_music
	RTL

.sanc_music
	LDX.w #$0014 : BRA .set_both

.boss_room
	PLX
	LDX.w #$0015
	BRA .set_both

.pre_aga
	LDX.w #$001C
	BRA .set_both

++	SEP #$20

	CPX.w #$00FF : BEQ .links_bed
	CPX.w #$00F2 : BEQ .fading

	; check for rain state theme
	CPX.w #$0003 : BNE .set_both

--	LDA.l $7EF3C5 : CMP.b #$02 : BCC .set_both

	LDX.w #$0012 : BRA .set_both

.links_bed
	LDA.l $7EF3C6 : AND.b #$10 : BEQ .silent_bed
	LDX.w #$0003
	BRA --

.silent_bed
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
	JMP .set_queue

.dw_theme
	LDX.w #$0009 : BRA .set_fade

.lw_theme
	LDX.w #$0009 : BRA .set_fade

;===================================================================================================

ConfigureCoordinatesToTilemap:
	PHA

	AND.w #$007F
	ASL : ASL
	ADC.w #$0008
	STA.b $22

	PLA
	AND.w #$FFF0
	LSR : LSR : LSR : LSR
	AND.w #$01FF
	STA.b $20

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

;---------------------------------------------------------------------------------------------------

AdjustCameraScrollFromCamera:
	LDA.w $00E8
	SEC : SBC.w #$0186 : AND.w #$01FF
	STA.w $061A : DEC : DEC : STA.w $0618

	LDA.w $00E2
	SEC : SBC.w #$017F : AND.w #$01FF
	STA.w $061E : DEC : DEC : STA.w $061C

	RTS

;===================================================================================================

SetCameraToCoordinates:
	REP #$20
	SEP #$10

	LDX.b $A7 : BNE .tall_room

	LDA.w $0600
	LDX.b $20
	CPX.b #$65 : BCC .set_y
	CPX.b #$74 : BCS .add_10

	TXA
	ADC.w $0600
	SEC
	SBC.w #$0064
	BRA .set_y

.add_10
	CLC
	ADC.w #$0010
	BRA .set_y

.tall_room
	SEC

	LDA.b $20 : SBC.w #$0080 : BMI +
	CMP.w $0600,X : BCS ++

+	LDA.w $0600,X : BRA .set_y

++	CMP.w $0604,X : BCC ++

	LDA.w $0604,X

.set_y
++	STA.b $E8

	LDA.w $0608
	LDX.b $A6 : BEQ .set_x

	SEC
	LDA.b $22 : SBC.w #$0080 : BMI +
	CMP.w $0608,X : BCS ++

+	LDA.w $0608,X : BRA .set_x

++	CMP.w $060C,X : BCC .set_x

	LDA.w $060C,X

.set_x
	STA.b $E2

	JMP AdjustCameraScrollFromCamera

;===================================================================================================

FindOptimalDoorType:
	REP #$20

	LDY.w #$FFFF

	STZ.b SA1IRAM.preset_writer ; clear best door index
	STY.b SA1IRAM.preset_reader2 ; clear best door score

	INY ; Y = 0

.next
	LDA.b [SA1IRAM.preset_scratch],Y
	CMP.w #$FFFF : BEQ .done

	; find score, based on index in the table
	; lower = better
	SEP #$20
	XBA
	LDX.w #.end-.best_doors-1

--	CMP.w .best_doors,X
	BEQ .compare_score
	DEX
	BPL --

	DEX ; one more dex to say we found a door with score FFFE

.compare_score

	CPX.b SA1IRAM.preset_reader2 : BCS .to_next

	CMP.b #$12 : BEQ .find_associated_entrance_door

	STX.b SA1IRAM.preset_reader2
	STY.b SA1IRAM.preset_writer

.to_next
	REP #$20
	INY
	INY
	BRA .next

;---------------------------------------------------------------------------------------------------

.done
	LDY.b SA1IRAM.preset_writer
	LDA.b [SA1IRAM.preset_scratch],Y

	RTS

	; for exit markers, find the door it modifies by comparing position
.find_associated_entrance_door
	PHY
	XBA
	PHA

	LDY.w #$0000

--	REP #$20
	LDA.b [SA1IRAM.preset_scratch],Y
	CMP.w #$FFFF : BEQ .done_exit_find

	SEP #$20
	XBA
	CMP.b #$12
	BEQ .skip_exit_find

	XBA
	; compare the positions
	CMP 1,S : BEQ .match

.skip_exit_find
	INY
	INY
	BRA --

.match
	PLA

	STX.b SA1IRAM.preset_reader2
	STY.b SA1IRAM.preset_writer

	PLY
	BRA .to_next

.done_exit_find
	SEP #$20
	PLA

	PLY
	BRA .to_next

.best_doors
	db $0A ; dungeon exit
	db $0C ; dungeon exit
	db $06 ; cave exit
	db $04 ; cave exit
	db $0E ; cave exit
	db $10 ; cave exit
	db $2A ; bombable cave exit
	db $12 ; exit marker
	db $00 ; Normal door
	db $02 ; lower layer door
	db $40 ; normal door
	db $08 ; waterfall door
	db $46 ; room door
	db $18 ; shutter door
	db $38 ; shutter door
	db $36 ; shutter door
	db $42 ; shutter door
	db $44 ; shutter door
	db $4A ; shutter door
	db $48 ; shutter door
	db $28 ; dash wall
	db $2E ; bombable wall
	db $32 ; curtain
	db $1C ; small key door
	db $1E ; big key door
.end

;===================================================================================================

HandleOpenShutters:
	STA.w $0468
	EOR.b #$01 : STA.w $0641
	BEQ .exit_all

	REP #$30

	PHB

	LDY.w #$0000

	PHY
	PLB
	PLB

--	LDA.w $19A0,Y
	BEQ ++

	PHY

	JSR .open_one_door

	PLY

++	INY
	INY
	CPY.w #$0020
	BCC --

	; now apply layer swap and dungeon swap attributes
	JSL LoadSingleDoorTileAttribute

	PLB

.exit_all
	RTL

;---------------------------------------------------------------------------------------------------

.open_one_door
	LDA.w $1980,Y
	AND.w #$00FE
	TAX

	CMP.w #$0018
	BEQ .shutter

	CMP.w #$0044
	BNE .exit

.shutter
	STA.b $06

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

.exit
	RTS

.vectors
	dw .north-1
	dw .south-1
	dw .west-1
	dw .east-1

;---------------------------------------------------------------------------------------------------

.north
	LSR
	AND.w #$783F
	TAX

	LDA.b $06
	CMP.w #$44
	PHP
	LDA.b $00
	PLP

	STA.l $7F2001,X
	STA.l $7F2041,X
	STA.l $7F2081,X
	STA.l $7F20C1,X
	STA.l $7F2101,X
	STA.l $7F2141,X
	STA.l $7F2181,X

	BNE .upper_north

	STA.l $7F21C1,X
	STA.l $7F2201,X
	STA.l $7F2241,X

	BRA ++

.upper_north
	LDA.w #$0000
	STA.l $7F21C1,X

++	LDX.b $02
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

;---------------------------------------------------------------------------------------------------

.south
	LSR
	TAX

	LDA.b $06
	CMP.w #$44
	PHP
	LDA.b $00
	PLP

	STA.l $7F2041,X
	STA.l $7F2081,X
	STA.l $7F20C1,X
	STA.l $7F2101,X
	STA.l $7F2141,X

	BNE .upper_south

	STA.l $7F2181,X
	STA.l $7F21C1,X
	STA.l $7F2201,X

.upper_south
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

;---------------------------------------------------------------------------------------------------

.west
	LSR
	AND.w #$FFE0
	TAX

	LDA.b $06
	CMP.w #$44
	PHP
	LDA.b $00
	CLC
	ADC.w #$0101
	PLP

	STA.l $7F2040,X
	STA.l $7F2042,X
	STA.l $7F2080,X
	STA.l $7F2082,X

	BNE .upper_west

	STA.l $7F2044,X
	STA.l $7F2046,X
	STA.l $7F2084,X
	STA.l $7F2086,X
	BRA ++

.upper_west
	AND.w #$00FF
	STA.l $7F2044,X
	STA.l $7F2084,X

++	LDX.b $02
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

;---------------------------------------------------------------------------------------------------

.east
	LSR
	TAX

	LDA.b $06
	CMP.w #$44
	PHP
	LDA.b $00
	CLC
	ADC.w #$0101
	PLP

	STA.l $7F2042,X
	STA.l $7F2044,X
	STA.l $7F2082,X
	STA.l $7F2084,X

	BNE .upper_east

	STA.l $7F2044,X
	STA.l $7F2046,X
	STA.l $7F2047,X
	STA.l $7F2084,X
	STA.l $7F2086,X
	STA.l $7F2087,X

.upper_east
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

;---------------------------------------------------------------------------------------------------

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

;===================================================================================================

HandlePegState:
	STA.l $7EC172
	BEQ ++

	JSL $01C22A
	JSL $0296AD
	JSL RefreshPegs

++	RTL

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

	RTL

;===================================================================================================

LoadCustomLoadOut:
	SEP #$20
	REP #$10

	LDX.w #$0021

--	LDA.l !config_custom_load,X
	STA.l $7EF340,X

	DEX
	BPL --

	LDA.l !config_custom_load_2+0 : STA.l $7EF36C
	LDA.l !config_custom_load_2+1 : STA.l $7EF36D
	LDA.l !config_custom_load_2+2 : STA.l $7EF36E
	LDA.l !config_custom_load_2+3 : STA.l $7EF37B
	LDA.l !config_custom_load_2+4 : STA.l $7E0303

	LDA.b #$F8 : STA.l $7EF379
	LDA.l $7EF355 : CMP.b #$01
	LDA.b #$00 : ROL
	PHA
	LDA.l $7EF356 : CMP.b #$01
	PLA
	ROL
	ROL
	ORA.l $7EF379
	STA.l $7EF379

	RTS

;===================================================================================================

SetHUDItemGraphics:
	PHD

	PHB
	PHK
	PLB

	PEA.w $3000
	PLD

	SEP #$30
	LDA.b #$7E : STA.b SA1IRAM.preset_reader+2

	LDY.w $0303
	LDA.w .item_to_menu,Y
	STA.w $0202

	TAX
	LDA.l $7EF340-1,X
	BEQ ++

	CPY.b #$00
++	REP #$30
	BEQ .missing_item

.have_item
	TYA
	ASL : ASL
	TAY

	LDX.w .item_HUD-4,Y ; bank0D offset
	STX.b SA1IRAM.preset_reader2

	LDA.w .item_HUD-2,Y ; bank7E SRAM val
	STA.b SA1IRAM.preset_reader+0

	LDA.b [SA1IRAM.preset_reader]
	AND.w #$00FF
	BEQ .missing_item

	CPY.w #$0001*4 : BEQ .bombs_adjust
	CPY.w #$000B*4 : BNE .normal_item

.bottle_adjust
	TAX
	LDA.l $7EF35C-1,X
	AND.w #$00FF

.normal_item
	ASL
	ASL
	ASL
	ADC.b SA1IRAM.preset_reader2
	TAX
	BRA .draw_item

.missing_item
	SEP #$30

	TYA
	LSR
	LSR
	STA.b SA1IRAM.preset_reader2

	TAX

--	DEX
	BPL ++

	LDX.b #$13

++	CPX.b SA1IRAM.preset_reader2
	BEQ .no_item_at_all

	LDA.l $7EF340,X
	BEQ --

	; find index
	TXA : INC
	LDY.b #$14

--	CMP.w .item_to_menu,Y
	BEQ ++

	DEY
	BPL --

	BRA .no_item_at_all

++	LDA.w .item_to_menu,Y
	STA.w $0202
	STY.w $0303

	REP #$30
	BRA .have_item

.bombs_adjust
	CMP.w #$0001
	BCC .missing_item

	LDA.w #$0001
	BRA .normal_item

.no_item_at_all
	STZ.w $0202
	STZ.w $0303

	REP #$30

.no_item
	LDX.w #$FEE7 ; value happens to have $207F x4

.draw_item
	LDA.l $0D0000,X : STA.w SA1RAM.HUD+$04A
	LDA.l $0D0002,X : STA.w SA1RAM.HUD+$04C
	LDA.l $0D0004,X : STA.w SA1RAM.HUD+$08A
	LDA.l $0D0006,X : STA.w SA1RAM.HUD+$08C

	PLB
	PLD
	RTL

;---------------------------------------------------------------------------------------------------
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
	dw $0DF6F1, $7EF348 ; $10 - Ether Medallion
	dw $0DF701, $7EF349 ; $11 - Quake Medallion
	dw $0DF7B9, $7EF350 ; $12 - Cane of Somaria
	dw $0DF7D9, $7EF352 ; $13 - Cape
	dw $0DF7E9, $7EF353 ; $14 - Magic Mirror

;===================================================================================================

HandleOverworldLoad:
	REP #$20

	STZ.w $0624
	STZ.w $0626
	STZ.w $0628
	STZ.w $062A

	SEP #$30

	STZ.b $EE ; layer
	STZ.b $1B ; outdoors

	BIT.w $008A ; do mirror portal?
	BVS .darkworld

	LDA.b #$6C ; add portal to sprite list
	STA.w $0E2F

	LDA.b #$08
	STA.w $0DDF

.darkworld
	REP #$20

	LDA.w #$0009 : STA.b $10
	LDA.w #$FFF8 : STA.b $EC

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

	PLA : STA.b $8A
	PLA : STA.b $88
	PLA : STA.b $86
	PLA : STA.b $84
	PLA : STA.w $0418
	PLA : STA.w $0416
	PLA : STA.w $0410

	SEP #$30

	JSL $09C499

	SEP #$30

	LDA.b #$FF
	STA.l $7EF36F ; no keys
	STA.w $040C ; no dungeon

	; load overworld music
	SEI

	STA.w $2140
	LDA.b #$01 : STA.w $4200
	STZ.w $0136

	JSL $008913

;===================================================================================================

SetOverworldMusic:
	SEP #$30

	; TODO bmi for special overworld whenever that's gotten around to
	LDY.b $8A

	; DW
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
