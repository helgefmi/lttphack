draw_counters:
	%a16()
	PHX
	LDX #!POS_COUNTERS

	; Real time
	LDA !ram_counters_real : BEQ .do_lag

	LDA !lowram_room_realtime_copy : JSL draw_seconds_and_frames
	TXA : CLC : ADC #$0040 : TAX

.do_lag
	LDA !ram_counters_lag : BEQ .do_idle

	INX #4
	LDA !lowram_room_realtime_copy : SEC : SBC !lowram_room_gametime_copy
	JSL hex_to_dec : JSL draw3_white
	TXA : CLC : ADC #$003C : TAX

.do_idle
	LDA !ram_counters_idle : BEQ .do_segment

	INX #4
	LDA !lowram_idle_frames_copy : JSL hex_to_dec : JSL draw3_white
	TXA : CLC : ADC #$003C : TAX

.do_segment
	LDA !ram_counters_segment : BEQ .done

	DEX #4
	LDA !lowram_seg_minutes : JSL hex_to_dec : JSL draw3_white
	LDA !lowram_seg_seconds : JSL hex_to_dec : JSL draw2_yellow
	LDA !lowram_seg_frames : JSL hex_to_dec : JSL draw2_gray

.done
	PLX
	RTL


draw_seconds_and_frames:
	STA $4204

	%a8()
	LDA #60 : STA $4206
	%wait_14_cycles()
	%a16()

	LDA $4214 : STA !lowram_draw_tmp : LDA $4216 : STA !lowram_draw_tmp2
	LDA !lowram_draw_tmp : JSL hex_to_dec : JSL draw3_white
	LDA !lowram_draw_tmp2 : JSL hex_to_dec : JSL draw2_yellow
	RTL


draw_coordinates_3:
	; x coordinate
	PHY
	TXA : TAY
	LDX !lowram_draw_tmp
	AND #$000F : ORA #$3C10 : STA $7EC704, X
	TYA : LSR #4 : AND #$000F : ORA #$3C10 : STA $7EC702, X
	TYA : XBA ; swap to high byte
	AND #$000F : ORA #$3C10 : STA $7EC700, X
	PLY

	; y coordinate
	TYA : AND #$000F : ORA #$3410 : STA $7EC70A, X
	TYA : LSR #4 : AND #$000F : ORA #$3410 : STA $7EC708, X
	TYA : XBA ; swap to high byte
	AND #$000F : ORA #$3410 : STA $7EC706, X
	RTL

draw_xy_single: ; byte in A, drawn HH:LL
	TAY ; cache A
	; low byte, Y coord
	LDX !lowram_draw_tmp
	AND #$000F : ORA #$3410 : STA $7EC70A, X
	TYA : LSR #4 : AND #$000F : ORA #$3410 : STA $7EC708, X

	TYA : XBA : TAY ; get old value back, change to high byte

	; high byte, X coord
	AND #$000F : ORA #$3C10 : STA $7EC706, X
	TYA : LSR #4 : AND #$000F : ORA #$3C10 : STA $7EC704, X

	RTL

draw_coordinates_2:
	; x coordinate
	PHY
	TXA : TAY
	LDX !lowram_draw_tmp
	AND #$000F : ORA #$3C10 : STA $7EC706, X
	TYA : LSR #4 : AND #$000F : ORA #$3C10 : STA $7EC704, X
	PLY

	; y coordinate
	TYA : AND #$000F : ORA #$3410 : STA $7EC70A, X
	TYA : LSR #4 : AND #$000F : ORA #$3410 : STA $7EC708, X
	RTL


draw3_white:
	; Clear leading 0's
	LDA #$207F : STA $7EC700, X
	LDA #$207F : STA $7EC702, X

	LDA !ram_hex2dec_first_digit : BEQ .check_second_digit
	ORA #$3C10 : STA $7EC700, X : BRA .draw_second_digit

.check_second_digit
	LDA !ram_hex2dec_second_digit : BEQ .draw_third_digit

.draw_second_digit
	LDA !ram_hex2dec_second_digit : ORA #$3C10 : STA $7EC702, X

.draw_third_digit
	LDA !ram_hex2dec_third_digit : ORA #$3C10 : STA $7EC704, X
	RTL


draw3_white_aligned_left:
	; Clear "leading" 0's
	LDA #$207F : STA $7EC702, X
	LDA #$207F : STA $7EC704, X

	LDA !ram_hex2dec_first_digit : BEQ .draw_second_digit
	ORA #$3C10 : STA $7EC700, X
	INX #2

.draw_second_digit
	LDA !ram_hex2dec_second_digit : ORA #$3C10 : STA $7EC700, X
	INX #2

