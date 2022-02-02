pushpc
; Code that is run once after the game has been powered on.
org $00802F
	JML init_hook
	NOP
init_done:

; optimize message pointer creation by a lot
org $1CF37A
	PEA.w MessagePointers
	PEA.w $71C0
	PEA.w 396*2
	SEC ; bank 7F

; push to stack: source, destination, size
; carry = wram bank
DoWRAMBig:
	REP #$20
	PLA
	STA.w $4305

	PLA
	STA.w $2181

	PLA
	STA.w $4302

	LDA.w #$8000
	STA.w $4300

	SEP #$30
	LDA.b #MessagePointers>>16
	STA.w $4304

	LDA.b #$00
	ROL
	STA.w $2183

	LDA.b #$01
	STA.w $420B

	RTL

DoWRAM4BPP:
	PEA.w WRAMGFX
	PEA.w $9000
	PEA.w $2E00

	CLC ; bank 7E
	BRA DoWRAMBig

warnpc $1CF3D4

org $0EFCB2
	PEA.w FiveBeeZeroZero
	PEA.w $5B00
	PEA.w 1026
	SEC ; bank 7F
	JML DoWRAMBig

pullpc

;===================================================================================================

init_hook:
	SEP #$30
	LDA.b #$03 : STA.l $002224 ; image 3 for page $60

	LDA.l !config_feature_music : BNE ++
	JSL mute_music

++	LDA.b #$22 : STA.l $2143 ; BWOOWOOOWOWOOOOOO

	JSL InitSA1

	REP #$20
	SEP #$10
	STZ.w $2182

	LDA.w #$2000
	STA.w $2182

#ZeroLand:
	LDA.w #$4300
	TCD

	LDA.w #ZeroLand+1
	STA.b $4312
	STA.b $4302

	LDX.b #ZeroLand>>16
	STX.b $4314
	STX.b $4304

	LDA.w #$E000 ; this many bytes for WRAM
	STA.b $4315

	LDA.w #$8008
	STA.b $4310
	STA.b $4300

	LDX.b #$02
	STX.w $420B

	DEX
	STX.w $2183
	STZ.w $2181
	STX.w $420B

	REP #$30

	LDA.w #$FFFF

	LDX.w #$017E

--	STA.l SA1IRAM.SA1CorruptionBuffer,X
	DEX
	DEX
	BPL --

	LDA.w #$0000
	TCD





;===================================================================================================
; Done doing what ALTTP needs done but faster
;===================================================================================================

	SEP #$30
	; check for reset config combo
	LDA.b #$01 : STA.w $4016 : STZ.w $4016 ; pulse controller

	STZ.b $00 : STZ.b $01
	LDY.b #$10 ; reading 16 bits
--	LDA.w $4016 ; if the last bit is on, carry will be set, otherwise, it won't; A is still 1
	LSR
	ROL.b $00 : ROL.b $01 ; roll carry from A and then from $00
	DEY : BNE --

	REP #$20
	LDA.b $00
	AND.w #$FF00 : CMP.w #$3000 : BEQ .forcereset
	LDA.w !config_init_sig : CMP.w #!INIT_SIGNATURE : BEQ .noforcereset

.forcereset
	JSR init_initialize_all
	BRA .sram_initialized

.noforcereset
	LDA.w !config_sram_initialized
	CMP.w #$0030 : BCC .forcereset

.sram_initialized
	REP #$10
	; clear unused config settings, for when they're used in future updates
	LDX.w #!last_config

	SEP #$20
	LDA.b #$00
	BRA ++

--	STA.l SA1RAM.SETTINGS,X
	INX
++	CPX.w #$0400
	BCC --

	SEP #$30
	STZ.w $037F

