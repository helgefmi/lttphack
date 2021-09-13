LITESTATES_SUBMENU:
%menu_header("LITE STATES", 16)

;===================================================================================================

%litestate("Litestate 01", $00)
%litestate("Litestate 02", $01)
%litestate("Litestate 03", $02)
%litestate("Litestate 04", $03)
%litestate("Litestate 05", $04)
%litestate("Litestate 06", $05)
%litestate("Litestate 07", $06)
%litestate("Litestate 08", $07)
%litestate("Litestate 09", $08)
%litestate("Litestate 10", $09)
%litestate("Litestate 11", $0A)
%litestate("Litestate 12", $0B)
%litestate("Litestate 13", $0C)
%litestate("Litestate 14", $0D)
%litestate("Litestate 15", $0E)
%litestate("Litestate 16", $0F)

;===================================================================================================

ValidateLiteState:
	CLC
	PHP
	REP #$30
	PHX
	PHY
	PHB

	PHK
	PLB

	; times 0x0800
	AND.w #$00FF
	XBA
	ASL
	ASL
	ASL
	TAX

	STA.w SA1IRAM.litestate_off

	LDY.w #$0000
	SEP #$20

--	LDA.w LiteStateHeader,Y
	CMP.l LiteStateData,X
	BNE .fail

	INY
	INX
	CPY.w #$0010 : BCC --

	SEC
	BRA ++

.fail
	CLC

	; set carry flag for P we pull
++	LDA 6,S
	ADC.b #$00
	STA 6,S

	PLB

	REP #$10
	PLY
	PLX
	PLP

	RTL

;===================================================================================================

LiteStateHeader:
	;  "0123456789ABCDEF"
	db "LITESTATELUIBETA"
;	db "LITESTATELUICOOL"

;===================================================================================================

DeleteLiteState:
	PHP
	REP #$30
	PHX
	PHY

	; times 0x0800
	AND.w #$00FF
	XBA
	ASL
	ASL
	ASL
	TAX

	LDA.w #$0000
	STA.l LiteStateData+$0,X
	STA.l LiteStateData+$2,X
	STA.l LiteStateData+$4,X
	STA.l LiteStateData+$6,X
	STA.l LiteStateData+$8,X
	STA.l LiteStateData+$A,X
	STA.l LiteStateData+$C,X
	STA.l LiteStateData+$E,X

	PLY
	PLX
	PLP

	RTL

;===================================================================================================

; save room data to sram before saving
; hold Y to set
; hold X to clear
; press A to load
; save preset type so loadlastpreset works with these
SaveLiteState:
	PHP
	REP #$30
	PHA
	PHX
	PHY
	PHD
	PHB

	; map
	; header (0x10 bytes)
	; SRAM (0x402 bytes)
	; Overlords+Sprites ($F0)
	; Overlords+Sprites ($30)
	; Sprites (0x200 bytes)
	PHD : PHK : PLB

	PEA.w $0000
	PLD
	JSL $02B87B
	PLD

	REP #$30

	LDA.b SA1IRAM.litestate_act
	AND.w #$00FF
	XBA
	ASL
	ASL
	ASL
	TAY

	LDA.w #$000F
	LDX.w #LiteStateHeader
	%MVN(LiteStateHeader>>16,LiteStateData>>16)

	PHK
	PLB

	SEP #$20

	LDA.b #$80
	JSR DMALiteStates

	REP #$30
	PLB
	PLD
	PLY
	PLX
	PLA
	PLP
--	RTL

;===================================================================================================

LoadLiteState:
	REP #$30

	JSL ValidateLiteState
	BCC --

	STZ.w SA1IRAM.preset_addr
	LDA.w SA1IRAM.litestate_last
	AND.w #$00FF
	XBA
	ASL
	ASL
	ASL
	ADC.w #$0010
	TAY

	PHK
	PLB

	SEP #$20

	LDA.b #$80 : STA.w $2100 : STA.w $0013
	STZ.w $4200

	LDA.b #$00
	JSR DMALiteStates

	JSL SetHUDItemGraphics

	REP #$20
	LDA.w #$0000 : TCD

	SEP #$30
	PHA : PLB

	JSL DecompSwordGfx
	JSL Palette_Sword
	JSL DecompShieldGfx
	JSL Palette_Shield
	JSL Palette_Armor

	JSL ApplyAfterLoading

	SEP #$30
	JSL Rerandomize

	JML TriggerTimerAndReset

;===================================================================================================

LiteSRAMSize = $0402

DMALiteStates:
	REP #$10

	STA.w $4350

	LDA.b #$80 : STA.w $4351 ; wram

	STY.w $4352
	LDA.b #LiteStateData>>16 : STA.w $4354

	STZ.w $2183
	LDY.w #$F000 : STY.w $2181
	LDY.w #LiteSRAMSize : STY.w $4355

	LDA.b #$20 : STA.w $420B

	LDX.w #$0000

.next_important
	LDY.w .utmost_importance+0,X
	BEQ .done_important

	CPY.w #$0001 : BNE .not_dumb_room_hack

	LDA.w $001B : BEQ .dumb_room_fake
	REP #$20
	LDA.w $00A0
	ASL
	CLC
	ADC.w #$DF80
	TAY
	SEP #$20
	BRA .not_dumb_room_hack

.dumb_room_fake
	LDY.w #$FF00

.not_dumb_room_hack
	STY.w $2181

	LDA.w .utmost_importance+2,X
	STA.w $2183

	LDA.w .utmost_importance+3,X
	STA.w $4355 : STZ.w $4356

	LDA.b #$20 : STA.w $420B

	INX : INX : INX : INX
	BRA .next_important

