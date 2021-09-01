EmptyEntireMenu:
	REP #$20
	SEP #$10
	LDX.b #$00

	LDA.w #$002F

.loop
	STA.w SA1RAM.MENU+$0000,X : STA.w SA1RAM.MENU+$0080,X
	STA.w SA1RAM.MENU+$0100,X : STA.w SA1RAM.MENU+$0180,X
	STA.w SA1RAM.MENU+$0200,X : STA.w SA1RAM.MENU+$0280,X
	STA.w SA1RAM.MENU+$0300,X : STA.w SA1RAM.MENU+$0380,X
	STA.w SA1RAM.MENU+$0400,X : STA.w SA1RAM.MENU+$0480,X
	STA.w SA1RAM.MENU+$0500,X : STA.w SA1RAM.MENU+$0580,X
	STA.w SA1RAM.MENU+$0600,X : STA.w SA1RAM.MENU+$0680,X
	STA.w SA1RAM.MENU+$0700,X : STA.w SA1RAM.MENU+$0780,X

	INX
	INX
	BPL .loop

	RTS

EmptyCurrentMenu:
	REP #$30

	LDY.w #0

	; clean every row
.nextclean
	LDA.b [SA1IRAM.cm_current_menu],Y
	BPL .doneclean ; if we hit a 0, we're done

	JSR EmptyCurrentRow
	INY
	INY
	BRA .nextclean

.doneclean
--	RTS

;===================================================================================================

DrawCurrentMenu:
	REP #$30
	LDY.w #0

.nextdraw
	LDA.b [SA1IRAM.cm_current_menu],Y
	BPL --

	JSR DrawCurrentRow
	INY
	INY
	BRA .nextdraw

;===================================================================================================

EmptyCurrentRow:
	JSR CM_YRowToXOffset

	STZ.b SA1IRAM.cm_draw_color
	BRA .next_clean

.from_here_to_end
	REP #$20

.next_clean
	LDA.w #$002F
	ORA.b SA1IRAM.cm_draw_color
	STA.w SA1RAM.MENU,X
	INX
	INX
	TXA
	AND.w #$003F
	BNE .next_clean

	RTS

#EmptyRestOfRow_long:
	JSR .from_here_to_end
	RTL

;===================================================================================================

CM_YRowToXOffset:
	TYA
	LSR
	ASL #6

	ADC.w #64 ; down 1 row

	CPY.w #0
	BEQ .header

	ADC.w #63 ; down 1 more row if not a header, includes carry

.header
	TAX
	RTS

;===================================================================================================

; in this case,Y holds the cursor index, not the message index
DrawCurrentRow_ShiftY:
	SEP #$10 ; clear top of Y, just in case
	REP #$30
	TYA
	INC
	ASL
	TAY

;===================================================================================================

; Y = index into thing where 0 = header
DrawCurrentRow:
	REP #$30
	PHY

	JSR CM_YRowToXOffset

	; put location of our row's text into DP
	LDA.b SA1IRAM.cm_current_menu+1
	STA.b SA1IRAM.cm_current_draw+1

	LDA.b [SA1IRAM.cm_current_menu],Y
	STA.b SA1IRAM.cm_current_draw+0

	TYA
	LSR ; does it match our selection?

	DEC ; negative means it was 0, aka a header
	BMI .header

	SEP #$20
	CMP.b SA1IRAM.cm_cursor
	REP #$20
	BNE .noselect

.select
	LDA.b SA1IRAM.cm_submodule
	CMP.w #$0008
	BEQ .settingjoy

	LDA.w #!SELECTED
	BRA .setcol

.header
	LDA.w #!HEADER
	BRA .setcol

.settingjoy
	LDA.w #!SHORTCUTTING
	BRA .setcol

.noselect
	LDA.w #!UNSELECTED

.setcol
	STA.b SA1IRAM.cm_draw_color

	ORA.w #$002F ; fill first character
	STA.w SA1RAM.MENU,X
	INX
	INX

	TYA
	BEQ .isheader

	LDA.b [SA1IRAM.cm_current_draw] ; what routine type is it?
	AND.w #$00FF

