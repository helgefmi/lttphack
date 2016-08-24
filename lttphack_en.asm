lorom

; Unused ram used:
;
; - $7C[0x2]: Per-room real time counter
; - $7E[0x2]: Per-room game time counter
; - $80[0x1]: Copy of $10
; - $81[0x1]: Copy of $11
; - $82[0x2]: Segment real time counter (frames only, see $04E0+)
; - $8E[0x2]: Controller 1 data: (highest bit first: AXLR....BYETudlr)
; - $2B2[0x08]: Copies of timers
; - $2BA[0x06]: Copies of timers
; - $04CB[0x25] - Unused (just lotsa ram niz!)
;   * $04CB[0x1] -> set if we just save/loaded
;   * $04CC[0x2] -> hearts last frame
;   * $04D0[0x4] -> temp stuff for frames -> seconds
;   * $04D4[0x2] -> copy of $8E
;   * $04DA[0x1] -> copy of $02D8
;   * $04E0[0x2] -> Segment minutes
;   * $04E2[0x2] -> Segment seconds

incsrc defines.asm

; SRAM size
org $00FFD8
    db $08 ; 256kb


; NMI hook hijack 1
org $008225
    JMP nmi_hook_jsl

; NMI hook hijack 2 (only used on maiden crystal sequence)
org $0082D2
    JMP nmi_hook_jsl


; Game mode hijack
org $008056
    JSL gamemode_hook


; HUD template hijack
;
; Overrides the following
; $0DFA8E: E2 30  SEP #$30
; $0DFA90: E6 16  INC $16
org $0DFA8E
    JSL hud_template_hook ; 4 opcodes

; FloorIndicator quick RTL
org $0AFD0C
    SEP #$30
    RTL

; FloorIndicator.noIndicator quick RTL
org $0AFD90
    SEP #$30
    RTL

; UpdateHearts hook
org $0DFDAB
    JSL draw_hearts_hook
    RTS

; UpdateHearts removal
;
; This is called twice (once for containers, once for actual hearts),
; and since we do them both at once, we only need one call.
;
; Overriding the following:
; $0DFC06:  20 AB FD  JSR HandleHearts

org $0DFC06
    NOP : NOP : NOP


; NMI HOOK
org $0089C2
nmi_hook_jsl:
    %ai16()
    JSL nmi_hook
    PLB : PLD : PLY : PLX : PLA
    RTI


; Game Mode hook
org $1BB1E0
gamemode_hook:
    ; For convenience, so that we can access the full ctrl1 as 16bit.
    LDA $F0 : STA $8E
    LDA $F2 : STA $8F

    ; Acmlm's Save State {{{

    %ai16()
    LDA $8E : CMP #$1060 : BEQ +
    JMP b

+   %a8()
    ; store DMA to SRAM
    LDY #$0000 : LDX #$0000

-   LDA $4300, X : STA $770000, X
    INX
    INY : CPY #$000B : BNE -
    CPX #$007B : BEQ +
    INX : INX : INX : INX : INX
    LDY #$0000
    JMP -
    ; end of DMA to SRAM

  + JSR ppuoff
    LDA #$80 : STA $4310
    JSR func_dma2

    LDA #$81 : STA $4310
    LDA #$39 : STA $4311
    JMP end

  b:
    CMP #$2060 : BEQ +
    JMP transition_detection

  + %a8()
    STZ $420C
    JSR ppuoff
    STZ $4310
    JSR func_dma2

    LDX $1C : STX $212C
    LDX $1E : STX $212E
    LDX $94 : STX $2105
    LDX $96 : STX $2123
    LDX $99 : STX $2130

    INC $15
    LDA $0133 : STA $012C
    STZ $0133
    LDA $0638 : STA $211F
    LDA $0639 : STA $211F
    LDA $063A : STA $2120
    LDA $063B : STA $2120
    LDA $98 : STA $2125
    LDA $9B : STA $420C

    LDA #$01 : STA $4310
    LDA #$18 : STA $4311

  + %a8()
    JMP end

  ppuoff:
    LDA #$80 : STA $13 : STA $2100
    STZ $4200
    RTS

  func_dma1:
    LDX #$7500 : LDY #$0000 : LDA #$80 : JSR func_dma1b
    LDX #$7600 : LDY #$4000 : LDA #$80 : JSR func_dma1b
    RTS

  func_dma1b:
    STY $2116 : STZ $4312 : STX $4313 : STZ $4315 : STA $4316 : STZ $2115

    LDA $4311 : CMP #$39 : BNE +
    LDA $2139

  + LDA #$02 : STA $420B
    RTS

  func_dma2:
    PLX : STX $4318

    STZ $2181 : STZ $4312

    LDY #$0071 : LDX #$0000 : JSR func_dma2b
    INY : LDX #$0080 : JSR func_dma2b
    INY : LDX #$0100 : JSR func_dma2b
    INY : LDX #$0180 : JSR func_dma2b

    LDX $4318 : PHX

    RTS

  func_dma2b:
    STZ $4313 : STY $4314 : STX $2182
    LDA #$80 : STA $4311 : STA $4316
    LDA #$02 : STA $420B
    RTS

  end:
    JSR func_dma1

    ; load DMA from SRAM
    LDY #$0000 : LDX #$0000

    %a8()
