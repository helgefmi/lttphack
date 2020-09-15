; TODO make this all go away when changing things

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
	REP #$10
	LDA #$20
	TRB $9B
	LDA #$7F : PHA : PLB
	LDA #$24 : XBA

	; do search index
	LDA.l $03C4 : LSR #4
	ORA #$10 : TAX : STX.w !dg_buffer+0

	LDA.l $03C4 : AND #$0F
	ORA #$10 : TAX : STX.w !dg_buffer+2

	LDA #$38 : XBA

	; do eg thing
	LDA.l $03A4  : LSR #4
	ORA #$10 : TAX : STX.w !dg_buffer+6

	LDA.l $03A4  : AND #$0F
	ORA #$10 : TAX : STX.w !dg_buffer+8

	; unfurled loop because I said so
macro do_ancilla_id(n)
	LDA #$00 : XBA
	LDA.l $0C4A+<n>
	TAX
	LDA.l .replacable_color, X
	XBA

	; write ID
	LDA.l $0C4A+<n> : LSR #4
	;ORA #$10 : TAX : STX.w !dg_buffer+(32*<n>+16)+0
	ORA #$10 : TAX : STX.w !dg_buffer+(16*<n>+16)+0

	LDA.l $0C4A+<n> : AND #$0F
	;ORA #$10 : TAX : STX.w !dg_buffer+(32*<n>+16)+2
	ORA #$10 : TAX : STX.w !dg_buffer+(16*<n>+16)+2

	; do timer
	LDA #$34 : XBA ; yellow pal

	LDA.l $0C5E+<n> : LSR #4
	;ORA #$10 : TAX : STX.w !dg_buffer+(32*<n>+16)+6
	ORA #$10 : TAX : STX.w !dg_buffer+(16*<n>+16)+6

	LDA.l $0C5E+<n> : AND #$0F
	;ORA #$10 : TAX : STX.w !dg_buffer+(32*<n>+16)+8
	ORA #$10 : TAX : STX.w !dg_buffer+(16*<n>+16)+8

	; do X and Y coords

;	LDA.l $0C18+<n> : LSR #4
;	ORA #$10 : TAX : STX.w !dg_buffer+(32*<n>+16)+0+16
;
;	LDA.l $0C18+<n> : AND #$0F
;	ORA #$10 : TAX : STX.w !dg_buffer+(32*<n>+16)+2+16
;
;	LDA.l $0C04+<n> : LSR #4
;	ORA #$10 : TAX : STX.w !dg_buffer+(32*<n>+16)+4+16
;
;	LDA.l $0C04+<n> : AND #$0F
;	ORA #$10 : TAX : STX.w !dg_buffer+(32*<n>+16)+6+16
;
;	LDA #$34 : XBA ; red/yellow pal
;	LDA.l $0C0E+<n> : LSR #4
;	ORA #$10 : TAX : STX.w !dg_buffer+(32*<n>+16)+8+16
;
;	LDA.l $0C0E+<n> : AND #$0F
;	ORA #$10 : TAX : STX.w !dg_buffer+(32*<n>+16)+10+16
;
;	LDA.l $0BFA+<n> : LSR #4
;	ORA #$10 : TAX : STX.w !dg_buffer+(32*<n>+16)+12+16
;
;	LDA.l $0BFA+<n> : AND #$0F
;	ORA #$10 : TAX : STX.w !dg_buffer+(32*<n>+16)+14+16

endmacro

	%do_ancilla_id(0)
	%do_ancilla_id(1)
	%do_ancilla_id(2)
	%do_ancilla_id(3)
	%do_ancilla_id(4)
	%do_ancilla_id(5)
	%do_ancilla_id(6)
	%do_ancilla_id(7)
	%do_ancilla_id(8)
	%do_ancilla_id(9)

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