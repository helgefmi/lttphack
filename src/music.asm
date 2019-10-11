pushpc
; Overworld music data
; Overwrites:
; LDA #$F5 : STA $00
; LDA #$9E : STA $01
; LDA #$1A : STA $02
org $008913
	LDX #$00 : JSL music_setup_bank
	NOP #6


; Underworld music data
; Overwrites:
; LDA #$00 : STA $00
; LDA #$80 : STA $01
; LDA #$1B
org $008925
	LDX #$01 : JSL music_setup_bank
	NOP #4


; Ending credits music data
; Overwrites:
; LDA #$80 : STA $00
; LDA #$D3 : STA $01
; LDA #$1A
org $008931
	LDX #$02 : JSL music_setup_bank
	NOP #4

pullpc
; Used when turning on the console, so sound is correctly unmuted after selecting a file.
; This removes file screen music, but oh well.
music_init:
	LDX #$00 : JSL music_setup_bank
	%ppu_off()
	LDA #$FF : STA $2140
	JSL sound_loadsongbank
	%ppu_on()
	JSL $00893d
	RTL


; Sets up $00-03 with the address of the songbank to be loaded.
; Both $008888 (Sound_LoadSongBank) and sound_loadsongbank below can be used for this.
; Enter with X=0 for Overworld music, X=1 for Underworld and X=2 for Credits.
music_setup_bank:
	LDA.l !ram_feature_music : ASL #4 : STA $00
	TXA : ASL #2 : CLC : ADC $00 : TAX

	LDA.l spc_data+0, X : STA $00
	LDA.l spc_data+1, X : STA $01
	LDA.l spc_data+2, X : STA $02
	RTL


music_reload:
	%ai8()
	LDA $1B : TAX : JSL music_setup_bank

	SEI

	STZ $4200
	STZ $420C

	LDA #$FF : STA $2140

	JSL sound_loadsongbank

	CLI

	LDA $1B : STA $0136

	LDA #$81 : STA $4200

	RTL


; Taken from MoN's disassembly. It originated from Bank 0, which I can't JSR to from here.
;
; Loads SPC with data
sound_loadsongbank:
	PHP
	%ai16()

	LDY #$0000
	LDA #$BBAA

.loop
	; // Wait for the SPC to initialize to #$AABB
	CMP $2140 : BNE .loop

	%a8()
	LDA #$CC
	BRA .setup_transfer

.begin_transfer

	LDA [$00], Y
	INY
	XBA
	LDA #$00
	BRA .write_zero_byte

.continue_transfer
	XBA
	LDA [$00], Y ; Load the data byte to transmit.
	INY

	; Are we at the end of a bank?
	CPY.w #$8000 : BNE .not_bank_end ; If not, then branch forward.

	LDY.w #$0000 ; Otherwise, increment the bank of the address at [$00]

	INC $02

.not_bank_end

	XBA

.wait_for_zero
	; Wait for $2140 to be #$00 (we're in 8bit mode)
	CMP $2140 : BNE .wait_for_zero

	INC A ; Increment the byte count

.write_zero_byte
	REP #$20

	; Ends up storing the byte count to $2140 and the
	STA $2140

	SEP #$20 ; data byte to $2141. (Data byte represented as **)

	DEX : BNE .continue_transfer

.synchronize
	; We ran out of bytes to transfer.
	; But we still need to synchronize.
	CMP $2140 : BNE .synchronize

.no_zero ; At this point $2140 = #$01
	; Add four to the byte count
	ADC #$03 : BEQ .no_zero ; (But Don't let A be zero!)

.setup_transfer
	PHA
	REP #$20
	LDA [$00], Y : INY #2 : TAX ; Number of bytes to transmit to the SPC.
	LDA [$00], Y : INY #2 : STA $2142 ; Location in memory to map the data to.
	SEP #$20
	CPX.w #$0001 ; If the number of bytes left to transfer > 0...

	; Then the carry bit will be set
	; And rotated into the accumulator (A = #$01)
	LDA #$00 : ROL A : STA $2141 : ADC #$7F

	; Hopefully no one was confused.
	PLA
	STA $2140

.transfer_init_wait

	; Initially, a 0xCC byte will be sent to initialize
	; The transfer.
	; If A was #$01 earlier...
	CMP $2140 : BNE .transfer_init_wait : BVS .begin_transfer

	STZ $2140 : STZ $2141 : STZ $2142 : STZ $2143
	PLP
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


spc_data:
	dl $1A9EF5 : db $00 ; overworld
	dl $1B8000 : db $00 ; underworld
	dl $1AD380 : db $00 ; credits
	dl $000000 : db $00 ; unused

	dl !SPC_DATA_OVERWORLD : db $00
	dl !SPC_DATA_UNDERWORLD : db $00
	dl !SPC_DATA_CREDITS : db $00
	dl $000000 : db $00 ; unused

incsrc "musicvolumes.asm"
