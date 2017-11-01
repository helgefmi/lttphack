; NMI
;
; Expands the NMI (code run at the end of each frame)

; Hook 1
org $0080CC
    ; 0080cc pha
    ; 0080cd phx
    ; 0080ce phy
    ; 0080cf phd
    ; 0080d0 phb
    ; 0080d1 lda #$0000 <-- we'll jump back here
    JMP nmi_hook


; NMI HOOK
org $0089C2
nmi_hook:
    PHA : PHX : PHY : PHD : PHB

    JSL nmi_expand
  %ai16()
    JMP $80D1


org $228000
nmi_expand:
   ; Enters AI=16

  %a8()
    LDA !ram_feature_music : CMP !lowram_last_feature_music : BEQ .no_music_change
    STA !lowram_last_feature_music

    CMP #$00 : BNE .dont_mute_music
    LDA #$F1 : STA $012C
    LDa #$05 : STA $012D

  .no_music_change
    CMP #$00 : BNE .dont_mute_music
    STZ $012C : STZ $012D

  .dont_mute_music
    LDA !lowram_last_frame_did_saveload : BNE .dont_update_counters

    JSR nmi_do_update_counters

  .dont_update_counters
  %a8()
    STZ !lowram_last_frame_did_saveload
    RTL


nmi_do_update_counters:
  %a16()
    INC !lowram_room_realtime
    INC !lowram_seg_frames

    ; Check if frames == 60
    LDA !lowram_seg_frames : CMP.w #60 : BNE .end

    ; If so, reset frames and +1 secs
    STZ !lowram_seg_frames : INC !lowram_seg_seconds

    ; Check if secs == 60
    LDA !lowram_seg_seconds : CMP.w #60 : BNE .end

    ; If so, reset secs and +1 mins.
    STZ !lowram_seg_seconds : INC !lowram_seg_minutes

  .end
    RTS