.isheader
	PHX
	TAX

	ASL
	STA.b SA1IRAM.cm_draw_type_offset ; remember the type for drawing

	LDA.w ActionLengths,X ; this is how many bytes the header is for the item
	AND.w #$00FF
	TAY ; location of name

	LDA.w ActionIcons,X ; get the icon, obviously
	AND.w #$00FF
	ORA.b SA1IRAM.cm_draw_color
	PLX
	STA.w SA1RAM.MENU,X

	LDA.w #16 ; for determining the filler size
	STA.b SA1IRAM.cm_draw_filler
	INX
	INX

	; write out item name
.next_letter
	LDA.b [SA1IRAM.cm_current_draw],Y
	AND.w #$00FF
	CMP.w #$00FF
	BEQ .done_row_name

	ORA.b SA1IRAM.cm_draw_color
	STA.w SA1RAM.MENU,X

	INY

	INX
	INX
	DEC.b SA1IRAM.cm_draw_filler ; this is 1 less char to draw for filler
	BRA .next_letter

.done_row_name
; for X until option, draw spaces
	LDY.b SA1IRAM.cm_draw_filler ; number of characters to reach param
	BMI .long_name

	LDA.w #$002F
	ORA.b SA1IRAM.cm_draw_color

.next_mid_fill
	STA.w SA1RAM.MENU,X

	INX
	INX
	DEY
	BPL .next_mid_fill

.long_name
	; now draw the specific routine type
	PHX

	LDX.b SA1IRAM.cm_draw_type_offset
	LDA.w ActionDrawRoutines,X

	PLX

	PEA.w .return-1

	PHA

	SEP #$20 ; more useful during drawing
	LDY.w #1 ; to skip the draw type

	RTS

.return
	JSR EmptyCurrentRow_from_here_to_end

.done_all
	REP #$30
	PLY
	RTS


;===================================================================================================

CMDRAW_SAVE_ADDRESS_LONG:
	JSR .continue

	LDA.b [SA1IRAM.cm_current_draw],Y
	STA.b SA1IRAM.cm_writer+2
	INY
	RTS

#CMDRAW_SAVE_ADDRESS_00:
	SEP #$20
	STZ.b SA1IRAM.cm_writer+2

.continue
	REP #$20
	LDA.b [SA1IRAM.cm_current_draw],Y
	INY
	INY

	STA.b SA1IRAM.cm_writer+0

	LDA.w #$0000 ; clear top byte to be nice

	SEP #$20
	RTS

;===================================================================================================
; This routine hinges on stack for program bank
; No JMLs allowed
;===================================================================================================
CMDRAW_WORD_LONG_LONG:
	PEA.w .return-1 ; so it will pull everything we push then return here

	PHP
	REP #$20
	PHY
	PHB
	PHA

	LDA 10,S ; get high byte too since slightly faster this way
	PHA
	PLB ; high byte pulled first
	PLB ; PRGB of caller

	BRA CMDRAW_WORD_START

.return
	RTL

;===================================================================================================

CMDRAW_WORD_LONG:
	PHP
	REP #$30
	PHY
	PHB
	PHA

	SEP #$20
	LDA.b SA1IRAM.cm_writer+2
	PHA
	PLB

	REP #$20
	BRA CMDRAW_WORD_START

;===================================================================================================

CMDRAW_WORD:
	PHP
	REP #$30
	PHY

	PHB
	PHK
	PLB

	PHA

CMDRAW_WORD_START:
	LDY.w #0

.next
	LDA (1,S),Y
	AND.w #$00FF
	CMP.w #$00FF
	BEQ .done

	ORA.b SA1IRAM.cm_draw_color
	STA.w SA1RAM.MENU,X
	INX
	INX
	INY
	BRA .next

.done
	PLA
	PLB
	PLY
	PLP
	RTS

;===================================================================================================

CMDRAW_RANDOM:
	REP #$20
	LDA.w #.text
	JSR CMDRAW_WORD
	RTL

.text
	db "Random", $FF

CMDRAW_ERROR:
	REP #$20
	LDA.w #.text
	JSR CMDRAW_WORD
	RTL

.text
#ERROR_TEXT:
	db "BAD VAL", $FF

CMDRAW_YES:
	REP #$20
	LDA.w #.text
	JSR CMDRAW_WORD
	RTL

.text
	db "Yes", $FF

CMDRAW_NO:
	REP #$20
	LDA.w #.text
	JSR CMDRAW_WORD
	RTL

.text
	db "No", $FF

CMDRAW_UNFIXED:
	REP #$20
	LDA.w #.text
	JSR CMDRAW_WORD
	RTL

