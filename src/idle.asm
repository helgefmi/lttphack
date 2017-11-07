org $0EFB90
    ; 0efb90 lda $00f4
    ; 0efb93 ora $00f6
    ; 0efb96 and #$c0
    ; 0efb98 beq $fba6
    JSL idle_waitkey
    NOP : NOP


org $0efbbb
    ; 0efbbb lda $f4
    ; 0efbbd ora $f6
    JSL idle_endmessage


org $28B000
idle_waitkey:
    LDA $00F4
    ORA $00F6
    AND #$C0
    BNE .pressed_key

  %a16()
    INC !lowram_idle_frames
  %a8()

  .pressed_key
    AND #$C0
    RTL

idle_endmessage:
    LDA $00F4
    ORA $00F6
    BNE .pressed_key

  %a16()
    INC !lowram_idle_frames
  %a8()

  .pressed_key
    ORA $00F6
    RTL
