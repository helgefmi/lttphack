; -----
; UTILS
; -----

cm_do_minigame:
    ; Enters AI=8
    LDA $B0
    JSL !UseImplicitRegIndexedLocalJumpTable

    dw #0
    dw react_start
    dw mash_start

minigame_draw_text:
    ; Enters: A=8, I=16
    LDY #$0000

  .loop
    LDA ($02), Y : CMP #$FF : BEQ .end
    STA $1000, X : INX
    LDA #$24 : STA $1000, X : INX
    INY : JMP .loop

  .end
    RTS


; -----
; REACT
; -----

table ../resources/normal.tbl

!pos_react_1 = $0206
!pos_react_2 = $0246
!pos_react_3 = $0286

react_text_intro_1:
    db "Press any button as soon", #$FF
react_text_intro_2:
    db "as the screen flashes!", $FF

react_text_fail_1:
    db "You pressed too quickly!", #$FF
react_text_fail_2:
    db "Better luck next time.", #$FF

react_text_success_1:
    db "You reacted in ", #$FF
react_text_success_2:
    db "frames.", #$FF


react_start:
    ; Enters: AI=8
    LDA !ram_minigame_submode

    JSL !UseImplicitRegIndexedLocalJumpTable

    dw react_init
    dw react_counter
    dw react_react
    dw react_response
    dw react_quit


react_init:
    JSR cm_clear_buffer
    JSR cm_draw_background_gfx

  %i16()
    LDX #react_text_intro_1 : STX $02
    LDX #!pos_react_1 : JSR minigame_draw_text

    LDX #react_text_intro_2 : STX $02
    LDX #!pos_react_2 : JSR minigame_draw_text
  %a8()
    JSL !RandomNumGen
  %a16()
    AND.w #$FF : CLC : ADC.w #30 : STA !ram_react_counter
    LDA.w #0 : STA !ram_react_frames
  %ai8()

    LDA #1 : STA !ram_minigame_submode

    ; tell NMI to update tilemap
    LDA.b #$01 : STA $17
    LDA.b #$22 : STA $0116

    RTS


react_counter:
  %a16()
    LDA !ram_ctrl1_filtered : BEQ .decrement

  %a8()
    LDA #3 : STA !ram_minigame_submode
    BRA .done

  .decrement
  %a16()
    LDA !ram_react_counter : DEC : STA !ram_react_counter : BNE .done
  %a8()

    LDA #2 : STA !ram_minigame_submode

  %ai16()
    LDX.w #$0000
    LDY.w #$001B
    LDA.w #$38F5

  .drawBoxInterior

    STA $1144, X : STA $1184, X : STA $11C4, X : STA $1204, X
    STA $1244, X : STA $1284, X : STA $12C4, X : STA $1304, X
    STA $1344, X : STA $1384, X : STA $13C4, X : STA $1404, X
    STA $1444, X : STA $1484, X : STA $14C4, X : STA $1504, X
    STA $1544, X : STA $1584, X : STA $15C4, X : STA $1604, X
    STA $1644, X : STA $1684, X : STA $16C4, X : STA $1704, X

    INX #2

    DEY : BPL .drawBoxInterior

  %ai8()
    ; tell NMI to update tilemap
    LDA.b #$01 : STA $17
    LDA.b #$22 : STA $0116

  .done
  %a8()
    RTS


react_react:
  %a16()
    LDA !ram_react_frames : INC : STA !ram_react_frames
    LDA !ram_ctrl1_filtered : BEQ .done

  %a8()
    LDA #3 : STA !ram_minigame_submode

  .done
  %a8()
    RTS


react_response:
    JSR cm_clear_buffer
    JSR cm_draw_background_gfx

  %a16()
    LDA !ram_react_frames : BEQ .failed

  %i16()
  %a8()
    LDX #!pos_react_1 : LDY #react_text_success_1 : STY $02 : JSR minigame_draw_text
  %a16()
    LDA !ram_react_frames : JSL hex_to_dec

    LDA !ram_hex2dec_first_digit : BEQ .second_digit : ORA #$2420 : STA $1000, X
    INX : INX
  .second_digit
    LDA !ram_hex2dec_second_digit : BEQ .third_digit : ORA #$2420 : STA $1000, X
    INX : INX
  .third_digit
    LDA !ram_hex2dec_third_digit : ORA #$2420 : STA $1000, X
    INX : INX

  %a8()
    INX : INX
    LDY #react_text_success_2 : STY $02 : JSR minigame_draw_text

    BRA .done

  .failed
  %i16()
  %a8()
    LDX #react_text_fail_1 : STX $02
    LDX #!pos_react_1 : JSR minigame_draw_text

    LDX #react_text_fail_2 : STX $02
    LDX #!pos_react_2 : JSR minigame_draw_text

  .done
  %a8()
    ; tell NMI to update tilemap
    LDA.b #$01 : STA $17
    LDA.b #$22 : STA $0116

    LDA #4 : STA !ram_minigame_submode

    RTS


