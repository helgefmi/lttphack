lorom

; TODO
; - Look into making a "musicless" version of the game (for pracstreams).
; - Tidy up draw_* code (make more general). Remember to check scanlines after.
; - Get full hearts w/controller input.
; - See if we can implement hex_to_dec more efficient.
; - Rewrite code to INC the tilemap indexes instead of counters? Would need more INC/CMP/BNE,
;   but could rid ourselves of hex_to_dec.
; - Track best room times (persist after loading savestate). Also make the snes push best room
;   times into the cloud using the users facebook account as authentication, so we can have
;   per-room leaderboards.
; - Slowdown/up, frame advance. (Should try to make counters run slower/stand still when paused too.)

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
;   * $04D6[0x2] -> QW check enabled?
;   * $04D8[0x2] -> QW check enabled, last frame
;   * $04DA[0x1] -> copy of $02D8
;   * $04E0[0x2] -> Segment minutes
;   * $04E2[0x2] -> Segment seconds

!POS_RT_ROOM = $36
!POS_LAG = $7A
!POS_RT_SEG = $B2

!POS_HEART_GFX = $7EC790
!POS_HEARTS = $92

!POS_CONTAINER_GFX = $7EC79A
!POS_CONTAINERS = $9C

!POS_ENEMY_HEART_GFX = $7EC7A2
!POS_ENEMY_HEARTS = $A4

!POS_INPUT_DISPLAY_TOP = $7EC728
!POS_INPUT_DISPLAY_BOT = $7EC768

macro a8()
    SEP #$20
endmacro

macro a16()
    REP #$20
endmacro

macro i8()
    SEP #$10
endmacro

macro i16()
    REP #$10
endmacro

macro ai8()
    SEP #$30
endmacro

macro ai16()
    REP #$30
endmacro

; SRAM size
org $00FFD8
    db $08 ; 256kb


; UpdateHearts hook
org $0DFDCB
    JSL draw_hearts_hook
    RTS

; UpdateHearts removal
;
; This is called twice (once for containers, once for actual hearts),
; and since we do them both at once, we only need one call.
;
; Overriding the following:
; CODE_0DFC06:  20 AB FD  JSR HandleHearts

org $0DFC26
    NOP : NOP : NOP

; Hook into subroutine that transfers hud tiles to vram
org $028068
    JSL load_tile_gfx_hook


; NMI hook hijack 1
org $008225
    JMP nmi_hook_jsl

; NMI hook hijack 2 (only used on maiden crystal sequence)
org $0082D2
    JMP nmi_hook_jsl


; Game mode hijack
org $008056
    JSL gamemode_hook


; FloorIndicator quick RTL
org $0AFD2C
    SEP #$30
    RTL

; FloorIndicator.noIndicator quick RTL
org $0AFDB0
    SEP #$30
    RTL

