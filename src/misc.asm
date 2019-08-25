pushpc
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
; Sword beams
;------------------
org $1CF640
    JSL swordbeams

;---------------------------------
; Visible guard search beams
;---------------------------------
org $05C21D
    JSL probe_draw

org $05C63D
    JSL set_probe_gfx

;---------------------------------------------
; Visible bonk prizes
;---------------------------------------------
org $06D25A
;JML absorbable_check
;absorbexit: NOP

pullpc

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
    TAY : JML afterdropluck ; was hoping this coulda been simpler but luck needs to be in Y

  .vanilla
    LDY $0CF9
    JML afterdropluck

swordbeams:
    LDY !disable_beams : BNE .nobeams
    JML $099D04 ; one less RTL

  .nobeams
    SEC ; indicates failed to add an ancilla
    RTL

; sets some oam properties for the guard search beams
set_probe_gfx:
    TXA : STA $0DE0, Y
    LDA #%00001110 ; oam : vhoopppN
    STA $0F50, Y
    RTL

; basically just the normal draw routine, except
; it's not jumping to a routine because
;  1) it'd be a decent amount of lag, so every bit of optimization counts
;  2) Character seems to be based entirely on sprite id????
;     need to be explicit to get the correct gfx (also saves some cycles)
!sparks_gfx = #$AA
!bubble_gfx = #$CB
!vortex_gfx = #$EE
probe_draw:
    LDA $01 : ORA $03 : PHP ; storing the Z flag since we'll RTL to a BEQ

    LDA !ram_probe_toggle : BEQ .skip

    LDA $00 : STA ($90), Y
    LDA $01 : CMP #$01
    LDA #$01 : ROL : STA ($92)

  %a16()
    LDA $02 : INY
    CLC : ADC #$0010 : CMP #$0100 : %a8() : BCS .skip

    SBC #$0F : STA ($90), Y
    INY
    LDA !sparks_gfx : STA ($90), Y
    INY
    LDA $05 : STA ($90), Y

  .skip
    PLP : RTL

absorbable_check:
;    LDA $0E90, X : BEQ ++
;    PLA : PLA
;++  JML absorbexit