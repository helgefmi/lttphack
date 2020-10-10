;     012345678901234567890123456789012
; 00  ---------------------------------
; 01  ---------------------------------
; 02  --HUDHUDHUDHUDHUDHUDHUDHUDHUDHU--
; 03  --HUDHUDHUDHUDHUDHUDHUDHUDHUDHU--
; 04  --HUDHUDHUDHUDHUDHUDHUDHUDHUDHU--
; 05  --HUDHUDHUDHUDHUDHUDHUDHUDHUDHU--
; 06  --HUDHUDHUDHUDHUDHUDHUDHUDHUDHU--
; 07  --HUDHUDHUDHUDHUDHUDHUDHUDHUDHU--
; 08  --ss ee--------------------------
; 09  --#0 rr-----------------xxxxyyyy-
; 10  --#1 rr-----------------xxxxyyyy-
; 11  --#2 rr-----------------xxxxyyyy-
; 12  --#3 rr-----------------xxxxyyyy-
; 13  --#4 rr-----------------xxxxyyyy-
; 14  --#5 rr-----------------xxxxyyyy-
; 15  --#6 rr-----------------xxxxyyyy-
; 16  --#7 rr-----------------xxxxyyyy-
; 17  --#8 rr-----------------xxxxyyyy-
; 18  --#9 rr-----------------xxxxyyyy-
; 19  --
; 10  --
; 21  --
; 22  --
; 23  --
; 24  --
; 25  --
; 26  --
; 27  --
; 28  --
; 29  --
; 30  ---------------------------------
; 31  ---------------------------------
; 
; ## = ancilla ID for slot
; xxxx = X coord
; yyyy = Y coord
; 
; ss = search ($03C4)
; ee = eg ($03A4)
; rr = various usage ($0C5E)

UpdateAncillaWindow:
	JSL ClearSWBuffer

	REP #$10
	SEP #$20

	LDA #$20
	TRB.b SA1IRAM.HDMA_ASK

	LDA #$24 : XBA

	LDA #$38 : XBA

	; do eg thing
	LDA.w SA1IRAM.CopyOf_03A4  : LSR #4
	ORA #$10 : TAX : STX.w SA1RAM.SW_BUFFER+6

	LDA.w SA1IRAM.CopyOf_03A4  : AND #$0F
	ORA #$10 : TAX : STX.w SA1RAM.SW_BUFFER+8

	; do each ancilla
	LDY.w #$0009

.nextancilla
	; get row
	REP #$20
	TYA

	; A = (Y+1)*16
	INC
	ASL
	ASL
	ASL
	ASL

	ADC.w #SA1RAM.SW_BUFFER
	STA.b SA1IRAM.SCRATCH+10

	; get ID color in top byte of A
	SEP #$30
	LDX.w SA1IRAM.CopyOf_0C4A, Y
	LDA.l .replacable_color, X
	XBA

	; write ID
	TXA
	JSR write_2hex_ancilla

	; 2 more for gap between ID and next thing
	INC.b SA1IRAM.SCRATCH+10
	INC.b SA1IRAM.SCRATCH+10

	LDA.w #$3400 ; yellow pal
	SEP #$20
	LDA.w SA1IRAM.CopyOf_0C5E, Y
	JSR write_2hex_ancilla

	DEY
	BPL .nextancilla

	RTS

!z = $30 ; gray
!r = $38 ; white text
!p = $24 ; red outline
.replacable_color
	db !z, !p, !p, !p, !p, !p, !p, !p ; 0x00-0x07
	db !p, !p, !r, !p, !p, !p, !p, !p ; 0x08-0x0F
	db !p, !p, !p, !r, !p, !p, !p, !p ; 0x10-0x17
	db !p, !p, !p, !p, !p, !p, !p, !p ; 0x18-0x1F
	db !p, !p, !p, !p, !p, !p, !p, !p ; 0x20-0x27
	db !p, !p, !p, !p, !p, !p, !p, !p ; 0x28-0x2F
	db !p, !p, !p, !p, !p, !p, !p, !p ; 0x30-0x37
	db !p, !p, !p, !p, !r, !p, !p, !p ; 0x38-0x3F
	db !p, !p, !p, !p ; 0x40-0x43
	fillbyte !z : fill $50 ; fill the rest with 0

write_2hex_ancilla:
	REP #$10
	TAX
	LSR
	LSR
	LSR
	LSR
	ORA.b #$10

	REP #$20
	STA.b (SA1IRAM.SCRATCH+10)
	INC.b SA1IRAM.SCRATCH+10
	INC.b SA1IRAM.SCRATCH+10

	TXA ; low byte
	AND.w #$FF0F
	ORA.w #$0010

	STA.b (SA1IRAM.SCRATCH+10)
	INC.b SA1IRAM.SCRATCH+10
	INC.b SA1IRAM.SCRATCH+10
	RTS

DrawHexSW:
.four
..white
	LDY.b #(!P3|!RED_PAL)>>8
	BRA ..set

..yellow
	LDY.b #(!P3|!REDYELLOW)>>8
	BRA ..set

..gray
	LDY.b #(!P3|!GRAY_PAL)>>8
	BRA ..set

..red
	LDY.b #(!P3|!TEXT_PAL)>>8
	BRA ..set

..set
	STY.b SA1IRAM.SCRATCH+11
	LDY.b #$10
	STY.b SA1IRAM.SCRATCH+10
	LDY.b #4
	BRA .draw_n_digits

.three
..white
	LDY.b #(!P3|!RED_PAL)>>8
	BRA ..set

..yellow
	LDY.b #(!P3|!REDYELLOW)>>8
	BRA ..set

..gray
	LDY.b #(!P3|!GRAY_PAL)>>8
	BRA ..set

..red
	LDY.b #(!P3|!TEXT_PAL)>>8
	BRA ..set

..set
	STY.b SA1IRAM.SCRATCH+11
	LDY.b #$10
	STY.b SA1IRAM.SCRATCH+10
	LDY.b #3
	BRA .draw_n_digits

.two
..white
	LDY.b #(!P3|!RED_PAL)>>8
	BRA ..set

..yellow
	LDY.b #(!P3|!REDYELLOW)>>8
	BRA ..set

..gray
	LDY.b #(!P3|!GRAY_PAL)>>8
	BRA ..set

..red
	LDY.b #(!P3|!TEXT_PAL)>>8
	BRA ..set

..set
	STY.b SA1IRAM.SCRATCH+11
	LDY.b #$10
	STY.b SA1IRAM.SCRATCH+10
	LDY.b #2
	BRA .draw_n_digits

.next_digit
	LSR
	LSR
	LSR
	LSR

.draw_n_digits
	PHA ; remember coordinates
	AND.w #$000F ; get digit
	ORA.b SA1IRAM.SCRATCH+10 ; add in color
	STA.w SA1RAM.SW_BUFFER+6, X
	PLA ; recover value
	DEX
	DEX
	DEY
	BNE .next_digit
	RTS
