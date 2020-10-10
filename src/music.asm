; Used when turning on the console, so sound is correctly unmuted after selecting a file.
; This removes file screen music, but oh well.
music_reload:
	SEP #$34 ; I flag too
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
	LDA.w SA1IRAM.preset_type : BNE .loadedPreset

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
