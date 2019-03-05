; compact movieformat
; BYST udlr | AXLR Pnnn | NNNN NNNN


; Hooking NMI_ReadJoypads
org $0083D1
	JSL movie_readjoypads
	RTS


org !RandomNumGen
    PHX : PHP
    JSL movie_rng
    PLP : PLX
    RTL


org !ORG
movie_readjoypads:
    STZ $4016

    LDA $4218 : STA $00
    LDA $4219 : STA $01

    LDA !ram_movie_next_mode : BNE .done

    LDA !ram_movie_mode
    CMP #$01 : BEQ .recording
    CMP #$02 : BEQ .playback

    JSR .set_controller
    BRA .done

  .recording
    JSR .set_controller
    JSR movie_record
    RTL

  .playback
    JSR movie_playback
    JSR .set_controller

  .done
    RTL

  .set_controller
    LDA $00 : STA $F2 : TAY

    EOR $FA : AND $F2 : STA $F6 : STY $FA

    LDA $01 : STA $F0 : TAY
    EOR $F8 : AND $F0 : STA $F4 : STY $F8

    LDA $F0 : STA !ram_ctrl1
    LDA $F2 : STA !ram_ctrl1+1
    LDA $F4 : STA !ram_ctrl1_filtered
    LDA $F6 : STA !ram_ctrl1_filtered+1

    RTS


movie_record:
  %ai16()
    LDX !ram_movie_index : CPX !ram_movie_rng_index : BCS .too_big

    LDA !ram_ctrl1 : CMP !ram_prev_ctrl : BNE .save_input

    INC !ram_movie_timer
  %ai8()
    RTS

  .too_big
    STX !ram_movie_length
    LDA #$0000 : STA !ram_movie_mode
  %ai8()
    RTS

  .save_input
    LDA !ram_movie_timer : STA !ram_movie, X
    LDA !ram_prev_ctrl : STA !ram_movie+2, X

    INX #4 : STX !ram_movie_index
    LDA !ram_ctrl1 : STA !ram_prev_ctrl
    STZ !ram_movie_timer

  %ai8()
    RTS


movie_playback:
  %ai16()
    LDX !ram_movie_index : CPX !ram_movie_length : BCS .stop_playback

    LDA !ram_movie+2, X : XBA : STA $00
    DEC !ram_movie_timer : BMI .nextInput
  %ai8()
    RTS

  .nextInput
    INX #4 : STX !ram_movie_index
    LDA !ram_movie, X : STA !ram_movie_timer
  %ai8()
    RTS

  .stop_playback
    LDA #$0000 : STA !ram_movie_mode
    STZ $00
  %ai8()
    RTS


movie_rng:
    LDA !ram_movie_mode : BEQ .RandomNum
    CMP #$01 : BEQ .recording

  %ai16()
    LDX !ram_movie_rng_index
    DEC !ram_movie_rng_index
    LDA !ram_movie, X
    RTL

  .recording
  %ai16()
    LDX !ram_movie_rng_index
    DEC !ram_movie_rng_index

  %a8()
    JSL .RandomNum : STA !ram_movie, X
    RTL

  .RandomNum
    LDA $2137
    LDA $213C : ADC $1A : ADC $0FA1 : STA $0FA1
    RTL


movie_preset_loaded:
    ; Enter AI=16
    WDM
  PHP
    LDA !ram_movie_mode : CMP #$0001 : BNE .notRecording

    LDA !ram_movie_index : STA !ram_movie_length

  .notRecording

    LDA #$0000 : STA !ram_movie_index : STA !ram_prev_ctrl
    LDA #$5D00 : STA !ram_movie_rng_index
    LDA #$FFFF : STA !ram_movie_timer

    LDA !ram_movie_next_mode : STA !ram_movie_mode
    LDA #$0000 : STA !ram_movie_next_mode

    LDA !ram_movie_mode : CMP #$0002 : BEQ .startPlayback

    %a8() : LDA $1A : STA !ram_movie_framecounter : %a16()
  PLP : RTL

  .startPlayback
    %a8() : LDA !ram_movie_framecounter : STA $1A : %a16()

    LDX #$0000
    LDA !ram_movie : CMP #$FFFF : BNE .done
    LDX #$0004 : STX !ram_movie_index

  .done
    LDA !ram_movie, X : STA !ram_movie_timer
  PLP : RTL
