; NMI 1
org $008225
    JMP nmi_hook

; NMI 2 (this code path is used for maiden crystal sequence)
org $0082D2
    JMP nmi_hook

; NMI HOOK
org $0089C2
nmi_hook:
    %ai16()
    JSL nmi_expand
    PLB : PLD : PLY : PLX : PLA
    RTI

org $228000
nmi_expand:
    %a8()
    LDA !lowram_last_frame_did_saveload : AND.b #$01 : BNE .no_update_counters
    JSR nmi_do_update_counters

  .no_update_counters
    STZ !lowram_last_frame_did_saveload
    %a16()
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
    %a8()
    RTS
