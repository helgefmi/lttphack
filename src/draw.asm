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

    INX : INX : INX : INX
    LDA !lowram_room_realtime_copy : SEC : SBC !lowram_room_gametime_copy
    JSL hex_to_dec : JSL draw3_white
    TXA : CLC : ADC #$003C : TAX

  .do_idle
    LDA !ram_counters_idle : BEQ .do_segment

    INX : INX : INX : INX
    LDA !lowram_idle_frames_copy : JSL hex_to_dec : JSL draw3_white
    TXA : CLC : ADC #$003C : TAX

  .do_segment
    LDA !ram_counters_segment : BEQ .done

    DEX : DEX : DEX : DEX
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
    AND #$000F : ORA #$3C10 : STA $7EC704,x
    TYA : LSR #4 : AND #$000F : ORA #$3C10 : STA $7EC702,x
    TYA : LSR #8 : AND #$000F : ORA #$3C10 : STA $7EC700,x
  PLY

    ; y coordinate
    TYA : AND #$000F : ORA #$3410 : STA $7EC70A,x
    TYA : LSR #4 : AND #$000F : ORA #$3410 : STA $7EC708,x
    TYA : LSR #8 : AND #$000F : ORA #$3410 : STA $7EC706,x
    RTL


draw_coordinates_2:
    ; x coordinate
  PHY
    TXA : TAY
    LDX !lowram_draw_tmp
    AND #$000F : ORA #$3C10 : STA $7EC706,x
    TYA : LSR #4 : AND #$000F : ORA #$3C10 : STA $7EC704,x
  PLY

    ; y coordinate
    TYA : AND #$000F : ORA #$3410 : STA $7EC70A,x
    TYA : LSR #4 : AND #$000F : ORA #$3410 : STA $7EC708,x
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


draw3_white_aligned_left:
    ; Clear "leading" 0's
    LDA #$207F : STA $7EC702,x
    LDA #$207F : STA $7EC704,x

    LDA !ram_hex2dec_first_digit : BEQ .draw_second_digit
    ORA #$3C90 : STA $7EC700,x
    INX : INX

  .draw_second_digit
    LDA !ram_hex2dec_second_digit : ORA #$3C90 : STA $7EC700,x
    INX : INX

  .draw_third_digit
    LDA !ram_hex2dec_third_digit : ORA #$3C90 : STA $7EC700,x
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
    ; Leaves A=16
    STA $4204

  %a8()
    LDA #$64 : STA $4206
    %wait_14_cycles()
  %a16()

    LDA $4214 : STA !ram_hex2dec_tmp
    LDA $4216 : STA $4204

  %a8()
    LDA #$0A : STA $4206
    %wait_14_cycles()
  %a16()

    LDA $4214 : STA !ram_hex2dec_second_digit
    LDA $4216 : STA !ram_hex2dec_third_digit
    LDA !ram_hex2dec_tmp : STA $4204

  %a8()
    LDA #$0A : STA $4206
    %wait_14_cycles()
  %a16()

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
