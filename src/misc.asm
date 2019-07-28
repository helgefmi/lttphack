; -----------------
; Ganon transition
; -----------------
org $02B793
    JML triforce_transition

;------------------
; Drop luck check
;------------------
org $06F99E
    JML dropluck ; can't JSL because we need an unbalanced PHA
  afterdropluck:

;------------------
org $1CF640
    JSL swordbeams

org !ORG
triforce_transition:
    LDA !ram_skip_triforce_toggle : BNE .skip_triforce
    JSL $02A0BE ; Dungeon_SaveRoomData_justKeys
    JML $02B797

  .skip_triforce
    JML $02B7A1

dropluck:
    PHA ; overwrote PHA : LDY addr, so LEAVE UNBALANCED

    ; use this value when it isn't 0 or "random"
    ; use vanilla value when this is 0 so that it can be used
    ; by people who want to test fairy stuff I guess
    LDA !ram_drop_rng : BEQ .vanilla
    TAY : JML afterdropluck ; was hoping this coulda been simpler
    JML afterdropluck        ; but luck needs to be in Y

  .vanilla
    LDY $0CF9
    JML afterdropluck

swordbeams:
    LDY !disable_beams : BNE .nobeams
    JML $099D04 ; one less RTL

  .nobeams
    SEC ; indicates failed to add an ancilla
    RTL
