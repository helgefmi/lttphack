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

; Notes
; Check for ctrl2 hack: 0CDB7E | CODE_0CDC1C
; Bage main routine: 03EA1D | CODE_04EA9D
; 7E045A03 -> always lit rooms

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
;   * $04E4[0x1] -> Toggle x/y indicator
;   * $04E5[0x1] -> Toggle x/y indicator (last frame)

!POS_RT_ROOM = $36
!POS_LAG = $7A
!POS_RT_SEG = $B2
!POS_XY = $F4

!POS_MEM_HEART_GFX = $7EC790
!POS_HEARTS = $92

!POS_MEM_CONTAINER_GFX = $7EC79A
!POS_CONTAINERS = $9C

!POS_MEM_ENEMY_HEART_GFX = $7EC7A2
!POS_ENEMY_HEARTS = $A4

!POS_MEM_INPUT_DISPLAY_TOP = $7EC728
!POS_MEM_INPUT_DISPLAY_BOT = $7EC768

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


; Enable frame advance/skip
;
; Overrides the following
;$008039: 80 16  BRA $008051
org $008039
    NOP : NOP

; Overrides the following
; $00803B: A5 F6  LDA $F6
; $00803D: 29 20  AND #$20
org $00803B
    LDA $F5 : AND.b #$40

; Overrides the following
; $008044: A5 F6  LDA $F6
; $008046: 29 10  AND #$10
org $008044
    LDA $F7 : AND.b #$80


; Enable controller 2 CLR
; Overrides the following:
; $0083F8: 60  RTS
org $0083F8
    NOP


; Make it so saving on third filename slot gives you
; full equipment.
;
; NOP's out some code since originally, there were more
; requirements for this feature to happen.
org $0CDB79
    CPX #$0A00 ; Checks if the player saved in third space.
    ; There's a BNE I didn't wanna touch here.
