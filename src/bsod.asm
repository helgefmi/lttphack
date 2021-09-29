check bankcross off

Pekola:
incbin resources/pekola.8bpp
fillbyte $00 : fill $40
.end

check bankcross on

table resources/menu.tbl

OOPS:
	REP #$30
	TSC

	LDX.w #$8A67 ; this has a 34 for our bank lol
	TXS
	PLB

	TCS

	SEP #$34

	LDX.b #$80 : STX.w $2100

	STZ.w $4200
	STZ.w $420C

	REP #$20

	LDA.w #$2100
	TCD

	STX.b $2115

	LDY.b #$FD : STY.b $210E
	LDY.b #$FF : STY.b $210E

	TAY

	LDA.w #$05F0 : STA.b $2140
	LDA.w #$2B0C : STA.b $2142

	STY.b $210D : STY.b $210D
	STZ.b $210F
	STZ.b $210F

	STZ.w $212E
	STZ.w $2130

	STY.b $2106
	STY.b $2121

	LDA.w #$0303 : STA.b $212C
	LDY.b #$04 : STY.b $2105

	LDA.w #$7870 : STA.b $2107
	LDA.w #$6060 : STA.b $2109
	STA.b $210B

	LDA.w #$7000 : STA.b $2116

	REP #$10

	LDA.w #$02C0
	LDX.w #6*32
--	STA.b $2118
	DEX
	BNE --

	LDX.w #22*32
	LDA.w #$0000
--	STA.b $2118
	INC
	DEX
	BNE --

	LDX.w #3*32

--	STZ.b $2118
	DEX
	BNE --

	LDX.w #1*32
--	STA.b $2118
	DEX
	BNE --

	LDA.w #$7800 : STA.b $2116

	LDA.w #$202F
	LDX.w #36*32
--	STA.b $2118
	DEX
	BNE --

	LDY.w #$F042>>1 : STY.b $2116

	LDX.w #.text_a-1

;	LDA.w !config_init_sig : CMP.w #!INIT_SIGNATURE : BEQ .config_fine

;	LDX.w #.text_b-1

.config_fine
--	INX
	LDA.w $0000,X
	AND.w #$00FF

	CMP.w #$00FF
	BEQ .done_text

	CMP.w #'$' : BNE +

	TYA
	CLC
	ADC.w #$0020
	STA.b $2116
	TAY

	BRA --

+	ORA.w #$2000
	STA.b $2118
	BRA --

.done_text
	LDA.w #$F0FA>>1 : STA.b $2116

	TSC : XBA : AND.w #$00FF : CLC : ADC.w #$2070 : STA.b $2118
	TSC : AND.w #$00FF : CLC : ADC.w #$2070 : STA.b $2118

	LDA.w #$F102>>1 : STA.b $2116

	TSX
	BMI .done_stack

	TCS
	LDY.w #$FFFF

	INX
	STX.w $4350

	LDX.w #$0200

--	DEX
	CPX.w $4350 : BCC .done_stack
	INY
	CPY.w #$001E : BCC ++

	LDY.w #$0000
	TSC
	ADC.w #$001F
	STA.b $2116
	TCS

++	LDA.l $000000,X
	AND.w #$00FF
	CLC
	ADC.w #$2070
	STA.b $2118
	BRA --

.done_stack
	SEP #$10

	STZ.b $2116

	LDA.w #$4300 : TCD

	LDA.w #$1801 : STA.b $4300
	TAY

	LDX.b #Pekola>>16 : STX.b $4304
	LDA.w #$8000 : STA.b $4302
	STA.b $4305
	STY.w $420B

	INX : STX.b $4304
	STA.b $4302
	LDA.w #Pekola_end&$7FFF : STA.b $4305
	STY.w $420B

	LDA.w #$C000>>1 : STA.w $2116
	LDA.w #cm_gfx>>0 : STA.b $4302
	LDX.b #cm_gfx>>16 : STX.b $4304
	LDA.w #16*16*7 : STA.b $4305
	STY.w $420B

	LDA.w #.hex>>0 : STA.b $4302
	LDX.b #.hex>>16 : STX.b $4304
	LDA.w #256*16 : STA.b $4305
	STY.w $420B

	LDA.w #$2200 : STA.b $4300
	LDA.w #.palette : STA.b $4302
	LDA.w #512 : STA.b $4305
	STY.w $420B

	LDX.b #$0F : STX.w $2100

--	BRA --

.text_a
	; "012345678901234567890123456789012"
	db "A fatal error has occured.$"
	db "The system halted to attempt$"
	db "to prevent config damage."
	db $FF

.zero

