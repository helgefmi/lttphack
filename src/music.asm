; Overworld music data
; Overwrites:
; LDA #$F5 : STA $00
; LDA #$9E : STA $01
; LDA #$1A : STA $02
org $008913
  LDX #$00 : JSL music_setup_bank
  NOP : NOP
  NOP : NOP
  NOP : NOP


; Underworld music data
; Overwrites:
; LDA #$00 : STA $00
; LDA #$80 : STA $01
; LDA #$1B
org $008925
  LDX #$01 : JSL music_setup_bank
  NOP : NOP
  NOP : NOP


; Ending credits music data
; Overwrites:
; LDA #$80 : STA $00
; LDA #$D3 : STA $01
; LDA #$1A
org $008931
  LDX #$02 : JSL music_setup_bank
  NOP : NOP
  NOP : NOP


; Overwrites:
; JSL $00893d
org $028046
    JSL music_loadfile

org !ORG
music_loadfile:
    LDX #$00 : JSL music_setup_bank
    LDA #$FF : STA $2140
 %ppu_off()
    JSR sound_loadsongbank
 %ppu_on()
    JSL $00893d
    RTL

music_setup_bank:
  PHB : PHK : PLB
    LDA !ram_feature_music : ASL #4 : STA $00
    TXA : ASL #2 : CLC : ADC $00 : TAX

    LDA spc_data, X : STA $00
    LDA spc_data+1, X : STA $01
    LDA spc_data+2, X : STA $02
  PLB
    RTL


music_load_data:
  %ai8()
    LDA $1B : TAX
    JSL music_setup_bank
    LDA #$FF : STA $2140
  %ppu_off()
    JSR sound_loadsongbank
  %ppu_on()

    LDA $0133 : STA $012C
    STZ $0133

    RTL


; Taken from MoN's disassembly. It originated from Bank 0, which I can't JSR to from here.
sound_loadsongbank:
	; Loads SPC with data

	PHP

	REP #$30

	LDY.w #$0000
	LDA.w #$BBAA

BRANCH_INIT_WAIT:

	; // Wait for the SPC to initialize to #$AABB
	CMP $2140 : BNE BRANCH_INIT_WAIT

	SEP #$20

	LDA.b #$CC

	BRA BRANCH_SETUP_TRANSFER

BRANCH_BEGIN_TRANSFER:

	LDA [$00], Y

	INY

	XBA

	LDA.b #$00

	BRA BRANCH_WRITE_ZERO_BYTE

BRANCH_CONTINUE_TRANSFER:

	XBA

	LDA [$00], Y ; Load the data byte to transmit.

	INY

	; Are we at the end of a bank?
	CPY.w #$8000 : BNE BRANCH_NOT_BANK_END ; If not, then branch forward.

	LDY.w #$0000 ; Otherwise, increment the bank of the address at [$00]

	INC $02

BRANCH_NOT_BANK_END:

	XBA

BRANCH_WAIT_FOR_ZERO:

	; Wait for $2140 to be #$00 (we're in 8bit mode)
	CMP $2140 : BNE BRANCH_WAIT_FOR_ZERO

	INC A ; Increment the byte count

BRANCH_WRITE_ZERO_BYTE:

	REP #$20

	; Ends up storing the byte count to $2140 and the
	STA $2140

	SEP #$20 ; data byte to $2141. (Data byte represented as **)

	DEX : BNE BRANCH_CONTINUE_TRANSFER

BRANCH_SYNCHRONIZE: ; We ran out of bytes to transfer.

	; But we still need to synchronize.
	CMP $2140 : BNE BRANCH_SYNCHRONIZE

BRANCH_NO_ZERO: ; At this point $2140 = #$01

	; Add four to the byte count
	ADC.b #$03 : BEQ BRANCH_NO_ZERO ; (But Don't let A be zero!)

BRANCH_SETUP_TRANSFER:

	PHA

	REP #$20

	LDA [$00], Y : INY #2 : TAX ; Number of bytes to transmit to the SPC.

	LDA [$00], Y : INY #2 : STA $2142 ; Location in memory to map the data to.

	SEP #$20

	CPX.w #$0001 ; If the number of bytes left to transfer > 0...

	; Then the carry bit will be set
	; And rotated into the accumulator (A = #$01)
	; NOTE ANTITRACK'S DOC IS WRONG ABOUT THIS!!!
	; He mistook #$0001 to be #$0100.
	LDA.b #$00 : ROL A : STA $2141 : ADC.b #$7F

	; Hopefully no one was confused.
	PLA : STA $2140

BRANCH_TRANSFER_INIT_WAIT:

	; Initially, a 0xCC byte will be sent to initialize
	; The transfer.
	; If A was #$01 earlier...
	CMP $2140 : BNE BRANCH_TRANSFER_INIT_WAIT : BVS BRANCH_BEGIN_TRANSFER

	STZ $2140 : STZ $2141 : STZ $2142 : STZ $2143

	PLP

	RTS

spc_data:
    dl $1B8000 : db $00 ; overworld
    dl $1A9EF5 : db $00 ; underworld
    dl $1AD380 : db $00 ; credits
    dl $000000 : db $00 ; unused

    dl !SPC_DATA_OVERWORLD : db $00 
    dl !SPC_DATA_UNDERWORLD : db $00
    dl !SPC_DATA_CREDITS : db $00
    dl $000000 : db $00 ; unused

incsrc "musicvolumes.asm"