;===================================================================================================
; everything is done now
; back to the game
	JSL $028000
	JSL $028022
	JSL $0EF572
	JSL DoWRAM4BPP

	JSL reinit_sentry_addresses

	REP #$30

	LDA.w #$0000
	STA.l SA1RAM.CPUVERSION
	STA.l SA1RAM.PPU1VERSION
	STA.l SA1RAM.PPU2VERSION

	SEP #$30

	LDA.b #$15 : STA.b $1C

	STZ.b $11
	STZ.b $12

	LDA.b #$01
	STA.b $10
	STA.w $04AA

	LDA.l $004210 : AND.b #$0F : STA.l SA1RAM.CPUVERSION
	LDA.l $00213E : AND.b #$0F : STA.l SA1RAM.PPU1VERSION
	LDA.l $00213F : AND.b #$0F : STA.l SA1RAM.PPU2VERSION

	LDA.b #$81 : STA.w $4200

	JML init_done

;===================================================================================================

init_initialize_all:
	PEA.w VERSIONSTABLE

	SEP #$20

	LDA.b #$1F : STA.w $2143
	STA.l SA1RAM.old_music_bank

	REP #$30
	PLY

	PHB
	PHK
	PLB

.next
	LDX.w $0000,Y
	BEQ .done

	INY
	INY

	LDA.w $0000,Y
	STA.l $400000,X

	INY
	INY
	BRA .next

.done
	PLB
	RTS

VERSIONSTABLE:
	!PERM_INIT

	dw $0000, $0000

WRAMGFX:
incbin "resources/decomped.4bpp"