.done_important
	LDA.w $4350 : CMP.b #$80 : BEQ .saving

	JSR SaveATon

	PHD
	JSL ResetBeforeLoading
	PLD


	SEP #$20
	PHK
	PLB
	LDA.b $1B : BEQ .overworld

.underworld
	; save important values
	LDA.l $7E0468 : PHA ; shutters
	LDA.l $7EC172 : PHA ; pegs
	LDA.l $7EF36F : PHA ; keys
	LDA.l $7E040C : PHA

	LDA.w $010E : JSL SetDungeonEntranceAndProperties

	SEP #$20
	PLA : STA.l $7E040C

	JSL PresetLoadArea_UW

	SEP #$20
	LDA.b #$01 : STA.w $4200

	PLA : STA.l $7EF36F
	PLA : JSL HandlePegState
	SEP #$20
	PLA : JSL HandleOpenShutters

	REP #$20
	LDA.w #$0007 : STA.b $10

	BRA .done_stuff_1

.overworld
	JSL HandleOverworldLoad

	REP #$20
	LDA.w #$0009 : STA.b $10

	SEP #$20
	STZ.w $0200 : STZ.b $B0

.done_stuff_1
	JSR PullATon

.saving
	SEP #$20
	LDX.w #$0000

.next_less_important
	LDY.w .less_importance+0,X
	BEQ .done_less_important

	STY.w $2181

	LDA.w .less_importance+2,X
	STA.w $2183

	LDA.w .less_importance+3,X
	STA.w $4355 : STZ.w $4356

	LDA.b #$20 : STA.w $420B

	INX : INX : INX : INX
	BRA .next_less_important

.done_less_important
	LDA.b $4350 : BPL .done_loading

	; Some dumb after hacks
	LDA.b $5D
	CMP.b #$04 : BEQ .leave_state
	CMP.b #$17 : BEQ .leave_state

.leave_state

.done_loading
	RTS

	; dl addr : db size
.utmost_importance
	dl $7E001B : db $01 ; indoorsness
	dl $7E00A0 : db $04 ; UW screen ID
	dl $7E008A : db $04 ; OW screen ID
	dl $7E0020 : db $04 ; coordinates
	dl $7E002F : db $01 ; direction
	dl $7E040A : db $02 ; OW screen ID
	dl $7E0084 : db $06 ; OW tilemap
	dl $7E010E : db $02 ; entrance
	dl $7E0400 : db $09 ; dungeon stuff
	dl $7E040C : db $01 ; dungeon id
	dl $7E048E : db $02 ; room ID
	dl $7E0303 : db $01 ; item
	dl $7E0618 : db $08 ; OW pan
	dl $7E0600 : db $20 ; camera stuff
	dl $7E00EE : db $01 ; layer
	dl $7E0476 : db $01 ; layer
	dl $7E0468 : db $01 ; shutters
	dl $7E0AA0 : db $18 ; gfx
	dl $7EC172 : db $01 ; pegs
	dl $7E0ABD : db $01 ; color math
	dl $7F0001 : db $02 ; stupid hack for sprite deaths
	dw $0000 ; end

.less_importance
	dl $7E0046 : db $01 ; i frames
	dl $7E031F : db $01 ; i frames
	dl $7E005D : db $01 ; state
	dl $7E0056 : db $01 ; bunny
	dl $7E02E0 : db $01 ; bunny
	dl $7E006C : db $01 ; door state
	dl $7E00A4 : db $07 ; floor and quadrants
	dl $7E00B7 : db $05 ; object pointers
	dl $7E00E0 : db $04 ; camera
	dl $7E00E6 : db $04 ; camera
	dl $7E0624 : db $08 ; camera stuff
	dl $7E0130 : db $04 ; music stuff
	dl $7E0136 : db $01 ; music bank
	dl $7E02FA : db $01 ; statue drag
	dl $7E0345 : db $01 ; swimming
	dl $7E02A1 : db $02 ; ancilla altitude
	dl $7E044A : db $01 ; EG strength
	dl $7E047A : db $01 ; armed EG
	dl $7E045A : db $01 ; torches lit
	dl $7E04F0 : db $04 ; torch timers
	dl $7E0642 : db $01 ; shutter tags
	dl $7E0FC7 : db $08 ; prize packs
	dl $7E0B08 : db $02 ; overlord
	dl $7E0B10 : db $02 ; overlord
	dl $7E0B20 : db $02 ; overlord
	dl $7E0CF9 : db $04 ; drop luck and trees
	dl $7E1ABF : db $01 ; mirror portal
	dl $7E1ACF : db $01 ; mirror portal
	dl $7E1ADF : db $01 ; mirror portal
	dl $7E1AEF : db $01 ; mirror portal
	dl $7EC140 : db $31 ; cache stuff
	dl $7EC180 : db $2A ; cache stuff
	dw $0000 ; end

;===================================================================================================

SaveATon:
	REP #$30
	PLA

	PHP
	PHD
	PHY
	PHX
	PHB

	PHK
	PLB

	LDY.w $4350 : PHY
	LDY.w $4352 : PHY
	LDY.w $4354 : PHY
	LDY.w $4356 : PHY

	PHA

	LDA.w #$0000
	TCD

	SEP #$30

	RTS

PullATon:
	REP #$30
	PLA

	PLY : STY.w $4356
	PLY : STY.w $4354
	PLY : STY.w $4352
	PLY : STY.w $4350

	PLB
	PLX
	PLY
	PLD
	PLP

	PHA
	RTS