org $0CDB7E
    NOP : NOP : NOP : NOP   ; AF F8 83 00   LDA.l $0083F8
    NOP : NOP : NOP         ; 29 FF 00      AND #$00FF
    NOP : NOP : NOP         ; C9 60 00      CMP #$0060
    NOP : NOP               ; F0 21         BEQ $0CDC49
    NOP : NOP : NOP : NOP   ; AF D9 03 70   LDA $7003D9
    NOP : NOP : NOP         ; C9 01 00      CMP #$0001
    NOP : NOP               ; D0 18         BNE $0CDC49


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
; $0DFC06:  20 AB FD  JSR HandleHearts

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
; Overrides the following
; $0DFA8E: E2 30  SEP #$30
; $0DFA90: E6 16  INC $16
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

    ; ACM Save State {{{

    %ai16()
    LDA $8E : CMP #$1060 : BEQ +
    JMP b

  + %a8()
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

  + JMP end

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

  .update_gt_counter
    %a16()
    INC $7E

  .input_reset_seg
    LDA $8E : CMP #$0030 : BNE .input_qw
    STZ $82 : STZ $04E0 : STZ $04E2

  .input_qw
    LDA.w #$00 : STA $04D6

    ; Check L+R
    LDA $8E : AND #$3000 : CMP #$3000 : BNE .input_inc_sword

    ; Are we outside?
    LDA $1B : AND.w #$FF : BNE .input_inc_sword

    ; Is mirror the active item?
    LDA $0202 : AND.w #$FF : BEQ .input_inc_sword
    CMP.w #$14 : BNE .input_inc_sword

    ; If last three bits are 111 or 110, we can quickwarp from here.
    LDA $00E2 : AND.w #$6 : CMP.w #$6 : BNE .input_inc_sword

    LDA.w #$01 : STA $04D6

  .input_inc_sword
    %a8()
    LDA $F5 : CMP.b #$02 : BNE .input_inc_armor

    LDA $7EF359 : INC A : CMP.b #$05 : BNE +

    LDA.b #$01

  + STA $7EF359

  .input_inc_armor
    LDA $F5 : CMP.b #$01 : BNE .input_inc_shield

    LDA $7EF35B : INC A : CMP.b #$03 : BNE +

    LDA.b #$00

  + STA $7EF35B

  .input_inc_shield
    LDA $F5 : CMP.b #$08 : BNE .input_restore

    LDA $7EF35A : INC A : CMP.b #$04 : BNE +

    LDA.b #$01

  + STA $7EF35A

  .input_restore
    LDA $F5 : CMP.b #$10 : BNE .input_toggle_xy

    ; 1/2 magic
    LDA.b #$01 : STA $7EF37B

    ; refill hearts, magic, bombs, and arrows
    LDA.b #$FF : STA $7EF372 : STA $7EF373 : STA $7EF375 : STA $7EF376

    ; 999 rupees
    LDA.b #$E7 : STA $7EF360
    LDA.b #$03 : STA $7EF361

    ; give the player 9 keys
    LDA.b #9 : STA $7EF36F

  .input_toggle_xy
    LDA $F7 : CMP.b #$40 : BNE .transition_detection

    LDA $04E4 : EOR.b #$1 : STA $04E4

  .transition_detection
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

    JSL draw_counters
    JMP end_of_transition_detection

  only_show_counters:
    %a16()
    LDA $7C : STA $2BC
    LDA $7E : STA $2BE

    JSL draw_counters
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


draw_hearts_hook:
    %a8()
    LDA $7EF36D : CMP $04CC : BEQ .qw_indicator
    STA $04CC

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


  .qw_indicator
    %a16()
    ; Check if state changed at all, skip if not.
    LDA $04D6 : CMP $04D8 : BEQ enemy_hp

    STA $04D8 : CMP.w #$01 : BEQ +

    LDA #$2C62 : STA $7EC74A
    LDA #$2C63 : STA $7EC74C
    LDA #$2C72 : STA $7EC78A
    LDA #$2C73 : STA $7EC78C

    JMP enemy_hp

  + LDA #$2062 : STA $7EC74A
    LDA #$2063 : STA $7EC74C
    LDA #$2072 : STA $7EC78A
    LDA #$2073 : STA $7EC78C

  enemy_hp:
    ; Draw over Enemy Heart stuff in case theres no enemies
    LDA #$207F : STA !POS_MEM_ENEMY_HEART_GFX
    LDX.w #!POS_ENEMY_HEARTS : STA $7EC700,x : STA $7EC702,x

    LDX #$FFFF
  .loop
    INX : CPX.w #$10 : BEQ input_display
    LDA $0DD0,x : AND.w #$FF : CMP.w #9 : BNE .loop
    LDA $0E60,x : AND.w #$40 : BNE .loop
    LDA $0E50,x : AND.w #$FF : BEQ .loop : CMP.w #$FF : BEQ .loop

    ; Enemy HP should be in A.
    JSL hex_to_dec : LDX.w #!POS_ENEMY_HEARTS : JSL draw2_white

    ; Enemy Heart GFX
    LDA #$2CA0 : STA !POS_MEM_ENEMY_HEART_GFX

  ; Shamelessly stolen from Total's SM hack.
  input_display:
    LDA $8E : CMP $04D4 : BEQ xy_display

    STA $04D4

    TAY
    LDX #$0000

-   TYA : AND ctrl_top_bit_table, X : BEQ +
    LDA ctrl_top_gfx_table, X
    JMP ++
+   LDA #$207F
++  STA !POS_MEM_INPUT_DISPLAY_TOP, X
    INX : INX : CPX #$00C : BNE -

    LDX #$0000

-   TYA : AND ctrl_bot_bit_table, X : BEQ +
    LDA ctrl_bot_gfx_table, X
    JMP ++
+   LDA #$207F
++  STA !POS_MEM_INPUT_DISPLAY_BOT, X
    INX : INX : CPX #$00C : BNE -

  xy_display:
    %a8()
    LDA $04E4 : CMP $04E5 : BEQ .no_change
    LDA $04E4 : STA $04E5
    LDA $04E4 : BNE .show
    JMP .hide

  .no_change
    LDA $04E4 : BNE .show
    JMP dhh_end

  .hide
    %a16()
    DEC $04E6
    LDA #$207F : LDX.w #!POS_XY
    STA $7EC700,x : STA $7EC702,x : STA $7EC704,x
    STA $7EC706,x : STA $7EC708,x : STA $7EC70A,x
    JMP dhh_end

  .show
    %a16()
    LDA $22 : TAX
    LDA $20 : TAY
    LDA.w #!POS_XY : STA $04D0
    JSL draw_coordinates

  dhh_end:
    %a16()
    RTL

print "1bb1e0 section ends at ", pc, ". Max is 1bb800"

org $0FF4F0
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

print "ff4f0 section ends at ", pc, ". Max is ff780"

org $1CFD8E
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

load_tile_gfx_hook:
    JSL $00E310

    PHB : PHK : PLB

    %a16()
    ; dest address. #$7000 = $E000 in VRAM. (multiply by 2)
    LDA #$7000 : STA $2116

    LDX.b #00
    LDY.b #12 ; number of tiles

  ltg_loop:
    ; loop
    LDA hud_table,x : STA $2118 : INX : INX
    LDA hud_table,x : STA $2118 : INX : INX
    LDA hud_table,x : STA $2118 : INX : INX
    LDA hud_table,x : STA $2118 : INX : INX
    LDA hud_table,x : STA $2118 : INX : INX
    LDA hud_table,x : STA $2118 : INX : INX
    LDA hud_table,x : STA $2118 : INX : INX
    LDA hud_table,x : STA $2118 : INX : INX
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

print "1cfd8e section ends at ", pc, ". Max is 1d0000"
