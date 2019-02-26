; This is just for testing/fun. It's not used in the hack.
; Remember: Comment out NOP to enable controller 2

; movieformat
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

    LDA $00 : STA $F2 : TAY

    EOR $FA : AND $F2 : STA $F6 : STY $FA

    LDA $01 : STA $F0 : TAY
    EOR $F8 : AND $F0 : STA $F4 : STY $F8

    ; For convenience, so that we can access the full ctrl1 as 16bit.
    LDA $F0 : STA !ram_ctrl1
    LDA $F2 : STA !ram_ctrl1+1
    LDA $F4 : STA !ram_ctrl1_filtered
    LDA $F6 : STA !ram_ctrl1_filtered+1

    ; Skip recording/playing back input when presets are being loaded
    LDA !ram_preset_type : BNE .done

    ; Choose nothing, record or playback, based on !ram_movie_mode.
    LDA !ram_movie_mode : BEQ .done
    CMP #$01 : BEQ .record

    JSR movie_playback
    RTL

  .record
    JSR movie_record
  %ai8()
    RTL

  .done
    RTL


movie_record:
  %ai16()
    LDA !ram_movie_index : CMP #$1F00 : BCS .too_big

    LDA !ram_ctrl1 : CMP !ram_prev_ctrl : BEQ .inc

    JSR .save_input
    BRA .done

  .inc
    LDA !ram_movie_timer : INC : STA !ram_movie_timer

  .done
    RTS

  .too_big
    JSR .save_input
    LDA !ram_movie_index : TAX
    LDA #$FFFF : STA !ram_movie, X
    LDA #$0000 : STA !ram_movie_mode
    RTS

  .save_input
  %ai16()
    LDA !ram_movie_index : TAX

    LDA !ram_movie_timer : CMP #$0008 : BCS .3_bytes
    XBA : ORA !ram_prev_ctrl : STA !ram_movie, X
    TXA : INC #2
    BRA .saved

  .3_bytes
    STA !ram_movie+2, X
    LDA !ram_prev_ctrl : ORA #$0800 : STA !ram_movie, X
    TXA : INC #3

  .saved
    STA !ram_movie_index
    LDA !ram_ctrl1 : STA !ram_prev_ctrl
    LDA #$0000 : STA !ram_movie_timer

    RTS


movie_playback:
  %ai16()
    LDA #$0001 : STA !ram_movie_replay_started

    LDA !ram_movie_index : TAX
    LDA !ram_movie, X : CMP #$FFFF : BEQ .stop_playback

  %a8()
    LDA !ram_movie, X : STA $01
    LDA !ram_movie+1, X : AND #$F0 : STA $00

    LDA !ram_movie+1, X : AND #$0F : CMP #$08 : BCS .3_bytes
    LDA !ram_movie+1, X : AND #$0F : BEQ .inc_2
    DEC : ORA $00 : STA !ram_movie+1, X
    BRA .done

  .3_bytes
    LDA !ram_movie+2, X : BEQ .inc_3
    DEC : STA !ram_movie+2, X
    BRA .done

  .inc_3
    %a16()
    TXA : INC #1 : TAX
  .inc_2
    %a16()
    TXA : INC #2 : STA !ram_movie_index

  .done
  %ai8()

    LDA $00 : STA $F2 : TAY

    EOR $FA : AND $F2 : STA $F6 : STY $FA

    LDA $01 : STA $F0 : TAY
    EOR $F8 : AND $F0 : STA $F4 : STY $F8

    RTS

  .stop_playback
    %ai8()
    LDA #$00 : STA !ram_movie_mode
    RTS


movie_preset_loaded:
    ; A=8
    ; We want to start a new recording on preset load, except when we're playing back.
    LDA !ram_movie_mode : CMP #$02 : BNE .start_recording

    ; Check if we're in the middle of a recording or not
    LDA !ram_movie_replay_started : BNE .start_recording

    RTL

  .start_recording
  %a16()
    JSR movie_clear
    LDA #$0001 : STA !ram_movie_mode
  %a8()
    RTL


movie_start_replay:
    ; A=8
  %ai16()
    JSR movie_record_save_input

    ; Set the end of the movie
    LDA !ram_movie_index : TAX
    LDA #$FFFF : STA !ram_movie, X

    ; Clear RAM for playback
    JSR movie_clear
    LDA #$0002 : STA !ram_movie_mode
  %ai8()
    RTL


movie_clear:
    LDA #$0000
    STA !ram_movie_index
    STA !ram_movie_timer
    STA !ram_movie_rng_index
    STA !ram_prev_ctrl
    STA !ram_movie_replay_started
    RTS


movie_rng:
    LDA !ram_movie_mode : BEQ .normal
    CMP #$01 : BEQ .recording

  %ai16()
    LDX #$0000
    LDA !ram_movie_rng_index : TAX
    INC : STA !ram_movie_rng_index

  %a8()
    LDA !ram_movie_rng, X
    RTL

  .recording
  %ai16()
    LDX #$0000
    LDA !ram_movie_rng_index : TAX
    INC : STA !ram_movie_rng_index

  %a8()
    JSR .get_number
    STA !ram_movie_rng, X
    RTL

  .normal
    JSR .get_number
    RTL

  .get_number
    LDA $2137
    LDA $213C : ADC $1A : ADC $0FA1 : STA $0FA1
    RTS
