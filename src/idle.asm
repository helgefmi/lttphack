; Waitkey
org $0EFB90
    ; 0efb90 lda $00f4
    ; 0efb93 ora $00f6
    ; 0efb96 and #$c0
    ; 0efb98 beq $fba6
    JSL idle_waitkey
    NOP : NOP


; EndMessage
org $0efbbb
    ; 0efbbb lda $f4
    ; 0efbbd ora $f6
    JSL idle_endmessage

; MenuActive
org $0DDF1E
    ; 0ddf1e lda $f4
    ; 0ddf20 and #$10
    JSL idle_menu


; BottleMenu
org $0DE0E2
    ; 0de0e2 lda $f4
    ; 0de0e4 and #$10
    JSL idle_menu

org !ORG

idle_waitkey:
    LDA $00F4 : ORA $00F6 : AND #$C0 : BNE .pressed_key

  %a16()
    INC !lowram_idle_frames
  %a8()

  .pressed_key
    AND #$C0
    RTL

idle_endmessage:
    LDA $00F4 : ORA $00F6 : BNE .pressed_key

  %a16()
    INC !lowram_idle_frames
  %a8()

  .pressed_key
    ORA $00F6
    RTL


idle_menu:
    LDA $F4 : BNE .pressed_key

  %a16()
    INC !lowram_idle_frames
  %a8()

  .pressed_key
    AND #$10
    RTL