MessagePointers:
	dw $8000, $8001, $800E, $801B, $803C, $805C, $806D, $8078
	dw $8083, $808E, $8097, $80A0, $80DF, $818F, $81B7, $81E4
	dw $8211, $823E, $826A, $8297, $82C0, $82E9, $8313, $8457
	dw $848D, $84B6, $853E, $855F, $8648, $866E, $8728, $8775
	dw $87B0, $8809, $8837, $8892, $8929, $895E, $89BC, $89EA
	dw $8A18, $8A3F, $8AAF, $8B89, $8BE5, $8C0E, $8C2C, $8C8B
	dw $8CB0, $8D86, $8DF0, $8E27, $8F97, $9003, $9039, $916B
	dw $935A, $9389, $93B9, $93D8, $93E7, $93FA, $9415, $942E
	dw $944B, $945C, $947A, $9495, $94B4, $94BF, $94EE, $94FE
	dw $950F, $9533, $955E, $958C, $95B7, $9616, $9631, $9650
	dw $9673, $9693, $96B8, $96DE, $970C, $9731, $975B, $9787
	dw $97BF, $97F3, $982A, $9857, $9886, $98BB, $98DD, $990C
	dw $9940, $9972, $99AB, $99E2, $9A18, $9A48, $9A72, $9A9E
	dw $9ACD, $9AFA, $9B27, $9B59, $9B85, $9BB6, $9BDA, $9C81
	dw $9CAA, $9CD7, $9D05, $9D39, $9D61, $9D8D, $9DB5, $9DE5
	dw $9E13, $9E38, $9E60, $9E97, $9EF1, $9F47, $9FAF, $A018
	dw $A054, $A066, $A09B, $A0D1, $A123, $A138, $A161, $A185
	dw $A1CA, $A1E5, $A207, $A237, $A261, $A27B, $A2A5, $A2C6
	dw $A2E1, $A302, $A322, $A352, $A382, $A3B2, $A3E1, $A454
	dw $A508, $A524, $A5B8, $A5E9, $A680, $A70E, $A7A3, $A81B
	dw $A876, $A96D, $A9F2, $AA0F, $AA3E, $AAD3, $AAFE, $AB19
	dw $AB34, $AB52, $AB61, $AB71, $AB80, $ABB0, $ABCB, $ABDB
	dw $ABED, $AC1D, $AC41, $ACA1, $AD23, $AD47, $ADA6, $AE01
	dw $AE61, $AE95, $AEC2, $AEE4, $AF13, $AF41, $AF9F, $AFD3
	dw $B019, $B068, $B099, $B0C2, $B0F4, $B154, $B176, $B1A3
	dw $B1CD, $B1ED, $B212, $B23E, $B261, $B280, $B29A, $B2C6
	dw $B30C, $B330, $B352, $B373, $B397, $B3BE, $B3E6, $B425
	dw $B44F, $B473, $B491, $B4B4, $B4D1, $B4ED, $B51A, $B56F
	dw $B5EF, $B60D, $B622, $B64B, $B6F9, $B71B, $B738, $B75A
	dw $B801, $B82A, $B85F, $B889, $B8BB, $B8EC, $B91E, $B951
	dw $B97F, $B9AD, $BA04, $BA38, $BA58, $BA81, $BAB8, $BAE5
	dw $BB14, $BB41, $BB6D, $BB9E, $BBD0, $BC17, $BC8D, $BCB6
	dw $BD53, $BDC6, $BE1D, $BE4C, $BED4, $BEF4, $BEFF, $BF0A
	dw $BF73, $BF8F, $BFA2, $BFCF, $BFF2, $C015, $C038, $C08D
	dw $C0DD, $C2AB, $C2EB, $C32C, $C36A, $C38F, $C3BD, $C3EA
	dw $C404, $C42F, $C47F, $C49F, $C4CC, $C51A, $C545, $C56B
	dw $C588, $C5B4, $C5C7, $C5E2, $C6F2, $C750, $C77D, $C7B0
	dw $C7DA, $C807, $C820, $C84B, $C875, $C8A4, $C8CF, $C8F1
	dw $C91C, $CC51, $CF83, $D1D9, $D3C4, $D643, $D85D, $DAB2
	dw $DADC, $DB05, $DB27, $DDD0, $DE21, $DEB5, $DEE2, $DF14
	dw $DF72, $DF9D, $DFE8, $E06D, $E096, $E0C3, $E126, $E158
	dw $E2C3, $E305, $E30C, $E313, $E33A, $E367, $E3F5, $E404
	dw $E413, $E422, $E432, $E446, $E45E, $E476, $E48E, $E4B5
	dw $E4DC, $E4FA, $E5DC, $E608, $E6BD, $E6ED, $E71F, $E76E
	dw $E792, $E7B9, $E7DE, $E7F5, $E81F, $E848, $E868, $E891
	dw $E8B5, $E8D7, $E901, $E91B, $E948, $E970, $E9F8, $EA25
	dw $EA8C, $EAEA, $EE1A, $EE29, $EE7A, $EE88, $EEB3, $EEDA
	dw $EF09, $EF25, $EF45, $EF62, $EFEA, $F039, $F050, $F072
	dw $F0C1, $F157, $F1E4, $F204, $F233, $F24E, $F29E, $F2C8
	dw $F2EC, $F310, $F325, $F356