; HUD template hijack
;
; The following is overwritten
;
;CODE_0DFA8E:        E2 30         SEP #$30
;CODE_0DFA90:        E6 16         INC $16
org $0DFAAE
    JSL hud_template_hook ; 4 opcodes


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


    ; Update game time counter
    %a16()
    CLC : INC $7E


    ; Reset segment timer
    LDA $8E : CMP #$0030 : BNE +
    JSR draw_counters
    STZ $82 : STZ $04E0 : STZ $04E2


    ; Quick Warp checker
  + LDA.w #$00 : STA $04D6

    ; Are we outside?
    LDA $1B : AND.w #$FF : BNE +

    ; Is mirror the active item?
    LDA $0202 : AND.w #$FF : BEQ +
    CMP.w #$14 : BNE +

    ; Check L+R
    LDA $8E : AND #$3000 : CMP #$3000 : BNE +
    JSR check_qw

    +
    ; ACM Save State {{{

    %ai16()
    LDA $8E : CMP #$1060 : BEQ +
    JMP b

  + %a8()
    STZ $F0 : STZ $F2
    JSR ppuoff
    LDA #$80 : STA $4310
    JSR func_dma2

    LDA #$81 : STA $4310
    LDA #$39 : STA $4311
    JMP end

  b:
    CMP #$2060 : BEQ +
    JMP after_save_state

  + %a8()
    STZ $F0 : STZ $F2
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
    LDA #$A1 : STA $4200
    LDA #$0F : STA $13 : STA $2100
    %ai8()
    LDA #$01 : STA $04CB
    RTL

    ; }}}

  after_save_state:

    ; Transition detection {{{

    %ai8()
    LDA $10 : CMP $80 : BNE gamemode_changed
    LDA $11 : CMP $81 : BNE submode_changed
    LDA $02D8 : CMP $04DA : BNE new_item_received

    JMP end_of_gamemode_hook

  new_item_received:
    LDA $02D8 : STA $04DA

    JMP only_show_counters

  gamemode_changed:
    LDA $80

    CMP #$05 : BEQ gamemode_load_game
    CMP #$07 : BEQ gamemode_dungeon
    CMP #$09 : BEQ gamemode_overworld
    CMP #$0B : BEQ gamemode_overworld ; "Special" overworld (?)
    CMP #$13 : BEQ gamemode_victory ; LW?
    CMP #$16 : BEQ gamemode_victory ; DW?

    JMP end_of_transition_detection

  gamemode_victory:
    LDA $10

    ; Just killed a boss. Loading overworld.
    CMP #$08 : BEQ show_and_reset_counters

    JMP end_of_transition_detection

  gamemode_load_game:
    LDA $10

    ; Link in bed
    CMP #$07 : BEQ show_and_reset_counters

    JMP end_of_transition_detection

  gamemode_dungeon:
    LDA $10

    ; Text mode. Don't reset counters.
    CMP #$0E : BEQ only_show_counters

    ; Dungeon -> Overworld
    CMP #$0F : BEQ show_and_reset_counters

    ; Caught by Wall Master
    CMP #$11 : BEQ show_and_reset_counters

    JMP end_of_transition_detection

  gamemode_overworld:
    LDA $10

    ; OW (special) -> OW
    CMP #$09 : BEQ show_and_reset_counters

    ; OW -> OW (special)
    CMP #$0B : BEQ show_and_reset_counters

    ; Text mode. Don't reset counters.
    CMP #$0E : BEQ only_show_counters

    ; Overworld -> Dungeon
    CMP #$0F : BEQ show_and_reset_counters

    ; Fall in hole
    CMP #$11 : BEQ show_and_reset_counters

    JMP end_of_transition_detection

  submode_changed:
    LDA $10

    ; Dungeon
    CMP #$07 : BEQ submode_dungeon

    ; Overworld
    CMP #$09 : BEQ submode_overworld

    JMP end_of_transition_detection

  show_and_reset_counters:
    ; Reset per-room counters
    %a16()
    LDA $7C : STA $2BC : STZ $7C
    LDA $7E : STA $2BE : STZ $7E

    JSR draw_counters
    JMP end_of_transition_detection

  only_show_counters:
    %a16()
    LDA $7C : STA $2BC
    LDA $7E : STA $2BE

    JSR draw_counters
    JMP end_of_transition_detection

  submode_overworld:
    LDA $11

    ; Normal transition
    CMP #$01 : BEQ show_and_reset_counters

    ; Transition into Dark Woods
    CMP #$0D : BEQ show_and_reset_counters

    ; Mirror
    CMP #$23 : BEQ show_and_reset_counters

    ; Whirlpool
    CMP #$2E : BEQ show_and_reset_counters

    JMP end_of_transition_detection

  submode_dungeon:
    LDA $11

    ; Normal transition intra-room
    CMP #$01 : BEQ show_and_reset_counters

    ; Normal transition inter-room
    CMP #$02 : BEQ show_and_reset_counters

    ; Transition upwards
    CMP #$06 : BEQ show_and_reset_counters

    ; Transition upwards
    CMP #$07 : BEQ show_and_reset_counters

    ; Walking up straight inter-room staircase
    CMP #$12 : BEQ show_and_reset_counters

    ; Walking down straight inter-room staircase
    CMP #$13 : BEQ show_and_reset_counters

    ; Transition inter-room staircase
    CMP #$0E : BEQ show_and_reset_counters

    JMP end_of_transition_detection

  end_of_transition_detection:
    %a8()
    ; Persist new game mode/submode.
    LDA $10 : STA $80
    LDA $11 : STA $81

    ; }}}

  end_of_gamemode_hook:
    %ai8()
    JSL $0080B5 ; GameModes
    RTL


; Hud template hook
hud_template_hook:
    STZ $04CC ; Makes sure to redraw hearts.
    JSR draw_counters
    SEP #$30
    INC $16
    RTL