.text
	db "Unfixed", $FF

CMDRAW_ONOFF:
%list_header(2)
	%list_item("Off")
	%list_item("On")

;===================================================================================================

; TODO 3 digits for room ID?
CMDRAW_NUMFIELD_HEX_UPDATEWHOLEMENU:

CMDRAW_HEX_2_DIGITS:
	LDY.w #2
	BRA CMDRAW_HEX

CMDRAW_HEX_4_DIGITS:
	LDY.w #4
	BRA CMDRAW_HEX

CMDRAW_HEX:
	PHP

	REP #$20
	PHA ; remember our number

	LDA.w #'$' ; first add hex prefix to menu
	ORA.b SA1IRAM.cm_draw_color
	STA.w SA1RAM.MENU,X

	TYA
	ASL
	STA.w $0000
	TXA
	ADC.w $0000 ; A now points to last digit of the number
	TAX ; let X have that for later

	PLA ; get A back
	PHX ; save X position, we're going to decrement it soon

	BRA .fill_hex

.next_digit
	LSR
	LSR
	LSR
	LSR

.fill_hex
	PHA

	AND.w #$000F
	ORA.b SA1IRAM.cm_draw_color
	STA.w SA1RAM.MENU,X

	PLA

	DEX
	DEX

	DEY
	BNE .next_digit

	PLX ; recover our position
	INX ; set it to after the last digit
	INX

	PLP
	RTL

;===================================================================================================

CMDRAW_1_CHARACTER:
	PHP
	REP #$20
	AND.w #$00FF
	ORA.b SA1IRAM.cm_draw_color

	STA.w SA1RAM.MENU,X
	INX
	INX

	PLP
	RTL

;===================================================================================================

CMDRAW_TOGGLE_BIT0:
	LDA.b #$1<<0 : BRA CMDRAW_CHECK_BIT_LOCAL

CMDRAW_TOGGLE_BIT1:
	LDA.b #$1<<1 : BRA CMDRAW_CHECK_BIT_LOCAL

CMDRAW_TOGGLE_BIT2:
	LDA.b #$1<<2 : BRA CMDRAW_CHECK_BIT_LOCAL

CMDRAW_TOGGLE_BIT3:
	LDA.b #$1<<3 : BRA CMDRAW_CHECK_BIT_LOCAL

CMDRAW_TOGGLE_BIT4:
	LDA.b #$1<<4 : BRA CMDRAW_CHECK_BIT_LOCAL

CMDRAW_TOGGLE_BIT5:
	LDA.b #$1<<5 : BRA CMDRAW_CHECK_BIT_LOCAL

CMDRAW_TOGGLE_BIT6:
	LDA.b #$1<<6 : BRA CMDRAW_CHECK_BIT_LOCAL

CMDRAW_TOGGLE_BIT7:
	LDA.b #$1<<7 : BRA CMDRAW_CHECK_BIT_LOCAL

CMDRAW_TOGGLE:
CMDRAW_TOGGLE_FUNC:
	LDA.b #$FF : BRA CMDRAW_CHECK_BIT_LOCAL

CMDRAW_CHECK_BIT_LONG:
	PHA
	JSR CMDRAW_SAVE_ADDRESS_LONG
	BRA .continue

#CMDRAW_CHECK_BIT_LOCAL:
	PHA
	JSR CMDRAW_SAVE_ADDRESS_00

.continue
	PLA
	AND.b [SA1IRAM.cm_writer]
	BNE ++

	JSL CMDRAW_NO
	RTS

++	JSL CMDRAW_YES
	RTS

CMDRAW_TOGGLE_LONG:
CMDRAW_TOGGLE_LONG_FUNC:
	LDA.b #$FF : BRA CMDRAW_CHECK_BIT_LONG

CMDRAW_TOGGLE_BIT7_LONG:
	LDA.b #$1<<7 : BRA CMDRAW_CHECK_BIT_LONG

CMDRAW_TOGGLE_BIT6_LONG:
	LDA.b #$1<<6 : BRA CMDRAW_CHECK_BIT_LONG

CMDRAW_TOGGLE_BIT5_LONG:
	LDA.b #$1<<5 : BRA CMDRAW_CHECK_BIT_LONG

CMDRAW_TOGGLE_BIT4_LONG:
	LDA.b #$1<<4 : BRA CMDRAW_CHECK_BIT_LONG

