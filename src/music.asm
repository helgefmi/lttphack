; Used when turning on the console, so sound is correctly unmuted after selecting a file.
; This removes file screen music, but oh well.
music_reload:
	SEP #$30
	SEI
	STZ $4200
	STZ $420C
	STZ $0136
	LDA #$FF : STA $2140

	LDA $1B : BEQ .indoors
	JSL $008925
	BRA ++
.indoors
	JSL $008913

++	LDA #$81 : STA $4200
	LDA $1B : STA $0136
	RTL

music_overworld_track:
	LDA !ram_preset_type : BNE .loadedPreset

	; Let duck music logic run
	LDA #$10
	STA $012F
	LDA $8A
	CLC
	RTL

.loadedPreset
	; Run our own logic for deciding music track

	LDX.b #$02

	LDA $8A

	CMP.b #$03 : BEQ .setCustomSong
	CMP.b #$05 : BEQ .setCustomSong
	CMP.b #$07 : BEQ .setCustomSong

	; death mountain theme
	LDX.b #$09

	LDA $8A

	CMP.b #$43 : BEQ .setCustomSong
	CMP.b #$45 : BEQ .setCustomSong
	CMP.b #$47 : BEQ .setCustomSong

	LDY.b #$5A

	; If we're in the dark world
	LDA $8A : CMP.b #$40 : BCS .darkWorld

	; Default village theme
	LDX.b #$07

	; Check what phase we're in (If less than phase 3)
	LDA $7EF3C5 : CMP.b #$03 : BCC .beforeAgahnim

	; Default light world theme
	LDX.b #$02

.beforeAgahnim

	; Were we just in the smithy's well?
	LDA $A0 : CMP.b #$E3 : BEQ .setCustomSong

	; Or were we just near a hole with a big fairy?
	CMP.b #$18 : BEQ .setCustomSong

	; Or were we just in the village hole?
	CMP.b #$2F : BEQ .setCustomSong

	LDA $A0 : CMP.b #$1F : BNE .notWeirdoShopInVillage

	; Check if we're entering the village
	LDA $8A : CMP.b #$18 : BEQ .setCustomSong

.notWeirdoShopInVillage

	LDX.b #$05

	; check if we've received the master sword yet or not
	LDA $7EF300 : AND.b #$40 : BEQ .noMasterSword

	; Set music to default Light World theme
	LDX.b #$02

.noMasterSword

	LDA $A0    : BEQ .setCustomSong
	CMP.b #$E1 : BEQ .setCustomSong

.darkWorld

	LDX.b #$F3

	; If the volume was set to half, set it back to full
	LDA $0132 : CMP.b #$F2 : BEQ .setSong

	; Use the normal overworld (light world) music
	LDX.b #$02

	; Check phase        ; In phase >= 2
	LDA $7EF3C5 : CMP.b #$02 : BCS .setCustomSong

	; If phase < 2, play the legend music
	LDX.b #$03

.setCustomSong

	; Check world status
	LDA $7EF3CA : BEQ .setSong

	; Not in the lightworld, so play the dark woods theme
	LDX.b #$0D

	; But only in certain OW areas
	LDA $8A : CMP.b #$40 : BEQ .checkMoonPearl

	; Check a certain list of overworld locations
	; That have the dark forest theme
	CMP.b #$43 : BEQ .checkMoonPearl
	CMP.b #$45 : BEQ .checkMoonPearl
	CMP.b #$47 : BEQ .checkMoonPearl

	; Otherwise play the normal dark world overworld music
	LDX.b #$09

.checkMoonPearl

	; Does Link have a moon pearl?
	LDA $7EF357 : BNE .setSong

	; If not, play that stupid music that plays when you're a bunny in the Dark World.
	LDX.b #$04

.setSong
	STX $012C

.done
	SEC
	RTL

; incsrc "musicvolumes.asm"
mute_music:
	PHP : SEP #$30
	LDA.b #MutedInstruments>>0 : STA $00
	LDA.b #MutedInstruments>>8 : STA $01
	BRA DoMusic

unmute_music:
	PHP : SEP #$30
	LDA.b #UnmutedInstruments>>0 : STA $00
	LDA.b #UnmutedInstruments>>8 : STA $01
	BRA DoMusic

DoMusic:
	SEI
	STZ $4200
	STZ $420C
	LDA #$FF : STA $2140
	LDA.b #DoMusic>>16
	JSL $00891D ; load song bank

	SEP #$30
	LDA #$81 : STA $4200
	LDA $0133 : STA $012C
	PLP
	RTL

UnmutedInstruments:
	dw .end-.start, $3D00

.start
	db $00, $FF, $E0, $B8, $04, $70
	db $01, $FF, $E0, $B8, $07, $90
	db $02, $FF, $E0, $B8, $09, $C0
	db $03, $FF, $E0, $B8, $04, $00
	db $04, $FF, $E0, $B8, $04, $00
	db $05, $FF, $E0, $B8, $04, $70
	db $06, $FF, $E0, $B8, $04, $70
	db $07, $FF, $E0, $B8, $04, $70
	db $08, $FF, $E0, $B8, $07, $A0
	db $09, $8F, $E9, $B8, $01, $E0
	db $0A, $8A, $E9, $B8, $01, $E0
	db $0B, $FF, $E0, $B8, $03, $00
	db $0C, $FF, $E0, $B8, $03, $A0
	db $0D, $FF, $E0, $B8, $01, $00
	db $0E, $FF, $EF, $B8, $0E, $A0
	db $0F, $FF, $EF, $B8, $06, $00
	db $10, $FF, $E0, $B8, $03, $D0
	db $11, $8F, $E0, $B8, $03, $00
	db $12, $8F, $E0, $B8, $06, $F0
	db $13, $FD, $E0, $B8, $07, $A0
	db $14, $FF, $E0, $B8, $07, $A0
	db $15, $FF, $E0, $B8, $03, $D0
	db $16, $8F, $E0, $B8, $03, $00
	db $17, $FF, $E0, $B8, $02, $C0
	db $18, $FE, $8F, $B8, $06, $F0

.end
	dw $0000, $0800

MutedInstruments:
	dw .end-.start, $3D00

.start
	db $00, $00, $00, $B8, $04, $70
	db $01, $00, $00, $B8, $07, $90
	db $02, $00, $00, $B8, $09, $C0
	db $03, $00, $00, $B8, $04, $00
	db $04, $00, $00, $B8, $04, $00
	db $05, $00, $00, $B8, $04, $70
	db $06, $FF, $E0, $B8, $04, $70 ; mirror uses this, leave unmuted
	db $07, $00, $00, $B8, $04, $70
	db $08, $00, $00, $B8, $07, $A0
	db $09, $00, $00, $B8, $01, $E0
	db $0A, $00, $00, $B8, $01, $E0
	db $0B, $00, $00, $B8, $03, $00
	db $0C, $00, $00, $B8, $03, $A0
	db $0D, $00, $00, $B8, $01, $00
	db $0E, $00, $00, $B8, $0E, $A0
	db $0F, $00, $00, $B8, $06, $00
	db $10, $00, $00, $B8, $03, $D0
	db $11, $00, $00, $B8, $03, $00
	db $12, $00, $00, $B8, $06, $F0
	db $13, $00, $00, $B8, $07, $A0
	db $14, $00, $00, $B8, $07, $A0
	db $15, $00, $00, $B8, $03, $D0
	db $16, $00, $00, $B8, $03, $00
	db $17, $00, $00, $B8, $02, $C0
	db $18, $00, $00, $B8, $06, $F0

.end
	dw $0000, $0800