; Counters
draw_counters:
    %a16()
    PHX

    ; Segment counter
    LDA $04E0 : LDX #!POS_RT_SEG : JSR hex_to_dec : JSR draw3_white
    LDA $04E2 : JSR hex_to_dec : JSR draw2_yellow
    LDA $82 : JSR hex_to_dec : JSR draw2_gray

    ; RT counter
    LDA $2BC : LDX #!POS_RT_ROOM : JSR draw_seconds_and_frames

    ; Lag countere
    LDA $2BC : SEC : SBC $2BE
    LDX #!POS_LAG : JSR hex_to_dec : JSR draw3_white

    ; Erase lil "-"
    LDA #$207F : STA $7EC734

    PLX
    RTS


draw_seconds_and_frames:
    STA $4204 : SEP #$20
    LDA #$3C : STA $4206
    PHA : PLA : PHA : PLA : REP #$20
    LDA $4214 : STA $04D0 : LDA $4216 : STA $04D2
    LDA $04D0 : JSR hex_to_dec : JSR draw3_white
    LDA $04D2 : JSR hex_to_dec : JSR draw2_yellow
    RTS


draw3_white:
    LDA #$207F : STA $7EC700,x
    LDA #$207F : STA $7EC702,x

    LDA $2B4 : BEQ check_second_digit : ORA #$3C90 : STA $7EC700,x : JMP draw_second_digit

  check_second_digit:
    LDA $2B6 : BEQ draw_third_digit

  draw_second_digit:
    LDA $2B6 : ORA #$3C90 : STA $7EC702,x

  draw_third_digit:
    LDA $2B8 : ORA #$3C90 : STA $7EC704,x
    RTS


draw2_white:
    LDA $2B6 : ORA #$3C90 : STA $7EC700,x
    LDA $2B8 : ORA #$3C90 : STA $7EC702,x
    RTS

draw2_yellow:
    LDA $2B6 : ORA #$3490 : STA $7EC706,x
    LDA $2B8 : ORA #$3490 : STA $7EC708,x
    RTS

draw2_gray:
    LDA $2B6 : ORA #$2090 : STA $7EC70A,x
    LDA $2B8 : ORA #$2090 : STA $7EC70C,x
    RTS


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
    RTS


nmi_hook:
    %a8()
    LDA $04CB : AND.b #$01 : BNE .skip

    %a16()
    CLC : INC $7C ; per-room counter
    CLC : INC $82 ; segment counter

    ; Check if frames == 60
    LDA $82 : CMP.w #60 : BNE .end

    ; If so, reset frames and +1 secs
    STZ $82 : CLC : INC $04E2

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

draw_hearts_hook:
    %a8()
    LDA $7EF36D : CMP $04CC : BEQ qw_check
    STA $04CC

    %a16()

    ; Heart gfx
    LDA #$24A0 : STA !POS_HEART_GFX

    ; Full hearts
    LDA $7EF36D : AND.w #$FF : LSR : LSR : LSR : JSR hex_to_dec : LDX.w #!POS_HEARTS : JSR draw2_white

    ; Quarters
    LDA $7EF36D : AND.w #$7 : ORA.w #$3490 : STA $7EC704,x

    ; Container gfx
    LDA #$24A2 : STA !POS_CONTAINER_GFX

    ; Container
    LDA $7EF36C : AND.w #$00FF : LSR : LSR : LSR : JSR hex_to_dec : LDX.w #!POS_CONTAINERS : JSR draw2_white


  qw_check:
    %a16()
    ; Check if state changed at all, skip if not.
    LDA $04D6 : CMP $04D8 : BEQ enemy_check

    STA $04D8 : CMP.w #$01 : BEQ +

    LDA #$2C62 : STA $7EC74A
    LDA #$2C63 : STA $7EC74C
    LDA #$2C72 : STA $7EC78A
    LDA #$2C73 : STA $7EC78C

    JMP enemy_check

  + LDA #$2062 : STA $7EC74A
    LDA #$2063 : STA $7EC74C
    LDA #$2072 : STA $7EC78A
    LDA #$2073 : STA $7EC78C

  enemy_check:
    ; Draw over Enemy Heart stuff in case theres no enemies
    LDA #$207F : STA !POS_ENEMY_HEART_GFX
    LDX.w #!POS_ENEMY_HEARTS : STA $7EC700,x : STA $7EC702,x

    LDX.w #$FFFF
  emy_loop:
    INX : CPX.w #$10 : BEQ ctrl_start
    LDA.w $0DD0,x : AND.w #$FF : CMP.w #9 : BNE emy_loop
    LDA.w $0E60,x : AND.w #$40 : BNE emy_loop
    LDA.w $0E50,x : AND.w #$FF : BEQ emy_loop : CMP.w #$FF : BEQ emy_loop

  emy_found:
    ; Enemy HP should be in A.
    JSR hex_to_dec : LDX.w #!POS_ENEMY_HEARTS : JSR draw2_white

    ; Enemy Heart GFX
    LDA #$2CA0 : STA !POS_ENEMY_HEART_GFX

  ; Shamelessly stolen from Total's SM hack.
  ctrl_start:
    LDA $8E : CMP $04D4 : BEQ dhh_end

    STA $04D4

    TAY
    LDX #$0000

