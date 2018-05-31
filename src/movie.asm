; This is just for testing/fun. It's not used in the hack.
; Remember: Comment out NOP to enable controller 2

!ram_movie_index = $772000
!ram_movie_timer = $772002
!ram_prev_ctrl = $772004
!ram_movie = $772010

; movieformat
; BYST udlr | AXLR Pnnn | NNNN NNNN


;org $0083F8
;    JSL record
;    RTS

;org $0083D1
;    JSL playback
;    NOP : NOP : NOP
;    NOP : NOP : NOP
;    NOP : NOP : NOP


org $298000
record:
    LDA $F0 : STA !ram_ctrl1
    LDA $F2 : STA !ram_ctrl1+1
  %ai16()
    LDA !ram_ctrl1 : CMP !ram_prev_ctrl : BEQ .inc

    JSR save_input

    BRA .done

  .inc
    LDA !ram_movie_timer : INC : STA !ram_movie_timer

  .done
  %ai8()
    RTL

save_input:
    LDA !ram_movie_index : TAX

    LDA !ram_movie_timer : CMP #$0008 : BCS .3_bytes

    ORA !ram_prev_ctrl : STA !ram_movie, X
    TXA : INC #2
    BRA .saved

  .3_bytes
    STA !ram_movie+2, X
    LDA !ram_prev_ctrl : ORA #$0008 : STA !ram_movie, X
    TXA : INC #3

  .saved
    STA !ram_movie_index
    LDA !ram_ctrl1 : STA !ram_prev_ctrl
    LDA #$0000 : STA !ram_movie_timer

    RTS


playback:
  %ai16()
    LDA !ram_movie_index : TAX

  %a8()
    LDA !ram_movie, X : STA $01
    LDA !ram_movie+1, X : AND #$80 : STA $00

    LDA !ram_movie+1, X : AND #$08 : CMP #$08 : BCS .3_bytes
    BEQ .inc_2
    DEC : ORA $00 : STA !ram_movie+1
    BRA .done

  .3_bytes
    LDA !ram_movie+2 : BEQ .inc_3
    DEC : STA !ram_movie+2
    BRA .done

  .inc_3
    TXA : INC #1 : TAX
  .inc_2
    TXA : INC #2 : STA !ram_movie_index

  .done
  %ai8()
    RTL