-   LDA $770000, X : STA $4300, X
    INX
    INY : CPY #$000B : BNE -
    CPX #$007B : BEQ +
    INX : INX : INX : INX : INX
    LDY #$0000
    JMP -
    ; end of DMA from SRAM

  + LDA #$A1 : STA $4200
    LDA #$0F : STA $13 : STA $2100
    %ai8()
    LDA #$01 : STA $04CB
    RTL

    ; }}}

  transition_detection:
    ; Transition detection {{{

    %ai8()
    LDA $10 : CMP $80 : BNE .gamemode_changed
    LDA $11 : CMP $81 : BNE .submode_changed
    LDA $02D8 : CMP $04DA : BNE .new_item_received

    JMP end_of_gamemode_hook

  .new_item_received
    LDA $02D8 : STA $04DA

    JMP .only_show_counters

  .gamemode_changed
    LDA $80

    CMP #$05 : BEQ .gamemode_load_game
    CMP #$07 : BEQ .gamemode_dungeon
    CMP #$09 : BEQ .gamemode_overworld
    CMP #$0B : BEQ .gamemode_overworld ; "Special" overworld (?)
    CMP #$13 : BEQ .gamemode_victory ; LW?
    CMP #$16 : BEQ .gamemode_victory ; DW?

    JMP .end

  .gamemode_victory
    LDA $10

    ; Just killed a boss. Loading overworld.
    CMP #$08 : BEQ .show_and_reset_counters

    JMP .end

  .gamemode_load_game
    LDA $10

    ; Link in bed
    CMP #$07 : BEQ .show_and_reset_counters

    JMP .end

  .gamemode_dungeon
    LDA $10

    ; Text mode. Don't reset counters.
    CMP #$0E : BEQ .only_show_counters

    ; Dungeon -> Overworld
    CMP #$0F : BEQ .show_and_reset_counters

    ; Caught by Wall Master
    CMP #$11 : BEQ .show_and_reset_counters

    JMP .end

  .gamemode_overworld
    LDA $10

    ; OW (special) -> OW
    CMP #$09 : BEQ .show_and_reset_counters

    ; OW -> OW (special)
    CMP #$0B : BEQ .show_and_reset_counters

    ; Text mode. Don't reset counters.
    CMP #$0E : BEQ .only_show_counters

    ; Overworld -> Dungeon
    CMP #$0F : BEQ .show_and_reset_counters

    ; Fall in hole
    CMP #$11 : BEQ .show_and_reset_counters

    JMP .end

  .submode_changed
    LDA $10

    ; Dungeon
    CMP #$07 : BEQ .submode_dungeon

    ; Overworld
    CMP #$09 : BEQ .submode_overworld

    JMP .end

  .show_and_reset_counters
    ; Reset per-room counters
    %a16()
    LDA $7C : STA $2BC : STZ $7C
    LDA $7E : STA $2BE : STZ $7E

    JSL draw_counters
    JMP .end

  .only_show_counters
    %a16()
    LDA $7C : STA $2BC
    LDA $7E : STA $2BE

    JSL draw_counters
    JMP .end

  .submode_overworld
    LDA $11

    ; Normal transition
    CMP #$01 : BEQ .show_and_reset_counters

    ; Transition into Dark Woods
    CMP #$0D : BEQ .show_and_reset_counters

    ; Mirror
    CMP #$23 : BEQ .show_and_reset_counters

    ; Whirlpool
    CMP #$2E : BEQ .show_and_reset_counters

    JMP .end

  .submode_dungeon
    LDA $11

    ; Normal transition intra-room
    CMP #$01 : BEQ .show_and_reset_counters

    ; Normal transition inter-room
    CMP #$02 : BEQ .show_and_reset_counters

    ; Transition upwards
    CMP #$06 : BEQ .show_and_reset_counters

    ; Transition upwards
    CMP #$07 : BEQ .show_and_reset_counters

    ; Walking up straight inter-room staircase
    CMP #$12 : BEQ .show_and_reset_counters

    ; Walking down straight inter-room staircase
    CMP #$13 : BEQ .show_and_reset_counters

    ; Transition inter-room staircase
    CMP #$0E : BEQ .show_and_reset_counters

    JMP .end

  .end
    %a8()
    ; Persist new game mode/submode.
    LDA $10 : STA $80
    LDA $11 : STA $81

    ; }}}

  end_of_gamemode_hook:
    %ai8()
    JSL $0080B5 ; GameModes
    RTL