react_quit:
  %a16()
    LDA !ram_ctrl1_filtered : BEQ .done

  %a8()
    STZ $B0
    JSR cm_redraw

  .done
  %a8()
    RTS

; ----
; MASH
; ----

table ../resources/normal.tbl

!pos_mash_1 = $0206
!pos_mash_2 = $0246

mash_text_intro_1:
    db "Start mashing in", #$FF
mash_text_intro_2:
    db "..", $FF

mash_text_result_1:
    db "You pressed", #$FF
mash_text_result_2:
    db "buttons.", #$FF
mash_text_result_3:
    db "Resulting in a ", #$FF
mash_text_result_4:
    db "hz mash.", #$FF


mash_start:
    ; Enters: AI=8
    LDA !ram_minigame_submode

    JSL !UseImplicitRegIndexedLocalJumpTable

    dw mash_init
    dw mash_countdown
    dw mash_mash
    dw mash_response
    dw mash_quit


mash_init:
    LDA #181 ; STA !ram_mash_counter
    LDA #1 ; STA !ram_minigame_submode
    RTS


mash_countdown:
    JSR cm_clear_buffer
    JSR cm_draw_background_gfx

  %i16()
    LDX #mash_text_intro_1 : STX $02
    LDX #!pos_mash_1 : JSR minigame_draw_text

    LDX #mash_text_intro_2 : STX $02
    LDX #!pos_mash_2 : JSR minigame_draw_text

    LDA !ram_mash_counter ; DEC ; STA !ram_mash_counter

    CMP #180 ; BNE .two
    LDA #$30 ; STA $1250
  .two
    CMP #120 ; BNE .one
    LDA #$34 ; STA $1250
  .one
    CMP #60 ; BNE .zero
    LDA #$38 ; STA $1250
  .zero
    CMP #0 ; BNE .done
    LDA #180 ; STA !ram_mash_counter
    LDA #2 ; STA !ram_minigame_submode

  .done
    ; tell NMI to update tilemap
    LDA.b #$01 : STA $17
    LDA.b #$22 : STA $0116

    RTS


mash_mash:
    LDA !ram_mash_counter ; DEC ; STA !ram_mash_counter
    BNE .not_done

    LDA #3 ; STA !ram_minigame_submode
    BRA .done

  .not_done
  %a16()
    LDA !ram_ctrl1_filtered : BEQ .no_input
    LDA !ram_mash_inputs ; INC ; STA !ram_mash_inputs
  .no_input
  %a8()

  %ai16()
    LDX.w #$0000
    LDY.w #$001B
    LDA.w #$38F5

  .drawBoxInterior

    STA $1144, X : STA $1184, X : STA $11C4, X : STA $1204, X
    STA $1244, X : STA $1284, X : STA $12C4, X : STA $1304, X
    STA $1344, X : STA $1384, X : STA $13C4, X : STA $1404, X
    STA $1444, X : STA $1484, X : STA $14C4, X : STA $1504, X
    STA $1544, X : STA $1584, X : STA $15C4, X : STA $1604, X
    STA $1644, X : STA $1684, X : STA $16C4, X : STA $1704, X

    INX #2

    DEY : BPL .drawBoxInterior

  %ai8()
    ; tell NMI to update tilemap
    LDA.b #$01 : STA $17
    LDA.b #$22 : STA $0116

  .done
  %a8()
    RTS


mash_response:
    JSR cm_clear_buffer
    JSR cm_draw_background_gfx

  %i16()
    LDX #!pos_mash_1 : LDY #mash_text_result_1 : STY $02 : JSR minigame_draw_text
  %a16()
    LDA !ram_mash_inputs : JSL hex_to_dec

    LDA !ram_hex2dec_first_digit : BEQ .second_digit : ORA #$2420 : STA $1000, X
    INX : INX
  .second_digit
    LDA !ram_hex2dec_second_digit : BEQ .third_digit : ORA #$2420 : STA $1000, X
    INX : INX
  .third_digit
    LDA !ram_hex2dec_third_digit : ORA #$2420 : STA $1000, X
    INX : INX

  %a8()
    INX : INX
    LDY #mash_text_result_2 : STY $02 : JSR minigame_draw_text

    BRA .done

  .done
  %a8()
    ; tell NMI to update tilemap
    LDA.b #$01 : STA $17
    LDA.b #$22 : STA $0116

    LDA #20 ; STA !ram_mash_counter
    LDA #4 : STA !ram_minigame_submode

    RTS


mash_quit:
    LDA !ram_mash_counter ; BEQ .ready
    DEC ; STA !ram_mash_counter
    BRA .done

  .ready
  %a16()
    LDA !ram_ctrl1_filtered : BEQ .done

  %a8()
    STZ $B0
    JSR cm_redraw

  .done
  %a8()
    RTS