.palette
	dw hexto555($000050), hexto555($282828), hexto555($FFFFFF), hexto555($282828), hexto555($303028), hexto555($303028), hexto555($303030), hexto555($303030), hexto555($303030), hexto555($383030), hexto555($383030), hexto555($303838), hexto555($303830), hexto555($383830), hexto555($383840), hexto555($383838), hexto555($383840), hexto555($403838), hexto555($404040), hexto555($404040), hexto555($404040), hexto555($484040), hexto555($404048), hexto555($404840), hexto555($484848), hexto555($484840), hexto555($484838), hexto555($484848), hexto555($484848), hexto555($484850), hexto555($484850), hexto555($504848), hexto555($504848), hexto555($485058), hexto555($505048), hexto555($505048), hexto555($505058), hexto555($505050), hexto555($505050), hexto555($585050), hexto555($585058), hexto555($505058), hexto555($505060), hexto555($505858), hexto555($505850), hexto555($585850), hexto555($585850), hexto555($605858), hexto555($605860), hexto555($585868), hexto555($585858), hexto555($585860), hexto555($605848), hexto555($605858), hexto555($605850), hexto555($585870), hexto555($585860), hexto555($606060), hexto555($606060), hexto555($586070), hexto555($686060), hexto555($686060), hexto555($606068), hexto555($686058), hexto555($606070), hexto555($686060), hexto555($606068), hexto555($606068), hexto555($606078), hexto555($686060), hexto555($606870), hexto555($706060), hexto555($686860), hexto555($686870), hexto555($706060), hexto555($686860), hexto555($606860), hexto555($606880), hexto555($686878), hexto555($706868), hexto555($706860), hexto555($706868), hexto555($786860), hexto555($606880), hexto555($706860), hexto555($687070), hexto555($687078), hexto555($786868), hexto555($707068), hexto555($707070), hexto555($707068), hexto555($786870), hexto555($707070), hexto555($787068), hexto555($707080), hexto555($687088), hexto555($787068), hexto555($787070), hexto555($787068), hexto555($707088), hexto555($787068), hexto555($787068), hexto555($807068), hexto555($707080), hexto555($787870), hexto555($707878), hexto555($787878), hexto555($707890), hexto555($887070), hexto555($787878), hexto555($707888), hexto555($807878), hexto555($787888), hexto555($807870), hexto555($807870), hexto555($787870), hexto555($807870), hexto555($787898), hexto555($887878), hexto555($787890), hexto555($807880), hexto555($807880), hexto555($887878), hexto555($788080), hexto555($888080), hexto555($788098), hexto555($908078), hexto555($788098), hexto555($888078), hexto555($888078), hexto555($888070), hexto555($888080), hexto555($888088), hexto555($808088), hexto555($908080), hexto555($808090), hexto555($808878), hexto555($808098), hexto555($988080), hexto555($888870), hexto555($888868), hexto555($808898), hexto555($908888), hexto555($8088A0), hexto555($908878), hexto555($888888), hexto555($888880), hexto555($888898), hexto555($988880), hexto555($8888A0), hexto555($988888), hexto555($909070), hexto555($A08888), hexto555($8890A0), hexto555($989080), hexto555($909088), hexto555($8890A8), hexto555($989088), hexto555($A08888), hexto555($909070), hexto555($909090), hexto555($9090A8), hexto555($989090), hexto555($A09088), hexto555($989088), hexto555($989088), hexto555($989090), hexto555($989890), hexto555($9098A8), hexto555($909898), hexto555($A89090), hexto555($9098A0), hexto555($9098B0), hexto555($989898), hexto555($9098B0), hexto555($9898A8), hexto555($9898A0), hexto555($9898B0), hexto555($A89890), hexto555($989890), hexto555($A0A090), hexto555($A0A078), hexto555($98A0A0), hexto555($B09898), hexto555($A8A0A0), hexto555($A0A098), hexto555($A0A0B8), hexto555($A0A0A8), hexto555($B0A098), hexto555($A8A898), hexto555($B0A0A0), hexto555($A0A8A8), hexto555($A8A880), hexto555($A8A8C0), hexto555($B0A8A8), hexto555($B0B080), hexto555($B0B0A0), hexto555($C0A8A8), hexto555($A8B0B0), hexto555($B8B0A8), hexto555($B0B8B8), hexto555($C0B0B0), hexto555($B0B8C8), hexto555($B8B8A8), hexto555($C0B8B8), hexto555($B8B8C0), hexto555($C8B8B8), hexto555($B8C0D0), hexto555($C0C0B0), hexto555($C0C0C8), hexto555($C8C0C0), hexto555($C8C0C0), hexto555($C0C8C8), hexto555($D0C8C8), hexto555($C8D0D8), hexto555($D0D0D8), hexto555($D8D0D0), hexto555($D8D8E0), hexto555($D8E0E8), hexto555($E0D8D8), hexto555($E0E0E0), hexto555($E0E0E0), hexto555($000088), hexto555($000088), hexto555($000088), hexto555($000000), hexto555($000000), hexto555($000000), hexto555($000000), hexto555($000000), hexto555($000000), hexto555($000000), hexto555($000000), hexto555($000000), hexto555($000000), hexto555($000000), hexto555($000000), hexto555($000000), hexto555($000000), hexto555($000000), hexto555($000000), hexto555($000000), hexto555($000000), hexto555($000000), hexto555($000000), hexto555($000000), hexto555($000000), hexto555($000000), hexto555($000000), hexto555($000000), hexto555($000000), hexto555($000000), hexto555($000000), hexto555($000000), hexto555($000000), hexto555($000000)

.hex
incbin "resources/bsodhex.2bpp"