org $18AE19
nmi_hook:
    %a8()
    LDA $04CB : AND.b #$01 : BNE .skip

    %a16()
    INC $7C ; per-room counter
    INC $82 ; segment frames

    ; Check if frames == 60
    LDA $82 : CMP.w #60 : BNE .end

    ; If so, reset frames and +1 secs
    STZ $82 : INC $04E2

    ; Check if secs == 60
    LDA $04E2 : CMP.w #60 : BNE .end

    ; If so, reset secs and +1 mins.
    STZ $04E2 : INC $04E0

  .skip
    %a8()
    STZ $04CB
    %a16()

  .end
    RTL

; Hud template hook
hud_template_hook:
    STZ $04CC ; Makes sure to redraw hearts.
    JSL draw_counters
    SEP #$30
    INC $16
    RTL

; Counters
draw_counters:
    %a16()
    PHX

    ; Segment counter
    LDA $04E0 : LDX #!POS_RT_SEG : JSL hex_to_dec : JSL draw3_white
    LDA $04E2 : JSL hex_to_dec : JSL draw2_yellow
    LDA $82 : JSL hex_to_dec : JSL draw2_gray

    ; Real-time counter
    LDA $2BC : LDX #!POS_RT_ROOM : JSL draw_seconds_and_frames

    ; Lag counter
    LDA $2BC : SEC : SBC $2BE
    LDX #!POS_LAG : JSL hex_to_dec : JSL draw3_white

    ; Remove lil "-"
    LDA #$207F : STA $7EC734

    PLX
    RTL


draw_seconds_and_frames:
    STA $4204 : SEP #$20
    LDA #60 : STA $4206
    PHA : PLA : PHA : PLA : REP #$20
    LDA $4214 : STA $04D0 : LDA $4216 : STA $04D2
    LDA $04D0 : JSL hex_to_dec : JSL draw3_white
    LDA $04D2 : JSL hex_to_dec : JSL draw2_yellow
    RTL

draw_coordinates:
    ; x coordinate first
    TXA : JSL hex_to_dec : LDX $04D0
    LDA $2B4 : ORA #$3C90 : STA $7EC700,x
    LDA $2B6 : ORA #$3C90 : STA $7EC702,x
    LDA $2B8 : ORA #$3C90 : STA $7EC704,x
    TYA : JSL hex_to_dec : LDX $04D0
    LDA $2B4 : ORA #$3490 : STA $7EC706,x
    LDA $2B6 : ORA #$3490 : STA $7EC708,x
    LDA $2B8 : ORA #$3490 : STA $7EC70A,x
    RTL