-   TYA : AND ctrl_top_bit_table, X : BEQ +
    LDA ctrl_top_gfx_table, X
    JMP ++
+   LDA #$207F
++  STA !POS_INPUT_DISPLAY_TOP, X
    INX : INX : CPX #$00C : BNE -

    LDX #$0000

-   TYA : AND ctrl_bot_bit_table, X : BEQ +
    LDA ctrl_bot_gfx_table, X
    JMP ++
+   LDA #$207F
++  STA !POS_INPUT_DISPLAY_BOT, X
    INX : INX : CPX #$00C : BNE -

  dhh_end:
    RTL

check_qw:
    ; If last three bits are 111 or 110, we can quickwarp from here.
    LDA $00E2 : AND.w #$7
    CMP.w #$7 : BEQ +
    CMP.w #$6 : BEQ +

    JMP ++

  + LDA.w #$01 : STA $04D6

 ++ RTS

org $1CFD8E
load_tile_gfx_hook:
    JSL $00E310

    PHB : PHK : PLB

    %a16()
    ; dest address. #$7000 = $E000 in VRAM. (multiply by 2)
    LDA.w #$7000 : STA $2116

    LDX.b #00
    LDY.b #12 ; number of tiles

  ltg_loop:
    ; loop
    LDA.w hud_table,x : STA.w $2118 : INX : INX
    LDA.w hud_table,x : STA.w $2118 : INX : INX
    LDA.w hud_table,x : STA.w $2118 : INX : INX
    LDA.w hud_table,x : STA.w $2118 : INX : INX
    LDA.w hud_table,x : STA.w $2118 : INX : INX
    LDA.w hud_table,x : STA.w $2118 : INX : INX
    LDA.w hud_table,x : STA.w $2118 : INX : INX
    LDA.w hud_table,x : STA.w $2118 : INX : INX
    DEY : BEQ ltg_end
    JMP ltg_loop

  ltg_end:
    PLB

    RTL

hud_table:
    DW #$0000,#$1800,#$3C00,#$6600,#$7E00,#$6600,#$6600,#$0000
    DW #$0000,#$7C00,#$6600,#$7C00,#$6600,#$6600,#$7C00,#$0000
    DW #$0000,#$6600,#$3C00,#$1800,#$1800,#$3C00,#$6600,#$0000
    DW #$0000,#$6600,#$6600,#$3C00,#$1800,#$1800,#$1800,#$0000
    DW #$0000,#$6000,#$6000,#$6000,#$6000,#$7E00,#$7E00,#$0000
    DW #$0000,#$7C00,#$6600,#$6600,#$7C00,#$6C00,#$6600,#$0000
    DW #$1000,#$3800,#$7C00,#$FE00,#$3800,#$3800,#$3800,#$0000
    DW #$3800,#$3800,#$3800,#$FE00,#$7C00,#$3800,#$1000,#$0000
    DW #$0800,#$0C00,#$7E00,#$7F00,#$7E00,#$0C00,#$0800,#$0000
    DW #$1000,#$3000,#$7E00,#$FE00,#$7E00,#$3000,#$1000,#$0000
    DW #$0000,#$0000,#$E800,#$8800,#$E800,#$2800,#$EE00,#$0000
    DW #$0000,#$0000,#$EE00,#$8400,#$E400,#$2400,#$E400,#$0000

; L, u, R, Y, X, SL
ctrl_top_bit_table:
    DW #$2000,#$0008,#$1000,#$0040,#$4000,#$0020
ctrl_top_gfx_table:
    DW #$2404,#$2406,#$2405,#$2403,#$2402,#$240A

; l, d, r, B, A, ST
ctrl_bot_bit_table:
    DW #$0002,#$0004,#$0001,#$0080,#$8000,#$0010
ctrl_bot_gfx_table:
    DW #$2409,#$2407,#$2408,#$2401,#$2400,#$240B
