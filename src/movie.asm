; This is just for testing/fun. It's not used in the hack.
; Remember: Comment out NOP to enable controller 2

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

    LDA $00 : STA $F2 : TAY

    EOR $FA : AND $F2 : STA $F6 : STY $FA

    LDA $01 : STA $F0 : TAY
    EOR $F8 : AND $F0 : STA $F4 : STY $F8

    ; For convenience, so that we can access the full ctrl1 as 16bit.
    LDA $F0 : STA !ram_ctrl1
    LDA $F2 : STA !ram_ctrl1+1
    LDA $F4 : STA !ram_ctrl1_filtered
    LDA $F6 : STA !ram_ctrl1_filtered+1

    ; Choose nothing, record or playback, based on !ram_movie_mode.
    LDA !ram_movie_mode : BEQ .done
    CMP #$01 : BEQ .record

    JSR movie_playback
    BRA .done

  .record
    JSR movie_record

  .done
  %ai8()
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
    LDA !ram_movie_index : TAX

    LDA !ram_movie_timer : STA !ram_movie, X
    LDA !ram_prev_ctrl : STA !ram_movie+2, X

    TXA : INC #4 : STA !ram_movie_index
    LDA !ram_ctrl1 : STA !ram_prev_ctrl
    LDA #$0000 : STA !ram_movie_timer

    RTS


movie_playback:
  %ai16()
    LDA !ram_movie_index : TAX
    LDA !ram_movie, X : CMP #$FFFF : BEQ .stop_playback

    LDA !ram_movie+2, X : XBA : STA $00

    LDA !ram_movie, X : DEC : STA !ram_movie, X : BMI .nextInput
    BRA .done

  .nextInput
    TXA : INC #4 : STA !ram_movie_index

  .done
  %ai8()
    LDA $00 : STA $F2 : TAY

    EOR $FA : AND $F2 : STA $F6 : STY $FA

    LDA $01 : STA $F0 : TAY
    EOR $F8 : AND $F0 : STA $F4 : STY $F8

    RTS

  .stop_playback
    LDA #$0000 : STA !ram_movie_mode
    RTS


movie_rng:
    LDA !ram_movie_mode : BEQ .vanillaRng
    CMP #$01 : BEQ .recording

  %ai16()
    LDA !ram_movie_rng_index : TAX
    INC : STA !ram_movie_rng_index

  %a8()
    LDA !ram_movie_rng, X
    RTL

  .recording
  %ai16()
    LDA !ram_movie_rng_index : TAX
    INC : STA !ram_movie_rng_index

  %a8()
    JSR .RandomNum
    STA !ram_movie_rng, X
    RTL

  .vanillaRng
    JSR .RandomNum
    RTL

  .RandomNum
    LDA $2137
    LDA $213C : ADC $1A : ADC $0FA1 : STA $0FA1
    RTS


movie_preset_loaded:
    ; Enter AI=16
    WDM
  PHP
    LDA !ram_movie_mode : CMP #$0001 : BNE .notRecording

    LDA !ram_movie_index : TAX
    LDA #$FFFF : STA !ram_movie, X

  .notRecording

    LDA #$0000
    STA !ram_movie_index
    STA !ram_movie_rng_index
    STA !ram_prev_ctrl
    LDA #$FFFF : STA !ram_movie_timer

    LDA !ram_movie_next_mode : STA !ram_movie_mode
    LDA #$0000 : STA !ram_movie_next_mode

    LDA !ram_movie_mode : CMP #$0001 : BEQ .recording
    BRA .playback

  .recording
    %a8() : LDA $1A : STA !ram_movie_framecounter : %a16()
    BRA .done

  .playback
    %a8() : LDA !ram_movie_framecounter : STA $1A : %a16()

    LDA !ram_movie : CMP #$FFFF : BNE .done
    LDA #$0004 : STA !ram_movie_index
    BRA .done

  .done
  PLP
    RTL
