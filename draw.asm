org $238000
draw_counters:
  %a16()
    LDA !ram_counters_toggle : BEQ .end

  PHX
    ; Segment counter
    LDA !lowram_seg_minutes : LDX #!POS_RT_SEG : JSL hex_to_dec : JSL draw3_white
    LDA !lowram_seg_seconds : JSL hex_to_dec : JSL draw2_yellow
    LDA !lowram_seg_frames : JSL hex_to_dec : JSL draw2_gray

    ; Real-time counter
    LDA !lowram_room_realtime_copy : LDX #!POS_RT_ROOM : JSL draw_seconds_and_frames

    ; Lag counter
    LDA !lowram_room_realtime_copy : SEC : SBC !lowram_room_gametime_copy
    LDX #!POS_LAG : JSL hex_to_dec : JSL draw3_white
  PLX

  .end
    RTL

draw_seconds_and_frames:
    STA $4204 : SEP #$20
    LDA #60 : STA $4206
    PHA : PLA : PHA : PLA : REP #$20
    LDA $4214 : STA !lowram_draw_tmp : LDA $4216 : STA !lowram_draw_tmp2
    LDA !lowram_draw_tmp : JSL hex_to_dec : JSL draw3_white
    LDA !lowram_draw_tmp2 : JSL hex_to_dec : JSL draw2_yellow
    RTL

draw_coordinates:
    ; x coordinate
    TXA : JSL hex_to_dec : LDX !lowram_draw_tmp
    LDA !ram_hex2dec_first_digit : ORA #$3C90 : STA $7EC700,x
    LDA !ram_hex2dec_second_digit : ORA #$3C90 : STA $7EC702,x
    LDA !ram_hex2dec_third_digit : ORA #$3C90 : STA $7EC704,x

    ; y coordinate
    TYA : JSL hex_to_dec : LDX !lowram_draw_tmp
    LDA !ram_hex2dec_first_digit : ORA #$3490 : STA $7EC706,x
    LDA !ram_hex2dec_second_digit : ORA #$3490 : STA $7EC708,x
    LDA !ram_hex2dec_third_digit : ORA #$3490 : STA $7EC70A,x
    RTL

draw3_white:
    ; Clear leading 0's
    LDA #$207F : STA $7EC700,x
    LDA #$207F : STA $7EC702,x

    LDA !ram_hex2dec_first_digit : BEQ .check_second_digit
    ORA #$3C90 : STA $7EC700,x : JMP .draw_second_digit

  .check_second_digit
    LDA !ram_hex2dec_second_digit : BEQ .draw_third_digit

  .draw_second_digit
    LDA !ram_hex2dec_second_digit : ORA #$3C90 : STA $7EC702,x

  .draw_third_digit
    LDA !ram_hex2dec_third_digit : ORA #$3C90 : STA $7EC704,x
    RTL


draw2_white:
    LDA !ram_hex2dec_second_digit : ORA #$3C90 : STA $7EC700,x
    LDA !ram_hex2dec_third_digit : ORA #$3C90 : STA $7EC702,x
    RTL

draw2_yellow:
    LDA !ram_hex2dec_second_digit : ORA #$3490 : STA $7EC706,x
    LDA !ram_hex2dec_third_digit : ORA #$3490 : STA $7EC708,x
    RTL

draw2_gray:
    LDA !ram_hex2dec_second_digit : ORA #$2090 : STA $7EC70A,x
    LDA !ram_hex2dec_third_digit : ORA #$2090 : STA $7EC70C,x
    RTL

hex_to_dec:
    ; Enters A=16
    ; Leaves A=16 \todo please fix this code
    STA $4204 : SEP #$20
    LDA #$64 : STA $4206
    PHA : PLA : PHA : PLA : REP #$20
    LDA $4214 : STA !ram_hex2dec_tmp
    LDA $4216 : STA $4204 : SEP #$20
    LDA #$0A : STA $4206
    PHA : PLA : PHA : PLA : REP #$20
    LDA $4214 : STA !ram_hex2dec_second_digit
    LDA $4216 : STA !ram_hex2dec_third_digit
    LDA !ram_hex2dec_tmp : STA $4204 : SEP #$20
    LDA #$0A : STA $4206
    PHA : PLA : PHA : PLA : REP #$20
    LDA $4214 : STA !ram_hex2dec_tmp
    LDA $4216 : STA !ram_hex2dec_first_digit
    RTL