draw3_white:
    ; Clear leading 0's
    LDA #$207F : STA $7EC700,x
    LDA #$207F : STA $7EC702,x

    LDA $2B4 : BEQ .check_second_digit
    ORA #$3C90 : STA $7EC700,x : JMP .draw_second_digit

  .check_second_digit
    LDA $2B6 : BEQ .draw_third_digit

  .draw_second_digit
    LDA $2B6 : ORA #$3C90 : STA $7EC702,x

  .draw_third_digit
    LDA $2B8 : ORA #$3C90 : STA $7EC704,x
    RTL


draw2_white:
    LDA $2B6 : ORA #$3C90 : STA $7EC700,x
    LDA $2B8 : ORA #$3C90 : STA $7EC702,x
    RTL

draw2_yellow:
    LDA $2B6 : ORA #$3490 : STA $7EC706,x
    LDA $2B8 : ORA #$3490 : STA $7EC708,x
    RTL

draw2_gray:
    LDA $2B6 : ORA #$2090 : STA $7EC70A,x
    LDA $2B8 : ORA #$2090 : STA $7EC70C,x
    RTL


hex_to_dec:
    STA $4204 : SEP #$20
    LDA #$64 : STA $4206
    PHA : PLA : PHA : PLA : REP #$20
    LDA $4214 : STA $2B2
    LDA $4216 : STA $4204 : SEP #$20
    LDA #$0A : STA $4206
    PHA : PLA : PHA : PLA : REP #$20
    LDA $4214 : STA $2B6
    LDA $4216 : STA $2B8
    LDA $2B2 : STA $4204 : SEP #$20
    LDA #$0A : STA $4206
    PHA : PLA : PHA : PLA : REP #$20
    LDA $4214 : STA $2B2
    LDA $4216 : STA $2B4
    RTL

draw_hearts_hook:
    %a8()
    LDA $7EF36D : CMP $04CC ; : BEQ enemy_hp
    STA $04CC

  draw_hearts:
    ; check if we have full hp
    LDA $7EF36C : CMP $7EF36D : BNE .not_full_hp

    %a16()
    LDA #$24A0
    JMP .draw_hearts

  .not_full_hp
    %a16()
    LDA #$24A1

  .draw_hearts
    ; Heart gfx
    STA !POS_MEM_HEART_GFX

    ; Full hearts
    LDA $7EF36D : AND.w #$FF : LSR : LSR : LSR : JSL hex_to_dec : LDX.w #!POS_HEARTS : JSL draw2_white

    ; Quarters
    LDA $7EF36D : AND.w #$7 : ORA #$3490 : STA $7EC704,x

    ; Container gfx
    LDA #$24A2 : STA !POS_MEM_CONTAINER_GFX

    ; Container
    LDA $7EF36C : AND #$00FF : LSR : LSR : LSR : JSL hex_to_dec : LDX.w #!POS_CONTAINERS : JSL draw2_white


  enemy_hp:
    ; Draw over Enemy Heart stuff in case theres no enemies
    LDA #$207F : STA !POS_MEM_ENEMY_HEART_GFX
    LDX.w #!POS_ENEMY_HEARTS : STA $7EC700,x : STA $7EC702,x

    LDX #$FFFF
  .loop
    INX : CPX.w #$10 : BEQ dhh_end
    LDA $0DD0,x : AND.w #$FF : CMP.w #9 : BNE .loop
    LDA $0E60,x : AND.w #$40 : BNE .loop
    LDA $0E50,x : AND.w #$FF : BEQ .loop : CMP.w #$FF : BEQ .loop

    ; Enemy HP should be in A.
    JSL hex_to_dec : LDX.w #!POS_ENEMY_HEARTS : JSL draw2_white

    ; Enemy Heart GFX
    LDA #$2CA0 : STA !POS_MEM_ENEMY_HEART_GFX

  dhh_end:
    %a16()
    RTL

print "gl"