CMDRAW_TOGGLE_BIT3_LONG:
	LDA.b #$1<<3 : BRA CMDRAW_CHECK_BIT_LONG

CMDRAW_TOGGLE_BIT2_LONG:
	LDA.b #$1<<2 : BRA CMDRAW_CHECK_BIT_LONG

CMDRAW_TOGGLE_BIT1_LONG:
	LDA.b #$1<<1 : BRA CMDRAW_CHECK_BIT_LONG

CMDRAW_TOGGLE_BIT0_LONG:
	LDA.b #$1<<0 : BRA CMDRAW_CHECK_BIT_LONG

;---------------------------------------------------------------------------------------------------

CMDRAW_TOGGLE_BIT0_CUSTOMTEXT:
	LDA.b #$1<<0 : BRA CMDRAW_CHECK_BIT_LOCAL_CUSTOMTEXT

CMDRAW_TOGGLE_BIT1_CUSTOMTEXT:
	LDA.b #$1<<1 : BRA CMDRAW_CHECK_BIT_LOCAL_CUSTOMTEXT

CMDRAW_TOGGLE_BIT2_CUSTOMTEXT:
	LDA.b #$1<<2 : BRA CMDRAW_CHECK_BIT_LOCAL_CUSTOMTEXT

CMDRAW_TOGGLE_BIT3_CUSTOMTEXT:
	LDA.b #$1<<3 : BRA CMDRAW_CHECK_BIT_LOCAL_CUSTOMTEXT

CMDRAW_TOGGLE_BIT4_CUSTOMTEXT:
	LDA.b #$1<<4 : BRA CMDRAW_CHECK_BIT_LOCAL_CUSTOMTEXT

CMDRAW_TOGGLE_BIT5_CUSTOMTEXT:
	LDA.b #$1<<5 : BRA CMDRAW_CHECK_BIT_LOCAL_CUSTOMTEXT

CMDRAW_TOGGLE_BIT6_CUSTOMTEXT:
	LDA.b #$1<<6 : BRA CMDRAW_CHECK_BIT_LOCAL_CUSTOMTEXT

CMDRAW_TOGGLE_BIT7_CUSTOMTEXT:
	LDA.b #$1<<7 : BRA CMDRAW_CHECK_BIT_LOCAL_CUSTOMTEXT

CMDRAW_TOGGLE_CUSTOMTEXT:
CMDRAW_TOGGLE_FUNC_CUSTOMTEXT:
	LDA.b #$FF : BRA CMDRAW_CHECK_BIT_LOCAL_CUSTOMTEXT

CMDRAW_CHECK_BIT_LONG_CUSTOMTEXT:
	PHA
	JSR CMDRAW_SAVE_ADDRESS_LONG
	BRA .continue

#CMDRAW_CHECK_BIT_LOCAL_CUSTOMTEXT:
	PHA
	JSR CMDRAW_SAVE_ADDRESS_00

.continue
	PLA
	AND.b [SA1IRAM.cm_writer]
	PHP

	JSR CMDRAW_SAVE_ADDRESS_LONG
	LDY.w #0

	PLP
	BNE .on

	LDY.w #2

.on
	REP #$20
	LDA.b [SA1IRAM.cm_writer],Y
	JMP CMDRAW_WORD_LONG

CMDRAW_TOGGLE_LONG_CUSTOMTEXT:
CMDRAW_TOGGLE_LONG_FUNC_CUSTOMTEXT:
	LDA.b #$FF : BRA CMDRAW_CHECK_BIT_LONG_CUSTOMTEXT

CMDRAW_TOGGLE_BIT7_LONG_CUSTOMTEXT:
	LDA.b #$1<<7 : BRA CMDRAW_CHECK_BIT_LONG_CUSTOMTEXT

CMDRAW_TOGGLE_BIT6_LONG_CUSTOMTEXT:
	LDA.b #$1<<6 : BRA CMDRAW_CHECK_BIT_LONG_CUSTOMTEXT

CMDRAW_TOGGLE_BIT5_LONG_CUSTOMTEXT:
	LDA.b #$1<<5 : BRA CMDRAW_CHECK_BIT_LONG_CUSTOMTEXT