.draw_third_digit
	LDA !ram_hex2dec_third_digit : ORA #$3C10 : STA $7EC700, X
	RTL

draw3_white_aligned_left_lttp:
	; Clear "leading" 0's
	LDA #$207F : STA $7EC702, X
	LDA #$207F : STA $7EC704, X

	LDA !ram_hex2dec_first_digit : BEQ .draw_second_digit
	ORA #$3C90 : STA $7EC700, X
	INX #2

.draw_second_digit
	LDA !ram_hex2dec_second_digit : ORA #$3C90 : STA $7EC700, X
	INX #2

.draw_third_digit
	LDA !ram_hex2dec_third_digit : ORA #$3C90 : STA $7EC700, X
	RTL


draw2_white:
	LDA !ram_hex2dec_second_digit : ORA #$3C10 : STA $7EC700, X
	LDA !ram_hex2dec_third_digit : ORA #$3C10 : STA $7EC702, X
	RTL


draw2_white_lttp:
	LDA !ram_hex2dec_second_digit : ORA #$3C90 : STA $7EC700, X
	LDA !ram_hex2dec_third_digit : ORA #$3C90 : STA $7EC702, X
	RTL

draw2_yellow:
	LDA !ram_hex2dec_second_digit : ORA #$3410 : STA $7EC706, X
	LDA !ram_hex2dec_third_digit : ORA #$3410 : STA $7EC708, X
	RTL


draw2_gray:
	LDA !ram_hex2dec_second_digit : ORA #$2010 : STA $7EC70A, X
	LDA !ram_hex2dec_third_digit : ORA #$2010 : STA $7EC70C, X
	RTL


hex_to_dec:
	; Enters A=16
	; Leaves A=16
	STA $4204

	%a8()
	LDA #$64 : STA $4206

	; Need to wait 14 cycles
	; 13 cycles here with REP and a useless operation
	; 1 more cycle spent fetching the next opcode
	%a16() ; 3 cycles
	PEA $0000 : PLA ; Push 4 bytes to stack (5 cycles), Pull back (5 cycles)
	; Normally wouldn't have such cycle whoring
	; but hex_to_dec can cause a lot of lag

	LDA $4214 : STA !ram_hex2dec_tmp
	LDA $4216 : STA $4204

	%a8()
	LDA #$0A : STA $4206

	; Need to wait 14 cycles
	; 13 cycles here with REP and a useless operation
	; 1 more cycle spent fetching the next opcode
	%a16() ; 3 cycles
	PEA $0000 : PLA ; Push 4 bytes to stack (5 cycles), Pull back (5 cycles)

	LDA $4214 : STA !ram_hex2dec_second_digit
	LDA $4216 : STA !ram_hex2dec_third_digit
	LDA !ram_hex2dec_tmp : STA $4204

	%a8()
	LDA #$0A : STA $4206

	; Need to wait 14 cycles
	; 13 cycles here with REP and a useless operation
	; 1 more cycle spent fetching the next opcode
	%a16() ; 3 cycles
	PEA $0000 : PLA ; Push 4 bytes to stack (5 cycles), Pull back (5 cycles)

	LDA $4214 : STA !ram_hex2dec_tmp
	LDA $4216 : STA !ram_hex2dec_first_digit

	RTL


hex_to_dec_a:
	; Enters A=16
	; Leaves A=16
	JSL hex_to_dec
	LDA !ram_hex2dec_first_digit : ASL #4
	ORA !ram_hex2dec_second_digit : ASL #4
	ORA !ram_hex2dec_third_digit
	RTL

; scratch space cycle golf test
;	REP #$20 : LDA.w #0299
;	STZ !ram_hex2dec_first_digit
;	STZ !ram_hex2dec_second_digit
;	STZ !ram_hex2dec_third_digit
;	STA !HEX_BUFFER ; cache value
;
;	AND #$000F ; get low 4 bits
;	SEP #$28 ; set M=8 and Decimal flag
;	CLC ; clear carry
;	ADC #$00 ; add 0, we now have decimal digits in upper and lower nibble
;
;	AND #$0F ; get just bottom nibble for digit
;	STA !ram_hex2dec_third_digit
;
;	REP #$28 ; M=16 and Decimal off
;
;	LDA !HEX_BUFFER : CMP.w #100 : BCC ++ ; <100
;	SBC.w #100
;	INC !ram_hex2dec_first_digit
;
;	CMP.w #100 : BCC ++ ; <200
;	SBC.w #100
;	INC !ram_hex2dec_first_digit
;
;++	SEP #$21 ; 8bit mode and clear carry
;--	SBC #10 : BCC ++
;	INC !ram_hex2dec_second_digit
;	BRA --
;++	REP #$20