FiveBeeZeroZero:
db $00,$00,$1A,$00,$33,$00,$49,$00,$62,$00,$7E,$00,$99,$00,$B4,$00
db $D0,$00,$EC,$00,$08,$01,$1E,$01,$3B,$01,$4D,$01,$68,$01,$84,$01
db $9D,$01,$B8,$01,$D1,$01,$EE,$01,$09,$02,$23,$02,$43,$02,$63,$02
db $7F,$02,$99,$02,$B4,$02,$C6,$02,$DE,$02,$F6,$02,$15,$03,$2E,$03
db $4D,$03,$69,$03,$83,$03,$9D,$03,$B7,$03,$D0,$03,$F0,$03,$0E,$04
db $2D,$04,$49,$04,$63,$04,$7C,$04,$91,$04,$AD,$04,$CD,$04,$ED,$04
db $0C,$05,$24,$05,$3E,$05,$5A,$05,$74,$05,$8D,$05,$A7,$05,$C4,$05
db $E2,$05,$FB,$05,$11,$06,$2A,$06,$44,$06,$5C,$06,$7C,$06,$9C,$06
db $BC,$06,$D9,$06,$F9,$06,$19,$07,$39,$07,$59,$07,$77,$07,$97,$07
db $A8,$07,$B9,$07,$CB,$07,$DA,$07,$EC,$07,$FC,$07,$0E,$08,$22,$08
db $35,$08,$4E,$08,$68,$08,$85,$08,$9D,$08,$BA,$08,$D8,$08,$EF,$08
db $03,$09,$21,$09,$3D,$09,$5B,$09,$76,$09,$89,$09,$A3,$09,$BB,$09
db $D2,$09,$EF,$09,$09,$0A,$23,$0A,$3E,$0A,$58,$0A,$78,$0A,$98,$0A
db $B8,$0A,$D6,$0A,$F0,$0A,$0B,$0B,$24,$0B,$3F,$0B,$5C,$0B,$74,$0B
db $93,$0B,$B0,$0B,$BC,$0B,$D5,$0B,$F2,$0B,$0A,$0C,$29,$0C,$49,$0C
db $69,$0C,$83,$0C,$9F,$0C,$B7,$0C,$CC,$0C,$EA,$0C,$09,$0D,$29,$0D
db $49,$0D,$61,$0D,$7B,$0D,$93,$0D,$AD,$0D,$C7,$0D,$E6,$0D,$04,$0E
db $24,$0E,$3C,$0E,$5A,$0E,$73,$0E,$8C,$0E,$A6,$0E,$C6,$0E,$E6,$0E
db $02,$0F,$1F,$0F,$3F,$0F,$5F,$0F,$7F,$0F,$9B,$0F,$B9,$0F,$D9,$0F
db $EB,$0F,$FC,$0F,$0C,$10,$1C,$10,$2C,$10,$3E,$10,$50,$10,$60,$10
db $72,$10,$8C,$10,$A4,$10,$BE,$10,$D8,$10,$F1,$10,$0B,$11,$25,$11
db $3F,$11,$59,$11,$73,$11,$8D,$11,$A7,$11,$C1,$11,$DB,$11,$F5,$11
db $0E,$12,$28,$12,$42,$12,$5A,$12,$74,$12,$8E,$12,$A7,$12,$C1,$12
db $DB,$12,$F5,$12,$0F,$13,$2A,$13,$44,$13,$5E,$13,$77,$13,$91,$13
db $AB,$13,$C5,$13,$DF,$13,$F8,$13,$12,$14,$27,$14,$3F,$14,$5C,$14
db $74,$14,$7C,$14,$83,$14,$A1,$14,$BC,$14,$C7,$14,$D1,$14,$DC,$14
db $EE,$14,$00,$15,$12,$15,$37,$15,$4E,$15,$60,$15,$72,$15,$84,$15
db $96,$15,$A0,$15,$AC,$15,$B4,$15,$BC,$15,$C4,$15,$E4,$15,$03,$16
db $1E,$16,$3B,$16,$56,$16,$70,$16,$8C,$16,$AB,$16,$D1,$16,$F7,$16
db $0B,$17,$31,$17,$45,$17,$6B,$17,$7F,$17,$91,$17,$A1,$17,$B3,$17
db $C5,$17,$D7,$17,$E9,$17,$FB,$17,$0D,$18,$1F,$18,$31,$18,$43,$18
db $55,$18,$67,$18,$79,$18,$8B,$18,$9D,$18,$AF,$18,$C1,$18,$D3,$18
db $D3,$18,$F3,$18,$13,$19,$32,$19,$55,$19,$73,$19,$93,$19,$AE,$19
db $CE,$19,$EE,$19,$0E,$1A,$2E,$1A,$4F,$1A,$6F,$1A,$8B,$1A,$AA,$1A
db $C9,$1A,$E9,$1A,$09,$1B,$29,$1B,$49,$1B,$69,$1B,$89,$1B,$A3,$1B
db $C1,$1B,$DE,$1B,$FE,$1B,$1E,$1C,$3C,$1C,$5C,$1C,$7C,$1C,$9C,$1C
db $BC,$1C,$DA,$1C,$F9,$1C,$18,$1D,$34,$1D,$52,$1D,$6C,$1D,$87,$1D
db $A9,$1D,$CB,$1D,$EB,$1D,$0B,$1E,$2B,$1E,$4C,$1E,$6C,$1E,$8B,$1E
db $AB,$1E,$C8,$1E,$E8,$1E,$06,$1F,$26,$1F,$46,$1F,$66,$1F,$83,$1F
db $A0,$1F,$BE,$1F,$DF,$1F,$FC,$1F,$1C,$20,$3B,$20,$57,$20,$75,$20
db $95,$20,$B5,$20,$D3,$20,$F0,$20,$0F,$21,$2C,$21,$4E,$21,$6C,$21
db $8C,$21,$AC,$21,$CA,$21,$EA,$21,$0B,$22,$29,$22,$47,$22,$65,$22
db $85,$22,$A5,$22,$C5,$22,$E3,$22,$05,$23,$21,$23,$40,$23,$60,$23
db $81,$23,$A1,$23,$C1,$23,$E1,$23,$FE,$23,$1F,$24,$3D,$24,$57,$24
db $76,$24,$96,$24,$B4,$24,$D4,$24,$F3,$24,$13,$25,$31,$25,$51,$25
db $70,$25,$8E,$25,$AE,$25,$CC,$25,$E8,$25,$08,$26,$28,$26,$48,$26
db $66,$26,$86,$26,$A3,$26,$BF,$26,$DE,$26,$FD,$26,$15,$27,$34,$27
db $54,$27,$73,$27,$93,$27,$B1,$27,$D1,$27,$EF,$27,$0D,$28,$2B,$28
db $48,$28,$68,$28,$88,$28,$A8,$28,$C8,$28,$E9,$28,$08,$29,$28,$29
db $47,$29,$67,$29,$87,$29,$A8,$29,$C9,$29,$E7,$29,$05,$2A,$25,$2A
db $45,$2A,$66,$2A,$86,$2A,$A7,$2A,$C7,$2A,$E3,$2A,$03,$2B,$24,$2B
db $42,$2B,$62,$2B,$82,$2B,$A4,$2B,$C0,$2B,$DF,$2B,$FF,$2B,$1D,$2C
db $3E,$2C,$5E,$2C,$7C,$2C,$9B,$2C,$BA,$2C,$D8,$2C,$EA,$2C,$05,$2D
db $25,$2D,$43,$2D,$64,$2D,$85,$2D,$A5,$2D,$C2,$2D,$E2,$2D,$04,$2E
db $23,$2E,$44,$2E,$62,$2E,$7F,$2E,$A1,$2E,$C2,$2E,$E4,$2E,$05,$2F
db $25,$2F,$45,$2F,$66,$2F,$87,$2F,$A8,$2F,$C6,$2F,$E6,$2F,$05,$30
db $27,$30,$49,$30,$68,$30,$8A,$30,$AB,$30,$CE,$30,$F0,$30,$12,$31
db $33,$31,$53,$31,$75,$31,$93,$31,$B2,$31,$D5,$31,$F6,$31,$15,$32
db $33,$32,$54,$32,$76,$32,$93,$32,$B4,$32,$D4,$32,$F4,$32,$16,$33
db $38,$33,$57,$33,$76,$33,$94,$33,$B4,$33,$D1,$33,$F2,$33,$12,$34
db $34,$34,$55,$34,$76,$34,$96,$34,$B8,$34,$D8,$34,$F8,$34,$15,$35
db $36,$35,$57,$35,$74,$35,$95,$35,$B8,$35,$D9,$35,$F9,$35,$1B,$36
db $3D,$36,$5B,$36,$7B,$36,$9D,$36,$BF,$36,$DF,$36,$FC,$36,$1C,$37
db $3E,$37,$5E,$37,$7F,$37,$A0,$37,$C2,$37,$E4,$37,$04,$38,$24,$38
db $44,$38