CMDRAW_TOGGLE_BIT4_LONG_CUSTOMTEXT:
	LDA.b #$1<<4 : BRA CMDRAW_CHECK_BIT_LONG_CUSTOMTEXT

CMDRAW_TOGGLE_BIT3_LONG_CUSTOMTEXT:
	LDA.b #$1<<3 : BRA CMDRAW_CHECK_BIT_LONG_CUSTOMTEXT

CMDRAW_TOGGLE_BIT2_LONG_CUSTOMTEXT:
	LDA.b #$1<<2 : BRA CMDRAW_CHECK_BIT_LONG_CUSTOMTEXT

CMDRAW_TOGGLE_BIT1_LONG_CUSTOMTEXT:
	LDA.b #$1<<1 : BRA CMDRAW_CHECK_BIT_LONG_CUSTOMTEXT

CMDRAW_TOGGLE_BIT0_LONG_CUSTOMTEXT:
	LDA.b #$1<<0 : BRA CMDRAW_CHECK_BIT_LONG_CUSTOMTEXT

;===================================================================================================
; TODO ?
CMDRAW_TOGGLE_ROOMFLAG:
	LDA.b [SA1IRAM.cm_current_draw],Y
	ASL
	TAY

	PHX

	LDA.w SA1RAM.loadroomid : ASL : TAX
	LDA.l $7EF000,X

	PLX

	AND.w .bits,Y : PHP

	LDA.w #'0'

	PLP : BEQ ++

	LDA.w #'1'

++	JSL CMDRAW_1_CHARACTER
	RTS

.bits
	dw 1<<0
	dw 1<<1
	dw 1<<2
	dw 1<<3
	dw 1<<4
	dw 1<<5
	dw 1<<6
	dw 1<<7
	dw 1<<8
	dw 1<<9
	dw 1<<10
	dw 1<<11
	dw 1<<12
	dw 1<<13
	dw 1<<14
	dw 1<<15

;===================================================================================================

CMDRAW_NUMFIELD_LONG_2DIGITS: ; so bombs and arrows align better
	DEX
	DEX

CMDRAW_NUMFIELD_LONG:
CMDRAW_NUMFIELD_LONG_FUNC:
	JSR CMDRAW_SAVE_ADDRESS_LONG
	BRA .continue

#CMDRAW_NUMFIELD:
#CMDRAW_NUMFIELD_FUNC:
	JSR CMDRAW_SAVE_ADDRESS_00

.continue
	LDA.b [SA1IRAM.cm_writer]
	JSR CMDRAW_HEX_TO_DEC

CMDRAW_NUMBER_DEC:
	REP #$20

	; first check the 100s place
	LDA.b SA1IRAM.cm_writer+3
	AND.w #$00FF
	BNE .hundo

	LDA.w #$002F

.hundo
	ORA.b SA1IRAM.cm_draw_color

	STA.w SA1RAM.MENU,X
	INX
	INX

	LDA.b SA1IRAM.cm_writer+0 ; check for 10s
	LSR

	LDA.b SA1IRAM.cm_writer+2
	AND.w #$00FF
	BCS .tens

	LDA.w #$002F

.tens
	ORA.b SA1IRAM.cm_draw_color

	STA.w SA1RAM.MENU,X
	INX
	INX

	LDA.b SA1IRAM.cm_writer+1
	AND.w #$00FF
	ORA.b SA1IRAM.cm_draw_color

	STA.w SA1RAM.MENU,X
	INX
	INX

	RTS

;===================================================================================================

CMDRAW_NUMFIELD_LONG_HEX:
CMDRAW_NUMFIELD_LONG_FUNC_HEX:
	JSR CMDRAW_SAVE_ADDRESS_LONG
	BRA .continue

#CMDRAW_NUMFIELD_HEX:
#CMDRAW_NUMFIELD_FUNC_HEX:
#CMDRAW_NUMFIELD_PRESSFUNC_HEX:
	JSR CMDRAW_SAVE_ADDRESS_00

.continue
	LDA.b [SA1IRAM.cm_writer]
	JSL CMDRAW_HEX_2_DIGITS
	RTS

;===================================================================================================

CMDRAW_HEX_TO_DEC:
	PHX
	REP #$20

	AND.w #$00FF
	ASL
	TAX

	LDA.l hex_to_dec_fast_table,X

	CMP.w #$0010 ; compare 10s
	AND.w #$0F0F ; now get the 100s and 1s

	SEP #$20
	ROL.b SA1IRAM.cm_writer+0 ; put carry in bit 0 for 10s place

	STA.b SA1IRAM.cm_writer+1

	LDA.l hex_to_dec_fast_table,X
	LSR
	LSR
	LSR
	LSR
	STA.b SA1IRAM.cm_writer+2

	XBA
	STA.b SA1IRAM.cm_writer+3

	PLX
	RTS

;===================================================================================================

CMDRAW_NUMFIELD_DEC_FROM_FUNC:
	PHB
	PHK
	PLB
	REP #$30
	PHA
	PHY

	SEP #$20

	JSR CMDRAW_HEX_TO_DEC
	JSR CMDRAW_NUMBER_DEC

	REP #$30
	PLY
	PLA
	PLB
	RTL

;===================================================================================================

CMDRAW_CTRL_SHORTCUT_FINAL:
	JSR CMDRAW_SAVE_ADDRESS_LONG
	BRA .continue

#CMDRAW_CTRL_SHORTCUT:
	JSR CMDRAW_SAVE_ADDRESS_00

.continue
	REP #$30
	LDY.w #$0070
	LDA.b [SA1IRAM.cm_writer]

	SEP #$20
	LSR #4; get AXLR near the others
	REP #$20
	XBA
	STA.b SA1IRAM.cm_writer

	LDA.w #12
	STA.b SA1IRAM.preset_scratch+2

.next_button
	LSR.b SA1IRAM.cm_writer
	BCC .nopress

	TYA
	ORA.b SA1IRAM.cm_draw_color
	STA.w SA1RAM.MENU,X
	INX
	INX

.nopress
	INY
	CPY.w #$007C
	BCC .next_button

	RTS

;===================================================================================================

CMDRAW_NUMFIELD_FUNC_PRGTEXT:
	JSR CMDRAW_SAVE_ADDRESS_00
	LDY.w #9
	BRA CMDRAW_PRGTEXT

CMDRAW_NUMFIELD_LONG_FUNC_PRGTEXT:
	JSR CMDRAW_SAVE_ADDRESS_LONG
	LDY.w #10
	BRA CMDRAW_PRGTEXT

CMDRAW_CHOICE_PRGTEXT:
CMDRAW_CHOICE_FUNC_PRGTEXT:
	JSR CMDRAW_SAVE_ADDRESS_00
	LDY.w #4
	BRA CMDRAW_PRGTEXT

CMDRAW_CHOICE_LONG_PRGTEXT:
CMDRAW_CHOICE_LONG_FUNC_PRGTEXT:
	JSR CMDRAW_SAVE_ADDRESS_LONG
	LDY.w #5

CMDRAW_PRGTEXT:
	LDA.b [SA1IRAM.cm_writer] ; get value at address
	PHA ; save value

	JSR CMDRAW_SAVE_ADDRESS_LONG

	PLA ; recover it

	PHK
	PEA.w .return-1

	SEP #$20
	JML.w [SA1IRAM.cm_writer]

.return
	RTS

;===================================================================================================

; All of these just empty the rest of the row
CMDRAW_HEADER:
CMDRAW_LABEL:
CMDRAW_PRESET_UW:
CMDRAW_PRESET_OW:
CMDRAW_SUBMENU:
CMDRAW_SUBMENU_VARIABLE:
CMDRAW_FUNC:
CMDRAW_FUNC_FILTERED:
	RTS

;===================================================================================================

CMDRAW_CHOICE:
CMDRAW_CHOICE_FUNC:
	JSR CMDRAW_SAVE_ADDRESS_00
	BRA .continue

.bad
	JSL CMDRAW_ERROR
	RTS

#CMDRAW_CHOICE_LONG:
#CMDRAW_CHOICE_LONG_FUNC:
#CMDRAW_CHOICE_LONG_FUNC_FILTERED:
	JSR CMDRAW_SAVE_ADDRESS_LONG

.continue
	LDA.b [SA1IRAM.cm_writer]
	CMP.b [SA1IRAM.cm_current_draw],Y
	BEQ .fine
	BCS .bad

.fine
	PHA
	INY
	JSR CMDRAW_SAVE_ADDRESS_LONG

	PLA
	ASL
	TAY

	REP #$20
	LDA.b [SA1IRAM.cm_writer],Y

	JMP CMDRAW_WORD_LONG
